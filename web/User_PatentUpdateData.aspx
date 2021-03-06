﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentUpdateData.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>修改资料_账户中心_会员中心_专利系统_环球汇通</title>
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script src="jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
  <script src="jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
  <link href="jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    #mails { width: 282px; list-style-image: none; padding-left: 0px; }
    #mails li { line-height: 22px; width: 282px; }
    #mailsadd { width: 100%; list-style-image: none; padding-left: 0px; }
    div.msg-div { padding: 10px; }
    div.msg-div p { padding: 0px; margin: 5px 0 0 0; }
    div.msg-div .field { padding: 0px; }
    div.msg-div .field textarea { width: 90%; height: 50px; resize: none; font-size: 12px; }
    .errorBlock { background-color: #FFC6A5; border: solid 1px #ff0000; color: #ff0000; margin: 10px 10px 0 10px; padding: 7px; font-weight: bold; }
  </style>
</head>
<body id="index">
  <form id="form1" runat="server">
  <input type="hidden" id="Hi_MemberId" runat="server" value="" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <uc1:patentleft ID="patentleft1" runat="server" />
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp; </td>
                  <td width="701">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left">首页 >> 专利系统 >> 会员中心 >> 账户中心 >> 修改资料</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691">&nbsp; </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="115" align="center" class="font12bt">详细信息 </td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="top">
                          <!--************************************************************-->
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="238" height="32" align="right"><strong>用户名称：</strong> </td>
                              <td width="433" align="left">
                                <asp:Literal ID="ltl_name" runat="server"></asp:Literal>
                              </td>
                            </tr>
                            <tr>
                              <td width="238" height="32" align="right"><strong>用户编号：</strong> </td>
                              <td width="433" align="left">
                                <asp:Literal ID="ltl_number" runat="server"></asp:Literal>
                              </td>
                            </tr>
                            <tr>
                              <td width="238" height="32" align="right"><strong>用户等级：</strong> </td>
                              <td width="433" align="left">
                                <asp:Literal ID="ltl_grade" runat="server"></asp:Literal>
                              </td>
                            </tr>
                            <tr>
                              <td width="238" height="32" align="right"><strong>注册时间：</strong> </td>
                              <td width="433" align="left">
                                <asp:Literal ID="ltl_registertime" runat="server"></asp:Literal>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="115" align="center" class="font12bt">公司信息 </td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <!--************************************************************-->
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="238" height="32" align="right"><strong>客户名称：</strong> </td>
                              <td width="433" align="left">
                                <input type="text" name="text_RealName" id="text_RealName" runat="server" class="font12000" maxlength="20" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="text_RealName" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>英文名称：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_EnName" id="text_EnName" runat="server" class="font12000" maxlength="50" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_EnName" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[A-Z|a-z. ]+$">
                                </asp:RegularExpressionValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>所属国家：</strong> </td>
                              <td align="left">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                                  <ContentTemplate>
                                    <asp:DropDownList ID="ddl_guojia" runat="server" >
                                    </asp:DropDownList>
                                    <%--<asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
                                      <asp:ListItem Value="0">请选择省</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddl_shi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_shi_SelectedIndexChanged">
                                      <asp:ListItem Value="0">请选择市/区</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddl_qu" runat="server">
                                      <asp:ListItem Value="0">请选择区/县</asp:ListItem>
                                    </asp:DropDownList>--%>
                                    <asp:RequiredFieldValidator ID="Rfv_1" runat="server" ValidationGroup="a" ControlToValidate="ddl_guojia" Display="Dynamic" ErrorMessage="请选择国家!" InitialValue="0"></asp:RequiredFieldValidator>
                                  </ContentTemplate>
                                </asp:UpdatePanel>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>详细地址：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_Address" id="text_Address" runat="server" maxlength="250" class="font12000" style="width:300px;" /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="text_Address" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>邮政编码：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_ZipCode" id="text_ZipCode" runat="server" maxlength="6" class="font12000" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_ZipCode" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[1-9]\d*$">
                                </asp:RegularExpressionValidator>
                              </td>
                            </tr>
                            <tr>
                              <td align="right"><strong>公司主页：</strong> </td>
                              <td align="left">
                                <input type="text" id="text_HomePage" name="text_HomePage" runat="server" class="font12000" maxlength="50" />
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp; </td>
                      </tr>
                    </table>
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="115" align="center" class="font12bt">联系人信息 </td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <!--************************************************************-->
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                              <td width="238" height="32" align="right"><strong>姓名：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_LinkName" id="text_LinkName" runat="server" class="font12000" maxlength="20" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>性别：</strong> </td>
                              <td align="left">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1">  男  </asp:ListItem>
                                  <asp:ListItem Value="0">  女  </asp:ListItem>
                                </asp:RadioButtonList>
                              </td>
                            </tr>
                            <tr>
                              <td width="238" height="32" align="right"><strong>移动电话：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_Mobile" id="text_Mobile" runat="server" class="font12000" maxlength="50" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="text_Mobile" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_Mobile" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^1(3|5|8)\d{9}$">
                                </asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="text_Mobile" Display="Dynamic" SetFocusOnError="true" Text="手机号已被注册过！" ClientValidationFunction="ClientValidatePhone"></asp:CustomValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>固定电话：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_Call" id="text_Call" runat="server" class="font12000" maxlength="50" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>电子邮箱：</strong> </td>
                              <td align="left"><table width="282" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="201" align="left" class="style1"><input type="text" name="text_Email" id="text_Email" runat="server" maxlength="50" class="font12000" /></td>
    <td width="81" align="left"><img id="mail_add_show" src="images/addmail.jpg" /></td>
  </tr>
</table>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="text_Email" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_Email" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="text_Email" Display="Dynamic" SetFocusOnError="true" Text="邮箱已被注册过！" ClientValidationFunction="ClientValidateEmail"></asp:CustomValidator>
                              </td>
                            </tr>
                            <tr>
                              <td align="right"></td>
                              <td align="left">
                                <ul id="mails">
                                </ul>
                                <%--<ul id="mailsadd">
                                  <li>
                                    <input type="text" name="txt_addmail" id="txt_addmail" maxlength="60" class="font12000 tooltip" tips="输入关联邮箱,点击增加后提交，如:123@163.com" />
                                    <a href="javascript:void(0);" onclick="addmail()"></a></li>
                                </ul>--%>
                                <input type="text" name="text_BYEmail" id="text_BYEmail" runat="server" style="display: none;" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>传真：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_Fax" id="text_Fax" runat="server" maxlength="20" class="font12000" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>QQ：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_QQ" id="text_QQ" runat="server" class="font12000" maxlength="12" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_QQ" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[1-9][0-9]{4,}">
                                </asp:RegularExpressionValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>SKYPE：</strong> </td>
                              <td align="left">
                                <input type="text" name="text_Skype" id="text_Skype" runat="server" class="font12000" maxlength="20" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>MSN：</strong> </td>
                              <td align="left">
                                <input type="text" id="text_msn" name="text_msn" runat="server" class="font12000" maxlength="20" />
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp; </td>
                      </tr>
                    </table>
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="115" align="center" class="font12bt">权限设定</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <!--************************************************************-->
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="238" height="32" align="right"><strong>开启到期短信提醒：</strong> </td>
                              <td align="left">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="1">  是  </asp:ListItem>
                                  <asp:ListItem Value="0">  否  </asp:ListItem>
                                </asp:RadioButtonList>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp; </td>
                            </tr>
                            <tr>
                              <td height="32" align="right">&nbsp; </td>
                              <td align="left" valign="top">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                      <asp:ImageButton ID="Bt_Submit" ImageUrl="images/user_zl_b5.gif" runat="server" Text="确定" Width="85" Height="29" ValidationGroup="a" OnClick="Bt_Submit_Click" />
                                    </td>
                                    <td width="108" align="left"><a href="javascript:form1.reset();"><%--<img src="images/user_js_b2.gif" width="86" height="27" />--%></a> </td>
                                    <td width="204" align="left">&nbsp; </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp; </td>
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
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  <div id="div_a" runat="server">
  </div>
  <input type="hidden" id="hi_name" value="" />
  <input type="hidden" id="hi_phone" value="" />
  <input type="hidden" id="hi_email" value="" />
  </form>
</body>
</html>
<script type="text/javascript">
  function ClientValidatePhone(source, arguments) {
    var mid = $("#Hi_MemberId").val();
    var lname = $("#text_Mobile").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=phone&membertype=1&memberId=" + mid + "&uName=" + lname + "&n=" + rand,
      success: function (msg) {
        $("#hi_phone").val(msg);
      }
    });
    if ($("#hi_phone").val() == "1") {
      arguments.IsValid = false;
    }
    else {
      arguments.IsValid = true;
    }
  }
  function ClientValidateEmail(source, arguments) {
    var mid = $("#Hi_MemberId").val();
    var lname = $("#text_Email").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=email&membertype=1&memberId=" + mid + "&uName=" + lname + "&n=" + rand,
      success: function (msg) {
        $("#hi_email").val(msg);
      }
    });
    if ($("#hi_email").val() == "1") {
      arguments.IsValid = false;
    }
    else {
      arguments.IsValid = true;
    }
  }
