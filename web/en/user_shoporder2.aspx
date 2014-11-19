<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shoporder2.aspx.cs" Inherits="user_shoporder2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>My order of gift exchange_Service Center_System of Reward Points Shop_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="Global patent Intellectual property annuity fee e-commerce platform" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script src="js/shopcart.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="70" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <uc1:zscq_sp_leftmenu ID="zscq_sp_leftmenu1" runat="server" />
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left"><a href="index.aspx">Front page</a>&nbsp;&gt;&gt;&nbsp;User Center&nbsp;&gt;&gt;&nbsp;Service Center&nbsp;&gt;&gt;&nbsp;My order of gift exchange&nbsp;&gt;&gt;&nbsp;Order submitted successfully</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp;</td>
                  <td width="691">&nbsp;</td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td width="691" align="left" valign="top">
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="107" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="255" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="11" height="20">&nbsp;</td>
                                    <td width="233" align="center" class="font12bt">Order submitted successfully</td>
                                    <td width="11"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle"><span class="ordertext">Your Order number：<span><%= OrderNo%></span>&nbsp;&nbsp;&nbsp;Total of reward points：<span class="font12ac5"><%=OrderMoney%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">User ID：<%= MNo%>
                                &nbsp;&nbsp;Username：<%=MName %>
                              </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">Submitted time：<%=OrderAddTime %>&nbsp;&nbsp;Order status：<%=OrderState %></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="right" valign="top">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="center" class="font12b4e">&nbsp;&nbsp;<a href="user_shopddck.aspx"><img src="images/user_zl_b7.gif" width="85" height="29" border="0" /></a>&nbsp;&nbsp;<a href="jifen.aspx"><img src="images/user_zl_b9.gif" width="145" height="29" border="0" /></a></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
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
  </form>
</body>
</html>
