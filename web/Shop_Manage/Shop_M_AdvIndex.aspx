<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_AdvIndex.aspx.cs" Inherits="Shop_Manage_Shop_M_AdvIndex" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
  <script language="JavaScript" type="text/JavaScript">
    function showtr(o) {
      var trs = document.getElementsByTagName('tr');
      var img = document.getElementById('img' + o);
      if (img.src.indexOf('images/tree_folder3.gif') > -1) {
        img.src = 'images/tree_folder4.gif';
        for (var i = 0; i < trs.length; i++) {
          if (trs[i].id == ("tr" + o)) {
            trs[i].style.display = 'none';
          }
        }
      }
      else {
        img.src = 'images/tree_folder3.gif';
        for (var i = 0; i < trs.length; i++) {
          if (trs[i].id == ("tr" + o)) {
            trs[i].style.display = '';
          }
        }
      }
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <%if (pageadd)
      {%><span class="action-span"><a href="Shop_A_AdvIndex.aspx?lang=<%=ddl_language.SelectedValue %>">添加首页广告</a></span><%}%>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 首页广告管理 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="form-div">
    请选择语言版本：<asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
    </asp:DropDownList>
  </div>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <%if (false)
      {%><table cellspacing='1' cellpadding='3'>
        <tr>
          <td>
            <input type="checkbox" name="checkall" id="checkall2" value="CheckAll" onclick="alls(this)" />&nbsp;<input type="button" id="Button1" runat="server" value="删除" onclick="xwshow()" class="button" />
          </td>
        </tr>
      </table>
    <%}%>
    <table cellspacing='1' cellpadding='3'>
      <tr id="tr<%# Eval("i_Id") %>" style="display: ;">
        <th width="2%">
          &nbsp;
        </th>
        <th width="48%">
          广告中文标题
        </th>
        <th width="30%">
          广告英文标题
        </th>
        <th width="10%">
          排序编号
        </th>
        <th width="10%">
          操作
        </th>
      </tr>
      <asp:Repeater ID="advList" runat="server">
        <ItemTemplate>
          <tr>
            <td align="center">
              <input name="selectid" onclick="Selbox(this)" type="checkbox" id="selectid" value="<%#Eval("i_Id") %>"></td>
            <td align="center">
              <%# Eval("nvc_Title")%></td>
            <td align="center">
              <%#Eval("nvc_EnTitle")%>
            </td>
            <td align="center">
              <%#Eval("i_Order")%></td>
            <td align="center">
              <%if (pageupdate)
                {%><a href="Shop_A_AdvIndex.aspx?tid=<%#Eval("i_Id") %>&lang=<%=ddl_language.SelectedValue %>">修改</a><%}%></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <%if (pagedel)
      {%><table cellspacing='1' cellpadding='3'>
        <tr>
          <td>
            <input type="checkbox" name="checkall" id="checkall" value="CheckAll" onclick="alls(this)" />&nbsp;<input type="button" id="Button2" runat="server" value="删除" onclick="xwshow()" class="button" />
          </td>
        </tr>
      </table>
    <%}%>
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
              <td width="11" height="27" background="images/ts_bg.jpg"><img alt="" src="images/ts1.jpg" width="11" height="27" /></td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /></td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
      </tr>
      <tr>
        <td>&nbsp; </td>
        <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece; background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /></td>
              <td width="80%" align="left" style="font-size: 14px;">&nbsp;确认要进行删除操作吗？</td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
      </tr>
      <tr>
        <td>&nbsp; </td>
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; padding: 5px; font-size: 14px; text-align: center;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td style="font-size: 14px;"><a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button2_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
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
      var inputs = document.getElementsByName("selectid");
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
  function alls(checkboxobj) {
    var inputs = document.getElementsByName("selectid");
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].type == "checkbox") {
        inputs[i].checked = checkboxobj.checked;
      }
    }
  }
  function Selbox(obj) {
    var inputs = document.getElementsByName("selectid");
    var checkall = document.getElementById("checkall");
    if (obj.checked == false) {
      checkall.checked = false;
    }
    else {
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == false) {
          inputs.checked = false;
          return;
        }
        else {
          inputs.checked = true;
        }
      }
    }
  }
</script>
