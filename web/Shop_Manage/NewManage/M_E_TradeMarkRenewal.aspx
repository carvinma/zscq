<%@ Page Language="C#" AutoEventWireup="true" CodeFile="M_E_TradeMarkRenewal.aspx.cs" ValidateRequest="false"
    Inherits="M_E_TradeMarkRenewal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../js/jtrademark.js" type="text/javascript"></script>
    <script src="../../js/j.suggest.js" type="text/javascript"></script>
    <script src="../../js/swfobject.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/trademark.css" />
    <script src="../../js/tooltips.js" type="text/javascript"></script>
    <script src="../../jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../../js/js.js" type="text/javascript"></script>
    <script src="../../js/jquery.uploadify.min.js" type="text/javascript"></script>
    <link href="../../jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
    <link href="../../css/trademark.css" rel="stylesheet" type="text/css" />
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/vcom.js"></script>
    <script type="text/javascript">
        function M_addmarkRenewalCheck_data() {
            var obj = $('input:radio[name="person"]:checked').val();
            if (obj == "" || obj == null) {
                alert("请选择注册人类别");
                return false;
            }
            if (!$(".appusertype").is(":hidden")) { //当注册人为自然人时，需要上传
                if (!check_ApplyUser("cardno_div")) {
                    return false;
                }
                if ($("#hiUpCardNo").val() == "") {
                    alert("请上传身份证扫描件");
                    return false;
                }
            }
            if ($("#upRegisteCertificate").val() == "") {
                alert("请上传商标注册证书");
                return false;
            }

            if (check_ApplyUser("name_div", 1) && check_ApplyUser("address_div", 1)
    && check_ApplyUser("ContactPerson_div", 1) && check_ApplyUser("phone_div", 1)
    && check_ApplyUser("postcode_div", 1) && check_ApplyUser("sortarr_div", 1)
    && check_ApplyUser("regno_div", 1) && check_ApplyUser("regdate_div", 1))
                return true;
            return false;
        }

        $(document).ready(function () {
            $('.ui-tabs-nav > li > a').click(function (e) { //Tab切换
                if (e.target == this) {
                    var tabs = $(this).parent().parent().children('li');
                    var panels = $(this).parent().parent().parent().children('.ui-tabs-panel');
                    var index = $.inArray(this, $(this).parent().parent().find('a'));
                    if (panels.eq(index)[0]) {
                        tabs.removeClass('ui-tabs-selected').eq(index).addClass('ui-tabs-selected');
                        panels.addClass('ui-tabs-hide').eq(index).removeClass('ui-tabs-hide');
                    }
                    if (index == 2) {
                        var ifpanel = panels.eq(index);
                        if (ifpanel.attr('url') != undefined && ifpanel.find('frame').length == 0) {
                            ifpanel.html('<iframe src="' + ifpanel.attr('url') + '" scrolling="no" frameborder="0" width="100%" onload="IFrameReSize(this);"></iframe>');
                            ifpanel.removeAttr('src');
                        }
                    }
                }
            });
        });
    </script>
    <script type="text/javascript">
        var tmptoCity, tmptoCityCode;
        $(function () {
            var userid = $('#Hi_MemberId').val();
            var trademarkid = getUrlParam('id');
            if (trademarkid > 0) //编辑
            {
                if ($("#RdoPeople").is(':checked')) {
                    $(".appusertype").show();
                    GetApplysDDL(userid, "1")
                }
                else
                    GetApplysDDL(userid, "0");

                var porviceid = $("#Hi_prov").val();
                var cityid = $("#Hi_city").val();
                var areaid = $("#Hi_country").val();
                EditProCityArea(porviceid, cityid, areaid);
                editgoods();
            }
            else { //增加
                InitProCityArea();
                if (userid > 0) {
                    GetApplysDDL(userid, "0"); //初始化企业单位申请人
                }
            }

            $("#txt_applyname").focus(function () {
                tmptoCity = $("#txt_applyname").val();
                $("#txt_applyname").val('');
                tmptoCityCode = $('#applyname_3word').val();
                $('#txt_applyname').val('');
            });
            $("#txt_applyname").blur(function () {
                if ($("#txt_applyname").val() == '') {
                    $("#txt_applyname").val(tmptoCity);
                }
                if ($('#applyname_3word').val() == '') {
                    $('#applyname_3word').val(tmptoCityCode);
                }
            });
            $("#txt_applyname").keypress(function () {
                if (window.event.keyCode == 13) {
                    event.returnValue = false;
                    event.cancel = true;
                }
            });

            $('input[type=radio][name="person"]').change(function () {
                var applyType = $('input:radio[name="person"]:checked').val();
                //var userid = $('#Hi_MemberId').val();
                if (userid > 0) {
                    GetApplysDDL(userid, applyType);
                }
                if (applyType == "1") { //当申请人为自然人时，显示身份证信息
                    $(".appusertype").show();
                }
                else {
                    $(".appusertype").hide();
                }
            });


            $("#chkSound").click(function () {
                var state = $(this).is(':checked');
                if (state == false) {
                    $("#soundfiles").hide();
                } else {
                    $("#soundfiles").show();
                }
            });

            $("#upCardNoPdf").uploadify({
                'swf': '../../js/SWF/uploadify.swf',
                'uploader': '../../Handler.ashx?flag=uploadimage',
                //'buttonImg': "images/aboutus1s.gif",
                'buttionClass': '',
                'buttonText': '浏览文件',
                'queueID': 'fileQueue',
                'width': '80',
                'height': '22',
                'overrideEvents': ['onDialogClose'],
                'fileTypeDesc': '选择文件(*pdf)',
                'fileTypeExts': '*.pdf',
                'auto': true,
                'multi': false,
                'fileSizeLimit': '1MB',
                'queueSizeLimit': 1,
                'onUploadSuccess': function (file, data, response) {
                    $.jBox.closeTip();
                    $("#aCardNoPdf").show();
                    $("#hiUpCardNo").val(data);
                },
                'onSelect': function (file) {
                    $.jBox.tip("正在上传文件，请稍后...", 'loading');
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#upCardNoPdf').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#upCardNoPdf').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                }
            });

            $("#upBusinessLicense").uploadify({
                'swf': '../../js/SWF/uploadify.swf',
                'uploader': '../../Handler.ashx?flag=uploadimage',
                //'buttonImg': "images/aboutus1s.gif",
                'buttionClass': '',
                'buttonText': '浏览文件',
                'queueID': 'fileQueue',
                'width': '80',
                'height': '22',
                'overrideEvents': ['onDialogClose'],
                'fileTypeDesc': '选择文件(*pdf)',
                'fileTypeExts': '*.pdf',
                'auto': true,
                'multi': false,
                'fileSizeLimit': '2MB',
                'queueSizeLimit': 1,
                'onUploadSuccess': function (file, data, response) {
                    $.jBox.closeTip();
                    $("#aBusinessLicense").show();
                    $("#upBusinessLinces").val(data);
                },
                'onSelect': function (file) {
                    $.jBox.tip("正在上传文件，请稍后...", 'loading');
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#upBusinessLicense').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#upBusinessLicense').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                }
            });

            $("#upWav").uploadify({
                'swf': '../../js/SWF/uploadify.swf',
                'uploader': '../../Handler.ashx?flag=uploadimage',
                //'buttonImg': "images/aboutus1s.gif",
                'buttionClass': '',
                'buttonText': '选择文件',
                'queueID': 'fileQueue',
                'width': '80',
                'height': '32',
                'overrideEvents': ['onDialogClose'],
                'fileTypeDesc': '选择文件(*.mp3 *.wav)',
                'fileTypeExts': '*.mp3;*.wav',
                'auto': true,
                'multi': false,
                'fileSizeLimit': '5MB',
                'queueSizeLimit': 1,
                'onUploadSuccess': function (file, data, response) {
                    $.jBox.closeTip();
                    $("#upSound").val(data);
                },
                'onSelect': function (file) {
                    $.jBox.tip("正在上传文件，请稍后...", 'loading');
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#upWav').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#upWav').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                }
            });

            $("#addpicture").uploadify({
                'swf': '../../js/SWF/uploadify.swf',
                'uploader': '../../Handler.ashx?flag=uploadimage',
                //'buttonImg': "images/aboutus1s.gif",
                'buttionClass': '',
                'buttonText': '选择图片',
                'queueID': 'fileQueue',
                'width': '80',
                'height': '32',
                'overrideEvents': ['onDialogClose'],
                'fileTypeDesc': '选择图片(*.gif;*.jpg;*.png)',
                'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
                'auto': true,
                'multi': false,
                'fileSizeLimit': '500KB',
                'queueSizeLimit': 1,
                'onUploadSuccess': function (file, data, response) {
                    $.jBox.closeTip();
                    $('#Image1').attr('src', '../../UploadTemp/' + data);
                    $("#upPattern1").val(data);
                },
                'onSelect': function (file) {
                    $.jBox.tip("正在上传图片，请稍后...", 'loading');
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#addpicture').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#addpicture').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                }
            });

            $("#addpicture2").uploadify({
                'swf': '../../js/SWF/uploadify.swf',
                'uploader': '../../Handler.ashx?flag=uploadimage',
                //'buttonImg': "images/aboutus1s.gif",
                'buttionClass': '',
                'buttonText': '选择图片',
                'queueID': 'fileQueue',
                'width': '80',
                'height': '32',
                'overrideEvents': ['onDialogClose'],
                'fileTypeDesc': '选择图片',
                'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
                'auto': true,
                'multi': false,
                'fileSizeLimit': '500KB',
                'queueSizeLimit': 1,
                'onUploadSuccess': function (file, data, response) {
                    $.jBox.closeTip();
                    $('#Image2').attr('src', '../../UploadTemp/' + data);
                    $("#upPattern2").val(data);
                },
                'onSelect': function (file) {
                    $.jBox.tip("正在上传图片，请稍后...", 'loading');
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#addpicture2').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#addpicture2').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                }
            });
        });
    </script>
    <style type="text/css">
        .alertfont
        {
            border: solid 1px #fe8686;
            padding: 1px;
            background: #dfeef5;
            color: #fe4343;
        }
        .alertfont img
        {
            margin-bottom: -3px;
        }
    </style>
    <style type="text/css">
        .colordiv
        {
            border: solid 1px #8dcff4;
            width: 16px;
            height: 16px;
            padding: 1px;
            float: left;
            margin-right: 5px;
            cursor: pointer;
        }
        .colordiv:hover
        {
            border: solid 1px #e8641b;
        }
        .colordiv img
        {
            width: 16px;
            height: 16px;
        }
        .colordivselect
        {
            padding: 1px;
            float: left;
            margin-right: 5px;
            cursor: pointer;
            width: 32px;
            height: 32px;
            border: solid 1px #e8641b;
        }
        .colordivselect img
        {
            width: 32px;
            height: 32px;
        }
        
        *
        {
            margin: 0; /* [disabled]padding:0; */
            font-size: 12px;
            list-style: none;
            color: #585858;
        }
    </style>
    <style type="text/css">
        .checkprodiv
        {
            position: fixed;
            _position: absolute;
            top: 40px;
            height: 600px;
            width: 100%;
            z-index: 1000;
        }
        .inputs110text
        {
            width: 110px;
            height: 18px;
            line-height: 18px;
        }
        .inputs110text:hover
        {
            width: 110px;
            height: 18px;
            line-height: 18px;
            border: solid 2px #eb10a3d;
        }
        
        
        .suojudiv
        {
            width: 210px;
            float: left;
            padding: 5px;
            border: solid 1px #ffffff;
        }
        .suojudiv:hover
        {
            border: solid 1px #aaaaaa;
        }
        .suojudiv div
        {
            float: left;
            margin-left: 5px;
        }
        .suojudiv div.name
        {
            width: 110px;
            height: 45px;
            overflow: hidden;
        }
        #msg_win
        {
            background: #EAEAEA;
            width: 450px;
            position: absolute;
            right: 0;
            font-size: 12px;
            font-family: Arial;
            margin: 0px;
            display: none;
            overflow: hidden;
            z-index: 99;
        }
        #msg_win .icos
        {
            position: absolute;
            top: 2px;
            top: 0px;
            right: 2px;
            z-index: 9;
        }
        .icos a
        {
            float: left;
            color: #833B02;
            margin: 1px;
            text-align: center;
            font-weight: bold;
            width: 14px;
            height: 22px;
            line-height: 22px;
            padding: 1px;
            text-decoration: none;
            font-family: webdings;
        }
        .icos a:hover
        {
            color: #fff;
        }
        #msg_title
        {
            background: #D10003;
            border-bottom: 1px solid #A67901;
            border-top: 1px solid #FFF;
            border-left: 1px solid #FFF;
            color: #000;
            height: 25px;
            line-height: 25px;
            text-indent: 5px;
        }
        #msg_content
        {
            margin: 5px;
            margin-right: 0;
            width: 440px;
            height: auto;
            overflow: hidden;
            border: 1px solid #A67901;
        }
    </style>
    <script type="text/javascript">
        function IsDigit() {
            return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
        }

        function IsDigit1() {
            return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46 || ((event.keyCode >= 65) && (event.keyCode <= 90)));
        }      
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input id="hi_money" type="hidden" runat="server" value="0" />
    <input type="hidden" id="hi_RegNoticeDate" runat="server" value="0" />
     <input type="hidden" id="hi_RenewalDate" runat="server" value="0" />
    <input type="hidden" id="hi_TradeMarkId" runat="server" value="0" />
    <input type="hidden" id="hd_userId" runat="server" value="0" />
    <input type="hidden" id="hi_n_a" runat="server" value="" />
    <input type="hidden" id="Hi_MemberId" runat="server" value="" />
    <input id="hi_usertype" type="hidden" runat="server" />
    <input id="hi_zhitifiles" type="hidden" runat="server" />
    <input id="hi_sbid" type="hidden" runat="server" value="0" />
    <input id="hi_MainFees" type="hidden" runat="server" value="0" />
    <input id="hi_ItemNum" type="hidden" runat="server" value="0" />
    <input id="hi_ExceedFees" type="hidden" runat="server" value="0" />
    <input type="hidden" runat="server" id="hiUpCardNo" value="" />
    <input type="hidden" runat="server" id="upBusinessLinces" value="" />
    <input type="hidden" runat="server" id="upSound" />
    <input type="hidden" runat="server" id="upPattern1" />
    <input type="hidden" runat="server" id="upPattern2" />
    <input type="hidden" runat="server" id="HI_ATT" value="" />
    <h1>
        <span class="action-span"><a href="L_M_Trademark.aspx?<%=returnurl %>">申请列表</a></span>
        <span class="action-span1"><a href="../Shop_Index_Main.aspx">管理中心</a> </span><span
            id="search_id" class="action-span1">-
            <%=PageType%></span>
        <div style="clear: both">
        </div>
    </h1>
    <div class="infoMain">
        <ul class="ui-tabs-nav clearfix">
            <li class="ui-tabs-selected"><a href="javascript:;">商标信息</a></li>
            <li><a href="javascript:;">商标状态</a></li>
            <li><a href="javascript:;">HQHT留言</a></li>
        </ul>
        <div class="ui-tabs-panel">
            <div class="list-div" id="Div2">
                <table cellspacing='1' cellpadding='3'>
                    <tr>
                        <th colspan="2">
                            <%=PageType%>申请人信息
                        </th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="689" cellspacing="1" cellpadding="3">
                                <tr>
                                    <td align="right">
                                        <strong>申请人类别</strong>：
                                    </td>
                                    <td align="left">
                                        <input id="RdoPeople" type="radio" name="person" value="1" runat="server" /><span>自然人</span>
                                        <input id="RdoCorp" type="radio" name="person" value="0" runat="server" checked="true" /><span>企业单位</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong>申请人名称：</strong>
                                    </td>
                                    <td align="left">
                                        <input runat="server" id="txt_applyname" type="text" onblur="check_ApplyUser('name_div')"
                                            name="" value="" placeholder="" class="font12000" maxlength="50" clientidmode="Static"
                                            autocomplete="off" />
                                        <span style="color: Red;">*</span> <span class="status error" id="name_div_error">
                                        </span>
                                        <input type="hidden" name="applyname_3word" runat="server" clientidmode="Static"
                                            id="applyname_3word" value="CAN" /><br />
                                        <div id="suggest" class="ac_results" style="width: 173px;">
                                        </div>
                                    </td>
                                </tr>
                                <tr style="display: none" class="appusertype">
                                    <td height="32" align="right">
                                        <strong>身份证件名称：</strong>
                                    </td>
                                    <td align="left">
                                        <select id="Select1" name="live_prov" onchange="">
                                            <option value="0">身份证：</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr style="display: none" class="appusertype">
                                    <td height="32" align="right">
                                        <strong>身分证件号码：</strong>
                                    </td>
                                    <td align="left">
                                        <input class="font12000" onblur="check_ApplyUser('cardno_div')" runat="server" style="ime-mode: disabled;"
                                            id="txt_applyCardNo" maxlength="20" type="text" name="" value="" />
                                        <span style="color: Red;">*</span> <span class="status error" id="cardno_div_error">
                                        </span>
                                    </td>
                                </tr>
                                <tr style="display: none" class="appusertype">
                                    <td align="right">
                                        <strong>身份证件扫描件：</strong>
                                    </td>
                                    <td align="left">
                                        <table>
                                            <tr>
                                                <td width="180px">
                                                    <div id="upCardNoPdf">
                                                    </div>
                                                </td>
                                                <td>
                                                    <span id="aCardNoPdf" runat="server" visible="false">身份证件扫已上传</span>
                                                </td>
                                            </tr>
                                        </table>
                                        <div>
                                            <span style="color: Red;">本人签字后彩色扫描上传，格式为pdf，大小不超过1M</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong><span>营业执照副本（中文）</span>：</strong>
                                    </td>
                                    <td align="left">
                                        <table>
                                            <tr>
                                                <td width="180px">
                                                    <div id="upBusinessLicense">
                                                    </div>
                                                </td>
                                                <td>
                                                    <span id="aBusinessLicense" runat="server" visible="false">营业执照副本已上传</span>
                                                </td>
                                            </tr>
                                        </table>
                                        <div>
                                            <span style="color: Red;">请将营业执照副本盖公章后扫描为彩色上传，格式为pdf，大小不超过2M</span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong>申请人行政区划：</strong>
                                    </td>
                                    <td align="left">
                                        <select id="live_prov" name="live_prov" onchange="SelCity(this.value);">
                                            <option value="">请选择：</option>
                                        </select>
                                        <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                                            <option value="">请选择：</option>
                                        </select>
                                        <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                                            <option value="">请选择：</option>
                                        </select>
                                        <span style="color: Red;">*</span> <span class="status error" id="Span1"></span>
                                        <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static" />
                                        <input type="hidden" runat="server" id="Hi_city" clientidmode="Static" />
                                        <input type="hidden" runat="server" id="Hi_country" clientidmode="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong>申请人地址：</strong>
                                    </td>
                                    <td align="left">
                                        <span class="fl selected-address" id="areaNameTxt"></span>
                                        <input class="font12000" onblur="check_ApplyUser('address_div')" runat="server" id="txt_address"
                                            maxlength="50" type="text" name="" value="" />
                                        <span style="color: Red;">*</span> <span class="status error" id="address_div_error">
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong>联系人：</strong>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="s6" id="txt_ContactPerson" onblur="check_ApplyUser('ContactPerson_div')"
                                            class="font12000 tooltip" maxlength="50" runat="server" />
                                        <span style="color: Red;">*</span> <span class="status error" id="ContactPerson_div_error">
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong>联系电话：</strong>
                                    </td>
                                    <td align="left">
                                        <input runat="server" id="txt_phone" onblur="check_ApplyUser('phone_div')" class="font12000"
                                            type="text" name="" value="" placeholder="" maxlength="20" />
                                        <span style="color: Red;">*</span> <span class="status error" id="phone_div_error">
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="right">
                                        <strong>传真（含地区号）：</strong>
                                    </td>
                                    <td align="left">
                                        <input runat="server" id="txt_fax" onblur="check_ApplyUser('fax_div')" class="font12000"
                                            type="text" name="" value="" placeholder="" maxlength="20" />
                                        <span class="status error" id="fax_div_error"></span>
                                    </td>
                                </tr>
                                <tr id="sbmiaoshu">
                                    <td height="32" align="right">
                                        <strong>邮政编码：</strong>
                                    </td>
                                    <td align="left" style="text-li: left;">
                                        <input class="font12000" onblur="check_ApplyUser('postcode_div')" runat="server"
                                            onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" id="txt_postcode"
                                            maxlength="6" type="text" name="" value="" placeholder="" />
                                        <span style="color: Red;">*</span> <span class="status error" id="postcode_div_error">
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                <tr>
                                    <th>
                                        商标信息
                                    </th>
                                </tr>
                                <tr>
                                    <td height="115" align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong><span>我公司案件号</span></strong>：
                                                </td>
                                                <td>
                                                    &nbsp;<asp:Label ID="lblCaseNo" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td width="429">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>申请号</strong>：
                                                </td>
                                                <td>
                                                    <input class="font12000" runat="server" id="txt_RegNo" maxlength="50" type="text"
                                                        name="" value="" />
                                                </td>
                                                <td width="429">
                                                   <span style="color: Red;">*</span>
                                                                            <span class="status error" id="regno_div_error"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" align="right">
                                                    <strong><span>是否三维标志</span></strong>：
                                                </td>
                                                <td>
                                                    <input id="Radio3DNo" name="rdo3D" runat="server" checked="true" type="radio" />
                                                    否&nbsp;&nbsp;
                                                    <input id="Radio3DYES" name="rdo3D" runat="server" type="radio" />
                                                    是
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" align="right">
                                                    <strong><span>是否颜色组合</span></strong>：
                                                </td>
                                                <td>
                                                    <input id="rdoColorNO" name="rdoColor" runat="server" checked="true" type="radio" />
                                                    否&nbsp;&nbsp;
                                                    <input id="rdoColorYes" name="rdoColor" runat="server" type="radio" />
                                                    是
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" align="right">
                                                    <strong><span>声音商标</span></strong>：
                                                </td>
                                                <td>
                                                    <input id="chkSound" runat="server" type="checkbox" />
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr id="soundfiles" runat="server" visible="false">
                                                <td height="32" align="right">
                                                    <strong>声音文件</strong>：
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div id="upWav">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <span id="spWav" runat="server" visible="false">声音文件已上传</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div>
                                                        <span style="color: Red;">样本格式为mp3或wav，大小不超过5M</span></div>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr id="soundfiles1">
                                                <td height="32" align="right">
                                                    <strong>商标描述类型：</strong>
                                                </td>
                                                <td valign="middle">
                                                    <asp:RadioButton ID="RadioButton1" runat="server" onclick="miaoshutype();" GroupName="aa"
                                                        Checked="True" />文字商标<asp:RadioButton ID="RadioButton2" runat="server" GroupName="aa"
                                                            onclick="miaoshutype();" />图形商标<asp:RadioButton ID="RadioButton3" runat="server"
                                                                GroupName="aa" onclick="miaoshutype();" />文字与图形商标
                                                </td>
                                                <td valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="soundfiles2">
                                                <td height="32" align="right">
                                                    <strong>商标描述：</strong>
                                                </td>
                                                <td valign="middle">
                                                    <input type="text" runat="server" id="t_SBmiaosu" class="font12000" maxlength="100" />
                                                </td>
                                                <td valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <strong>商标说明</strong>：
                                                </td>
                                                <td valign="middle">
                                                    <textarea cols="20" rows="2" type="text" name="s6" id="txt_remark" style="width: 293px;
                                                        height: 180px;" class="font12000" maxlength="180" runat="server" onblur="check_ApplyUser('remark_div')"></textarea>
                                                </td>
                                                <td valign="middle">
                                                    <div>
                                                        <p>
                                                            (1)长度在1-180个字符之间</p>
                                                        <br />
                                                        <p>
                                                            (2)只能使用中文、英文或阿拉伯数字</p>
                                                        <br />
                                                        <p>
                                                            (3)以三维标志、颜色组合、声音标志<br />
                                                            申请商标注册的，应说明商标使用方式</p>
                                                        <br />
                                                        (4)商标为外文或者包含外文的，应当说明含义
                                                        <br />
                                                        <span class="status error" id="remark_div_error"></span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <strong>商标类别</strong>：
                                                </td>
                                                <td valign="middle">
                                                    <input id="sortarr" type="text" runat="server" readonly="readonly" class="font12000"
                                                        onblur="check_ApplyUser('sortarr_div')" onclick="showGoods()" />
                                                    <input type="hidden" id="sortGoods" runat="server" />
                                                </td>
                                                <td align="left">
                                                    <span class="status error" id="sortarr_div_error"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td valign="middle">
                                                    &nbsp;
                                                </td>
                                                <td valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <div id="goodsCalcInfo">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0" id="th_table">
                                            <tr id="th_box">
                                                <td width="58" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                    序号
                                                </td>
                                                <td width="78" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                    类别
                                                </td>
                                                <td width="108" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                    类似群
                                                </td>
                                                <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                    商品编码
                                                </td>
                                                <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                    商品名称
                                                </td>
                                                <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                    操作
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="Rpt_goods" runat="server">
                                                <ItemTemplate>
                                                    <tr classname="arr_goods" name="arr_goods[]" val="<%# Eval("id")%>" id="arr_goods<%# goodsItemCount- Container.ItemIndex%>">
                                                        <td height="25" align="center" bgcolor="#FFFFFF" id="4<%# goodsItemCount- Container.ItemIndex%>">
                                                            <%# goodsItemCount- Container.ItemIndex%>
                                                        </td>
                                                        <td align="center" bgcolor="#FFFFFF" id="3<%# goodsItemCount- Container.ItemIndex%>">
                                                            <input type="hidden" classname="hid_classsort" name="hid_sort[]" value='<%# Eval("MainCategoryCode")%>'><%# Eval("MainCategoryCode")%>
                                                        </td>
                                                        <td align="center" bgcolor="#FFFFFF" id="2<%# goodsItemCount- Container.ItemIndex%>">
                                                            <input type="hidden" name="hid_group[]" value='<%# Eval("DetailCategoryCode")%>'><%# Eval("DetailCategoryCode")%>
                                                        </td>
                                                        <td align="center" bgcolor="#FFFFFF" id="1<%# goodsItemCount- Container.ItemIndex%>">
                                                            <input type="hidden" name="hid_goods[]" value='<%# Eval("GoodsCode")%>'><%# Eval("GoodsCode")%>
                                                        </td>
                                                        <td align="center" bgcolor="#FFFFFF" id="0<%# goodsItemCount- Container.ItemIndex%>">
                                                            <input type="hidden" name="hid_goodsname[]" classname="<%#Eval("MainCategoryCode")%>"
                                                                value='<%#Eval("GoodsRemark")%>'><%# Eval("GoodsRemark")%>
                                                        </td>
                                                        <td align="center" bgcolor="#FFFFFF">
                                                            <a href="javascript:;" style="color: red;" onclick="del_onegoods(<%# goodsItemCount- Container.ItemIndex%>)">
                                                                删除</a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="639" height="20" align="left" valign="top">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="18" align="left">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="115" align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr id="zhutifile" runat="server">
                                                <td style="height: 50px; width: 376px;" align="right">
                                                    <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" />
                                                    <br />
                                                    图样1
                                                </td>
                                                <td align="center">
                                                    <p>
                                                        <div id="addpicture">
                                                        </div>
                                                    </p>
                                                    &nbsp;<div id="sb_namenum1">
                                                        <span style="color: Red;">格式为.jpg.gif.png,不大于500K</span></div>
                                                </td>
                                                <td>
                                                    请按照下的面的图样说明选择图样
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="8">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 50px;" align="right">
                                                    <asp:Image ID="Image2" runat="server" Width="150px" Height="150px" />
                                                    <br />
                                                    图样2
                                                </td>
                                                <td align="center">
                                                    <div id="addpicture2">
                                                    </div>
                                                    <span style="color: Red;">
                                                        <br />
                                                        格式为.jpg.gif.png,不大于500K</span>
                                                </td>
                                                <td>
                                                    以颜色组合或者着色图样申请商标注册<br />
                                                    的，应分别上传着色图样及黑白稿，黑<br />
                                                    白稿在图样2中上传
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th>
                                        商标信息第二部分
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>商标申请日：</strong>
                                                </td>
                                                <td>
                                                    <span id="spApplydate" runat="server"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>初审公告日：</strong>
                                                </td>
                                                <td>
                                                    <span id="spPublicPreliminaryDate" runat="server"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>注册公告日：</strong>
                                                </td>
                                                <td>
                                                    <input type="text"  id="txt_RegNoticeDate" class="inputs110text"  runat="server" readonly="readonly"
                                                    style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat;
                                                    background-position: right;"
                                                    onclick="WdatePicker({el:'txt_RegNoticeDate',dateFmt:'yyyy-MM-dd',onpicked:calcRegnoticeDate});" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <table id="tbdate">
                                                     <asp:Repeater ID="RptRenewalDate" runat="server">
                                                            <ItemTemplate>
                                                            <tr>
                                                                <td width="200px">
                                                                <span><%#string.Format("{0:yyyy年MM月dd}",Eval("RenewalDate"))%></span>日之前是否续展完成
                                                                </td>
                                                            <td>
                                                            <%# bool.Parse(Eval("IsFinish").ToString()) == true ? ("<input id='Radio1' name='rdoGroup" + string.Format("{0:yyyy}", Eval("RenewalDate")) + "' type='radio'  checked='checked' value='1' class='chkregdate'>是<input id='Radio4' name='rdoGroup" + string.Format("{0:yyyy}", Eval("RenewalDate")) + "' type='radio' value='0' class='chkregdate'>否") :("<input id='Radio1' name='rdoGroup" + string.Format("{0:yyyy}", Eval("RenewalDate")) + "' type='radio' value='1' class='chkregdate'>是<input id='Radio4' name='rdoGroup" + string.Format("{0:yyyy}", Eval("RenewalDate")) + "' checked='checked' type='radio' value='0' class='chkregdate'>否")%>
                                                            </td>
                                                            </tr>
                                                            </ItemTemplate>
                                                    </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>续展期限日：</strong>
                                                </td>
                                                <td>
                                                    <asp:Label ID="spRenewalDate" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>所剩天数：</strong>
                                                </td>
                                                <td height="32">
                                                    <span id="spRestDays"  runat="server"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>最近状态：</strong>
                                                </td>
                                                <td height="32">
                                                  <%--  <span id="spStatus" runat="server"></span>--%>
                                                     <asp:DropDownList ID="ddlTradeMarkStatus" runat="server">
                                                                </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th>
                                        其它信息
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>商标注册申请书：</strong>
                                                </td>
                                                <td>
                                                    <%=ApplyUpBook%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>商标申请委托书：</strong>
                                                </td>
                                                <td>
                                                    <%=AgentUpBook%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>商标续展申请书：</strong>
                                                </td>
                                                <td>
                                                 <%=RenewalApplyUpBook%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    <strong>商标续展委托书：</strong>
                                                </td>
                                                <td>
                                                    <%=RenewalAgentUpBook%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cb_Show" runat="server" />
                                                    是否显示&nbsp;&nbsp;
                                                    <asp:CheckBox ID="cb_ReceiveEmail" runat="server" />
                                                    是否接受邮件期限提醒
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" width="276" align="right">
                                                    备注：
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="t_Remark" runat="server" Style="width: 293px; height: 180px;" class="font12000"
                                                        MaxLength="180" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="list-div" id="Div1">
                                                        <table cellspacing='1' cellpadding='3' id="tblData" width="669px">
                                                            <tr>
                                                                <th width="2%">
                                                                </th>
                                                                <th width="10%">
                                                                    账单号
                                                                </th>
                                                                <th width="10%">
                                                                    添加时间
                                                                </th>
                                                                <th width="10%">
                                                                    收款时间
                                                                </th>
                                                                <th width="10%">
                                                                    缴费时间
                                                                </th>
                                                                <th width="10%">
                                                                    发送时间
                                                                </th>
                                                                <th width="10%">
                                                                    收据时间
                                                                </th>
                                                                <th width="12%">
                                                                    备注1
                                                                </th>
                                                                <th width="12%">
                                                                    备注2
                                                                </th>
                                                                <th width="5%">
                                                                    操作
                                                                </th>
                                                            </tr>
                                                            <asp:Repeater ID="reptlist" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td height="26" align="center">
                                                                            <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='txt_orderNum<%# Eval("i_Id")%>' class="inputs110text" value='<%#Eval("nvc_OrderNum")%>' />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='dt_addtime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_AddOrderTime")).ToShortDateString() %>'
                                                                                readonly="readonly" style="background-image: url(../images/user_js_date.gif);
                                                                                background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='dt_shoutime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_ShouKuanTime")).ToShortDateString() %>'
                                                                                readonly="readonly" style="background-image: url(../images/user_js_date.gif);
                                                                                background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='dt_jiaofeitime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_JiaoFeiTime")).ToShortDateString() %>'
                                                                                readonly="readonly" style="background-image: url(../images/user_js_date.gif);
                                                                                background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='dt_sendtime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_SendInfoTime")).ToShortDateString() %>'
                                                                                readonly="readonly" style="background-image: url(../images/user_js_date.gif);
                                                                                background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='dt_shoujutime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_KaiJuTime")).ToShortDateString() %>'
                                                                                readonly="readonly" style="background-image: url(../images/user_js_date.gif);
                                                                                background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='t_info1<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info1") %>' />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input type="text" id='t_info2<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info2") %>' />
                                                                        </td>
                                                                        <td align="center">
                                                                            <input id="Btn_Update" type="button" class="inputicoeditbutton" onclick="Edit(<%#Eval("i_Id") %>)" />
                                                                            <%--     <input type="button" title="修改" class="inputicoeditbutton" />
                                                                            --%>
                                                                            <%-- <asp:Button ID="Btn_Update" runat="server" Text="修改" CssClass="button" CommandName='<%#Eval("i_Id") %>'  OnCommand='Edit'/>--%>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <tr id="tRow0">
                                                                <td height="26" align="center" width="2%">
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" onblur="bb();checkBillNum(this.value);" name='txt_orderNum' class="inputs110text"
                                                                        value='' />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='dt_addtime' class="inputs110text" value='' readonly="readonly"
                                                                        style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat;
                                                                        background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='dt_shoutime' class="inputs110text" value='' readonly="readonly"
                                                                        style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat;
                                                                        background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='dt_jiaofeitime' class="inputs110text" value='' readonly="readonly"
                                                                        style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat;
                                                                        background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='dt_sendtime' class="inputs110text" value='' readonly="readonly"
                                                                        style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat;
                                                                        background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='dt_shoujutime' class="inputs110text" value='' readonly="readonly"
                                                                        style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat;
                                                                        background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='t_info1' class="inputs130text" value='' />
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <input type="text" name='t_info2' class="inputs130text" value='' />
                                                                </td>
                                                                <td align="center" width="5%">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table cellspacing='1' cellpadding='3' style="width: 100%">
                                                            <tr>
                                                                <td height="25" width="40%" align="right">
                                                                    <input type="hidden" id="hidNum" name="hidNum" value="0" />
                                                                    <input type="button" id="btnAdd" runat="server" class="button" style="display: none;"
                                                                        value="增加一条明细" />
                                                                </td>
                                                                <td align="left">
                                                                    <asp:Button ID="btnBill" runat="server" CssClass="button" Text="提交数据" OnClientClick="return dalclick();"
                                                                        OnClick="btnBill_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table cellspacing='1' cellpadding='3'>
                                                            <tr align="left">
                                                                <td height="25">
                                                                    <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value='' />&nbsp;
                                                                    <input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <br />
            <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px; background: #dfeef5;">
                <%# Eval("DetailCategoryCode")%>
                <asp:Button ID="btOK" runat="server" Text="提交" class="button" OnClick="btOK_Click"
                    OnClientClick="return M_addmarkRenewalCheck_data();" Style="margin-left: 350px;" />
                <%# Eval("GoodsCode")%>
                <%# Eval("GoodsRemark")%><input type="button" id="Button3" value="返回" class="button"
                    style="display: none" onclick="javascript:window.location='Shop_M_Trademark.aspx?<%=returnurl %>';" />
            </div>
        </div>
        <div class="ui-tabs-panel ui-tabs-hide">
            <div class="list-div" id="Div3" style="width: 689px">
                <table cellspacing='1' cellpadding='3' id="Table1" width="669px">
                    <tr>
                        <th width="10%" align="right">
                            商标状态
                        </th>
                        <th width="10%">
                            发生时间
                        </th>
                        <th width="5%">
                            操作
                        </th>
                    </tr>
                    <asp:Repeater ID="RptAdminStatus" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td align="right">
                                    <%# Eval("StatusName")%>
                                </td>
                                <td align="center">
                                 <%# Eval("TradeMarkStatusValue").ToString() != "4" ? 
                                     "<input type='text' id='dt_statustime"+Eval("TradeMarkStatusId")+"' class='inputs110text' value='"+string.Format("{0:yyyy-MM-dd}",Eval("TradeMarkDate"))+"' readonly='readonly' style='background-image: url(../../images/user_js_date.gif);background-repeat: no-repeat; background-position: right;' onclick=WdatePicker({dateFmt:'yyyy-MM-dd'}); />"
                                     :"<span id='adminsatusRenewalDate'>"+string.Format("{0:yyyy-MM-dd}",Eval("TradeMarkDate"))+"</span>" 
                                        %>
                               <%--     <input type="text" id='dt_statustime<%#Eval("TradeMarkStatusId") %>' class="inputs110text"
                                    value='<%#string.Format("{0:yyyy-MM-dd}",Eval("TradeMarkDate")) %>'
                                        readonly="readonly" style="background-image: url(../../images/user_js_date.gif);
                                        background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />--%>
                                </td>
                                <td align="center">
                                <%# Eval("TradeMarkStatusValue").ToString() != "4" ? 
                                "<input id='Btn_Update' type='button' class='inputicoeditbutton' onclick='AdminStatusEdit("+Eval("TradeMarkStatusId")+","+Eval("TradeMarkStatusValue")+")'/>":"" %>
                                   <%-- <input id="Btn_Update" type="button" class="inputicoeditbutton" onclick="AdminStatusEdit(<%#Eval("TradeMarkStatusId") %>,<%#Eval("TradeMarkStatusValue") %>)" />--%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div class="ui-tabs-panel ui-tabs-hide">
          <div class="list-div" id="Div4" style="width: 689px">
            <table width="100%">
                <tr>
                    <td valign="middle" align="right">
                        <b>留言内容：</b>
                    </td>
                    <td align="left">
                        <textarea name="txtMessage" id="txtMessage" class="area" maxlength='200' style="height: 80px;
                            width: 100%"></textarea>
                    </td>
                    <td align="center" width="150px">
                        <p style="padding: 6px 0;">
                            <input onclick="addMessage();" id="submit1" type="button" class="subBtn" value="提交" /></p>
                        <p style="padding: 6px 0;">字数必须小于200字</p>
                    </td>
                </tr>
            </table>
            <p></p>
              <p></p>
                <table cellspacing='1' cellpadding='3' width="100%">
                    <tr align="center" id="tabMsg">
                        <th width="90px">
                            时间
                        </th>
                        <th>
                             内容
                        </th>
                        <th width="30px">
                            删除
                        </th>
                    </tr>
                    <asp:Repeater ID="RptMessage" runat="server">
                        <ItemTemplate>
                            <tr align="center" id="message<%#Eval("i_Id")%>">
                                <td>
                                   <strong><%# string.Format("{0:yyyy-MM-dd}",Eval("AddTime"))%></strong>
                                </td>
                                <td>
                                 <div style="width:569px;word-wrap:break-word;overflow:auto;">
                                      <%#Eval("Message")%>
                                      </div>
                                </td>
                                <td>
                                     <a href="javascript:void(0)" onclick="delMessage('<%#Eval("i_Id")%>')">删除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
      </div>
        </div>
    </div>
    <input type="hidden" id="HiddenDel" value="" runat="server" />
    <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="40%">
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 15%; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="40%" align="right">
                                <img alt="" width="30" src="../images/caozuo_2.jpg" />
                            </td>
                            <td width="60%" align="left" style="font-size: 14px;">
                                &nbsp;删除成功
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="45%">
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px;
        height: 100px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td width="230px">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="11" height="27" background="../images/ts_bg.jpg">
                                <img src="../images/ts1.jpg" width="11" height="27" />
                            </td>
                            <td align="left" background="../images/ts_bg.jpg" style="color: #FFF; font-size: 14px;
                                line-height: 20px; font-weight: bold;">
                                温馨提示
                            </td>
                            <td width="34" background="../images/ts_bg.jpg">
                                <img alt="取消" src="../images/dingdan2.gif" width="34" height="27" style="cursor: hand;"
                                    onclick="divoperation(2,'1')" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece;
                    background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="20%" align="right" style="text-align: right">
                                <img alt="" width="30" src="../images/caozuo_1.jpg" />
                            </td>
                            <td width="80%" align="left" style="font-size: 14px;">
                                &nbsp;确认要进行删除操作吗？
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece;
                    background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="font-size: 14px;">
                                <a>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDel_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 200px; font-size: 16px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="25%" align="right">
                                <img alt="" width="30" src="../images/caozuo_3.jpg" />
                            </td>
                            <td width="75%" align="left" style="font-size: 14px;">
                                &nbsp;请选中您要删除的记录
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="40%">
                </td>
            </tr>
        </table>
    </div>
    <img style="position: absolute; display: none; border: solid 2px #578ece;" id="xsimg"
        alt="" src="../images/noimage.jpg" width="164" />
    <div id="div_a" runat="server">
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function addMessage() {
        var message = $("#txtMessage").val();
        if (!isEmpty(message)) {
            $.ajax({
                type: "POST",
                url: "M_A_TradeMark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=addSBmsg&message=" + message + "&TradeMarkId=" + $("#hi_TradeMarkId").val(),
                success: function (msg) {
                    if (msg != "no") {
                        var info = msg.split("|");
                        var html = '<tr align="center" id="message' + info[0] + '"><td>';
                        html += "<strong>" + info[1] + "</strong></td>";
                        html += "<td><div style='width:569px;word-wrap:break-word;overflow:auto;'>" + message + "</div></td>"
                        html += '<td><a href="javascript:void(0)" onclick="delMessage(' + info[0] + ')">删除</a></td></tr>'
                        $("#tabMsg").after(html);
                    }
                    else {
                        alert("增加失败！");
                    }
                }
            });
        }
    }
    function delMessage(messageId) {
        if (confirm("确定要删除吗？")) {
            $.ajax({
                type: "POST",
                url: "M_A_TradeMark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=delSBmsg&messageid=" + messageId,
                success: function (msg) {
                    if (msg == "ok") {
                        alert("删除成功！");
                        $("#message" + messageId).empty();
                        return false;
                    }
                    else {
                        alert("删除失败！");
                    }
                }
            });
        }
    }
    function checkBillNum(currentnum) {
        if (currentnum == "") {
            alert("请填写账单号");
            return false;
        }
        var num = [];
        var datanum = document.getElementsByName('txt_orderNum');
        for (var i = 0; i < datanum.length; i++) {
            num.push(datanum[i].value);
        }
        var newNum = num.sort();
        for (var i = 0; i < newNum.length - 1; i++) {
            if (newNum[i] == newNum[i + 1]) {
                alert("账单号重复！");
                return false;
            }
        }

        $.ajax({
            type: "POST",
            url: "../Shop_A_DataOrder.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=SbDataNum&data=" + currentnum,
            success: function (msg) {
                if (msg == "0") {
                    alert("账单号重复！");
                    return false;
                }
            }
        });
    }
    function bb() {
        var lname = document.getElementById('btnAdd');
        lname.style.display = "block";
    }
    function checknull() {
        var lname = document.getElementById('btnAdd');
        lname.style.display = "block";
    }
    var s = "";
    function dalclick() {
        var datanum = document.getElementsByName('txt_orderNum');
        var addtime = document.getElementsByName('dt_addtime');
        var shoutime = document.getElementsByName('dt_shoutime');
        var jiaofeitime = document.getElementsByName('dt_jiaofeitime');
        var sendtime = document.getElementsByName('dt_sendtime');
        var shoujutime = document.getElementsByName('dt_shoujutime');
        var info1 = document.getElementsByName('t_info1');
        var info2 = document.getElementsByName('t_info2');
        var hi = document.getElementById('HI_ATT');

        for (var i = 0; i < datanum.length; i++) {
            if (addtime[i].value == "") {
                alert("请填写添加时间");
                return false;
            }
            if (shoutime[i].value == "") {
                alert("请填写收款时间");
                return false;
            }
            if (jiaofeitime[i].value == "") {
                alert("请填写缴费时间");
                return false;
            }
            if (sendtime[i].value == "") {
                alert("请填写发送时间");
                return false;
            }
            if (shoujutime[i].value == "") {
                alert("请填写收据时间");
                return false;
            }
            else {
                if (datanum[i].value != "") {
                    s += datanum[i].value + "_" + addtime[i].value + "_" + shoutime[i].value + "_" + jiaofeitime[i].value + "_" + sendtime[i].value + "_" + shoujutime[i].value + "_" + info1[i].value + "_" + info2[i].value + "|";
                }
            }
        }
        hi.value = s;
    }


</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnAdd").click(function () {
            var num = $("#hidNum").val(); //
            num = parseInt(num);
            num++; //点击自加
            $("#hidNum").val(num); //重新赋值          
            $("#tRow0").clone(true).attr("id", "tRow" + num).appendTo("#tblData"); //clone tr 并重新给定ID,装到table
            $("#tRow" + num + " td").each(function () {//循环克隆的新行里面的td
                $(this).find("input[type='text']").val(""); //清空克隆行的数据
            });
        });
        $(".chkregdate").live("click", function () {
            var regdate = $(this).parent().prev().find("span").text().replace('年', '-').replace('月', '-');
            newRegDate = regdate;
            regdate = regdate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3");
            if ($(this).val() == "1") {
                var flag = true;
                var html = '<tr><td width="200px"><span>yyyy年mm月dd</span>日之前是否续展完成</td><td> <input id="Radio1" name="rdoGroup" type="radio" value="1" class="chkregdate"/>是<input id="chkdate" name="rdoGroupNO" type="radio"  checked="checked" value="0" class="chkregdate"/>否</td></tr>'
                $("#tbdate tr").each(function () {
                    var tmpdate = $(this).find("span").text().replace('年', '-').replace('月', '-');
                    tmpdate = tmpdate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3");
                    if (new Date(tmpdate) > new Date(regdate)) {
                        flag = false;
                        return;
                    }
                });
                if (flag) {
                    var d = new Date(regdate);
                    d.setYear(d.getFullYear() + parseInt(10));
                    var month = d.getMonth() + 1;
                    if (parseInt(month) < 10)
                        month = "0" + month;
                    var day = d.getDate();
                    if (parseInt(day) < 10)
                        day = "0" + day;
                    var ndate = (d.getFullYear()) + "-" + month + "-" + day;
                    $("#spRenewalDate").text(ndate);
                    $("#hi_RenewalDate").val(ndate);
                    $("#tbdate").append(html.replace('yyyy', d.getFullYear()).replace('mm', month).replace('dd', day).replace('rdoGroup', 'rdoGroup' + d.getFullYear()).replace('rdoGroupNO', 'rdoGroup' + d.getFullYear()));
                }
            }
            else {
                $("#tbdate tr").each(function () {
                    var tmpdate = $(this).find("span").text().replace('年', '-').replace('月', '-');
                    tmpdate = tmpdate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3");
                    if (new Date(tmpdate) > new Date(regdate)) {
                        $(this).remove();
                    }
                });
                $("#spRenewalDate").text(newRegDate);
                $("#hi_RenewalDate").val(ndate);
            }
            recordRegnoticeDate();
        });
    });

        function recordRegnoticeDate() {
            var s = '';
            var renewalDate =$("#spRenewalDate").text();
            var d = new Date(renewalDate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3"));
            var today = new Date();
            $("#spRestDays").text(Math.ceil((d - today) / (24 * 60 * 60 * 1000)) + "天"); //剩于天数

            $("#tbdate tr").each(function () {
                var tmpdate = $(this).find("span").text().replace('年', '-').replace('月', '-');
                var chked = $(this).find('input:radio:checked').val();
                s += tmpdate + "_" + chked + "|"
            });
            $("#hi_RegNoticeDate").val(s);
        }
</script>
<script type="text/javascript">
    function SelAll() {
        var inputs = document.getElementsByTagName("input");
        var checkall = document.getElementById("checkall");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox") {
                inputs[i].checked = checkall.checked;
            }
        }
    }
    function Selbox(obj) {
        var inputs = document.getElementsByName("inputPageid");
        var checkall = document.getElementById("checkall");
        if (obj.checked == false) {
            checkall.checked = false;
        }
        else {
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == false) {
                    checkall.checked = false;
                    return;
                }
                else {
                    checkall.checked = true;
                }
            }
        }
    }


    function Edit(obj) {
        var data1 = $("#txt_orderNum" + obj).val();
        var data2 = $("#dt_addtime" + obj).val();
        var data3 = $("#dt_shoutime" + obj).val();
        var data4 = $("#dt_jiaofeitime" + obj).val();
        var data5 = $("#dt_sendtime" + obj).val();
        var data6 = $("#dt_shoujutime" + obj).val();
        var data7 = $("#t_info1" + obj).val();
        var data8 = $("#t_info2" + obj).val();
        var datastr = data1 + "|" + data2 + "|" + data3 + "|" + data4 + "|" + data5 + "|" + data6 + "|" + data7 + "|" + data8;
        $.ajax({
            type: "POST",
            url: "../Shop_A_DataOrder.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=dataOrder&id=" + obj + "&data=" + datastr,
            success: function (msg) {
                if (msg == "ok") {
                    alert("修改成功");
                }
                if (msg == "0") {
                    alert("账单号重复！");
                }
            }
        });
    }

    function AdminStatusEdit(obj, statusvalue) {
        var data1 = $("#dt_statustime" + obj).val();
        var tradeMarkId = $("#hi_TradeMarkId").val();
        if (isEmpty(data1)) {
            alert("请输入发生时间！");
            return false;
        }
        if (tradeMarkId != "0") {
            $.ajax({
                type: "POST",
                url: "M_A_TradeMark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=adminstatusDate&TradeMarkStatusId=" + obj + "&TradeMarkId=" + tradeMarkId + "&TradeMarkStatusValue=" + statusvalue + "&data=" + data1,
                success: function (msg) {

                    if (msg == "ok") {
                        alert("保存成功！");

                        if (statusvalue == 0)//商标注册待审中 X年X月X日 →商标申请日
                        {
                            $("#spApplydate").text(data1);
                        }
                        else if (statusvalue == 1)//初步审定 X年X月X日 →初审公告日
                        {
                            $("#spPublicPreliminaryDate").text(data1);
                        }
                        else if (statusvalue == 4)//已注册 X年X月X日 →注册公告日 当状态为“已注册”时，此案件自动转到商标续展列表中，不在商标申请列表中显示
                        {
                            calcRegnoticeDate(data1);
                            $("#spRegNoticeDate").text(data1);

                        }
                    }
                    if (msg == "0") {
                        alert("保存失败！");
                    }
                }
            });
        }
    }

    function calcRegnoticeDate(vdate) {
        vdate = $("#txt_RegNoticeDate").val();
        var regdate = vdate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3");
        var tbdate = $("#tbdate");
        tbdate.empty();
        var html = '<tr><td width="200px"><span>yyyy年mm月dd</span>日之前是否续展完成</td><td> <input id="Radio1" name="rdoGroup" type="radio" value="1" class="chkregdate"/>是<input id="chkdate" name="rdoGroupNO" type="radio"  checked="checked" value="0" class="chkregdate"/>否</td></tr>'     
        var d = new Date(regdate);
        d.setYear(d.getFullYear() + parseInt(10));
        d.setDate(d.getDate() - parseInt(1));
        var month = d.getMonth() + 1;
        if (parseInt(month) < 10)
            month = "0" + month;
        var day = d.getDate();
        if (parseInt(day) < 10)
            day = "0" + day;
        var ndate = (d.getFullYear()) + "-" + month + "-" + day;
        $("#spRenewalDate").text(ndate);
        $("#hi_RenewalDate").val(ndate);
        tbdate.append(html.replace('yyyy', d.getFullYear()).replace('mm', month).replace('dd', day));
        $("#hi_RegNoticeDate").val(ndate + "_" + "0" + "|");
        var today = new Date();
        $("#spRestDays").text(Math.ceil((d - today) / (24 * 60 * 60 * 1000)) + "天"); //剩于天数
       // $("#spStatus").text();
    }
