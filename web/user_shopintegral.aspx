<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shopintegral.aspx.cs" Inherits="user_shopintegral" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
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
</head>
<body id="index">
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_Integral" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="56" runat="server" />
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
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;我的积分 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691">&nbsp; </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                          <table width="132" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp; </td>
                              <td width="116" align="center" class="font12bt">积分流水 </td>
                              <td width="8"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="18" align="left">&nbsp; </td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="687" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="23%" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">日期 </td>
                              <td width="26%" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">摘要 </td>
                              <td width="28%" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">积分变化 </td>
                              <td width="15%" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">积分结存 </td>
                              <td width="8%" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">积分状态 </td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td height="32" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("dt_AddTime")%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_NoteType")%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Convert.ToDecimal(Eval("i_Integral_2").ToString()) > 0 ? ("+" + Eval("i_Integral_2")) : Eval("i_Integral_2")%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("i_Integral_3")%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF"><span style="color: Red;">
                                    <%# (Convert.ToInt32(Eval("i_status")) == 0 ? "未生效" : "已生效") %></span> </td>
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
                                    <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" showpageindexbox="Always" runat="server" ShowFirstLast="False" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="共 %PageCount% 页 " InputBoxClass="pagetext" pageindexboxtype="TextBox" SubmitButtonText="确定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" 页" TextBeforeInputBox="跳转到 ">
                                    </webdiyer:AspNetPager>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td width="687" height="26" align="right"><a href="jifen.aspx"><img src="images/shop_go_1.jpg" title="进入积分商城" /> </a></td>
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
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
