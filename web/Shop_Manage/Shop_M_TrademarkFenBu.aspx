<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_TrademarkFenBu.aspx.cs" Inherits="Shop_Manage_Shop_A_GroupBuy" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript">
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <style type="text/css">
    .ul { margin-left: 0px; width: 692px; margin: 2px; }
    .li { width: 168px; float: left; margin-top: -1px; margin-left: -1px; text-align: right; border: 1px solid #CCCCCC; padding-right: 4px; height: 22px; line-height: 20px; }
  </style>
</head>
<body>
  <form id="form1" name="form" runat="server" method="post">
  <input type="hidden" id="Hi_Id" runat="server" value="0" />
  <h1>
    <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 商标信息统计</span>
  </h1>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td>
          <table cellspacing='1' cellpadding='3'>
            <tr>
              <th colspan="2">
                基本信息
              </th>
            </tr>
            <tr>
              <td align="right" style="width: 186px;">商标客户总数： </td>
              <td align="left"><a href="Shop_M_User.aspx?type=2">
                <%=usercount%></a>个 </td>
            </tr>
            <tr>
              <td align="right">商标客户的国家分布： </td>
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
              <td align="right">已登记商标总数： </td>
              <td align="left"><a href="Shop_M_Trademark.aspx">
                <%=dengjicount %></a> 个 </td>
            </tr>
            <tr>
              <td align="right">已登记商标的国家分布： </td>
              <td align="left">
                <div class="ul">
                  <asp:Repeater ID="rp_dengjifenbu" runat="server">
                    <ItemTemplate>
                      <div class="li">
                        <%#GetCountryName(Eval("i_GuoJiId").ToString())%>:
                        <%#GetCountShangbiaoNum(Eval("i_GuoJiId").ToString(), 0)%>(个)</div>
                    </ItemTemplate>
                  </asp:Repeater>
                </div>
              </td>
            </tr>
            <tr>
              <td align="right">已接受委托的商标总数： </td>
              <td align="left"><a href="Shop_M_Trademark.aspx?jiaofeitype=2">
                <%=weituocount %></a>个 </td>
            </tr>
            <tr>
              <td align="right">已接受委托的商标的国家分布： </td>
              <td align="left">
                <div class="ul">
                  <asp:Repeater ID="rp_weituofenbu" runat="server">
                    <ItemTemplate>
                      <div class="li">
                        <%#GetCountryName(Eval("i_GuoJiId").ToString())%>:
                        <%#GetCountShangbiaoNum(Eval("i_GuoJiId").ToString(), 2)%>(个)</div>
                    </ItemTemplate>
                  </asp:Repeater>
                </div>
              </td>
            </tr>
            <tr>
              <td align="right">已完成缴费委托的商标总数： </td>
              <td align="left">
                <%=okcount %>
              个 </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
  <br />
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
