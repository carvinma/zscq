<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_Admin.aspx.cs" Inherits="Shop_Manage_shop_admin" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
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
    <%if (mgpageadd)
      { %><span class="action-span"><a href="Shop_A_ManagerGroup.aspx">添加管理组</a></span><%} %>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 管理员列表 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="Div1">
    <%if (mpagedel)
      {%><table cellspacing='1' cellpadding='3'>
        <tr align="left">
          <td height="23">
            <input name="checkall" id="Checkbox1" type="checkbox" onclick="SelAll(this)" />&nbsp;<input type="button" id="Button3" runat="server" value="删除" onclick="xwshow()" class="button" />
          </td>
        </tr>
      </table>
    <%} %>
    <table cellspacing='1' cellpadding='3'>
      <asp:Repeater ID="Rpt_ManagerGroup" runat="server" OnItemDataBound="Rpt_ManagerGroup_ItemDataBound">
        <ItemTemplate>
          <tr>
            <td colspan="2" width="20%"><a href="###" onclick="showtr('<%# Eval("i_Id") %>');"><img id="img<%# Eval("i_Id") %>" src="images/tree_folder4.gif" style="border: 0;" /><b><%# Eval("nvc_Name") %><asp:Label ID="Lb_Items" runat="server"></asp:Label></b></a>
              <asp:HiddenField ID="Hi_Id" runat="server" Value='<%# Eval("i_Id") %>' />
            </td>
            <td align="center">
              <%# Eval("nvc_Remarks")%>
            </td>
            <td width="10%" align="center">
              <%if (mpageadd)
                { %><a title="编辑管理组信息" href="Shop_A_Admin.aspx?id=<%# Eval("i_Id")%>">添加管理员</a><%}%>
            </td>
            <td width="10%" align="center">
              <%if (mgpageupdate)
                { %>
              <input type="button" class="inputicoeditbutton" onclick="javascript:window.location='Shop_U_ManagerGroup.aspx?id=<%# Eval("i_Id")%>'" title="编辑管理组信息" />
              <%--<a title="编辑管理组信息" href="Shop_U_ManagerGroup.aspx?id=<%# Eval("i_Id")%>">修改</a>--%>
              <%}%>
            </td>
            <td width="10%" align="center">
              <%if (mgpagedel)
                { %><%# Eval("i_Id").ToString() == "1" ? "" : "<input title=\"编辑管理组信息\" type=\"button\" class=\"inputicodelbutton\" onclick=\"if (!confirm('确定删除？')) {return false;} else {window.location='Shop_M_Admin.aspx?id=" + Eval("i_Id") + "';}\" />"%><%}%>
            </td>
          </tr>
          <tr id="tr<%# Eval("i_Id") %>" style="display: none;">
            <th width="2%">
            </th>
            <th width="18%">
              管理账号
            </th>
            <th>
              真实姓名
            </th>
            <th>
              &nbsp;
            </th>
            <th>
              &nbsp;
            </th>
            <th>
              &nbsp;
            </th>
          </tr>
          <asp:Repeater ID="Rpt_Manager" runat="server" EnableViewState="false">
            <ItemTemplate>
              <tr id="tr<%# Eval("i_GroupId") %>" style="display: none;">
                <td align="center">
                  <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
                </td>
                <td align="center">
                  <%if (mpageupdate)
                    { %><a title="编辑管理员信息" href="Shop_U_Admin.aspx?id=<%# Eval("i_Id")%>"><%# Eval("nvc_Name")%></a><%}
                    else
                    { %><%# Eval("nvc_Name")%><%} %>
                </td>
                <td align="center">
                  <%# Eval("nvc_RealName")%>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </ItemTemplate>
      </asp:Repeater>
      <tr>
        <td colspan="2"><a href="###" onclick="showtr('0');"><img id="img0" src="images/tree_folder4.gif" style="border: 0;" /><b>独立管理员<asp:Label ID="Lb_Item" runat="server"></asp:Label></b></a> </td>
        <td align="center"></td>
        <td width="10%" align="center">
          <%if (mpageadd)
            { %><a title="编辑管理组信息" href="Shop_A_Admin.aspx?id=0">添加管理员</a><%}%>
        </td>
        <td width="10%" align="center"></td>
        <td width="10%" align="center"></td>
      </tr>
      <tr id="tr0" style="display: none;">
        <th width="2%">
        </th>
        <th width="18%">
          管理账号
        </th>
        <th>
          真实姓名
        </th>
        <th>
          &nbsp;
        </th>
        <th>
          &nbsp;
        </th>
        <th>
          &nbsp;
        </th>
      </tr>
      <asp:Repeater ID="rep_brand" runat="server" EnableViewState="false">
        <ItemTemplate>
          <tr id="tr0" style="display: none;">
            <td align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
            </td>
            <td align="center">
              <%if (mpageupdate)
                { %><a title="编辑管理员信息" href="Shop_U_Admin.aspx?id=<%# Eval("i_Id")%>"><%# Eval("nvc_Name")%></a><%}
                else
                { %><%# Eval("nvc_Name")%><%} %>
            </td>
            <td align="center">
              <%# Eval("nvc_RealName")%>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <%if (mpagedel)
      {%><table cellspacing='1' cellpadding='3'>
        <tr align="left">
          <td height="23">
            <input name="checkall" id="Checkbox2" type="checkbox" onclick="SelAll(this)" />&nbsp;<input type="button" id="Button4" runat="server" value="删除" onclick="xwshow()" class="button" />
          </td>
        </tr>
      </table>
    <%} %>
  </div>
  <%--<div style="text-align:center">
    <table class="pager" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;</td><webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true"
                    FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页"
                    ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO"
                    TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False"></webdiyer:AspNetPager>
        </tr>
    </table>
    </div>--%>
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
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
  </form>
  <script type="text/javascript" src="js/ss.js"></script>
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
