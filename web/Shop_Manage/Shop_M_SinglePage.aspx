<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_SinglePage.aspx.cs" Inherits="Shop_Manage_shop_shezhi" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_Key" value="about" />
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 单页管理 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <div style="background-color: #bbdde5; height: 31px;">
      <table border="0" align="left" height="31" cellpadding="0" cellspacing="0">
        <tr>
          <td width="86" align="center" id="td1" runat="server"><a href="?pagetype=about"><strong>关于我们</strong></a></td>
          <td width="86" align="center" id="td2" runat="server"><a href="?pagetype=contact"><strong>联系我们</strong></a></td>
          <td width="86" align="center" id="td3" runat="server"><a href="?pagetype=tiaokuan"><strong>使用条款</strong></a></td>
          <td width="86" align="center" id="td4" runat="server"><a href="?pagetype=yinsi"><strong>隐私条款</strong></a></td>
          <td width="86" align="center" id="td5" runat="server"><a href="?pagetype=regxy"><strong>商标协议</strong></a></td>
          <td width="86" align="center" id="td10" runat="server"><a href="?pagetype=regxyz"><strong>专利协议</strong></a></td>
          <td width="86" align="center" id="td6" runat="server"><a href="?pagetype=ndap"><strong>年度安排</strong></a></td>
          <td width="86" align="center" id="td7" runat="server"><a href="?pagetype=bottom"><strong>网站底部信息</strong></a></td>
          <td width="20">&nbsp;</td>
          <td width="86" align="center" id="td8" runat="server"><a href="?pagetype=zlpay"><strong>专利付款事项</strong></a></td>
          <td width="20">&nbsp;</td>
          <td width="86" align="center" id="td9" runat="server"><a href="?pagetype=sbpay"><strong>商标付款事项</strong></a></td>
          <td width="86" align="center" id="td11" runat="server"><a href="?pagetype=sblogin"><strong>商标登陆事项</strong></a></td>
          <td width="20">&nbsp;</td>
        </tr>
         <tr>
          <td align="center" id="td12" runat="server"><a href="?pagetype=sbquery"><strong>商标近拟查询</strong></a></td>
          <td align="center" id="td13" runat="server"><a href="?pagetype=sbhelpdoc"><strong>帮助文档说明</strong></a></td>
          <td align="center" id="td14" runat="server"></td>
          <td align="center" id="td15" runat="server"></td>
          <td align="center" id="td16" runat="server"></td>
          <td align="center" id="td17" runat="server"></td>
          <td align="center" id="td18" runat="server"></td>
          <td align="center" id="td19" runat="server"></td>
          <td>&nbsp;</td>
          <td align="center" id="td20" runat="server"></td>
          <td>&nbsp;</td>
          <td align="center" id="td21" runat="server"></td>
          <td align="center" id="td22" runat="server"></td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </div>
  </div>
  <div class="list-div" id="listDiv">
    <table>
      <tr>
        <td align="right" width="65">语言版本：</td>
        <td align="left">
          <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
          </asp:DropDownList>
        </td>
      </tr>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td>
          <script id="uecontent" type="text/plain" name="myContent">
                        <%=content%>
          </script>
          <script type="text/javascript">
            var editor = new baidu.editor.ui.Editor();
            editor.render('uecontent');
          </script>
        </td>
      </tr>
      <%if (pageupdate)
        {%>
      <tr>
        <td align="center">
          <asp:Button ID="btnSubmit" runat="server" Text="提交" class="button" OnClick="btnSubmit_Click" />
        </td>
      </tr>
      <%} %>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  </form>
    <!-- #include file="push.html" -->  
</body>
</html>
