<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentOrderInfo.aspx.cs"
    Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Detailed information_Service Center_User Center_System of Patent Annuity Fee_Global Patent</title>
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
    <asp:HiddenField ID="HF_oId" runat="server" Value="0" />
    <input type="hidden" id="Hi_HuiLv1" runat="server" value="1" />
    <input type="hidden" id="Hi_HuiLv2" runat="server" value="1" />
    <input type="hidden" runat="server" id="hi_bizhong" value="" />
    <input type="hidden" runat="server" id="hi_paybizhong" value="" />
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
                                        Front page>>System of Patent Annuity Fee>>User Center>>Service Center>>My patent Order>>Order Detailed
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="28" class="style1">&nbsp;
                                        
                                    </td>
                                    <td width="691">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123" class="style1">&nbsp;
                                        
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table id="pr_table" width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="198" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="179" align="center" class="font12bt">
                                                                            Order Basic information
                                                                        </td>
                                                                        <td width="9">
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
                                                            <td height="30" align="left" valign="middle" width="35%">
                                                                <span class="ordertext">Your Order number：<asp:Literal ID="Ltl_OrderNum" runat="server"></asp:Literal>
                                                                </span>
                                                            </td>
                                                            <td height="30" align="left" valign="middle" width="30%">
                                                                <span class="ordertext">User ID：<asp:Literal ID="Ltl_MemberNum" runat="server"></asp:Literal>
                                                                </span>
                                                            </td>
                                                            <td height="30" align="left" valign="middle" width="30%">
                                                                <span class="ordertext">Submitted person：<asp:Literal ID="Ltl_MemberName" runat="server"></asp:Literal>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                                                        <tr class="orderxx">
                                                            <td height="30" align="left" valign="middle" width="35%">
                                                                Submitted time：<asp:Literal ID="Ltl_AddTime" runat="server"></asp:Literal>
                                                            </td>
                                                            <td height="30" align="left" valign="middle" width="60%">
                                                                Order status：<asp:Literal ID="Ltl_OrderStatus" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="15" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="275" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="249" align="center" class="font12bt">
                                                                            Patent list of Annuity fee to be paid
                                                                        </td>
                                                                        <td width="16">
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
                                                                <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
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
                                                                    <asp:Repeater ID="Rpt_PatentList" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td height="32" align="center" bgcolor="#FFFFFF">
                                                                                    <%#Eval("nvc_PatentNumber")%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                <%#DALN.Nationality_Select_Id(Convert.ToInt32(Eval("i_PatentShouQuanGuoId"))).nvc_EnName%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                   <%#Eval("nvc_Year")%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                    <%#Convert.ToDateTime(Eval("dt_PatentJiaoFeeQiXian")).ToShortDateString()%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                    <a href="Box.aspx?height=100&width=610&pId=<%#Eval("i_Id")%>" class="thickbox"><%#Eval("dm_TotalMoney1")%></a>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                    <%#Eval("nvc_BiZhong1")%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                    <%#Eval("nvc_AnJuanNum")%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF">
                                                                                    <a href="User_PatentInfo.aspx?pId=<%#Eval("i_PatentId")%>" class="ac5t">Check</a>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="15" align="left">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0" runat="server" id="Table_FaPiao1">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="221" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="203" align="center" class="font12bt">
                                                                            Correspondent to invoice
                                                                        </td>
                                                                        <td width="8">
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
                                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" runat="server"
                                                        id="Table_FaPiao2">
                                                        <tr>
                                                            <td width="4%">&nbsp;
                                                                
                                                            </td>
                                                            <td height="32" align="left" style="line-height: 21px;">
                                                                发票抬头：<asp:Literal ID="Ltl_FaPiaoTaiTou" runat="server"></asp:Literal><br />
                                                                邮寄方式:
                                                                <asp:Literal ID="Ltl_YouJiType" runat="server"></asp:Literal><br />
                                                                <asp:Literal ID="Ltl_YouJiAddress" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="15" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0" runat="server" id="Table_YouHuiQuan1">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            coupons
                                                                        </td>
                                                                        <td width="6">
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
                                                        runat="server" id="Table_YouHuiQuan2">
                                                        <tr class="orderxx">
                                                            <td height="30" align="left" valign="middle">
                                                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="123" align="right">
                                                                            Using coupons：
                                                                        </td>
                                                                        <td width="292" align="left">
                                                                            <asp:Literal ID="Ltl_YouHuiQuan" runat="server"></asp:Literal>
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
                                                                <table width="223" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="206" align="center" class="font12bt">
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
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="59" align="right" valign="top" style="line-height: 22px;">
                                                                <div id="FeeInfo">
                                                                    <table width="415" cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
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
                                                                                                                    <asp:Label ID="Lal_GuanFei" runat="server"></asp:Label>
                                                                                                                </td>
                                                                                                                <td width="30">
                                                                                                                </td>
                                                                                                                <td style="width: 100px;">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr align="left">
                                                                                                                <td width="200" align="right">
                                                                                                                    Surcharge：
                                                                                                                </td>
                                                                                                                <td width="110">
                                                                                                                    <asp:Label ID="lb_zhinajin" runat="server"></asp:Label>
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
                                                                                                                    <asp:Label ID="Lal_DaiLiFei" runat="server"></asp:Label>
                                                                                                                </td>
                                                                                                                <td width="30">
                                                                                                                </td>
                                                                                                                <td style="width: 100px;">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr align="left">
                                                                                                                <td width="200" align="right">
                                                                                                                    Reduction：
                                                                                                                </td>
                                                                                                                <td width="110">
                                                                                                                    <asp:Label ID="Lal_ChangXiangFei" runat="server"></asp:Label>
                                                                                                                </td>
                                                                                                                <td width="30">
                                                                                                                </td>
                                                                                                                <td style="width: 100px;">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr align="left">
                                                                                                                <td width="200" align="right">
                                                                                                                </td>
                                                                                                                <td width="110" align="right">
                                                                                                                    Subtotal：
                                                                                                                </td>
                                                                                                                <td width="30">
                                                                                                                    <asp:Label ID="Lal_bizhong1" runat="server"></asp:Label>
                                                                                                                </td>
                                                                                                                <td align="left" style="width: 100px;">
                                                                                                                    <asp:Label ID="Lal_xiaoji" runat="server"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                    <table width="440" cellspacing="0" cellpadding="0" border="0">
                                                                                                        <tbody>
                                                                                                            <tr align="left">
                                                                                                                <td width="200" align="right">
                                                                                                                    Using coupons：
                                                                                                                </td>
                                                                                                                <td width="110">
                                                                                                                    <asp:Label ID="Lal_YouHui" runat="server"></asp:Label>
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
                                                                                                                    <asp:Label ID="Lal_ShouXuFei" runat="server"></asp:Label>
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
                                                                                                                    <asp:Label ID="Lal_PeiSongFee" runat="server"></asp:Label>
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
                                                                                                                <td width="110">
                                                                                                                    <asp:Label ID="lb_fapiao" runat="server"></asp:Label>
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
                                                                                                                    <asp:Label ID="Lal_BiZhong" runat="server" CssClass="inputs60text"></asp:Label>
                                                                                                                </td>
                                                                                                                <td width="100" align="left">
                                                                                                                    <asp:Label ID="Lal_TotalMoney" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
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
                                                        </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="146" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="131" align="center" class="font12bt">
                                                                            Payment methods
                                                                        </td>
                                                                        <td width="5">
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
                                                            <td height="30" align="left" valign="middle">
                                                                <asp:Literal ID="Ltl_PayType" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                        <tr class="orderxx">
                                                            <td height="15" align="left">&nbsp;
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="41" align="right">
                                                    <asp:ImageButton ID="ImgBtn_Pay" runat="server" ImageUrl="images/user_zl_b10.gif"
                                                        OnClick="ImgBtn_Pay_Click" />
                                                    &nbsp;&nbsp; <a href="User_PatentOrder.aspx">
                                                        <img src="images/user_zl_b11.gif" /></a> &nbsp;&nbsp;
                                                    <a href="javascript:void(0)">
                                                        <img src="images/user_zl_pr.jpg" onclick="printPage()" /></a>
                                                    <script type="text/javascript">
                                                        function printPage() {
                                                            var newWin = window.open();
                                                            var titleHTML = document.getElementById("pr_table").innerHTML;
                                                            newWin.document.write(titleHTML);
                                                            newWin.document.location.reload();
                                                            newWin.print();
                                                        } 
                                                    </script>
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
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div runat="server" id="div_a">
    </div>
    </form>
</body>
</html>
