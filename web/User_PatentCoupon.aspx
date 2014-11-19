<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentCoupon.aspx.cs" Inherits="User_PatentCoupon" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>我的优惠券_服务中心_会员中心_专利系统_环球汇通</title>
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
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_Integral" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
      <uc1:patentleft ID="patentleft" runat="server" />
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
                  <td align="left">首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的优惠券 </td>
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
                              <td width="116" align="center" class="tab font12bt">未使用的优惠券 </td>
                              <td width="8"></td>
                              <td width="116" align="center" class="tab font12bs">已使用的优惠券 </td>
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
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                              <ContentTemplate>
                                <table class="member_infotable" width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <thead>
                                    <tr>
                                      <td width="14%" height="32" align="center" bgcolor="#FFFFFF">优惠券码 </td>
                                      <td width="26%" align="center" bgcolor="#FFFFFF">优惠券名称 </td>
                                      <td width="10%" align="center" bgcolor="#FFFFFF">面值 </td>
                                      <%-- <td width="10%" align="center" bgcolor="#FFFFFF">购物满 </td>--%>
                                      <td width="16%" align="center" bgcolor="#FFFFFF">来源 </td>
                                      <td width="34%" align="center" bgcolor="#FFFFFF">有效期 </td>
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
                                          <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" showpageindexbox="Always" runat="server" ShowFirstLast="False" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="共 %PageCount% 页 " InputBoxClass="pagetext" pageindexboxtype="TextBox" SubmitButtonText="确定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" 页" TextBeforeInputBox="跳转到 ">
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
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                              <ContentTemplate>
                                <table class="member_infotable" width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <thead>
                                    <tr>
                                      <td width="12%" height="32" align="center" bgcolor="#FFFFFF">优惠券码 </td>
                                      <td width="22%" align="center" bgcolor="#FFFFFF">优惠券名称 </td>
                                      <td width="10%" align="center" bgcolor="#FFFFFF">面值 </td>
                                      <%--<td width="10%" align="center" bgcolor="#FFFFFF">购物满 </td>--%>
                                      <td width="10%" align="center" bgcolor="#FFFFFF">来源 </td>
                                      <td width="30%" align="center" bgcolor="#FFFFFF">有效期 </td>
                                      <td width="14%" align="center" bgcolor="#FFFFFF">使用时间 </td>
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
                                          <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager2" showpageindexbox="Always" runat="server" ShowFirstLast="False" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="共 %PageCount% 页 " InputBoxClass="pagetext" pageindexboxtype="TextBox" SubmitButtonText="确定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager2_PageChanged" TextAfterInputBox=" 页" TextBeforeInputBox="跳转到 ">
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
    /* 会员中心 */
    $(function () {
        $(".member_order_tabs .tab").each(function (i) {
            $(this).click(function () {
                $(".member_order_tabs .tab").removeClass("font12bt").addClass("font12bs").eq(i).removeClass("font12bs").addClass("font12bt");
                $("div.member_order_cont").hide().eq(i).show();
            })
        })
    })
</script>

