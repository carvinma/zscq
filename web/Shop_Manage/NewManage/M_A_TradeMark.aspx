<%@ Page Language="C#" AutoEventWireup="true" CodeFile="M_A_TradeMark.aspx.cs" ValidateRequest="false" Inherits="M_A_TradeMark" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../js/jtrademark.js" type="text/javascript"></script>
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
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.js"></script>

     <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/vcom.js"></script>
       <script type="text/javascript">
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
            InitProCityArea();
            var userid = $('#Hi_MemberId').val();
             

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
                'swf': '../js/SWF/uploadify.swf',
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
                'swf': '../js/SWF/uploadify.swf',
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

            $("#upWav").uploadify({
                'swf': '../js/SWF/uploadify.swf',
                'uploader': 'Handler.ashx?flag=uploadimage',
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
                'swf': '../js/SWF/uploadify.swf',
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

            $("#addpicture2").uploadify({
                'swf': '../js/SWF/uploadify.swf',
                'uploader': 'Handler.ashx?flag=uploadimage',
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
                    $('#Image2').attr('src', 'UploadTemp/' + data);
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
	    margin-bottom:-3px;
    }
    </style>
    <style type="text/css">
    .colordiv
    {
    	border:solid 1px #8dcff4;
    	width:16px;
    	height:16px;
    	padding:1px;
    	float:left;
    	margin-right:5px;
    	cursor:pointer;
    }
    .colordiv:hover
    {
    	border:solid 1px #e8641b;
    }
    .colordiv img
    {
    	width:16px;
    	height:16px;
    }
    .colordivselect
    {
    	padding:1px;
    	float:left;
    	margin-right:5px;
    	cursor:pointer;
    	width:32px;
    	height:32px;
    	border:solid 1px #e8641b;
    }
    .colordivselect img
    {
    	width:32px;
    	height:32px;
    }
    
* { margin: 0; /* [disabled]padding:0; */ font-size: 12px; list-style: none; color: #585858; }
        .style1
        {
            height: 32px;
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
            z-index:1000;
        }
         .inputs110text{width:110px;height:18px;line-height:18px;}
.inputs110text:hover{width:110px;height:18px;line-height:18px;border:solid 2px #eb10a3d;}

  
         .suojudiv{ width:210px; float:left; padding:5px; border:solid 1px #ffffff;} 
         .suojudiv:hover{ border:solid 1px #aaaaaa;}
         .suojudiv div{float:left; margin-left:5px;} 
         .suojudiv div.name{ width:110px; height:45px; overflow:hidden;} 
          #msg_win{background:#EAEAEA;width:450px;position:absolute;right:0;font-size:12px;font-family:Arial;margin:0px;display:none;overflow:hidden;z-index:99;}
    #msg_win .icos{position:absolute;top:2px;top:0px;right:2px;z-index:9;}
    .icos a{float:left;color:#833B02;margin:1px;text-align:center;font-weight:bold;width:14px;height:22px;line-height:22px;padding:1px;text-decoration:none;font-family:webdings;}
    .icos a:hover{color:#fff;}
    #msg_title{background:#D10003;border-bottom:1px solid #A67901;border-top:1px solid #FFF;border-left:1px solid #FFF;color:#000;height:25px;line-height:25px;text-indent:5px;}
    #msg_content{margin:5px;margin-right:0;width:440px;height:auto;overflow:hidden;border:1px solid #A67901;}
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
            <input type="hidden" id="hd_id" runat="server" value="0" />
            <input type="hidden" id="hd_userId" runat="server" value="0" />
             <input type="hidden" id="hi_n_a" runat="server" value="" />

              <input type="hidden" id="Hi_MemberId" runat="server" value="" />
    <input id="hi_guoji" type="hidden" runat="server" value="0" />
    <input id="hi_usertype" type="hidden" runat="server" />
    <input id="hi_zhitifiles" type="hidden" runat="server" />
    <input id="hi_sbid" type="hidden" runat="server" value="0" />

    <input id="hi_MainFees" type="hidden" runat="server" value="0" />
    <input id="hi_ItemNum" type="hidden" runat="server" value="0" />
    <input id="hi_ExceedFees" type="hidden" runat="server" value="0" />
     <input type="hidden" runat="server"  id="hiUpCardNo" value="" />
     <input type="hidden" runat="server"  id="upBusinessLinces" value="" />
      <input type="hidden" runat="server"  id="upSound" />
      <input type="hidden" runat="server"  id="upPattern1" />
       <input type="hidden" runat="server"  id="upPattern2" />

       <input type="hidden" runat="server" id="HI_ATT" value="" />
        <h1>
            <span class="action-span"><a href="L_M_Trademark.aspx?<%=returnurl %>">申请列表</a></span> <span class="action-span1"><a
                    href="../Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1"> - <%=PageType%></span>
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
                                <td width="276" height="26" align="right"><strong>会员编号：</strong></td>
                                <td  height="26">
                                <input type="text" runat="server" id="txt_MemberId" class="input" maxlength="11" onblur="checknull('txt_MemberId','txt_MemberIdFont');CheckUserMember();" />
                                &nbsp;<font color="#FF0000">*</font>
                                <font id="txt_MemberIdFont" class="alertfont" style="display:none;">
                                    <img alt="警告" src="../images/caozuo_3.jpg" width="15" />不能为空
                                </font>    
                                </td>
                            </tr>
                                                                                <tr>
                                                                                    <td align="right">
                                                                                        <strong>选择申请人类别</strong>：
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
                                                                                        <input runat="server" id="txt_applyname" type="text" 
                                                                                        onblur="check_ApplyUser('name_div')" name="" value="" placeholder="" 
                                                                                        class="font12000" maxlength="50" clientidmode="Static" autocomplete="off"/>
                                                                                        <span style="color: Red;">*</span>  <span class="status error" id="name_div_error"></span>
                                                                                        <input type="hidden" name="applyname_3word" runat="server" clientidmode="Static"
                                                                                            id="applyname_3word" value="CAN" /><br />
                                                                                        <div id="suggest" class="ac_results" style="width: 173px;">
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="display:none" class="appusertype">
                                                                                    <td  height="32" align="right">
                                                                                        <strong>身份证件名称：</strong></td>
                                                                                    <td align="left">
                                                                                         <select id="Select1" name="live_prov" onchange="">
                                                                                         <option value="0">身份证：</option></select>
                                                                                 </td>
                                                                                </tr>
                                                                                <tr style="display:none" class="appusertype">
                                                                                    <td height="32" align="right">
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
                                                                                    <td  align="right" class="style1">
                                                                                        <strong>身份证件扫描件：</strong></td>
                                                                                    <td align="left" class="style1">
                                                                                        <table><tr><td> <div id="upCardNoPdf"></div></td>
                                                                                       <td>
                                                                                         <span id="aCardNoPdf"  style="display:none">份证件扫已上传</span>
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
                                              <option value="">请选择：</option></select>
                                              <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                                              <option value="">请选择：</option></select>
                                              <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                                              <option value="">请选择：</option></select>
                                                <span style="color: Red;">*</span>
                                               <span class="status error" id="Span1"></span>
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
                                                                                        <input class="font12000" onblur="check_ApplyUser('address_div')" runat="server" style="ime-mode: disabled;" id="txt_address" maxlength="50" type="text" 
                                                                                           name="" value=""/>
                                                                                           <span style="color: Red;">*</span> 
                                                                                            <span class="status error" id="address_div_error"></span>
                                                                                    </td>
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
                                                                                <tr id="sbmiaoshu">
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
                            <td colspan="2">
                            <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                                                    <tr>
                                                                         <th> 商标信息
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
                                                                                    <td >
                                                                                        <input id="rdoColorNO" name="rdoColor" runat="server" checked="true" type="radio" />
                                                                                        否&nbsp;&nbsp;
                                                                                        <input id="rdoColorYes" name="rdoColor" runat="server"  type="radio" />
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
                                                                                <tr id="soundfiles" style="display:none">
                                                                                    <td height="32" align="right" >
                                                                                        <strong>声音文件</strong>：
                                                                                    </td>
                                                                                    <td>
                                                                                       <div id="upWav"></div>
                                                                                        <div>
                                                                                            <span style="color: Red;">样本格式为mp3或wav，大小不超过5M</span></div>
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="soundfiles">
                                                                                    <td height="32" align="right">
                                                                                        <strong>商标描述类型：</strong></td>
                                                                                    <td valign="middle">
                                                                                          <asp:RadioButton ID="RadioButton1" runat="server" onclick="miaoshutype();" GroupName="aa"/>文字商标<asp:RadioButton ID="RadioButton2"
                                        runat="server" GroupName="aa" onclick="miaoshutype();" />图形商标<asp:RadioButton ID="RadioButton3" runat="server" GroupName="aa" onclick="miaoshutype();" />文字与图形商标</td>
                                                                                    <td valign="middle">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                                <tr id="soundfiles2">
                                                                                    <td height="32" align="right" >
                                                                                        <strong>商标描述：</strong></td>
                                                                                    <td valign="middle">
                                                                                       <input type="text" runat="server" id="t_SBmiaosu" class="font12000" maxlength="100" /></td>
                                                                                    <td valign="middle">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right">
                                                                                        <strong>商标说明</strong>：
                                                                                    </td>
                                                                                    <td valign="middle">
                                                                                        <textarea cols="20" rows="2" type="text" name="s6" id="txt_remark" style="width: 293px;
                                                                                            height: 180px;" class="font12000" maxlength="180" runat="server"  onblur="check_ApplyUser('remark_div')" ></textarea>
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
                                                                                        <input id="sortarr" type="text" runat="server" readonly="readonly" class="font12000" onblur="check_ApplyUser('sortarr_div')" onclick="showGoods()"/>
                                                                                         <input type="hidden" id="sortGoods" runat="server"/>
                                                                                    </td>
                                                                                    <td align="left">
                                                                                        <span class="status error" id="sortarr_div_error"></span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" valign="middle">
                                                                                        &nbsp;</td>
                                                                                    <td valign="middle">
                                                                                        &nbsp;</td>
                                                                                    <td valign="middle">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td align="center"><div id="goodsCalcInfo"></div></td>
                                                                    </tr>
                                                                    <tr><td align="center">
                                                                       <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0" id="th_table">
                                                                        <tr id="th_box">
                                                                         <td width="58" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">序号</td>
                                                                          <td width="78" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</td>
                                                                          <td width="108" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类似群</td>
                                                                          <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品编码</td>
                                                                          <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品名称</td>
                                                                           <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">操作</td>
                                                                        </tr>
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
                                                                                    <td style="height: 50px; width: 276px;" align="center">
                                                                                        <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" />
                                                                                        <br />
                                                                                        图样1
                                                                                    </td>
                                                                                    <td>
                                                     <p>                             

                                                        <div id="addpicture">  </div>  
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
                                                                        <td style="height: 50px; width: 276px;" align="center">
                                                                            <asp:Image ID="Image2" runat="server" Width="150px" Height="150px" />
                                                                            <br />
                                                                            图样2
                                                                        </td>
                                                                        <td>
                                                                        <div id="addpicture2">  </div>  
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
                                                                </td></tr>
                                                                </table>
                            </td>
                            </tr>
                            <tr>
                            <td colspan="2">
                              <table  width="689" border="0" cellspacing="0" cellpadding="0">
                                                                           <tr> <th> 其它信息
                                                                          </th>
                                                                          </tr>
                                                                           <tr> 
                                                                           <td >
                                                                           <table>
                                                                           <tr><td height="32" width="276" align="right"><strong>商标注册申请书：</strong></td>
                                                                           <td></td></tr>
                                                                           <tr><td height="32" width="276" align="right"><strong>商标申请委托书：</strong></td>
                                                                           <td>&nbsp;</td></tr>
                                                                           <tr><td height="32" width="276" align="right"><strong>商标续展申请书：</strong></td>
                                                                           <td>&nbsp;</td></tr>
                                                                           <tr><td height="32" width="276" align="right"><strong>商标续展委托书：</strong></td>
                                                                           <td>&nbsp;</td></tr>
                                                                           <tr><td height="32" width="276" align="right">&nbsp;</td>
                                                                           <td> <asp:CheckBox ID="cb_Show" runat="server" />
                                是否显示&nbsp;&nbsp;
                                <asp:CheckBox ID="cb_ReceiveEmail" runat="server" Checked="true" />
                                是否接受邮件期限提醒</td></tr>
                                                                           <tr><td height="32" width="276" align="right">备注：</td>
                                                                           <td> 
                                                                               <asp:TextBox ID="t_Remark" runat="server"  style="width: 293px;
                                                                                            height: 180px;" class="font12000" maxlength="180" 
                                                                                   TextMode="MultiLine" ></asp:TextBox>
                                                                               </td></tr>
                                                                           <tr>
                                                                              <td colspan="2">  
                                                                                  <div class="list-div" id="Div1" style="width:689px">
                                                                                    <table cellspacing='1' cellpadding='3' id="tblData" width="669px">
                                                                                        <tr>
                                                                                            <th width="2%"></th>
                                                                                            <th width="10%">账单号</th>
                                                                                            <th width="10%">添加时间</th>
                                                                                               <th width="10%">收款时间</th>
                                                                                                  <th width="10%">缴费时间</th>
                                                                                                     <th width="10%">发送时间</th>  
                                                                                                      <th width="10%">收据时间</th>  
                                                                                                       <th width="12%">备注1</th> 
                                                                                                       <th width="12%">备注2</th>
                                                                                            <th width="5%">操作</th>
                                                                                        </tr>
                                                                                        <asp:Repeater ID="reptlist" runat="server" >
                                                                                            <ItemTemplate>
                                                                                                <tr>
                                                                                                    <td height="26" align="center">
                                                                                                    <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>'  /></td>
                                                                                                    <td align="center">
                                                                                                      <input type="text"  id='txt_orderNum<%# Eval("i_Id")%>' class="inputs110text"  value='<%#Eval("nvc_OrderNum")%>'/>
                                                                                                    </td>
                                
                                                                                                    <td align="center">
                                                                                                       <input type="text"  id='dt_addtime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_AddOrderTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center">
                                                                                                      <input type="text"  id='dt_shoutime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_ShouKuanTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center">
                                                                                                      <input type="text"  id='dt_jiaofeitime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_JiaoFeiTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center">
                                                                                                      <input type="text"  id='dt_sendtime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_SendInfoTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center">
                                                                                                     <input type="text"  id='dt_shoujutime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_KaiJuTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center">
                                                                                                     <input type="text"  id='t_info1<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info1") %>'/>
                                                                                                    </td>
                                                                                                       <td align="center">
                                                                                                     <input type="text"  id='t_info2<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info2") %>'/>
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
                                                                                                      <input type="text" onblur="bb();"  name='txt_orderNum' class="inputs110text"  value=''/>
                                                                                                    </td>
                                
                                                                                                    <td align="center" width="10%">
                                                                                                       <input type="text"  name='dt_addtime' class="inputs110text" value=''  readonly="readonly"  style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                                                                                                    </td>
                                                                                                       <td align="center" width="10%">
                                                                                                      <input type="text"  name='dt_shoutime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center" width="10%">
                                                                                                      <input type="text"  name='dt_jiaofeitime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center" width="10%">
                                                                                                      <input type="text"  name='dt_sendtime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center" width="10%">
                                                                                                     <input type="text"  name='dt_shoujutime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                                                                                                    </td>
                                                                                                       <td align="center" width="10%">
                                                                                                     <input type="text"  name='t_info1' class="inputs130text" value='' />
                                                                                                    </td>
                                                                                                       <td align="center" width="10%">
                                                                                                     <input type="text"  name='t_info2' class="inputs130text" value=''/>
                                                                                                    </td>
                                                                                                    <td align="center" width="5%">
                             
                                                                                                    </td>
                                                                                                </tr>
                                                                                    </table>
                                                                                    <table cellspacing='1' cellpadding='3'>
                                                                                        <tr >
                                                                                            <td height="25" width="40%" align="right"> 
                                                                          <input type="hidden" id="hidNum" name="hidNum" value="0" /> 
                                                                         <input type="button" id="btnAdd" runat="server" class="button" style="display:none;" value="增加一条明细" />
                                                                            </td> <td align="left">&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table cellspacing='1' cellpadding='3'>
                                                                                        <tr align="left">
                                                                                            <td height="25"><input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value=''
                                                                                             />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
                  
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
                    <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px;background: #dfeef5;">
                        <%--     <input type="button" title="修改" class="inputicoeditbutton" />
                                                                        --%>
                       <asp:Button ID="btOK" runat="server" Text="提交" class="button" OnClick="btOK_Click"
                                        OnClientClick="return checkaddnews();return dalclick();" style="margin-left:350px;" />
                        <%-- <asp:Button ID="Btn_Update" runat="server" Text="修改" CssClass="button" CommandName='<%#Eval("i_Id") %>'  OnCommand='Edit'/>--%>                          <%--     <input type="button" title="修改" class="inputicoeditbutton" />
                                                                        --%><input type="button" id="Button3" value="返回" class="button" style="display:none"
                                          onclick="javascript:window.location='Shop_M_Trademark.aspx?<%=returnurl %>';" />
                                          <%-- <asp:Button ID="Btn_Update" runat="server" Text="修改" CssClass="button" CommandName='<%#Eval("i_Id") %>'  OnCommand='Edit'/>--%>
                    </div>    
        </div>
        	<div class="ui-tabs-panel ui-tabs-hide">
                2
			</div>
            <div class="ui-tabs-panel ui-tabs-hide">
                <form id="questionform" name="TourExForm" novalidate="novalidate">
                <table width="90%"><tr><td valign="middle" align="right"><b>留言内容：</b></td>
                     <td align="left"> <textarea name="Questions" id="Questions" class="area" maxlength='200'
                                    style="height:80px;width:100%" ></textarea>
                      </td>
                      <td align="center" width="150px"> <p style="padding: 6px 0;">
                         <input name="submit1" id="submit1" type="submit" class="subBtn" value="提交"/></p>
                      <p  style="padding: 6px 0;">字数必须小于200字</p>
                      </td>
                     </tr>
                    </table>
								<div class="btn">
								
								</div>
			   </form>
			</div>
        </div>
    <div id="div_a" runat="server"></div>
    </form>
   
</body>
</html>

<script type="text/javascript">
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
            if (datanum[i].value == "") {
                alert("请填写账单号");
                return false;
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "../Shop_A_DataOrder.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=SbDataNum&data=" + datanum[i].value,
                    success: function (msg) {
                        if (msg == "0") {
                            alert("账单号重复！");
                            return false;
                        }
                    }
                });
            }
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
       // return true;
    }


</script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#btnAdd").click(function () {
            if (dalclick()) {
                var num = $("#hidNum").val(); //
                num = parseInt(num);
                num++; //点击自加
                $("#hidNum").val(num); //重新赋值          
                $("#tRow0").clone(true).attr("id", "tRow" + num).appendTo("#tblData"); //clone tr 并重新给定ID,装到table
                $("#tRow" + num + " td").each(function () {//循环克隆的新行里面的td
                    $(this).find("input[type='text']").val(""); //清空克隆行的数据
                });
            }
        });

    });
</script>
<script type="text/javascript">
    function SelAll() {
        var inputs = document.getElementsByTagName("inputPageid");
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
            url: "Shop_A_DataOrder.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=dataOrder&id=" + obj + "&data=" + datastr,
            success: function (msg) {
                //alert(msg);
                if (msg == "ok") {
                    alert("修改成功");
                }
                if (msg == "0") {
                    alert("账单号重复！");
                }
            }
        });
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
                   alert("该客户信息填写不完整！");cb1.checked = false;
               }
           } else {
               document.getElementById("t_sbregname").value ="";
               document.getElementById("t_sbregaddress").value ="";
               document.getElementById("t_sbregyouzheng").value ="";
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