<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_PSWay.aspx.cs" Inherits="Shop_Manage_Shop_M_PSWay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/vcom.js"></script>
    <style type="text/css">
    .alertfont
    {
	    border: solid 1px #fe8686;
	    padding: 1px;
	    background: #dfeef5;
	    color: #fe4343;
    }
    .alertfont img
    {
	    margin-bottom:-3px;
    }
    </style>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="js/js.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span
            id="search_id" class="action-span1">- 配送方式管理 </span>
        <div style="clear: both">
        </div>
    </h1>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th width="15%">名称</th>
                <th width="10%">运费</th>
                <th width="68%">备注</th>
                <th width="7%">删除</th>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>           
            <tr>
                <td align="center"><asp:TextBox ID="TB_PName" runat="server" Text='<%# Eval("nvc_Name") %>' CssClass="inputstext" Width="95%"></asp:TextBox></td>
                <td align="center"><asp:TextBox ID="TB_PCost" runat="server" Text='<%# Eval("i_Cost") %>' CssClass="inputs60text"></asp:TextBox></td>
                <td align="center"><asp:TextBox ID="TB_PSM" runat="server" Text='<%# Eval("nt_Explain") %>' CssClass="inputstext" Width="95%"></asp:TextBox></td>
                <td align="center"><asp:HiddenField ID="Hi_Id" runat="server" Value='<%# Eval("i_Id") %>' /><%if (del){ %><input type="button" title="删除"
                                  class="inputicodelbutton" onclick="if(confirm('确认删除？')){window.location='?Pid=<%# Eval("i_Id")%>'}" /><%} %></td>
            </tr>
            </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="4" align="center"><% if (update){ %><asp:Button ID="Bt_SaveAll" runat="server" 
                        Text="提交" CssClass="button" onclick="Bt_SaveAll_Click"/><%} %></td>
            </tr>
            <tr>
                <td align="center"><input id="text_PName" type="text" class="inputstext" runat="server" onblur="checknull('text_PName','ftext_PName')" 
                        style="width:95%;" /><br /><font
                     id="ftext_PName" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写配送方式名称</font>
                </td>
                <td align="center"><input id="text_PCost" type="text" class="inputs60text" runat="server" onblur="checknull('text_PCost','ftext_PCost')" 
                        /><br /><font
                     id="ftext_PCost" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写配送运费</font></td>
                <td align="center"><input id="text_PSM" runat="server" class="inputstext" style="width:95%;" /></td>
                <td align="center"><%if (add){%><asp:Button ID="Bt_Add" runat="server" Text="提交" CssClass="button" OnClick="Bt_Add_Click"
                        OnClientClick="return checkaddtotime()" /><%}%></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server"></div>
    </form>
  <!-- #include file="push.html" -->  
</body>
</html>