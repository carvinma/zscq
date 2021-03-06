﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_MessageNote.aspx.cs" Inherits="Shop_Manage_shop_smscount" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body oncontextmenu="return false" onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()">
  <form id="form1" runat="server">
  <div>
    <h1>
      <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 发送短信列表</span>
      <div style="clear: both">
      </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="form-div">
      用户名：<input type="text" name="user_namee" size="12" class="input" value="" runat="server" id="user_namee">&nbsp;<asp:DropDownList ID="ddlType" runat="server" AppendDataBoundItems="True">
      </asp:DropDownList>
      &nbsp;<asp:DropDownList ID="ddlState" runat="server">
        <asp:ListItem Value="所有状态">所有状态</asp:ListItem>
        <asp:ListItem Value="发送成功">发送成功</asp:ListItem>
        <asp:ListItem Value="发送失败">发送失败</asp:ListItem>
      </asp:DropDownList>
      &nbsp;语言版本：
      <asp:DropDownList ID="Drp_LanguageList" runat="server">
      </asp:DropDownList>
      <asp:Button ID="btnSarch" runat="server" Text="搜索" class="button" OnClick="btnSarch_Click" />
    </div>
    <div class="list-div" id="listDiv">
      <table cellspacing='1' cellpadding='3'>
        <asp:Repeater ID="rplist" runat="server">
          <HeaderTemplate>
            <tr>
              <th width="2%">
                &nbsp;
              </th>
              <th width="10%">
                发送系统
              </th>
              <th width="10%">
                发送类型
              </th>
              <th width="10%">
                用户名
              </th>
              <th width="10%">
                发送手机
              </th>
              <th width="35%">
                发送内容
              </th>
              <th width="10%">
                发送状态
              </th>
              <th width="13%">
                发送时间
              </th>
            </tr>
          </HeaderTemplate>
          <ItemTemplate>
            <tr>
              <td align="center">
                <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' />
              </td>
              <td align="center">
                <%#Convert.ToInt32(Eval("i_SystemType"))== 1?"专利系统":Convert.ToInt32(Eval("i_SystemType"))== 2?"商标系统":"总后台"%></td>
              <td height="25" align="center">
                <%#Eval("nvc_NoteType") == null?"":(Eval("nvc_NoteType").ToString ()=="所有类型"?"":Eval("nvc_NoteType")) %>
              </td>
              <td height="25" align="center">
                <%#Eval("nvc_MemberName")%>
              </td>
              <td align="center">
                <%#Eval("nvc_PhoneNumber")%>
              </td>
              <td height="25" align="center">
                <%if (pageadd)
                  { %><a href="Shop_Apl_MessageNote.aspx?i_Id=<%#Eval("i_Id") %>" title='<%#Eval("nvc_Content")%>'><%#Eval("nvc_Content")%></a><%}
                  else
                  { %><%#Eval("nvc_Content")%><%} %>
              </td>
              <td height="25" align="center">
                <%#Eval("nvc_NoteState")%>
              </td>
              <td height="25" align="center">
                <%#Eval("dt_AddTime")%>
              </td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
        <%if (pagedel)
          {%><tr align="left">
          <td colspan="7" height="25">
            <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
          </td>
        </tr>
        <%} %>
      </table>
    </div>
    <table width="98%" border="0" align="center" cellspacing="0">
      <tr>
        <td height="5"></td>
      </tr>
    </table>
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
                  <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDel_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
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
  </div>
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
  function scheck() {
    if (!confirm('确认进行该操作吗？')) return false;
  }
  function alls() {
    var n;
    n = window.form.selectid.length;
    if (n > 0) {
      for (var i = 0; i < n; i++) {
        window.form.selectid[i].checked = window.form.checkbox2.checked;
      }
    }
    else {
      window.form.selectid.checked = window.form.checkbox2.checked;
    }

  }
</script>
