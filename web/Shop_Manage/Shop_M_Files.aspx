<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_Files.aspx.cs" Inherits="Shop_M_Files" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
<body>
  <form id="form1" runat="server">
  <h1>
    <%if (pageadd)
      {%>
    <span class="action-span"><a href="Shop_A_Files.aspx">添加文件</a> </span>
    <%} %>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 文件管理 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    名称关键词：<input type="text" id="title" size="15" value="" runat="server" />&nbsp;
    <asp:DropDownList ID="ddl_CType" runat="server">
      <asp:ListItem Value="-1">所属分类</asp:ListItem>
      <asp:ListItem Value="1">环球汇通下载</asp:ListItem>
      <asp:ListItem Value="2">专利局下载</asp:ListItem>
      <asp:ListItem Value="3">商标局下载</asp:ListItem>
      <asp:ListItem Value="4">其他下载</asp:ListItem>
    </asp:DropDownList>
    &nbsp;
    <asp:DropDownList ID="ddl_language" runat="server">
    </asp:DropDownList>
    &nbsp;
    <asp:Button ID="btn_search" runat="server" Text="搜索" CssClass="button" OnClick="btn_search_Click" />
  </div>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th width="2%">&nbsp;
          
        </th>
        <th width="12%">
          排序编号
        </th>
        <th width="22%">
          图片
        </th>
        <th width="32%">
          文件标题
        </th>
        <th width="12%">
          文件大小
        </th>
        <th width="18%">
          上传时间
        </th>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr>
            <td align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
            </td>
            <td align="center">
              <%# Eval("i_Order")%>
            </td>
            <td align="center"><img src="../<%#Eval("nvc_Pic")%>" width="30" height="30" /> </td>
            <td align="center"><a href="Shop_A_Files.aspx?uid=<%# Eval("i_Id") %>&title=<%=title.Value %>&lang=<%=ddl_language.SelectedValue %>&CType=<%=ddl_CType.SelectedValue %>">
              <%# Eval("nvc_FileName")%></a> </td>
            <td align="center">
              <%#GetDW(Eval("i_FileSize"))%>
            </td>
            <td align="center">
              <%# Eval("dt_AddTime")%>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <%if (pagedel)
      {%>
    <table cellspacing='1' cellpadding='3'>
      <tr align="left">
        <td height="25" colspan="4" style="line-height: 22px;">
          <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" />&nbsp;全选&nbsp;
          <input type="button" id="Button1" runat="server" value="删除" onclick="xwshow()" class="button" />
        </td>
      </tr>
    </table>
    <%} %>
  </div>
  <div style="text-align: center">
    <table class="pager" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp; </td>
        <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False">
        </webdiyer:AspNetPager>
      </tr>
    </table>
  </div>
  <br />
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40%">
          <%--0066cc--%>
        </td>
        <td width="15%" style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; font-size: 14px;">
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
        <td>&nbsp; </td>
        <td width="230px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /> </td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="xwhidden()" /> </td>
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
              <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /> </td>
              <td width="80%" align="left" style="font-size: 14px;">&nbsp;确认要进行删除操作吗？ </td>
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
                <asp:LinkButton ID="lbtn_Del" runat="server" OnClick="lbtn_Del_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="xwhidden()">取消</a> </td>
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
              <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /> </td>
              <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录 </td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
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
    //                        document.getElementById('Button2').click();
    //                    function show3()
    //                    {
    //                        if(window.confirm('确定删除?')==true)
    //                        {
    //                            var box=document.getElementById("divbox");
    //                            box.style.display="";
    //                            setTimeout("codefans()",1000);//3秒
    //                        }
    //                        else
    //                        {
    //                            return false;
    //                        }
    //                    }
  </script>
  <script type="text/javascript" src="js/ss.js"></script>
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
