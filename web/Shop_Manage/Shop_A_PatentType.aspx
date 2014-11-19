<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_PatentType.aspx.cs" Inherits="Shop_A_PatentType" ValidateRequest="false" %>

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
            <span class="action-span"><a href="Shop_M_PatentType.aspx?<%=returnurl %>">专利类型列表</a></span> <span class="action-span1"><a
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
                    <td width="15%" height="26" align="right">国家：</td>
                    <td height="26">
                    <asp:DropDownList ID="Drp_GuoJiaType" runat="server" >
                        <asp:ListItem Value="0">请选择</asp:ListItem>
                        </asp:DropDownList>&nbsp;
                        <font color="#FF0000">*</font>&nbsp;
                        <font id="Drp_GuoJiaTypeFont" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择国家</font>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">中文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_zhongwen" class="inputs200text" MaxLength="40"/>
                        <font color="#FF0000">*</font>&nbsp;
                        <font id="txt_zhongwenfont" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写专利名称</font>
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
               <tr>
                    <td height="26" align="right">有效期：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_youxiaoqi" class="inputs80text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                     </td>
                </tr>
                <tr>
                    <td height="26" align="right">有效期起算日：</td>
                    <td height="26">
                        <asp:RadioButton ID="rb_youxiaoqi1" runat="server" GroupName="youxiaoqi" Checked />申请日
                        <asp:RadioButton ID="rb_youxiaoqi2" runat="server" GroupName="youxiaoqi" />授权日
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">缴费第一年起算日：</td>
                    <td height="26">
                        <asp:RadioButton ID="rb_firstyear1" runat="server" GroupName="firstyear" Checked/>申请日
                        <asp:RadioButton ID="rb_firstyear2" runat="server" GroupName="firstyear"/>授权日
                        <asp:RadioButton ID="rb_firstyear3" runat="server" GroupName="firstyear"/>申请日的第二年
                        <asp:RadioButton ID="rb_firstyear4" runat="server" GroupName="firstyear"/>授权日的第二年
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">是否有权利要求项：</td>
                    <td height="26">
                        <asp:CheckBox ID="cb_yaoqiuxiang" runat="server" />&nbsp;&nbsp;
                        是否有滞纳金：<asp:CheckBox ID="cb_zhinajin" runat="server" />&nbsp;&nbsp;
                        是否有超项费：<asp:CheckBox ID="cb_chaoxiangfee" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">年次设置：</td>
                    <td height="26">
                        <asp:Repeater ID="Rpt_CbList" runat="server">
                        <ItemTemplate>
                            <div style="width:90px; float:left">
                            <asp:CheckBox ID="Cb_Year" runat="server" /><%#Eval("nvc_Year")%>
                             <asp:HiddenField ID="HF" runat="server" Value='<%#Eval("i_Id") %>' />
                             <asp:HiddenField ID="HF_Year" runat="server" Value='<%#Eval("nvc_Year") %>' />
                            </div>
                        </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px;background: #dfeef5;"><%if ((pageadd && hd.Value == "0") || (pageupdate && hd.Value != "0"))
                                                                                                                                 { %><asp:Button ID="btOK" runat="server" Text="提交" class="button" OnClick="btOK_Click"
                            OnClientClick="return checkaddnews();" style="margin-left:125px;" /><%} %><% if (hd.Value != "0")
                                                                              { %><input type="button" id="Button3" value="返回" class="button"
                              onclick="javascript:window.location='Shop_M_PatentType.aspx?<%=returnurl %>';" /><%} %>
        </div>    
    <div id="div_a" runat="server"></div>
        <!-- #include file="push.html" -->
    </form>
</body>
</html>
<script language="JavaScript" type="text/JavaScript">
var dianji=0;
function checkaddnews()
{
    if(dianji==0)
    {
        dianji=1;
    }
    document.getElementById('Drp_GuoJiaTypeFont').style.display = "none";
    document.getElementById('txt_zhongwenfont').style.display = "none";
    if (document.getElementById("Drp_GuoJiaType").value == "0")
    {
        document.getElementById('Drp_GuoJiaTypeFont').style.display = "";
        document.getElementById("Drp_GuoJiaType").focus();
	    return false;
	}
	if (document.getElementById("txt_zhongwen").value == "") {
	    document.getElementById('txt_zhongwenfont').style.display = "";
	    document.getElementById("txt_zhongwen").focus();
	    return false;
	}
    return true;
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