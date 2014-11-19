<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_IntegralOrderPrint.aspx.cs"
    Inherits="Shop_Manage_shop_orderprint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>订单打印</title>
    <link rel="stylesheet" type="text/css" href="styles/order.css"/>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="37" valign="top">
                <table width="100%" height="78" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="2%">&nbsp;</td>
                        <td width="25%" align="center"><img src="images/logo.gif"></td>
                        <td width="65%" align="center" style="line-height: 24px;">礼品清单</td>
                        <td width="8%">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br/>
    <center>
    <table cellspacing="0" cellpadding="0" width="99%" align="center" height="30">
        <tbody>
            <tr id="basic_open">
                <td colspan="10" align="left" style="padding-bottom: 5px">
                    <table style="border-bottom: #808080 1px dashed; border-left: #808080 1px dashed;
                    padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border-top: #808080 1px dashed;
                    border-right: #808080 1px dashed; padding-top: 2px" cellspacing="2" cellpadding="5"
                    width="99%" bgcolor="#f7f7f7" align="center">
                        <tbody>
                            <tr>
                                <td width="10%" align="right" style=" font-size:14px;">订单编号：</td>
                                <td width="55%" align="left" style=" font-size:14px;"><asp:Label ID="labOrderNum" runat="server"></asp:Label></td>
                                <td width="15%" align="right" style=" font-size:14px;">收&nbsp;货&nbsp;人：</td>
                                <td width="20%" align="left" style=" font-size:14px;"><asp:Label ID="labReceiver" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" style=" font-size:14px;">用&nbsp;户&nbsp;名：</td>
                                <td align="left" style=" font-size:14px;"><asp:Label ID="labUserName" runat="server"></asp:Label></td>
                                <td align="right" style=" font-size:14px;">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
                                <td align="left" style=" font-size:14px;"><asp:Label ID="labMobile" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="right" style=" font-size:14px;"></td>
                                <td align="left"></td>
                                <td align="right" style=" font-size:14px;">下单日期：</td>
                                <td align="left" style=" font-size:14px;"><asp:Label ID="labAddTime" runat="server"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <br/>
                    <table style="border-bottom: 0px; border-left: #808080 1px dashed; padding-bottom: 2px;
                        padding-left: 2px; padding-right: 2px; border-top: #808080 1px dashed; border-right: #808080 1px dashed;
                        padding-top: 2px" cellspacing="2" cellpadding="4" width="99%" bgcolor="#f7f7f7"
                        align="center" height="30px">
                        <tbody>
                            <tr>
                                <td width="18%" align="center" style=" font-size:14px;">商&nbsp;品&nbsp;编&nbsp;号</td>
                                <td width="34%" align="center" style=" font-size:14px;">商&nbsp;品&nbsp;名&nbsp;称</td>
                                <td width="12%" align="center" style=" font-size:14px;">商&nbsp;品&nbsp;数&nbsp;量</td>
                                <td width="12%" align="center" style=" font-size:14px;">商&nbsp;品&nbsp;价&nbsp;格</td>
                                <td width="12%" align="center" style=" font-size:14px;">小&nbsp;计</td>
                            </tr>
                           <asp:Repeater runat="server" ID="repProduct">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center" style=" font-size:14px;"><%#Eval("nvc_No")%></td>
                                        <td height="25" align="left" style=" font-size:14px;"><%#Eval("nvc_Name")%></td>
                                        <td height="25" align="center" style=" font-size:14px;"><%#Eval("i_Number")%></td>
                                        <td height="25" align="center" style="color: #C80C1A; font-size:14px;"><%#Eval("dm_Price")%></td>                                        
                                        <td height="25" align="center" style="color: #C80C1A; font-size:14px;"><%#Convert.ToDecimal(Eval("dm_Price")) * Convert.ToInt32(Eval("i_Number"))%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                    <table style="border-bottom: #808080 1px dashed; border-left: #808080 1px dashed;
                        padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border-top: #808080 1px dashed;
                        border-right: #808080 1px dashed; padding-top: 2px" cellspacing="2" cellpadding="4"
                        width="99%" bgcolor="#f7f7f7" align="center" height="30px">
                        <tbody>
                            <tr>
                                <td valign="top" style=" font-size:14px;">支付信息：</td>
                                <td align="right" style="font-size: 14px; line-height: 22px;">
                                     <%= Str_Money %><br /> 积分总计：<strong style="color: #C80C1A;"><asp:Label ID="labTotalMoney" runat="server"></asp:Label></strong>
                                </td>
                                <td align="left"></td>
                            </tr>
                            <tr>
                                <td width="18%"></td>
                                <td width="80%" align="right" height="5"></td>
                                <td width="2%" align="left"></td>
                            </tr>
                        </tbody>
                    </table><%if (br_fapiao)
                      { %><br /><%} %><%if (table_fapiao)
                      { %><table style="border-bottom: #808080 1px dashed; border-left: #808080 1px dashed;
                    padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border-top: #808080 1px dashed;
                    border-right: #808080 1px dashed; padding-top: 2px" cellspacing="2" cellpadding="5"
                    width="99%" bgcolor="#f7f7f7" align="center">
                        <tbody>
                            <tr>
                                <td width="10%" align="right" style=" font-size:14px;">发票类型：</td>
                                <td width="10%" align="left" style=" font-size:14px;"><%=fapiaotype %></td>
                                <td width="10%" align="right" style=" font-size:14px;">发票金额：</td>
                                <td width="70%" align="left" style=" font-size:14px;"><%=Lb_FP%></td>
                            </tr>
                            <tr>
                                <td align="right" style=" font-size:14px;">发票抬头：</td>
                                <td align="left" colspan="3" style=" font-size:14px;"><%=Lb_FPTT%></td>
                            </tr>
                        </tbody>
                    </table>
                    <%} %>
                    <br />
                    <table style="border-bottom: #808080 1px dashed; border-left: #808080 1px dashed;
                    padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border-top: #808080 1px dashed;
                    border-right: #808080 1px dashed; padding-top: 2px" cellspacing="2" cellpadding="5"
                    width="99%" bgcolor="#f7f7f7" align="center">
                        <tbody>
                            <tr>
                                <td align="center" style="font-size:14px;">非常感谢您对知识产权的支持！</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="1" colspan="10" background="images/dot03.gif">
                </td>
            </tr>
        </tbody>
    </table>
    </center>

    <script type="text/javascript">window.print();</script>

    </form>
    <!-- #include file="push.html" -->  
</body>
</html>