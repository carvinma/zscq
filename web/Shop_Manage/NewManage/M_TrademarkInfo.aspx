<%@ Page Language="C#" AutoEventWireup="true" CodeFile="M_TrademarkInfo.aspx.cs"
    Inherits="M_TrademarkInfo" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../js/jquery-1.8.0.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="../../js/ShowKeyword.js"></script>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/trademark.css" />
    <script type="text/javascript">
        function IsDigit() {
            return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
        }     
    </script>
    <script src="../../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/vcom.js"></script>
    <style type="text/css">
        .alertfont
        {
            border: solid 1px #fe8686;
            padding: 1px;
            background: #dfeef5;
            color: #fe4343;
        }
        .alertfont img
        {
            margin-bottom: -3px;
        }
    </style>
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
        .uploaddiv
        {
            float: left;
            width: 82px;
            position: relative;
            text-align: center;
            border: solid 1px green;
        }
        .uploaddiv:hover
        {
            color: green;
        }
        .upload
        {
            cursor: pointer;
            border: none;
            width: 70px;
            height: 22px;
            filter: alpha(opacity=0);
            opacity: 0.0;
            -moz-opacity: 0.0;
            position: absolute;
            left: 0;
            top: 0;
        }
    </style>
    <style type="text/css">
        .checkprodiv
        {
            position: fixed;
            _position: absolute;
            top: 40px;
            height: 600px;
            width: 100%;
            z-index: 1000;
        }
        .inputs110text
        {
            width: 110px;
            height: 18px;
            line-height: 18px;
        }
        .inputs110text:hover
        {
            width: 110px;
            height: 18px;
            line-height: 18px;
            border: solid 2px #eb10a3d;
        }
        
        
        .suojudiv
        {
            width: 210px;
            float: left;
            padding: 5px;
            border: solid 1px #ffffff;
        }
        .suojudiv:hover
        {
            border: solid 1px #aaaaaa;
        }
        .suojudiv div
        {
            float: left;
            margin-left: 5px;
        }
        .suojudiv div.name
        {
            width: 110px;
            height: 45px;
            overflow: hidden;
        }
        #msg_win
        {
            background: #EAEAEA;
            width: 450px;
            position: absolute;
            right: 0;
            font-size: 12px;
            font-family: Arial;
            margin: 0px;
            display: none;
            overflow: hidden;
            z-index: 99;
        }
        #msg_win .icos
        {
            position: absolute;
            top: 2px;
            top: 0px;
            right: 2px;
            z-index: 9;
        }
        .icos a
        {
            float: left;
            color: #833B02;
            margin: 1px;
            text-align: center;
            font-weight: bold;
            width: 14px;
            height: 22px;
            line-height: 22px;
            padding: 1px;
            text-decoration: none;
            font-family: webdings;
        }
        .icos a:hover
        {
            color: #fff;
        }
        #msg_title
        {
            background: #D10003;
            border-bottom: 1px solid #A67901;
            border-top: 1px solid #FFF;
            border-left: 1px solid #FFF;
            color: #000;
            height: 25px;
            line-height: 25px;
            text-indent: 5px;
        }
        #msg_content
        {
            margin: 5px;
            margin-right: 0;
            width: 440px;
            height: auto;
            overflow: hidden;
            border: 1px solid #A67901;
        }
    </style>
    <script language="javascript" type="text/javascript">
        document.onkeydown = function (e)                //网页内按下回车触发
        {
            var theEvent = window.event || e;
            var code = theEvent.keyCode || theEvent.which;
            if (code == 13) {
                if (document.getElementById("checkproduct").style.display == '') {
                    document.getElementById("bt_search").click(); //服务器控件Submit1点击事件被触发
                    return false;
                }
            }
        }
    </script>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.ui-tabs-nav > li > a').click(function (e) { //Tab切换
                if (e.target == this) {
                    var tabs = $(this).parent().parent().children('li');
                    var panels = $(this).parent().parent().parent().children('.ui-tabs-panel');
                    var index = $.inArray(this, $(this).parent().parent().find('a'));
                    if (panels.eq(index)[0]) {
                        tabs.removeClass('ui-tabs-selected').eq(index).addClass('ui-tabs-selected');
                        panels.addClass('ui-tabs-hide').eq(index).removeClass('ui-tabs-hide');
                    }
                    if (index == 2) {
                        var ifpanel = panels.eq(index);
                        if (ifpanel.attr('url') != undefined && ifpanel.find('frame').length == 0) {
                            ifpanel.html('<iframe src="' + ifpanel.attr('url') + '" scrolling="no" frameborder="0" width="100%" onload="IFrameReSize(this);"></iframe>');
                            ifpanel.removeAttr('src');
                        }
                    }
                }
            });
        });
  
    </script>
