<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentUpdatePwd.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>修改密码_账户中心_会员中心_专利系统_环球汇通</title>
<meta http-equiv="x-ua-compatible" content="ie=7" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body id="index">
  <form id="form1" runat="server">
  <input type="hidden" id="Hi_MemberId" runat="server" value="" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
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
        <uc1:patentleft ID="patentleft1" runat="server" />
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
                  <td align="left">首页 >> 专利系统 >> 会员中心 >> 账户中心 >> 修改密码</td>
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
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;
                                      
                                    </td>
                                    <td width="115" align="center" class="font12bt">
                                      修改密码
                                    </td>
                                    <td width="7">
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
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="238" height="32" align="right">
                                <strong>旧密码：</strong>
                              </td>
                              <td width="433" align="left">
                                <input runat="server" type="password" name="iptOldpwd" id="iptOldpwd" class="font12000"
                                  maxlength="50" />&nbsp;<span class="error">*</span>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="iptOldpwd" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right">
                                <strong>输入新密码：</strong>
                              </td>
                              <td align="left">
                                <input runat="server" type="password" name="iptNewpwd1" id="iptNewpwd1" class="font12000"
                                  maxlength="50" />&nbsp;<span class="error">*</span>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="iptNewpwd1" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right">
                                <strong>确认新密码：</strong>
                              </td>
                              <td align="left">
                                <input runat="server" type="password" name="iptNewpwd2" id="iptNewpwd2" class="font12000"
                                  maxlength="50" />&nbsp;<span class="error">*</span>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="iptNewpwd2" Display="Dynamic" SetFocusOnError="true" Text="请确认密码！"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ValidationGroup="a" ControlToValidate="iptNewpwd2" ControlToCompare="iptNewpwd1" Text="密码输入不一致！"></asp:CompareValidator>

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
                                      <asp:ImageButton ID="Bt_Submit" runat="server" Text="" ImageUrl="images/user_zl_b5.gif"
                                        ImageAlign="Top" Width="85" Height="29" ValidationGroup="a" OnClick="Bt_Submit_Click" />
                                    </td>
                                    <td width="108" align="left">
                                        <input id="Reset1" type="reset" value="" style="width: 86px; height: 27px; background-image: url(images/user_js_b2.gif); border: 0px; cursor:pointer;" />
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
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
