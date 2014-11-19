<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Coupon.aspx.cs" Inherits="Shop_Manage_shop_yhjadd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />

    <%--<script type="text/javascript" src="js/vsport.js"></script>--%>

    <script type="text/javascript" src="js/vcom.js"></script>

    <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
    
    <script language="javascript" src="images/hoot.js" type="text/javascript"></script>
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
    <script type="text/javascript">
    function IsDigit()
    {
          return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
    </script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" method="post" runat="server" onsubmit="return checkinput();">
    <h1>
        <span class="action-span"><a href="Shop_M_Coupon.aspx">优惠券列表</a></span> <span class="action-span1">
            <a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">
                - 生成优惠券 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    <span class="action-span1">生成优惠券</span>
                </th>
            </tr>
            <tr>
                <td align="right">优惠券种类：</td>
                <td><asp:DropDownList ID="DDL_CouponType" runat="server" AppendDataBoundItems="True">
                    </asp:DropDownList>&nbsp;<span style="color: red;">*</span>&nbsp;<font
                     id="fDDL_CouponType" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择优惠券种类</font></td>
            </tr>
            <tr>
                <td width="45%" height="25" align="right">
                    生成张数：
                </td>
                <td width="55%" height="25" align="left"><asp:TextBox ID="TextBox1" runat="server" CssClass="inputs60text" onkeypress="event.returnValue=IsDigit();"
                 onblur="checknull('TextBox1','fTextBox1')"></asp:TextBox>&nbsp;<span style="color: red;">*</span>&nbsp;<font
                     id="fTextBox1" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写生成张数</font>
                </td>
            </tr>
            <tr>
                <td align="right">过期时间：</td>
                <td><input type="text" runat="server" id="text_CouponName" size="10" value='' readonly="readonly" /><input name="selbtn1" type="button"
            id="selbtn1" onclick="new Calendar().show(form.text_CouponName);" value="选择" class="button" />&nbsp;<span style="color: red;">*</span>&nbsp;<font
                     id="ftext_CouponName" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择过期时间</font></td>
            </tr>
            <tr>
                <td height="25">&nbsp;</td>
                <td height="25"><%if (add){%><asp:Button ID="Button1" runat="server" Text="提交" CssClass="button" OnClick="Button1_Click" /><%}%>
                </td>
            </tr>
        </table>

      <script type="text/javascript" src="js/ss.js"></script>

    </div>
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
        var ret=true;
		document.getElementById('fDDL_CouponType').style.display="none";
		document.getElementById('fTextBox1').style.display="none";
		document.getElementById('ftext_CouponName').style.display="none";
		if(document.getElementById("text_CouponName").value=="")
		{
		    document.getElementById('ftext_CouponName').style.display="";
		    document.getElementById("text_CouponName").focus();
		    ret= false;
	    }
		if(document.getElementById("TextBox1").value=="")
		{
		    document.getElementById('fTextBox1').style.display="";
		    document.getElementById("TextBox1").focus();
		    ret= false;
	    }
		if(document.getElementById("DDL_CouponType").value=="0")
		{
		    document.getElementById('fDDL_CouponType').style.display="";
		    document.getElementById("DDL_CouponType").focus();
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