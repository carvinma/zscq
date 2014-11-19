<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_UserGrade.aspx.cs" Inherits="Shop_Manage_Shop_A_UserGrade" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/vcom.js"></script>
    <script src="js/ss.js" type="text/javascript"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript">
        function IsDigit() {
            return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
        }  
    </script>
</head>
<body oncontextmenu="return false" onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()">
    <form id="form1" runat="server" method="post" onsubmit="return checkadduser()">
    <input type="hidden" runat="server" id="HiId" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_UserGrade.aspx">等级列表</a></span>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span>
        <span id="search_id" class="action-span1">- 添加会员等级 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加用户等级
                </th>
            </tr>
            <tr>
                <td width="150" align="right">
                    等级名称（中文）：
                </td>
                <td>
                    <input id="text_Name" runat="server" type="text" size="30" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <td width="150" align="right">
                    等级名称（英文）：
                </td>
                <td>
                    <input id="text_Name_EN" runat="server" type="text" size="30" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <td width="150" align="right">
                    等级名称（韩文）：
                </td>
                <td>
                    <input id="text_Name_KR" runat="server" type="text" size="30" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <td width="150" align="right">
                    等级名称（日文）：
                </td>
                <td>
                    <input id="text_Name_JP" runat="server" type="text" size="30" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    享受折扣：
                </td>
                <td>
                    <input id="text_ZK" runat="server" type="text" size="30" class="inputs60text" maxlength="6" value="100" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" />&nbsp;%&nbsp;<span style="color: red;">(注：如果是9.5折，直接填写95即可)</span>
                </td>
            </tr>
            <tr>
                <td align="right">
                    等级级别：
                </td>
                <td>
                    <input id="text_grade" runat="server" type="text" size="30" class="inputs60text" maxlength="6" value="10" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" />&nbsp;<font color="#FF0000">(注：填写数字，数字越大等级越高)</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    所需成功交易专利数：
                </td>
                <td>
                    <input id="text_zhuanli" runat="server" type="text" class="inputs60text" size="30" maxlength="9" value="100" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    所需成功交易商标数：
                </td>
                <td>
                    <input id="text_shangbiao" runat="server" type="text" class="inputs60text" size="30" maxlength="9" value="100" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" />
                </td>
            </tr>
            <tr style="display: none;">
                <td align="right">
                    推荐次数：
                </td>
                <td>
                    <input id="text_QD" runat="server" type="text" class="inputs60text" size="30" maxlength="9" value="10" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    上传图标：
                </td>
                <td align="left">
                    <input type="hidden" id="HiLogo" runat="server" value="" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;
                </td>
                <td>
                    <%if ((pageadd && HiId.Value == "0") || (pageupdate && HiId.Value != "0"))
                      { %><asp:Button ID="Button1" runat="server" Text="提交" CssClass="button" OnClick="Button1_Click" /><%} %>
                    <%if (HiId.Value != "0")
                      { %><input type="button" onclick="javascript:window.location='Shop_M_UserGrade.aspx';" value="返回" class="button" /><%} %>
                </td>
            </tr>
        </table>
    </div>
    <div id="div_a" runat="server">
    </div>
    <script type="text/javascript" src="js/ss.js"></script>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script language="JavaScript" type="text/JavaScript">
    function checkadduser() {
        if (document.form1.text_Name.value == "") {
            alert("等级名称不能为空！");
            document.form1.text_Name.focus();
            return false;
        }
        if (document.form1.text_grade.value == "") {
            alert("等级级别不能为空！");
            document.form1.text_grade.focus();
            return false;
        }
        if (document.form1.text_ZK.value == "") {
            alert("享受折扣不能为空！");
            document.form1.text_ZK.focus();
            return false;
        }
        if (document.form1.text_Jifen.value == "") {
            alert("所需积分不能为空！");
            document.form1.text_Jifen.focus();
            return false;
        }
        if (document.getElementById('HiId').value == "0") {
            if (document.getElementById('FileUpload1').value == "") {
                alert("图标不能为空！");
                document.form1.FileUpload1.focus();
                return false;
            }
        }
    }
</script>
