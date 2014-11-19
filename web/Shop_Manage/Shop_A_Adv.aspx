<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Adv.aspx.cs" Inherits="Shop_Manage_Advert_ModifAdvert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
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
      return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) &&
(event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server" method="post">
  <input type="hidden" runat="server" id="Hi_Id" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_Adv.aspx?<%=returnurl %>">广告列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-添加广告 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="4">
          添加广告
        </th>
      </tr>
      <tr>
        <td align="right" width="100">语言版本： </td>
        <td>
          <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
          </asp:DropDownList>
        </td>
        <td width="40%" align="center"></td>
      </tr>
      <tr>
        <td align="right" width="100">广告位置： </td>
        <td>
          <asp:DropDownList ID="DDL_Type" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_Type_SelectedIndexChanged" onchange="checknull('DDL_Type','fDDL_Type')">
          </asp:DropDownList>
          &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fDDL_Type" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择广告位置</font> </td>
        <td width="40%" align="center">备注 </td>
      </tr>
      <tr>
        <td align="right">链接文字： </td>
        <td>
          <input runat="server" type="text" id="LinkWordTxt" class="inputs200text" maxlength="50" onblur="checknull('LinkWordTxt','f_LinkWordTxt')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="f_LinkWordTxt" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写链接文字</font> </td>
        <td rowspan="3" align="left" valign="top" style="padding: 5px; line-height: 20px;">
          <%=dess %>
        </td>
      </tr>
      <tr>
        <td align="right">链接地址： </td>
        <td>
          <input type="text" runat="server" maxlength="150" id="LinkAddressTxt" class="inputs200text" onblur="checknull('LinkAddressTxt','f_LinkAddressTxt')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="f_LinkAddressTxt" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写链接地址</font> </td>
      </tr>
      <tr>
        <td align="right">排序编号： </td>
        <td>
          <input type="text" runat="server" id="OrderNoTxt" maxlength="4" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" class="inputs60text" />
        </td>
      </tr>
      <tr>
        <td align="right">打开方式： </td>
        <td>
          <asp:RadioButtonList ID="RBL_OpenWay" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="_self">当前页面打开</asp:ListItem>
            <asp:ListItem Value="_blank" Selected="True">新建页面打开</asp:ListItem>
            <asp:ListItem Value="_top">父页面中打开</asp:ListItem>
          </asp:RadioButtonList>
        </td>
        <td></td>
      </tr>
      <tr id="PicDiv4" visible="false" runat="server">
        <td align="right">图片类型： </td>
        <td>
          <asp:RadioButtonList ID="RBL_Type" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="0" Selected="True">图片（.jpg,.png,.gif）</asp:ListItem>
            <asp:ListItem Value="1">动画（.flv,.swf）</asp:ListItem>
          </asp:RadioButtonList>
        </td>
        <td></td>
      </tr>
      <tr id="PicDiv" visible="false" runat="server">
        <td align="right">上传图片： </td>
        <td>
          <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
        <td></td>
      </tr>
      <tr id="PicDiv2" visible="false" runat="server">
        <td align="right">图片宽度： </td>
        <td>
          <input id="ImageWidthTxt" runat="server" onblur="showzb(980,'text_left','ImageWidthTxt')" type="text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" maxlength="4" style="ime-mode: disabled;" class="inputs60text" />&nbsp;<span style="color: Red;"><%= beizhu %></span> </td>
        <td></td>
      </tr>
      <tr id="PicDiv3" visible="false" runat="server">
        <td align="right">图片高度： </td>
        <td>
          <input id="ImageHightTxt" runat="server" onblur="showzb(380,'text_top','ImageHightTxt')" type="text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" maxlength="4" style="ime-mode: disabled;" class="inputs60text" />&nbsp;<span style="color: Red;"><%= beizhu %></span> </td>
        <td></td>
      </tr>
      <tr id="tr_Left" visible="false" runat="server">
        <td align="right">左坐标： </td>
        <td>
          <input id="text_left" runat="server" type="text" onblur="showzb(980,'text_left','ImageWidthTxt')" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" class="inputs60text" /><input type="button" value="max" onclick="jisuan(980,'text_left','ImageWidthTxt')" maxlength="4" />&nbsp;<span style="color: Red;">注：左坐标最大值为980px-图片宽度</span> </td>
        <td></td>
      </tr>
      <tr id="tr_Top" visible="false" runat="server">
        <td align="right">上坐标： </td>
        <td>
          <input id="text_top" runat="server" type="text" onblur="showzb(380,'text_top','ImageHightTxt')" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" class="inputs60text" maxlength="4" /><input type="button" value="max" onclick="jisuan(380,'text_top','ImageHightTxt')" />&nbsp;<span style="color: Red;">注：上坐标最大值为380px-图片高度</span> </td>
        <td></td>
      </tr>
      <tr id="tr_Content" visible="false" runat="server">
        <td align="right">内容： </td>
        <td colspan="2">
          <script id="uecontent" type="text/plain" name="myContent">
                            <%=content%>
          </script>
          <script type="text/javascript">
            var editor = new baidu.editor.ui.Editor();
            editor.render('uecontent');
          </script>
        </td>
      </tr>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="100" align="center">&nbsp; </td>
        <td align="left">
          <%if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))
            {%><asp:Button ID="Button1" runat="server" Text="提交" class="button" OnClick="Button1_Click" OnClientClick="return Check()" /><%}%>
          <% if (Hi_Id.Value != "0")
             { %>
          <input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_Adv.aspx?<%=returnurl %>';" />
          <%} %>
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
<script type="text/javascript">
  var dianji = 0;
  function Check() {
    if (dianji == 0) {
      dianji = 1;
    }
    var flag = true;

    document.getElementById('fDDL_Type').style.display = "none";
    if (document.form1.DDL_Type.value == '0') {
      document.getElementById('fDDL_Type').style.display = "";
      document.form1.DDL_Type.focus();
      flag = false;
    }
    //f_LinkWordTxt,链接文字,f_LinkAddressTxt,链接地址

    var wordTxt = $("#LinkWordTxt").val();
    if (wordTxt == "") {
      $("#f_LinkWordTxt").attr("style", "display: ;");
      flag = false;
    } else {
      $("#f_LinkWordTxt").attr("style", "display: none;");
    }

    var addressTxt = $("#LinkAddressTxt").val();
    if (addressTxt == "") {
      $("#f_LinkAddressTxt").attr("style", "display: ;");
      flag = false;
    } else {
      $("#f_LinkAddressTxt").attr("style", "display: none;");
    }

    return flag;
  }
  function checknull(inputid, fontid) {
    if (dianji == 1) {
      if (document.getElementById(inputid).value != " ") {
        document.getElementById(fontid).style.display = "none";
      }
      else {
        document.getElementById(fontid).style.display = "";
      }
    }
  }
  function showzb(v, v1, v2) {
    if (document.getElementById('tr_Left')) {
      var s1 = parseInt(document.getElementById(v1).value);
      var s2 = parseInt(document.getElementById(v2).value);
      if (s1 > (v - s2)) {
        document.getElementById(v1).value = (v - s2);
      }
    }
  }
  function jisuan(v, v1, v2) {
    if (document.getElementById(v2).value != "") {
      var s1 = parseInt(document.getElementById(v1).value);
      var s2 = parseInt(document.getElementById(v2).value);
      document.getElementById(v1).value = (v - s2);
    }
    else {
      document.getElementById(v1).value = '0';
    }
  }
</script>
