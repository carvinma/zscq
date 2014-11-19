<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentOrderAdd1.aspx.cs"
    Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscqAddress.ascx" TagName="zscqAddress" TagPrefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirm order_My patent Order_Service Center_User Center__System of Patent Annuity Fee_Global Patent</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link href="thickbox/thickbox.css" rel="stylesheet" type="text/css" /> 
    <script src="thickbox/jquery-1.1.3.1.pack.js" type="text/javascript"></script>
    <script src="thickbox/thickbox-compressed.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 25px;
        }
    </style>
</head>
<body id="index">
    <form id="form1" runat="server">
    <input type="hidden" id="Hi_Total" runat="server" value="0" />
    <input type="hidden" id="Hi_Total2" runat="server" value="0" />
    <input type="hidden" id="Hi_youhui" runat="server" value="0" />
    <input type="hidden" id="Hi_HuiLv1" runat="server" value="1" />
    <input type="hidden" id="Hi_HuiLv2" runat="server" value="1" />
    <input type="hidden" runat="server" id="input_payway" value="支付宝支付" />
    <input type="hidden" runat="server" id="bank" value="" />
    <input type="hidden" runat="server" id="Hi_guoji" value="0" />
    <input type="hidden" runat="server" id="hi_piaoju" value="0" />
    <input type="hidden" runat="server" id="hi_bizhong" value="" />
    <input type="hidden" runat="server" id="hi_paybizhong" value="" />
     <input type="hidden" runat="server" id="hi_zengzhifee" value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
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
                                    <td width="38" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="701">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">&nbsp;
                                        
                                    </td>
                                    <td align="left">
                                        Front page >> System of Patent Annuity Fee >> User Center >> Service Center >> My patent Order >> Confirm order
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
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
                                                <td height="115" align="left" valign="top">
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="317" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="300" align="center" class="font12bt">
                                                                            Patent list of Annuity fee to be paid
                                                                        </td>
                                                                        <td width="7">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="115" align="left" valign="top">
                                                                <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0" >
                                                                    <tr>
                                                                        <td width="129" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Patent number
                                                                        </td>
                                                                        <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Granted Country
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Annuity year
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Deadline
                                                                        </td>
                                                                         <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Amount
                                                                        </td>
                                                                        <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Currency
                                                                        </td>
                                                                        <td width="90" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Patentee
                                                                        </td>
                                                                        <td width="70" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            Operation
                                                                        </td>
                                                                    </tr>
                                                                    <%=sb_patent%>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="24" align="left">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0" style="display:none;">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                            发票相关
                                                                        </td>
                                                                        <td width="7">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="display:none;">
                                                        <tr>
                                                            <td width="15%" height="30" align="right" valign="top" style="line-height: 21px;">
                                                                是否开票：
                                                            </td>
                                                            <td colspan="5" align="left" valign="top" style="line-height: 21px;">
                                                                <%--<asp:CheckBox ID="checkfp" runat="server" name="v" onclick="fpshow()" />--%>
                                                                <asp:RadioButton ID="rb_kp1" runat="server" GroupName="kp" Text="暂不需要发票" Checked="true"
                                                                    onclick="fpshow()" />
                                                                <asp:RadioButton ID="rb_kp2" runat="server" GroupName="kp" Text="需要发票" onclick="fpshow()" /><%=hi_zengzhifee.Value != "0" ? "(开票需要加3.3%税点)" : ""%>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr_fp  tr_fp1">
                                                            <td width="15%" height="58" align="right" valign="top" style="line-height: 21px;">
                                                                发票抬头：
                                                            </td>
                                                            <td width="85%" colspan="5" align="left" valign="top" style="line-height: 21px;">
                                                                <input type="text" name="s5" id="txt_fptt" runat="server" class="font12000t" maxlength="100" />
                                                                &nbsp;&nbsp;
                                                                <br />
                                                                您填写的Content将被系统自动打印到发票上，所以千万别填写和发票抬头无关的信息。
                                                            </td>
                                                        </tr>
                                                        <%--                            <tr class="tr_fp tr_fp2">
                              <td width="15%" height="24" align="right" valign="top" style="line-height: 21px;">是否需要邮寄：</td>
                              <td colspan="5" align="left" valign="top" style="line-height: 21px;">
                                <asp:CheckBox ID="checkyj" runat="server" name="v" onclick="yjshow()" />
                              </td>
                            </tr>--%>
                                                        <tr class="tr_fp tr_fp3">
                                                            <td width="15%" height="34" align="right" style="line-height: 21px;">
                                                                邮寄方式：
                                                            </td>
                                                            <td colspan="5" align="left" style="line-height: 21px;">
                                                                <input name="" type="radio" id="radio_guowaifs" value="" checked="checked" />快递&nbsp;(加收400元邮寄费)
                                                            </td>
                                                        </tr>
                                                        <tr class="tr_fp tr_fp4">
                                                            <td width="15%" height="34" align="right" style="line-height: 21px;">
                                                                邮寄方式：
                                                            </td>
                                                            <td colspan="5" align="left" style="line-height: 21px;">
                                                                <asp:RadioButton ID="radio_add0" runat="server" GroupName="radio" Checked="true"
                                                                    onclick="add25()" />
                                                                挂号信(免费)&nbsp;&nbsp;
                                                                <asp:RadioButton ID="radio_add25" runat="server" GroupName="radio" onclick="add25()" />
                                                                快递&nbsp;(加收<%=psfee.ToString("0.00")%>元快递费)&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr class="tr_fp tr_fp3 tr_fp4">
                                                            <td width="15%" height="34" align="right" valign="top" style="line-height: 47px;">
                                                                邮寄Address：
                                                            </td>
                                                            <td colspan="5" align="left" style="line-height: 21px;">
                                                                <uc5:zscqAddress ID="zscqAddress1" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="16" align="left">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0" id="table_yhq1" runat="server">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                           Coupon
                                                                        </td>
                                                                        <td width="7">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto"
                                                        id="table_yhq2" runat="server">
                                                        <tr class="orderxx">
                                                            <td height="30" align="left" valign="middle">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="16%" align="right" valign="top" style="line-height:18px;">Using coupons：</td>
                                    <td width="84%" align="left"><DIV id=relatedDiv style="OVERFLOW: hidden; WIDTH: 100%">
            <DIV style="WIDTH: 100%">
            <DIV id=related_page_0 style="FLOAT: left; WIDTH: 100%"><span class="font12b4e user_zlbottomline">
                                      <asp:Repeater ID="rp_youhui" runat="server">
                                        <ItemTemplate>
                                        
            <DIV style="FLOAT: left; WIDTH: 270px;height:25px;"><input type="checkbox" name="inputPageid" lang="<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")),"USD",hi_paybizhong.Value)%>" onclick="CheckYouhui('cb_youhui<%#Eval("i_Id") %>');"
                                                                                            id="cb_youhui<%#Eval("i_Id") %>" value='<%# Eval("i_Id")%>'>&nbsp;<%# Eval("nvc_ENName")%> (<%=hi_paybizhong.Value %>:<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")), "USD", hi_paybizhong.Value).ToString("0.00")%>)</DIV>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </span></DIV></DIV></DIV>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr class="orderxx">
                                                            <td height="15" align="left">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="212" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="195" align="center" class="font12bt">
                                                                            Correspondent to amount  
                                                                        </td>
                                                                        <td width="7">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top">
                                                    <tr>
                                                        <td valign="top" align="right">
                                                            <div id="FeeInfo">
                                                                <table width="415" cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td valign="top" height="59" align="right" style="line-height: 22px;">
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td height="59" align="right">
                                                                                                <table width="440" cellspacing="0" cellpadding="0" border="0">
                                                                                                    <tbody>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Official fee：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <%=dm_guanfee.ToString("0.00")%>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Surcharge：
                                                                                                            </td>
                                                                                                            <td width="110" >
                                                                                                                 <%=dm_zhinajin.ToString("0.00")%>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Service fee：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <%=dm_dailifee.ToString("0.00")%>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Excess fee of claims：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <%=dm_chaoxiangfee.ToString("0.00")%>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                            </td>
                                                                                                            <td width="110" align="right">
                                                                                                                Subtotal：
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                                <%=hi_paybizhong.Value %>
                                                                                                            </td>
                                                                                                            <td align="left" style="width: 100px;">
                                                                                                                 <%=(dm_guanfee + dm_dailifee + dm_chaoxiangfee + dm_zhinajin).ToString("0.00")%>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <table width="440" cellspacing="0" cellpadding="0" border="0">
                                                                                                    <tbody>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Using coupon：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                            <span id="new_mtype_sp">0</span>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Bank charges：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <%=dm_shouxufee.ToString("0.00")%>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <%--<tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                Postage fee：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <span id="s_peisongfee">0.00</span>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                VAT：
                                                                                                            </td>
                                                                                                            <td width="110" >
                                                                                                                <span id="s_piaoju">0.00</span>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>--%>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <table width="440" cellspacing="0" cellpadding="0" border="0">
                                                                                                    <tbody>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                            </td>
                                                                                                            <td width="110" align="right">
                                                                                                                Total fee：
                                                                                                            </td>
                                                                                                            <td width="30" style="color: red;">
                                                                                                                <%=hi_paybizhong.Value%>
                                                                                                            </td>
                                                                                                            <td width="100" align="left">
                                                                                                               <strong class="font14ac5" id="new_total"><span class="font14ac5" id="new_total_sp"><%=moneyTotal.ToString("0.00")%></span></strong>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="30">
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="272" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="255" align="center" class="font12bt">
                                                                            Select the method of payment
                                                                        </td>
                                                                        <td width="7">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                                                        <tr class="orderxx">
                                                            <td width="3%" height="67" align="left" valign="middle">
                                                                <input name="payway" id="xxpay" type="radio" value="线下汇款" checked="checked" />
                                                            </td>
                                                            <td colspan="4">
                                                                &nbsp;&nbsp;Offline remittance    
                                                            </td>
                                                            <td width="75%">
                                                                <table id="tpay1" width='100%' border='0' cellspacing='1' cellpadding='0' style="background-color: #CCC;">
                                                                    <tr>
                                                                        <td width='25%' height='28' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>Bank Details</strong>
                                                                        </td>
                                                                        <td width='25%' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>SWIFT CODE</strong>
                                                                        </td>
                                                                        <td width='25%' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>Account Name</strong>
                                                                        </td>
                                                                        <td width='25%' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>Account Number</strong>
                                                                        </td>
                                                                    </tr>
                                                                    <asp:Repeater ID="Rpt_BankList" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr class="<%#Convert.ToInt32(Eval("i_FaPiao"))==1?"fp_true":"fp_false"%>">
                                                                                <td height='28' align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_BankDetails")%>
                                                                                </td>
                                                                                <td align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_SwiftCode")%>
                                                                                </td>
                                                                                <td align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_AccountName")%>
                                                                                </td>
                                                                                <td align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_BankNumber")%>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                                                        <tr class="orderxx">
                                                            <td height="30" align="left" valign="middle">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="41" align="right">
                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/user_zl_b5_1.jpg"
                                                        OnClientClick="return confirm('Are you sure to abandon the order?')" OnClick="ImageButton2_Click" />
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/user_zl_b5.gif"
                                                        OnClientClick="return AddValidate()" OnClick="ImageButton1_Click" />
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <textarea id="InfoContent" name="InfoContent" class="textstyle" runat="server" visible="false">
Order number:$order_num<br/>
Submitted Time::$order_date<br/>
Order Type:$order_type<br/>
Order status:$order_stat<br/>
<br/>
=============================================================================<br/>
<br/>
＜User Information＞<br/><br/>
User ID:$user_num<br/>
User Name:$true_name<br/>
Country:$user_counrtyInfo<br/>
<br/>
=============================================================================<br/><br/>
＜Patent Renewal Fee instruction Information＞<br/><br/>
$TplPatentData<br/><br/>
===============================================================================<br/><br/>
＜Total＞
<br/><br/>
$tplSumData
<br/><br/>
===============================================================================<br/><br/>
＜Remittance attention＞
<br/><br/>
Dearest customer:
<br/><br/>
Thank you for using our online service system for the payment of patent annuity fee!
<br/><br/>
Your instruction order of the patent annuity fee has been sent to our email address by the online service system at $orderDate,
we have received your instruction, and will proceed the order soon.
<br/><br/>
Please save your order number for further search and check: Your order number is $order_num
<br/><br/>
Please transfer the following amount (shown in the instruction order) to our account within 24 hours once you have submitted the instruction order (time starts as soon as the instruction order is submitted successfully).<br/><br/>
Remittance  $limitDate <br/><br/>
$bankInfo<br/>
<br/>
※Payment note
<br/><br/>
1）Considering the fluctuation of exchange rate, please transfer the following amount (shown in the instruction order) to our account within 24 hours once you have submitted the instruction order(time starts as soon as instruction order submitted successfully), so that we will attend to the payment timely.
<br/><br/>
The time when our bank account actually receives your remittance will be deemed to be the actual time of your remittance.
<br/><br/>
If you fail to transfer the remittance to our Bank Account within 24 hours of submission of the instruction order (time starts as soon as the instruction order is submitted sucessfully), the new annuity fee calculated under the current exchange rate should be transferred after 24 hours since the time when you submitted the instruction order.<br/> 
We will start to proceed your order only by receiving the full, cover-all-item remittance correspondent to that shown in the instruction order. <br/>
We reserve the right to abandon your instruction order, or reject the existence of the entrusting relationship between you and our company, if one of the following occurances happens: remittance fails to be received before the deadline, or remittance is insufficient to that shown in the instruction order, or remittance is received after the deadline, or remittance is operated in improper method that our company or other designated payees fail to receive it in full amount within the limited time. <br/><br/>