</script>
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
  //关联邮箱
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
          html += '<li class="mail"><table width="282" border="0" cellspacing="0" cellpadding="0"><tr><td width="201" height="22" align="left">' + item + '</td><td width="81" align="left"><a href="javascript:void(0);" onclick="removemail(\'' + item + '\')">删除</a></td></tr></table></li>';
      }
    });
    $("#mails").html(html);
  }
  bindmail();
</script>
<script type="text/javascript">
  $("#mail_add_show").click(function () {
    var html1 = '<div class="msg-div">' +
                '<p></p><div class="field">邮箱：' +
                '<input type="text" name="txt_addmail" id="txt_addmail" maxlength="60" class="font12000 tooltip" tips="输入关联邮箱,点击增加后提交，如:123@163.com" />' +
                '</div><div class="errorBlock" style="display: none;"></div>' +
                '</div>';

    var data = {};
    var states = {};

    states.state1 = {
      content: html1,
      buttons: { '提交': 1, '取消': 0 },
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
            $('<div class="errorBlock" style="display: none;">请输入邮箱！</div>').prependTo(h).show('fast');
            return false;
          } else if (!regVmail.test(mail)) {
            $('<div class="errorBlock" style="display: none;">邮箱格式不正确！</div>').prependTo(h).show('fast');
            return false;
          } else if (mails.indexOf("|" + mail + "|") >= 0) {
            $('<div class="errorBlock" style="display: none;">邮箱已存在列表中！</div>').prependTo(h).show('fast');
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
    $.jBox.open(states, '添加关联邮箱', 360, 'auto');
  });
 
</script>
