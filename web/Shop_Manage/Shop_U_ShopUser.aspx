<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_U_ShopUser.aspx.cs" Inherits="Shop_Manage_Shop_U_SBUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript">
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
</head>
<body>
  <form id="form1" runat="server">
  <input id="hi_id" type="hidden" runat="server" value="0" />
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <div>
    <h1>
      <span class="action-span"><a href="Shop_M_IntegralUser.aspx?<%=returnurl %>">会员列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 修改会员 </span>
      <div style="clear: both">
      </div>
    </h1>
    <div class="list-div" id="listDiv">
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th colspan="2">
            积分设定：
          </th>
        </tr>
        <tr>
          <td align="center">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
              <ContentTemplate>
                <table>
                  <tr>
                    <td align="right">积分手机号：</td>
                    <td align="left">
                      <%= UserName %></td>
                  </tr>
                  <tr>
                    <td align="right">剩余积分：</td>
                    <td align="left">
                      <%=Integral %></td>
                  </tr>
                  <tr>
                    <td align="right">积分手机密码：</td>
                    <td align="left">
                      <asp:TextBox ID="Txt_VipIntegralPasssWord" TextMode="Password" CssClass="inputs100text" runat="server" MaxLength="15"></asp:TextBox></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center">
                      <asp:Button ID="btn_Integral" runat="server" class="button" Text="修改" ValidationGroup="A" OnClick="btn_Integral_Click" /></td>
                  </tr>
                </table>
              </ContentTemplate>
            </asp:UpdatePanel>
          </td>
        </tr>
      </table>
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th>
            订单列表
          </th>
        </tr>
        <tr>
          <td>
            <table cellspacing='1' cellpadding='3'>
              <thead>
                <tr>
                  <th width="15%">
                    订单号
                  </th>
                  <th width="42%">
                    兑换商品
                  </th>
                  <th width="6%">
                    积分总计
                  </th>
                  <th width="10%">
                    订单状态
                  </th>
                  <th width="10%">
                    下单时间
                  </th>
                </tr>
              </thead>
              <tbody>
                <asp:Repeater ID="repitem" runat="server">
                  <ItemTemplate>
                    <tr>
                      <td height="32" align="center">
                        <%#Eval("nvc_OrderNumber") %>
                      </td>
                      <td align="center">
                        <%# getorderpname(Eval("i_Id"))%></td>
                      <td align="center">
                        <%#Eval("i_SumIntegral")%>
                      </td>
                      <td align="center">
                        <%#  getstate(Eval("i_State"))%>
                      </td>
                      <td align="center">
                        <%#Eval("dt_AddTime").ToString()%></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <th>
            积分
          </th>
        </tr>
        <tr>
          <td>
            <table cellspacing='1' cellpadding='3'>
              <tr>
                <th width="19%">
                  变更前积分
                </th>
                <th width="20%">
                  变更积分
                </th>
                <th width="19%">
                  变更后积分
                </th>
                <th width="21%">
                  操作类型
                </th>
                <th width="21%">
                  操作时间
                </th>
              </tr>
              <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                  <asp:Repeater ID="Rpt_IntegralNote" runat="server">
                    <ItemTemplate>
                      <tr>
                        <td align="center">
                          <%# Eval("i_Integral_1")%></td>
                        <td align="center">
                          <%# Convert.ToDecimal(Eval("i_Integral_2").ToString()) > 0 ? ("+" + Eval("i_Integral_2")) : Eval("i_Integral_2")%></td>
                        <td align="center">
                          <%# Eval("i_Integral_3")%></td>
                        <td align="center">
                          <%# Eval("nvc_NoteType")%></td>
                        <td align="center">
                          <%# Eval("dt_AddTime")%></td>
                      </tr>
                    </ItemTemplate>
                  </asp:Repeater>
                </ContentTemplate>
              </asp:UpdatePanel>
            </table>
          </td>
        </tr>
      </table>
    </div>
    <div id="div_a" runat="server">
    </div>
  </form>
  <script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
    <!-- #include file="push.html" -->  
</body>
</html>
