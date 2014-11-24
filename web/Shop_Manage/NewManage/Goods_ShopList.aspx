<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Goods_ShopList.aspx.cs" Inherits="Shop_Manage_NewManage_Goods_ShopList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/vcom.js"></script>
     <script type="text/javascript">
         function IsDigit() {
             return ((event.keyCode >= 48) && (event.keyCode <= 57));
         }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HF_ID" runat="server" Value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_Province.aspx<%="?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value %>">省份列表</a></span> <span class="action-span1">
            <a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">
                - 添加省份 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加省份
                </th>
            </tr>
            <tr>
                <td height="25" align="right">
                    所属国家：
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="45%" height="25" align="right">
                    省份代码：
                </td>
                <td width="55%" height="25" align="left"><input id="provinceID" type="text" size="20" maxlength="10" onkeyup="value=value.replace(/[^\d]/g, '')"
                        onbeforepaste="clipboardData.setData( 'text',clipboardData.getData( 'text').replace(/[^\d]/g, ''))"
                        onkeypress="event.returnValue=IsDigit();" class="inputs60text" value="" runat="server" onblur="checknull('provinceID','fprovinceID')" />&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="fprovinceID" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写省份代码</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    省份名称：
                </td>
                <td height="25" align="left"><input id="province" type="text" size="20" maxlength="10" class="inputs200text" value="" runat="server" onblur="checknull('province','fprovince')" />&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="fprovince" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写省份名称</font>
                </td>
            </tr>
            <tr>
                <td></td>
                <td height="25"><asp:Button ID="But_Add" runat="server" Text="提交" CssClass="button" OnClientClick="return checkinput();"
                         /><input type="hidden" id="Hidden1" runat="server" value="" />
                    <input type="hidden" id="Hidden2" runat="server" value="" />
                </td>
            </tr>
        </table>
    </div>
    </form>

    <script type="text/javascript" src="js/ss.js"></script>

    <div id="div_a" runat="server">
    </div>
</body>
</html>
