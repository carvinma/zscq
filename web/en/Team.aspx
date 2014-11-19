<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Team.aspx.cs" Inherits="Team" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
</head>
<body id="about">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="59" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-color: #f5f5f5;">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="69" align="left" valign="top" style="background-image: url(images/aboutus1s.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="376" align="left" valign="top" style="background-image: url(images/aboutus_left2.gif);">
              <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="10">&nbsp; </td>
                  <td width="221" height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="AboutUs.aspx" class="ac2">Our History</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#d34245">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="###" class="ac2">Our Team</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="hezuo.aspx" class="ac2">Our Partner</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="ContactUs.aspx" class="ac2">Contact Us</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td align="left" valign="top"><img src="images/aboutus_p1.gif" width="260" height="199" /> </td>
          </tr>
        </table>
      </td>
      <td align="left" valign="top">
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
                  <td align="left"><a href="index.aspx">Front page</a>&nbsp;>>&nbsp;<a href="AboutUs.aspx">About Us</a>&nbsp;>>&nbsp;Our Team </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="539" valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="15">&nbsp; </td>
                  <td width="630">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                    <%if (AspNetPager1.RecordCount > 0)
                      { %>
                    <asp:Repeater ID="Rpt_List" runat="server">
                      <ItemTemplate>
                        <table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="157" align="left" valign="top"><img src="../<%#Eval("nvc_TitlePhoto") %>" width="126" height="155" /> </td>
                            <td width="473" align="left" valign="top">
                              <table width="473" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="23" align="left" valign="top"><strong>
                                    <%#Eval("nvc_Title") %></strong> </td>
                                </tr>
                                <tr>
                                  <td width="473" height="30" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                                    <%#Eval("nt_Content") %>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="2" height="40"></td>
                          </tr>
                        </table>
                      </ItemTemplate>
                    </asp:Repeater>
                    <%}
                      else
                      { %>
                    Failure of find the related contents
                    <%} %>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" height="19" align="right" valign="top">
                    <table class="aspnetpager" cellspacing="3" cellpadding="0">
                      <tr>
                        <webdiyer:AspNetPager NumericButtonCount="5" ID="AspNetPager1" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="true" ShowPageIndex="true" runat="server" ShowFirstLast="true" FirstPageText="Front page" LastPageText="Last page" PrevPageText="Previous page" NextPageText="Next page" ShowInputBox="Never" PageSize="5" SubmitButtonText="GO" TextAfterInputBox="page" CustomInfoHTML="Total %PageCount% page " CustomInfoTextAlign="Right" ShowCustomInfoSection="Right" SubmitButtonClass="button" ShowDisabledButtons="true">
                        </webdiyer:AspNetPager>
                        <td>Total<%= AspNetPager1.PageCount%>page </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left" valign="top"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
