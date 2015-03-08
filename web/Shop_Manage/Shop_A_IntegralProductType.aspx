<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_IntegralProductType.aspx.cs" Inherits="Shop_A_PatentType" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>    
    <title></title>
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
    <style type="text/css">
    .colordiv
    {
    	border:solid 1px #8dcff4;
    	width:16px;
    	height:16px;
    	padding:1px;
    	float:left;
    	margin-right:5px;
    	cursor:pointer;
    }
    .colordiv:hover
    {
    	border:solid 1px #e8641b;
    }
    .colordiv img
    {
    	width:16px;
    	height:16px;
    }
    .colordivselect
    {
    	padding:1px;
    	float:left;
    	margin-right:5px;
    	cursor:pointer;
    	width:32px;
    	height:32px;
    	border:solid 1px #e8641b;
    }
    .colordivselect img
    {
    	width:32px;
    	height:32px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hd" runat="server" value="0" />
        <input type="hidden" id="Hi_OldGuoJi" runat="server" value="0" />
        <h1>
            <span class="action-span"><a href="Shop_M_IntegralProductType.aspx?<%=returnurl %>">商品分类列表</a></span> <span class="action-span1"><a
                    href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1"> - <%=PageType%></span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="list-div" id="listDiv">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        <%=PageType%>
                    </th>
                </tr>
               
                <tr>
                    <td height="26" align="right">中文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_zhongwen" class="inputs200text" MaxLength="40"/>
                        <font color="#FF0000">*</font>&nbsp;
                        <font id="txt_zhongwenfont" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写商品分类名称</font>
                     </td>
                </tr>
                <tr>
                    <td height="26" align="right">英文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_yingwen" class="inputs200text" MaxLength="40"/>
                     </td>
                </tr>
                <tr>
                    <td height="26" align="right">日文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_riwen" class="inputs200text" MaxLength="40"/>
                     </td>
                </tr>
                <tr>
                    <td height="26" align="right">韩文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_hanwen" class="inputs200text" MaxLength="40" value=""/>
                     </td>
                </tr>
              
            </table>
        </div>
        <br />
        <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px;background: #dfeef5;"><%if ((pageadd && hd.Value == "0") || (pageupdate && hd.Value != "0"))
                                                                                                                                 { %><asp:Button ID="btOK" runat="server" Text="提交" class="button" OnClick="btOK_Click"
                            OnClientClick="return checkaddnews();" style="margin-left:125px;" /><%} %><% if (hd.Value != "0")
                                                                              { %><input type="button" id="Button3" value="返回" class="button"
                              onclick="javascript:window.location='Shop_M_IntegralProductType.aspx?<%=returnurl %>    ';" /><%} %>
        </div>    
    <div id="div_a" runat="server"></div>
        <!-- #include file="push.html" -->
    </form>
</body>
</html>
