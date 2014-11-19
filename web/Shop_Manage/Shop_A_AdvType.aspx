<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_AdvType.aspx.cs" Inherits="Shop_Manage_shop_NewsClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
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
      return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) &&
(event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_TId" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_AdvType.aspx?<%=returnurl %>">广告位列表</a></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 广告位添加 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          添加广告位
        </th>
      </tr>
      <tr>
        <td align="right" width="100">语言版本： </td>
        <td>
          <asp:DropDownList ID="ddl_language" runat="server">
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td width="100" align="right">广告位名称： </td>
        <td>
          <input name="newsclass_name1" id="NewsClassName" runat="server" type="text" class="inputs200text" maxlength="30" onblur="checknull('NewsClassName','fNewsClassName')" />&nbsp; <font color="#FF0000">*</font>&nbsp;<font id="fNewsClassName" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写广告位名称</font> </td>
      </tr>
      <tr>
        <td align="right">广告数量： </td>
        <td>
          <input name="ist1" id="NewsClassOrderby" runat="server" type="text" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" maxlength="4" />
        </td>
      </tr>
      <tr>
        <td align="right">广告类型： </td>
        <td>
          <asp:RadioButton ID="Rb_Type1" runat="server" Text="文字" GroupName="type" Checked />&nbsp;
          <asp:RadioButton ID="Rb_Type2" runat="server" Text="图片" GroupName="type" />&nbsp;
          <asp:RadioButton ID="Rb_Type3" runat="server" Text="图文" GroupName="type" Visible="false" Enabled="false" />
        </td>
      </tr>
      <%-- <tr>
                <td align="right">
                    广告图例：
                </td>
                <td>
                   <iframe frameborder="0" src="Shop_A_AdvImg.aspx?tid=<%=Hi_TId.Value %>&ttype=AdvType&sessionid=AdvType_Img" width="100%" height="170" scrolling="no"></iframe>
                </td>
            </tr>--%>
      <tr>
        <td align="right">备注： </td>
        <td>
          <asp:TextBox ID="Txt_Remarks" runat="server" CssClass="inputs400text"></asp:TextBox>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <div class="list-div" id="Div2">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="100" align="center">&nbsp; </td>
        <td align="left">
          <% if ((pageadd && Hi_TId.Value == "0") || (pageupdate && Hi_TId.Value != "0"))
             {%><asp:Button ID="BtAdd" runat="server" Text="提交" class="button" OnClick="BtAdd_Click" OnClientClick="return checkadduser()" /><%} %>
          <% if (Hi_TId.Value != "0")
             { %><input type="button" class="button" value="返回" onclick="window.location='Shop_M_AdvType.aspx?<%=returnurl %>';" /><%} %>
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
    document.getElementById('fNewsClassName').style.display = "none";
    //    document.getElementById('fNewsClassOrderby').style.display = "none";
    //    if (document.form1.NewsClassOrderby.value == "") {
    //      document.getElementById('fNewsClassOrderby').style.display = "";
    //      document.form1.NewsClassOrderby.focus();
    //      ret = false;
    //    }
    if (document.form1.NewsClassName.value == "") {
      document.getElementById('fNewsClassName').style.display = "";
      document.form1.NewsClassName.focus();
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
