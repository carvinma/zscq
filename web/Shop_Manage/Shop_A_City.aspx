<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_City.aspx.cs" Inherits="Shop_Manage_shi_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/vcom.js"></script>

    <script type="text/javascript">
    function IsDigit() 
    {
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
	    margin-bottom:-3px;
    }
    </style>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <span class="action-span"><a href="Shop_M_City.aspx<%="?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value %>">城市列表</a></span> <span class="action-span1">
            <a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">
                - 添加城市 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加城市
                </th>
            </tr>
            <tr>
                <td height="25" align="right">
                    所属省份：
                </td>
                <td><asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="45%" height="25" align="right">
                    城市代码：
                </td>
                <td width="55%" height="25" align="left"><input id="cityID" type="text" size="20" maxlength="10" class="inputs60text" onkeyup="value=value.replace(/[^\d]/g, '')" onbeforepaste="clipboardData.setData( 'text',clipboardData.getData( 'text').replace(/[^\d]/g, ''))" onkeypress="event.returnValue=IsDigit();"
                        value="" runat="server" onblur="checknull('cityID','fcityID')" />&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="fcityID" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写城市代码</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    城市名称：
                </td>
                <td height="25" align="left"><input id="city" type="text" size="20" maxlength="10" class="inputs200text" runat="server" onblur="checknull('city','fcity')" />&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="fcity" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写城市名称</font>
                </td>
            </tr>
            <tr>
            <td></td>
                <td height="25"><asp:Button ID="Button1" runat="server" Text="提交" OnClientClick="return checkinput()"
                        CssClass="button" OnClick="Button1_Click" /><input type="hidden" id="Hidden1" runat="server" value="" />
                    <input type="hidden" id="Hidden2" runat="server" value="" />
                </td>
            </tr>
        </table>
    </div><script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server"></div>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>

<script type="text/javascript" language="javascript">
var dianji=0;
function checkinput() 
{
    if(dianji==0)
    {
        dianji=1;
    }
    document.getElementById('fcityID').style.display="none";
    document.getElementById('fcity').style.display="none";
    var ret=true;
     if (document.getElementById("city").value == "") 
    {
        document.getElementById('fcity').style.display="";
        document.getElementById("city").focus();
        ret= false;
    }
    if (document.getElementById("cityID").value == "") 
    {
        document.getElementById('fcityID').style.display="";
        document.getElementById("cityID").focus();
        ret= false;
    }
    return ret;
}
function checknull(inputid,fontid)
{
    if(dianji==1)
    {
        if(document.getElementById(inputid).value!="")
        {
            document.getElementById(fontid).style.display="none";
        }
        else
        {
            document.getElementById(fontid).style.display="";
        }
    }
}
</script>