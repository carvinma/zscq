<%@ Page Language="C#" AutoEventWireup="true" CodeFile="down.aspx.cs" Inherits="down" %>

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
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
</head>
<body id="services">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="60" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td height="84" align="left" valign="top"><img src="images/down1.gif" width="281" height="83" /> </td>
    </tr>
    <tr>
      <td height="48" align="left" valign="top">
        <table width="938" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="28">&nbsp; </td>
            <td width="906" height="27" align="left" valign="top" style="background-color: #f4f4f4;">
              <table width="906" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="174" height="27" align="center" bgcolor="<%= TypeId== 1 ? "#bf2831" : "#404040"%>"><a href="down.aspx?sid=1" class="ac6">Global Patent</a> </td>
                  <td width="2"></td>
                  <td width="174" height="27" align="center" bgcolor="<%= TypeId== 2 ? "#bf2831" : "#404040"%>"><a href="down.aspx?sid=2" class="ac6">Patent documents</a> </td>
                  <td width="2"></td>
                  <td width="174" height="27" align="center" bgcolor="<%= TypeId== 3 ? "#bf2831" : "#404040"%>"><a href="down.aspx?sid=3" class="ac6">Trademark documents</a> </td>
                  <td width="2"></td>
                  <td width="174" height="27" align="center" bgcolor="<%= TypeId== 4 ? "#bf2831" : "#404040"%>"><a href="down.aspx?sid=4" class="ac6">Others</a> </td>
                  <td width="204">&nbsp; </td>
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
      <td width="104" height="618" align="left" valign="top">&nbsp; </td>
      <td width="897" align="left" valign="top">
        <table width="787" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="791" height="584" valign="top">
              <%if (AspNetPager1.RecordCount > 0)
                { %>
              <div class="index_main5concena auto">
                <%=html.ToString()%>
              </div>
              <%} %>
              <%else
                { %>Failure of find the related contents
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
                  <webdiyer:AspNetPager NumericButtonCount="5" ID="AspNetPager1" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="true" ShowPageIndex="true" runat="server" ShowFirstLast="true" FirstPageText="Front page" LastPageText="Last page" PrevPageText="Previous page" NextPageText="Next page" ShowInputBox="Never" PageSize="12" SubmitButtonText="GO" TextAfterInputBox="page" CustomInfoHTML="Total %PageCount% page " CustomInfoTextAlign="Right" ShowCustomInfoSection="Right" SubmitButtonClass="button" ShowDisabledButtons="true">
                  </webdiyer:AspNetPager>
                  <td>Total<%= AspNetPager1.PageCount%>page </td>
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
