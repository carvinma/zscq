<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_C_Trademark.aspx.cs" Inherits="Shop_Manage_Shop_C_Patent" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/Calendar.js"></script>
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
            <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">
                管理中心</a> </span><span id="search_id" class="action-span1">- 商标个人统计 </span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="form-div">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="28" align="right">
                        关&nbsp;键&nbsp;词：
                    </td>
                    <td class="style1">
                        <input type="text" id="user_namee" runat="server" name="user_namee" size="12" class="input"
                            value="" />&nbsp;
                        <select id="selectt" name="selectt" runat="server">
                            <option value="0">多字段</option>
                            <option value="1">会员编号</option>
                            <option value="2">会员账号</option>
                            <option value="3">客户姓名</option>
                            <option value="4">手机号码</option>
                            <option value="9">积分手机号</option>
                            <option value="5">电话号码</option>
                            <option value="6">电子邮箱</option>
                            <option value="7">QQ/NSN/SKYPE</option>
                        </select>&nbsp; 等&nbsp;&nbsp;级：<asp:DropDownList ID="ddl_grade" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="28" align="right">
                        注册时间：
                    </td>
                    <td class="style1">
                        <input name="hot_start_date" type="text" id="hot_start_date" size="10" value='' runat="server"
                            readonly="readonly" /><input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.hot_start_date);"
                                class="inputcalendarbutton" />&nbsp;至&nbsp;<input name="hot_end_date" type="text"
                                    id="hot_end_date" size="10" value='' runat="server" readonly="readonly" /><input
                                        name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.hot_end_date);"
                                        class="inputcalendarbutton" />
                    </td>
                </tr>
                <tr>
                    <td height="28" align="right">
                        国&nbsp;&nbsp;家：
                    </td>
                    <td class="style1">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddl_country" runat="server">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td height="28" align="right">
                        &nbsp;&nbsp;
                    </td>
                    <td class="style1">
                        <asp:Button ID="btSelect" runat="server" Text="搜索" class="button" OnClick="btSelect_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="list-div" id="listDiv">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th width="20%">
                        会员编号
                    </th>
                    <th width="20%">
                        会员名称
                    </th>
                    <th width="20%">
                        会员国籍
                    </th>
                    <th width="20%">
                        商标总数
                    </th>
                    <th width="20%">
                        客户商标涉及国家
                    </th>
                </tr>
                <asp:Repeater ID="rept_list" runat="server" 
                    onitemdatabound="rept_list_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <asp:HiddenField ID="Hi_Id" runat="server" Value='<%#Eval("i_Id") %>' />
                                <%#Eval("nvc_UserNum") %>
                            </td>
                            <td align="center">
                                <%#Eval("nvc_Name")%>
                            </td>
                            <td align="center">
                                <%#GetGuoJiaNameById(Eval("i_GuoJiId"))%>
                            </td>
                            <td align="center">
                                <%#GetPatentCountById(Eval("i_Id"))%>
                            </td>
                            <td align="center">
                                <table cellspacing='1'>
                                    <asp:Repeater ID="rept_list1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center">
                                                    <%#GetGuoJiaNameById(Eval("i_GuoJiId"))%>
                                                    (<%#GetPatentCountById(Eval("i_MemberId"), Eval("i_GuoJiId"))%>个)
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
        <div style="text-align: center">
            <table class="pager" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label
                            ID="Label1" runat="server" Text="条/页"></asp:Label>
                        &nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;
                    </td>
                    <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never"
                        runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页"
                        NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged"
                        PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button"
                        ShowDisabledButtons="False">
                    </webdiyer:AspNetPager>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