Please pay attention that we will not take any responsibility on one of the follwing occurances: renewal fee overdue, loss of patent right, fine overdue, which is caused by the above mentined occurances.
<br/><br/>
2) If you submit the instruction order during the holiday time(based on Chinese law), the order will be extended to the first working day after the holiday for further proceeding.
<br/><br/>
The amount shown in the instruction order is calculated based on the latest exchange rate on the day when you submit the instruction order, so if you submit during the holiday time, the fluctuation of exchange rate happening between the time gap (the time of your remittance and time we proceed your order) will be omitted.
<br/><br/>
3）When you transfer the remittance successfully to our company or other designated payees, please send your payment information, including the name of the remitter, order number, payment amount, paid date, the name of your bank, or your account number transferred by ATM, to us or other designated payees by E-mail, within 24 hours since the time of your successful remittance (time starts as soon as the remittance is transferred successfully at your local bank).
<br/><br/>
We will acknowledge the receipt of your E-mail notice of remittance and proceed yourinstruction order accordingly.
<br/><br/>
If you do not send the E-mail notice of remittance, or send it overdue, or send it in improper method that our company or other designated payees fail to receive it in full amount, or send the incorrect payment information to us, we reserve the right to abandon your instruction order, or reject the existence of the entrusting relationship between you and our company. Please pay attention that we will not take any responsibility on one of the following occurances: renewal fee overdue, loss of patent right, fine overdue, surcharge incurred, or any other loss.
<br/><br/>
4）When you have already submitted the order while we have not received your remittance successfully, during which our company, our website or the service provided by our company is working in good situation, you will take the responsibility on the possible increased amount caused by the sudden increase of the official fee or sudden increase of the currency exchange.<br/><br/>
Please be informed that we will attend to the payment of your patent annuity fee upon the receipt of your remittance.<br/>
And we will send annuity fee report to you by E-mail after the payment is done. If there is any problem in remittance or other occurances, please feel free to contact us by sending E-mail to: pat-annuity@hqht-online.com<br/><br/>
Thank you for your cooperation!<br/>
Global Patent Annuity Fees Payment Agency Cooperation.</textarea>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div runat="server" id="div_a">
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    var biaozhi=0;
    var abc=0;
    var zz = $("#hi_zengzhifee").val();
    $(document).ready(function () {
        //$("#checkfp").attr("checked", "");
        $(".fp_true").hide();
        $(".fp_false").show();
        //=======
        $("#rb_kp1").attr("checked", "true");
        $(".tr_fp").hide();
        $("#radio_add0").attr("checked", "checked")
        //====
        $("#Hi_Total").val(<%=moneyTotal%>);
        $("#Hi_Total2").val(<%=moneyTotal%>);
        $("#Hi_youhui").val(0);
        $("#Drp_YouHuiQuan").val(0);
        //====
    });
    function fpshow() {
        if ($("#rb_kp2").attr("checked") == true) {
            if(biaozhi==0)
            {
                //===========
                $(".fp_true").show();
                $(".fp_false").hide();
                //=============
                $(".tr_fp1").show();
                $(".tr_fp2").show();
                $(".tr_fp4").show();
                //======
                var totalmoey = $("#Hi_Total").val();
                var totalmoeys = $("#new_total_sp").html();
                var total = parseFloat(zz)+parseFloat(totalmoeys);
                $("#s_piaoju").html(parseFloat(zz).toFixed(2)); 
                $("#hi_piaoju").val(parseFloat(zz).toFixed(2));
                $("#new_total_sp").html(parseFloat(total).toFixed(2));
                //======
                $("#Hi_Total2").val(parseFloat(total).toFixed(2));//total
                biaozhi=1;
             }
        }
        else {
            abc=0;
            if(biaozhi==1)
            {   
                //===========
                $(".fp_true").hide();
                $(".fp_false").show();
                //==============
                $(".tr_fp").hide();
                $("#radio_add0").attr("checked", "checked")
                var total2 = $("#Hi_Total").val();
                var youhui = $("#Hi_youhui").val();
                  $("#s_piaoju").html("0.00"); 
                  $("#hi_piaoju").val("0.00");
                $("#new_total_sp").html((parseFloat(total2)-parseFloat(youhui)).toFixed(2));
                //======
                $("#Hi_Total2").val(parseFloat(total2).toFixed(2));//total
                biaozhi=0;
            }
        }
    }
    function add25()
    {
        var total5 = $("#new_total_sp").html();
        if($("#radio_add25").attr("checked") == true)
        {
            if(abc==0)
            {
                //======
                total5 = parseFloat(total5)+parseFloat(<%=psfee%>);
                $("#new_total_sp").html(parseFloat(total5).toFixed(2));
                $("#s_peisongfee").html(parseFloat(<%=psfee%>).toFixed(2));
                //========
                $("#Hi_Total2").val(parseFloat(total5).toFixed(2));//total
                abc=1;
            }
        }
        else
        {   
            if(abc==1)
            {
                //======
                total5 = $("#new_total_sp").html();
                total5 = parseFloat(total5)-parseFloat(<%=psfee%>);
                $("#new_total_sp").html(parseFloat(total5).toFixed(2));
                 $("#s_peisongfee").html("0.00");
                //========
                $("#Hi_Total2").val(parseFloat(total5).toFixed(2));//total
                abc=0;
            }
        }
    }
