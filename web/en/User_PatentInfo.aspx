<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentInfo.aspx.cs" Inherits="User_PatentInfo" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check patent information_My patent_Service Center_User Center_System of Patent Annuity Fee_Global Patent</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    
</head>
<body id="index">
    <form id="form1" runat="server">
    <input type="hidden" id="hd_id" runat="server" value="0" />
    <input type="hidden" id="hd_userId" runat="server" value="0" />
    <input type="hidden" id="hd_yaoqiuxiang" runat="server" value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <!--专利左侧START-->
                <uc3:patentleft ID="patentleft1" runat="server" />
                <!--专利左侧END-->
            </td>
            <td align="left" valign="top">
                <table width="741" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
                            <table width="739" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="701">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        Front page>>System of Patent Annuity Fee>>User Center>>Service Center>>My patent>>Check patent information
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="right">
                                        <%--                  <a href="User_PatentExport.aspx?pId=<%=hd_id.Value%>">
                  <img src="images/user_daochu.gif" width="85" height="29" border="0" /></a>--%>
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="images/user_daochu.gif" runat="server" Width="85" Height="29" border="0" OnClick="ImageButton1_Click" />&nbsp; <a href="User_PatentAdd1.aspx?pId=<%=hd_id.Value%>">
                                            <img src="images/user_zl_b12.gif" width="85" height="29" border="0" id="imgedit" runat="server" /></a> &nbsp; <a href="<%=pagehref %>">
                                                <img src="images/user_zl_b13.gif" width="85" height="29" border="0" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="115" align="center" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="163" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="143" align="center" class="font12bt">
                                                                            patent information
                                                                        </td>
                                                                        <td width="10">
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
                                                                            <strong>System serial number：<br />
                                                                            </strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_OrderBy" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Patent number：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_Number" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Title of patent：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_Name" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Granted Country：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AuthorizeNationalityId" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Type of patent：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentType" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Filing date of patent：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AuthorizeIsNationalityDate" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Grant date of patent ：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AuthorizeIsAuthorizeDate" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_qlyqx" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>Number of claims：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_yaoqiuxiang" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Patentee：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentHolder" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Nationality of patentee：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentHolderNationalityId" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Inventor：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentInventor" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            Patent Status
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
                                                                            <strong>Start date of patent right：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeDateStart" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Expire date of patent right：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeDateEnd" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Protection term：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Remained protection years：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeRestYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Status of payment：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeStatus" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Paid annuity year：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeePaymentYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Last deadline：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeePrevYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="200" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="185" align="center" class="font12bt">
                                                                            Patent Priority information
                                                                        </td>
                                                                        <td width="5">
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
                                                                            <strong>Priority application number：<br />
                                                                            </strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_PriorityNumber" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Priority country：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PriorityNationalityId" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Priority filing date：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PriorityDate" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="141" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="124" align="center" class="font12bt">
                                                                            PCT information
                                                                        </td>
                                                                        <td width="7">
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
                                                                            <strong>PCT application number：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_PtcNumber" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>PCT filing date：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_PtcDate" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="180" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="161" align="center" class="font12bt">
                                                                            Payment information
                                                                        </td>
                                                                        <td width="9">
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
                                                                            <strong>Deadline of payment：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeNextYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Days before the deadline：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeRestDay" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>Annuity year：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeNotPaymentYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Official fee：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeNextPaymentMoney" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Service fee：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AgentServiceFee" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Bank charges：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_RemittanceFee" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_chaoxiangfee" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>Excess fee of claims：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_chaoxiang" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_jianmianfee" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>Reduction：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_jianmian1" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_zhinajinfee" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>Surcharge：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_zhinajin" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Total fee：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_FeeSubtotal" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Currency：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_HuoBiType" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Note：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_Remark" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="205" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="187" align="center" class="font12bt">
                                                                            Information of the third party
                                                                        </td>
                                                                        <td width="8">
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
                                                                            <strong>Reference number：<br />
                                                                            </strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_anjuanhao" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Contact person：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_linkman" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Address：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_address" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>Tel：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_phone" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="i_OrderBy" HeaderText="System serial number" />
            <asp:BoundField DataField="nvc_Number" HeaderText="Patent number" />
            <asp:BoundField DataField="nvc_Name" HeaderText="Title of patent" />
            <asp:TemplateField HeaderText="Granted Country">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_EnglishName" HeaderText="Type of patent" />
            <asp:TemplateField HeaderText="Filing date of patent">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Grant date of patent ">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_YaoQiuXiang" HeaderText="Number of claims" />
            <asp:BoundField DataField="nvc_PatentHolder" HeaderText="Patentee" />
            <asp:TemplateField HeaderText="Nationality of patentee">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PatentInventor" HeaderText="Inventor" />
            <asp:TemplateField HeaderText="Start date of patent right">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Expire date of patent right">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_AnnualFeeYear" HeaderText="Protection term" />
            <asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="Remained protection years" />
            <asp:TemplateField HeaderText="Status of payment">
                <ItemTemplate>
                    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")),"en")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="Paid annuity year" />
            <asp:TemplateField HeaderText="Last deadline">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PriorityNumber" HeaderText="Priority application number" />
            <asp:TemplateField HeaderText="Priority country">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Priority filing date">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_PriorityDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT application number" />
            <asp:TemplateField HeaderText="PCT filing date">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_PtcDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deadline of payment">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_AnnualFeeRestDay" HeaderText="Days before the deadline" />
            <asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="Annuity year" />
            <asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="Official fee" />
            <asp:BoundField DataField="dm_AgentServiceFee" HeaderText="Service fee" />
            <asp:BoundField DataField="dm_RemittanceFee" HeaderText="Bank charges" />
            <asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="Excess fee of claims" />
            <asp:BoundField DataField="i_JianMian1" HeaderText="Reduction" />
            <asp:TemplateField HeaderText="Surcharge">
                <ItemTemplate>
                    <%#Ltl_zhinajin.Text%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_CurrencyType" HeaderText="Currency" />
            <asp:BoundField DataField="dm_FeeSubtotal" HeaderText="Total fee" />
            <asp:BoundField DataField="nt_Remarks" HeaderText="Note" />
        </Columns>
    </asp:GridView>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
