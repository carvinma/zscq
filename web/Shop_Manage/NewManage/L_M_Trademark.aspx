<%@ Page Language="C#" AutoEventWireup="true" CodeFile="L_M_Trademark.aspx.cs"
    Inherits="L_M_Trademark" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="../js/Calendar.js"></script>
    <script type="text/javascript" src="../js/vcom.js"></script>
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
    </style>
    <style type="text/css">
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
            background: url("../images/shengjiang.png") no-repeat scroll 0 0 transparent;
            display: inline-block;
            height: 11px;
            margin-top: 3px;
            overflow: hidden;
            width: 10px;
            background-position: 0 0px;
        }
        #listDiv a .sp2
        {
            background: url("../images/shengjiang.png") no-repeat scroll 0 0 transparent;
            display: inline-block;
            height: 11px;
            margin-top: 3px;
            overflow: hidden;
            width: 10px;
            background-position: 0 -11px;
        }
    </style>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/ShowKeyword.js"></script>
    <script type="text/javascript">
        $(function () {
            var bianhao = $("#bianhao1");
            var username = $("#username1");
            // var shangbiao = $("#shangbiao1");
            var ptime = $("#ptime1");
            var stime = $("#stime1");
            var uname = $("#uname1");
            var ubianhao = $("#ubianhao1");
            var shangbiaotype = $("#shangbiaotype1");
            var jiaofei = $("#jiaofei1");
            var dizhi = $("#dizhi1");
            var zhuangtai = $("#zhuangtai1");
            if (bianhao.val() == "desc") {
                $("#bianhaodaoxu").hide();
                $("#bianhaozhengxu").show();
            }
            else {
                $("#bianhaozhengxu").hide();
                $("#bianhaodaoxu").show();
            }
            if (username.val() == "desc") {
                $("#usernamedaoxu").hide();
                $("#usernamezhengxu").show();
            }
            else {
                $("#usernamedaoxu").show();
                $("#usernamezhengxu").hide();
            }
            if (stime.val() == "desc") {
                $("#stimedaoxu").hide();
                $("#stimezhengxu").show();
            }
            else {
                $("#stimedaoxu").show();
                $("#stimezhengxu").hide();
            }
            if (ptime.val() == "desc") {
                $("#ptimedaoxu").hide();
                $("#ptimezhengxu").show();
            }
            else {
                $("#ptimedaoxu").show();
                $("#ptimezhengxu").hide();
            }

            if (shangbiaotype.val() == "desc") {
                $("#shangbiaotypedaoxu").hide();
                $("#shangbiaotypezhengxu").show();
            }
            else {
                $("#shangbiaotypedaoxu").show();
                $("#shangbiaotypezhengxu").hide();
            }
            if (jiaofei.val() == "desc") {
                $("#jiaofeidaoxu").hide();
                $("#jiaofeizhengxu").show();
            }
            else {
                $("#jiaofeidaoxu").show();
                $("#jiaofeizhengxu").hide();
            }
            if (dizhi.val() == "desc") {
                $("#dizhidaoxu").hide();
                $("#dizhizhengxu").show();
            }
            else {
                $("#dizhidaoxu").show();
                $("#dizhizhengxu").hide();
            }
            if (zhuangtai.val() == "desc") {
                $("#zhuangtaidaoxu").hide();
                $("#zhuangtaizhengxu").show();
            }
            else {
                $("#zhuangtaidaoxu").show();
                $("#zhuangtaizhengxu").hide();
            }
            if (uname.val() == "desc") {
                $("#unamedaoxu").hide();
                $("#unamezhengxu").show();
            }
            else {
                $("#unamedaoxu").show();
                $("#unamezhengxu").hide();
            }
            if (ubianhao.val() == "desc") {
                $("#ubianhaodaoxu").hide();
                $("#ubianhaozhengxu").show();
            }
            else {
                $("#ubianhaodaoxu").show();
                $("#ubianhaozhengxu").hide();
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" runat="server" id="hi_true" value="0" />
    <input type="hidden" runat="server" id="Hi_Orderby" value="i_Id" />
    <input type="hidden" runat="server" id="Hi_Orderby2" value="desc" />
    <input type="hidden" id="bianhao1" runat="server" value="0" />
    <input type="hidden" id="username1" runat="server" value="0" />
    <input type="hidden" id="stime1" runat="server" value="0" />
    <input type="hidden" id="ptime1" runat="server" value="0" />
    <input type="hidden" id="shangbiaotype1" runat="server" value="0" />
    <input type="hidden" id="jiaofei1" runat="server" value="0" />
    <input type="hidden" id="dizhi1" runat="server" value="0" />
    <input type="hidden" id="zhuangtai1" runat="server" value="0" />
    <input type="hidden" id="uname1" runat="server" value="0" />
    <input type="hidden" id="ubianhao1" runat="server" value="0" />
    <h1>
        <%if (pageadd)
          {%><span class="action-span"><%--<a href="Shop_A_Product.aspx">添加商标</a>--%></span><%}%>
        <span class="action-span1"><a href="../Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
            class="action-span1">- 商标列表 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="../js/fucties.js"></script>
    <script type="text/javascript" src="../js/listtb.js"></script>
    <div class="form-div">
        <table width="800" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="28" align="right">
                    关&nbsp;键&nbsp;词：
                </td>
                <td align="left">
                    <input type="text" id="hw_name" size="15" title="关键词" runat="server" />&nbsp;<asp:DropDownList
                        ID="DDL_SType" runat="server">
                        <asp:ListItem Text="全部字段" Value="0"></asp:ListItem>
                        <asp:ListItem Text="会员手机号" Value="8"></asp:ListItem>
                        <asp:ListItem Text="会员编号" Value="6"></asp:ListItem>
                        <asp:ListItem Text="会员名称" Value="5"></asp:ListItem>
                        <asp:ListItem Text="账单号" Value="4"></asp:ListItem>
                        <asp:ListItem Text="商标编号" Value="2"></asp:ListItem>
                        <asp:ListItem Text="商标注册用户" Value="1"></asp:ListItem>
                        <asp:ListItem Text="商标类型" Value="7"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddl_jiaofeizt" runat="server">
                                        <asp:ListItem Value="-1">请选择缴费状态</asp:ListItem>
                                         <asp:ListItem Value="1">已提交订单</asp:ListItem>
                                        <asp:ListItem Value="2">已缴费</asp:ListItem>
                                        <asp:ListItem Value="0">未缴费</asp:ListItem>
                                      </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    类&nbsp;&nbsp;&nbsp;&nbsp;型：
                </td>
                <td height="28" align="left">
                    &nbsp;<asp:DropDownList ID="DDL_usertype" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem Text="请选择会员类型" Value="0"></asp:ListItem>
                        <asp:ListItem Text="个人" Value="1"></asp:ListItem>
                        <asp:ListItem Text="企业" Value="2"></asp:ListItem>
                        <asp:ListItem Text="代理机构" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="DDL_state" runat="server">
                        <asp:ListItem Text="请选择状态" Value="0"></asp:ListItem>
                        <asp:ListItem Text="审核通过" Value="1"></asp:ListItem>
                        <asp:ListItem Text="未审核" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    剩余天数：
                </td>
                <td height="28" align="left">
                    <asp:DropDownList ID="ddl_sheng" runat="server">
                        <asp:ListItem Value="0">请选择</asp:ListItem>
                        <asp:ListItem Value="1">&gt;90</asp:ListItem>
                        <asp:ListItem Value="2">61-90</asp:ListItem>
                        <asp:ListItem Value="3">31-60</asp:ListItem>
                        <asp:ListItem Value="4">16-30</asp:ListItem>
                        <asp:ListItem Value="5">0-15</asp:ListItem>
                    </asp:DropDownList>
                    <input type="text" id="sb_day" size="10" value='' runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    注册时间：
                </td>
                <td align="left">
                    <input name="hot_start_date" type="text" id="hot_start_date" size="10" value='' runat="server"
                        readonly="readonly" /><input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.hot_start_date);"
                            class="inputcalendarbutton" />&nbsp;至&nbsp;<input name="hot_end_date" type="text"
                                id="hot_end_date" size="10" value='' runat="server" readonly="readonly" /><input
                                    name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.hot_end_date);"
                                    class="inputcalendarbutton" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    &nbsp;
                </td>
                <td height="28" align="left">
                    <asp:Button ID="But_search1" runat="server" Text="搜索" CssClass="button" OnClick="But_search_Click" />
                    <asp:Button ID="Bt_Onsubmit" runat="server" Text="" Style="display: none;" OnClick="Bt_Onsubmit_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            </table>
    </div>
    <div class="list-div" id="listDiv">
        <table cellpadding='3' cellspacing='1'>
            <tr align="left">
                <td bgcolor="#FFFFFF" height="23">
                    <input name="checkall" id="checkall2" type="checkbox" onclick="SelAll(this)" />&nbsp;<%if (pagedel)
                                                                                                           {%><input type="button" id="Button4" runat="server" value="删除" onclick="xwshow()"
                                                                                                               class="button" /><%} if (pagechu)
                                                                                                           {%>
                    <%--  <input type="button" class="button" value="前台商标注册生成文档" onclick="javascript:window.location='Shop_World_Trademark.aspx';" >--%>
                    <%} %><%= Lb_sum.Text%>
                </td>
                <td width="200" align="right">
                    <%= Lb_ye.Text %>&nbsp;<input type="text" runat="server" id="text_pageindex" onkeypress="event.returnValue=IsDigit();"
                        title="页数" style="ime-mode: disabled; width: 30px;" class="inputs" /><asp:Button
                            ID="Button3" runat="server" Text="GO" CssClass="button" OnClick="Button3_Click" />
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding='3' cellspacing='1'>
            <tr>
                <th width="2%">
                </th>
                <th width="12%">
                    商标申请/委托书
                </th>
                <th width="14%">
                    主体资格证明<br />
                    商标注册证书
                </th>
                <th width="10%" align="center">
                    商标注册号 <a href="Shop_M_Trademark.aspx?bianhao=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="bianhaodaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?bianhao=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="bianhaozhengxu" style="display: none;"><span class="sp2"></span></a>
                </th>
                <th width="9%">
                    商标类别<a href="Shop_M_Trademark.aspx?shangbiaotype=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="shangbiaotypedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?shangbiaotype=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="shangbiaotypezhengxu"><span class="sp2"></span></a>
                </th>
                <th width="8%">
                    交费类型<a href="Shop_M_Trademark.aspx?jiaofei=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="jiaofeidaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?shangbiaotype=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="jiaofeizhengxu"><span class="sp2"></span></a>
                </th>
                <th width="7%">
                    注册人姓名<a href="Shop_M_Trademark.aspx?username=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="usernamedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?username=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="usernamezhengxu"><span class="sp2"></span></a>
                </th>
                <th width="10%">
                    会员编号<a href="Shop_M_Trademark.aspx?ubianhao=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="ubianhaodaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?ubianhao=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="ubianhaozhengxu"><span class="sp2"></span></a>
                </th>
                <th width="10%">
                    会员名称<a href="Shop_M_Trademark.aspx?uname=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="unamedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?uname=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="unamezhengxu"><span class="sp2"></span></a>
                </th>
                <%-- <th width="16%">
                  注册人地址<a href="Shop_M_Trademark.aspx?dizhi=desc" title="倒序" id="dizhidaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?dizhi=asc" title="正序" id="dizhizhengxu"><span class="sp2"></span></a>
                </th>--%>
                <th width="5%" style="display: none;">
                    审核状态<a href="Shop_M_Trademark.aspx?zhuangtai=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="zhuangtaidaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?zhuangtai=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序" id="zhuangtaizhengxu"><span class="sp2"></span></a>
                </th>
                <th width="6%">
                    是否缴费
                </th>
                <th width="6%">
                    添加时间<a href="Shop_M_Trademark.aspx?stime=desc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                        title="倒序" id="stimedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?stime=asc&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&sb_day=<%=ddl_sheng.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                            title="正序"><span class="sp2" id="stimezhengxu"></span></a>
                </th>
                <%--  <th width="8%">
                    生效时间<a href="Shop_M_Trademark.aspx?ptime=desc" title="倒序" id="ptimedaoxu"><span class="sp1"></span></a>&nbsp;&nbsp;<a href="Shop_M_Trademark.aspx?ptime=asc" title="正序" id="ptimezhengxu"><span class="sp2"></span></a>
                </th>--%>
                <th width="8%">
                    商标详情
                </th>
                <th width="8%">
                    文件操作
                </th>
            </tr>
            <asp:Repeater ID="rep_brand" runat="server" OnItemCommand="rep_brand_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td align="center">
                            <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
                        </td>
                        <td align="center">
                            <%#BoolFileImg(Eval("nvc_ShenQingShu")) ? "<a href='../" + Eval("nvc_ShenQingShu") + "' title='申请书'>商标申请书</a>" : "未上传"%>
                            <br />
                            <%#BoolFileImg(Eval("nvc_WeituoFile")) ? "<a href='../" + Eval("nvc_WeituoFile") + "' title='委托书'>商标委托书</a>" : "未上传"%>
                        </td>
                        <td align="center">
                            <%#ZTFileImg(Eval("i_MemberId"),Eval("nvc_ZhuTiFile"), Eval("i_Id"))%>
                            <br />
                            <%#BoolFileImg(Eval("nvc_SBFile")) ? "<a href='../" + Eval("nvc_SBFile") + "' target=\"_blank\"><img src='../" + Eval("nvc_SBFile") + "' width='60'  title='商标注册证书复印件' border='0'/></a>" : "未上传"%>
                        </td>
                        <td align="center">
                            <% if (pageupdate)
                               { %>
                            <a href="Shop_A_Trademark.aspx?id=<%#Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>">
                                <%# Eval("nvc_SBRegNum")%>
                            </a>
                            <%}
                               else
                               { %><%# Eval("nvc_SBRegNum")%><%} %>
                        </td>
                        <td align="center">
                            <%#  Eval("nvc_SBType")%>
                        </td>
                        <td align="center">
                            <%#Eval("i_JiaoFeiType").ToString() == "1" ?"自行缴费" :"委托缴费"%>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <%# Eval("nvc_SBRegName")%>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <%# Eval("nvc_UserNum")%>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <%# Eval("nvc_Name")%>
                        </td>
                        <%--                         
                          <td align="center" style="color: #FF0000"><%# Eval("nvc_SBRegAddress")%></td>  --%>
                        <td align="center" style="display: none;">
                            <asp:Button ID="Isshenghe" runat="server" CommandName='state' CommandArgument='<%# Eval("i_Id") %>'
                                CssClass='<%#Eval("i_State").ToString() == "1" ? "inputicoyesbutton" : "inputiconobutton"%>' />
                        </td>
                        <td align="center">
                            <%# Eval("i_IsPayState").ToString() == "0" ? "未处理" : Eval("i_IsPayState").ToString() == "1" ? "已提交订单" : Eval("i_IsPayState").ToString() == "2" ? "已缴费(下次缴费时间:" + Eval("nvc_SbDaoqiTime") + ")" : "无效"%>
                        </td>
                        <td align="center">
                            <%# Eval("dt_AddTime")%>
                        </td>
                        <%--   <td align="center"><%#Eval("i_State").ToString() == "1" ? Eval("dt_PassTime")+"<font style='color:red;'>(有效期"+Eval("nvc_SbDaoqiTime")+")</font>" :(Eval("i_State").ToString() == "2"?"未通过":"未审核")%></td>--%>
                        <td align="center" style="color: #FF0000">
                            <a href="Shop_M_TrademarkInfo.aspx?id=<%#Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&regtype=<%= DDl_regtype.SelectedValue %>&usertype=<%= usertype %>&state=<%=state %>&jiaofeitype=<%= ddl_jiaofei.SelectedValue %>&guoji=<%= DDL_guoji.SelectedValue %>&statime=<%=statime %>&endtime=<%=endtime %>&Orderby=<%= Hi_Orderby.Value %>&Orderby2=<%= Hi_Orderby2.Value %>&userid=<%=userid %>"
                                style="color: Red;">详情 </a>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <a href="../user_World_sbweituo.aspx?id=<%#Eval("i_Id")%>&type=2" target="_blank"
                                class="ac5t">委托书下载</a> <a href="../user_World_sb.aspx?id=<%#Eval("i_Id")%>&type=3"
                                    target="_blank" class="ac5t">申请书下载</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table cellpadding='3' cellspacing='1'>
            <tr align="left">
                <td bgcolor="#FFFFFF" height="23">
                    <input name="checkall" id="checkall" type="checkbox" onclick="SelAll(this)" />&nbsp;<%if (pagedel)
                                                                                                          {%><input type="button" id="Button1" runat="server" value="删除" onclick="xwshow()"
                                                                                                              class="button" /><%} if (pagechu)
                                                                                                          {%> <%} %>
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <table class="pager" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label
                        ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;
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
    <br />
    <%if (reptlist.Items.Count > 0)
      { %><div class="form-div">
          <table cellspacing='1' cellpadding='3'>
              <tr>
                  <th width="2%">
                  </th>
                  <th width="10%">
                      账单号
                  </th>
                  <th width="10%">
                      添加时间
                  </th>
                  <th width="10%">
                      收款时间
                  </th>
                  <th width="10%">
                      交费时间
                  </th>
                  <th width="10%">
                      发送时间
                  </th>
                  <th width="10%">
                      收据时间
                  </th>
                  <th width="10%">
                      备注1
                  </th>
                  <th width="10%">
                      备注2
                  </th>
              </tr>
              <asp:Repeater ID="reptlist" runat="server">
                  <ItemTemplate>
                      <tr>
                          <td height="26" align="center">
                          </td>
                          <td align="center">
                              <%#Eval("nvc_OrderNum")%>
                          </td>
                          <td align="center">
                              <%#Eval("dt_AddOrderTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_ShouKuanTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_JiaoFeiTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_SendInfoTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_KaiJuTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("nvc_Info1") %>
                          </td>
                          <td align="center">
                              <%#Eval("nvc_Info2") %>
                          </td>
                      </tr>
                  </ItemTemplate>
              </asp:Repeater>
          </table>
      </div>
    <%}%>
    <input type="hidden" id="HiddenDel" value="" runat="server" />
    <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="40%">
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 15%; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="40%" align="right">
                                <img alt="" width="30" src="../images/caozuo_2.jpg" />
                            </td>
                            <td width="60%" align="left" style="font-size: 14px;">
                                &nbsp;删除成功
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="45%">
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px;
        height: 100px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td width="230px">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="11" height="27" background="../images/ts_bg.jpg">
                                <img src="../images/ts1.jpg" width="11" height="27" />
                            </td>
                            <td align="left" background="../images/ts_bg.jpg" style="color: #FFF; font-size: 14px;
                                line-height: 20px; font-weight: bold;">
                                温馨提示
                            </td>
                            <td width="34" background="../images/ts_bg.jpg">
                                <img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;"
                                    onclick="divoperation(2,'1')" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece;
                    background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="20%" align="right" style="text-align: right">
                                <img alt="" width="30" src="../images/caozuo_1.jpg" />
                            </td>
                            <td width="80%" align="left" style="font-size: 14px;">
                                &nbsp;确认要进行删除操作吗？
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece;
                    background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="font-size: 14px;">
                                <a>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 200px; font-size: 16px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="25%" align="right">
                                <img alt="" width="30" src="../images/caozuo_3.jpg" />
                            </td>
                            <td width="75%" align="left" style="font-size: 14px;">
                                &nbsp;请选中您要删除的记录
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" language="javascript">
        function divoperation(ctype, divid)//操作div
        {
            if (ctype == 2) {
                document.getElementById("divbox" + divid).style.display = "none";
            }
            else {
                for (var i = 1; i < 4; i++) {
                    if (i == divid) {
                        document.getElementById("divbox" + i).style.display = "";
                    }
                    else {
                        document.getElementById("divbox" + i).style.display = "none";
                    }
                }
            }
        }
        if (document.getElementById('HiddenDel').value == "del") {
            divoperation(1, '3');
            setTimeout("divoperation(2,'3')", 1500); //1.5秒
        }
        function xwshow() {
            var inputs = document.getElementsByName("inputPageid");
            var jb = 0;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == true) {
                    jb = 1;
                }
            }
            if (jb == 0) {
                divoperation(1, '2');
                setTimeout("divoperation(2,'2')", 1500); //1.5秒
            }
            else {
                divoperation(1, '1');
            }
        }
    </script>
    <div id="div_a" runat="server">
    </div>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript">
    //    window.onload=function()
    //    {
    if (isIE) {
        window.onscroll = divIE6;
    }
    //    }
    function divIE6() {
        var top1 = document.documentElement.scrollTop;
        document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
        document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
        document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
    }
