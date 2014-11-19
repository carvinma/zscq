<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <script src="js/jquery-1.8.0.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
</head>
<body id="services">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="60" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="468" align="left" valign="top" style="background-color: #f5f5f5;">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="69" align="left" valign="top" style="background-image: url(images/server1.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="376" align="left" valign="top" style="background-image: url(images/server2.gif);">
              <asp:Repeater runat="server" ID="Rpt_Sort" OnItemDataBound="Rpt_Sort_ItemDataBound">
                <ItemTemplate>
                  <table class="cctable" width="260" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="10">&nbsp; </td>
                      <td width="221" height="22" bgcolor="<%# IsSort(Eval("i_Id"))?"#d34245":"#949293" %>">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                          <tr <%# GetCount(Eval("i_Id")) > 0?" onclick=\"showbox("+Eval("i_Id")+")\"":"" %> style="cursor: pointer;">
                            <td width="25" height="22">&nbsp;</td>
                            <td width="196" align="left">
                              <%# GetCount(Eval("i_Id")) > 0 ? "<a href=\"javascript:void(0)\" class=\"ac2\">" + Eval("nvc_Name") + "</a>" : "<a href=\"Services.aspx?sid=" + Eval("i_Id") + "&flag=1\" class=\"ac2\">" + Eval("nvc_Name") + "</a>"%>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td width="29">&nbsp; </td>
                    </tr>
                    <tr id="cctr<%#Eval("i_Id") %>" <%#IsSort(Eval("i_Id"))?"class='ccon'":"class='ccclose'" %> flag="<%# GetCount(Eval("i_Id"))>0?1:0 %>">
                      <td align="left" valign="top">&nbsp; </td>
                      <td align="left" valign="top" style="background-color: #f4f4f4;">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="8" colspan="3"></td>
                          </tr>
                          <tr>
                            <td width="57">&nbsp; </td>
                            <td width="171" align="left" valign="top">
                              <asp:Repeater runat="server" ID="Rpt_Content">
                                <ItemTemplate>
                                  <table width="161" border="0" cellspacing="0" cellpadding="0">
                                    <tr <%# Eval("nvc_TitleLink").ToString()==""?"":"style='display:none;'"%>>
                                      <td width="146" height="18" align="left"><a href="Services.aspx?sid=<%#Eval("i_NewsTypeId") %>&cid=<%#Eval("i_Id") %>" <%# IsCon(Eval("i_Id"))?"class=\"ac5s\"":"" %>>·<%#  Eval("nvc_Title") %></a> </td>
                                    </tr>
                                    <tr <%# Eval("nvc_TitleLink").ToString()==""?"style='display:none;'":""%>>
                                      <td width="146" height="18" align="left"><a href="<%#Eval("nvc_TitleLink") %>">·<%#  Eval("nvc_Title") %></a> </td>
                                    </tr>
                                  </table>
                                </ItemTemplate>
                              </asp:Repeater>
                            </td>
                            <td width="32">&nbsp; </td>
                          </tr>
                          <tr>
                            <td height="8" colspan="3"></td>
                          </tr>
                        </table>
                      </td>
                      <td align="left" valign="top">&nbsp; </td>
                    </tr>
                    <tr>
                      <td colspan="3" height="3"></td>
                    </tr>
                  </table>
                </ItemTemplate>
              </asp:Repeater>
              <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="10" height="56">&nbsp; </td>
                  <td width="222">&nbsp; </td>
                  <td width="28">&nbsp; </td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td align="left" valign="top"><a href="down.aspx"><img src="images/server4.gif" width="216" height="52" /></a> </td>
                  <td>&nbsp; </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td align="left" valign="top"><img src="images/server3.gif" width="260" height="162" /> </td>
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
                  <td align="left"><a href="index.aspx">Front page</a>&nbsp;>>&nbsp;Our Service&nbsp;>>&nbsp;<%= sortName %>&nbsp;>>&nbsp;<%=cname %>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td style="_height: 360px; min-height: 360px;" valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="15">&nbsp; </td>
                  <td width="630">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                    <%=_Content %>
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
<script type="text/javascript">
  //显示隐藏tr
  function showbox(id) {
    $(".ccon").addClass("ccclose").removeClass("ccon");
    $("#cctr" + id).addClass("ccon").removeClass("ccclose");
    $(".ccclose").hide();
    $(".ccon").show();
  }
  $(".ccclose").hide();
  $(".ccon[flag=0]").hide();
  $(".ccon[flag=1]").show(); 
</script>
