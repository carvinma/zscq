<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentExport.aspx.cs"
Inherits="User_PatentExport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
</head>
<body>
<form id="form1" runat="server">
<div class="list-div" id="listDiv">
<asp:Repeater ID="DataList1" runat="server">
<ItemTemplate>
<table width="716" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="25" height="28">&nbsp;

</td>
<td width="691">&nbsp;

</td>
</tr>
<tr>
<td height="123">&nbsp;

</td>
<td width="691" align="left" valign="top">
<table width="689" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="115" align="center" valign="top">
            <table width="689" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="10" height="20">&nbsp;
                                    
                                </td>
                                <td width="98" align="center" class="font12bt">
                                    专利信息
                                </td>
                                <td width="6">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="18" align="left">
                    </td>
                </tr>
                <tr>
                    <td height="115" align="left" valign="top">
                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>系统序号：<br />
                                    </strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("i_OrderBy")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利号：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_Number")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利名称：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_Name")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利授权国：</strong>
                                </td>
                                <td align="left">
                                    <%#DALN.Nationality_Select_Id(Convert.ToInt32(Eval("i_AuthorizeNationalityId"))).nvc_Name%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利类型：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_PatentTypeName")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利申请日：</strong>
                                </td>
                                <td align="left">
                                    <%#Convert.ToDateTime(Eval("dt_AuthorizeIsNationalityDate")).ToShortDateString()%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利授权日：</strong>
                                </td>
                                <td align="left">
                                    <%#Convert.ToDateTime(Eval("dt_AuthorizeIsAuthorizeDate")).ToShortDateString()%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>权利要求项：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("i_YaoQiuXiang")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利权人：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_PatentHolder")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>专利权人国籍：</strong>
                                </td>
                                <td align="left">
                                    <%#DALN.Nationality_Select_Id(Convert.ToInt32(Eval("i_PatentHolderNationalityId"))).nvc_Name%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>发明人：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_PatentInventor")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>该项专利范围：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_PatentScope")%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">&nbsp;
                        
                    </td>
                </tr>
            </table>
            <table width="689" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="10" height="20">&nbsp;
                                    
                                </td>
                                <td width="98" align="center" class="font12bt">
                                    专利状态
                                </td>
                                <td width="6">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="18" align="left">
                    </td>
                </tr>
                <tr>
                    <td height="115" align="left" valign="top">
                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>专利有效维持期限起始日：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Convert.ToDateTime(Eval("dt_AnnualFeeDateStart")).ToShortDateString()%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>专利有效维持期限终止日：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Convert.ToDateTime(Eval("dt_AnnualFeeDateEnd")).ToShortDateString()%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>专利有效维持年限：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("i_AnnualFeeYear")%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>专利剩余有效维持年限：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("i_AnnualFeeRestYear")%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>专利于该授权国的年费缴费状态：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")))%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>专利已缴纳年度：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("nvc_AnnualFeePaymentYear")%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>上一次年费缴纳期限日：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Convert.ToDateTime(Eval("dt_AnnualFeePrevYear")).ToShortDateString()%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">&nbsp;
                        
                    </td>
                </tr>
            </table>
            <table width="689" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="10" height="20">&nbsp;
                                    
                                </td>
                                <td width="98" align="center" class="font12bt">
                                    专利优先权信息
                                </td>
                                <td width="6">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="18" align="left">
                    </td>
                </tr>
                <tr>
                    <td height="115" align="left" valign="top">
                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>优先权申请号：<br />
                                    </strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("nvc_PriorityNumber")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>优先权国：</strong>
                                </td>
                                <td align="left">
                                    <%#DALN.Nationality_Select_Id(Convert.ToInt32(Eval("i_PriorityNationalityId"))).nvc_Name%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>优先权申请日：</strong>
                                </td>
                                <td align="left">
                                    <%#Convert.ToDateTime(Eval("dt_PriorityDate")).ToShortDateString()%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table width="689" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="10" height="20">&nbsp;
                                    
                                </td>
                                <td width="98" align="center" class="font12bt">
                                    PCT信息
                                </td>
                                <td width="6">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="18" align="left">
                    </td>
                </tr>
                <tr>
                    <td height="64" align="left" valign="top">
                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>PCT申请号：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("nvc_PtcNumber")%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>PCT申请日：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Convert.ToDateTime(Eval("dt_PtcDate")).ToShortDateString()%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">&nbsp;
                        
                    </td>
                </tr>
            </table>
            <table width="689" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="10" height="20">&nbsp;
                                    
                                </td>
                                <td width="98" align="center" class="font12bt">
                                    缴费信息
                                </td>
                                <td width="6">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="18" align="left">
                    </td>
                </tr>
                <tr>
                    <td height="115" align="left" valign="top">
                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>缴费期限日：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Convert.ToDateTime(Eval("dt_AnnualFeeNextYear")).ToShortDateString()%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>距缴费期限所剩天数：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("i_AnnualFeeRestDay")%>
                                </td>
                            </tr>
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>代缴年度：</strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("nvc_AnnualFeeNotPaymentYear")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>官费：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("dm_AnnualFeeNextPaymentMoney")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>代理费：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("dm_AgentServiceFee")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>汇款手续费：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("dm_RemittanceFee")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>超项费：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("dm_ChaoXiangFee")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>减免：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("i_JianMian1")%>
                                    %
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>滞纳金：</strong>
                                </td>
                                <td align="left">
                                    <%#GetZhiNaJin(Convert.ToInt32(Eval("i_AnnualFeeRestDay")), Convert.ToInt32(Eval("i_PatentType")), Eval("nvc_AnnualFeeNotPaymentYear").ToString())%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>货币种类：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_CurrencyType")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>费用小计：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("dm_FeeSubtotal")%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">&nbsp;
                        
                    </td>
                </tr>
            </table>
            <table width="689" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="10" height="20">&nbsp;
                                    
                                </td>
                                <td width="98" align="center" class="font12bt">
                                    第三方信息
                                </td>
                                <td width="6">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="18" align="left">
                    </td>
                </tr>
                <tr>
                    <td height="115" align="left" valign="top">
                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="260" height="32" align="right">
                                    <strong>案卷号：<br />
                                    </strong>
                                </td>
                                <td width="429" align="left">
                                    <%#Eval("nvc_AnJuanNum")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>联系人：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_LinkMan")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>地址：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_Address")%>
                                </td>
                            </tr>
                            <tr>
                                <td height="32" align="right">
                                    <strong>电话：</strong>
                                </td>
                                <td align="left">
                                    <%#Eval("nvc_Phone")%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">&nbsp;
                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="left">&nbsp;
            
        </td>
    </tr>
</table>
</td>
</tr>
</table>
</ItemTemplate>
</asp:Repeater>
        
</div>
</form>
</body>
</html>