</script>
<script type="text/javascript" src="js/ss.js"></script>
<script type="text/javascript">
    function strnull(ftype, shu) {
        var isok = document.getElementById('hi_true');
        if (isok.value == "1") {
            var str_ps = document.getElementById('font_' + ftype + shu);
            var text_ps = document.getElementById('text_' + ftype + shu);
            str_ps.style.display = "none";
            text_ps.style.display = "";
        }
    }
    function textnull(ftype, shu) {
        var str_ps = document.getElementById('font_' + ftype + shu);
        var text_ps = document.getElementById('text_' + ftype + shu);
        if (!(document.activeElement.id == ('text_' + ftype + shu))) {
            str_ps.style.display = "";
            text_ps.style.display = "none";
        }
    }
    function textok(pid, ftype, shu, tvalue) {
        var str_ps = document.getElementById('font_' + ftype + shu);
        var text_ps = document.getElementById('text_' + ftype + shu);
        if (parseFloat(str_ps.innerHTML) != parseFloat(text_ps.value)) {
            var rand = Math.floor(Math.random() * 1000000);
            var cs = "PageType=UpdateProductInfo&PId=" + pid + "&UType=" + ftype + "&PValue=" + tvalue + "&n=" + rand;
            $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
                success: function (data) {
                    if (data != "NO") {
                        str_ps.innerHTML = tvalue;
                    }
                    else {
                        alert('发生意外!');
                    }
                }
            });
        }
        else {

        }
        str_ps.style.display = "";
        text_ps.style.display = "none";
    }
</script>
<script type="text/javascript" language="javascript">
    function SelAll(checkboxobj) {
        var inputs = document.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox") {
                inputs[i].checked = checkboxobj.checked;
            }
        }
    }
    function Selbox(obj) {
        var inputs = document.getElementsByName("inputPageid");
        var checkall = document.getElementById("checkall");
        var checkall2 = document.getElementById("checkall2");
        if (obj.checked == false) {
            checkall.checked = false;
            checkall2.checked = false;
        }
        else {
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == false) {
                    checkall.checked = false;
                    checkall2.checked = false;
                    return;
                }
                else {
                    checkall.checked = true;
                    checkall2.checked = true;
                }
            }
        }
    }
</script>
<script type="text/javascript">
    document.getElementById('text_pageindex').onkeydown = function (e) {
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
            document.getElementById('Button3').click();
        }
    }
</script>