</script>
<script type="text/javascript">


    function miaoshutype() {
        var rb1 = document.getElementById("RadioButton1");
        var rb2 = document.getElementById("RadioButton2");
        var rb3 = document.getElementById("RadioButton3");
        if (rb1.checked) {
            document.getElementById("t_SBmiaosu").value = "请填写所申请的商标文字";
            document.getElementById("t_SBmiaosu").disabled = false;
            document.getElementById("sbmiaosu").style.display = "block";
        }
        if (rb2.checked) {
            document.getElementById("t_SBmiaosu").value = "";
            document.getElementById("sbmiaosu").style.display = "none";
        }
        if (rb3.checked) {
            document.getElementById("t_SBmiaosu").value = "请填写所申请的商标文字";
            document.getElementById("t_SBmiaosu").disabled = false;
            document.getElementById("sbmiaosu").style.display = "block";
        }
    }
    function Usercheck() {
        var cb1 = document.getElementById("CheckBox1");
        if (cb1.checked) {
            var na = document.getElementById("hi_n_a").value;
            if (na != "") {
                document.getElementById("t_sbregname").value = na.split('_')[0];
                document.getElementById("t_sbregaddress").value = na.split('_')[1];
                document.getElementById("t_sbregyouzheng").value = na.split('_')[2];
            }
            else {
                alert("该客户信息填写不完整！"); cb1.checked = false;
            }
        } else {
            document.getElementById("t_sbregname").value = "";
            document.getElementById("t_sbregaddress").value = "";
            document.getElementById("t_sbregyouzheng").value = "";
        }

    }
