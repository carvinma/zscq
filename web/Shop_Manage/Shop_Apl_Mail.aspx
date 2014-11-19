<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Apl_Mail.aspx.cs" Inherits="Shop_Manage_shop_mailpl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()">
  <form id="form1" runat="server">
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 邮件群发</span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          发送邮件
        </th>
      </tr>
      <tr>
        <td valign="top" align="right" style="width:10%;">发送地址：</td>
        <td>
          <textarea name="phones" cols="100" rows="5" style="width: 80%;" id="phones" runat="server" onblur="checknull('phones','fphones')"></textarea>&nbsp;<br />
          <font color="#FF0000">*(多个邮件地址之间用“;”号分开)</font>&nbsp;<input type="button" name="Submit" title="复制邮箱地址" onclick='copyToClipBoard()' class="inputicocopybutton" /><font id="fphones" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写邮件地址</font></td>
      </tr>
      <tr>
        <td align="right">语言版本：</td>
        <td>
          <asp:DropDownList ID="Drp_LanguageList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Drp_LanguageList_SelectedIndexChanged">
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td align="right">选用模板：</td>
        <td>
          <asp:DropDownList ID="DDL_Model" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DDL_Model_SelectedIndexChanged">
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td align="right">邮件标题：</td>
        <td>
          <input type="text" name="phones" style="width: 80%;" class="inputstext" id="area_Title" runat="server" onblur="checknull('area_Title','farea_Title')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="farea_Title" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写邮件标题</font></td>
      </tr>
      <tr>
        <td valign="top" align="right">邮件正文： </td>
        <td style="width:90%;">
          <script id="uecontent" type="text/plain" name="myContent">
                        <%=content%>
          </script>
          <script type="text/javascript">
            var editor = new baidu.editor.ui.Editor();
            editor.render('uecontent');
          </script>
        </td>
      </tr>
      <tr id="tr_update" runat="server" visible="false">
        <td></td>
        <td>
          <input type="checkbox" runat="server" id="cb_updatemodel" />&nbsp;同时更新到“<%=EModelName%>”</td>
      </tr>
      <tr id="tr_new" runat="server">
        <td></td>
        <td>
          <input type="checkbox" runat="server" id="cb_newmodel" onclick="if(this.checked){document.getElementById('spanmodelname').style.display='';}else{document.getElementById('spanmodelname').style.display='none';}" />&nbsp;添加到邮件模板&nbsp;&nbsp;&nbsp;&nbsp;<span id="spanmodelname" style="display: none;">模板名称：<input type="text" runat="server" id="text_modelname" class="input" onblur="checknull('text_modelname','ftext_modelname')" />&nbsp;<font color="#FF0000">**</font>&nbsp;<font id="ftext_modelname" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写模板名称</font></span></td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <br />
  <div class="list-div" style="width: 100%; z-index: 9999; position: fixed; left: 0px; bottom: 0px; height: 30px;">
    <%if (pageadd)
      { %>
    <table id="表格1" cellpadding="3" cellspacing="1">
      <tr>
        <td align="center" width="100">&nbsp; </td>
        <td align="left">
          <asp:Button ID="btnFS" runat="server" class="button" OnClick="btnFS_Click" OnClientClick="return checkadduser()" Text="发送" />
        </td>
      </tr>
    </table>
    <%} %>
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  <div id="div_a" runat="server">
  </div>
  </form>
    <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/JavaScript" language="JavaScript">
  var dianji = 0;
  function checkadduser() {
    if (dianji == 0) {
      dianji = 1;
    }
    document.getElementById('farea_Title').style.display = "none";
    document.getElementById('fphones').style.display = "none";
    var ret = true;
    if (document.getElementById('cb_newmodel') && document.getElementById('cb_newmodel').checked && document.getElementById('text_modelname').value == "") {
      document.getElementById('ftext_modelname').style.display = "";
      document.getElementById('text_modelname').focus();
      ret = false;
    }
    if (document.getElementById('area_Title').value == "") {
      document.getElementById('farea_Title').style.display = "";
      document.getElementById('area_Title').focus();
      ret = false;
    }
    if (document.form1.phones.value == "") {
      document.getElementById('fphones').style.display = "";
      document.form1.phones.focus();
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
<script type="text/javascript" language="javascript">
  function copyToClipBoard() {
    var clipBoardContent = "";
    clipBoardContent += document.getElementById('phones').value;

    document.getElementById('phones').select();
    window.clipboardData.setData("Text", clipBoardContent);
    alert("复制成功");
  }
</script>
