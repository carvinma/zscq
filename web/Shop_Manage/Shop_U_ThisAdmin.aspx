<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_U_ThisAdmin.aspx.cs" Inherits="Shop_Manage_shop_user1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/vcom.js"></script>

    <script src="js/fucties.js" type="text/javascript"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span
            id="search_id" class="action-span1">- 修改账户信息 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    <asp:Label ID="admin_name1" runat="server" Font-Size="14px" ForeColor="Red"></asp:Label>&nbsp;修改账户信息
                </th>
            </tr>
            <tr>
                <td width="100" align="right">
                    密码：
                </td>
                <td align="left">
                    <asp:TextBox ID="admin_pass1" runat="server" CssClass="inputs200text" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td align="left">
                    <asp:Button ID="Button1" runat="server" Text="提交" CssClass="button" OnClick="Button1_Click" OnClientClick="return checknull()" />
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript" src="js/ss.js"></script>

    </form>
    <div id="div_a" runat="server">
    </div>
  <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
function checknull()
{
    if(document.getElementById('admin_pass1').value=="")
    {
        alert('请输入密码!');
        document.getElementById('admin_pass1').focus();
        return false;
    }
    return true;
}
</script>