</script>
<script language="JavaScript" type="text/JavaScript">
    var dianji = 0;
    function checknull(inputid, fontid) {
        if (dianji == 0) {
            if (document.getElementById(inputid).value != "") {
                document.getElementById(fontid).style.display = "none";
            }
            else {
                document.getElementById(fontid).style.display = "";
            }
        }
    }
    function CheckUserMember() {
        var member = document.getElementById("txt_MemberId").value;
        $.ajax({
            type: "POST",
            url: "../Shop_A_Trademark.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "member=" + member,
            success: function (msg) {

                if (msg == "no") {
                    alert("请输入正确的用户编号");
                    document.getElementById("txt_MemberId").value = "";
                    document.getElementById("txt_MemberId").focus();
                }
                else {
                    document.getElementById("hi_n_a").value = msg;
                }
            }
        });
    }
     
  
</script>
<script type="text/javascript" language="javascript">
    function divoperation(ctype, divid)//操作div
    {
        if (ctype == 2) {
            document.getElementById("divbox" + divid).style.display = "none";
        }
        else {
            for (var i = 1; i < 4; i++) {
                if (i == divid) {
                    document.getElementById("divbox" + i).style.display = "";
                }
                else {
                    document.getElementById("divbox" + i).style.display = "none";
                }
            }
        }
    }
    if (document.getElementById('HiddenDel').value == "del") {
        divoperation(1, '3');
        setTimeout("divoperation(2,'3')", 1500); //1.5秒
    }
    function xwshow() {
        var inputs = document.getElementsByName("inputPageid");
        var jb = 0;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].checked == true) {
                jb = 1;
            }
        }
        if (jb == 0) {
            divoperation(1, '2');
            setTimeout("divoperation(2,'2')", 1500); //1.5秒
        }
        else {
            divoperation(1, '1');
        }
    }
