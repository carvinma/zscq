<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbcoupon.aspx.cs" Inherits="user_shopcoupon" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <%=TitleOrKeyword %>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    .tab { cursor: pointer; }
  </style>
</head>
<body id="index">
  <form id="form1" runat="server">
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_Integral" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="96" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
      <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
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
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;&gt;&gt;&nbsp;서비스 센터&nbsp;&gt;&gt;&nbsp;나의 할인권 </td>
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
                    <table class="member_orderbox" width="654" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                          <table class="member_order_tabs" width="260" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp; </td>
                              <td width="116" align="center" class="tab font12bt">미 사용한 할인권 </td>
                              <td width="8"></td>
                              <td width="116" align="center" class="tab font12bs">사용된 할인권 </td>
                              <td width="10"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <!--内容区域begin-->
                          <!-- 近一个月的订单 -->
                          <div class="member_order_cont" style="display: block;">
                            <asp:UpdatePanel runat="server">
                              <ContentTemplate>
                                <table class="member_infotable" width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <thead>
                                    <tr>
                                      <td width="16%" height="32" align="center" bgcolor="#FFFFFF">할인 코드 </td>
                                      <td width="24%" align="center" bgcolor="#FFFFFF">할인권  명칭 </td>
                                      <td width="10%" align="center" bgcolor="#FFFFFF">액면 </td>
                                      <%-- <td width="10%" align="center" bgcolor="#FFFFFF">购物满 </td>--%>
                                      <td width="26%" align="center" bgcolor="#FFFFFF">출처 </td>
                                      <td width="24%" align="center" bgcolor="#FFFFFF">유효기 </td>
                                      <%--<td width="12%" align="center" bgcolor="#FFFFFF">使用范围 </td>--%>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <%= div_Coupon1%>
                                  </tbody>
                                </table>
                                <table width="687" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="10" align="left"></td>
                                  </tr>
                                  <tr>
                                    <td align="right" class="font12b4e">
                                      <table class="aspnetpager" cellspacing="5">
                                        <tr>
                                          <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" showpageindexbox="Always" runat="server" ShowFirstLast="False" FirstPageText="홈" LastPageText="끝페지로" PrevPageText="전으로" NextPageText="다음으로" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="총 %PageCount% 페지 " InputBoxClass="pagetext" pageindexboxtype="TextBox" SubmitButtonText="확정" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox="페지" TextBeforeInputBox="건너 뛰기">
                                          </webdiyer:AspNetPager>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="687" height="26" align="left"></td>
                                  </tr>
                                </table>
                              </ContentTemplate>
                            </asp:UpdatePanel>
                          </div>
                          <!-- 一个月之前 -->
                          <div class="member_order_cont" style="display: none;">
                            <asp:UpdatePanel runat="server">
                              <ContentTemplate>
                                <table class="member_infotable" width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <thead>
                                    <tr>
                                      <td width="16%" height="32" align="center" bgcolor="#FFFFFF">할인 코드 </td>
                                      <td width="18%" align="center" bgcolor="#FFFFFF">할인권  명칭 </td>
                                      <td width="10%" align="center" bgcolor="#FFFFFF">액면 </td>
                                      <%--<td width="10%" align="center" bgcolor="#FFFFFF">购物满 </td>--%>
                                      <td width="14%" align="center" bgcolor="#FFFFFF">출처 </td>
                                      <td width="24%" align="center" bgcolor="#FFFFFF">유효기 </td>
                                      <td width="14%" align="center" bgcolor="#FFFFFF">사용 시간 </td>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <%= div_Coupon2%>
                                  </tbody>
                                </table>
                                <table width="687" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="10" align="left"></td>
                                  </tr>
                                  <tr>
                                    <td align="right" class="font12b4e">
                                      <table class="aspnetpager" cellspacing="5">
                                        <tr>
                                          <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager2" showpageindexbox="Always" runat="server" ShowFirstLast="False" FirstPageText="홈" LastPageText="끝페지로" PrevPageText="전으로" NextPageText="다음으로" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="총 %PageCount% 페지 " InputBoxClass="pagetext" pageindexboxtype="TextBox" SubmitButtonText="확정" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager2_PageChanged" TextAfterInputBox="페지" TextBeforeInputBox="건너 뛰기">
                                          </webdiyer:AspNetPager>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="687" height="26" align="left"></td>
                                  </tr>
                                </table>
                              </ContentTemplate>
                            </asp:UpdatePanel>
                          </div>
                          <!--内容区域end-->
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
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
  /* 회원센터 */
  $(function () {
    $(".member_order_tabs .tab").each(function (i) {
      $(this).click(function () {
        $(".member_order_tabs .tab").removeClass("font12bt").addClass("font12bs").eq(i).removeClass("font12bs").addClass("font12bt");
        $("div.member_order_cont").hide().eq(i).show();
      })
    })
  })
</script>
