<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_NewsType.aspx.cs" Inherits="Shop_Manage_shop_NewsClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
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
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_TId" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_NewsType.aspx">新闻分类列表</a></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 新闻分类添加 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          添加类别
        </th>
      </tr>
      <tr>
        <td width="141" height="22" align="right">语言版本： </td>
        <td width="1214">
          <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
            <ContentTemplate>
              <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
              </asp:DropDownList>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
      </tr>
      <tr>
        <td width="141" height="22" align="right">所属分类： </td>
        <td>
          <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
            <ContentTemplate>
              <asp:DropDownList ID="DDL_category" runat="server">
              </asp:DropDownList>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
      </tr>
      <%--<tr>
        <td width="100" height="22" align="right">页面类型： </td>
        <td>
          <asp:DropDownList ID="DDL_PageType" runat="server">
            <asp:ListItem Value="列表">列表("可以添加内容")</asp:ListItem>
            <asp:ListItem Value="只读">只读("不可添加内容")</asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>--%>
      <tr>
        <td width="141" height="22" align="right">加锁： </td>
        <td>
          <asp:CheckBox ID="chk_IsLock" runat="server" Checked="true" />(*加锁后分类将不能删除) </td>
      </tr>
      <tr>
        <td width="141" align="right">类别名称： </td>
        <td>
          <input name="newsclass_name1" id="NewsClassName" runat="server" type="text" class="inputs200text" maxlength="100" onblur="checknull('NewsClassName','fNewsClassName')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fNewsClassName" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写类别名称</font> </td>
      </tr>
      <tr>
        <td width="141" align="right">类别KEY： </td>
        <td>
          <input name="newsclass_name1" id="NewsClassKEY" runat="server" type="text" class="inputs200text" maxlength="100" onblur="checknull('NewsClassKEY','fNewsClassKEY')" />
        </td>
      </tr>
      <tr>
        <td align="right">排序编号： </td>
        <td>
          <input name="ist1" id="NewsClassOrderby" value="0" runat="server" type="text" class="inputs60text" onblur="checknull('NewsClassOrderby','fNewsClassOrderby')" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" maxlength="4" />
          &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fNewsClassOrderby" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写排序编号</font> </td>
      </tr>
      <tr id="trcontent">
        <td align="right" valign="top">内容：</td>
        <td align="left">
          <script id="uecontent" type="text/plain" name="myContent">
          <%=  contents%>
          </script>
          <script type="text/javascript">
            var editor = new baidu.editor.ui.Editor();
            editor.render('uecontent');
          </script>
        </td>
      </tr>
    </table>
    <br />
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th height="26" style="line-height: 20px;" colspan="2">
          SEO优化
        </th>
      </tr>
      <tr>
        <td width="113" align="right">页面标题： </td>
        <td width="1221">
          <asp:TextBox ID="TB_WebTitle" runat="server" CssClass="inputs400text"></asp:TextBox><img src="images/ico_notice.gif" title="默认标题为商品名称" /> </td>
      </tr>
      <tr>
        <td align="right">关键词： </td>
        <td>
          <input name="Icon" id="Icon" type="text" class="inputs400text" runat="server" /><img src="images/ico_notice.gif" title="5个关键字最佳，多个关键词之间用英文“,”隔开" /> </td>
      </tr>
      <tr>
        <td align="right">页面描述： </td>
        <td>
          <input name="Icon1" id="Icon1" type="text" class="inputs400text" runat="server" /><img src="images/ico_notice.gif" title="150字以内" /> </td>
        <td width="14"></td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <br />
  <div class="list-div" style="width: 100%; z-index: 9999; position: ; left: 0; bottom: 0px; height: 30px;">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="100" align="center">&nbsp; </td>
        <td align="left">
          <% if ((pageadd && Hi_TId.Value == "0") || (pageupdate && Hi_TId.Value != "0"))
             {%><asp:Button ID="BtAdd" runat="server" Text="提交" class="button" OnClick="BtAdd_Click" OnClientClick="return checkadduser();" /><%} %>
          <% if (Hi_TId.Value != "0")
             { %><input type="button" class="button" value="返回" onclick="window.location='Shop_M_NewsType.aspx?<%= returnurl %>';" /><%} %>
        </td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  <div id="div_a" runat="server">
  </div>
  </form>
    <!-- #include file="push.html" -->  
</body>
</html>
<script language="JavaScript" type="text/JavaScript">
  var dianji = 0;
  function checkadduser() {
    if (dianji == 0) {
      dianji = 1;
    }
    var ret = true;
    document.getElementById('fNewsClassOrderby').style.display = "none";
    document.getElementById('fNewsClassName').style.display = "none";
    if (document.getElementById('NewsClassName').value == "") {
      document.getElementById('fNewsClassName').style.display = "";
      document.getElementById('NewsClassName').focus();
      ret = false;
    }
    if (document.getElementById('NewsClassOrderby').value == "") {
      document.getElementById('fNewsClassOrderby').style.display = "";
      document.getElementById('NewsClassOrderby').focus();
      ret = false;
    }
    return ret;
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
