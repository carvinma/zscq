<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentAddressAdd.aspx.cs" Inherits="User_PatentAddressAdd" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title><%=PageType%>_Invoice delivery address_My information center_User Center_System of Patent Annuity Fee_Global Patent</title>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 108px;
        }
    </style>
</head>
<body id="index">
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
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
                  <td align="left"><a href="index.aspx">Front page</a> >> System of Patent Annuity Fee >> User Center >> My information center >> Invoice delivery address >> <%=PageType%>
                  </td>
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
                                    <td width="115" align="center" class="font12bt">
                                      <asp:Literal runat="server" ID="lit_type" Text="Add Address"></asp:Literal>
                                    </td>
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
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="223" height="32" align="right" class="style1"><strong><span style="color: #f00;">*</span>Recipient’s name：</strong> </td>
                              <td width="448" align="left">
                                <input runat="server" id="text_shouhuoren" type="text" class="font12000" maxlength="20">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="text_shouhuoren" Display="Dynamic" Text="Content cannot be null！"></asp:RequiredFieldValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>Regular E-mail：</strong> </td>
                              <td align="left">
                                <input class="font12000" maxlength="50" runat="server" id="text_dianziyoujian" type="text" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_dianziyoujian" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>Mobile phone：</strong> </td>
                              <td align="left">
                                <input runat="server" id="text_shoujihaoma" maxlength="11" class="font12000" type="text" />
                                
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_shoujihaoma" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" ValidationExpression="^1(3|5|8)\d{9}$">
                                </asp:RegularExpressionValidator>--%>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong><span style="color: #f00;">*</span>Fixed telephone：</strong> </td>
                              <td align="left">
                                <input runat="server" id="text_gudingdianhua" class="font12000" type="text" maxlength="20" />
                                <span>Format: region code-telephone number</span> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="text_gudingdianhua" Display="Dynamic" Text="Content cannot be null！"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>ZIP code：</strong> </td>
                              <td align="left">
                                <input class="font12000" runat="server" id="text_youzhengbianma" maxlength="6" type="text">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="text_youzhengbianma" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" ValidationExpression="^[1-9]\d*$">
                                </asp:RegularExpressionValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong><span style="color: #f00;">*</span>country：</strong> </td>
                              <td align="left"><span class="font12b4e">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                                  <ContentTemplate>
                                    <asp:DropDownList ID="ddl_guojia" runat="server">
                                    </asp:DropDownList>
                                   <%-- <asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
                                      <asp:ListItem Value="0">Please select省</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddl_shi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_shi_SelectedIndexChanged">
                                      <asp:ListItem Value="0">Please select市/区</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddl_qu" runat="server">
                                      <asp:ListItem Value="0">Please select区/县</asp:ListItem>
                                    </asp:DropDownList>--%>
                                    <asp:RequiredFieldValidator ID="Rfv_1" runat="server" ValidationGroup="a" ControlToValidate="ddl_guojia" Display="Dynamic" ErrorMessage="Please select a country!" InitialValue="0"></asp:RequiredFieldValidator>
                                  </ContentTemplate>
                                </asp:UpdatePanel>
                              </span></td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>Detailed address：</strong> </td>
                              <td align="left">
                                <input runat="server" id="text_shouhuodizhi" class="font12000" type="text" maxlength="250" style="width:300px;" /><br><span>Please enter the detailed address with no more than 50 characters</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="text_shouhuodizhi" Display="Dynamic" Text="Content cannot be null！">
                                </asp:RequiredFieldValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>Default：</strong> </td>
                              <td align="left">
                                <input type="checkbox" runat="server" id="ismr" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1">&nbsp; </td>
                              <td align="left" valign="top">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                      <asp:ImageButton ID="Bt_AddAddress" CssClass="button52_28" runat="server" Text="add" ValidationGroup="a" OnClick="Bt_AddAddress_Click" ImageUrl="images/user_zl_b5.gif" Width="88" Height="29" BorderWidth="0" />
                                    </td>
                                    <td width="108" align="left">&nbsp; </td>
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
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
