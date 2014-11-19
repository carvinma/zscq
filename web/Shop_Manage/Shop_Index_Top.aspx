<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Index_Top.aspx.cs" Inherits="Shop_Manage_Default" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <base target="main" />
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    #submenu-div ul {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }
    .css {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 20px;
      font-weight: bold;
      color: #FFFFFF;
      text-decoration: none;
    }
    #submenu-div li {
      float: right;
      padding: 0 10px;
      margin: 3px 0;
      border-left: 1px solid #FFF;
    }
    #submenu-div a:visited, #submenu-div a:link {
      color: #FFF;
      text-decoration: none;
    }
    #submenu-div a:hover {
      color: #F5C29A;
    }
    a:visited, a:link {
      color: #FFF;
      text-decoration: none;
    }
    a:hover {
      color: #F5C29A;
      text-decoration: underline;
    }
    #loading-div {
      clear: right;
      text-align: right;
      display: block;
    }
    #menu-div {
      background: #5E96D1;
      font-weight: bold;
      height: 24px;
      line-height: 24px;
    }
    #menu-div ul {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }
    #menu-div li {
      float: left;
      border-right: 1px solid #192E32;
      border-left: 1px solid #BBDDE5;
    }
    #menu-div a:visited, #menu-div a:link {
      display: block;
      padding: 0 20px;
      text-decoration: none;
      color: #fff;
      background: #3672B8;
    }
    #menu-div a:hover {
      color: #000;
      background: #5E96D1;
    }
  </style>
  <script type="text/javascript" src="js/jquery-1.4.4.js"></script>
</head>
<body onload="aaa();">
  <form id="form1" runat="server">
  <body oncontextmenu="return false" onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#5E96D1">
      <tr>
        <td height="63" valign="top" width="100%">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" background="images/logo_01.jpg">
            <tr>
              <td height="16" align="right">
                &nbsp;
              </td>
              <td width="293" align="right">
                <font style="color: #ffffff;">
                  <%= aname%></font>&nbsp;<a href="../index.aspx" target="_blank">网站首页</a>&nbsp;&nbsp;<font color="#ffffff">|</font> &nbsp;&nbsp;<a
                    href="Shop_Quit.aspx?name=<%=aname %>" target="_top">退出系统</a>&nbsp;&nbsp;
              </td>
            </tr>
            <tr>
              <td height="48" align="right" valign="top" class="css">
                <table runat="server" id="table1" width="620" border="0" cellspacing="0" cellpadding="0" style="color: #FFF; font-size: 12px;">
                  <tr id="zhuanli" runat="server">
                    <td width="5%" align="center" height="25">
                      <img src="images/msgtip.gif">
                    </td>
                    <td width="15%" align="center">
                      专利订单提醒：
                    </td>
                    <td width="80%" align="left">
                      <table width="450" border="0" cellspacing="0" cellpadding="0" style="color: #FFF; font-size: 12px;">
                        <tr>
                          <td runat="server" id="td1" width="100" height="12" align="left">
                            未接受汇款订单&nbsp;
                          </td>
                          <td runat="server" align="left" id="ajax" style="color: #333333; font-size: 14px; font-weight: bold; float: left;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                          <td runat="server" id="td2" width="80" align="left">
                            缴费成功订单
                          </td>
                          <td runat="server" align="left" id="ajax2" style="color: #333333; font-size: 14px; font-weight: bold;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                          <td runat="server" id="td3" width="100" align="left">
                            取消缴费订单
                          </td>
                          <td runat="server" align="left" id="ajax3" style="color: #333333; font-size: 14px; font-weight: bold;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                          <td runat="server" id="td4" width="80" align="left">
                            无效订单
                          </td>
                          <td runat="server" align="left" id="ajax4" style="color: #333333; font-size: 14px; font-weight: bold;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr id="shangbiao" runat="server">
                    <td width="5%" align="center" height="25">
                      <img src="images/msgtip.gif">
                    </td>
                    <td width="15%" align="center">
                      商标订单提醒：
                    </td>
                    <td width="80%" align="left">
                      <table width="450" border="0" cellspacing="0" cellpadding="0" style="color: #FFF; font-size: 12px;">
                        <tr>
                          <td runat="server" id="td11" width="80" height="12" align="left">
                            待付款订单&nbsp;
                          </td>
                          <td runat="server" align="left" id="ajax11" style="color: #333333; font-size: 14px; font-weight: bold; float: left;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                          <td runat="server" id="td12" width="80" align="left">
                            已完成订单
                          </td>
                          <td runat="server" align="left" id="ajax12" style="color: #333333; font-size: 14px; font-weight: bold;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                          <td runat="server" id="td13" width="100" align="left">
                           取消订单
                          </td>
                          <td runat="server" align="left" id="ajax13" style="color: #333333; font-size: 14px; font-weight: bold;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                          <td runat="server" id="td14" width="80" align="left">
                          无效订单  
                          </td>
                          <td runat="server" align="left" id="ajax14" style="color: #333333; font-size: 14px; font-weight: bold;">
                            <img src="images/loading.gif" style="width: 12px; height: 12px;" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
              <td>
                &nbsp;
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <div id="menu-div">
      <ul>
        <li class="fix-spacel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
        <li><a href="Shop_Index_Main.aspx" target="main">起始页</a></li>
        <%if (flag[10][0].ToString() == "1")
          { %><li><a href="Shop_M_User.aspx?type=1" target="main">专利会员列表</a></li><%} %>
        <%if (flag[20][0].ToString() == "1")
          { %><li><a href="Shop_M_User.aspx?type=2" target="main">商标会员列表</a></li><%} %>
        <%if (flag[60][0].ToString() == "1")
          { %><li><a href="Shop_M_News.aspx" target="main">新闻列表</a></li><%} %>
        <%if (flag[11][0].ToString() == "1")
          { %><li><a href="Shop_M_Patent.aspx" target="main">专利列表</a></li><%} %>
        <%if (flag[12][0].ToString() == "1")
          { %><li><a href="Shop_M_PatentOrder.aspx?Status=0" target="main">专利订单</a></li><%} %>
        <%if (flag[21][0].ToString() == "1")
          { %><li><a href="Shop_M_Trademark.aspx" target="main">商标列表</a></li><%} %>
        <%if (flag[22][0].ToString() == "1")
          { %><li><a href="Shop_M_TrademarkOrder.aspx?Status=0" target="main">商标订单</a></li><%} %>
      </ul>
      <br class="clear" />
    </div>
  </form>
