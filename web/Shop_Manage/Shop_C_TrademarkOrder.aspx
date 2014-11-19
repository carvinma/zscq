<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_C_TrademarkOrder.aspx.cs" Inherits="Shop_Manage_Shop_A_GroupBuy" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" src="js/vcom.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <script type="text/javascript">
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" name="form" runat="server" method="post">
  <input type="hidden" id="Hi_Id" runat="server" value="0" />
  <h1>
    <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 商标信息统计</span>
  </h1>
  <div class="list-div" id="Div1">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          商标订单个数查询
        </th>
      </tr>
      <tr>
        <td align="center" colspan="2">下单时间：
          <input ID="txtStartDate" runat="server" Width="80px" readonly="true" />
          <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.txtStartDate);" class="inputcalendarbutton" />&nbsp;至&nbsp;
          <input ID="txtEndDate" runat="server" Width="80px" ReadOnly="true" />
          <input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.txtEndDate);" class="inputcalendarbutton" />
          <asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="button" OnClick="btnSearch_Click" />
        </td>
      </tr>
    </table>
    <table>
      <tr>
        <td width="250" align="right">全部订单：</td>
        <td align="left"><a href="Shop_M_TrademarkOrder.aspx?status=0&SbType=1&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
          <asp:Literal ID="Ltl_TrademarkOrderCount_1" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">待付款：</td>
        <td align="left"><a href="Shop_M_TrademarkOrder.aspx?status=1&SbType=1&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
          <asp:Literal ID="Ltl_TrademarkOrderCount_2" runat="server"></asp:Literal></a> 个 </td>
      </tr>
      <tr>
        <td align="right">已付款：</td>
        <td align="left"><a href="Shop_M_TrademarkOrder.aspx?status=2&SbType=1&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
          <asp:Literal ID="Ltl_TrademarkOrderCount_3" runat="server"></asp:Literal></a> 个 </td>
      </tr>
      <tr>
        <td align="right">待审核：</td>
        <td align="left"><a href="Shop_M_TrademarkOrder.aspx?status=3&SbType=1&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
          <asp:Literal ID="Ltl_TrademarkOrderCount_4" runat="server"></asp:Literal></a> 个 </td>
      </tr>
      <tr>
        <td align="right">已完成：</td>
        <td align="left"><a href="Shop_M_TrademarkOrder.aspx?status=4&SbType=1&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
          <asp:Literal ID="Ltl_TrademarkOrderCount_5" runat="server"></asp:Literal></a>个 </td>
      </tr>
      <tr>
        <td align="right">无效：</td>
        <td align="left"><a href="Shop_M_TrademarkOrder.aspx?status=5&SbType=1&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
          <asp:Literal ID="Ltl_TrademarkOrderCount_6" runat="server"></asp:Literal></a> 个 </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
      <!-- #include file="push.html" -->  
  </form>
</body>
</html>
<script type="text/javascript">
  if (isIE) {
    window.onscroll = divIE6;
  }
  function divIE6() {
    var top1 = document.documentElement.scrollTop;
    document.getElementById("checkproduct").style.top = (top1 + 40) + 'px';
  }
</script>
<script type="text/javascript" language="javascript">
  var tupian = "<IMG alt=警告 src=\"images/caozuo_3.jpg\" width=15 >";
  var dianji = 0;
  var pnumber = 0;
  function checkinput() {
    if (dianji == 0) {
      dianji = 1;
    }
    var flag = true;


    $("#ftext_head").attr("style", "display: none;"); //block
    $("#fhw_sn").attr("style", "display: none;"); //
    $("#font_Times").attr("style", "display: none;"); //

    var thead = $("#text_head").val();
    if (thead == "") {
      $("#ftext_head").attr("style", "display: ;");
      flag = false;
    } else {
      $("#ftext_head").attr("style", "display: none;");
    }


    if (pnumber != 1) {
    } else {
      flag = false;
    }
    //tuan_start_date,tuan_end_date
    var stime = $("#tuan_start_date").val();
    var etime = $("#tuan_end_date").val();
    if (stime == "" || etime == "") {
      $("#font_Times").attr("style", "display: ;");
      flag = false;
    } else {
      $("#font_Times").attr("style", "display: none;");
    }

    return flag;
  }
  function checknull(inputid, fontid) {
    if (dianji == 1) {
      if (document.getElementById(inputid).value != "") {
        document.getElementById(fontid).style.display = "none";
      }
      else {
        document.getElementById(fontid).style.display = "";
      }
    }
  }
</script>
