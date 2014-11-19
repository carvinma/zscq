<%@ Page Language="C#" AutoEventWireup="true" CodeFile="youhui.aspx.cs" Inherits="youhui" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    .style1 { height: 88px; }
    .style2 { height: 306px; }
    .style3 { height: 507px; }
    .style4 { height: 448px; }
  </style>
</head>
<body id="youhui">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="48" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" align="left" valign="top" style="background-image: url(images/youhui2.gif);">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="64" align="left" valign="top" style="background-image: url(images/jifen3.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="73" align="left" valign="top" style="background-image: url(images/aboutus_left2.gif);">
              <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#d34245">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="13">&nbsp; </td>
                        <td width="183" align="left"><a href="youhui.aspx" class="ac2">最新优惠</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td width="10">&nbsp; </td>
                  <td width="221" height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="13">&nbsp; </td>
                        <td width="183" align="left"><a href="jifen.aspx" class="ac2">积分商城</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="33"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=1"><img src="images/jifen7.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen7s.gif';" onmouseout="this.src='images/jifen7.gif';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=2"><img src="images/jifen8.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen8s.gif';" onmouseout="this.src='images/jifen8.gif';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=3"><img src="images/jifen9.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen9s.gif';" onmouseout="this.src='images/jifen9.gif';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td align="left" valign="top" class="style3">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="left" valign="top" style="background-image: url(images/aboutus_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="36">&nbsp; </td>
                  <td width="678">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;<a href="youhui.aspx">优惠活动</a>&nbsp;>>&nbsp;最新优惠 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td valign="top" class="style4">
              <table width="698" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="15">&nbsp; </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td height="29" colspan="2" align="center" style="font-size: 14px; font-weight: bold;">
                    <%=cname %>
                  </td>
                </tr>
                <tr>
                  <td width="61" height="15">&nbsp; </td>
                  <td width="637">&nbsp; </td>
                </tr>
                <tr>
                  <td class="style2">&nbsp; </td>
                  <td align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;" class="style2">
                    <%= content %>
                  </td>
                </tr>
                <tr>
                  <td class="style1">&nbsp; </td>
                  <td align="left" valign="top" class="style1">
                    <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="15"></td>
                        <td width="626"></td>
                      </tr>
                      <tr>
                        <td height="30" style="border-bottom: 1px solid #bf2831;">&nbsp; </td>
                        <td align="left" style="font-size: 14px; font-weight: bold; color: #d45156; border-bottom: 1px solid #bf2831;">往期优惠活动</td>
                      </tr>
                      <tr>
                        <td width="10" height="10"></td>
                        <td width="626"></td>
                      </tr>
                      <tr>
                        <td height="19">&nbsp; </td>
                        <td align="left" height="28">
                          <table width="605" border="0" cellspacing="0" cellpadding="0">
                            <asp:Repeater ID="Rpt_history" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td width="16" align="left">&nbsp;</td>
                                  <td width="449" height="25" align="left">·<a href="youhui.aspx?cid=<%#Eval("i_Id") %>" target="<%# string.IsNullOrWhiteSpace(Convert.ToString( Eval("nvc_TitleLink"))) ? "_self" : "_blank"%>"><%#Eval("nvc_Title")%></a></td>
                                  <td width="140" align="left">
                                    <%#Eval("dt_AddTime","{0:yyyy-MM-dd}")%></td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td width="10" height="10"></td>
                        <td width="626"></td>
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
  </form>
</body>
</html>
