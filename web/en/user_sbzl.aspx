﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbzl.aspx.cs" Inherits="user_sbzl" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%=TitleOrKeyword %>
    <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <link href="jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #mails
        {
            width: 282px;
            list-style-image: none;
            padding-left: 0px;
        }
        #mails li
        {
            line-height: 22px;
            width: 282px;
        }
        #mailsadd
        {
            width: 100%;
            list-style-image: none;
            padding-left: 0px;
        }
        div.msg-div
        {
            padding: 10px;
        }
        div.msg-div p
        {
            padding: 0px;
            margin: 5px 0 0 0;
        }
        div.msg-div .field
        {
            padding: 0px;
        }
        div.msg-div .field textarea
        {
            width: 90%;
            height: 50px;
            resize: none;
            font-size: 12px;
        }
        .errorBlock
        {
            background-color: #FFC6A5;
            border: solid 1px #ff0000;
            color: #ff0000;
            margin: 10px 10px 0 10px;
            padding: 7px;
            font-weight: bold;
        }
        .style1
        {
            width: 201px;
        }
    </style>
</head>
<body id="index" onload="Disentend();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input type="hidden" id="Hi_MemberId" runat="server" value="" />
    <input id="hi_guoji" type="hidden" runat="server" value="0" />
    <input id="hi_usertype" type="hidden" runat="server" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="68" runat="server" />
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
                                    <td width="38" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="701">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">&nbsp;
                                        
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">Front page</a>&nbsp;&gt;&gt;&nbsp;User Center&nbsp;&gt;&gt;&nbsp;My
                                        information center&nbsp;&gt;&gt;&nbsp;Modify information
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="691">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">&nbsp;
                                        
                                    </td>
                                    <td align="left" valign="top">
                                        <table width="671" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="26" align="left" valign="top">
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="145" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="130" align="center" class="font12bt">
                                                                            Modify information
                                                                        </td>
                                                                        <td width="5">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <!--************************************************************-->
                                                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="238" height="32" align="right">
                                                                <strong>User ID：</strong>
                                                            </td>
                                                            <td width="433" align="left">
                                                                <%= userbianhao %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="238" height="32" align="right">
                                                                <strong>Username：</strong>
                                                            </td>
                                                            <td width="433" align="left">
                                                                <%= UserName%>
                                                            </td>
                                                        </tr>
                                                        <%if (usertype == 2)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Name of company：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_company" class="font12000"
                                                                    maxlength="100" runat="server" /><%if (guoji != 1 && usertype == 2)
                                                                                                      { %><%} %><% else 
                                                                                                      {%><span style="color: Red;">*</span>
                                                                    <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="validate11"
                                                                    ControlToValidate="c_company" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_c_company" style="display: none"><img src='images/tOk.gif' /></span><%} %>
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <%if (guoji != 1 && usertype == 2)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Name of company（English）：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_companyEn" 
                                                                    class="font12000" maxlength="100" runat="server" /><span style="color: Red;">*</span>
                                                                    <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="validate22"
                                                                    ControlToValidate="c_companyEn" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_c_companyEn" style="display: none"><img src='images/tOk.gif' /></span></td>
                                                        </tr>
                                                        <%} %>
                                                        <%if (usertype == 3)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Name of agency：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_dailiName" class="font12000" maxlength="30" runat="server" /><span style="color: Red;">*</span>
                                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate1"
                                                                    ControlToValidate="c_dailiName" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_dailiName" style="display: none"><img src='images/tOk.gif' /></span>
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Nationality：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="Drp_GuoJi" runat="server" AutoPostBack="True" Enabled="false">
                                                                </asp:DropDownList>
                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="238" height="32" align="right">
                                                                <strong>Contact person Name：</strong>
                                                            </td>
                                                            <td width="433" align="left">
                                                                <input type="text" name="s10" id="c_Name" class="font12000"
                                                                    maxlength="20" runat="server" /><%if (guoji != 1 && usertype != 3)
                                                                                                      { %><%} %><% else 
                                                                                                      {%><span style="color: Red;">*</span>
                                                                <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate2"
                                                                    ControlToValidate="c_Name" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_c_Name" style="display: none"><img src='images/tOk.gif' /></span><%} %>
                                                            </td>
                                                        </tr>
                                                        <%if (guoji != 1 && usertype != 3)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Contact person Name（English）：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_NameEn" class="font12000" maxlength="100" runat="server" /><span style="color: Red;">*</span>
                                                                <asp:CustomValidator ID="CustomValidator9" runat="server" ClientValidationFunction="validate222"
                                                                    ControlToValidate="c_NameEn" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_c_NameEn" style="display: none"><img src='images/tOk.gif' />
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <%if (guoji == 1 && usertype == 1)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>ID card number：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_Idcard" class="font12000"
                                                                    maxlength="18" runat="server" /><span style="color: Red;">*</span>
                                                                <asp:CustomValidator ID="CustomValidator7" runat="server" ClientValidationFunction="validate111"
                                                                    ControlToValidate="c_Idcard" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_c_Idcard" style="display: none"><img src='images/tOk.gif' /></span>
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <%if (guoji == 0 && usertype == 1)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Valid certification：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_youxiao" class="font12000"
                                                                    maxlength="50" runat="server" /><span style="color: Red;">*</span>
                                                                    <asp:CustomValidator ID="CustomValidator10" runat="server" ClientValidationFunction="validate112"
                                                                    ControlToValidate="c_youxiao" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_c_youxiao" style="display: none"><img src='images/tOk.gif' /></span>
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Contact personTel：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="text_Call" id="text_Call"
                                                                    runat="server" class="font12000" maxlength="50" /><span style="color: Red;">*</span>
                                                                <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="validate3"
                                                                    ControlToValidate="text_Call" ValidateEmptyText="true" Display="Dynamic" ValidationGroup="a" SetFocusOnError="true"></asp:CustomValidator><span id="s_text_Call" style="display: none"><img src='images/tOk.gif' /></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Contact person Fax：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" id="text_chuanzhen" runat="server"
                                                                    maxlength="15" class="font12000" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Contact personAddress：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <textarea rows="2" name="s6" id="text_Address"
                                                                    style="width: 300px; height: 40px;" class="font12000" maxlength="250" runat="server"> </textarea>
                                                                
                                                            </td>
                                                        </tr>
                                                        <%if (guoji != 1 && usertype != 3)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Contact person Address（EngLish）：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <textarea rows="2" name="s6" id="c_addressEn"
                                                                    style="width: 300px; height: 40px;" class="font12000"
                                                                    maxlength="150" runat="server"> </textarea>
                                                                
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Contact person zip code：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_youbian" class="font12000" maxlength="6"
                                                                    runat="server" />
                                                            </td>
                                                        </tr>
                                                        <%if (guoji == 1)
                                                          { %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>QQ：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="text_QQ" id="text_QQ" onkeyup="value=value.replace(/\D/g,'')"
                                                                    runat="server" class="font12000" maxlength="15" />
                                                            </td>
                                                        </tr>
                                                        <%}
                                                          else
                                                          {%>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>MSN：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" id="text_msn" name="text_msn" runat="server" class="font12000"
                                                                    maxlength="30" onpaste="return false"  />
                                                            </td>
                                                        </tr>
                                                        <%} %>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Mobile phone：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <input type="text" name="s8" id="c_phone"
                                                                    class="font12000" maxlength="50" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                              <td height="32" align="right"><strong>开启到期短信提醒：</strong> </td>
                              <td align="left">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1">  是  </asp:ListItem>
                                  <asp:ListItem Value="0">  否  </asp:ListItem>
                                </asp:RadioButtonList>
                              </td>
                            </tr>--%>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>E-mail：</strong>
                                                            </td>
                                                            <td align="left">
                                                                <table width="282" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="201" align="left" class="style1">
                                                                            <input type="text" name="text_Email" id="text_Email" runat="server" maxlength="80"
                                                                                class="font12000" onblur="ClientValidateEmail();" /><span style="color: Red;" id="text_Email1">*</span>
                                                                        </td>
                                                                        <td width="81" align="left">
                                                                            <img id="mail_add_show" src="images/addmail.jpg" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                            </td>
                                                            <td align="left">
                                                                <ul id="mails">
                                                                </ul>
                                                                <%--<ul id="mailsadd">
                                  <li>
                                    <input type="text" name="txt_addmail" id="txt_addmail" maxlength="60" class="font12000 tooltip" tips="输入关联E-mail,点击增加后提交，如:123@163.com" />
                                    <a href="javascript:void(0);" onclick="addmail()"></a></li>
                                </ul>--%>
                                                                <input type="text" name="text_BYEmail" id="text_BYEmail" runat="server" style="display: none;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 50px;" align="right" valign="top" style="line-height:20px;">
                                                                <strong>Certificate of Subject Qualification：</strong>
                                                            </td>
                                                            <td valign="top" style="line-height:20px;">
                                                                <%=zhutiwenjian %>
                                                                <asp:FileUpload ID="FileUpload3" runat="server"  Width="150px"/>
                                                                <%--<asp:FileUpload ID="FileUpload3" runat="server" onchange="document.getElementById('txtfile').value = document.getElementById('FileUpload3').value;"
                                                                    Style="display: none;" />
                                                                <asp:TextBox ID="txtfile" runat="server" ReadOnly="true"></asp:TextBox>
                                                                <input type="button" value="Brow" onclick="document.getElementById('FileUpload3').click();" />--%>
                                                                <br><span style="color: Red;">Document format is .jpg, .gif, .png and .pdf,
                                                                    no large than 500K</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">&nbsp;
                                                                
                                                            </td>
                                                            <td align="left" valign="top">
                                                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="8" height="35">
                                                                        </td>
                                                                        <td width="95" align="left">
                                                                            <asp:ImageButton ID="Bt_Submit" ImageUrl="images/user_zl_b5.gif" runat="server" Text="确定"
                                                                                Width="85" Height="29" ValidationGroup="a" OnClick="Bt_Submit_Click" />
                                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                                <ContentTemplate>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                        <td width="108" align="left">
                                                                            <a href="javascript:form1.reset();">
                                                                                <%--<img src="images/user_js_b2.gif" width="86" height="27" />--%></a>
                                                                        </td>
                                                                        <td width="204" align="left">&nbsp;
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function Disentend() {
            document.getElementById("Drp_GuoJi").disabled = "disabled";
        }
        function ClientValidatePhone() {
            var id = $("#Hi_MemberId").val();
            var lname = $("#c_phone").val();
            var rand = Math.floor(Math.random() * 1000000);
            if (lname != "") {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "Handler.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
                    success: function (msg) {
                        if (msg == "1") {
                            alert("Mobile phone number has been registered！");
                            $("#c_phone").val("");
                            $("#c_phone").focus();
                            $("#c_phone1").html("<img  src='images/tError.gif' />");
                        }
                        else {
                            var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/; if (reg2.test($("#c_phone").val()) == false) {
                                $("#c_phone1").html("<img  src='images/tError.gif' />");
                            } else {
                                $("#c_phone1").html("<img  src='images/tOk.gif' />");
                            }
                        }
                    }
                });
            } else {
                $("#c_phone1").html("<img  src='images/tError.gif' />");
            }
        }
        function ClientValidateEmail() {
            var lname = $("#text_Email").val();
            var id = $("#Hi_MemberId").val();
            var rand = Math.floor(Math.random() * 1000000);
            if (lname != "") {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "Handler.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=email&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
                    success: function (msg) {
                        if (msg == "1") {
                            alert("E-mail has been registered！");
                            $("#text_Email").focus();
                        }
                        else {
                            $("#text_Email1").html("<img  src='images/tOk.gif' />");
                        }
                    }
                });
            } else {
                $("#text_Email1").html("<img  src='images/tError.gif' />");
            }
        }
        function checkOk(obj) {
            if ($("#" + obj).val() != "") {
                $("#" + obj + "1").html("<img  src='images/tOk.gif' />");
            }
            else {
                $("#" + obj + "1").html("<img  src='images/tError.gif' />");
            }
        }
        function checkOk1(obj) {

            if ($("#c_Idcard").val() != "") {
                var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;
                if (!partten.test($("#c_Idcard").val())) {
                    $("#" + obj + "1").html("<img  src='images/tError.gif' />");
                }
                else {
                    $("#" + obj + "1").html("<img  src='images/tOk.gif' />");
                }
            }

            if ($("#text_Call").val() != "") {
                var reg4 = /^(\d{3,4}-)?\d{7,8}$/;
                if (!reg4.test($("#text_Call").val())) {
                    $("#" + obj + "1").html("<img  src='images/tError.gif' />");
                }
                else {
                    $("#" + obj + "1").html("<img  src='images/tOk.gif' />");
                }
            }
        }
    </script>
    <%--<script src="js/checksb_zl.js" type="text/javascript"></script>--%>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    <div id="div_a" runat="server">
    </div>
    </form>
