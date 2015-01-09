<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Q_M_TradeMarkSelect.aspx.cs" ValidateRequest="false" Inherits="Q_M_TradeMarkSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/Calendar.js"></script>
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../../js/jtrademark.js" type="text/javascript"></script>
     <script type="text/javascript">
        $(function () {
            InitProCityArea();
            $(".intinput").bind("input propertychange paste", function () {
                $(this).val($(this).val().replace(/[^\d]/g, ''));
            }).css("ime-mode", "disabled");
            });
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
        .style1
        {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <input type="hidden" id="hd_id" runat="server" value="0" />
            <input type="hidden" id="hd_userId" runat="server" value="0" />
        <h1>
            <span class="action-span"><a href="L_M_Trademark.aspx?<%=returnurl %>">商标列表</a></span> <span class="action-span1"><a
                    href="../Shop_Index_Main.aspx">商标管理中心</a> </span><span id="search_id" class="action-span1"> - 查询商标</span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="list-div" id="Div1">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                         会员信息
                    </th>
                </tr>
                <tr>
                    <td height="26" width="200" align="right">会员编号：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_UserNum" class="inputs200text" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                    runat="server" ErrorMessage="RegularExpressionValidator" 
                    ValidationGroup="a" ControlToValidate="txt_UserNum" 
                    Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">会员名称：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_UserName" class="inputs200text" maxlength="20"/>
                    </td>
                </tr>
                </table>
        </div>
        <br />
        <div class="list-div" id="Div2">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                         注册人信息
                    </th>
                </tr>
                <tr>
                    <td height="26" width="200" align="right">申请人名称：</td>
                    <td height="26">
                    <input type="text" runat="server" id="Txt_applyName" class="inputs200text" maxlength="20" />
                    </td>
                </tr>
                <tr>
                    <td height="26" width="200" align="right">行政区划：</td>
                    <td height="26">
                        <select id="live_prov" name="live_prov" onchange="SelCity(this.value);">
                        <option value="">请选择</option></select>
                        <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                        <option value="">请选择</option></select>
                        <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                        <option value="">请选择</option></select>
                        <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static"  />
                            <input type="hidden" runat="server" id="Hi_city" clientidmode="Static" />
                            <input type="hidden" runat="server" id="Hi_country" clientidmode="Static" />
                        </td>
                </tr>
                <tr>
                    <td height="26" align="right">地址：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_address" class="inputs400text" maxlength="100" />
                    </td>
                </tr>
                </table>
        </div>
        <br />
        <div class="list-div" id="Div6">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        商标信息
                    </th>
                </tr>
                <tr>
                    <td align="right" valign="top">案件分类：</td>
                    <td>     
                        <asp:DropDownList ID="Drp_CaseType" runat="server" 
                            onselectedindexchanged="Drp_CaseType_SelectedIndexChanged" 
                            AutoPostBack="True">
                            <asp:ListItem Value="-1" Selected="True">全部</asp:ListItem>
                            <asp:ListItem Value="0">申请</asp:ListItem>
                            <asp:ListItem Value="1">续展</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">案件号：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_caseNo" class="inputs200text intinput" 
                            maxlength="20" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">申请号：</td>
                    <td>     
                      <input type="text" runat="server" id="txt_applyNo" class="inputs200text intinput" 
                            maxlength="20" />
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">商标类别：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_traceMarkType" class="inputs200text" 
                            maxlength="20" /></td>
                </tr>
                <tr>
                    <td width="200" align="right" valign="top">商标说明：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_traceMarkRemark" class="inputs200text" maxlength="100" />                                                
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" class="style1">是否三维商标：</td>
                    <td class="style1">     
                    &nbsp;<asp:DropDownList ID="Drp_3D" runat="server">
                            <asp:ListItem Value="-1">全部</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">是否颜色组合商标：</td>
                    <td>     
                        &nbsp;<asp:DropDownList ID="Drp_Color" runat="server">
                            <asp:ListItem Value="-1">全部</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">是否声音商标：</td>
                    <td>     
                    &nbsp;<asp:DropDownList ID="Drp_Sound" runat="server">
                            <asp:ListItem Value="-1">全部</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                </table>
        </div>
         <br />
        <div class="list-div" id="Div3">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        商标日期
                    </th>
                </tr>
                <tr>
                    <td width="200" height="26" align="right" valign="top">商标申请日：</td>
                    <td height="26">
                        <input type="text" runat="server" id="txt_ApplyDate" class="inputs80text" 
                            readonly="readonly" />
                     <input name="selbtn1" type="button"
                            id="Button1" onclick="new Calendar().show(form.txt_ApplyDate);" class="inputcalendarbutton" />
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">初审公告日：</td>
                    <td>     
                       <input type="text" runat="server" id="txt_PublicPreliminaryDate" 
                            class="inputs80text" readonly="readonly" />
                     <input name="selbtn1" type="button"
                            id="Button13" onclick="new Calendar().show(form.txt_PublicPreliminaryDate);" class="inputcalendarbutton" />                 
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">注册公告日：</td>
                    <td>        
                        <input type="text" runat="server" id="txt_RegNoticeDateBegin" readonly="readonly"
                             class="inputs80text" />
                        <input name="selbtn1" type="button" id="dt_PriorityDate" onclick="new Calendar().show(form.txt_RegNoticeDateBegin);" class="inputcalendarbutton" />            
                        --                        
                        <input type="text" runat="server" id="txt_RegNoticeDateEnd" readonly="readonly"
                             class="inputs80text" /><input name="selbtn1" type="button" id="Button10" onclick="new Calendar().show(form.txt_RegNoticeDateEnd);" class="inputcalendarbutton" />        
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">续展期限日：</td>
                    <td>        
                          <input type="text" runat="server" id="txt_RenewalDateBegin" readonly="readonly"
                             class="inputs80text"  />
                             <input name="selbtn1" type="button"
                            id="Button5" onclick="new Calendar().show(form.txt_RenewalDateBegin);" class="inputcalendarbutton" />
                            --
                            <input type="text" runat="server" id="txt_RenewalDateEnd" readonly="readonly"
                             class="inputs80text"  /><input name="selbtn1" type="button"
                            id="Button9" onclick="new Calendar().show(form.txt_RenewalDateEnd);" class="inputcalendarbutton" /></td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">所剩天数：</td>
                    <td>        
                    <input type="text" runat="server" id="txt_restDays" class="inputs60text intinput"/></td>
                </tr>
            </table>
        </div>
        <br />
        <div class="list-div" id="Div4">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        商标状态
                    </th>
                </tr>
                <tr>
                    <td width="200" height="26" align="right">最近状态：</td>
                    <td height="26">
                        <asp:DropDownList ID="Drp_Status" runat="server">
                        </asp:DropDownList>
                    
                    &nbsp;</td>
                </tr>
                <tr>
                    <td height="26" align="right">商标状态：</td>
                    <td height="26">
                        <asp:DropDownList ID="Drp_AdminStatus" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="list-div" id="Div5">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        帐单信息
                    </th>
                </tr>
                <tr>
                    <td width="200" align="right" valign="top">账单号：</td>
                    <td>     
                    
                    <input type="text" runat="server" id="txt_AccountNo" class="inputs200text" 
                            maxlength="20" /></td>
                </tr>
                
                </table>
        </div>
        <br />
        <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px;background: #dfeef5;"><%if ((pageadd && hd_id.Value == "0") || (pageupdate && hd_id.Value != "0"))
                                                                                                                                 { %><asp:Button ID="btOK" runat="server" Text="查询" class="button" ValidationGroup="a" OnClick="btOK_Click" style="margin-left:350px;" /><%} %><% if (hd_id.Value != "0")
                                                                              { %><input type="button" id="Button3" value="返回" class="button"
                              onclick="javascript:window.location='Shop_M_Patent.aspx?<%=returnurl %>';" /><%} %>
        </div>    
    <div id="div_a" runat="server"></div>
    </form>
</body>
</html>
