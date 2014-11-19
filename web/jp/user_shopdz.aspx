<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shopdz.aspx.cs" Inherits="user_shopdz" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="84" runat="server" />
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
                  <td width="38" height="28">&nbsp; </td>
                  <td width="701">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;&gt;&gt;&nbsp;会員センター&nbsp;&gt;&gt;&nbsp;アカウントセンター&nbsp;&gt;&gt;&nbsp;私の住所 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="28">&nbsp; </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691" align="right"><a href="user_shopdzadd.aspx"><img src="images/dzadd.gif" width="86" height="27" border="0" /></a> </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="28" align="left" valign="bottom" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="115" align="center" class="font12bt">アドレスリスト </td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="86" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">受取人 </td>
                              <td width="94" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">電話 </td>
                              <td width="140" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">国 </td>
                              <td width="210" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">詳細アドレス </td>
                              <td width="62" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">黙認するかどうか </td>
                              <td width="78" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">操作 </td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td width="86" height="32" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_Consignee") %>
                                  </td>
                                  <td width="94" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_TelPhone")%>
                                  </td>
                                  <td width="140" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_JpanName")%></td>
                                  <td width="210" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_StreetAddress")%>
                                  </td>
                                  <td width="62" align="center" bgcolor="#FFFFFF">
                                    <%# Hi_Mr.Value != Eval("i_Id").ToString() ? "<a href=\"?PageType=mr&mid=" + Eval("i_Id") + "\">[いいえ]</a>" : "<span style=\"color:#e3441c;\">ある</span>"%>&nbsp;&nbsp; </td>
                                  <td width="78" align="center" bgcolor="#FFFFFF"><a href="user_shopdzadd.aspx?PageType=update&uid=<%# Eval("i_Id")%>" class="ac5t">[改正]</a> <a href="?PageType=del&did=<%# Eval("i_Id")%>" onclick="javascript:if(!window.confirm('削除の確認？')){return false;}" class="ac5t">[削除]</a> </td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="10" align="left"></td>
                            </tr>
                            <tr>
                              <td align="right" class="font12b4e">
                                <table class="aspnetpager" cellspacing="5">
                                  <tr>
                                    <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="フロントページ" LastPageText="最後のページ" PrevPageText="前のページ" NextPageText="後のページ" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="全部 %PageCount% ページ " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="確定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" ページ" TextBeforeInputBox="へスキップ ">
                                    </webdiyer:AspNetPager>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td width="687" height="26" align="left"></td>
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
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
