<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Help.aspx.cs" Inherits="Shop_Manage_shop_helpAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <script type="text/javascript">
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_TId" value="0" />
  <div>
    <h1>
      <span class="action-span"><a href="Shop_M_Help.aspx?<%=returnurl %>">帮助列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-
        <%=lbTitle%></span>
      <div style="clear: both">
      </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="list-div" id="listDiv">
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th colspan="2">
            <%=lbTitle%>
          </th>
        </tr>
        <tr>
          <td width="100" align="right" valign="middle">帮助标题： </td>
          <td valign="top">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="inputs200text" onblur="checknull('txtTitle','ftxtTitle')"></asp:TextBox>&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftxtTitle" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写标题</font> </td>
        </tr>
        <tr>
          <td align="right">帮助类别： </td>
          <td>
            <asp:DropDownList ID="ddlType" runat="server">
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td align="right">排序编号： </td>
          <td>
            <asp:TextBox ID="tborderby" runat="server" onkeypress="event.returnValue=IsDigit();" Style="ime-mode: disabled;" CssClass="inputs60text"></asp:TextBox></td>
        </tr>
        <tr>
          <td align="right" valign="top">帮助内容： </td>
          <td valign="top">
            <script id="uecontent" type="text/plain" name="myContent">
                            <%=content%>
            </script>
            <script type="text/javascript">
              var editor = new baidu.editor.ui.Editor();
              editor.render('uecontent');
            </script>
          </td>
        </tr>
        <tr>
          <td align="left"></td>
          <td>
            <%if ((pageadd && Hi_TId.Value == "0") || (pageupdate && Hi_TId.Value != "0"))
              { %><asp:Button ID="Button1" runat="server" Text="提交" class="button" OnClick="btnAdd_Click" OnClientClick="return checkaddnews()" /><%} %><%if (Hi_TId.Value != "0")
                                                                                                                                                          { %>
            <input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_Help.aspx?<%=returnurl %>';" /><%} %>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript" src="js/ss.js"></script>
<script language="JavaScript" type="text/JavaScript">
  var dianji = 0;
  function checkaddnews() {
    if (dianji == 0) {
      dianji = 1;
    }
    document.getElementById('ftxtTitle').style.display = "none";
    if (document.form1.txtTitle.value == "") {
      document.getElementById('ftxtTitle').style.display = "";
      document.form1.txtTitle.focus();
      return false;
    }
  }
  function checknull(inputid, fontid) {
    if (dianji == 1) {
      if (document.getElementById(inputid).value != "") {
        document.getElementById(fontid).style.display = "none";
      }
      else {
        document.getElementById(fontid).style.display = "";
      }
    }
  }
</script>
