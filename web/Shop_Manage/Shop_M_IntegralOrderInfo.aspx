<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_IntegralOrderInfo.aspx.cs" Inherits="Shop_Manage_shop_submore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" id="Hi_OrderId" runat="server" value="0" />
  <input type="hidden" id="Hi_CheckPower" runat="server" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_IntegralOrder.aspx?<%=pageurl %>">积分订单列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 积分订单信息 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th>
          订单浏览
        </th>
      </tr>
      <tr>
        <td height="25" align="left">订单号：<font color="#FF0000"><asp:Label ID="labOrderNum" runat="server"></asp:Label></font> &nbsp;&nbsp;&nbsp; <span style="line-height: 150%;">下单</span>日期： <font color="#808080">
          <asp:Label ID="labAddTime" runat="server"></asp:Label></font> &nbsp;&nbsp;&nbsp;用户名：<a href="Shop_U_User.aspx?id=<%=userid %>">
            <asp:Label ID="labUserName" runat="server"></asp:Label></a> </td>
      </tr>
      <tr>
        <td height="25" align="center">
          <table border="0" cellpadding="0" cellspacing="0" width="99%" height="100%">
            <tr>
              <td width="53%" style="text-align: left">订单状态：<asp:Label ID="Lb_OrderStatus" runat="server"></asp:Label>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="25">收&nbsp;货&nbsp;人：<b><asp:Label ID="labReceiver" runat="server"></asp:Label></b> </td>
      </tr>
      <tr>
        <td height="25">详细地址：<asp:Label ID="labAddress" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="labZipCode" runat="server"></asp:Label>
        </td>
      </tr>
      <tr>
        <td height="25">手机号码：<asp:Label ID="labMobile" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="labTel" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="labEmail" runat="server"></asp:Label>
        </td>
      </tr>
      <tr runat="server" visible="false">
        <td height="25">配送方式：<asp:Label ID="labSendStyle" runat="server"></asp:Label>
        </td>
      </tr>
      <%--<tr>
                <td height="25">
                    送货时间：<asp:Label ID="labSendTime" runat="server"></asp:Label>
                </td>
            </tr>--%>
      <tr valign="top">
        <td height="40" align="center">
          <div class="list-div">
            <table cellspacing='1' cellpadding='3'>
              <tr>
                <th colspan="6">
                  兑换商品
                </th>
              </tr>
              <tr>
                <td width="24%" align="center">商品图片 </td>
                <td width="43%" height="25">商品名称 </td>
                <td width="12%" height="25" align="center">单价 </td>
                <td width="7%" height="25" align="center">数量 </td>
                <td width="14%" height="25" align="center">合计 </td>
              </tr>
              <asp:Repeater runat="server" ID="repProduct">
                <ItemTemplate>
                  <tr>
                    <td align="center"><a title="<%#Eval("nvc_ProductName")%>" href="../jifen_show.aspx?cid=<%#Eval("i_IntegralProductId")%>" target="_blank"><img src="../pic_Small/<%#Eval("nvc_Pic")%>" width="60" border="0" style="margin: 3px;"> </a></td>
                    <td height="25" align="left"><a href="Shop_A_IntegralProduct.aspx?ipid=<%#Eval("i_IntegralProductId") %>">
                      <%# Eval("nvc_ProductName") %></a> </td>
                    <td height="25" align="center" style="color: #C80C1A">
                      <%#Eval("i_NeedIntegral")%>
                    </td>
                    <td height="25" align="center">
                      <%#Eval("i_BuyNumber")%>
                    </td>
                    <td height="25" align="center" style="color: #C80C1A">
                      <%#Eval("i_Integral")%>
                    </td>
                  </tr>
                </ItemTemplate>
              </asp:Repeater>
            </table>
          </div>
        </td>
      </tr>
      <tr>
        <td align="right" style="padding-right: 5%;">订单总计：<asp:Label ID="labTotalMoney" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;积分 </td>
      </tr>
      <tr id="tr_caozuo" runat="server" visible="true">
        <td height="25">
          <div class="list-div">
            <table cellspacing='1' cellpadding='3'>
              <tr>
                <th colspan="2">
                  订单操作
                </th>
              </tr>
              <%--<tr id="danweitr" runat="server" visible="false" style="display:none;">
                                <td align="right">
                                    <strong>发货单位：</strong>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DDL_Express" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trOperator" runat="server" visible="false">
                                <td height="28" align="right">
                                    <strong>
                                        <asp:Label ID="labOperator" runat="server" Text="测量人姓名："></asp:Label></strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="text_ExpressNumber" runat="server" Width="200px" 
                                        CssClass="inputs200text"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trOperatorMobile" runat="server" visible="false">
                                <td height="28" align="right">
                                    <strong>
                                        <asp:Label ID="labOperatorMobile" runat="server" Text="测量人电话："></asp:Label></strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="text_Mobile" runat="server" Width="200px" CssClass="inputs200text"></asp:TextBox>
                                </td>
                            </tr>--%>
              <tr>
                <td align="right"><strong>操作备注：</strong> </td>
                <td>
                  <textarea id="area_beizhu" runat="server" cols="50" rows="3" class="input"></textarea>
                </td>
              </tr>
              <tr>
                <td width="100" align="right"><strong>可执行操作：</strong> </td>
                <td>
                  <asp:Button ID="Bt_Confirm" runat="server" Text="确认" CssClass="button" OnClick="btnOperate_Click" CommandName="1" Visible="false" OnClientClick="return scheck()" />
                  <asp:Button ID="Bt_Express" runat="server" Text="去发货" CssClass="button" OnClick="btnOperate_Click" CommandName="2" Visible="false" OnClientClick="return scheck()" /><asp:Button ID="Bt_OrderEnd" runat="server" Text="后台收货" CssClass="button" OnClick="btnOperate_Click" CommandName="3" Visible="false" OnClientClick="return scheck()" />
                  <%--<asp:Button ID="Bt_ReturnMoney" runat="server" Text="退货" CssClass="button" OnClick="btnOperate_Click" CommandName="4" Visible="false" OnClientClick="return scheck()" />--%>
                  <asp:Button ID="Bt_Esc" runat="server" Text="取消订单" CssClass="button" OnClick="btnOperate_Click" CommandName="5" Visible="false" OnClientClick="return scheck()" />
                </td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <div class="list-div" id="Div2">
            <table cellspacing='1' cellpadding='3'>
              <tr>
                <th width="20%">
                  身份/操作者
                </th>
                <th width="20%">
                  操作时间
                </th>
                <th width="15%">
                  订单状态
                </th>
                <th width="45%">
                  备注
                </th>
              </tr>
              <asp:Repeater runat="server" ID="repOperateDetail">
                <ItemTemplate>
                  <tr align="center">
                    <td height="26">
                      <%#Eval("nvc_ManagerName") != null ? "(管理员)" + Eval("nvc_ManagerName") : "（会员）" + Eval("nvc_MemberName")%>
                    </td>
                    <td>
                      <%#Eval("dt_AddTime")%>
                    </td>
                    <td>
                      <%#Eval("nvc_Type")%>
                    </td>
                    <td>
                      <%#Eval("nvc_Remark")%>
                    </td>
                  </tr>
                </ItemTemplate>
              </asp:Repeater>
            </table>
          </div>
        </td>
      </tr>
      <tr>
        <td align="center">
          <%--<asp:Button ID="lbtnDelete" runat="server" OnClientClick="return confirm('您确定进行删除操作吗？')" OnClick="lbtnDelete_Click" Text="删除订单" CssClass="button"></asp:Button>
          <a id="dayina" href="Shop_IntegralOrderPrint.aspx?orderid=<%=Request.QueryString["orderid"] %>" target="_blank">
            <input type="button" value="打印订单" class="button" onclick="javascript:document.getElementById('dayina').click();" /></a>
          <input name="Submit8" type="button" value="返回" onclick="javascript:window.location='Shop_M_IntegralOrder.aspx?<%=pageurl %>';" class="button" />
        --%></td>
      </tr>
    </table>
  </div>
  <script src="js/hoot.js" type="text/javascript"></script>
  <div id="daochu" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  <div id="div_a" runat="server">
  </div>
  </form>
        <!-- #include file="push.html" -->    
</body>
</html>