</body>
</html>
<script src="js/js.js" type="text/javascript"></script>
<script src="js/tooltips.js" type="text/javascript"></script>
<script type="text/javascript">
    //自定义trim()方法去除字串左右杂质   
    String.prototype.Trim = function (Useless) {
        //eval函数转换字符串形式的表达式    
        var regex = eval("/^" + Useless + "*|" + Useless + "*$/g");
        return this.replace(regex, "");
    }
    //自定义lTrim()方法去除字串左侧杂质   
    String.prototype.lTrim = function (Useless) {
        var regex = eval("/^" + Useless + "*/g");
        return this.replace(regex, "");
    }
    //自定义rTrim()方法去除字串右侧杂质   
    String.prototype.rTrim = function (Useless) {
        var regex = eval("/" + Useless + "*$/g");
        return this.replace(regex, "");
    }   
</script>
<script type="text/javascript">
    //关联E-mail
    var regVmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/

    function removemail(mail) {
        var mails = "|" + $("#text_BYEmail").val().Trim("\\|") + "|";
        mails = mails.replace("|" + mail + "|", "|").Trim("\\|");
        $("#text_BYEmail").val(mails);
        bindmail();
    }
    function bindmail() {
        var mails = $("#text_BYEmail").val().split("|");
        var html = "";
        $.each(mails, function (i, item) {
            if (item != "") {
                html += '<li class="mail"><table width="282" border="0" cellspacing="0" cellpadding="0"><tr><td width="201" height="22" align="left">' + item + '</td><td width="81" align="left"><a href="javascript:void(0);" onclick="removemail(\'' + item + '\')">Delete</a></td></tr></table></li>'; ;
            }
        });
        $("#mails").html(html);
    }
    bindmail();
