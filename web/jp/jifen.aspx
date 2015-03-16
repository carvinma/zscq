<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jifen.aspx.cs" Inherits="jifen" %>

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
    <style type="text/css">
       ul {
           padding:3px;
           margin:5px;
       }
       li{
           display:inline;
           padding-left:3px;
       }
   </style>
</head>
<body id="youhui">
  <form id="form1" runat="server">
  <asp:HiddenField ID="hi_type" runat="server" />
  <asp:HiddenField ID="hi_key" runat="server" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="79" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="420" align="left" valign="top" style="background-color: #f5f5f5;">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="64" align="left" valign="top" style="background-image: url(images/jifen3.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="356" align="left" valign="top" style="background-image: url(images/server2.gif);">
              <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td> <td width="3"></td>
                        <td width="193" align="left"><a href="youhui.aspx" class="ac2">最新キャンペン</a> </td>
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
                  <td width="221" height="22" bgcolor="#d34245">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="3"></td>
                        <td width="193" align="left"><a href="#" class="ac2">ポイントショッピングセンター</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td align="left" valign="top">&nbsp; </td>
                  <td align="left" valign="top" style="background-color: #f4f4f4;">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                      <tr>
                        <td width="23">&nbsp; </td>
                        <td width="178" height="18" align="left" valign="top">
                          <table width="170" border="0" cellspacing="0" cellpadding="0">
                            
                            <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen5.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=2" <%= ptype=="2"?"class=\"ac5\"":"" %>>クーポンの両替</a> </td>
                            </tr>
                            <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen6.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=3" <%= ptype=="3"?"class=\"ac5\"":"" %>>会員クラス両替</a> </td>
                            </tr>
                              <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen4.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=1" <%= ptype=="1"?"class=\"ac5\"":"" %>>プレゼント両替</a> </td>
                            </tr>
                              <tr>
                                <td width="27" height="26" align="left"></td>
                                <td>
                                    <div runat="server" id="producttypelist">
                                        
                                    </div>

                                </td>
                            </tr>
                          </table>
                        </td>
                        <td width="20">&nbsp; </td>
                      </tr>
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                    </table>
                  </td>
                  <td align="left" valign="top">&nbsp; </td>
                </tr>
                <tr>
                  <td width="10">&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="13">&nbsp; </td>
                        <td width="183" align="left">
                          <%if (isLogin)
                            { %>
                          <a href="user_shopintegral.aspx" class="ac2">個人センターに入る</a>
                          <%} %>
                          <%else
                            { %>
                          <a href="ShopLogin.aspx" class="ac2">ポイントシステムに入る</a>
                          <%} %>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="37"></td>
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
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="left" valign="top" style="background-image: url(images/aboutus_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="36">&nbsp; </td>
                  <td width="678" align="right">
                    <table width="650" border="0" cellspacing="0" cellpadding="0">
                      <tr>                       
                        <td width="146" align="left">
                          <select runat="server" id="Jifen" onchange="s();" name="Jifen" style="padding-top: 3px; padding-bottom: 2px; font-size: 12px; width: 129px; height: 24px; line-height: 24px; overflow: hidden; vertical-align: text-bottom; border: #d7d7d7 1px solid;">
                            <option value="-1,-1">&nbsp;&nbsp;選択して下さい</option>
                            <option value="0,50">&nbsp;&nbsp;0-50ポイント</option>
                            <option value="51,100">&nbsp;&nbsp;51-100ポイント</option>
                            <option value="101,300">&nbsp;&nbsp;101-300ポイント</option>
                            <option value="301,500">&nbsp;&nbsp;301-500ポイント</option>
                            <option value="500,0">&nbsp;&nbsp;500ポイント以上</option>
                          </select>
                        </td>
                          <td width="138" align="left">
                          <select runat="server" id="producttype" onchange="s();" name="producttype" style="padding-top: 3px; padding-bottom: 2px; font-size: 12px; width: 129px; height: 24px; line-height: 24px; overflow: hidden; vertical-align: text-bottom; border: #d7d7d7 1px solid;">                           
                 
                          </select>
                        </td>     
                        <td width="200" align="left">
                          <table width="172" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="172" height="24" align="left" valign="top" style="background-image: url(images/jifen10.gif);">
                                <table width="172" border="0" align="right" cellpadding="0" cellspacing="0" height="24">
                                  <tr>
                                    <td width="146" height="24" align="right">
                                      <input type="text" name="pagekey" id="pagekey" runat="server" style="outline-width: 0px; line-height: 18px; height: 18px; width: 141px; font-size: 12px; border: 1px solid #fff;" maxlength="30" /></td>
                                    <td width="26" align="left"><a href="javascript:void(0);" onclick="s();"><img src="images/jifen11.gif" width="25" height="22" /></a></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                          <td><a class="ac5"  style="float:left" href="jifen.aspx?myself=1">両替できる商品</a></td>
                        <td width="17">&nbsp; </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;>>&nbsp;<a href="youhui.aspx">キャンペン</a>&nbsp;>>&nbsp;<a href="jifen.aspx">ポイントショッピングセンター</a>&nbsp;>>&nbsp;<%=name %>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="347" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="66" height="26">&nbsp; </td>
                  <td width="650">&nbsp; </td>
                </tr>
                <tr>
                  <td height="271">&nbsp; </td>
                  <td align="left" valign="top">
                    <%if (AspNetPager1.RecordCount > 0)
                      { %><div class="index_main5concens auto">
                        <asp:Repeater ID="Rpt_List" runat="server">
                          <ItemTemplate>
                            <div class="index_main5pros auto">
                              <div class="index_main5proimgs auto">
                                <a href="jifen_show.aspx?ptype=<%=ptype %>&cid=<%#Eval("i_Id") %>&sel=<%= sel%>&keyword=<%= key %>&ye=<%= AspNetPager1.CurrentPageIndex%>"><img src="../pic_Small/<%#Eval("nvc_Pic") %>" /></a></div>
                              <div class="index_main5protits auto">
                                <a href="jifen_show.aspx?ptype=<%=ptype %>&cid=<%#Eval("i_Id") %>">
                                  <%#Eval("nvc_Name")  %></a><br />
                                <span>両替積分：<%# Eval("i_NeedIntegral")%></span></div>
                            </div>
                          </ItemTemplate>
                        </asp:Repeater>
                      </div>
                    <%}
                      else
                      { %>関連内容ヲ見つかりませんでした！<%} %>
                  </td>
                </tr>
                <tr>
                  <td height="26">&nbsp; </td>
                  <td align="center" valign="top">
                    <table class="aspnetpager" cellspacing="3" cellpadding="0">
                      <tr>
                        <webdiyer:AspNetPager NumericButtonCount="5" ID="AspNetPager1" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="true" ShowPageIndex="true" runat="server" ShowFirstLast="true" FirstPageText="フロントページ" LastPageText="最後のページ" PrevPageText="前のページ" NextPageText="後のページ" ShowInputBox="Never" PageSize="12" SubmitButtonText="GO" TextAfterInputBox=" ページ" CustomInfoHTML="全部 %PageCount% ページ " CustomInfoTextAlign="Right" ShowCustomInfoSection="Right" SubmitButtonClass="button" ShowDisabledButtons="true">
                        </webdiyer:AspNetPager>
                        <td>全部で<%= AspNetPager1.PageCount%>ページ </td>
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
  </form>
</body>
</html>
<script type="text/javascript">
    function s() {
        window.location = "jifen.aspx?ptype=" + $("#hi_type").val() + "&sel=" + $('#Jifen option:selected').val() + "&producttype=" + $('#producttype option:selected').val() + "&keyword=" + escape($('#pagekey').val());
    }
    $("#pagekey").val($("#hi_key").val());
</script>