</head>
<body>
    <form runat="server">
    <%-- 弹出框 START--%>
    <div id="msg_win" style="display: block; top: 490px; visibility: visible; opacity: 1;">
        <div class="icos">
            <a id="msg_min" title="最小化" href="javascript:void 0">_</a> <a id="msg_close" title="关闭"
                href="javascript:void 0">×</a>
        </div>
        <div id="msg_title">
            会员信息及费用情况</div>
        <div id="msg_content">
            <div class="list-div">
                <table cellspacing='1' cellpadding='3'>
                    <tr>
                        <td colspan="2" align="center">
                            <strong>费用信息</strong>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            会员编号：
                        </td>
                        <td align="left">
                            <asp:Label ID="lb_usernum" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            会员名：
                        </td>
                        <td align="left">
                            <asp:Label ID="lb_username" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 200px;">
                            联系人姓名：
                        </td>
                        <td>
                            <%= Name%>
                        </td>
                    </tr>
                    <%if (IdCard != "")
                      { %>
                    <tr>
                        <td align="right">
                            身份证号码：
                        </td>
                        <td>
                            <%= IdCard%>
                        </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td align="right">
                            联系人电话：
                        </td>
                        <td>
                            <%=Tel %>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            联系人传真：
                        </td>
                        <td>
                            <%=ChuanZhen %>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            联系人地址：
                        </td>
                        <td>
                            <%= Address%>
                        </td>
                    </tr>
                    <tr id="tr_jno" runat="server" visible="false">
                        <td align="right">
                            联系人邮编：
                        </td>
                        <td>
                            <%=YouBian %>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            QQ：
                        </td>
                        <td>
                            <%=QQ %>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right" valign="top">
                            预付款:
                        </td>
                        <td width="30%">
                            <asp:Literal ID="Ltl_VipYuFuKuan" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right" valign="top">
                            余额:
                        </td>
                        <td width="30%">
                            <asp:Literal ID="Ltl_VipYuE" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right" valign="top">
                            欠费:
                        </td>
                        <td width="30%">
                            <asp:Literal ID="Ltl_VipQianFei" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right" valign="top">
                            信用等级:
                        </td>
                        <td width="30%">
                            <asp:Image ID="Ltl_VipXinYong" runat="server" Width="50" Height="50" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%-- 弹出框 END--%>
    <input type="hidden" runat="server" id="HI_ATT" value="" />
    <input type="hidden" id="Hi_TId" name="Hi_TId" runat="server" value="0" />
    <input type="hidden" id="Hi_Matching" runat="server" value="" />
    <input type="hidden" id="Hi_Guige" runat="server" value="" />
    <input type="hidden" id="Hi_ffTId" name="Hi_ffTId" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="L_M_Trademark.aspx">商标列表</a></span><span class="action-span1"><a
            href="../Shop_Index_Main.aspx">管理中心-</a> </span><span id="Span1" class="action-span1">
                商标基本信息</span>
    </h1>
    <script type="text/javascript" src="../js/fucties.js"></script>
    <script type="text/javascript" src="../js/listtb.js"></script>
    <div class="list-div" id="listDiv">
        <div class="infoMain">
            <ul class="ui-tabs-nav clearfix">
                <li class="ui-tabs-selected"><a href="javascript:;">商标信息</a></li>
                <li><a href="javascript:;">商标状态</a></li>
                <li><a href="javascript:;">HQHT留言</a></li>
            </ul>
            <div class="ui-tabs-panel">
                <div class="content reset">
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="115" align="center" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0" id="printTbl">
                                    <tr>
                                        <td>
                                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="639" height="20" align="left" valign="top">
                                                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <th width="10" height="20">
                                                                    &nbsp;
                                                                </th>
                                                                <th width="98" align="center" class="font12bt">
                                                                    申请人信息
                                                                </th>
                                                                <th width="6">
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="18" align="left">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top">
                                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>申请人名称：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.ApplyName %>
                                                    </td>
                                                </tr>
                                                <% if (model.ApplyType == 1)
                                                   { %>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>身份证件名称：</strong>
                                                    </td>
                                                    <td align="left">
                                                        身份证
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>身份证件号码：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.CardNo%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>身份证明文件（扫描件）：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.CardNoPDF%>
                                                    </td>
                                                </tr>
                                                <%} %>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>营业执照副本（扫描件）：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.Businesslicense %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>申请人行政区划：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=division%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>申请人地址：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.Address%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>邮政编码：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.PostCode%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>联系人：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.ContactPerson%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="32" align="right">
                                                        <strong>联系电话：</strong>
                                                    </td>
                                                    <td align="left">
                                                        <%=model.Phone%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="18">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                        <table width="186" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <th width="10" height="20">
                                                                    &nbsp;
                                                                </th>
                                                                <th width="160" align="center" class="font12bt">
                                                                    商标信息（第一部分）
                                                                </th>
                                                                <th width="6">
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="18" align="left">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="115" align="left" valign="top">
                                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>案件号：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.CaseNo%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>申请号：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.RegisteredNo%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>商标类别：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.TrademarkType %>
                                                        &nbsp;<%--<a href="javascript:void(0)" onclick="editTradeMarkshowGoods();">商品详情</a>--%>
                                                    </td>
                                                </tr>
                                                <tr id="printGoods" style="display: none">
                                                    <td width="260" height="32" align="right">
                                                        <strong>商品详情：</strong>
                                                    </td>
                                                    <td>
                                                        <table id="tbl_goods" width="429" border="0" cellspacing="0" cellpadding="0" bgcolor="#d0d0d0">
                                                            <tr>
                                                                <td>
                                                                    <table width="429" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0" class="table-b"
                                                                        id="th_table">
                                                                        <tr id="th_box">
                                                                            <td width="50" height="20" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                                序号
                                                                            </td>
                                                                            <td width="50" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                                类别
                                                                            </td>
                                                                            <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                                类似群
                                                                            </td>
                                                                            <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                                商品编码
                                                                            </td>
                                                                            <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                                商品名称
                                                                            </td>
                                                                        </tr>
                                                                        <asp:Repeater ID="Rpt_goods" runat="server">
                                                                            <ItemTemplate>
                                                                                <tr classname="arr_goods" name="arr_goods[]" val="<%# Eval("id")%>" id="arr_goods<%#goodsItemCount- Container.ItemIndex%>">
                                                                                    <td height="25" align="center" bgcolor="#FFFFFF" id="4<%# goodsItemCount- Container.ItemIndex%>">
                                                                                        <%#Container.ItemIndex+1%>
                                                                                    </td>
                                                                                    <td align="center" bgcolor="#FFFFFF" id="3<%# goodsItemCount- Container.ItemIndex%>">
                                                                                        <input type="hidden" classname="hid_classsort" name="hid_sort[]" value='<%# Eval("MainCategoryCode")%>'><%# Eval("MainCategoryCode")%>
                                                                                    </td>
                                                                                    <td align="center" bgcolor="#FFFFFF" id="2<%# goodsItemCount- Container.ItemIndex%>">
                                                                                        <input type="hidden" name="hid_group[]" value='<%# Eval("DetailCategoryCode")%>'><%# Eval("DetailCategoryCode")%>
                                                                                    </td>
                                                                                    <td align="center" bgcolor="#FFFFFF" id="1<%# goodsItemCount- Container.ItemIndex%>">
                                                                                        <input type="hidden" name="hid_goods[]" value='<%# Eval("GoodsCode")%>'><%# Eval("GoodsCode")%>
                                                                                    </td>
                                                                                    <td align="center" bgcolor="#FFFFFF" id="0<%# goodsItemCount- Container.ItemIndex%>">
                                                                                        <input type="hidden" name="hid_goodsname[]" classname="<%#Eval("MainCategoryCode")%>"
                                                                                            value='<%#Eval("GoodsRemark")%>'><%# Eval("GoodsRemark")%>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>商标图样：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.TrademarkPattern1%>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <img alt="" height="150px" width="150px" src="<%=model.TrademarkPattern2%>" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>商标说明：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.TrademarkRemark %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>商标描述类型：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.TrademarkDescribeType == 0 ? "文字" : (model.TrademarkDescribeType == 1 ? "图形" : "文字与图形")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" height="32" align="right">
                                                        <strong>商标描述：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.TrademarkDescribe%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" align="right" height="32">
                                                        <strong>是否三维商标：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.Is3D==true ? "是":"否" %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" align="right" height="32">
                                                        <strong>是否颜色组合商标： </strong>
                                                    </td>
                                                    <td>
                                                        <%=model.IsColor==true ? "是":"否" %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="260" align="right" height="32">
                                                        <strong>是否声音商标：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.IsSound==true ? "是":"否" %>
                                                    </td>
                                                </tr>
                                                <% if (model.IsSound == true)
                                                   { %>
                                                <tr>
                                                    <td width="260" align="right" height="32">
                                                        <strong>声音文件：</strong>
                                                    </td>
                                                    <td>
                                                        <%=model.SoundFile%>
                                                    </td>
                                                </tr>
                                                <%} %>
                                                <tr>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                                <tr>
                                                    <td width="639" height="20" align="left" valign="top">
                                                        <table width="186" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <th width="10" height="20">
                                                                    &nbsp;
                                                                </th>
                                                                <th width="160" align="center" class="font12bt">
                                                                    商标信息（第二部分）
                                                                </th>
                                                                <th width="6">
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="18" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="115" align="left" valign="top">
                                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    <strong>商标申请日：</strong>
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <%= string.Format("{0:yyyy-MM-dd}", model.ApplyDate)%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    <strong>初审公告日：</strong>
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <%= string.Format("{0:yyyy-MM-dd}", model.PublicPreliminaryDate)%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    <strong>注册公告日：</strong>
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <%= string.Format("{0:yyyy-MM-dd}", model.RegNoticeDate)%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <table width="429" border="0" cellspacing="1" cellpadding="1" class="table-b" id="Table3">
                                                                        <%-- <tr id="Tr1">
                                                             <td width="50" height="20" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">序号</td>
                                                              <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</td>
                                                              <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类似群</td>
                                                            </tr>--%>
                                                                        <asp:Repeater ID="RptRenewalDate" runat="server">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        <%# string.Format("{0:yyyy年MM月dd日}",Eval("RenewalDate"))%>之前是否续展完成
                                                                                        <%# bool.Parse(Eval("IsFinish").ToString())==true ? "是":"否"%>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    <strong>续展期限日：</strong>
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <%= string.Format("{0:yyyy-MM-dd}", model.RenewalDate)%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    <strong>所剩天数：</strong>
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <%=model.RestDays%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right" valign="middle">
                                                                    <b><span>最近状态：</span></b>
                                                                </td>
                                                                <td width="429" valign="middle">
                                                                    <%=status%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="639" height="20" align="left" valign="top">
                                                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <th width="10" height="20">
                                                                    &nbsp;
                                                                </th>
                                                                <th width="98" align="center" class="font12bt">
                                                                    其它信息
                                                                </th>
                                                                <th width="6">
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="18" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="115" align="left" valign="top">
                                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>商标注册申请书： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.ApplyUpBook%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>商标申请委托书： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.AgentUpBook%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>商标续展申请书： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.RenewalApplyUpBook%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>商标续展委托书： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.RenewalAgentUpBook%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="32" align="right">
                                                                    <strong>备注：</strong>
                                                                </td>
                                                                <td align="left">
                                                                    <div id="test" style="line-height: 80px; vertical-align: middle; width: 300px; height: 80px;
                                                                        word-wrap: break-word; overflow: auto;">
                                                                        <%=model.Remark%>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="639" height="20" align="left" valign="top">
                                                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <th width="10" height="20">
                                                                    &nbsp;
                                                                </th>
                                                                <th width="98" align="center" class="font12bt">
                                                                    费用信息
                                                                </th>
                                                                <th width="6">
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="18" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="115" align="left" valign="top">
                                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>商标局规费： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.TrademarkMoney%>元
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>代理费： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.TrademarkAgencyFee%>元
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="260" height="32" align="right">
                                                                    <strong>滞纳金： </strong>
                                                                </td>
                                                                <td width="429" align="left">
                                                                    <%=model.TrademarkLateFee%>元
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                      <div class="list-div" id="Div1">
        <table cellspacing='1' cellpadding='3' id="tblData">
            <tr>
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
                    缴费时间
                </th>
                <th width="10%">
                    发送时间
                </th>
                <th width="10%">
                    收据时间
                </th>
                <th width="12%">
                    备注1
                </th>
                <th width="12%">
                    备注2
                </th>
            </tr>
            <asp:Repeater ID="reptlist" runat="server">
                <ItemTemplate>
                    <tr>
                        <td align="center">
                            <%#Eval("nvc_OrderNum")%>
                        </td>
                        <td align="center">
                            <%# string.Format("{0:yyyy-MM-dd}",Eval("dt_AddOrderTime"))%>
                        </td>
                        <td align="center">
                            <%# string.Format("{0:yyyy-MM-dd}", Eval("dt_ShouKuanTime"))%>
                        </td>
                        <td align="center">
                            <%# string.Format("{0:yyyy-MM-dd}", Eval("dt_JiaoFeiTime"))%>
                        </td>
                        <td align="center">
                            <%# string.Format("{0:yyyy-MM-dd}", Eval("dt_SendInfoTime"))%>
                        </td>
                        <td align="center">
                            <%# string.Format("{0:yyyy-MM-dd}", Eval("dt_KaiJuTime"))%>
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
                </div>
            </div>
            <div class="ui-tabs-panel ui-tabs-hide">
                <table cellspacing='1' cellpadding='3' id="Table1" width="669px">
                    <asp:Repeater ID="RptAdminStatus" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td width="260" align="right">
                                    <strong>
                                        <%# Container.ItemIndex + 1%>、<%# Eval("StatusName")%>：<strong>
                                </td>
                                <td align="left">
                                    <%# string.Format("{0:yyyy-MM-dd}", Eval("TradeMarkDate"))%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="ui-tabs-panel ui-tabs-hide">
                <table cellspacing='1' cellpadding='3' id="Table2" width="669px">
                    <asp:Repeater ID="RptMessage" runat="server">
                        <ItemTemplate>
                            <table width="689" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="21" align="center" valign="top" style="line-height: 21px;">
                                        <table width="630" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="15" height="15">
                                                    &nbsp;
                                                </td>
                                                <td width="808" align="left" valign="top">
                                                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="807" height="28" align="left">
                                                                <strong>
                                                                    <%# string.Format("{0:yyyy-MM-dd}",Eval("AddTime"))%></strong>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="807" height="28" align="left" valign="top" style="line-height: 21px;">
                                                                <div style="width: 689px; word-wrap: break-word; overflow: auto;">
                                                                    <%#Eval("Message")%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="28">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="26" align="left" style="background-image: url(images/faq2.gif);">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
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
    </form>
</body>
</html>
<script type="text/javascript">
    function bb() {
        var lname = document.getElementById('btnAdd');
        lname.style.display = "block";
    }
    function checknull() {
        var lname = document.getElementById('btnAdd');
        lname.style.display = "block";
    }
    var s = "";
    function dalclick() {
        var datanum = document.getElementsByName('txt_orderNum');
        var addtime = document.getElementsByName('dt_addtime');
        var shoutime = document.getElementsByName('dt_shoutime');
        var jiaofeitime = document.getElementsByName('dt_jiaofeitime');
        var sendtime = document.getElementsByName('dt_sendtime');
        var shoujutime = document.getElementsByName('dt_shoujutime');
        var info1 = document.getElementsByName('t_info1');
        var info2 = document.getElementsByName('t_info2');
        var hi = document.getElementById('HI_ATT');
        for (var i = 0; i < datanum.length; i++) {
            if (datanum[i].value == "") {
                alert("请填写账单号");
                return false;
            }
            else {
                // alert(i);
                $.ajax({
                    type: "POST",
                    url: "Shop_A_DataOrder.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=SbDataNum&data=" + datanum[i].value,
                    success: function (msg) {
                        if (msg == "0") {
                            alert("账单号重复！");
                            return false;
                        }
                    }
                });
            }
            if (addtime[i].value == "") {
                alert("请填写添加时间");
                return false;
            }
            if (shoutime[i].value == "") {
                alert("请填写收款时间");
                return false;
            }
            if (jiaofeitime[i].value == "") {
                alert("请填写缴费时间");
                return false;
            }
            if (sendtime[i].value == "") {
                alert("请填写发送时间");
                return false;
            }
            if (shoujutime[i].value == "") {
                alert("请填写收据时间");
                return false;
            }
            else {
                if (datanum[i].value != "") {
                    s += datanum[i].value + "_" + addtime[i].value + "_" + shoutime[i].value + "_" + jiaofeitime[i].value + "_" + sendtime[i].value + "_" + shoujutime[i].value + "_" + info1[i].value + "_" + info2[i].value + "|";
                }
            }
        }
        hi.value = s;
    }


</script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#btnAdd").click(function () {
            if (dalclick()) {
                var num = $("#hidNum").val(); //
                num = parseInt(num);
                num++; //点击自加
                $("#hidNum").val(num); //重新赋值          
                $("#tRow0").clone(true).attr("id", "tRow" + num).appendTo("#tblData"); //clone tr 并重新给定ID,装到table
                $("#tRow" + num + " td").each(function () {//循环克隆的新行里面的td
                    $(this).find("input[type='text']").val(""); //清空克隆行的数据
                });
            }
        });

    });
