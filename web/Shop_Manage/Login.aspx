<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Shop_Manage_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>电子商城信息管理中心</title>
  <link rel="stylesheet" type="text/css" href="images/logindomain.css">
  <script type="text/javascript" language="javascript">
    function SetFocus() {
      if (document.form1.UserName.value == "")
        document.form1.UserName.focus();
      else
        document.form1.UserName.select();
    }
    function CheckForm() {
      if (document.Login.UserName.value == "") {
        alert("请输入用户名！");
        document.Login.UserName.focus();
        return false;
      }
      if (document.Login.Password.value == "") {
        alert("请输入密码！");
        document.Login.Password.focus();
        return false;
      }
      if (document.Login.verifycode.value == "") {
        alert("请输入验证码！");
        document.Login.verifycode.focus();
        return false;
      }

    }
    function reloadcode() {
      document.getElementById('safecode').src = 'v.aspx?' + Math.random();
    }
  </script>
</head>
<body style="background: url(images/cn_logo_top.gif) #275f9a repeat-x left top" onload="SetFocus()" onclick="ieMouseOut()" oncontextmenu="youjian()" onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()">
  <noscript>
    <iframe scr="*.html"></iframe>
  </noscript>
  <form id="form1" onsubmit="return check_input();" runat="server" defaultbutton="imgbtnSubmit">
  <%--<form id="form1" runat="server" onsubmit="return check_input();" method="post" name="domainlogin" action="/cgi-bin/domainportal/pdomainlogin.cgi">--%>
  <div class="cn_login03">
    <div class="cn_login_top03">
      <img align="absMiddle" src="images/cn_login_logo02.gif"></div>
    <div class="cn_login_con03">
      <div>
        <label>
          管理账户：</label><asp:TextBox ID="UserName" runat="server" class="cn_login03_input01" name="domainname"></asp:TextBox>
      </div>
      <div>
        <label>
          管理密码：</label><asp:TextBox ID="Password" runat="server" class="cn_login03_input02" name="domainpass" TextMode="Password"></asp:TextBox>
      </div>
      <div>
        <table width="265" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="61" align="right">
              <label>
                验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label></td>
            <td width="60" align="left">
              <asp:TextBox ID="txtyzm" runat="server" class="cn_login03_input04" name="domainname"></asp:TextBox></td>
            <td width="60"><img id="safecode" src="v.aspx" onclick="reloadcode()" title="点击更换" style="vertical-align: bottom; cursor: pointer;" /></td>
            <td width="84"><a href="#" style="vertical-align: bottom; font-size: 12px; cursor: pointer;" onclick="reloadcode()">点击更换</a></td>
          </tr>
        </table>
      </div>
      <div>
        <asp:Button type="button" runat="server" ID="imgbtnSubmit" Style="cursor: pointer;" CssClass="cn_login03_button" OnClick="imgbtnSubmit_Click" Text="登陆" /><input type="button" style="cursor: pointer;" class="cn_login03_button" onclick="window.location='login.aspx'" value="重置" />
      </div>
    </div>
    <%--<div class="cn_login_bottom03">
    </div>--%>
  </div>
  <div id="xsimg" style="display: none; padding: 1px; border: solid 1px #578ece; background-color: #fff; width: 150px; text-align: left; height: 20px; line-height: 20px; font-size: 12px;">
    <div style="width: 100%; cursor: pointer;" onmousemove="this.style.backgroundColor='#578ece'" onmouseout="this.style.backgroundColor='#fff'" onclick="javascript:window.location='Login.aspx';">
      &nbsp;&nbsp;&nbsp;&nbsp;刷新</div>
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
  <%-- </form>--%>
</body>
</html>
<script type="text/javascript">
  var img = document.getElementById('xsimg');
  function youjian() {
    imgxs();
    return false;
  }
  function imgxs() {
    var top1 = document.documentElement.scrollTop + document.body.scrollTop;
    var top = window.event.clientY;
    var left = window.event.clientX;
    img.style.display = "";
    img.style.left = (left + 10) + 'px';
    img.style.top = (top + top1 + 10) + 'px';
    img.style.zIndex = 9999;
  }
  function ieMouseOut() {
    img.style.display = "none";
  }
</script>
