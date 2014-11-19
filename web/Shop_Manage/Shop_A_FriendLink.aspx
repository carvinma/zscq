<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_FriendLink.aspx.cs"
    Inherits="Shop_Manage_Link_AddLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <%--<script type="text/javascript" src="js/vsport.js"></script>--%>
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
            margin-bottom: -3px;
        }
    </style>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <input type="hidden" runat="server" id="Hi_Id" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_FriendLink.aspx?<%=returnurl %>">友情链接列表</a></span>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
            class="action-span1">- 添加友情链接 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加友情链接
                </th>
            </tr>
            <tr>
                <td width="145" align="right">
                    所属分类：
                </td>
                <td>
                    <asp:DropDownList ID="DDL_Type" runat="server">
                        <asp:ListItem Value="1">专利局</asp:ListItem>
                        <asp:ListItem Value="2">商标局</asp:ListItem>
                        <asp:ListItem Value="3">其他</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    所属区域：
                </td>
                <td>
                    <asp:DropDownList ID="DDL_QY" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    站点名称（中文）：
                </td>
                <td>
                    <asp:TextBox ID="tbsitename" runat="server" CssClass="inputs200text" MaxLength="30"
                        onblur="checkaddlink2('tbsitename','fmingcheng')"></asp:TextBox>&nbsp; <font color="red">
                            *</font>&nbsp;<font id="fmingcheng" class="alertfont" style="display: none;"><img
                                alt="警告" src="images/caozuo_3.jpg" width="15" />请填写站点名称</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    站点名称（英文）：
                </td>
                <td>
                    <asp:TextBox ID="entbsitename" runat="server" CssClass="inputs200text" MaxLength="30"
                        onblur="checkaddlink2('entbsitename','fentbsitename')"></asp:TextBox>&nbsp;
                    <font color="red">*</font>&nbsp;<font id="fentbsitename" class="alertfont" style="display: none;"><img
                        alt="警告" src="images/caozuo_3.jpg" width="15" />请填写站点名称</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    站点名称（韩文）：
                </td>
                <td>
                    <asp:TextBox ID="krtbsitename" runat="server" CssClass="inputs200text" MaxLength="30"
                        onblur="checkaddlink2('krtbsitename','fkrtbsitename')"></asp:TextBox>&nbsp;
                    <font color="red">*</font>&nbsp;<font id="fkrtbsitename" class="alertfont" style="display: none;"><img
                        alt="警告" src="images/caozuo_3.jpg" width="15" />请填写站点名称</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    站点名称（日文）：
                </td>
                <td>
                    <asp:TextBox ID="jptbsitename" runat="server" CssClass="inputs200text" MaxLength="30"
                        onblur="checkaddlink2('jptbsitename','fjptbsitename')"></asp:TextBox>&nbsp;
                    <font color="red">*</font>&nbsp;<font id="fjptbsitename" class="alertfont" style="display: none;"><img
                        alt="警告" src="images/caozuo_3.jpg" width="15" />请填写站点名称</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    链接地址：
                </td>
                <td>
                    <asp:TextBox ID="tburl" runat="server" CssClass="inputs200text" MaxLength="150" onblur="checkaddlink2('tburl','flianjie')"></asp:TextBox>&nbsp;<font
                        color="red">*</font><font id="flianjie" class="alertfont" style="display: none;"><img
                            alt="警告" src="images/caozuo_3.jpg" width="15" />请填写链接地址</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    排序编号：
                </td>
                <td>
                    <asp:TextBox ID="tborderby" runat="server" MaxLength="4" onkeydown="event.returnValue=IsDigit()"
                        onkeyup="this.value = this.value.replace(/\D/g, '')" Text="0" onblur="checkaddlink2('tborderby','ftborderby')"
                        Style="ime-mode: disabled;" CssClass="inputs60text"></asp:TextBox>&nbsp; <font color="#FF0000">
                            *</font>&nbsp; <font id="ftborderby" class="alertfont" style="display: none;">
                                <img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写排序编号</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    链接图片：
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;
                </td>
                <td align="left">
                    <%if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))
                      {%><asp:Button ID="btnAdd" runat="server" Text="提交" class="button" OnClick="btnAdd_Click"
                          OnClientClick="return checkaddlink();" /><%} %>
                    <% if (Hi_Id.Value != "0")
                       { %><input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_FriendLink.aspx?<%=returnurl %>';" /><%} %>
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
        document.getElementById('flianjie').style.display = "none";
        document.getElementById('fmingcheng').style.display = "none";
        document.getElementById('ftborderby').style.display = "none";

        if (document.form1.tbsitename.value == "") {
            document.getElementById('fmingcheng').style.display = "";
            document.form1.tbsitename.focus();
            ret = false;
        }
        if (document.form1.tburl.value == "") {
            document.getElementById('flianjie').style.display = "";
            document.form1.tburl.focus();
            ret = false;
        }
        if (document.form1.tborderby.value == "") {
            document.getElementById('ftborderby').style.display = "";
            document.form1.tborderby.focus();
            ret = false;
        }
        return ret;
    }
    function checkaddlink2(inputid, fontid) {
        if (dianji == 1) {
            if (document.getElementById(inputid).value != "") {
                document.getElementById(fontid).style.display = "none";
            }
            else {
                document.getElementById(fontid).style.display = "";
            }
        }
    }
    function IsDigit() {
        return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) &&
(event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }
</script>
