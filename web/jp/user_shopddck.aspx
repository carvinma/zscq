<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shopddck.aspx.cs" Inherits="user_shopddck" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%= TitleOrKeyword %>
    <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body id="index">
    <form id="form1" runat="server">
    <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
    <input type="hidden" id="Hi_OrderId" runat="server" value="0" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="84" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <uc1:zscq_sp_leftmenu ID="zscq_sp_leftmenu1" runat="server" />
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
                                        <a href="index.aspx">フロントページ</a>&nbsp;&gt;&gt;&nbsp;会員センター&nbsp;&gt;&gt;&nbsp;サービスセンター&nbsp;&gt;&gt;&nbsp;私の両替オーダー&nbsp;&gt;&gt;&nbsp;注文書の詳細
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
                                                                            注文基本情報
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
                                                            <td height="30" width="99" align="right" valign="middle">
                                                                <span class="ordertext">オーダー番号：</span>
                                                            </td>
                                                            <td height="30" width="162" align="left" valign="middle">
                                                                <span class="ordertext">
                                                                    <%=  OrderNumber %></span>
                                                            </td>
                                                            <td height="30" width="99" align="right" valign="middle">
                                                                <span class="ordertext">ユーザー名：</span>
                                                            </td>
                                                            <td width="295" height="30" align="left" valign="middle">
                                                                <%=MemberName %>
                                                            </td>
                                                        </tr>
                                                        <tr class="orderxx">
                                                            <td height="30" width="99" align="right" valign="middle">
                                                                <span class="ordertext">提出時間：</span>
                                                            </td>
                                                            <td height="30" width="162" align="left" valign="middle">
                                                                <%= OrderDate %>
                                                            </td>
                                                            <td height="30" width="99" align="right" valign="middle">
                                                                オーダー状態：
                                                            </td>
                                                            <td height="30" align="left" valign="middle">
                                                                <%= OrderStatus %>
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
                                                                          商品リスト
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
                                                                <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                                                    <tr>
                                                                        <td width="88" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            商品写真
                                                                        </td>
                                                                        <td width="191" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            商品名称
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            必要なポイント
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            両替数量
                                                                        </td>
                                                                        <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            小計
                                                                        </td>
                                                                        <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                            詳細
                                                                        </td>
                                                                    </tr>
                                                                    <asp:Repeater runat="server" ID="repProduct">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td width="88" height="70" align="center" bgcolor="#FFFFFF">
                                                                                    <a title="<%#Eval("nvc_ProductName")%>" href="jifen_show.aspx?cid=<%#Eval("i_IntegralProductId")%>" target="_blank">
                                                                                        <img src="../pic_Small/<%#Eval("nvc_Pic")%>" width="60" height="60" border="0">
                                                                                    </a>
                                                                                </td>
                                                                                <td width="191" align="center" bgcolor="#FFFFFF">
                                                                                    <a title="<%#Eval("nvc_ProductName")%>" href="jifen_show.aspx?cid=<%#Eval("i_IntegralProductId")%>" target="_blank">
                                                                                        <%# Eval("nvc_ProductName") %></a>
                                                                                </td>
                                                                                <td width="98" align="center" bgcolor="#FFFFFF">
                                                                                    <span class="font14ac5">
                                                                                        <%#Eval("i_NeedIntegral")%></span>
                                                                                </td>
                                                                                <td width="87" align="center" bgcolor="#FFFFFF">
                                                                                    <%#Eval("i_BuyNumber")%>
                                                                                </td>
                                                                                <td width="69" align="center" bgcolor="#FFFFFF">
                                                                                    <span class="font14ac5">
                                                                                        <%#Eval("i_Integral")%></span>
                                                                                </td>
                                                                                <td width="69" align="center" bgcolor="#FFFFFF">
                                                                                    <a title="<%#Eval("nvc_ProductName")%>" href="jifen_show.aspx?cid=<%#Eval("i_IntegralProductId")%>" target="_blank" class="ac5t">チェック</a>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
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
                                                                            受取住所
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
                                                            <td height="22" align="right" valign="top" style="line-height: 22px; padding-right: 12px;">
                                                                <%= Address%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0" style="margin: 26px auto;">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                          ポイント合計
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
                                                            <td height="59" align="right" valign="top" style="line-height: 22px; padding-right: 12px;">
                                                                ポイント総計：<%=i_SumIntegral %>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="41" align="right">
                                                    &nbsp;&nbsp;<a href="user_shopdd.aspx"><img src="images/user_zl_b11.gif" width="85" height="29" border="0" /></a>
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
    <uc2:zscqfoot ID="zscqfoot2" runat="server" />
    <div id="div_a" runat="server">
    </div>
    </form>
</body>
</html>
