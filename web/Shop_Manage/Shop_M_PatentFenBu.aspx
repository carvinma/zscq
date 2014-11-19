<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_PatentFenBu.aspx.cs" Inherits="Shop_Manage_Shop_A_GroupBuy" ValidateRequest="false" %>

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
    .ul { margin-left: 0px; width: 692px; margin: 2px; }
    .li { width: 168px; float: left; margin-top: -1px; margin-left: -1px; text-align: right; border: 1px solid #CCCCCC; padding-right: 4px; height: 22px; line-height: 20px; }
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
    <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 专利信息统计</span>
  </h1>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="3">
          基本信息
        </th>
      </tr>
      <tr>
        <td width="250" align="right" style="width: 250px;">会员客户总数： </td>
        <td width="1088" align="left"><a href="Shop_M_User.aspx?type=1">
          <%=usercount%></a>个 </td>
      </tr>
      <tr>
        <td align="right">会员客户的国家分布： </td>
        <td align="left">
          <div class="ul">
            <asp:Repeater ID="rp_huiyuanfenbu" runat="server">
              <ItemTemplate>
                <div class="li">
                  <%# Eval("nvc_Name") %>:
                  <%#GetCountNum(Eval("i_Id").ToString())%>(个)</div>
              </ItemTemplate>
            </asp:Repeater>
          </div>
        </td>
      </tr>
      <tr>
        <td align="right">已登记专利总数： </td>
        <td align="left"><a href="Shop_M_Patent.aspx">
          <%=dengjicount %></a> 个 </td>
      </tr>
      <tr>
        <td align="right">已登记专利的国家分布： </td>
        <td align="left">
          <div id="j1">
            <div class="ul">
              <asp:Repeater ID="rp_dengjifenbu" runat="server">
                <ItemTemplate>
                  <div class="li">
                    <%#Eval("nvc_name")%>:
                    <%#Eval("i_num")%>(个)
                  </div>
                </ItemTemplate>
              </asp:Repeater>
            </div>
          </div>
        </td>
      </tr>
      <tr>
        <td align="right">已接受委托的专利类型分布： </td>
        <td align="left">
          <div class="ul">
            <asp:Repeater ID="rp_Typefenbu" runat="server">
              <ItemTemplate>
                <div class="li">
                  <%#Eval("nvc_PatentTypeName")%>:
                  <%#GetCountzhuanliTypeCount(Eval("nvc_PatentTypeName").ToString())%>(个)</div>
              </ItemTemplate>
            </asp:Repeater>
          </div>
        </td>
      </tr>
      <tr>
        <td align="right">已完成缴费的专利总数： </td>
        <td align="left"><a href="Shop_M_Patent.aspx">
          <%=okcount %>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">已放弃缴费的专利总数： </td>
        <td align="left"><a href="Shop_M_Patent.aspx">
          <%=nocount%>
        </a>个</td>
      </tr>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          专利订单个数查询
        </th>
      </tr>
      <tr>
        <td align="center" colspan="2">下单时间：
           <input type="text" id="txtStartDate" readonly="readonly" runat="server" style="width:80px;" />
          <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.txtStartDate);" class="inputcalendarbutton" />&nbsp;至&nbsp;
          <input type="text" id="txtEndDate" readonly="readonly" runat="server" style="width:80px;" />
          <input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.txtEndDate);" class="inputcalendarbutton" />
          <asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="button" OnClick="btnSearch_Click" />
        </td>
      </tr>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td align="right" style="width: 250px;">全部订单：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=0">
          <asp:Literal ID="Ltl_PatentOrderCount_1" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">尚未接收汇款：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=1">
          <asp:Literal ID="Ltl_PatentOrderCount_2" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">接收部分汇款,缴费中：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=2">
          <asp:Literal ID="Ltl_PatentOrderCount_3" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">接收部分汇款,未缴费：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=3">
          <asp:Literal ID="Ltl_PatentOrderCount_4" runat="server"></asp:Literal>
        </a>个</td>
      </tr>
      <tr>
        <td align="right">金额已付,缴费中：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=4">
          <asp:Literal ID="Ltl_PatentOrderCount_5" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">缴费成功,部分金额未付：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=5">
          <asp:Literal ID="Ltl_PatentOrderCount_6" runat="server"></asp:Literal>
        </a>个</td>
      </tr>
      <tr>
        <td align="right">缴费成功,发票已发出：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=6">
          <asp:Literal ID="Ltl_PatentOrderCount_7" runat="server"></asp:Literal>
        </a>个</td>
      </tr>
      <tr>
        <td align="right">缴费成功订单：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=7">
          <asp:Literal ID="Ltl_PatentOrderCount_8" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
      <tr>
        <td align="right">取消缴费订单：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=8">
          <asp:Literal ID="Ltl_PatentOrderCount_9" runat="server"></asp:Literal>
        </a>个</td>
      </tr>
      <tr>
        <td align="right">无效订单：</td>
        <td align="left"><a href="Shop_M_PatentOrder.aspx?status=9">
          <asp:Literal ID="Ltl_PatentOrderCount_10" runat="server"></asp:Literal>
        </a>个 </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  </form>
  <!-- #include file="push.html" -->  
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