</script>
<script type="text/javascript">
    if (isIE) {
        window.onscroll = divIE6;
    }
    function divIE6() {
        var top1 = document.documentElement.scrollTop;
        document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
        document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
        document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
    }
</script>
<script type="text/javascript">
    function SelAll() {
        var inputs = document.getElementsByTagName("input");
        var checkall = document.getElementById("checkall");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox") {
                inputs[i].checked = checkall.checked;
            }
        }
    }
    function Selbox(obj) {
        var inputs = document.getElementsByName("inputPageid");
        var checkall = document.getElementById("checkall");
        if (obj.checked == false) {
            checkall.checked = false;
        }
        else {
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == false) {
                    checkall.checked = false;
                    return;
                }
                else {
                    checkall.checked = true;
                }
            }
        }
    }

    function Edit(obj) {
        var data1 = $("#txt_orderNum" + obj).val();
        var data2 = $("#dt_addtime" + obj).val();
        var data3 = $("#dt_shoutime" + obj).val();
        var data4 = $("#dt_jiaofeitime" + obj).val();
        var data5 = $("#dt_sendtime" + obj).val();
        var data6 = $("#dt_shoujutime" + obj).val();
        var data7 = $("#t_info1" + obj).val();
        var data8 = $("#t_info2" + obj).val();
        var datastr = data1 + "|" + data2 + "|" + data3 + "|" + data4 + "|" + data5 + "|" + data6 + "|" + data7 + "|" + data8;
        $.ajax({
            type: "POST",
            url: "Shop_A_DataOrder.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=dataOrder&id=" + obj + "&data=" + datastr,
            success: function (msg) {
                //alert(msg);
                if (msg == "ok") {
                    alert("修改成功");
                }
                if (msg == "0") {
                    alert("账单号重复！");
                }
            }
        });
    }
