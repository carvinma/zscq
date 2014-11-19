<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_Coupon.aspx.cs" Inherits="Shop_Manage_shop_yhj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" language="javascript" src="images/hoot.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form runat="server">
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 优惠券列表 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <input type="text" id="txtProName" title="搜索关键词" runat="server" size="15" value="" />&nbsp;<asp:DropDownList ID="DDL_SType" runat="server">
      <asp:ListItem Value="1">优惠券码</asp:ListItem>
      <asp:ListItem Value="2">会员用户名</asp:ListItem>
    </asp:DropDownList>
    &nbsp;<%--<asp:DropDownList 
            ID="DDL_Member" runat="server" AppendDataBoundItems="True"> 
        <asp:ListItem Value="0">全部优惠券</asp:ListItem>
        <asp:ListItem Value="1">有会员拥有</asp:ListItem>
        <asp:ListItem Value="2">无会员拥有</asp:ListItem>
    </asp:DropDownList>--%>&nbsp;<asp:DropDownList ID="DDL_CouponType" runat="server" AppendDataBoundItems="True">
    </asp:DropDownList>
    &nbsp;<asp:DropDownList ID="DDL_State" runat="server">
      <asp:ListItem Value="0">全部状态</asp:ListItem>
      <asp:ListItem Value="1">未使用</asp:ListItem>
      <asp:ListItem Value="2">已使用</asp:ListItem>
      <%--<asp:ListItem Value="3">已作废</asp:ListItem>--%>
    </asp:DropDownList>
    &nbsp;<asp:DropDownList ID="DDL_TimeType" runat="server">
      <asp:ListItem Value="1">生成时间</asp:ListItem>
      <asp:ListItem Value="2">过期时间</asp:ListItem>
      <asp:ListItem Value="3">使用时间</asp:ListItem>
    </asp:DropDownList>
    ：&nbsp;<input runat="server" name="hot_start_date" type="text" id="hot_start_date" size="10" value='' readonly="readonly" /><input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.hot_start_date);" value="选择" class="button" />&nbsp;至&nbsp;<input runat="server" name="hot_end_date" type="text" id="hot_end_date" size="10" value='' readonly="readonly" /><input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.hot_end_date);" value="选择" class="button" /><asp:Button ID="btnso" runat="server" Text="搜索" CssClass="button" OnClick="btnso_Click" />
  </div>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th width="2%">
          &nbsp;
        </th>
        <th width="9%">
          优惠券码
        </th>
        <th width="14%">
          优惠券种类名称
        </th>
        <th width="6%">
          面值
        </th>
        <%--<th width="6%">
          购物满
        </th>--%>
        <th width="16%">
          状态
        </th>
        <th width="12%">
          拥有者
        </th>
        <th width="10%">
          来源
        </th>
        <th width="25%">
          有效期
        </th>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr>
            <td height="25" align="center">
              <input type="checkbox" name="inputPageid" onclick="Selbox(this);" value="<%# Eval("i_Id") %>"></td>
            <td align="center">
              <%# Eval("nvc_Code") %></td>
            <td align="center">
              <%# Eval("nvc_Name") %></td>
            <td align="center">
              <%# Eval("i_Money") %></td>
            <%--<td align="center">
              <%# Eval("i_Where") %></td>--%>
            <td align="center">
              <%# Eval("i_State") != null && Eval("i_State").ToString() == "1" ? "未使用" : Eval("i_State").ToString() == "2" ? "已使用：" + Eval("dt_UpdateStateTime").ToString() : "已作废：" + Eval("dt_UpdateStateTime").ToString()%></td>
            <td align="center">
              <%# Eval("nvc_MemberName") == null ? "无" : Geturla(Eval("i_MemberId").ToString())%></td>
            <td align="center">
              <%# Eval("nvc_From") %></td>
            <td align="center">
              <%# Eval("dt_AddTime")%>&nbsp;至&nbsp;<%# Eval("dt_ExpireTime")%></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr align="left">
        <td height="25">
          <input type="checkbox" id="checkall" value="isOk" onclick="SelAll();" />&nbsp;
          <%if (pagedel)
            { %><input type="button" id="btnzf" runat="server" value="删除" onclick="xwshow()" class="button" /><%} %>
          <%if (pagechu)
            { %><asp:Button ID="Button2" runat="server" Text="导出" OnClick="Button2_Click" CssClass="button" /><%} %>
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
      <asp:BoundField DataField="nvc_Code" HeaderText="优惠券码" />
      <asp:BoundField DataField="nvc_Name" HeaderText="优惠券种类名称" />
      <asp:BoundField DataField="i_Money" HeaderText="面值" />
      <%--<asp:BoundField DataField="i_Where" HeaderText="使用条件：购物满" />--%>
      <asp:TemplateField HeaderText="状态">
        <ItemTemplate>
          <%# Eval("i_State") != null && Eval("i_State").ToString() == "1" ? "未使用" : Eval("i_State").ToString() == "2" ? "已使用：" + Eval("dt_UpdateStateTime").ToString() : "已作废：" + Eval("dt_UpdateStateTime").ToString()%>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_MemberName" HeaderText="拥有者" />
      <asp:BoundField DataField="nvc_From" HeaderText="来源" />
      <asp:TemplateField HeaderText="有效期">
        <ItemTemplate>
          <%# Eval("dt_AddTime")%>至<%# Eval("dt_ExpireTime")%>
        </ItemTemplate>
      </asp:TemplateField>
    </Columns>
  </asp:GridView>
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40%"></td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 15%; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td style="text-align: right"><img alt="" width="30" src="images/caozuo_2.jpg" /> </td>
              <td style="font-size: 14px;">删除成功 </td>
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
              <td width="80%" align="left" style="font-size: 14px;">&nbsp;确认要进行作废操作吗？</td>
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnzf_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
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
        <td width="40%"></td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 20%; font-size: 16px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td style="text-align: right"><img alt="" width="30" src="images/caozuo_3.jpg" /> </td>
              <td style="font-size: 14px;">请选中想要删除的优惠券 </td>
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
      var inputs = document.getElementsByName("inputPageid");
      var jb = 0;
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == true) {
          jb = 1;
        }
      }
      if (jb == 0) {
        divoperation(1, '2');
        setTimeout("divoperation(2,'2')", 1500); //1.5秒
      }
      else {
        divoperation(1, '1');
      }
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
    document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
</script>
<script type="text/javascript" src="js/ss.js"></script>
<script type="text/javascript" language="javascript">
  function SelAll() {
    var inputs = document.getElementsByName("inputPageid");
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
