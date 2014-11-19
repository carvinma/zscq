<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopLogin.aspx.cs" Inherits="ShopLogin" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <%= TitleOrKeyword %>
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
  <form id="form1" runat="server">
  <asp:HiddenField ID="Hf_Type" runat="server" />
  <asp:HiddenField ID="Hf_Href" runat="server" />
  <asp:HiddenField ID="Hf_Href2" runat="server" />
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;" height="112">
    <tr>
      <td height="127" valign="top" align="center">
        <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
          <tr>
            <td height="127" align="left" valign="top">
              <table width="915" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="667" height="52" align="left" valign="top">
                    <table width="200" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="103">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;<a href="index.aspx">返回首页&gt;&gt;</a></td>
                      </tr>
                    </table>
                  </td>
                  <td width="248" align="left" valign="top">
                    <table width="248" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="248" height="65" colspan="7"></td>
                      </tr>
                      <tr>
                        <td height="62" colspan="7" align="right" valign="top"><a href="index.aspx"><img src="images/logo1.gif" width="236" height="62" border="0" /></a></td>
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
  <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="466" height="308" align="left" valign="top">
        <table width="466" height="252" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="260" height="308" align="left" valign="top" style="background-image: url(images/shop_login2.gif);">
              <table width="464" height="119" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="85"></td>
                </tr>
                <tr>
                  <td width="68" height="33">&nbsp;</td>
                  <td width="396" align="left" valign="top">
                    <table width="372" height="121" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="72" height="32" class="font14" align="right">用户类型：</td>
                        <td colspan="2">
                          <table width="199" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="97" height="30" align="left">
                                <input type="radio" runat="server" name="type" id="rad_type_zl" checked="true" />专利用户 </td>
                              <td width="102" align="left">
                                <input type="radio" runat="server" name="type" id="rad_type_sb" />商标用户 </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td width="72" height="32" class="font14" align="right">手机号码：</td>
                        <td width="200" align="left">
                          <input type="text" runat="server" id="txt_username" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" value="" /></td>
                        <td width="100" align="left">
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_username" ErrorMessage="请输入手机号" Display="Dynamic"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator runat="server" ValidationExpression="^1((3[0-9])|(4[5-7])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$" ControlToValidate="txt_username" ErrorMessage="手机号码格式不正确" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                      </tr>
                      <tr>
                        <td height="32" class="font14" align="right">密码：</td>
                        <td align="left">
                          <input type="password" runat="server" id="txt_userpassword" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="30" /></td>
                        <td align="left">
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_userpassword" ErrorMessage="请输入密码" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                      </tr>
                      <tr>
                        <td height="32" class="font14" align="right">验证码：</td>
                        <td align="left">
                          <table width="199" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="97" height="30" align="left">
                                <input type="text" runat="server" id="txt_code" style="width: 87px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="5" />
                              </td>
                              <td width="102" align="left"><img src="v.aspx" id="img_regcheckcode" onclick="reloadcode('img_regcheckcode')" style="cursor: pointer; vertical-align: middle;" alt="点击更换" title="点击更换" /> </td>
                            </tr>
                          </table>
                        </td>
                        <td align="left">
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_code" ErrorMessage="请输入验证码"></asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
                        <td height="32">&nbsp;</td>
                        <td align="left">
                          <asp:ImageButton ID="Ibtn_Login" runat="server" ImageUrl="images/login.gif" Width="147" Height="22" BorderWidth="0" OnClick="Ibtn_Login_Click" />
                        </td>
                        <td align="left"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td width="449" align="left" valign="top">
        <table width="449" height="308" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="9" align="left" valign="top"><img src="images/login3.gif" width="449" height="9" /></td>
          </tr>
          <tr>
            <td height="291" align="left" valign="top" style="background-image: url(<%=_Adv %>);">
              <table width="449" height="109" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="16"></td>
                </tr>
                <tr>
                  <td height="33">&nbsp;</td>
                  <td align="left" valign="top" style="line-height: 21px;"></td>
                </tr>
                <tr>
                  <td height="15">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                </tr>
                <tr>
                  <td width="29" height="33">&nbsp;</td>
                  <td width="420" align="left">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="8" align="left" valign="top"><img src="images/login5.gif" width="449" height="8" /></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
