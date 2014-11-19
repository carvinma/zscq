<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Index.aspx.cs" Inherits="Shop_Manage_shop_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="js/jquery-1.4.4.js"></script>
<script type="Text/Javascript" language="JavaScript">
if (window.top != window)
{
  window.top.location.href = document.location.href;
}
</script>
<script type="text/javascript">
function exit()
{
    var rand = Math.floor(Math.random() * 1000000);
    var kkk = "cc=exit&n=" + rand;
    $.ajax({
            type: "GET",
            url: "Ajax_tuisong.aspx",
            data: kkk
        });
}
</script>
<frameset onunload="exit()" rows="89,*" framespacing="0" border="0">
  <frame src="Shop_Index_Top.aspx" id="header-frame" name="header-frame" frameborder="no" scrolling="no">
  <frameset cols="236, 10, *" framespacing="0" border="0" id="frame-body">
    <frame src="Shop_Index_Left.aspx" id="menu-frame" name="menu-frame" frameborder="no" scrolling="yes">
    <frame src="Shop_Index_Drag.aspx" id="drag-frame" name="drag-frame" frameborder="no" scrolling="no">
    <frame src="Shop_Index_Main.aspx" id="main" name="main" frameborder="no" scrolling="yes">
  </frameset>
</frameset>
</head>
<body oncontextmenu="return false" onbeforecopy="return false"  oncopy="document.selection.empty()" onselect="document.selection.empty()">
</body>
</html>
