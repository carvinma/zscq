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
    <title>オーダーを確認_私の特許オーダー_サービスセンター_会員センター__特許システム_環球匯通</title>
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
    <uc2:zscqadv ID="zscqadv1" TypeId="83" runat="server" />
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
                                        フロントページ >> 特許システム >> 会員センター >> サービスセンター >> 私の特許オーダー >> オーダーを確認
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
                                                                <table width="177" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="160" align="center" class="font12bt">
                                                                            費用を納付する特許リスト
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
                                                                            特許番号
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            授権国
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            納付年度
                                                                        </td>
                                                                        <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            納付期限
                                                                        </td>
                                                                         <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            納付金額
                                                                        </td>
                                                                        <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            貨幣
                                                                        </td>
                                                                        <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            公文書番号
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
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0"style="display:none;">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                            領収書について
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
                                                                領収書を発行するかどうか：
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
                                                                            クーポン
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
                                    <td width="16%" align="right" valign="top" style="line-height:18px;">クーポン利用：</td>
                                    <td width="84%" align="left"><DIV id=relatedDiv style="OVERFLOW: hidden; WIDTH: 100%">
            <DIV style="WIDTH: 100%">
            <DIV id=related_page_0 style="FLOAT: left; WIDTH: 100%"><span class="font12b4e user_zlbottomline">
                                      <asp:Repeater ID="rp_youhui" runat="server">
                                        <ItemTemplate>
                                        
            <DIV style="FLOAT: left; WIDTH: 270px;height:25px;"><input type="checkbox" name="inputPageid" lang="<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")),"USD",hi_paybizhong.Value)%>" onclick="CheckYouhui('cb_youhui<%#Eval("i_Id") %>');" id="cb_youhui<%#Eval("i_Id") %>" value='<%# Eval("i_Id")%>'>&nbsp;<%# Eval("nvc_JPName")%> (<%=hi_paybizhong.Value %>:<%#DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(Eval("i_Money1")), "USD", hi_paybizhong.Value).ToString("0.00")%>)</DIV>
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
                                                                            金額について
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
                                                                                                                政府規定費用：
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
                                                                                                                延長金：
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
                                                                                                                代理費：
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
                                                                                                                項目超過費用：
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
                                                                                                                小計：
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
                                                                                                                クーポン券を使用する：
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
                                                                                                                振込手数料：
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
                                                                                                                総計：
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
                                                                            選択支払い方式
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
                                                                &nbsp;&nbsp;線の下で送金
                                                            </td>
                                                            <td width="75%">
                                                                <table id="tpay1" width='100%' border='0' cellspacing='1' cellpadding='0' style="background-color: #CCC;">
                                                                    <tr>
                                    <td width='24%' height='28' align='center' bgcolor='#FFFFFF'><strong>銀行の詳細</strong></td>
                                    <td width='20%' align='center' bgcolor='#FFFFFF'><strong>スウィフトコード</strong></td> 
                                    <td width='28%' align='center' bgcolor='#FFFFFF'><strong>アカウント名</strong></td>
                                    <td width='28%' align='center' bgcolor='#FFFFFF'><strong>口座番号</strong></td>
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
                                                        OnClientClick="return confirm('本当にを放棄するかを提出する')" OnClick="ImageButton2_Click" />
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
注文書番号:$order_num<br/>
注文書提出時間:$order_date<br/>
注文書種類:$order_type<br/>
注文書状態:$order_stat<br/>
<br/>
=============================================================================<br/>
<br/>
＜会員基本情報＞<br/><br/>
会員コード:$user_num<br/>
姓名:$true_name<br/>
国籍:$user_counrtyInfo<br/>
<br/>
=============================================================================<br/><br/>
＜年金納付の特許情報＞<br/><br/>
$TplPatentData<br/><br/>
===============================================================================<br/><br/>
＜今回の納付金額総計＞
<br/><br/>
$tplSumData
<br/><br/>
===============================================================================<br/><br/>
＜特許年金支払いの注意事項＞
<br/><br/>
お客様へ
<br/><br/>
弊社の特許年金に関するサービスを利用していただき、真にありがとうございます！
<br/><br/>
お客様が$orderDateに提出した特許年金納付代行の委託書は既にシステムから自動的に弊社のメールアドレスに送信できました。<br/>
ご安心ください。
<br/><br/>
今後、お客様の委託書に対するチェックの為に、下記の委託書番号を一応覚えてください。
お客様の委託書番号$order_num
<br/><br/>
お客様の提出した委託書の中でも表明してある、下記の費用を、お客様の委託書を提出した時点から起算する24時間以内（本システムで顕示した委託書の提出時間を基準にする）に、弊社の銀号口座に振り込みを行うようにしてください。
<br/><br/>
汇款期限  $limitDate <br/><br/>
$bankInfo<br/>
<br/>
※お支払いに関する注意事項
<br/><br/>
1）国際為替レートの変動を考えた上、お客様の特許年金をスピーディーに納付するため、必ず特許年金納付代行の委託書を提出した時点から起算する24時間以内（本システムで顕示した委託書の提出時間を基準にする）に、上記の費用を弊社の銀行口座に振り込んでください。
<br/><br/>
弊社の銀行口座が実際にお客様のお支払を受取る時点を上記費用の実際到着時点に見なす。
<br/><br/>
お客様が弊社に特許年金納付代行の委託書を提出した時点から起算する24時間以内（本システムで顕示した委託書の提出時間を基準にする）に上記費用を弊社の銀行口座に振り込めない場合、24時間（本システムで顕示した委託書の提出時間を基準にする）を超えた後の新しい為替レートによって新しく変動した金額で振込みを行うようにお願いいたします。
<br/><br/>
弊社はお客様のお支払はお客様の提出した特許年金納付代行の委託書に表明している金額と一致し、金額上の間違いがないことを確認できた後に、お客様の特許年金納付代行の委託を処理いたします。
<br/><br/>
お客様が指定の支払期限以内に支払いをしない場合、或いは支払い金額が不足である場合、或いは支払い期限を超えた後に支払いを行う場合、或いは指定の支払い期限以内に弊社或いはほかの受取先が全額で金を受け取れない場合、弊社及び弊社のHPはお客様の特許年金納付代行の委託を受理しない権利を持ち、且つお客様と弊社及び弊社のHPの間の委託関係が成立していないことと見なす。
<br/><br/>
それによって生じる特許年金納付の期限切れ、特許権の喪失、期限切れの延長罰金、期限後に納付する場合の延長金或いはその他の一切の損失については、弊社及び弊社のHPは一切の責任を負いません。<br/>
必ずお気をつけるようお願いいたします。
<br/><br/>
2）お客様が法定休みの日或いは祝日（中国現地の法定休みの日及び祝日を基準にする）に提出する特許年金納付代行の委託は、該当法定休みの日或いは祝日の完了後の一日目の稼働日に持ち越し、処理をするようにいたします。
<br/><br/>
また、お客様の法定休みの日或いは祝日（中国現地の法定休みの日及び祝日を基準にする）に提出する特許年金納付代行の委託において、関連費用の計算は該当委託の提出日の為替レートを基準にします。<br/>
お客様の委託書の提出日から該当委託書の処理開始日の間に、為替レートの変動によって発生する金額の変動を略します。
<br/><br/>
3）お客様が指定期限以内に弊社の指定口座或いはほかの弊社の指定する口座に振り込んだ後に、必ず支払い時点から起算する24時間以内（お客様の使っている銀行の送金の現地時間を基準とし、起算する）E-mailの方式でお客様の振込み情報（支払い人名称、注文書番号、支払い金額、支払い期日、支払い銀行或いはATM振込番号）を弊社或いはほかの弊社の指定する受取先にお知らせをしてください。
<br/><br/>
お客様のそのお知らせに対する弊社のメールでの返事をお客様の明確に弊社に知らせられた基準にいたします。
<br/><br/>
お客様が弊社或いはほかの弊社の指定する受取先に振り込み情報を知らせない場合、指定期限以内に知らせない場合、お客様の知らせ方の問題により弊社或いはほかの弊社の指定する受取先が振り込み情報を知れない場合、或いはお客様の知らせる振込み情報が正しくない場合、弊社及び弊社のHPがお客様に特許年金納付の代行サービスを提供することを中止したり、止めたりする権利を持ち、且つお客様と弊社及び弊社のHPの間の委託関係を成立していないことと見なし、取引を停止する権利を持っています。
<br/><br/>
それによって生じる特許年金納付の期限切れ、特許権の喪失、期限切れの延長罰金、期限後に納付する場合の延長金、その他の一切の損失については、弊社及び弊社のHPは一切の責任を負いません。必ずお気をつけるようにお願いいたします。
<br/><br/>
4）お客様が既に弊社及び弊社のHPに特許年金納付代行の委託をし、且つ我々がまだお客様の支払いを受け取れてない場合、弊社及び弊社のHPがまだ作業中で、お客様の特許年金を指定の授権国への納付を完了できていない間に、もし該当特許の授権国の国家政府が突然に特許年金基準を上げる場合、或いは外貨為替レートが大幅に上がる場合、お客様がそれらによって発生する差額を無条件で弊社の指定期限以内に弊社に補足で払うことに同意します。<br/><br/>
我々はお客様のお支払を受取った後、直ちに相関授権国の特許局へお客様の特許年金納付の手続きを進めます。<br/>
特許年金の納付が完了した後に、また報告のメールをいたします。是非ご安心ください。<br/><br/>
お支払の中で、もし何か問題があれば、必ず直ちにメールを通じ、我々とご連絡をください。弊社の方で即時にご対応をいたします。<br/>
私達のメールアドレス　　　pat-annuity@hqht-online.com <br/><br/>
ご協力、どうもありがとうございます！<br/>
環球匯通特許年金代理株式会社
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
            alert("最大に<%=zlnum%>つのギフト券のみを使用");
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
