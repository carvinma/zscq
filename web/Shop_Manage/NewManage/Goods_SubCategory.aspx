<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Goods_SubCategory.aspx.cs" Inherits="Shop_Manage_NewManage_Goods_SubCategory" %>

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
        <span class="action-span"><a href="Goods_SubCategoryList.aspx<%="?PageNo=" + Hidden1.Value + "&Keyword=" + Hidden2.Value %>">商品小类列表</a></span> <span class="action-span1">
            <a href="../Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">
                - 添加商品小类 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="../js/fucties.js"></script>

    <script type="text/javascript" src="../js/listtb.js"></script>

    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加小类
                </th>
            </tr>
            <tr>
                <td height="25" align="right">
                    所属大类：
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="45%" height="25" align="right">
                    小类代码：
                </td>
                <td width="55%" height="25" align="left"><input id="txtCategoryCode" type="text" 
                        size="20" maxlength="10" onkeyup="value=value.replace(/[^\d]/g, '')"
                        onbeforepaste="clipboardData.setData( 'text',clipboardData.getData('text').replace(/[^\d]/g, ''))"
                        onkeypress="event.returnValue=IsDigit();" class="inputs60text" value="" 
                        runat="server" onblur="checknull('txtCategoryCode','ftxtCategoryCode')" />&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="ftxtCategoryCode" class="alertfont" style="display:none;"><img alt="警告" src="../images/caozuo_3.jpg"
                                    width="15" />请填写小类代码</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    小类名称：
                </td>
                <td height="25" align="left"><input id="txtCategoryRemark" type="text" size="20" 
                        maxlength="200" class="inputs200text" value="" runat="server" 
                        onblur="checknull('txtCategoryRemark','ftxtCategoryRemark')" />&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="ftxtCategoryRemark" class="alertfont" style="display:none;"><img alt="警告" src="../images/caozuo_3.jpg"
                                    width="15" />请填写小类名称</font>
                </td>
            </tr>
            <tr>
                <td></td>
                <td height="25"><asp:Button ID="But_Add" runat="server" Text="提交" CssClass="button" OnClientClick="return checkinput();"
                        OnClick="But_Add_Click" /><input type="hidden" id="Hidden1" runat="server" value="" />
                    <input type="hidden" id="Hidden2" runat="server" value="" />
                </td>
            </tr>
        </table>
    </div>
    </form>

    <script type="text/javascript" src="../js/ss.js"></script>

    <div id="div_a" runat="server">
    </div>
</body>
</html>
<script type="text/javascript" language="javascript">
    var dianji = 0;
    function checkinput() {
        if (dianji == 0) {
            dianji = 1;
        }
        document.getElementById('ftxtCategoryCode').style.display = "none";
        document.getElementById('ftxtCategoryRemark').style.display = "none";
        var ret = true;
        if (document.getElementById("txtCategoryCode").value == "") {
            document.getElementById('ftxtCategoryCode').style.display = "";
            document.getElementById("txtCategoryCode").focus();
            ret = false;
        }
        if (document.getElementById("txtCategoryRemark").value == "") {
            document.getElementById('ftxtCategoryRemark').style.display = "";
            document.getElementById("txtCategoryRemark").focus();
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