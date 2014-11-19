<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Country.aspx.cs" Inherits="Shop_A_Country"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <script src="../ueditor/ueditor.config.js" type="text/javascript"></script>
    <script src="../ueditor/ueditor.all.js" type="text/javascript"></script>

    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/vcom.js"></script>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>
    <style type="text/css">
        .alertfont {
            border: solid 1px #fe8686;
            padding: 1px;
            background: #dfeef5;
            color: #fe4343;
        }
        .alertfont img {
            margin-bottom: -3px;
        }
    </style>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="H_Id" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_Country.aspx<%="?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value %>">
            国家列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a>
        </span><span id="search_id" class="action-span1">- 添加国家 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <%--    <script type="text/javascript" src="js/listtb.js"></script>--%>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加国家
                </th>
            </tr>
            <tr>
                <td height="25" style="width:20%" align="right">
                    国家名称：
                </td>
                <td height="25" align="left">
                    <input id="Country" type="text" size="20" maxlength="50" class="inputs100text" 
                        runat="server" onblur="checknull('Country','fCountry')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font
                            id="fCountry" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg"
                                width="15" />请填写国家名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    英文名称(名词)：
                </td>
                <td height="25" align="left">
                    <input id="enCountry" type="text" size="20" maxlength="100" class="inputs100text"
                        runat="server" onblur="checknull('enCountry','fenCountry')" />&nbsp;<font
                            color="#FF0000">*</font>&nbsp;<font id="fenCountry" class="alertfont" style="display: none;"><img
                                alt="警告" src="images/caozuo_3.jpg" width="15" />请填写国家英文名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    英文名称(形容词)：
                </td>
                <td height="25" align="left">
                    <input id="englishCountry" type="text" size="20" maxlength="100" class="inputs100text"
                        runat="server" onblur="checknull('englishCountry','fenglishCountry')" />&nbsp;<font
                            color="#FF0000">*</font>&nbsp;<font id="fenglishCountry" class="alertfont" style="display: none;"><img
                                alt="警告" src="images/caozuo_3.jpg" width="15" />请填写国家英文名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    日文名称：
                </td>
                <td height="25" align="left">
                    <input id="jpCountry" type="text" size="20" maxlength="100" class="inputs100text"
                        runat="server" onblur="checknull('jpCountry','fjpCountry')" />&nbsp;<font
                            color="#FF0000">*</font>&nbsp;<font id="fjpCountry" class="alertfont" style="display: none;"><img
                                alt="警告" src="images/caozuo_3.jpg" width="15" />请填写国家日文名称</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    韩文名称：
                </td>
                <td height="25" align="left">
                        <%--<div id="txtChg" runat="server"></div>--%>
                    <input id="hanCountry" type="text" size="20" maxlength="100" class="inputs100text"
                        runat="server" onblur="checknull('hanCountry','fhanCountry')" />&nbsp;<font
                            color="#FF0000">*</font>&nbsp;<font id="fhanCountry" class="alertfont" style="display: none;"><img
                                alt="警告" src="images/caozuo_3.jpg" width="15" />请填写国家韩文名称</font>
                  <%--<script type="text/javascript">
                  document.getElementById("hanCountry").value = document.getElementById("txtChg").innerHTML;
                    </script>--%>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    钱币币种：
                </td>
                <td height="25" align="left">
                    <input id="bz" type="text" size="20" maxlength="40" class="inputs100text" 
                        runat="server" onblur="checknull('bz','fbz')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font
                            id="fbz" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg"
                                width="15" />请填写国家钱币币种</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                   费用缴纳国家币种：
                </td>
                <td height="25" align="left">
                    <input id="t_jiaonaguo" type="text" size="20" maxlength="10" class="inputs100text" 
                        runat="server" onblur="checknull('t_jiaonaguo','ft_jiaonaguo')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font
                            id="ft_jiaonaguo" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg"
                                width="15" />费用缴纳国家币种</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    国家简写：
                </td>
                <td height="25" align="left">
                    <input id="Txt_Short" type="text" size="20" maxlength="4" class="inputs100text" 
                        runat="server" onblur="checknull('Txt_Short','Font_Short')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font
                            id="Font_Short" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg"
                                width="15" />请填写国家简写</font>
                </td>
            </tr>
            <tr>
                <td valign="top" align="right">
                    中文内容：
                </td>
                <td align="left" >
                    <textarea runat="server" id="myContent" rows="5" class="input" style="width: 600px;"></textarea>
                </td>
            </tr>
           <tr>
                <td valign="top" align="right">
                    英文内容：
                </td>
                <td align="left" >
                    <textarea runat="server" id="myContent2" rows="5" class="input" style="width: 600px;"></textarea>
                </td>
            </tr>
            <tr>
                <td valign="top" align="right">
                    韩文内容：
                </td>
                <td align="left" >
                    <textarea runat="server" id="myContent3" rows="5" class="input" style="width: 600px;"></textarea>
                </td>
            </tr>
            <tr>
                <td valign="top" align="right">
                    日文内容：
                </td>
                <td align="left" >
                    <textarea runat="server" id="myContent4" rows="5" class="input" style="width: 600px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td height="25">
                    <asp:Button ID="But_Add" runat="server" Text="提交" CssClass="button" OnClientClick="return checkinput();"
                        OnClick="But_Add_Click" /><input type="hidden" id="Hidden1" runat="server" value="" />
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
        document.getElementById('fenCountry').style.display = "none";
        document.getElementById('fenglishCountry').style.display = "none";
        document.getElementById('fCountry').style.display = "none";
        document.getElementById('fbz').style.display = "none";
        document.getElementById('fjpCountry').style.display = "none";
        document.getElementById('fjpCountry').style.display = "none";
        document.getElementById('Font_Short').style.display = "none";
        if (document.getElementById("Country").value == "") {

            document.getElementById('fCountry').style.display = "";
            document.getElementById("Country").focus();
            ret = false;
        }
        if (document.getElementById("enCountry").value == "") {
            document.getElementById('fenCountry').style.display = "";
            document.getElementById("enCountry").focus();
            ret = false;
        }
        if (document.getElementById("englishCountry").value == "") {
            document.getElementById('fenglishCountry').style.display = "";
            document.getElementById("englishCountry").focus();
            ret = false;
        }
        if (document.getElementById("jpCountry").value == "") {
            document.getElementById('fjpCountry').style.display = "";
            document.getElementById("jpCountry").focus();
            ret = false;
        }
        if (document.getElementById("hanCountry").value == "") {
            document.getElementById('fhanCountry').style.display = "";
            document.getElementById("hanCountry").focus();
            ret = false;
        }
        if (document.getElementById("bz").value == "") {
            document.getElementById('fbz').style.display = "";
            document.getElementById("bz").focus();
            ret = false;
        }
        if (document.getElementById("t_jiaonaguo").value == "") {
            document.getElementById('ft_jiaonaguo').style.display = "";
            document.getElementById("t_jiaonaguo").focus();
            ret = false;
        }
        if (document.getElementById("Txt_Short").value == "") {
            document.getElementById('Font_Short').style.display = "";
            document.getElementById("Txt_Short").focus();
            ret = false;
        }
        return ret;
    }
    function checknull(inputid, fontid) {
        //        if(dianji==1)
        //        {
        if (document.getElementById(inputid).value != "") {
            document.getElementById(fontid).style.display = "none";
        }
        else {
            document.getElementById(fontid).style.display = "";
        }
        //}
    }
</script>