</script>
<script language="javascript">
    var Message = {
        set: function () {//最小化与恢复状态切换
            var set = this.minbtn.status == 1 ? [0, 1, 'block', this.char[0], '最小化'] : [1, 0, 'none', this.char[1], '展开'];
            this.minbtn.status = set[0];
            this.win.style.borderBottomWidth = set[1];
            this.content.style.display = set[2];
            this.minbtn.innerHTML = set[3]
            this.minbtn.title = set[4];
            this.win.style.top = this.getY().top;
        },
        close: function () {//关闭
            this.win.style.display = 'none';
            window.onscroll = null;
        },
        setOpacity: function (x) {//设置透明度
            var v = x >= 100 ? '' : 'Alpha(opacity=' + x + ')';
            this.win.style.visibility = x <= 0 ? 'hidden' : 'visible'; //IE有绝对或相对定位内容不随父透明度变化的bug
            this.win.style.filter = v;
            this.win.style.opacity = x / 100;
        },
        show: function () {//渐显
            clearInterval(this.timer2);
            var me = this, fx = this.fx(0, 100, 0.1), t = 0;
            this.timer2 = setInterval(function () {
                t = fx();
                me.setOpacity(t[0]);
                if (t[1] == 0) { clearInterval(me.timer2) }
            }, 10);
        },
        fx: function (a, b, c) {//缓冲计算
            var cMath = Math[(a - b) > 0 ? "floor" : "ceil"], c = c || 0.1;
            return function () { return [a += cMath((b - a) * c), a - b] }
        },
        getY: function () {//计算移动坐标
            var d = document, b = document.body, e = document.documentElement;
            var s = Math.max(b.scrollTop, e.scrollTop);
            var h = /BackCompat/i.test(document.compatMode) ? b.clientHeight : e.clientHeight;
            var h2 = this.win.offsetHeight;
            //alert(s + "--" + h + "--" + h2);

            //return { foot: s + h + h2 + 2 + 'px', top: s + h - h2 - 2 + 'px' }
            return { foot: s + h2 + 'px', top: s + 'px' }

        },
        moveTo: function (y) {//移动动画
            clearInterval(this.timer);
            var me = this, a = parseInt(this.win.style.top) || 0;
            var fx = this.fx(a, parseInt(y));
            var t = 0;
            this.timer = setInterval(function () {
                t = fx();
                me.win.style.top = t[0] + 'px';
                if (t[1] == 0) {
                    clearInterval(me.timer);
                    me.bind();
                }
            }, 10);
        },
        bind: function () {//绑定窗口滚动条与大小变化事件
            var me = this, st, rt;
            window.onscroll = function () {
                clearTimeout(st);
                clearTimeout(me.timer2);
                me.setOpacity(0);
                st = setTimeout(function () {
                    me.win.style.top = me.getY().top;
                    me.show();
                }, 600);
            };
            window.onresize = function () {
                clearTimeout(rt);
                rt = setTimeout(function () { me.win.style.top = me.getY().top }, 100);
            }
        },
        init: function () {//创建HTML
            function $(id) { return document.getElementById(id) };
            this.win = $('msg_win');
            var set = { minbtn: 'msg_min', closebtn: 'msg_close', title: 'msg_title', content: 'msg_content' };
            for (var Id in set) { this[Id] = $(set[Id]) };
            var me = this;
            this.minbtn.onclick = function () { me.set(); this.blur() };
            this.closebtn.onclick = function () { me.close() };
            this.char = navigator.userAgent.toLowerCase().indexOf('firefox') + 1 ? ['_', '::', '×'] : ['0', '2', 'r']; //FF不支持webdings字体
            this.minbtn.innerHTML = this.char[0];
            this.closebtn.innerHTML = this.char[2];
            setTimeout(function () {//初始化最先位置
                me.win.style.display = 'block';
                me.win.style.top = me.getY().foot;
                me.moveTo(me.getY().top);
            }, 0);
            return this;
        }
    };
    Message.init();
</script>
