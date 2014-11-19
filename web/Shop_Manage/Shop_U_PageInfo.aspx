<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_U_PageInfo.aspx.cs" Inherits="Shop_Manage_shop_PageManageUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
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
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 页面优化设置 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="list-div" id="list-div">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          修改优化信息
        </th>
      </tr>
      <tr>
        <td align="right"><b>语言版本：</b> </td>
        <td>
          <asp:DropDownList ID="ddl_language" runat="server">
          </asp:DropDownList>
          <font color="#FF0000">(注：若不填则系统默认为中国设置)</font> </td>
      </tr>
      <tr>
        <td align="right" width="15%"><b>页面：</b> </td>
        <td>
          <label id="lb_PageName" runat="server">
          </label>
        </td>
      </tr>
      <tr>
        <td align="right"><b>页面标题：</b> </td>
        <td>
          <input type="text" id="PageTitle" runat="server" maxlength="250" value="" style="width: 400px;" /><font color="#FF0000">(注：若不填则系统默认设置)</font> </td>
      </tr>
      <tr>
        <td align="right"><b>页面关键字：</b> </td>
        <td>
          <input type="text" id="PageKeywords" runat="server" maxlength="250" value="" style="width: 400px;" /><font color="#FF0000">(注：关键词设置在3-5个为最佳,多个关键词之间用&quot;,&quot;隔开)</font> </td>
      </tr>
      <tr>
        <td align="right"><b>页面描述：</b> </td>
        <td>
          <textarea id="PageDescription" runat="server" value="" rows="5" cols="55"></textarea><font color="#FF0000">(注：类别描述字数限制在150以内为最佳,描述最好一句话,不要超过3个关键词)</font> </td>
      </tr>
      <tr>
        <td align="right"></td>
        <td>
          <%if (pageupdate)
            {%><asp:Button ID="Bt_SavePageInfo" runat="server" Text="修改" class="button" OnClick="Bt_SavePageInfo_Click" /><%} %>
          <input type="button" value="取消" class="button" onclick="javascript:window.location='Shop_M_PageInfo.aspx?<%=returnurl %>';" />
        </td>
      </tr>
    </table>
  </div>
  </form>
    <!-- #include file="push.html" -->  
</body>
</html>
