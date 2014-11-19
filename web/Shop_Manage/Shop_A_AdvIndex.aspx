<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_AdvIndex.aspx.cs" Inherits="Shop_Manage_Shop_A_AdvIndex" ValidateRequest="false" %>

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
    <span class="action-span"><a href="Shop_M_AdvIndex.aspx?<%=returnurl %>">广告列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-添加广告 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="3">
          添加首页广告
        </th>
      </tr>
      <tr>
        <td width="19%" align="right">语言版本： </td>
        <td>
          <asp:DropDownList ID="ddl_language" runat="server">
          </asp:DropDownList>
        </td>
        <td width="40%" align="center"></td>
      </tr>
      <tr>
        <td width="19%" align="right">广告标题： </td>
        <td width="78%" align="left">
          <input runat="server" type="text" id="txt_cntitle" maxlength="150" class="inputs200text" onblur="checknull('txt_cntitle','ftxt_cntitle')" />&nbsp; <font color="#FF0000">*</font>&nbsp;<font id="ftxt_cntitle" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写标题</font> </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">标题翻译： </td>
        <td align="left">
          <textarea name="textarea" id="txt_entitle" runat="server" cols="45" rows="5"></textarea></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">英文翻译： </td>
        <td rowspan="2" colspan="2">
          <table>
            <tr>
              <td width="235">
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
              <td rowspan="2">
                <table>
                  <tr>
                    <td width="100"><img id="img1" runat="server" src="images/zwtp.gif" width="95" height="95" /></td>
                    <td><img id="img2" runat="server" src="images/zwtp.gif" width="95" height="95" /></td>
                  </tr>
                  <tr>
                    <td>标题图片</td>
                    <td>背景图片</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <asp:FileUpload ID="FileUpload2" runat="server" /></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="right">背景图片： </td>
      </tr>
      <tr id="tr_Content">
        <td align="right">排序编号： </td>
        <td align="left">
          <input type="text" class="inputs60text" maxlength="4" id="OrderNoTxt" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" value="0" runat="server" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp; </td>
        <td align="left">
          <%if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))
            {%><asp:Button ID="Button1" runat="server" Text="提交" class="button" OnClick="Button1_Click" OnClientClick="return Check()" /><%}%>
          <% if (Hi_Id.Value != "0")
             { %><input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_AdvIndex.aspx?<%=returnurl %>';" /><%} %>
        </td>
        <td>&nbsp;</td>
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

    document.getElementById('ftxt_cntitle').style.display = "none";
    if (document.form1.txt_cntitle.value == '') {
      document.getElementById('ftxt_cntitle').style.display = "";
      document.form1.txt_cntitle.focus();
      flag = false;
    }
    //f_LinkWordTxt,链接文字,f_LinkAddressTxt,链接地址  
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
