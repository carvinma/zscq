<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_trademark_renewal.aspx.cs" Inherits="add_trademark_renewal" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商标信息检索_我的商标_服务中心_商标系统_环球汇通</title>
    <meta name="Keywords" content="环球汇通" />
    <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script src="js/jtrademark.js" type="text/javascript"></script>
    <script src="js/j.suggest.js" type="text/javascript"></script>
    <script src="js/swfobject.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/trademark.css" />
    <script src="js/tooltips.js" type="text/javascript"></script>
    <script src="jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="js/js.js" type="text/javascript"></script>
    <script src="js/jquery.uploadify.min.js" type="text/javascript"></script>

    <link href="jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var tmptoCity, tmptoCityCode;
        $(function () {
            InitProCityArea();
            var userid = $('#Hi_MemberId').val();
            if (userid > 0) {
                GetApplysDDL(userid, "0"); //初始化企业单位申请人
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
                'swf': 'js/SWF/uploadify.swf',
                'uploader': 'Handler.ashx?flag=uploadimage',
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
                'swf': 'js/SWF/uploadify.swf',
                'uploader': 'Handler.ashx?flag=uploadimage',
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

            $("#upfileRegisteCertificate").uploadify({
                'swf': 'js/SWF/uploadify.swf',
                'uploader': 'Handler.ashx?flag=uploadimage',
                //'buttonImg': "images/aboutus1s.gif",
                'buttionClass': '',
                'buttonText': '选择文件',
                'queueID': 'fileQueue',
                'width': '80',
                'height': '32',
                'overrideEvents': ['onDialogClose'],
                'fileTypeDesc': '浏览文件(*pdf)',
                'fileTypeExts': '*.pdf',
                'auto': true,
                'multi': false,
                'fileSizeLimit': '2MB',
                'queueSizeLimit': 1,
                'onUploadSuccess': function (file, data, response) {
                    $.jBox.closeTip();
                    $("#aRegisteCertificate").show();
                    $("#upRegisteCertificate").val(data);
                },
                'onSelect': function (file) {
                    $.jBox.tip("正在上传文件，请稍后...", 'loading');
                },
                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#upRegisteCertificate').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#upRegisteCertificate').uploadify('settings', 'fileSizeLimit') + "大小！");
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
                'swf': 'js/SWF/uploadify.swf',
                'uploader': 'Handler.ashx?flag=uploadimage',
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
                    $('#Image1').attr('src', 'UploadTemp/' + data);
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
            $(".chkregdate").live("click", function () {
                var regdate = $(this).parent().prev().find("span").text().replace('年', '-').replace('月', '-');
                regdate = regdate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3");
                //if ($(this).is(":checked")) {
                 if ($(this).val()=="1") {
                    var flag = true;
                   // var html = '<tr><td><span>yyyy年mm月dd</span>日之前是否续展完成</td><td><input id="chkdate" type="checkbox" class="chkregdate"/></td></tr>'
                    var html = '<tr><td><span>yyyy年mm月dd</span>日之前是否续展完成</td><td> <input id="Radio1" name="rdoGroup" type="radio"  value="1" class="chkregdate"/>是<input id="chkdate" name="rdoGroupNO" type="radio" value="0" checked="checked" class="chkregdate"/>否</td></tr>'
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
                        $("#txt_RenewalDate").val(ndate);
                        $("#tbdate").append(html.replace('yyyy', d.getFullYear()).replace('mm', month).replace('dd', day).replace('rdoGroup', 'rdoGroup' + d.getFullYear()).replace("rdoGroupNO", "rdoGroup" + d.getFullYear()));
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
                    $("#txt_RenewalDate").val(regdate);
                }
                recordRegnoticeDate();
            });
        });

        function miaoshutype() {

            var description = $("#hi_tradeMarkdesc").val();
            var rb1 = document.getElementById("RadioButton1");
            var rb2 = document.getElementById("RadioButton2");
            var rb3 = document.getElementById("RadioButton3");
            if (rb1.checked) {
                $("#Sb_miaosu").val(description);
                $("#Sb_miaosu").disabled = false;
                $("#sbmiaoshu").show();
            }
            if (rb2.checked) {
                $("#sbmiaoshu").hide();
                $("#Sb_miaosu").val("");
            }
            if (rb3.checked) {
                $("#Sb_miaosu").val(description);
                $("#Sb_miaosu").disabled = false;
                $("#sbmiaoshu").show();
            }
        }
        function recordRegnoticeDate() {
            var s = '';
            $("#tbdate tr").each(function () {
                var tmpdate = $(this).find("span").text().replace('年', '-').replace('月', '-');
                var chked = $(this).find('input:radio:checked').val();
               // var chked = $(this).find("input[type='radio']").is(':checked') ? "1" : "0";
                s += tmpdate + "_" + chked + "|"
            });
            $("#hi_RegNoticeDate").val(s);
         }
        function calcRegnoticeDate() {
           var regdate =$dp.cal.getNewDateStr();
           var tbdate = $("#tbdate");
           tbdate.empty();
           regdate = regdate.replace(/(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3");
            //var html = '<tr><td><span>yyyy年mm月dd</span>日之前是否续展完成</td><td><input id="chkdate" type="checkbox" class="chkregdate"/></td></tr>'
           var html = '<tr><td><span>yyyy年mm月dd</span>日之前是否续展完成</td><td> <input id="Radio1" name="rdoGroup" type="radio" value="1" class="chkregdate"/>是<input id="chkdate" name="rdoGroupNO" type="radio"  checked="checked" value="0" class="chkregdate"/>否</td></tr>'
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
           $("#txt_RenewalDate").val(ndate);
           //var newhmtl=
           tbdate.append(html.replace('yyyy', d.getFullYear()).replace('mm', month).replace('dd', day).replace('rdoGroup', 'rdoGroup' + d.getFullYear()).replace('rdoGroupNO', 'rdoGroup' + d.getFullYear()));
           $("#hi_RegNoticeDate").val(ndate +"_"+"0"+ "|");
       }
       function calcsortarr() {
           var goodstype = $("#sortarr").val();
           if (!isEmpty(goodstype)) {
               var parr = new Array();
               parr = goodstype.replace(/，/g, ',').split(",");
               var totolmoney = parr.length * parseFloat($("#hi_MainFees").val());
               $("#lbltotalCost").text("包含" + parr.length + "类，共计规费:" + totolmoney + "元");
              // $("#lbltotalCost").show();
               $("#hi_money").val(totolmoney);
           }
           else {
               $("#lbltotalCost").hide();
           }
       }
    </script>
    <style type="text/css">
        p.MsoNormal
        {
            margin-bottom: .0001pt;
            text-align: justify;
            text-justify: inter-ideograph;
            font-size: 10.5pt;
            font-family: "Times New Roman" , "serif";
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
    </style>
</head>
<body id="index">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <input type="hidden" id="Hi_MemberId" runat="server" value="" />
    <input id="hi_guoji" type="hidden" runat="server" value="0" />
    <input id="hi_usertype" type="hidden" runat="server" />
    <input id="hi_zhitifiles" type="hidden" runat="server" />
    <input id="hi_sbid" type="hidden" runat="server" value="0" />
     <input id="hi_money" type="hidden" runat="server" value="0" />

     <input id="hi_tradeMarkdesc" type="hidden" runat="server" value="0" />
     <input id="hi_RegNoticeDate" type="hidden" runat="server" value="0" />
    <input id="hi_MainFees" type="hidden" runat="server" value="0" />
    <input id="hi_ItemNum" type="hidden" runat="server" value="0" />
    <input id="hi_ExceedFees" type="hidden" runat="server" value="0" />
     <input type="hidden" runat="server"  id="hiUpCardNo" value="" />
     <input type="hidden" runat="server"  id="upBusinessLinces" value="" />
      <input type="hidden" runat="server"  id="upRegisteCertificate" />
      <input type="hidden" runat="server"  id="upPattern1" />
       <input type="hidden" runat="server"  id="upPattern2" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;
        background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
            </td>
            <td align="left" valign="top">
                <table width="741" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
                            <table width="739" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="701">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;添加商标信息&nbsp;
                                        &gt;&gt; 添加商标续展案
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="20">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" class="font12bd44147" style="border-bottom: 1px solid #d34245;">
                                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="10" height="28">
                                                    &nbsp;
                                                </td>
                                                <td width="98" align="center">
                                                    &nbsp;
                                                </td>
                                                <td width="6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10" height="20">
                                                    &nbsp;
                                                </td>
                                                <td width="98" align="center" class="font12bt">
                                                    注意事项
                                                </td>
                                                <td width="6">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" class="font12bd44147">
                                        <br />
                                        <br />
                                        *如商标申请人有两个或两个以上（即共有商标），请直接联系我们，<br />&nbsp;电话：010-84505596，邮箱：pat-annuity@hqht-online.com
                                        &nbsp <br />
                      
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="right" class="font12bd44147">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <a href="aBrand/BrandRenewalHelpDoc.aspx"  class="font12bd44147" target="_blank">【填写说明】</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="671" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="115" align="center" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            注册人信息
                                                                        </td>
                                                                        <td width="6">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td height="18" align="center">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="115" align="left" valign="top">
                                                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="right">
                                                                            <strong>选择注册人类别</strong>：
                                                                        </td>
                                                                        <td>
                                                                            <input id="RdoPeople" type="radio" name="person" value="1" runat="server" />自然人&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <input id="RdoCorp" type="radio" name="person" value="0" runat="server" 
                                                                                checked="true" />法人或其他组织
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="180" height="32" align="right">
                                                                            <strong>注册人名称：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input runat="server" id="txt_applyname" type="text" 
                                                                            onblur="check_ApplyUser('name_div')" tips="请与商标注册证书一致"  placeholder="" 
                                                                            class="font12000 tooltip" maxlength="50" clientidmode="Static" autocomplete="off"/>
                                                                            <span style="color: Red;">*</span>  <span class="status error" id="name_div_error"></span>
                                                                            <input type="hidden" name="applyname_3word" runat="server" clientidmode="Static"
                                                                                id="applyname_3word" value="CAN" /><br />
                                                                            <div id="suggest" class="ac_results" style="width: 173px;">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display:none" class="appusertype">
                                                                        <td width="180" height="32" align="right">
                                                                            <strong>身份证件名称：</strong></td>
                                                                        <td align="left">
                                                                             <select id="Select1" name="live_prov" onchange="">
                                                                             <option value="0">身份证</option></select>
                                                                     </td>
                                                                    </tr>
                                                                    <tr style="display:none" class="appusertype">
                                                                        <td width="180" height="32" align="right">
                                                                            <strong>身分证件号码：</strong></td>
                                                                        <td align="left">
                                                                            <input class="font12000" onblur="check_ApplyUser('cardno_div')" runat="server" 
                                                                                style="ime-mode: disabled;" id="txt_applyCardNo" maxlength="20" type="text" 
                                                                               name="" value=""/>
                                                                                <span style="color: Red;">*</span>
                                                                                  <span class="status error" id="cardno_div_error"></span>
                                                                               </td>
                                                                    </tr>
                                                                    <tr style="display:none" class="appusertype">
                                                                        <td width="180" height="32" align="right">
                                                                            <strong>身份证件扫描件：</strong></td>
                                                                        <td align="left">
                                                                            <table><tr><td> <div id="upCardNoPdf"></div></td>
                                                                           <td>
                                                                             <span id="aCardNoPdf"  style="display:none">身份证件扫已上传</span>
                                                                           </td>
                                                                           </tr></table>
                                                                          
                                                                            <div>
                                                                                <span style="color: Red;">本人签字后彩色扫描上传，格式为pdf，大小不超过1M</span></div>
                                                                                </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong><span>营业执照副本（中文）</span>：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                           <%-- <asp:FileUpload ID="FileUpload5" runat="server" Width="200px" />--%>
                                                                           <table><tr><td> <div id="upBusinessLicense"></div></td>
                                                                           <td>
                                                                             <span id="aBusinessLicense"  style="display:none">营业执照副本已上传</span>
                                                                           </td>
                                                                           </tr></table>
                                                                          
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
                                  <option value="">请选择</option></select>
                                  <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                                  <option value="">请选择</option></select>
                                  <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                                  <option value="">请选择</option></select>
                                    <span style="color: Red;">*</span>
                                   <span class="status error" id="area_div_error"></span>
                                    <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static"  />
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
                                                                            <input class="font12000 tooltip" onblur="check_ApplyUser('address_div')" 
                                                                            runat="server" id="txt_address" maxlength="50" type="text" tips="请与证明文件中的地址一致"
                                                                               name="" value=""/>
                                                                               <span style="color: Red;">*</span> 
                                                                                <span class="status error" id="address_div_error"><span></span></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>联系人：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="text" name="s6" id="txt_ContactPerson" onblur="check_ApplyUser('ContactPerson_div')"
                                                                                class="font12000 tooltip" maxlength="50" runat="server"/>
                                                                                <span style="color: Red;">*</span>
                                                                                <span class="status error" id="ContactPerson_div_error"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>联系电话：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                             <input runat="server" id="txt_phone" onblur="check_ApplyUser('phone_div')" class="font12000" type="text" name="" value="" placeholder="" maxlength="20" />
                                                                             <span style="color: Red;">*</span>
                                                                             <span class="status error" id="phone_div_error"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>传真（含地区号）：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                        <input runat="server" id="txt_fax" onblur="check_ApplyUser('fax_div')" class="font12000" type="text" name="" value="" placeholder="" maxlength="20" />
                                                                          <span class="status error" id="fax_div_error"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>邮政编码：</strong>
                                                                        </td>
                                                                        <td align="left" style="text-li:left;">
                                                                         <input class="font12000"  onblur="check_ApplyUser('postcode_div')" runat="server" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" id="txt_postcode" maxlength="6" type="text" name="" value="" placeholder=""/>
                                                                         <span style="color: Red;">*</span>
                                                                         <span class="status error" id="postcode_div_error"></span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            商标信息
                                                                        </td>
                                                                        <td width="6">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="18" align="left">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="115" align="left" valign="top">
                                                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr style="display:none">
                                                                        <td height="32" width="360" align="right" valign="middle">
                                                                            <strong><span>我公司案件号</span></strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" width="360" align="right" valign="middle">
                                                                            <strong>注册号/申请号：</strong></td>
                                                                        <td valign="middle">
                                                                         <input class="font12000 tooltip"  onblur="check_ApplyUser('regno_div')" runat="server" 
                                                                                style="ime-mode: disabled;" tips="请与商标注册证书一致"
                                                                                id="txt_RegNo" maxlength="20" type="text"   value="" placeholder=""/></td>
                                                                        <td width="429" valign="middle">
                                                                          <span style="color: Red;">*</span>
                                                                            <span class="status error" id="regno_div_error"></span>
                                                                            </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                            <strong>商标类别：</strong>
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input id="sortarr" type="text" runat="server" class="font12000"  style="ime-mode: disabled;" 
                                                                             onblur="check_ApplyUser('sortarr_div');calcsortarr();"/>
                                                                             <input type="hidden" id="sortGoods" runat="server"/>
                                                                             <div><span style="color: Red;">多个商标类别，以逗号分隔</span></div>
                                                                        </td>
                                                                        <td valign="middle">
                                                                         <span style="color: Red;">*</span>
                                                                            <span class="status error" id="sortarr_div_error"></span>
                                                                             <asp:Label ID="lbltotalCost" style="display:none" runat="server" Text="Label"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                            <strong>商标描述类型：</strong></td>
                                                                        <td valign="middle">
                                                                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="aa" 
                                                                                onclick="miaoshutype();" Checked="True" />
                                                                            文字商标<asp:RadioButton ID="RadioButton2" runat="server" GroupName="aa" 
                                                                                onclick="miaoshutype();" />
                                                                            图形商标<asp:RadioButton ID="RadioButton3" runat="server" GroupName="aa" 
                                                                                onclick="miaoshutype();" />
                                                                            文字与图形商标</td>
                                                                        <td valign="middle">
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr id="sbmiaoshu">
                                                                        <td height="32" align="right" valign="middle">
                                                                           <strong> 商标描述：</strong></td>
                                                                        <td valign="middle" colspan="2">
                                                                        <input type="text" name="s6" id="Sb_miaosu" class="font12000" maxlength="50" runat="server" 
                                                                        onblur="checkOk('Sb_miaosu');"  onclick="value='';focus()" style="width:300px;"/> <span style="color: Red;" id="Sb_miaosu1">*</span>
                                                                        </td>
                                                                         
                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                            <strong>商标注册证书：</strong></td>
                                                                        <td colspan="2" valign="middle">
                                                                            <div id="upfileRegisteCertificate"></div>
                                                                             <span id="aRegisteCertificate"  style="display:none">商标注册证书已上传</span>
                                                                             <div>
                                                                                <span style="color: Red;">请将商标注册证书扫描为彩色上传，格式为pdf，大小不超过2M</span>
                                                                                </div>
                                                                         </td>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                            <strong>商标申请日：</strong></td>
                                                                        <td valign="middle">
                                                                            <input type="text" name="s6" runat="server" id="txt_applydate" onblur="checkOk('txt_applydate');"  
                                                                            class="font12000" readonly="readonly" style="background-image:url(images/user_js_date.gif); 
                                                                                background-repeat:no-repeat; background-position:right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/></td>
                                                                        <td valign="middle">
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                             <strong>注册公告日：</strong></td>
                                                                        <td valign="middle">
                                                                           <input type="text" runat="server" id="txt_RegNoticeDate"  
                                                                             onblur="check_ApplyUser('regdate_div');"  
                                                                           class="font12000" readonly="readonly" style="background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" 
                                                                           onclick="WdatePicker({el:'txt_RegNoticeDate',dateFmt:'yyyy-MM-dd',onpicked:calcRegnoticeDate});"/>
                                                                           </td>
                                                                        <td valign="middle">
                                                                            <span class="status error" id="regdate_div_error"></span></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                             &nbsp;</td>
                                                                        <td colspan="2" valign="middle">
                                                                        <table id="tbdate">
                                                                        
                                                                            <tr>
                                                                                <td>
                                                                                   </td>
                                                                            </tr>
                                                                        
                                                                        </table>
                                                                        </td>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                        <td  height="32" align="right" valign="middle">
                                                                             <strong>续展期限日：</strong></td>
                                                                         <td valign="middle">
                                                                        <input type="text" runat="server" id="txt_RenewalDate" class="font12000" readonly="readonly" />
                                                                        </td>
                                                                        <td valign="middle">
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" valign="middle">
                                                                            <strong>备注：</strong></td>
                                                                        <td valign="middle">
                                                                            <textarea cols="20" rows="2" type="text" name="s7" id="txt_remark" style="width: 293px;
                                                                                height: 180px;" class="font12000" maxlength="180" runat="server"  
                                                                                ></textarea></td>
                                                                        <td valign="middle">
                                                                           <div>
                                                                                <p>
                                                                                    (1)长度在1-180个字符之间</p>
                                                                                <br />
                                                                                <p>
                                                                                    (2)只能使用中文、英文或阿拉伯数字</p>
                                                                                <br />
                                                                                <p>
                                                                                    &nbsp;</p>
&nbsp;<br />
                                                                                <span class="status error" id="remark_div_error"></span>
                                                                            </div></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr><td align="center"><div id="goodsCalcInfo"></div></td>
                                                        </tr>
                                                        <tr><td align="center">
                                                            &nbsp;</td>
                                                        </tr>
                                                        </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            商标图样上传
                                                                        </td>
                                                                        <td width="6">
                                                                        </td>
                                                                    </tr>
                                                                </table>
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
                                                                        <td style="height: 50px; width: 260px;" align="center">
                                                                            <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" />
                                                                            <br />
                                                                            图样
                                                                        </td>
                                                                        <td>
                                         <p>                             

                                            <div id="addpicture">  </div>  
                                           </p> 
                                                            
                                                                            &nbsp;<div id="sb_namenum1">
                                                                                <span style="color: Red;">格式为.jpg.gif.png,不大于500K</span></div>
                                                                        </td>
                                                                        <td>
                                                                           
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

                                                       
                                                        </table>
                                                    </td></tr>
                                                    </table>
                                              </td>
                                            </tr>
                                        </table>
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="32" align="right">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                &nbsp;
                                                            </td>
                                                            <td align="center" valign="top">
                                                                <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="100" style="display:none">
                                                                            <asp:Button ID="btnPreview" CssClass="BtnShow" runat="server" Text="预  览" 
                                                                                onclick="btnPreview_Click" />
                                                                        </td>
                                                                        <td width="100">
                                                                            <asp:Button ID="btnSave" CssClass="BtnShow" runat="server" Text="保  存" 
                                                                                onclick="btnSave_Click"  OnClientClick="return addmarkRenewalCheck_data()"/>
                                                                        </td> 
                                                                        <td width="100">
                                                                            <asp:Button ID="btnSubmit" CssClass="BtnShow" runat="server"
                                                                                Text="确认提交" onclick="btnSubmit_Click" OnClientClick="return addmarkRenewalCheck_data()"/>
                                                                        </td>
                                                                        <td width="100">
                                                                          <a  href="javascript:void(0)" id="linkDel" class="BtnShowhref"  style="width:70px"  onclick="cancleSumbit('1')">放弃提交</a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id="div_a" runat="server">
    </div>
    <script src="js/CheckTrademark.js" type="text/javascript"></script>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
