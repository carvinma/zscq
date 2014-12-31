<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Trademark_Count.aspx.cs"
    Inherits="Trademark_Count" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/Calendar.js"></script>
    <style type="text/css">
        .pager
        {
            margin: 10px auto 0px auto;
        }
        .pager td
        {
            font-size: 12px;
            padding: 2px;
        }
        .pager td a
        {
            border: solid 1px #578ece;
            padding: 1px 5px 1px 5px;
        }
        #aspPage_input
        {
            margin-bottom: 2px;
        }
        #listDiv a
        {
            text-decoration: none;
        }
        #xuanzhong
        {
            color: Red;
        }
        #listDiv a .sp1
        {
            background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent;
            display: inline-block;
            height: 11px;
            margin-top: 3px;
            overflow: hidden;
            width: 10px;
            background-position: 0 0px;
        }
        #listDiv a .sp2
        {
            background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent;
            display: inline-block;
            height: 11px;
            margin-top: 3px;
            overflow: hidden;
            width: 10px;
            background-position: 0 -11px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <h1>
            <span class="action-span"></span><span class="action-span1"><a href="../Shop_Index_Main.aspx">
                统计管理</a> </span><span id="search_id" class="action-span1">- 商标统计 </span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="list-div" id="listDiv">
            <table>
                <tr>
                    <td valign="top" width="50%">
                         <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="20%">
                                    申请案状态
                                </th>
                                <th width="20%">
                                    商标个数
                                </th>
                            </tr>
                            <asp:Repeater ID="rptApply" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center">
                                            <%#Eval("StatusName")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("counts")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                         <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="20%">
                                    订单状态
                                </th>
                                <th width="20%">
                                    商标个数
                                </th>
                            </tr>
                            <asp:Repeater ID="rptOrder" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center">
                                            <%#Eval("StatusName")%>
                                        </td>
                                        <td align="center">
                                            <%# int.Parse(Eval("countsApply").ToString()) + int.Parse(Eval("countsRenewal").ToString())%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </td>
                    <td valign="top">
                        <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="20%">
                                    续展案状态
                                </th>
                                <th width="20%">
                                    商标个数
                                </th>
                            </tr>
                            <asp:Repeater ID="rptRenewal" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center">
                                            <%#Eval("StatusName")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("counts")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </td>
                </tr>
                <tr><td valign="top">
                  <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="20%">
                                    商品大类
                                </th>
                                <th width="20%">
                                    商标个数
                                </th>
                            </tr>
                            <asp:Repeater ID="rptType" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center">
                                            类别（<%#Eval("CategoryCode")%>）
                                        </td>
                                        <td align="center">
                                            <%# int.Parse(Eval("countsApply").ToString()) + int.Parse(Eval("countsRenewal").ToString())%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                </td>
                <td valign="top">
                    <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="20%">
                                    省份
                                </th>
                                <th width="20%">
                                    商标个数
                                </th>
                            </tr>
                            <asp:Repeater ID="rptArea" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center">
                                            <%#Eval("provinceName")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("counts")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                </td></tr>
                <tr><td height="18px" colspan="2"></td></tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
