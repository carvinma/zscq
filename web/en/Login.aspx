<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
  <asp:HiddenField ID="Hf_PageFlag" runat="server" />
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
                        <td align="left">&nbsp;<a href="index.aspx">Return to front page&gt;&gt;</a></td>
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
            <td width="260" height="308" align="left" valign="top" style="background-image: url(<%=pageflag%>);">
              <table width="464" height="119" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="85"></td>
                </tr>
                <tr>
                  <td width="68" height="33">&nbsp;</td>
                  <td width="396" align="left" valign="top">
                    <table width="395" height="121" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="87" height="32" class="font14">Username：</td>
                        <td width="189" align="left">
                          <input type="text" name="textfield" id="txt_username" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" value="<%=unvalue%>" onfocus="OnEnter(this)" onblur="OnExit(this)" tabindex="1" /></td>
                        <td width="119" align="left">&nbsp; </td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">Password ：</td>
                        <td align="left">
                          <input type="password" name="textfield" id="txt_userpassword" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="30" tabindex="2" /></td>
                        <td align="left"><a href="FindPwd.aspx?flag=<%=Hf_PageFlag.Value%>" class="ac7">Retrieve Password</a></td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">Code：</td>
                        <td colspan="2" align="left">
                          <table width="199" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="97" height="30" align="left">
                                <input type="text" name="textfield2" id="txt_code" style="width: 87px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="5" tabindex="3" />
                              </td>
                              <td width="102" align="left"><img src="v.aspx" id="img_regcheckcode" onclick="reloadcode('img_regcheckcode')" style="cursor: pointer; vertical-align: middle;" alt="Click to change" title="Click to change" /> </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="32">&nbsp;</td>
                        <td colspan="2">
                          <table width="244" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="150" height="30" align="left">
                                <input type="checkbox" name="checkbox" id="cb_remember" tabindex="4" />&nbsp;Remember Username </td>
                              <td width="94" align="left">
                                <input type="checkbox" name="checkbox2" id="cb_auto" tabindex="5" />&nbsp;Auto Login </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="32">&nbsp;</td>
                        <td align="left">
                        <img src="images/login.gif" width="147" height="22" border="0" onclick="user_login()" style="cursor: pointer;" />
                        </td>
                        <td>&nbsp;</td>
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
            <td height="291" align="left" valign="top" style="background-image: url(../<%=_Adv %>);">
              <table width="449" height="109" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="16"></td>
                </tr>
                <tr>
                  <td height="33">&nbsp;</td>
                  <td align="left" valign="top" style="line-height: 21px;">
                    <p>
                      <strong style="color: #fff;">Not HQHT user yet?</strong></p>
                    <p style="font-size: 12px; color: #fff;">
                      Please register HQHT user now and enjoy our <br />
                      professional services!</p>
                  </td>
                </tr>
                <tr>
                  <td height="15">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                </tr>
                <tr>
                  <td width="29" height="33">&nbsp;</td>
                  <td width="420" align="left"><a href="Register.aspx?flag=<%=Hf_PageFlag.Value%>" class="ac4">Go to register now&gt;&gt;</a></td>
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
  </form>
</body>
</html>
<script src="js/chy.js" type="text/javascript"></script>
<script language="javascript">
    function keydown(e) { var currKey = 0, e = e || event; if (e.keyCode == 13) user_login(); } document.onkeydown = keydown;   
</script>