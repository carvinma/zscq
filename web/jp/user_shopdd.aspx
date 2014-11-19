<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shopdd.aspx.cs" Inherits="user_shopdd" %>

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
  <input type="hidden" runat="server" id="Hi_OrderName" value="0" />
  <input type="hidden" runat="server" id="Hi_OrderType" value="0" />
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
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;&gt;&gt;&nbsp;会員センター&nbsp;&gt;&gt;&nbsp;サービスセンター&nbsp;&gt;&gt;&nbsp;私の両替オーダー </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp; </td>
                  <td width="653">&nbsp; </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="654" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                          <table width="181" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp; </td>
                              <td width="162" align="center" class="font12bt">両替オーダーリスト </td>
                              <td width="9"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="97" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="オーダー番号↓" OnClick="LinkButton1_Click" Style="width: 100%;" Font-Underline="false"></asp:LinkButton>
                              </td>
                              <td width="212" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">買い戻す </td>
                              <td width="98" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                <asp:LinkButton ID="LinkButton2" runat="server" Text="ポイント総計↓" OnClick="LinkButton2_Click" Style="width: 100%;"> </asp:LinkButton>
                              </td>
                              <td width="97" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                <asp:LinkButton ID="LinkButton3" runat="server" Text="オーダー状態↓" OnClick="LinkButton3_Click" Style="width: 100%;"> </asp:LinkButton>
                              </td>
                              <td width="86" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                <asp:LinkButton ID="LinkButton4" runat="server" Text="オーダー提出時間↓" OnClick="LinkButton4_Click" Style="width: 100%;"> </asp:LinkButton>
                              </td>
                              <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">詳細 </td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td height="32" align="center" bgcolor="#FFFFFF" style="font-size: 12px; color: #1e2b6c; font-weight: bold;">
                                    <%#Eval("nvc_OrderNumber") %>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF" style="line-height: 22px;">
                                    <%# getorderpname(Eval("i_Id"))%></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%#Eval("i_SumIntegral")%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%#  getstate(Eval("i_State"),"jp")%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%#Eval("dt_AddTime").ToString()%></td>
                                  <td align="center" bgcolor="#FFFFFF"><a href="user_shopddck.aspx?orderid=<%#Eval("i_Id") %>" class="ac5t">チェック</a> </td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp; </td>
                      </tr>
                      <tr>
                        <td align="right" class="font12b4e">
                          <table class="aspnetpager" cellspacing="5">
                            <tr>
                              <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="フロントページ" LastPageText="最後のページ" PrevPageText="前のページ" NextPageText="後のページ" ShowInputBox="Always" PageSize="10" ShowCustomInfoSection="Right" CustomInfoHTML="全部 %PageCount% ページ " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="確定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" ページ" TextBeforeInputBox="へスキップ ">
                              </webdiyer:AspNetPager>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp; </td>
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
