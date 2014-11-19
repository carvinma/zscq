<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Apl_Trademark.aspx.cs" Inherits="Shop_Manage_Shop_Apl_Patent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/vcom.js"></script>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" method="post" onsubmit="return check1()">
    <h1>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
            class="action-span1">- 商标批量导入 </span>
        <div style="clear: both">
        </div>
    </h1>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    商标批量导入
                </th>
            </tr>
            <tr>
                <td align="right" width="100">&nbsp;上传excel表格：</td>
                <td><asp:FileUpload ID="ful_price" runat="server" /></td>
            </tr>
            <tr>       
                <td align="right">备注：</td>
                <td align="left" style="line-height: 22px">表格格式下载：<a href="FileLoad/file_sb/Sb_apl_trademark6.xls"><strong>点击下载</strong></a></td>
            </tr>
            <tr>      
                <td>&nbsp;</td>
                <td>
                <%if (pagedaoru)
                  { %>
                    <asp:Button ID="Button1" runat="server" Text="提交" CssClass="button" 
                        onclick="Button1_Click" /><%} %>
                </td>
            </tr>
        </table></div>
    <div id="div_a" runat="server"></div>
    </form>
    <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript" language="javascript">

    function check1() {
        if (document.getElementById('ful_price').value == "") {
            alert("请上传excel表格!");
            document.getElementById('ful_price').focus();
            return false;
        }
        return true;
    }

</script>
