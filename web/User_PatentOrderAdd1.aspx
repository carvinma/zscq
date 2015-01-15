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
    <title>确认订单_我的专利订单_服务中心_会员中心__专利系统_环球汇通</title>
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
                                    <td width="38" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="701">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">&nbsp;
                                        
                                    </td>
                                    <td align="left">
                                        首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的专利订单 >> 确认订单
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
                                                                <table width="147" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="130" align="center" class="font12bt">
                                                                            缴费专利清单
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
                                                                            专利号
                                                                        </td>
                                                                        <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            授权国
                                                                        </td>
                                                                        <td width="70" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            缴费年度
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            缴费期限
                                                                        </td>
                                                                         <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            缴费金额
                                                                        </td>
                                                                        <td width="50" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            币种
                                                                        </td>
                                                                        <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            案卷号
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            操作
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
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
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
                                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
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
                                                                您填写的内容将被系统自动打印到发票上，所以千万别填写和发票抬头无关的信息。
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
                                                                邮寄地址：
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
                                                                            优惠券
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
                                    <td width="14%" align="right" valign="top" style="line-height:18px;">使用优惠券：</td>
                                    <td width="86%" align="left"><DIV id=relatedDiv style="OVERFLOW: hidden; WIDTH: 100%">
            <DIV style="WIDTH: 100%">
            <DIV id=related_page_0 style="FLOAT: left; WIDTH: 100%"><span class="font12b4e user_zlbottomline">
                                      <asp:Repeater ID="rp_youhui" runat="server">
                                        <ItemTemplate>
                                        
            <DIV style="FLOAT: left; WIDTH: 270px;height:25px;"><input type="checkbox" name="inputPageid" lang="<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")),"USD",hi_paybizhong.Value)%>" onclick="CheckYouhui('cb_youhui<%#Eval("i_Id") %>');"
                                                                                            id="cb_youhui<%#Eval("i_Id") %>" value='<%# Eval("i_Id")%>'>&nbsp;<%# Eval("nvc_Name")%> (<%=hi_paybizhong.Value %>:<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")), "USD", hi_paybizhong.Value).ToString("0.00")%>)</DIV>
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
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                            金额相关
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
                                                                                                                官费：
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
                                                                                                                滞纳金：
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
                                                                                                                代理费：
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
                                                                                                                超项费：
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
                                                                                                                小计：
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
                                                                                                                使用优惠劵：
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
                                                                                                                汇款手续费：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <%=dm_shouxufee.ToString("0.00")%>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                                邮寄费：
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
                                                                                                                增值税：
                                                                                                            </td>
                                                                                                            <td width="110" >
                                                                                                                <span id="s_piaoju">0.00</span>
                                                                                                            </td>
                                                                                                            <td width="30">
                                                                                                            </td>
                                                                                                            <td width="100">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <table width="440" cellspacing="0" cellpadding="0" border="0">
                                                                                                    <tbody>
                                                                                                        <tr align="left">
                                                                                                            <td width="200" align="right">
                                                                                                            </td>
                                                                                                            <td width="110" align="right">
                                                                                                                总计：
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
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                            选择支付方式
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
                                                        <%=tr_PayWay %>
                                                        <tr class="orderxx">
                                                            <td width="3%" height="67" align="left" valign="middle">
                                                                <input name="payway" type="radio" value="网银支付" id="showzhifu" onclick="zhifushow();" />
                                                            </td>
                                                            <td colspan="4">
                                                                &nbsp;&nbsp;网银支付
                                                            </td>
                                                            <td width="75%">
                                                                由支付提供接口，确保您的资金安全。
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="95%" id="zhifu" style="display: none; margin: 0 auto;" border="0" cellspacing="0"
                                                        cellpadding="0">
                                                        <tr>
                                                            <td height="36">
                                                                <table width="644" height="234">
                                                                    <tr style="height: 10px;">
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="2" onclick="changeimg('ICBC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/ICBC_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="3" onclick="changeimg('CMB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/CMB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="4" onclick="changeimg('CCB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/CCB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="5" onclick="changeimg('BOC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/BOC_OUT.gif" border="0" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 10px;">
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="6" onclick="changeimg('ABC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/ABC_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="7" onclick="changeimg('COMM_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/COMM_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="8" onclick="changeimg('SPDB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/SPDB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="9" onclick="changeimg('GDB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/GDB_OUT.gif" border="0" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 10px;">
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="10" onclick="changeimg('CITIC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/CITIC_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="11" onclick="changeimg('CEB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/CEB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="12" onclick="changeimg('CIB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/CIB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="24" onclick="changeimg('FDB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/FDB_OUT.gif" border="0" />
                                                                            <%--<input type="radio" name="pay_bank" value="13" onclick="changeimg('SDB_OUT')" />&nbsp;<img
                                                                src="alipay/images/SDB_OUT.gif" border="0" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 10px;">
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="14" onclick="changeimg('CMBC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/CMBC_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="15" onclick="changeimg('HZCB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/HZCB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="16" onclick="changeimg('SHBANK_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/SHBANK_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="17" onclick="changeimg('NBBANK_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/NBBANK_OUT.gif" border="0" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 10px;">
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="18" onclick="changeimg('SPABANK_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/SPABANK_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="19" onclick="changeimg('BJRCB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/BJRCB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="20" onclick="changeimg('ENV_ICBC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/ENV_ICBC_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="21" onclick="changeimg('ENV_CCB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/ENV_CCB_OUT.gif" border="0" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="height: 10px;">
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="22" onclick="changeimg('ENV_SPDB_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/ENV_SPDB_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <input type="radio" name="pay_bank" value="23" onclick="changeimg('ENV_ABC_OUT');checkpay(0);" />&nbsp;<img
                                                                                src="alipay/images/ENV_ABC_OUT.gif" border="0" />
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr align="center">
                                                                        <td height="18" colspan="4">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                                                        <tr class="orderxx">
                                                            <td width="3%" height="67" align="left" valign="middle">
                                                                <input name="payway" id="xxpay" type="radio" value="线下汇款" onclick="change();checkpay(0);" />
                                                            </td>
                                                            <td colspan="4">
                                                                &nbsp;&nbsp;线下汇款
                                                            </td>
                                                            <td width="75%">
                                                                <table id="tpay1" width='100%' border='0' cellspacing='1' cellpadding='0' style="background-color: #CCC;">
                                                                    <tr>
                                                                        <td width='25%' height='28' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>开户银行</strong>
                                                                        </td>
                                                                        <td width='25%' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>户名</strong>
                                                                        </td>
                                                                        <td width='25%' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>卡号</strong>
                                                                        </td>
                                                                        <td width='25%' align='center' bgcolor='#FFFFFF'>
                                                                            <strong>开户行</strong>
                                                                        </td>
                                                                    </tr>
                                                                    <asp:Repeater ID="Rpt_BankList" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr class="<%#Convert.ToInt32(Eval("i_FaPiao"))==1?"fp_true":"fp_false"%>">
                                                                                <td height='28' align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_BankName")%>
                                                                                </td>
                                                                                <td align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_AccountName")%>
                                                                                </td>
                                                                                <td align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_BankNumber")%>
                                                                                </td>
                                                                                <td align='center' bgcolor='#FFFFFF'>
                                                                                    <%#Eval("nvc_BankDetails")%>
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
                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/user_zl_b5_1.jpg"
                                                        OnClientClick="return confirm('真的放弃提交吗')" OnClick="ImageButton2_Click" />
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/user_zl_b5.gif"
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
订单号:$order_num<br/>
订单成功提交时间:$order_date<br/>
订单类型:$order_type<br/>
订单状态:$order_stat<br/>
<br/>
=============================================================================<br/>
<br/>
＜客户基本信息＞<br/><br/>
会员编号:$user_num<br/>
客户名称:$true_name<br/>
国籍:$user_counrtyInfo<br/>
<br/>
=============================================================================<br/><br/>
＜委托缴费专利信息＞<br/><br/>
$TplPatentData<br/><br/>
===============================================================================<br/><br/>
＜本次缴费总计＞
<br/><br/>
$tplSumData
<br/><br/>
===============================================================================
<br/><br/>
＜专利年费代缴委托的客户支付信息＞
<br/><br/>			
是否需要发票:$fp<br/>
收取发票方式:$fMode<br/>
开据发票名称:$fName<br/>
<br/>
===============================================================================<br/><br/>
＜专利年费的汇款提示信息＞
<br/><br/>
尊敬的客户：
<br/><br/>
非常感谢您对本公司及本公司网站所提供的专利年费相关服务的利用!
<br/><br/>
您于$orderDate向本公司提交的专利年费的代缴委托订单已通过系统自动发送到了本公司邮箱,
我们已经收到了您的订单,请您放心.
<br/><br/>
为了方便日后查询,核对,请您记住您的订单号,您的订单号为 $order_num
<br/><br/>
请您将订单中标明的下列费用,于您提交订单时间点起算的24小时之内（以系统显示的订单成功提交时间为准）,汇入本公司的银行帐户.
<br/><br/>
汇款期限  $limitDate <br/><br/>
$bankInfo<br/>
<br/>
※付款注意事项
<br/><br/>
1）考虑到国际汇率随时变动的因素,为了尽快代您缴纳专利年费,请您务必于提交了专利年费的代缴委托订单的时间点起算的24小时之内（以系统显示的订单成功提交时间为准）,将上述款项汇入本公司帐户.
<br/><br/>
本公司银行帐户实际接收到您所汇款项的时间将被视为到帐时间.
<br/><br/>
如您无法在您提交专利年费的代缴委托订单的时间点起算的24小时之内（以系统显示的订单成功提交时间为准）将上述款项汇入本公司银行帐户,请在您提交专利年费的代缴委托订单的时间点起算的超过24小时之后（以系统显示的订单成功提交时间为准）,按照依最新汇率变动后的新的费用金额重新进行汇款.
<br/><br/>
本公司只有在确认收到与您所提交的专利年费的代缴委托订单相对应的款项为全额,无金额错误时,才会开始为处理您的订单.
<br/><br/>
如果您逾期未付款,或付款金额不足,或逾期后才付款,或未在指定付款期限内使本公司或本公司指定的其他收款人以全额收到付款无误时, 本公司及本公司网站有权不受理承办您的专利年费代缴委托及订单,并视您与本公司及本公司网站之间的委托关系为不存在.
<br/><br/>
若因此而造成您的缴费专利年费逾期,专利权丧失,逾期罚款,补缴滞纳金或其他一切损失时,本公司及本公司网站均不承担任何责任.请您务必予以注意.
<br/><br/>
2）您在法定休息日及节假日（以中国当地的法定休息日及节假日为准）向本公司提交的专利年费的代缴委托订单将被顺延至该法定休息日或节假日结束后的第一个工作日处理.
<br/><br/>
您在法定休息日及节假日（以中国当地的法定休息日及节假日为准）所提交的专利年费的代缴委托订单的费用金额以提交当天的最新汇率为准,自您的订单提交日至订单处理日期间,因发生的汇率变动而产生的差额忽略不计.
<br/><br/>
3）当您在指定期限内成功付款给本公司或其他指定收款人时,请您务必在以成功付款时间点起算的24小时之内（以您所使用的银行汇出的当地时间为准起算）通过电子邮件的方式,将您的付款信息（包括付款人名称,订单编号,付款金额,付款日期,付款银行名称或ATM转帐帐号）通知本公司或本公司指定的其他收款人知晓.
<br/><br/>
对于您是否明确通知本公司知晓您的上述信息,将以本公司对您的相关通知的电子邮件形式的回函作为判断标准.
<br/><br/>
如果您未通知,或逾期通知,或通知方式未能让本公司或本公司指定的其他收款人成功知晓,或您所通知的付款信息不正确时,本公司及本公司网站有权不受理承办您的专利年费代缴委托及订单,并视您与本公司及本公司网站之间的委托关系为不存在,停止对您的委托进行处理.
<br/><br/>
若因此而造成您的缴费专利年费逾期,专利权丧失,逾期罚款,补缴滞纳金或其他一切损失时,本公司及本公司网站均不承担任何责任.
<br/><br/>
4）当您已经委托本公司及本公司网站为您代缴专利年费但本公司未收到您的付款时,在本公司,本公司网站,或本公司及本公司网站所提供的服务尚处于作业期间,尚未将您的专利年费缴纳至指定国家的专利机关前,若发生该专利授权国的国家政府突然调涨专利年费或国际汇率大幅升值时,您同意无条件地在本公司指定的期限内补缴差额费用予本公司.<br/><br/>
我们在接收到您的汇款后,会即时地向相关国家的专利局进行您的专利年费代缴.<br/>
费用缴纳成功后,我们将会再通过邮件与您联系.请您放心.<br/><br/>
如在汇款中发生困难或有其他问题,请您发送邮件至以下的邮箱,我们会及时给您回信.<br/>
我们的邮箱地址 pat-annuity@hqht-online.com <br/><br/>
谢谢您的合作!<br/>
环球汇通专利年费代理有限公司</textarea>
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
    //选择线下汇款
    function change() {
        //        if ($("#xxpay").attr("checked") ==false) {{
        //            $("#tpay2").hide();
        //            $("#tpay1").hide();
        //        }
        var pays = objs('payway');
        for (var i = 0; i < pays.length; i++) {
            if (pays[i].checked) {
                obj('input_payway').value = pays[i].value.split(',')[0];
            }
        }
        //    var pays2 = objs('pay_bank');
        //    for (var i = 0; i < pays2.length; i++) {
        //      pays2[i].checked = false;
        //    }
        //    zhifushow();
    }
    function checkpay(ytype) {
        document.getElementById('pay1').style.display = "";
        document.getElementById('pay0').style.display = "";
        document.getElementById('pay' + ytype).style.display = "none";
    }
    function changeimg(img) {
        var pays = objs('pay_bank');
        for (var i = 0; i < pays.length; i++) {
            if (pays[i].checked) {
                obj('bank').value = pays[i].value;
            }
        }
        var pays2 = objs('payway');
        for (var i = 0; i < pays2.length; i++) {
            pays2[i].checked = false;
        }
    }
    function AddValidate() {
        if ($("#rb_kp2").attr("checked") == true) {
            if ($("#txt_fptt").val() == "") {
                alert("请填写发票抬头");
                $("#txt_fptt").focus();
                return false;
            }
        }
    }
    function zhifushow() {
        if ($("#showzhifu").attr("checked") == true) {
            $("#input_payway").val("网银支付");
            $("#zhifu").show();
        }
        else {
            $("#input_payway").val("");
            $("#zhifu").hide();
        }
    }
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
            alert("最多可以使用<%=zlnum%>张优惠券");
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
