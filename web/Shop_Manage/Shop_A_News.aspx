<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_News.aspx.cs" Inherits="Shop_Manage_shop_addnews" ValidateRequest="false" %>

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
  <script type="text/javascript" src="js/Calendar.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
    
    .colordiv { border: solid 1px #8dcff4; width: 16px; height: 16px; padding: 1px; float: left; margin-right: 5px; cursor: pointer; }
    .colordiv:hover { border: solid 1px #e8641b; }
    .colordiv img { width: 16px; height: 16px; }
    .colordivselect { padding: 1px; float: left; margin-right: 5px; cursor: pointer; width: 32px; height: 32px; border: solid 1px #e8641b; }
    .colordivselect img { width: 32px; height: 32px; }
  </style>
  <script type="text/javascript">
    function IsDigit() {
      return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }  
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server" enctype="multipart/form-data">
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <input type="hidden" id="hd" runat="server" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_News.aspx?<%=returnurl %>">新闻列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-
      <%=PageType%>
    </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="list-div" id="listDiv">
    <table width="100%" cellpadding='3' cellspacing='1'>
      <tr>
        <th colspan="2">
          <%=PageType%>
        </th>
      </tr>
      <tr>
        <td height="26" align="right">语言版本： </td>
        <td height="26" align="left">
          <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
            <ContentTemplate>
              <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
              </asp:DropDownList>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">新闻分类： </td>
        <td height="26" align="left">
          <asp:UpdatePanel runat="server" ID="UpdatePanel2">
            <ContentTemplate>
              <asp:DropDownList ID="DDL_Type" runat="server" onblur="checknull('DDL_Type','fDDL_Type')">
                <asp:ListItem Value="">请选择</asp:ListItem>
              </asp:DropDownList>
              &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fDDL_Type" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择新闻分类</font>
            </ContentTemplate>
          </asp:UpdatePanel>
          <script type="text/javascript">
            //            function change() {
            //              if (document.getElementById("DDL_Type").value == "13") {
            //                document.getElementById("trcontent").style.display = "none";
            //              } else {
            //                document.getElementById("trcontent").style.display = "";
            //              }
            //            } change();
          </script>
        </td>
      </tr>
      <tr>
        <td style="width:10%;" height="26" align="right">新闻标题： </td>
        <td height="26" align="left">
          <input type="text" runat="server" id="news_title" class="inputstext" maxlength="250" style="width: 400px;" onblur="checknull('news_title','fnews_title')" />
          <font color="#FF0000">*</font>&nbsp;<font id="fnews_title" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写新闻标题</font> </td>
      </tr>
      <tr>
        <td height="26" align="right">标题链接： </td>
        <td height="26" align="left">
          <input type="text" runat="server" id="text_Link" class="inputstext" maxlength="250" style="width: 400px;" />
        </td>
      </tr>
      <tr>
        <td height="26" align="right">标题图片： </td>
        <td height="26" align="left">
          <table>
            <tr>
              <td width="120" align="left" valign="middle">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
              </td>
              <td align="left" valign="middle"><img id="imgTitle" runat="server" src="images/zwtp.gif" width="95" height="95" /> </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="right">排序编号： </td>
        <td>
          <input name="ist1" id="text_Orderby" runat="server" type="text" value="0" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" maxlength="4" />
        </td>
      </tr>
      <tr>
        <td height="26" align="right">浏览数： </td>
        <td height="26" align="left">
          <input type="text" value="0" runat="server" id="text_Views" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" maxlength="4" />
        </td>
      </tr>
      <tr>
        <td height="26" align="right">发布时间： </td>
        <td height="26" align="left">
          <input type="text" runat="server" id="Newdate" readonly="readonly" class="inputs80text" />
          <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.Newdate);" class="inputcalendarbutton" />
        </td>
      </tr>
      <tr>
        <td height="26" align="right" valign="top">是否显示： </td>
        <td height="26" align="left">
          <asp:CheckBox ID="cb_Recomment" runat="server" Checked="true" />
        </td>
      </tr>
      <tr id="trcontent">
        <td align="right" valign="top">内容：</td>
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
      <%--<tr>
        <td height="26" align="right">图标： </td>
        <td height="26" align="left">
          <table>
            <tr>
              <td width="200">
                <asp:FileUpload ID="FileUpload2" runat="server" />
                &nbsp;<font id="Font2" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />
                  <asp:Label ID="Label2" runat="server" Text=""></asp:Label></font> </td>
              <td rowspan="2"><img id="imgFile" runat="server" width="95" height="95" src="images/zwtp.gif" /> </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">文件： </td>
        <td height="26" align="left">
          <asp:FileUpload ID="FileUpload3" runat="server" />
          &nbsp;<font id="Font3" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" /><asp:Label ID="Label3" runat="server" Text=""></asp:Label></font> <input type="text" runat="server" readonly="readonly" id="ipt_filesrc" /> </td>
      </tr>--%>
    </table>
  </div>
  <br />
  <div class="list-div">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th height="26" colspan="2">
          SEO优化
        </th>
      </tr>
      <tr>
        <td align="right" width="122">页面标题： </td>
        <td width="1216" align="left">
          <asp:TextBox ID="TB_WebTitle" runat="server" CssClass="inputstext" MaxLength="150" Style="width: 400px;"></asp:TextBox><img src="images/ico_notice.gif" title="默认标题为新闻标题" /> </td>
      </tr>
      <tr>
        <td height="26" align="right">关键词： </td>
        <td height="26" align="left">
          <input type="text" runat="server" id="news_keyword" class="inputstext" maxlength="150" style="width: 400px;" /><img src="images/ico_notice.gif" title="5个关键字最佳，多个关键词之间用英文“,”隔开" /> </td>
      </tr>
      <tr>
        <td height="26" align="right" valign="top">页面描述： </td>
        <td height="26" align="left" valign="top">
          <textarea runat="server" id="news_content2" rows="3" class="input" style="width: 400px;"></textarea><img src="images/ico_notice.gif" title="150字以内" /> </td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <div class="list-div" style="width: 100%; z-index: 9999; position: fixed; left: 0; bottom: 0px; height: 30px;">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="100" align="center">&nbsp; </td>
        <td align="left">
          <%if ((pageadd && hd.Value == "0") || (pageupdate && hd.Value != "0"))
            { %><asp:Button ID="btOK" runat="server" Text="提交" class="button" OnClick="btOK_Click" OnClientClick="return checkaddnews();" /><%} %>
          <% if (hd.Value != "0")
             { %><input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_News.aspx?<%=returnurl %>';" /><%} %>
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
  function checkaddnews() {
    if (dianji == 0) {
      dianji = 1;
    }
    document.getElementById('fDDL_Type').style.display = "none";
    document.getElementById('fnews_title').style.display = "none";
    if (document.getElementById("DDL_Type").value == "") {
      document.getElementById('fDDL_Type').style.display = "";
      document.getElementById("DDL_Type").focus();
      return false;
    }
    if (document.getElementById("news_title").value == "") {
      document.getElementById('fnews_title').style.display = "";
      document.getElementById("news_title").focus();
      return false;
    }
    return true;
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
