<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_HelpType.aspx.cs" Inherits="Shop_Manage_shop_bookclass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
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

    <script type="text/javascript" src="js/vcom.js"></script>
    <script type="text/javascript">                                                   
    function IsDigit()
    {
        return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
    </script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" runat="server" id="Hi_TId" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_Help.aspx?<%=returnurl %>">帮助列表</a></span>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span
            id="search_id" class="action-span1">-添加帮助类别 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加类别
                </th>
            </tr>
            <tr>
                <td width="100" align="right">类别名称：</td>
                <td><asp:TextBox ID="txtNmae" runat="server" CssClass="inputs200text" MaxLength="30" onblur="checknull('txtNmae','ftxtNmae')"></asp:TextBox>&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="ftxtNmae" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写类别名称</font>
                </td>
            </tr>
            <tr>
                <td align="right">排序编号：</td>
                <td><asp:TextBox ID="txtOrderID" runat="server" CssClass="inputs60text" MaxLength="4" onblur="checknull('txtOrderID','ftxtOrderID')"
                    onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;"></asp:TextBox>&nbsp;<font
                         color="#FF0000">*</font>&nbsp;<font id="ftxtOrderID" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写排序编号</font>
                </td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td><%if ((pageadd && Hi_TId.Value == "0") || (pageupdate && Hi_TId.Value != "0"))
                      { %><asp:Button ID="Button1" runat="server" Text="添加" class="button" OnClick="btnAdd_Click"
                 OnClientClick="return checkinput()" /><%} %><%if (Hi_TId.Value != "0")
                                                               { %><input type="button" class="button" value="返回" onclick="javascript:window.location='Shop_M_Help.aspx?<%=returnurl%>';"/><%} %>
                </td>
            </tr>
        </table>
    </div> 
    <script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server">
    </div></form>
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
    document.getElementById('ftxtNmae').style.display="none";
    document.getElementById('ftxtOrderID').style.display="none";
    var flag=true;
	if(document.form1.txtOrderID.value=="")
	{
	    document.getElementById('ftxtOrderID').style.display="";
	    document.form1.txtOrderID.focus();
	    flag=false;
	}
	if(document.form1.txtNmae.value=="")
	{
	    document.getElementById('ftxtNmae').style.display="";
	    document.form1.txtNmae.focus();
	    flag=false;
	}
	return flag;
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