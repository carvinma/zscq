<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Files.aspx.cs" Inherits="Shop_Manage_Link_AddLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript">
    function IsDigit() {
      return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }  
  </script>
</head>
<body>
  <form id="form1" runat="server" method="post" onsubmit="return checkaddlink()">
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <asp:UpdatePanel runat="server">
    <ContentTemplate>
    </ContentTemplate>
  </asp:UpdatePanel>
  <input type="hidden" runat="server" id="Hi_Id" value="0" />
  <input type="hidden" runat="server" id="Hi_File" value="" />
  <input type="hidden" runat="server" id="Hi_Times" value="0" />
  <input type="hidden" runat="server" id="Hi_OverRide" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_Files.aspx">文件列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 添加文件 </span>
    <div style="clear: both;">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          添加文件
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
        <td align="right">所属分类： </td>
        <td>
          <asp:DropDownList ID="ddl_CType" runat="server">
            <asp:ListItem Value="1">环球汇通下载</asp:ListItem>
            <asp:ListItem Value="2">专利局下载</asp:ListItem>
            <asp:ListItem Value="3">商标局下载</asp:ListItem>
            <asp:ListItem Value="4">其他下载</asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td align="right">文件名称： </td>
        <td>
          <asp:TextBox ID="tbfilename" runat="server" CssClass="inputs200text" MaxLength="30"></asp:TextBox>&nbsp; <font color="red">*</font>&nbsp;<font id="ftbfilename" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写文件名称</font> </td>
      </tr>
      <tr>
        <td align="right">文件图标选择： </td>
        <td>
          <table>
            <tr>
              <td width="160">
                <asp:DropDownList ID="DDL_TB" runat="server" onchange="Showimg()">
                </asp:DropDownList>
              </td>
              <td height="60"><img id="imgshow" src="" width="60" height="60" />
                <script type="text/javascript">
                  function Showimg() {
                    var src = $("#DDL_TB").val().split("$$$")[0];
                    $("#imgshow").attr("src", "../" + src);
                  }
                  Showimg();
                </script>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="right">选择文件： </td>
        <td>
          <asp:FileUpload ID="FileUpload1" runat="server" />
          <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
        </td>
      </tr>
      <tr>
        <td width="100" align="right">排序编号： </td>
        <td>
          <asp:TextBox ID="tborderby" runat="server" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" Style="ime-mode: disabled;" CssClass="inputs60text" Text="0" MaxLength="4"></asp:TextBox>&nbsp; <font color="#FF0000">*</font>&nbsp; <font id="ftborderby" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写排序编号</font> </td>
      </tr>
      <tr>
        <td align="center">&nbsp; </td>
        <td align="left">
          <%if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))
            {%><asp:Button ID="btnAdd" runat="server" Text="提交" class="button" OnClick="btnAdd_Click" OnClientClick="return msg();" /><%} %>
          <% if (Hi_Id.Value != "0")
             { %>
          <input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_Files.aspx?<%=returnurl %>';" />
          <%} %>
        </td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  </form>
      <!-- #include file="push.html" -->
</body>
</html>
<script language="JavaScript" type="text/JavaScript">
  var dianji = 0;
  function checkaddlink() {
    if (dianji == 0) {
      dianji = 1;
    }
    var ret = true;
    document.getElementById('ftbfilename').style.display = "none";
    document.getElementById('ftborderby').style.display = "none";
    document.getElementById('Label1').value = "";
    if (document.form1.tbfilename.value == "") {
      document.getElementById('ftbfilename').style.display = "";
      document.form1.tbfilename.focus();
      ret = false;
    }
    if (document.form1.tborderby.value == "") {
      document.getElementById('ftborderby').style.display = "";
      document.form1.tborderby.focus();
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
<script type="text/javascript">
  ///文件重复
  function msg() {
    var flag = true;
    var fname = $("#FileUpload1").val();
    var index1 = fname.lastIndexOf(".");
    var index2 = fname.length;
    var exname = fname.substring(index1, index2); //后缀名
    var exs = $("#DDL_TB option:selected").text();
    if (exs.indexOf(exname) < 0) {
      alert("文件格式错误！");
      flag = false;
    } else if ($.trim(fname) != "") {
      $.ajax({
        async: false,
        type: "GET",
        url: "Shop_A_Files.ashx",
        data: "type=IsHave&fname=" + fname,
        success: function (data) {
          if (data == "0") {
            flag = true;
          } else if (data == "1") {
            flag = confirm("文件已存在，确定要覆盖吗？");
          } else {
            alert(data);
            flag = false;
          }
        }
      });
    }
    return flag;
  } 
</script>