</script>
<script type="text/javascript">
    $("#mail_add_show").click(function () {
        var html1 = '<div class="msg-div">' +
                '<p></p><div class="field">E-mail：' +
                '<input type="text" name="txt_addmail" id="txt_addmail" maxlength="60" class="font12000 tooltip" tips="Enter the related E-mail, click Add after submitting, as: 123@163.com" />' +
                '</div><div class="errorBlock" style="display: none;"></div>' +
                '</div>';

        var data = {};
        var states = {};

        states.state1 = {
            content: html1,
            buttons: { 'Submit': 1, 'Cancle': 0 },
            submit: function (v, h, f) {
                if (v == 0) {
                    return true; // close the window
                }
                else if (v == 1) {
                    h.find('.errorBlock').hide('fast', function () { $(this).remove(); });
                    data.txt_addmail = f.txt_addmail; //或 h.find('#amount').val();  
                    var mail = $("#txt_addmail").val();
                    var mails = "|" + $("#text_BYEmail").val().Trim("\\|") + "|";
                    if (mail == "") {
                        $('<div class="errorBlock" style="display: none;">Please enter E-mail！</div>').prependTo(h).show('fast');
                        return false;
                    } else if (!regVmail.test(mail)) {
                        $('<div class="errorBlock" style="display: none;">E-mail not in the correct format！</div>').prependTo(h).show('fast');
                        return false;
                    } else if (mails.indexOf("|" + mail + "|") >= 0) {
                        $('<div class="errorBlock" style="display: none;">E-mail already exists in the list！</div>').prependTo(h).show('fast');
                        return false;
                    } else {
                        mails += mail + "|";
                        $("#text_BYEmail").val(mails.Trim("\\|"));
                        $("#txt_addmail").val("");
                        bindmail();
                        return true;
                    }
                }
            }
        }
        $.jBox.open(states, 'Add the linked E-mail', 360, 'auto');
    });
 
