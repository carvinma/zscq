<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword%>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/jQuery.js"></script>
  <script type="text/javascript" src="js/common2.js"></script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <uc3:zscqtop2 ID="zscqtop21" runat="server" />
  <div class="banner_index">
    <a href="javascript:void(0);" class="btn btnPre" id="banner_index_pre"></a><a href="javascript:void(0);" class="btn btnNext" id="banner_index_next"></a>
    <ul class="banner_wrap" id="banner_index">
      <asp:Repeater runat="server" ID="rpt_Adv">
        <ItemTemplate>
          <li>
            <div style='width: 1001px; height: 350px; margin: 0 auto; position: relative; background: url(../<%#Eval("nvc_BottomImage")%>);'>
              <div style="width: 455px; height: 350px; background: #fff; position: absolute; left: 0; top: 0; filter: alpha(opacity=20); opacity: 0.2; z-index: 0;">
              </div>
              <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; position: relative; z-index: 9999;">
                <tr>
                  <td align="left" valign="top" height="350">
                    <table width="455" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="455" height="350" align="left" valign="top">
                          <table width="452" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="72" height="24">&nbsp;</td>
                              <td width="380">&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="71">&nbsp;</td>
                              <td align="left" valign="top">
                                <table width="376" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="3" height="69"></td>
                                    <td width="373" align="left" valign="bottom"><img src="../<%#Eval("nvc_TopImage")%>" width="352" height="83" /></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="25">&nbsp;</td>
                              <td align="left" valign="top">&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="40">&nbsp;</td>
                              <td align="left" valign="top">
                                <table width="356" border="0" cellspacing="0" cellpadding="0" style="filter: alpha(opacity=80); opacity: 0.8; background: #bf2831;">
                                  <tr>
                                    <td width="7"></td>
                                    <td width="349" height="40" align="left" style="color: #f7dddd; font-size: 18px; line-height: 24px;font-family: Gulim,Arial,宋体">
                                      <%#Eval("nvc_Title")%></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="96">&nbsp;</td>
                              <td align="left" valign="top">
                                <table width="356" height="96" border="0" cellspacing="0" cellpadding="0" style="filter: alpha(opacity=80); opacity: 0.8; background: #26323c;">
                                  <tr>
                                    <td height="17"></td>
                                    <td align="left"></td>
                                  </tr>
                                  <tr>
                                    <td width="10"></td>
                                    <td width="346" align="left" valign="top" style="color: #d6d6d6; font-size: 14px; line-height: 24px;font-family: Gulim,Arial,宋体">
                                      <%#Eval("nvc_EnTitle")%></td>
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
            </div>
          </li>
        </ItemTemplate>
      </asp:Repeater>
    </ul>
    <div class="indexBanner_num" id="index_numIco">
    </div>
  </div>
  <script type="text/javascript">
    var ShowPre1 = new ShowPre({ box: "banner_index", Pre: "banner_index_pre", Next: "banner_index_next", numIco: "index_numIco", loop: 1, auto: 1 });
  </script>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td height="22" align="left" valign="top"></td>
    </tr>
    <tr>
      <td height="105" align="left" valign="top">
        <table width="1001" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="37" height="105">&nbsp; </td>
            <td width="330" valign="top"><a href="Login.aspx?flag=zl&pageurl2=<%=url %>"><img src="images/zhuanli_banner.gif" width="249" height="114" /></a> </td>
            <td width="328" valign="top"><a href="Login.aspx?flag=sb&pageurl2=<%=url %>"><img src="images/shangbiao_banner.gif" width="249" height="114" /></a> </td>
            <td width="306" valign="top"><a href="jifen.aspx"><img src="images/jifen_banner.gif" width="249" height="114" /></a> </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="8" align="left" valign="top"></td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