</script>
<script type="text/javascript">
    function obj(id) {
        return document.getElementById(id);
    }
    function objs(name) {
        return document.getElementsByName(name);
    }
    /*function AddValidate() {
        if ($("#rb_kp2").attr("checked") == true) {
            if ($("#txt_fptt").val() == "") {
                alert("请填写发票抬头");
                $("#txt_fptt").focus();
                return false;
            }
        }
    }*/
</script>
<script type="text/javascript">
    function CheckYouhui(obj) {
        var i = 0;
        var dmyouhui = 0;
        $("input[name='inputPageid']").each(function () {
            if ($(this).attr("checked") == true) {
                i++;
            }
        });
        if (i <= parseInt('<%=zlnum%>')) {
            if (i != 0) {
                jiayouhui(obj);
            }
            else {
                jiayouhui(obj);
            }
        }
        else {
            alert("Only <%=zlnum%> coupon can be used at one time.");
            $("#" + obj).attr("checked", false);
        }
    }
    function jiayouhui(obj) {
        var total_addyouhui = $("#new_total_sp").html();
        if ($("#" + obj).attr("checked") == true) {
            dmyouhui = parseFloat($("#" + obj).attr("lang"));
            total_addyouhui = parseFloat(total_addyouhui) - parseFloat(dmyouhui);
            if (parseFloat(total_addyouhui) < 0) {
                total_addyouhui = 0;
            }
            $("#new_total_sp").html(parseFloat(total_addyouhui).toFixed(2));
            //===========优惠
            var yhq = $("#new_mtype_sp").html();
            $("#new_mtype_sp").html((parseFloat(dmyouhui) + parseFloat(yhq)).toFixed(2));
            $("#Hi_youhui").val((parseFloat(dmyouhui) + parseFloat(yhq)).toFixed(2));
            //===================================
            $("#Hi_Total2").val(parseFloat(total_addyouhui).toFixed(2)); //total
        }
        else {
            dmyouhui = parseFloat($("#" + obj).attr("lang"));
            total_addyouhui = parseFloat(total_addyouhui) + parseFloat(dmyouhui);
            $("#new_total_sp").html(parseFloat(total_addyouhui).toFixed(2));

            //===========优惠
            var yhq = $("#new_mtype_sp").html();
            $("#new_mtype_sp").html((parseFloat(yhq) - parseFloat(dmyouhui)).toFixed(2));
            $("#Hi_youhui").val((parseFloat(dmyouhui) - parseFloat(yhq)).toFixed(2));
            //===================================
            $("#Hi_Total2").val(parseFloat(total_addyouhui).toFixed(2)); //total
        }
    }
</script>
