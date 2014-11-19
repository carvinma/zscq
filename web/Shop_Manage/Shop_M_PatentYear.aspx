<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_PatentYear.aspx.cs" Inherits="Shop_Manage_Shop_M_Patent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script src="js/fucties.js" type="text/javascript"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <div>
    <h1>
      <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 专利年次列表 </span>
      <div style="clear: both">
      </div>
    </h1>
    <div class="form-div">
      <%if (pageadd)
        { %>
      <asp:UpdatePanel runat="server">
        <ContentTemplate>
          名称：<asp:TextBox ID="Txt_Name" runat="server" CssClass="inputs200text " MaxLength="30"></asp:TextBox>
          排序：<asp:TextBox ID="Txt_OrderBy" runat="server" MaxLength="9" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" CssClass="inputs60text" Style="ime-mode: disabled;"></asp:TextBox>
          <asp:Button ID="Btn_Add" runat="server" Text="添加年次" class="button" ValidationGroup="add" OnClick="Btn_Add_Click" />
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Txt_Name" ErrorMessage="填写名称" Display="Dynamic" ValidationGroup="add"></asp:RequiredFieldValidator>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Txt_OrderBy" ErrorMessage="填写排序" ValidationGroup="add" Display="Dynamic"></asp:RequiredFieldValidator>
        </ContentTemplate>
      </asp:UpdatePanel>
      <%} %>
    </div>
    <div class="list-div" id="listDiv">
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th width="2%">
          </th>
          <th width="34%">
            名称
          </th>
          <th width="34%">
            排序
          </th>
          <th width="30%">
            操作
          </th>
        </tr>
        <asp:Repeater ID="reptlist" runat="server">
          <ItemTemplate>
            <tr>
              <td height="26" align="center">
                <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' /></td>
              <td align="center">
                <input id="Txt_Name_<%#Eval("i_Id") %>" type="text" value='<%#Eval("nvc_Year")%>' maxlength="30" />
              </td>
              <td align="center">
                <input id="Txt_OrderBys_<%#Eval("i_Id") %>" MaxLength="6" type="text" value='<%#Eval("i_OrderBy")%>' onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
              </td>
              <td align="center">
                <input id="Btn_Update" type="button" value="修改" class="button" onclick="Edit(<%#Eval("i_Id") %>)" />
                <%-- <asp:Button ID="Btn_Update" runat="server" Text="修改" CssClass="button" CommandName='<%#Eval("i_Id") %>'  OnCommand='Edit'/>--%>
              </td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
      </table>
      <table cellspacing='1' cellpadding='3'>
        <tr align="left">
          <td height="25">
            <%if (pagedel)
              { %><input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value='' />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
            <%} %>
          </td>
        </tr>
      </table>
    </div>
    <div style="text-align: center">
    </div>
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
  <div id="div_a" runat="server">
  </div>
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
    document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
    document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
</script>
<script type="text/javascript">
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
  function Edit(obj) {
    var name = $("#Txt_Name_" + obj).val();
    var order = $("#Txt_OrderBys_" + obj).val();
    if (name == "") {
      alert("请填写名称"); return;
    }
    if (order == "") {
      alert("请填写排序"); return;
    }
    $.ajax({
      type: "POST",
      url: "Shop_A_Patent.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=PatentYear&id=" + obj + "&Txt_Name=" + name + "&Txt_OrderBys=" + order,
      success: function (msg) {
        if (msg == "ok") {
          alert("修改成功");
        }
        else {
          alert("修改失败");
        }
      }
    });
  }
  function IsDigit() {
    return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) &&
(event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
  }  
</script>
