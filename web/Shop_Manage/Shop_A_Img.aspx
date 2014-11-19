<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Img.aspx.cs" Inherits="Shop_Manage_Shop_A_ProductImg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>无标题页</title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    .uploaddiv { float: left; width: <%=divwidth%>px; position: relative; text-align: center; border: solid 1px green; }
    .uploaddiv:hover { color: green; }
    .upload { cursor: pointer; border: none; width: <%=(divwidth/2)+30%>px; height: 22px; filter: alpha(opacity=0); opacity: 0.0; -moz-opacity: 0.0; position: absolute; left: 0; top: 0; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_Session" /> <input type="hidden" runat="server" id="Hi_LoadUrl" />
  <div class="list-div" id="listdiv">
    <table cellpadding="3" cellspacing="1">
      <tr>
        <td>
          <table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <asp:Image ID="Image1" runat="server" Style="float: left;" /></td>
            </tr>
            <tr>
              <td>
                <div class="uploaddiv" title="<%=ram %>">
                  &nbsp;选择图片<asp:FileUpload ID="FileUpload1" CssClass="upload" onchange="javascript:document.getElementById('Button1').click();" hidefocus="true" runat="server" /></div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Button ID="Button1" runat="server" Text="上传" OnClick="Button1_Click" Style="display: none;" /></td>
      </tr>
    </table>
  </div>
  <div id="div_a" style="display: none;" runat="server">
  </div>
  </form>
</body>
</html>