</script>
<script type="text/javascript">
    var gj = $("#hi_guoji").val();
    var ut = $("#hi_usertype").val();
    function validate1(source, arguments) {
        if (ut == "3") {
            if (arguments.Value != "") {
                $("#s_dailiName").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_dailiName").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate2(source, arguments) {
        if (ut == "3" || ut == "2" || ut == "1") {
            if (arguments.Value != "") {
                $("#s_c_Name").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_c_Name").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate3(source, arguments) {
        if (ut == "3" || ut == "2" || ut == "1") {
            if (arguments.Value != "") {
                $("#s_text_Call").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_text_Call").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate4(source, arguments) {
        if (ut == "3" || ut == "2" || ut == "1") {
            if (arguments.Value != "") {
                $("#s_text_Address").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_text_Address").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate5(source, arguments) {
        if (ut == "3" || ut == "2" || ut == "1") {
            if (arguments.Value != "") {
                $("#s_c_youbian").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_c_youbian").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate11(source, arguments) {
        if (ut == "2") {
            if (arguments.Value != "") {
                $("#s_c_company").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_c_company").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate22(source, arguments) {
        if (ut == "2" && gj == "0") {
            if (arguments.Value != "") {
                $("#s_c_companyEn").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_c_companyEn").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate111(source, arguments) {
        if (ut == "1" && gj == "1") {
            if (arguments.Value != "") {
                var idcard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                if (!idcard.test($("#c_Idcard").val())) {
                    $("#s_c_Idcard").hide();
                    source.innerHTML = "<img src='images/tError.gif' />";
                    arguments.IsValid = false;
                }
                else {
                    $("#s_c_Idcard").show();
                    arguments.IsValid = true;
                }
            }
            else {
                $("#s_c_Idcard").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate112(source, arguments) {
        if (ut == "1" && gj == "0") {
            if (arguments.Value != "") {
                $("#s_c_youxiao").show();
                  arguments.IsValid = true;
            }
                else
            {
                $("#s_c_youxiao").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
    function validate222(source, arguments) {
        if (ut != "3" && gj == "0") {
            if (arguments.Value != "") {
                $("#s_c_NameEn").show();
                arguments.IsValid = true;
            }
            else {
                $("#s_c_NameEn").hide();
                source.innerHTML = "<img src='images/tError.gif' />";
                arguments.IsValid = false;
            }
        }
    }
</script>