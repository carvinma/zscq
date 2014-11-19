<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_FileExPic.aspx.cs"
  Inherits="Shop_M_FileExPic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script src="js/ss.js" type="text/javascript"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <%if (pageadd)
      { %>
    <span class="action-span">
      <a href="Shop_A_FileExPic.aspx">添加文件图标</a></span>
    <%} %>
    <span class="action-span1">
      <a href="Shop_Index_Main.aspx">管理中心</a></span>
    <span id="search_id" class="action-span1">
      - 文件图标列表</span>
    <div style="clear: both">
    </div>
  </h1>
  <div id="list-div" class="list-div">
    <table cellspacing="1" cellpadding="3">
      <tr>
        <th width="40%">
          文件图标
        </th>
        <th width="30%">
          文件扩展名
        </th>
        <th width="30%">
          操作
        </th>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr>
            <td align="center">
              <img alt="" src="../<%# Eval("nvc_Pic") %>" width="60" />
            </td>
            <td align="center">
              <%# Eval("nvc_FileExtensions")%>
            </td>
            <td align="center">
              <%if (pageupdate)
                { %>
              <a href="Shop_A_FileExPic.aspx?Gid=<%#Eval("i_Id") %>">修改</a>
              <%} %>
              <%if (pagedel)
                { %>
              <a href="javascript:void(0);" title="删除" onclick="xwshow('<%# Eval("i_Id")%>')">删除</a>
              <%} %>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
  </div>
  <input type="hidden" runat="server" id="HiddenDel" value="" />
  <input type="hidden" runat="server" id="Hi_DelId" value="" />
  <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px;
    height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40%">
          <%--0066cc--%>
        </td>
        <td width="15%" style="border: 1px solid #578ece; height: 30px; background: #dfeef5;
          color: Red; padding: 5px; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="40%" align="right">
                <img alt="" width="30" src="images/caozuo_2.jpg" />
              </td>
              <td width="60%" align="left" style="font-size: 14px;">
                &nbsp;删除成功
              </td>
            </tr>
          </table>
        </td>
        <td width="45%">
        </td>
      </tr>
    </table>
  </div>
  <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px;
    height: 100px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          &nbsp;
        </td>
        <td width="230px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg">
                <img src="images/ts1.jpg" width="11" height="27" />
              </td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px;
                line-height: 20px; font-weight: bold;">
                温馨提示
              </td>
              <td width="34" background="images/ts_bg.jpg">
                <img src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="xwhidden()" />
              </td>
            </tr>
          </table>
        </td>
        <td>
          &nbsp;
        </td>
      </tr>
      <tr>
        <td>
          &nbsp;
        </td>
        <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece;
          background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="20%" align="right" style="text-align: right">
                <img alt="" width="30" src="images/caozuo_1.jpg" />
              </td>
              <td width="80%" align="left" style="font-size: 14px;">
                &nbsp;确认要进行删除操作吗？
              </td>
            </tr>
          </table>
        </td>
        <td>
          &nbsp;
        </td>
      </tr>
      <tr>
        <td>
          &nbsp;
        </td>
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece;
          background: #dfeef5; padding: 5px; font-size: 14px; text-align: center;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td style="font-size: 14px;">
                <a style="cursor: pointer;" onclick="asdf()">确认</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###"
                  style="cursor: hand;" onclick="xwhidden()">取消</a>
              </td>
            </tr>
          </table>
        </td>
        <td>
          &nbsp;
        </td>
      </tr>
    </table>
  </div>
  <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px;
    height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          &nbsp;
        </td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
          padding: 5px; width: 200px; font-size: 16px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25%" align="right">
                <img alt="" width="30" src="images/caozuo_3.jpg" />
              </td>
              <td width="75%" align="left" style="font-size: 14px;">
                &nbsp;请选中您要删除的记录
              </td>
            </tr>
          </table>
        </td>
        <td>
          &nbsp;
        </td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" language="javascript">
    if (document.getElementById('HiddenDel').value == "del") {
      document.getElementById("divbox3").style.display = "";
      document.getElementById("divbox1").style.display = "none";
      document.getElementById("divbox2").style.display = "none";
      setTimeout("divhidden()", 1500); //1.5秒
    }
    function asdf() {
      var delid = document.getElementById("Hi_DelId").value;
      window.location = 'Shop_M_FileExPic.aspx?PageType=del&Fid=' + delid;
    }
    function divhidden() {
      document.getElementById("divbox3").style.display = "none";
    }
    function div2hidden() {
      document.getElementById("divbox2").style.display = "none";
    }
    function xwshow(delid) {
      document.getElementById('Hi_DelId').value = delid;
      document.getElementById("divbox1").style.display = "";
      document.getElementById("divbox3").style.display = "none";
      document.getElementById("divbox2").style.display = "none";
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
