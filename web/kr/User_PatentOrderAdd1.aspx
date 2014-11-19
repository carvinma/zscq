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
    <title>주문 확인_나의특허 발주서_서비스 센터_회원센터__특허시스템_Global Patent</title>
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
    <input type="hidden" runat="server" id="input_payway" value="线下汇款" />
    <input type="hidden" runat="server" id="bank" value="" />
    <input type="hidden" runat="server" id="Hi_guoji" value="0" />
    <input type="hidden" runat="server" id="hi_piaoju" value="0" />
    <input type="hidden" runat="server" id="hi_bizhong" value="" />
    <input type="hidden" runat="server" id="hi_paybizhong" value="" />
     <input type="hidden" runat="server" id="hi_zengzhifee" value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="97" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;background-color: #fff;">
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
                                        홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의특허 발주서 >> 주문 확인
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
                                                                            특허납부 리스트
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
                                                                            특허번호
                                                                        </td>
                                                                        <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            특허등록 나라
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            납부년도
                                                                        </td>
                                                                        <td width="70" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            납부기한
                                                                        </td>
                                                                         <td width="70" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            납부금액
                                                                        </td>
                                                                        <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            외화종류
                                                                        </td>
                                                                        <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            안건번호
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            작업
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
                                                                您填写的内容将被系统自动打印到发票上，所以千万别填写和发票抬头无关的信息。
                                                            </td>
                                                        </tr>
                                                        <%--                            <tr class="tr_fp tr_fp2">
                              <td width="15%" height="24" align="right" valign="top" style="line-height: 21px;">청구서 보낸주소：</td>
                              <td colspan="5" align="left" valign="top" style="line-height: 21px;">
                                <asp:CheckBox ID="checkyj" runat="server" name="v" onclick="yjshow()" />
                              </td>
                            </tr>--%>
                                                        <tr class="tr_fp tr_fp3">
                                                            <td width="15%" height="34" align="right" style="line-height: 21px;">
                                                                우편방식：
                                                            </td>
                                                            <td colspan="5" align="left" style="line-height: 21px;">
                                                                <input name="" type="radio" id="radio_guowaifs" value="" checked="checked" />快递&nbsp;(加收400元邮寄费)
                                                            </td>
                                                        </tr>
                                                        <tr class="tr_fp tr_fp4">
                                                            <td width="15%" height="34" align="right" style="line-height: 21px;">
                                                                우편방식：
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
                                                                우편주소：
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
                                                                            할인권
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
                                    <td width="16%" align="right" valign="top" style="line-height:18px;">사용한 할인권：</td>
                                    <td width="84%" align="left"><DIV id=relatedDiv style="OVERFLOW: hidden; WIDTH: 100%">
            <DIV style="WIDTH: 100%">
            <DIV id=related_page_0 style="FLOAT: left; WIDTH: 100%"><span class="font12b4e user_zlbottomline">
                                      <asp:Repeater ID="rp_youhui" runat="server">
                                        <ItemTemplate>
                                        
            <DIV style="FLOAT: left; WIDTH: 270px;height:25px;"><input type="checkbox" name="inputPageid" lang="<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")),"USD",hi_paybizhong.Value)%>" onclick="CheckYouhui('cb_youhui<%#Eval("i_Id") %>');" id="cb_youhui<%#Eval("i_Id") %>" value='<%# Eval("i_Id")%>'>&nbsp;<%# Eval("nvc_KRName")%>(<%=hi_paybizhong.Value %>:<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")), "USD", hi_paybizhong.Value).ToString("0.00")%>)</DIV>
                                                                                       
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
                                                                            금액연관
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
                                                                                                                관비：
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
                                                                                                                추가 지체료：
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
                                                                                                                대리비용：
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
                                                                                                                가산료：
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
                                                                                                                합계：
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
                                                                                                                할인권 사용：
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
                                                                                                                송금수수료：
                                                                                                            </td>
                                                                                                            <td width="110">
                                                                                                                <%=dm_shouxufee.ToString("0.00")%>
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
                                                                                                                합계：
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
                                                                            지불 방식
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
                                                                <input name="payway" id="xxpay" type="radio" value="线下汇款" onclick="change();checkpay(0);" checked="checked" />
                                                            </td>
                                                            <td colspan="4">
                                                                &nbsp;&nbsp;송금
                                                            </td>
                                                            <td width="75%">
                                                                <table id="tpay1" width='100%' border='0' cellspacing='1' cellpadding='0' style="background-color: #CCC;">
                                                                    <tr>
                                    <td width='24%' height='28' align='center' bgcolor='#FFFFFF'><strong>은행 세부 사항</strong></td>
                                    <td width='20%' align='center' bgcolor='#FFFFFF'><strong>SWIFT CODE</strong></td> 
                                    <td width='28%' align='center' bgcolor='#FFFFFF'><strong>계정 이름</strong></td>
                                    <td width='28%' align='center' bgcolor='#FFFFFF'><strong>계좌 번호</strong></td>
                                    </tr>
                                                                    <asp:Repeater ID="Rpt_BankList" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr>
                                    <td height='28' align='center' bgcolor='#FFFFFF'><%#Eval("nvc_BankDetails")%></td>
                                    <td align='center' bgcolor='#FFFFFF'><%#Eval("nvc_SwiftCode")%></td>
                                    <td align='center' bgcolor='#FFFFFF'><%#Eval("nvc_AccountName")%></td>
                                    <td align='center' bgcolor='#FFFFFF'><%#Eval("nvc_BankNumber")%></td>
                                    
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
                                                        OnClientClick="return confirm('정말 포기 제출?')" OnClick="ImageButton2_Click" />
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
주문번호:$order_num<br/>
주문완료시간:$order_date<br/>
오더 분류:$order_type<br/>
Order status:$order_stat<br/>
<br/>
=============================================================================<br/>
<br/>
＜회원 고객 기본사항＞<br/><br/>
회원 번호:$user_num<br/>
이름:$true_name<br/>
국적:$user_counrtyInfo<br/>
<br/>
=============================================================================<br/><br/>
＜의뢰＞<br/><br/>
$TplPatentData<br/><br/>
===============================================================================<br/><br/>
＜납부 비용 내역＞
<br/><br/>
$tplSumData
<br/><br/>
===============================================================================<br/><br/>
＜Remittance attention＞
<br/><br/>
우선 당소의 연차료납부대행서비스를 이용하여 주셔서 감사합니다.
<br/><br/>
고객님이$orderDate에 본회사에 제출한 특허연차료납부대행의뢰오더는 이미 시스템을 통하여 본회사 이메일에 발송되였습니다. 주문이 완성되였으므로 주문게시판의 하기 내용을 우선 확인하시기 바랍니다.
<br/><br/>
금후 수시로 오더상태를 조회할수 있도록 상기 주문번호를 메모하시기 바랍니다.
고객님의 주문번호: $order_num
<br/><br/>
하기의 주문게시판에 표시한 비용을 오더제출시부터 24시간이내에 (시스템에 나타난 주문완료시간을 기준으로 함) 당사 은행계좌에 입금하여 주시기 바랍니다.
<br/><br/>
송금기한  $limitDate <br/><br/>
$bankInfo<br/>
<br/>
※Payment note
<br/><br/>
1）국제환률이 변동되는 경우를 고려해서 특허연차료 납부절차를 가능한 신속히  진행하기 위하여 오더제출하신 시일로 부터 24시간이내 (시스템에 나타난 오더제출시간을 기준으로 함)  상기 금액을 당사의 계좌로 입금 부탁드립니다.
<br/><br/>
수취은행의 입금확인시간을 결제하신 시간으로 간주합니다.
<br/><br/>
오더를 제출하신 시간부터 24시간이내 (시스템에 나타난 주문완료시간을 기준으로 함)  상기 금액이 당사 은행계좌로 입금하지 않으신 경우, 오더를 제출하신 시간부터 24시간이후 (시스템에 나타난 주문완료시간을 기준으로 함)의 당일의 새로운 환률로 계산된 금액으로 지불하셔야 합니다.
<br/><br/>
제출하신 오더에 해당하는 금액에 따라 확인 결과, 오류가 없을 경우, 즉시 해당 오더를 처리하게 됩니다.
<br/><br/>
기한일까지 결제가 안되거나 또는 입금된 금액이 적거나, 기한일이 지난후 입금되였을 경우, 또는 규정된 기한일까지 당사 또는 당사의 위임한 해당 수취인이 확실히 해당 오더 전액의 입금을 확인할 수 없을 경우, 당사에서는 고객님의 오더를 수리하지 않는 권한이 있으며,당사는 고객님과의 오더를 수리하지 않은것으로 간주됩니다.이로인하여 고객님의 연차료가 납부되지 않아 특허권을 상실하는 경우,추가비용이 발생하는 경우,혹은 기타 모든 손실에 대해서 당소에서 보상하지 아니합니다.<br />
그러므로 반드시 유의해 주십시오.
<br/><br/>
2）공휴일 및 축제일(중국의 공휴일 및 축제일을 기준으로 함)에 당사에 오더를 제출하였을 경우,공휴일이 지난 다음 일자에 진행하게 됩니다.
<br/><br/>
공휴일(중국의 공휴일을 기준으로 함)에 특허연차료납부에 관한 오더를 제출하였을 경우,납부금액은 오더를 제출하는 당일의 환률을 기준으로 환산됩니다.오더제출일부터 납부일자까지는 환률의 변동으로 인해 발생하는 금액차는 계산되지 않습니다.
<br/><br/>
3）규정된 기한일까지 본회사 혹은 다른 수취인에게 지불하였을 경우, 반드시 지불하신시간부터 24시간내에(고객님이 사용하신 은행이 지출하신 시간을 기준으로 함)이메일로 고객님의 지불정보(지불인명함 ,주문번호,지불금액,지불시간,지불하실적 사용하신 은행명칭 및 ATM전사계좌번호)를 본회사 혹은 본회사가 지정한 기타 수취인에게 통지해 주십시오.
<br/><br/>
본회사가 상기 정보에 대해서 확인하였는가는 본회사가 이메일로 발송한 답신에 의해 판단됩니다.
<br/><br/>
송금시 입력하신 은행계좌 및 수취인 수취은행명칭이 당소에서 제공한 정보와 불일치하여 송금이 아니된 경우 이를 당소에 통지하지 않거나, 기한을 경과한 후에 통지하거나 당소 또는 당소에서 위임한 수취인이 이를 알수 없는 경우, 또는 통지하신 송금정보가 정확하지 않아 당소에서 확인을 할수 없는 경우 당사에서는 고객님께 그 요지를 통보하여 고객님의 오더를 수리하지 않을수 있습니다.
<br/><br/>
이로인하여 고객님의 연차료가 납부되지 않아 특허권을 상실하는 경우,추가비용이 발생하는 경우,혹은 가타 모든 손실에 대해서 당소는 그 책임을 지지 않습니다.
<br/><br/>
4）당소에서 오더를 의뢰하시고 송금하기전에 해당 등록국의 연차료가 인상이 되거나 국제 환률이 급격히 인상이 되는 경우 당소에서는 해당 차액을 청구할 수있습니다.<br/><br/>
송금 확인이 되면 바로 해당국 특허청으로 납부절차 진행합니다.<br />
납부완료 되면 메일로 연락드리 도록 하겠습니다.<br/><br/>
송금중에 문제 있으시면 하기 메일로 연락주시기 바랍니다.<br />
pat-annuity@hqht-online.com <br/><br/>
Global Patent Annuity Fees Payment Agency Cooperation
</textarea>
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
    //选择송금
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
            alert("최대 수<%=zlnum%>장 사용 불가");
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