</body>
</html>
<script type="text/javascript">
  $(function () {
    if (document.getElementById('table1').style.display != "none") {
      
    }
  });
  function aaa() {
    var rand = Math.floor(Math.random() * 1000000);
    var kkk = "cc=a&n=" + rand;
    if (document.getElementById('td1').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax").html("<a href='Shop_M_PatentOrder.aspx?Status=1'>" + data + "</a>"); }
      });
    }
    var kkk = "cc=b&n=" + rand;
    if (document.getElementById('td2').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax2").html("<a href='Shop_M_PatentOrder.aspx?Status=7'>" + data + "</a>"); }
      });
    }
    var kkk = "cc=c&n=" + rand;
    if (document.getElementById('td3').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax3").html("<a href='Shop_M_PatentOrder.aspx?Status=8'>" + data + "</a>"); }
      });
    }
    var kkk = "cc=d&n=" + rand;
    if (document.getElementById('td4').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax4").html("<a href='Shop_M_PatentOrder.aspx?Status=9'>" + data + "</a>"); }
      });
    }
    //商标统计
    var kkk = "cc=11&n=" + rand;
    if (document.getElementById('td11').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax11").html("<a href='Shop_M_TrademarkOrder.aspx?Status=1'>" + data + "</a>"); }
      });
    }
    var kkk = "cc=12&n=" + rand;
    if (document.getElementById('td12').style.display != "none") {
      $.ajax({
        type: "GET", 
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax12").html("<a href='Shop_M_TrademarkOrder.aspx?Status=4'>" + data + "</a>"); }
      });
    }
    var kkk = "cc=13&n=" + rand;
    if (document.getElementById('td13').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax13").html("<a href='Shop_M_TrademarkOrder.aspx?Status=5'>" + data + "</a>"); }
      });
    }
    var kkk = "cc=15&n=" + rand;
    if (document.getElementById('td14').style.display != "none") {
      $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function (data) { $("#ajax14").html("<a href='Shop_M_TrademarkOrder.aspx?Status=6'>" + data + "</a>"); }
      });
    }
  }
</script>
