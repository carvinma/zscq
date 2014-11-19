<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shop_manageok.aspx.cs" Inherits="Shop_Manage_shop_manageok" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>管理中心 - 系统信息 </title>
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/transport.js"></script>

    <script type="text/javascript" src="js/common.js"></script>

    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <span class="action-span1"><a href="Login.aspx?act=main">管理中心</a> - 系统信息 </span>
        <div style="clear: both">
        </div>
    </h1>
    <div class="list-div">
        <div style="background: #FFF; padding: 20px 50px; margin: 2px;">
            <table align="center" width="400">
                <tr>
                    <td width="50" valign="top">
                        <img src="images/czcg.jpg" width="32" height="32" border="0" alt="information" />
                    </td>
                    <td style="font-size: 14px; font-weight: bold">
                        操作成功!
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td id="redirectionMsg">
                        如果您不做出选择，将在 <span id="spanSeconds">3</span> 秒后跳转到第一个链接地址。
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <ul style="margin: 0; padding: 0 10px" class="msg-link">
                            <li><a id="href2" runat="server"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="href1" runat="server"></a></li>
                        </ul>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="Hidden1" runat="server" value="" />
        <input type="hidden" id="Hidden2" runat="server" value="" />
        <input type="hidden" id="HiddenType" runat="server" value="" />
    </div>

    <script type="text/javascript" language="JavaScript">
    document.getElementById('href2').href=document.getElementById('Hidden2').value;
    document.getElementById('href1').href=document.getElementById('Hidden1').value;
    var seconds = 3;
    var htype=document.getElementById('HiddenType').value;
    var defaultUrl = document.getElementById('Hidden1').value;
    if(htype=="2")
    {
        defaultUrl = document.getElementById('Hidden2').value;
    }
    onload = function()
    {
      if (defaultUrl == 'javascript:history.go(-1)' && window.history.length == 0)
      {
        document.getElementById('redirectionMsg').innerHTML = '';
        return;
      }
      window.setInterval(redirection, 1000);
    }
    function redirection()
    {
      if (seconds <= 0)
      {
        window.clearInterval();
        return;
      }
      seconds --;
      document.getElementById('spanSeconds').innerHTML = seconds;

      if (seconds == 0)
      {
        window.clearInterval();
        location.href = defaultUrl;
      }
    }
    </script>

    <div id="footer">
        版权所有 &copy; 2006-2013 迪斯卡仑，并保留所有权利。</div>
    </form>
  <!-- #include file="push.html" -->  
  </body>
</html>

