<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_AdvType.aspx.cs" Inherits="Shop_Manage_shop_NewsClassAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <% if (pageadd)
       {%><span class="action-span"><a href="Shop_A_AdvType.aspx?lang=<%=ddl_language.SelectedValue %>">添加广告位</a></span><%} %><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 广告位管理 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="form-div">
    请选择语言版本：
    <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
    </asp:DropDownList>
  </div>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <thead>
        <tr>
          <th>
            广告位
          </th>
          <th>
            类型
          </th>
          <th>
            广告数量
          </th>
          <th>
            备注
          </th>
          <th>
            操作
          </th>
        </tr>
      </thead>
      <tbody>
        <asp:Repeater ID="reptlist" runat="server">
          <ItemTemplate>
            <tr>
              <td align="center">
                <% if (pageupdate)
                   {%><a href="Shop_A_AdvType.aspx?id=<%#Eval("i_Id") %>&lang=<%=ddl_language.SelectedValue %>"><%#Eval("nvc_Name")%></a><%}
                   else
                   { %><%#Eval("nvc_Name")%><%} %>
              </td>
              <td align="center">
                <%#Eval("i_Type").ToString()=="1"?"文字":"图片" %></td>
              <td align="center">
                <%#Eval("i_Max")%></td>
              <td align="center">
                <%#Eval("nvc_Remarks")%></td>
              <td align="center">
                <% if (pagedel)
                   {%>
                <input type="button" title="删除" class="inputicodelbutton" onclick="urlTo('<%# Eval("i_Id") %>')" />
                <%--<a href="?id=<%# Eval("i_Id") %>"  onclick="if(!confirm('确定删除？')){return false;}">删除</a>--%><%} %>
              </td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
      </tbody>
    </table>
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  <div id="div_a" runat="server">
  </div>
  </form>
    <!-- #include file="push.html" -->    
</body>
</html>
<script type="text/javascript">
  function urlTo(id) {
    if (!confirm('确定删除？')) {
      return false;
    } else {
      var url = "Shop_M_AdvType.aspx?id=" + id + "&lang=" + document.getElementById("ddl_language").value;
      window.location = url;
    }
  }
</script>
