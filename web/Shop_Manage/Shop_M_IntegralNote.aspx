<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_IntegralNote.aspx.cs" Inherits="Shop_Manage_shop_smscount" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vsport.js"></script>
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" language="javascript" src="images/hoot.js"></script>
  <script type="text/javascript" src="js/Calendar.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 积分流水 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="form-div">
    会员：<input type="text" runat="server" class="input" size="15" id="text_Keyword" />&nbsp; 开始时间：
    <input id="hot_start_date" runat="server" readonly="true" width="80px" />&nbsp;
    <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.hot_start_date);" value="选择" class="button" />
    &nbsp;至&nbsp;
    <input id="hot_end_date" readonly="true" runat="server" width="80px" />&nbsp;
    <input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.hot_end_date);" value="选择" class="button" />
    &nbsp;<asp:Button ID="btnGet" runat="server" Text="搜索" class="button" OnClick="btnGet_Click" />
  </div>
  <div class="list-div" id="listDiv">
    <table cellpadding='3' cellspacing='1'>
      <tr>
        <th width="2%">
          &nbsp;
        </th>
        <th width="19%">
          会员编号
        </th>
        <th width="19%">
          会员账号
        </th>
        <th width="19%">
          积分变化
        </th>
        <th width="19%">
          操作类型
        </th>
        <th width="19%">
          时间
        </th>
        <th width="19%">
          积分状态
        </th>
      </tr>
      <asp:Repeater ID="rep_brand" runat="server" EnableViewState="false">
        <ItemTemplate>
          <tr>
            <td height="25" align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>"></td>
            <td align="center">
              <%# Eval("nvc_UserNum")%></td>
            <td align="center">
              <%# Eval("nvc_Name")%></td>
            <td width="28%" align="center" bgcolor="#FFFFFF">
              <%# Convert.ToDecimal(Eval("i_Integral_2").ToString()) > 0 ? ("+" + Eval("i_Integral_2")) : Eval("i_Integral_2")%>
            </td>
            <td width="15%" align="center" bgcolor="#FFFFFF">
              <%# Eval("nvc_NoteType")%>
            </td>
            <td width="15%" align="center" bgcolor="#FFFFFF">
              <%# Eval("dt_AddTime")%>
            </td>
            <td width="8%" align="center" bgcolor="#FFFFFF"><span style="color: Red;">
              <%# (Convert.ToInt32(Eval("i_status")) == 0 ? "未生效" : "已生效") %></span> </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr align="left">
        <td height="23" colspan="6">
          <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" />&nbsp;全选&nbsp;
          <%if (pagedel)
            {%><input type="button" id="Button2" runat="server" value="删除" onclick="xwshow()" class="button" /><%}%>
          <%if (pagechu && rep_brand.Items.Count > 0)
            {%><asp:Button ID="Button3" runat="server" Text="导出" CssClass="button" OnClick="Button3_Click" /><%}%>
        </td>
      </tr>
    </table>
  </div>
  <div style="text-align: center">
    <table class="pager" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;</td>
        <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False">
        </webdiyer:AspNetPager>
      </tr>
    </table>
  </div>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
      <asp:BoundField DataField="nvc_UserNum" HeaderText="会员编号" />
      <asp:BoundField DataField="nvc_Name" HeaderText="会员账号" />
      <asp:TemplateField HeaderText="积分变化">
        <ItemTemplate>
          <%# Convert.ToDecimal(Eval("i_Integral_2").ToString()) > 0 ? ("+" + Eval("i_Integral_2")) : Eval("i_Integral_2")%>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_NoteType" HeaderText="操作类型" />
      <asp:TemplateField HeaderText="状态">
        <ItemTemplate>
          <%# (Convert.ToInt32(Eval("i_status")) == 0 ? "未生效" : "已生效") %>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="dt_AddTime" HeaderText="操作时间" />
    </Columns>
  </asp:GridView>
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
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
        <td>&nbsp;</td>
        <td width="230px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /></td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示</td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="xwhidden()" /></td>
            </tr>
          </table>
        </td>
        <td>&nbsp;</td>
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="xwhidden()">取消</a></td>
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
        <td>&nbsp;</td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 200px; font-size: 16px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /></td>
              <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录</td>
            </tr>
          </table>
        </td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" language="javascript">
    if (document.getElementById('HiddenDel').value == "del") {
      document.getElementById("divbox").style.display = "";
      document.getElementById("divbox1").style.display = "none";
      document.getElementById("divbox2").style.display = "none";
      setTimeout("divhidden()", 1500); //1.5秒
    }
    function divhidden() {
      document.getElementById("divbox").style.display = "none";
    }
    function div2hidden() {
      document.getElementById("divbox2").style.display = "none";
    }
    function xwshow() {
      var inputs = document.getElementsByName("inputPageid");
      var jb = 0;
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == true) {
          jb = 1;
        }
      }
      if (jb == 0) {
        document.getElementById("divbox2").style.display = "";
        document.getElementById("divbox1").style.display = "none";
        document.getElementById("divbox").style.display = "none";
        setTimeout("div2hidden()", 1500); //1.5秒
      }
      else {
        document.getElementById("divbox1").style.display = "";
        document.getElementById("divbox").style.display = "none";
        document.getElementById("divbox2").style.display = "none";
      }
    }
    function xwhidden() {
      document.getElementById("divbox1").style.display = "none";
    }
  </script>
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
    document.getElementById("divbox").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
</script>
<script type="text/javascript" src="js/ss.js"></script>
<script type="text/javascript" language="javascript">
  function SelAll() {
    var inputs = document.getElementsByTagName("input");
    var checkall = document.getElementById("checkall");
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].type == "checkbox") {
        inputs[i].checked = checkall.checked;
      }
    }
  }
  function Selbox(obj) {
    var inputs = document.getElementsByName("inputPageid");
    var checkall = document.getElementById("checkall");
    if (obj.checked == false) {
      checkall.checked = false;
    }
    else {
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == false) {
          checkall.checked = false;
          return;
        }
        else {
          checkall.checked = true;
        }
      }
    }
  }
</script>
