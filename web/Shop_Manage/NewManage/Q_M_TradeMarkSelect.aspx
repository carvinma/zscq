<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Q_M_TradeMarkSelect.aspx.cs" ValidateRequest="false" Inherits="Q_M_TradeMarkSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/Calendar.js"></script>
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
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
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_UserNum" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
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
                    <input type="text" runat="server" id="Txt_BillNumber" class="inputs200text" maxlength="20" />
                    </td>
                </tr>
                <tr>
                    <td height="26" width="200" align="right">行政区划：</td>
                    <td height="26">
                    &nbsp;</td>
                </tr>
                <tr>
                    <td height="26" align="right">地址：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_Name" class="inputs400text" maxlength="100" />
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
                        <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">案件号：</td>
                    <td>     
                    <input type="text" runat="server" id="Txt_BillNumber0" class="inputs200text" 
                            maxlength="20" /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">申请号：</td>
                    <td>     
                    
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">商标类别：</td>
                    <td>     
                    <input type="text" runat="server" id="Txt_BillNumber2" class="inputs200text" 
                            maxlength="20" /></td>
                </tr>
                <tr>
                    <td width="200" align="right" valign="top">商标说明：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_AnnualFeeYear" class="inputs60text" maxlength="2" />  
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeeYear" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,2}">
                </asp:RegularExpressionValidator>                                                
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">是否三维商标：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_AnnualFeeRestYear" class="inputs60text" maxlength="2" />   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeeRestYear" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,2}">
                </asp:RegularExpressionValidator>                
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">是否颜色组合商标：</td>
                    <td>     
                        <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server">
                        <asp:ListItem Value="0">请选择</asp:ListItem>
                        <asp:ListItem Value="1">已完成缴费，等待下次缴费（>90天)</asp:ListItem>
                        <asp:ListItem Value="2">距缴费日期<90天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="3">距缴费日期<60天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="4">距缴费日期<30天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="5">距缴费日期<15天，尚未提交订单 </asp:ListItem>
                        <asp:ListItem Value="6">距缴费日期<0天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="7">已提交委托订单，尚未接收汇款</asp:ListItem>
                        <asp:ListItem Value="8">已提交委托订单，缴费中</asp:ListItem>
                        <asp:ListItem Value="9">经确认，放弃续费</asp:ListItem>
                        <asp:ListItem Value="10">联系不到缴费人，视为放弃缴费</asp:ListItem>
                        <asp:ListItem Value="11">缴费人无答复，视为放弃缴费</asp:ListItem>
                        <asp:ListItem Value="12">同日申请专利，自动失效</asp:ListItem>
                        <asp:ListItem Value="13">已完成所有年度缴费</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">是否声音商标：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_AnnualFeePaymentYear" class="inputs60text" maxlength="10"  />  
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
                    <input type="text" runat="server" id="txt_PriorityNumber" class="inputs200text" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PriorityNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>
                 <input type="text" runat="server" id="Text1" class="inputs80text" readonly="readonly" />
                     <input name="selbtn1" type="button"
                            id="Button1" onclick="new Calendar().show(form.txt_AnnualFeeDateEnd);" class="inputcalendarbutton" />
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">初审公告日：</td>
                    <td>     
                       <input type="text" runat="server" id="txt_AnnualFeeDateEnd" class="inputs80text" readonly="readonly" />
                     <input name="selbtn1" type="button"
                            id="Button13" onclick="new Calendar().show(form.txt_AnnualFeeDateEnd);" class="inputcalendarbutton" />                 
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">注册公告日：</td>
                    <td>        
                        <input type="text" runat="server" id="txt_PriorityDate" readonly="readonly"
                             class="inputs80text" />
                        <input name="selbtn1" type="button" id="dt_PriorityDate" onclick="new Calendar().show(form.txt_PriorityDate);" class="inputcalendarbutton" />            
                        --                        
                        <input type="text" runat="server" id="txt_PriorityDate2" readonly="readonly"
                             class="inputs80text" /><input name="selbtn1" type="button" id="Button10" onclick="new Calendar().show(form.txt_PriorityDate2);" class="inputcalendarbutton" />        
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">续展期限日：</td>
                    <td>        
                          <input type="text" runat="server" id="txt_AnnualFeePrevYear" readonly="readonly"
                             class="inputs80text"  />
                             <input name="selbtn1" type="button"
                            id="Button5" onclick="new Calendar().show(form.txt_AnnualFeePrevYear);" class="inputcalendarbutton" />
                            --
                            <input type="text" runat="server" id="txt_AnnualFeePrevYear2" readonly="readonly"
                             class="inputs80text"  /><input name="selbtn1" type="button"
                            id="Button9" onclick="new Calendar().show(form.txt_AnnualFeePrevYear2);" class="inputcalendarbutton" /></td>
                </tr>
                <tr>
                    <td height="26" align="right" valign="top">所剩天数：</td>
                    <td>        
                    <input type="text" runat="server" id="txt_yaoqiuxiang" class="inputs60text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
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
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    
                    <input type="text" runat="server" id="txt_PtcNumber" class="inputs200text" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PtcNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>   
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">商标状态：</td>
                    <td height="26">
                        <asp:DropDownList ID="Drp_PatentHolderNationalityId0" runat="server">
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
                    
                    <input type="text" runat="server" id="Txt_BillNumber1" class="inputs200text" 
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
