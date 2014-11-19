<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword%>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/jQuery.js"></script>
  <script type="text/javascript" src="js/common2.js"></script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <uc3:zscqtop2 ID="zscqtop21" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff; height: 450px;">
    <tr>
      <td align="center" valign="middle">
        <div style="font-size: 24px;">
          <strong style="font-size: 24px;">友情提示：系统发生未知错误，请与管理员联系！</strong><br />
          <br />
          <span id="time" style="font-size: 24px;">5</span>秒后<a id="url" href="index.aspx" style="font-size: 24px;">返回首页</a>
        </div>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
<script type="text/javascript">
  function setTime() {
    var time = parseInt(document.getElementById("time").innerHTML, 10);
    time--;
    document.getElementById("time").innerHTML = time;
    if (time <= 0) {
      window.location = document.getElementById("url").href;
    }
  }
  window.setInterval(setTime, 1000); 
</script>
