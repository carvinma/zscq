<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_QuYu.aspx.cs" Inherits="Shop_Manage_Shop_A_QuYu"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/vcom.js"></script>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>
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
            margin-bottom: -3px;
        }
    </style>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="H_Id" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_QuYu.aspx<%="?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value %>&lang=<%=Request.QueryString["lang"] %>">
            区域列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a>
        </span><span id="search_id" class="action-span1">- 添加区域 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加区域
                </th>
            </tr>
            <tr>
                <td height="25" style="width: 250px;" align="right">
                    所属区域：
                </td>
                <td height="25" align="left">
                    <asp:DropDownList runat="server" ID="DDL_Parent">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="25" style="width: 250px;" align="right">
                    区域名称（中文）：
                </td>
                <td height="25" align="left">
                    <input id="Country" type="text" size="20" maxlength="50" class="inputs100text" value=""
                        runat="server" onblur="checknull('Country','fCountry')" />&nbsp; <font color="#FF0000">
                            *</font>&nbsp;<font id="fCountry" class="alertfont" style="display: none;"><img alt="警告"
                                src="images/caozuo_3.jpg" width="15" />请填写区域名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" style="width: 250px;" align="right">
                    区域名称（英文）：
                </td>
                <td height="25" align="left">
                    <input id="enCountry" type="text" size="20" maxlength="50" class="inputs100text"
                        value="" runat="server" onblur="checknull('enCountry','fenCountry')" />&nbsp;
                    <font color="#FF0000">*</font>&nbsp;<font id="fenCountry" class="alertfont" style="display: none;"><img
                        alt="警告" src="images/caozuo_3.jpg" width="15" />请填写区域名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" style="width: 250px;" align="right">
                    区域名称（韩文）：
                </td>
                <td height="25" align="left">
                    <input id="krCountry" type="text" size="20" maxlength="50" class="inputs100text"
                        value="" runat="server" onblur="checknull('krCountry','fkrCountry')" />&nbsp;
                    <font color="#FF0000">*</font>&nbsp;<font id="fkrCountry" class="alertfont" style="display: none;"><img
                        alt="警告" src="images/caozuo_3.jpg" width="15" />请填写区域名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" style="width: 250px;" align="right">
                    区域名称（日文）：
                </td>
                <td height="25" align="left">
                    <input id="jpCountry" type="text" size="20" maxlength="50" class="inputs100text"
                        value="" runat="server" onblur="checknull('jpCountry','fjpCountry')" />&nbsp;
                    <font color="#FF0000">*</font>&nbsp;<font id="fjpCountry" class="alertfont" style="display: none;"><img
                        alt="警告" src="images/caozuo_3.jpg" width="15" />请填写区域名称</font>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td height="25">
                    <asp:Button ID="But_Add" runat="server" Text="提交" CssClass="button" OnClientClick="return checkinput();"
                        OnClick="But_Add_Click" />
                    <input type="hidden" id="Hidden1" runat="server" value="" />
                    <input type="hidden" id="Hidden2" runat="server" value="" />
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server">
    </div>
    <!-- #include file="push.html" -->
</body>
</html>
<script language="javascript" type="text/javascript">
    var dianji = 0;
    function checkinput() {
        if (dianji == 0) {
            dianji = 1;
        }
        var ret = true;
        document.getElementById('fCountry').style.display = "none";
        if (document.getElementById("Country").value == "") {
            document.getElementById('fCountry').style.display = "";
            document.getElementById("Country").focus();
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
