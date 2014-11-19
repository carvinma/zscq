<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Apl_StationMessage.aspx.cs" Inherits="Shop_Manage_shop_smspl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/vcom.js"></script>
    <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
    <style type="text/css">
        .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
        .alertfont img { margin-bottom: -3px; }
    </style>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body onbeforecopy="return false" oncopy="document.selection.empty()" onselect="document.selection.empty()">
    <form id="form1" runat="server" method="post" onsubmit="return checkadduser()">
    <div>
        <h1>
            <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 站内消息群发</span>
            <div style="clear: both">
            </div>
        </h1>
        <script type="text/javascript" src="js/fucties.js"></script>
        <script type="text/javascript" src="js/listtb.js"></script>
        <div class="list-div" id="listDiv">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        <strong>
                            <asp:Label ID="lbCount" runat="server" Text=""></asp:Label></strong>
                    </th>
                </tr>
                <tr>
                    <td valign="top" align="right" width="100">
                        会员用户名：
                    </td>
                    <td>
                        <textarea name="phones" cols="100" style="width: 80%;" rows="5" id="phones" runat="server" onblur="checknull('phones','fphones')"></textarea>&nbsp;<br />
                        <font color="#FF0000">*(多个会员用户名之间用“;”号分开)</font>&nbsp;<input type="button" name="Submit" title="复制会员用户名" onclick='copyToClipBoard()' class="inputicocopybutton">&nbsp;<font id="fphones" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写会员用户名</font>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="right">
                        消息内容：
                    </td>
                    <td>
                        <textarea name="content" cols="100" style="width: 80%;" rows="5" id="content" runat="server" onblur="checknull('content','fcontent')"></textarea>&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fcontent" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写站内消息内容</font>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <% if (pageadd)
                           { %><asp:Button ID="btnFS" runat="server" Text="发送" class="button" OnClick="btnFS_Click" /><%} %>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript" src="js/ss.js"></script>
    </div>
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
        document.getElementById('fcontent').style.display = "none";
        document.getElementById('fphones').style.display = "none";
        var ret = true;
        if (document.form1.content.value == "") {
            document.getElementById('fcontent').style.display = "";
            document.form1.content.focus();
            ret = false;
        }
        if (document.form1.phones.value == "") {
            document.getElementById('fphones').style.display = "";
            document.form1.phones.focus();
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
<script type="text/javascript" language="javascript">
    function copyToClipBoard() {
        var clipBoardContent = "";
        clipBoardContent += document.getElementById('phones').value;
        document.getElementById('phones').select();
        window.clipboardData.setData("Text", clipBoardContent);
        alert("复制成功");
    }
</script>
