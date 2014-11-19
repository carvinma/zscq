<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentInfo.aspx.cs"
    Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查看专利信息_我的专利_服务中心_会员中心_专利系统_环球汇通</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <input type="hidden" id="hd_id" runat="server" value="0" />
    <input type="hidden" id="hd_userId" runat="server" value="0" />
    <input type="hidden" id="hd_yaoqiuxiang" runat="server" value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;
        background-color: #fff;">
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
                                        首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的专利 >> 查看专利信息
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
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="images/user_daochu.gif" runat="server"
                                            Width="85" Height="29" border="0" OnClick="ImageButton1_Click" />&nbsp; <a href="User_PatentAdd1.aspx?pId=<%=hd_id.Value%>">
                                                <img src="images/user_zl_b12.gif" width="85" height="29" border="0" id="imgedit"
                                                    runat="server" /></a> &nbsp; <a href="<%=pagehref %>">
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
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
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
                                                                            <asp:Literal ID="Ltl_OrderBy" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利号：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_Number" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利名称：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_Name" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利授权国：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AuthorizeNationalityId" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利类型：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentType" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利申请日：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AuthorizeIsNationalityDate" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利授权日：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AuthorizeIsAuthorizeDate" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_qlyqx" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>权利要求项：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_yaoqiuxiang" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利权人：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentHolder" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>专利权人国籍：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PatentHolderNationalityId" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>发明人：</strong>
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
                                                                            <asp:Literal ID="Ltl_AnnualFeeDateStart" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>专利有效维持期限终止日：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeDateEnd" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>专利有效维持年限：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>专利剩余有效维持年限：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeRestYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>专利于该授权国的年费缴费状态：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeStatus" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>专利已缴纳年度：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeePaymentYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>上一次年费缴纳期限日：</strong>
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
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
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
                                                                            <asp:Literal ID="Ltl_PriorityNumber" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>优先权国：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_PriorityNationalityId" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>优先权申请日：</strong>
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
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
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
                                                                            <asp:Literal ID="Ltl_PtcNumber" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>PCT申请日：</strong>
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
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
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
                                                                            <asp:Literal ID="Ltl_AnnualFeeNextYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>距缴费期限所剩天数：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeRestDay" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            <strong>待缴年度：</strong>
                                                                        </td>
                                                                        <td width="429" align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeNotPaymentYear" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>官费：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AnnualFeeNextPaymentMoney" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>代理费：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_AgentServiceFee" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>汇款手续费：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_RemittanceFee" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_chaoxiangfee" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>超项费：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_chaoxiang" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_jianmianfee" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>减免：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_jianmian1" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_zhinajinfee" runat="server">
                                                                        <td height="32" align="right">
                                                                            <strong>滞纳金：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_zhinajin" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>费用小计：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_FeeSubtotal" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>货币种类：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_HuoBiType" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>备注：</strong>
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
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
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
                                                                            <asp:Literal ID="Ltl_anjuanhao" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>联系人：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_linkman" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>地址：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Literal ID="Ltl_address" runat="server"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>电话：</strong>
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
            <asp:BoundField DataField="i_OrderBy" HeaderText="系统序号" />
            <asp:BoundField DataField="nvc_Number" HeaderText="专利号" />
            <asp:BoundField DataField="nvc_Name" HeaderText="专利名称" />
            <asp:TemplateField HeaderText="专利授权国">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PatentTypeName" HeaderText="专利类型" />
            <asp:TemplateField HeaderText="专利申请日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="专利授权日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_YaoQiuXiang" HeaderText="权利要求项" />
            <asp:BoundField DataField="nvc_PatentHolder" HeaderText="专利权人" />
            <asp:TemplateField HeaderText="专利权人国籍">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PatentInventor" HeaderText="发明人" />
            <asp:TemplateField HeaderText="专利有效维持期限起始日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="专利有效维持期限终止日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_AnnualFeeYear" HeaderText="专利有效维持年限" />
            <asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="专利剩余有效维持年限" />
            <asp:TemplateField HeaderText="专利于该授权国的年费缴费状态">
                <ItemTemplate>
                    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="专利已缴纳年度" />
            <asp:TemplateField HeaderText="上一次年费缴纳期限日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PriorityNumber" HeaderText="优先权申请号" />
            <asp:TemplateField HeaderText="优先权国">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="优先权申请日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_PriorityDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT申请号" />
            <asp:TemplateField HeaderText="PCT申请日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_PtcDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="缴费期限日">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_AnnualFeeRestDay" HeaderText="距缴费期限所剩天数" />
            <asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="代缴年度" />
            <asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="官费" />
            <asp:BoundField DataField="dm_AgentServiceFee" HeaderText="代理费" />
            <asp:BoundField DataField="dm_RemittanceFee" HeaderText="汇款手续费" />
            <asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="超项费" />
            <asp:BoundField DataField="i_JianMian1" HeaderText="减免" />
            <asp:TemplateField HeaderText="滞纳金">
                <ItemTemplate>
                    <%#Ltl_zhinajin.Text%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_CurrencyType" HeaderText="货币种类" />
            <asp:BoundField DataField="dm_FeeSubtotal" HeaderText="费用小计" />
            <asp:BoundField DataField="nt_Remarks" HeaderText="备注" />
        </Columns>
    </asp:GridView>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
