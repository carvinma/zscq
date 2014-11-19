<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_FileExPic.aspx.cs"
  Inherits="Shop_A_FileExPic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script src="js/ss.js" type="text/javascript"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript">
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
</head>
<body oncontextmenu="return false" onbeforecopy="return false" oncopy="document.selection.empty()"
  onselect="document.selection.empty()">
  <form id="form1" runat="server" method="post" onsubmit="return checkadduser()">
  <input type="hidden" runat="server" id="HiId" value="0" />
  <h1>
    <span class="action-span">
      <a href="Shop_M_FileExPic.aspx">文件图标列表</a></span>
    <span class="action-span1">
      <a href="Shop_Index_Main.aspx">管理中心</a>
    </span>
    <span id="search_id" class="action-span1">
      - 添加文件图标
    </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          添加文件图标
        </th>
      </tr>
      <tr>
        <td width="150" align="right">
          文件扩展名：
        </td>
        <td>
          <input id="text_Name" runat="server" type="text" size="30" class="inputs200text"
            maxlength="30" />&nbsp;
          <span>
            (如:*.doc|*.docx)
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="(\*.[a-z0-9]{1,10}(\|?))*"
              ControlToValidate="text_Name" runat="server" ErrorMessage="格式不正确"></asp:RegularExpressionValidator></span>
        </td>
      </tr>
      <tr>
        <td align="right">
          上传图标：
        </td>
        <td align="left">
          <input type="hidden" id="HiLogo" runat="server" value="" />
          <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
      </tr>
      <tr>
        <td align="center">
          &nbsp;
        </td>
        <td>
          <%if ((pageadd && HiId.Value == "0") || (pageupdate && HiId.Value != "0"))
            { %>
          <asp:Button ID="Button1" runat="server" Text="提交" CssClass="button" OnClick="Button1_Click" />
          <%} if (HiId.Value != "0")
            { %>
          <input type="button" onclick="javascript:window.location='Shop_M_FileExPic.aspx';"
            value="返回" class="button" />
          <%} %>
        </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  </form>
      <!-- #include file="push.html" -->
</body>
</html>
<script language="JavaScript" type="text/JavaScript">
  function checkadduser() {
    if (document.form1.text_Name.value == "") {
      alert("文件扩展名不能为空！");
      document.form1.text_Name.focus();
      return false;
    }
    if (document.getElementById('HiId').value == "0") {
      if (document.getElementById('FileUpload1').value == "") {
        alert("图标不能为空！");
        document.form1.FileUpload1.focus();
        return false;
      }
    }
  }
</script>
