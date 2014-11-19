<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_NewsType.aspx.cs" Inherits="Shop_Manage_shop_NewsClassAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <script type="text/javascript" src="js/ss.js"></script>
  <script type="text/javascript" src="js/ss.js"></script>
  <script language="JavaScript" type="text/JavaScript">
    function fold(o) {
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
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <% if (pageadd)
       {%><span class="action-span"><a href="Shop_A_NewsType.aspx">添加新闻分类</a></span><%} %><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 新闻分类管理 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="form-div">
    请选择语言版本：<asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
    </asp:DropDownList>
  </div>
  <div class="list-div" id="listDiv">
    <%= table_Category.ToString() %>
  </div>
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40%"></td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 15%; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="40%" align="right"><img alt="" width="30" src="images/caozuo_2.jpg" /> </td>
              <td width="60%" align="left" style="font-size: 14px;">&nbsp;删除成功 </td>
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
        <td width="20%"></td>
        <td width="55%">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /> </td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /> </td>
            </tr>
          </table>
        </td>
        <td width="25%"></td>
      </tr>
      <tr>
        <td width="20%"></td>
        <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece; background: #dfeef5; height: 30px; padding: 5px; width: 55%; font-size: 16px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="15%" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /> </td>
              <td width="85%" style="font-size: 14px; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;确定要删除此分类吗？删除此分类将同时删除所包含的信息，并且不能恢复！ </td>
            </tr>
          </table>
        </td>
        <td width="25%"></td>
      </tr>
      <tr>
        <td width="20%"></td>
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; padding: 5px; width: 55%; font-size: 14px;"><a>
          <asp:LinkButton ID="lbtn_Delete" runat="server" OnClick="lbtn_Delete_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a> </td>
        <td width="25%"></td>
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
              <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /> </td>
              <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录 </td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
        <!-- #include file="push.html" -->    
</body>
</html>
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
<script type="text/javascript">
  //    window.onload=function()
  //    {
  if (isIE) {
    window.onscroll = divIE6;
  }
  //    }
  function divIE6() {
    var top1 = document.documentElement.scrollTop;
    document.getElementById("divbox1").style.top = (top1 + 173) + 'px';
    document.getElementById("divbox3").style.top = (top1 + 200) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
</script>
<script type="text/javascript" language="javascript">
  function SelAll(checkboxobj) {
    var inputs = document.getElementsByTagName("input");
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].type == "checkbox") {
        inputs[i].checked = checkboxobj.checked;
      }
    }
  }
  function Selbox(obj) {
    var inputs = document.getElementsByName("inputPageid");
    var checkall = document.getElementById("checkall");
    var checkall2 = document.getElementById("checkall2");
    if (obj.checked == false) {
      checkall.checked = false;
      checkall2.checked = false;
    }
    else {
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == false) {
          checkall.checked = false;
          checkall2.checked = false;
          return;
        }
        else {
          checkall.checked = true;
          checkall2.checked = true;
        }
      }
    }
  }
</script>
