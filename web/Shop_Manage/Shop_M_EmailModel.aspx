﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_EmailModel.aspx.cs" Inherits="Shop_Manage_shop_dl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
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
  <form id="form1" runat="server">
  <h1>
    <%if (pageadd)
      {%><span class="action-span"><a href="Shop_A_EmailModel.aspx">添加邮件模板</a></span><%}%>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 邮件模板列表 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    关键词：<input type="text" id="user_namee" size="15" class="input" value="" runat="server" />
    &nbsp;语言版本：
    <asp:DropDownList ID="Drp_LanguageList" runat="server">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="搜索" OnClick="Button1_Click" CssClass="button" />
  </div>
  <div class="list-div" id="listDiv">
    <table cellpadding='3' cellspacing='1'>
      <tr>
        <th width="2%">
          &nbsp;
        </th>
        <th width="20%">
          模板名称
        </th>
        <th width="55%">
          模板标题
        </th>
        <th width="15%">
          排序编号
        </th>
        <th width="8%">
          操作
        </th>
      </tr>
      <asp:Repeater ID="rep_brand" runat="server" EnableViewState="false">
        <ItemTemplate>
          <tr>
            <td height="25" align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>"></td>
            <td align="center">
              <%# Eval("nvc_Name")%></td>
            <td align="center">
              <%# Eval("nvc_Title")%></td>
            <td align="center">
              <%# Eval("i_OrderbyNo")%></td>
            <td align="center">
              <input type="button" class="inputicoeditbutton" onclick="javascript:window.location='Shop_A_EmailModel.aspx?id=<%# Eval("i_Id")%>'" title="<%= pageupdate == true ? "修改" : "查看"%>" />
              <%--<a href="Shop_A_EmailModel.aspx?id=<%# Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=Keyword %>"
                        ><%= pageupdate == true ? "修改" : "查看"%></a>--%>&nbsp;&nbsp; </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr align="left">
        <td height="23" colspan="6">
          <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" />&nbsp;<%if (pagedel)
                                                                                            {%><input type="button" id="Button2" runat="server" value="删除" onclick="xwshow()" class="button" /><%}%></td>
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button2_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
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
  }
</script>
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
