﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_TrademarkOrder.aspx.cs" Inherits="Shop_Manage_shop_sub" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" src="js/jquery-1.4.4.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
   <style type="text/css">
    #listDiv a { text-decoration: none; }
    #xuanzhong { color: Red; }
    #listDiv a .sp1 { background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent; display: inline-block; height: 11px; margin-top: 3px; overflow: hidden; width: 10px; background-position: 0 0px; }
    #listDiv a .sp2 { background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent; display: inline-block; height: 11px; margin-top: 3px; overflow: hidden; width: 10px; background-position: 0 -11px; }
  </style>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript">
      $(function () {
          var ordernum = $("#ordernum1");
          var username = $("#username1");
          var cname = $("#cname1");
          var cbianhao = $("#cbianhao1");
          var orderstate = $("#orderstate1");
          var totalmoney = $("#totalmoney1");
          var paytime = $("#paytime1");
          var addtime = $("#addtime1");

          if (ordernum.val() == "desc") {
              $("#ordernumdaoxu").hide();
              $("#ordernumzhengxu").show();
          }
          else {
              $("#ordernumzhengxu").hide();
              $("#ordernumdaoxu").show();
          }
          if (username.val() == "desc") {
              $("#usernamedaoxu").hide();
              $("#usernamezhengxu").show();
          }
          else {
              $("#usernamedaoxu").show();
              $("#usernamezhengxu").hide();
          }

          if (cname.val() == "desc") {
              $("#cnamedaoxu").hide();
              $("#cnamezhengxu").show();
          }
          else {
              $("#cnamedaoxu").show();
              $("#cnamezhengxu").hide();
          }
          if (cbianhao.val() == "desc") {
              $("#cbianhaodaoxu").hide();
              $("#cbianhaozhengxu").show();
          }
          else {
              $("#cbianhaodaoxu").show();
              $("#cbianhaozhengxu").hide();
          }

          if (orderstate.val() == "desc") {
              $("#orderstatedaoxu").hide();
              $("#orderstatezhengxu").show();
          }
          else {
              $("#orderstatedaoxu").show();
              $("#orderstatezhengxu").hide();
          }

          if (totalmoney.val() == "desc") {
              $("#totalmoneydaoxu").hide();
              $("#totalmoneyzhengxu").show();
          }
          else {
              $("#totalmoneydaoxu").show();
              $("#totalmoneyzhengxu").hide();
          }

          if (addtime.val() == "desc") {
              $("#addtimedaoxu").hide();
              $("#addtimezhengxu").show();
          }
          else {
              $("#addtimedaoxu").show();
              $("#addtimezhengxu").hide();
          }
          if (paytime.val() == "desc") {
              $("#paytimedaoxu").hide();
              $("#paytimezhengxu").show();
          }
          else {
              $("#paytimedaoxu").show();
              $("#paytimezhengxu").hide();
          }
      });
  </script>
  <script language="javascript" type="text/javascript">
    document.onkeydown = function (e)                //网页内按下回车触发
    {
      var theEvent = window.event || e;
      var code = theEvent.keyCode || theEvent.which;
      if (code == 37) {                      //不知道是什么意思,不加这行就不触发后台事件.参见【注】
        if ('<%=ye %>' != '1') {
          document.getElementById("syy").click();   //服务器控件Submit1点击事件被触发
          return false;
        }
      }
      if (code == 39) {                      //不知道是什么意思,不加这行就不触发后台事件.参见【注】
        if ('<%=ye %>' != '<%=sumy %>') {
          document.getElementById("xyy").click();   //服务器控件Submit1点击事件被触发
          return false;
        }
      }
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_NullGoods" value="0" />
    <input type="hidden" runat="server" id="Hi_Orderby2" value="desc" />

  <input type="hidden" id="ordernum1" runat="server" value="0" />
  <input type="hidden" id="username1" runat="server" value="0" /> 
   <input type="hidden" id="cname1" runat="server" value="0" />  
    <input type="hidden" id="cbianhao1" runat="server" value="0" />
  <input type="hidden" id="orderstate1" runat="server" value="0" />
  <input type="hidden" id="totalmoney1" runat="server" value="0" />
  <input type="hidden" id="addtime1" runat="server" value="0" />
  <input type="hidden" id="paytime1" runat="server" value="0" />
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-<asp:Label ID="labTitle" runat="server" Text="订单列表"></asp:Label>
    </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <%if (pageview)
      {%>
    <table width="100%" height="28" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#BBDDE5">
      <tr>
        <td width="1%" height="28">&nbsp; </td>
        <td height="29">
          <table border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td width="74" height="28" align="center" id="td0" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=0"><strong>全部订单</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td1" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=1"><strong>待付款</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td2" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=2"><strong>已付款</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td3" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=3"><strong>已审核</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td5" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=4"><strong>已完成</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td6" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=5"><strong>取消</strong></a> </td>
              <td width="5" align="center"></td>
                <td width="74" height="28" align="center" id="td7" runat="server"><a href="Shop_M_TrademarkOrder.aspx?status=6"><strong>无效</strong></a> </td> <%-- 这里是6 删除 --%>
           <td width="5" align="center"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <%} %>
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>关键词：
          <asp:TextBox ID="txtKeyword" runat="server" Width="80px"></asp:TextBox>&nbsp;
          <asp:DropDownList ID="ddlType" runat="server">
            <asp:ListItem Value="0">所有字段</asp:ListItem>
            <asp:ListItem Value="1">订单号</asp:ListItem>
            <asp:ListItem Value="2">商标注册号</asp:ListItem>
            <%--<asp:ListItem Value="3">专利名称</asp:ListItem>--%>
            <asp:ListItem Value="4">支付方式</asp:ListItem>
            <asp:ListItem Value="5">会员名称</asp:ListItem>
            <asp:ListItem Value="6">会员编号</asp:ListItem>
            <asp:ListItem Value="7">操作备注</asp:ListItem>
          </asp:DropDownList>
          &nbsp;<asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">全部订单</asp:ListItem>
            <asp:ListItem Value="1">待付款</asp:ListItem>
            <asp:ListItem Value="2">已付款</asp:ListItem>
            <asp:ListItem Value="3">已审核</asp:ListItem>
            <asp:ListItem Value="4">已完成</asp:ListItem>
            <asp:ListItem Value="5">取消</asp:ListItem>
              <asp:ListItem Value="6">无效</asp:ListItem>
          </asp:DropDownList>
          &nbsp;</td>
        <td>注册类型：<asp:DropDownList ID="ddl_regtype" runat="server">
          <asp:ListItem Value="0">请选择</asp:ListItem>
          <asp:ListItem Value="1">国内</asp:ListItem>
          <asp:ListItem Value="2">国外</asp:ListItem>
        </asp:DropDownList>
          商标类型：<asp:DropDownList ID="ddl_SbType" runat="server">
            <asp:ListItem Value="0">请选择</asp:ListItem>
            <asp:ListItem Value="1">个人</asp:ListItem>
            <asp:ListItem Value="2">企业</asp:ListItem>
            <asp:ListItem Value="3">代理机构</asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>&nbsp;<asp:DropDownList ID="ddlTimeType" runat="server">
          <asp:ListItem Value="1">下单时间</asp:ListItem>
          <asp:ListItem Value="2">付款时间</asp:ListItem>
        </asp:DropDownList>
          ：<input id="txtStartDate" readonly="true" runat="server" width="80px" />
          <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.txtStartDate);" class="inputcalendarbutton" />
          &nbsp;至&nbsp;
          <input id="txtEndDate" readonly="true" runat="server" width="80px" />
          <input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.txtEndDate);" class="inputcalendarbutton" />
          <asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="button" OnClick="btnSearch_Click" /><asp:Button ID="Button1" runat="server" Style="display: none;" /></td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th width="9%">&nbsp;
          
        </th>
        <th width="9%">
          订单号<a href="Shop_M_TrademarkOrder.aspx?ordernum=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>" title="倒序" id="ordernumdaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ordernum=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>" title="正序" id="ordernumzhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
        <th width="18%">
            商标注册号
        </th>  
        <th width="8%">
          会员编号<a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&cbianhao=desc" title="倒序" id="cbianhaodaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&cbianhao=asc" title="正序" id="cbianhaozhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
        <th width="8%">
          会员<a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&username=desc" title="倒序" id="usernamedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&username=asc" title="正序" id="usernamezhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
       <th width="8%">
          联系人姓名<a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&cname=desc" title="倒序" id="cnamedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&cname=asc" title="正序" id="cnamezhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
        <th width="9%">
          订单状态<a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&orderstate=desc" title="倒序" id="orderstatedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&orderstate=asc" title="正序" id="orderstatezhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
        <th width="11%">
          是否使用优惠券
        </th>
        <th width="13%">
          金额/支付方式<a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&totalmoney=desc" title="倒序" id="totalmoneydaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&totalmoney=asc" title="正序" id="totalmoneyzhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
        <th width="13%">
          下单<a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&addtime=desc" title="倒序" id="addtimedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;
          <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&addtime=asc" title="正序" id="addtimezhengxu" style="display: none;"><span class="sp2"></span></a>
          
          /付款时间 <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&paytime=desc" title="倒序" id="paytimedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;  <a href="Shop_M_TrademarkOrder.aspx?ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&paytime=asc" title="正序" id="paytimezhengxu" style="display: none;"><span class="sp2"></span></a>
        </th>
      </tr>
      <asp:Repeater ID="repOrder" runat="server" OnItemDataBound="repOrder_ItemDataBound">
        <ItemTemplate>
          <tr align="center">
            <td height="28" align="center">
              <asp:CheckBox ID="cbOrder" runat="server" ToolTip='<%#Eval("i_Id")%>' />
            </td>
            <td align="center"><a href="Shop_M_TrademarkOrderInfo.aspx?orderid=<%#Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType%>&status=<%=State %>&RegType=<%=ddl_regtype.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
              <%#Eval("nvc_OrderNumber")%>
            </a></td>
            <td align="center">
              <asp:Repeater runat="server" ID="repProduct">
                <ItemTemplate>
                    <a title="商标注册号：<%#Eval("nvc_SBRegNum")%>" href="Shop_M_TrademarkInfo.aspx?id=<%#Eval("i_TrademarkId")%>"><%#Eval("nvc_SBRegNum")%>
                     </a>
                    <br />
                </ItemTemplate>
              </asp:Repeater>
            </td>
              <td align="center">
              <%# Eval("nvc_UserNum")%>
            </td>
            <td align="center">
              <%# Eval("nvc_Name")%>
            </td>
          <%--  <td align="center">
              <%# GetSBtypeAndName(Eval("i_GuoJiId").ToString(), Eval("i_UserTypeId").ToString())%>
            </td>--%>
               <td align="center">
              <%# Eval("nvc_RealName")%>
            </td>
            <td><font style="color: red;">
              <%#ConvertStatus(Eval("i_Status"))%></font> </td>
            <td>
              <%# Eval("i_IsUseYHQ").ToString()=="1"?Eval("nvc_YouHUIQuan").ToString():"未使用" %>
            </td>
            <td align="center"><span style="color: #F00; font-weight: bold;">￥<%#Math.Round(Convert.ToDecimal(Eval("dm_TotalMoney")), 2)%></span><br />
              <%#Eval("nvc_PayType") %></td>
            <td>
              <%# "下单:"+Eval("dt_AddTime")%>
              <br />
              <span style="color: Red;">
                <%# Eval("dt_PayTime") == null ? "" : "付款:" + Eval("dt_PayTime")%></span> </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <table cellpadding="3" cellspacing="1">
      <tr align="left">
        <td bgcolor="#FFFFFF" height="28">
          <%if (pagedel)
            { %><input type="checkbox" name="AllDel" value="isOk" onclick="CbxAll(this);" />&nbsp;<input type="button" id="btnDelete" runat="server" value="删除" onclick="xwshow()" class="button" /><%} if (pagechu)
            { %><asp:Button ID="btnExport" runat="server" Text="导出订单列表" CssClass="button" OnClick="btnExport_Click" /><%} %>
        </td>
      </tr>
    </table>
  </div>
  <div style="text-align: center">
    <table class="pager" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>
          &nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;</td>
        <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False">
        </webdiyer:AspNetPager>
      </tr>
    </table>
  </div>
  <a id="syy" href="javascript:__doPostBack('aspPage','<%= syy %>')" target="_self"></a><a id="xyy" href="javascript:__doPostBack('aspPage','<%= xyy %>')" target="_self"></a>
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40%"></td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 15%; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="40%" align="right"><img alt="" width="30" src="images/caozuo_2.jpg" /></td>
              <td width="60%" align="left" style="font-size: 14px;">&nbsp;删除成功</td>
            </tr>
          </table>
        </td>
        <td width="45%"></td>
      </tr>
    </table>
  </div>
  <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px; height: 100px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp; </td>
        <td width="230px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /></td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /></td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
      </tr>
      <tr>
        <td></td>
        <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece; background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /></td>
              <td width="80%" align="left" style="font-size: 14px;">&nbsp;确认要进行删除操作吗？</td>
            </tr>
          </table>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td style="font-size: 14px;"><a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDelete_Click">确认</asp:LinkButton></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
            </tr>
          </table>
        </td>
        <td></td>
      </tr>
    </table>
  </div>
  <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp; </td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 200px; font-size: 16px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /></td>
              <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录</td>
            </tr>
          </table>
        </td>
        <td width="40%"></td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" language="javascript">
    function divoperation(ctype, divid)//操作div
    {
      if (ctype == 2) {
        document.getElementById("divbox" + divid).style.display = "none";
      }
      else {
        for (var i = 1; i < 4; i++) {
          if (i == divid) {
            document.getElementById("divbox" + i).style.display = "";
          }
          else {
            document.getElementById("divbox" + i).style.display = "none";
          }
        }
      }
    }
    if (document.getElementById('HiddenDel').value == "del") {
      divoperation(1, '3');
      setTimeout("divoperation(2,'3')", 1500); //1.5秒
    }
    function xwshow() {
      var selectNum = 0;
      $("input:checkbox").each(function (index, dom) {
        if ($(this).attr("checked") == true) {
          selectNum++;
        }
      });
      if (selectNum == 0) {
        divoperation(1, '2');
        setTimeout("divoperation(2,'2')", 1500); //1.5秒            
      }
      else {
        divoperation(1, '1');
      }
    }
  </script>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
      <asp:TemplateField HeaderText="订单号">
        <ItemTemplate>
          <%# Eval("nvc_OrderNumber").ToString() %></ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_UserNum" HeaderText="客户编号" />
      <asp:TemplateField HeaderText="商标类型">
        <ItemTemplate>
          <%# GetSBtypeAndName(Eval("i_CountryId").ToString(), Eval("i_UserTypeId").ToString())%>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="订单状态">
        <ItemTemplate>
          <%# ConvertStatus(Eval("i_Status"))%></ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="dt_AddTime" HeaderText="下单时间" />
      <asp:BoundField DataField="dm_TotalMoney" HeaderText="订单总金额" />
      <asp:TemplateField HeaderText="支付方式">
        <ItemTemplate>
          网银支付</ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="付款时间">
        <ItemTemplate>
          <%# Eval("dt_PayTime") != null && Eval("dt_PayTime").ToString() != "" ? Eval("dt_PayTime") : "未付款"%></ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_MobilePhone" HeaderText="手机号" />
      <asp:BoundField DataField="nvc_TelPhone" HeaderText="电话" />
      <asp:BoundField DataField="nvc_Email" HeaderText="邮箱" />
    </Columns>
  </asp:GridView>
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
<script type="text/javascript">
  //    window.onload=function()
  //    {
  if (isIE) {
    window.onscroll = divIE6;
  }
  //    }
  function divIE6() {
    var top1 = document.documentElement.scrollTop;
    document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
    document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
    //        var kj=document.documentElement.clientHeight;
    //        document.getElementById("divbom").style.top=(top1+kj-45)+'px';
  }
</script>
<script type="text/javascript">
  function CbxAll(obj) {
    $("input:checkbox").each(function (index, dom) {
      if (obj.checked)
        $(this).attr("checked", true); //checkbox全选反选：
      else
        $(this).attr("checked", false);
    });
  }
  function DeleteCheck() {
    if (confirm('您确定要删除所选择的记录吗？')) {
      var selectNum = 0;
      $("input:checkbox").each(function (index, dom) {
        if ($(this).attr("checked") == true) {
          selectNum++;
        }
      });
      if (selectNum > 0)
        return true;
      else {
        alert("请选择您要删除的记录。");
        return false;
      }
    }
    else
      return false;
  }
  function load(sel) {
    var url = sel.options[sel.selectedIndex].value;
    if (url != "") {
      if (typeof (sel.options[sel.selectedIndex].target) != "undefined") {
        open(url, sel.options[sel.selectedIndex].target);
      } else {
        eval(sel.options[sel.selectedIndex].value)
      }
      sel.selectedIndex = 0
    }
    else
    { }
    return false;
  }
</script>
