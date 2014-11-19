<%@ Page Language="C#" AutoEventWireup="true" CodeFile="links.aspx.cs" Inherits="links" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
</head>
<body id="links">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="92" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td height="84" align="left" valign="top"><img src="images/link.gif" width="217" height="84" /> </td>
    </tr>
    <tr>
      <td height="48" align="left" valign="top">
        <table width="938" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="28">&nbsp; </td>
            <td width="906" height="27" align="left" valign="top" style="background-color: #f4f4f4;">
              <table width="906" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="174" height="27" align="center" bgcolor="<%=  ftype == "1" ? "#bf2831" : "#404040"%>"><a href="links.aspx?ftype=1" class="ac6">각국특허청</a> </td>
                  <td width="2"></td>
                  <td width="174" height="27" align="center" bgcolor="<%=  ftype == "2" ? "#bf2831" : "#404040"%>"><a href="links.aspx?ftype=2" class="ac6">각국상표국</a> </td>
                  <td width="2"></td>
                  <td width="174" height="27" align="center" bgcolor="<%=  ftype == "3" ? "#bf2831" : "#404040"%>"><a href="links.aspx?ftype=3" class="ac6">기타</a> </td>
                  <td width="380">&nbsp; </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="153" height="618" align="left" valign="top">
        <table width="153" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="14" align="left" valign="top">&nbsp; </td>
          </tr>
          <tr>
            <td width="201" height="376" align="left" valign="top" style="background-image: url(images/aboutus_left2.gif);">
              <asp:Repeater ID="Rpt_zhou" runat="server" OnItemDataBound="Rpt_zhou_ItemDataBound">
                <ItemTemplate>
                  <table width="153" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="45">&nbsp; </td>
                      <td width="90" height="18" align="left" valign="top" style="background-color: <%#Eval("i_Id").ToString()==qypid?"#d45156;":"#949293" %>">
                        <table width="90" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="16" height="18">&nbsp; </td>
                            <td width="69" align="left"><a href="links.aspx?qypid=<%#Eval("i_Id") %>&ftype=<%=ftype %>" class="ac2">
                              <%#Eval("nvc_krValue") %>
                            </a></td>
                          </tr>
                        </table>
                      </td>
                      <td width="18">&nbsp; </td>
                    </tr>
                    <tr <%#Eval("i_Id").ToString() == qypid ? "" : " style='display: none;'"%>>
                      <td colspan="3" align="left" valign="top">
                        <table width="153" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="8" colspan="3"></td>
                          </tr>
                          <tr>
                            <td width="45">&nbsp; </td>
                            <td width="90" height="18" align="left" valign="top">
                              <table width="90" border="0" cellspacing="0" cellpadding="0">
                                <asp:Repeater ID="Rpt_Country" runat="server">
                                  <ItemTemplate>
                                    <tr>
                                      <td width="16" height="18" class="line_link">&nbsp; </td>
                                      <td width="69" align="left" class="line_link"><a href="links.aspx?qypid=<%#Eval("i_Pid") %>&qyid=<%#Eval("i_Id") %>&ftype=<%=ftype %>" <%# Eval("i_Id").ToString()==qyid?"class='ac5'":"" %>>
                                        <%#Eval("nvc_krValue")%></a> </td>
                                    </tr>
                                  </ItemTemplate>
                                </asp:Repeater>
                              </table>
                            </td>
                            <td width="18">&nbsp; </td>
                          </tr>
                          <tr>
                            <td height="8" colspan="3"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" height="3"></td>
                    </tr>
                  </table>
                </ItemTemplate>
              </asp:Repeater>
            </td>
          </tr>
          <tr>
            <td align="left" valign="top">&nbsp; </td>
          </tr>
        </table>
      </td>
      <td width="848" align="left" valign="top">
        <table width="787" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="791" valign="top">
              <%if (AspNetPager1.RecordCount > 0)
                {%><div class="index_main5concen auto">
                  <%= html.ToString() %>
                </div>
              <%}
                else
                { %>
              상응한 내용이 없습니다！
              <%} %>
            </td>
          </tr>
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td height="18" align="center">
              <table class="aspnetpager" cellspacing="3" cellpadding="0">
                <tr>
                  <webdiyer:AspNetPager NumericButtonCount="5" ID="AspNetPager1" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="true" ShowPageIndex="true" runat="server" ShowFirstLast="true" FirstPageText="홈" LastPageText="끝페지로" PrevPageText="전으로" NextPageText="다음으로" ShowInputBox="Never" PageSize="12" SubmitButtonText="GO" TextAfterInputBox="페지" CustomInfoHTML="총 %PageCount% 페지 " CustomInfoTextAlign="Right" ShowCustomInfoSection="Right" SubmitButtonClass="button" ShowDisabledButtons="true">
                  </webdiyer:AspNetPager>
                  <td>총<%= AspNetPager1.PageCount%>페지 </td>
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