</script>
<script language="javascript">
    var Message = {
        set: function () {//最小化与恢复状态切换
            var set = this.minbtn.status == 1 ? [0, 1, 'block', this.char[0], '最小化'] : [1, 0, 'none', this.char[1], '展开'];
            this.minbtn.status = set[0];
            this.win.style.borderBottomWidth = set[1];
            this.content.style.display = set[2];
            this.minbtn.innerHTML = set[3]
            this.minbtn.title = set[4];
            this.win.style.top = this.getY().top;
        },
        close: function () {//关闭
            this.win.style.display = 'none';
            window.onscroll = null;
        },
        setOpacity: function (x) {//设置透明度
            var v = x >= 100 ? '' : 'Alpha(opacity=' + x + ')';
            this.win.style.visibility = x <= 0 ? 'hidden' : 'visible'; //IE有绝对或相对定位内容不随父透明度变化的bug
            this.win.style.filter = v;
            this.win.style.opacity = x / 100;
        },
        show: function () {//渐显
            clearInterval(this.timer2);
            var me = this, fx = this.fx(0, 100, 0.1), t = 0;
            this.timer2 = setInterval(function () {
                t = fx();
                me.setOpacity(t[0]);
                if (t[1] == 0) { clearInterval(me.timer2) }
            }, 10);
        },
        fx: function (a, b, c) {//缓冲计算
            var cMath = Math[(a - b) > 0 ? "floor" : "ceil"], c = c || 0.1;
            return function () { return [a += cMath((b - a) * c), a - b] }
        },
        getY: function () {//计算移动坐标
            var d = document, b = document.body, e = document.documentElement;
            var s = Math.max(b.scrollTop, e.scrollTop);
            var h = /BackCompat/i.test(document.compatMode) ? b.clientHeight : e.clientHeight;
            var h2 = this.win.offsetHeight;
            //alert(s + "--" + h + "--" + h2);

            //return { foot: s + h + h2 + 2 + 'px', top: s + h - h2 - 2 + 'px' }
            return { foot: s + h2 + 'px', top: s + 'px' }

        },
        moveTo: function (y) {//移动动画
            clearInterval(this.timer);
            var me = this, a = parseInt(this.win.style.top) || 0;
            var fx = this.fx(a, parseInt(y));
            var t = 0;
            this.timer = setInterval(function () {
                t = fx();
                me.win.style.top = t[0] + 'px';
                if (t[1] == 0) {
                    clearInterval(me.timer);
                    me.bind();
                }
            }, 10);
        },
        bind: function () {//绑定窗口滚动条与大小变化事件
            var me = this, st, rt;
            window.onscroll = function () {
                clearTimeout(st);
                clearTimeout(me.timer2);
                me.setOpacity(0);
                st = setTimeout(function () {
                    me.win.style.top = me.getY().top;
                    me.show();
                }, 600);
            };
            window.onresize = function () {
                clearTimeout(rt);
                rt = setTimeout(function () { me.win.style.top = me.getY().top }, 100);
            }
        },
        init: function () {//创建HTML
            function $(id) { return document.getElementById(id) };
            this.win = $('msg_win');
            var set = { minbtn: 'msg_min', closebtn: 'msg_close', title: 'msg_title', content: 'msg_content' };
            for (var Id in set) { this[Id] = $(set[Id]) };
            var me = this;
            this.minbtn.onclick = function () { me.set(); this.blur() };
            this.closebtn.onclick = function () { me.close() };
            this.char = navigator.userAgent.toLowerCase().indexOf('firefox') + 1 ? ['_', '::', '×'] : ['0', '2', 'r']; //FF不支持webdings字体
            this.minbtn.innerHTML = this.char[0];
            this.closebtn.innerHTML = this.char[2];
            setTimeout(function () {//初始化最先位置
                me.win.style.display = 'block';
                me.win.style.top = me.getY().foot;
                me.moveTo(me.getY().top);
            }, 0);
            return this;
        }
    };
    Message.init();
</script>
