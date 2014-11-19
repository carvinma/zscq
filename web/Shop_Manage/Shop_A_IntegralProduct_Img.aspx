<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_IntegralProduct_Img.aspx.cs" Inherits="Shop_Manage_Shop_A_IntegralProduct_Img" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <style type="text/css">
    .uploaddiv2 { float: left; width: 220px; position: relative; text-align: center; border: solid 1px green; }
    .uploaddiv2:hover { color: green; }
    .upload2 { cursor: pointer; border: none; width: 140px; height: 22px; filter: alpha(opacity=0); opacity: 0.0; -moz-opacity: 0.0; position: absolute; left: 0; top: 0; }
  </style>
  <script type="text/javascript">
    function onsuccess() {
      window.parent.document.getElementById("ifrimg").value = document.getElementById("Hi_Value").value;
    }
    window.onload = function () {
      if (window.parent.document.getElementById("ifrimg").value != "") {
        document.getElementById("Image2").src = "../pic_Big/" + window.parent.document.getElementById("ifrimg").value;
      }
    }
  </script>
</head>
<body>
  <form id="form1" runat="server" method="post">
  <input runat="server" id="Hi_Value" type="hidden" />
  <asp:Image ID="Image2" runat="server" Height="140" ImageUrl="images/mr_webproduct.gif" Width="220" />
  <div class="uploaddiv2">
    <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Style="display: none;" Text="上传" />
    &nbsp;选择图片<asp:FileUpload ID="FileUpload2" runat="server" CssClass="upload2" hidefocus="true" onchange="javascript:document.getElementById('Button3').click();" />
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
