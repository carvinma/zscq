<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_PatentOrderInfo.aspx.cs" Inherits="Shop_Manage_shop_submore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <link href="../thickbox/thickbox.css" rel="stylesheet" type="text/css" />
    <script src="../thickbox/jquery-1.1.3.1.pack.js" type="text/javascript"></script>
    <script src="../thickbox/thickbox-compressed.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input type="hidden" id="Hi_HuiLv1" runat="server" value="1" />
    <input type="hidden" id="Hi_HuiLv2" runat="server" value="1" />
    <input type="hidden" runat="server" id="hi_bizhong" value="" />
    <input type="hidden" runat="server" id="hi_paybizhong" value="" />
    <input type="hidden" id="Hi_OrderId" runat="server" value="0" />
    <input type="hidden" id="Hi_CheckPower" runat="server" value="0" />
    <input type="hidden" id="Hi_OldStatus" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_PatentOrder.aspx?<%=pageurl %>">专利订单列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 专利订单信息 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th>
                    订单浏览
                </th>
            </tr>
            <tr>
                <td height="25" align="left">
                    订单号：<font color="#FF0000"><asp:Label ID="labOrderNum" runat="server"></asp:Label></font>&nbsp;&nbsp;&nbsp; <span style="line-height: 150%;">下单</span>日期：<font color="#808080"><asp:Label ID="labAddTime" runat="server"></asp:Label></font>&nbsp;&nbsp;&nbsp;会员编号：<asp:Label ID="labUserName" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;用户名：<asp:Label ID="Lal_UserName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25" align="center">
                    <table border="0" cellpadding="0" cellspacing="0" width="99%" height="100%">
                        <tr>
                            <td width="53%" style="text-align: left">
                                订单状态：<asp:Label ID="Lb_OrderStatus" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="25">
                    已支付金额：<asp:Label ID="Lal_CouponMoney" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_1" runat="server" visible="false">
                <td height="25">
                    发票抬头：<asp:Label ID="Lal_TaiTou" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_2" runat="server" visible="false">
                <td height="25">
                    发票金额：<asp:Label ID="Lal_InvoiceMoney" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_3" runat="server" visible="false">
                <td height="25">
                    邮寄地址：<asp:Label ID="Lal_PostAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25">
                    支付时间：<asp:Label ID="Lal_PayMoneyTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25">
                    支付方式：<asp:Label ID="Lal_PayType" runat="server"></asp:Label>
                </td>
            </tr>
            <%-- 配送费：<asp:Label ID="Lal_PsMoney" runat="server"></asp:Label>--%>
            <tr valign="top">
                <td height="40" align="center">
                    <div class="list-div">
                        <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th colspan="9">
                                    专利清单
                                </th>
                            </tr>
                            <tr>
                                <td height="35" align="center" width="15%">
                                    专利号
                                </td>
                                <td align="center" width="15%">
                                    专利名称
                                </td>
                                <td align="center" width="10%">
                                    授权国
                                </td>
                                <td align="center" width="10%">
                                    缴费年度
                                </td>
                                <td align="center" width="10%">
                                    缴费期限
                                </td>
                                <td align="center" width="10%">
                                    金额
                                </td>
                                <td align="center" width="10%">
                                    币种
                                </td>
                                <td align="center" width="10%">
                                    案卷号
                                </td>
                                <td align="center" width="10%">
                                    详情
                                </td>
                            </tr>
                            <asp:Repeater runat="server" ID="Rtp_PatentList">
                                <ItemTemplate>
                                    <tr>
                                        <td height="32" align="center">
                                            <%#Eval("nvc_PatentNumber")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("nvc_PatentName")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("nvc_PatentShouQuanGuo")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("nvc_Year")%>
                                        </td>
                                        <td align="center">
                                            <%#Convert.ToDateTime(Eval("dt_PatentJiaoFeeQiXian")).ToShortDateString()%>
                                        </td>
                                        <td align="center">
                                            <a href="../Box.aspx?height=100&width=610&pId=<%#Eval("i_Id")%>" class="thickbox">
                                                <%#Eval("dm_TotalMoney1")%></a>
                                        </td>
                                        <td align="center">
                                            <%#Eval("nvc_BiZhong1")%>
                                        </td>
                                        <td align="center">
                                            <%#Eval("nvc_AnJuanNum")%>
                                        </td>
                                        <td align="center">
                                            <a href="Shop_A_PatentInfo.aspx?id=<%#Eval("i_PatentId")%>" class="ac5t">查看</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="list-div" id="Div1">
                        <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th>
                                    费用信息
                                </th>
                            </tr>
                            <tr>
                                <td align="right">
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
                                                                                    <asp:Label ID="Lal_GuanFei" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_GuanFei" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
                                                                                </td>
                                                                                <td width="30">
                                                                                </td>
                                                                                <td style="width: 100px;">
                                                                                </td>
                                                                            </tr>
                                                                            <tr align="left">
                                                                                <td width="200" align="right">
                                                                                    滞纳金：
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
                                                                                    代理费：
                                                                                </td>
                                                                                <td width="110">
                                                                                    <asp:Label ID="Lal_DaiLiFei" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_DaiLiFei" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
                                                                                </td>
                                                                                <td width="30">
                                                                                </td>
                                                                                <td style="width: 100px;">
                                                                                </td>
                                                                            </tr>
                                                                            <tr align="left">
                                                                                <td width="200" align="right">
                                                                                    超项费：
                                                                                </td>
                                                                                <td width="110">
                                                                                    <asp:Label ID="Lal_ChangXiangFei" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_ChangXiangFei" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
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
                                                                                    小计：
                                                                                </td>
                                                                                <td width="30">
                                                                                    <asp:Label ID="Lal_BiZhong" runat="server" CssClass="inputs60text" ForeColor="Red"></asp:Label>
                                                                                </td>
                                                                                <td align="left" style="width: 100px;">
                                                                                    <asp:Label ID="Lal_TotalMoney" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
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
                                                                                    <asp:Label ID="Lal_YouHui" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_YouHui" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
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
                                                                                    <asp:Label ID="Lal_ShouXuFei" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_ShouXuFei" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
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
                                                                                    <asp:Label ID="Lal_PeiSongFee" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_PeiSongFee" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
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
                                                                                <td width="110">
                                                                                    <asp:Label ID="lb_fapiao" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="inputs60text" Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
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
                                                                                <td width="30">
                                                                                    <asp:Label ID="Lal_BiZhong2" runat="server" CssClass="inputs60text" ForeColor="Red"></asp:Label>
                                                                                </td>
                                                                                <td width="100" align="left">
                                                                                    <asp:Label ID="Lal_TotalMoneys" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                                                    <asp:TextBox ID="Txt_TotalMoney" runat="server" Visible="false" CssClass="inputs60text"></asp:TextBox>
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
                                    <div style="margin-right: 50px; line-height: 30px;">
                                        <asp:Button ID="Btn_EditFee" runat="server" Text="修改费用" CssClass="button" OnClick="Btn_EditFee_Click" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr id="tr_caozuo" runat="server">
                <td height="25">
                    <div class="list-div">
                        <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th colspan="2">
                                    订单操作
                                </th>
                            </tr>
                            <tr>
                                <td align="right">
                                    <strong>操作备注：</strong>
                                </td>
                                <td>
                                    <textarea id="area_beizhu" runat="server" cols="50" rows="3" class="input"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td width="100" align="right">
                                    <strong>可执行操作：</strong>
                                </td>
                                <td>
                                    <asp:Button ID="Btn_2" runat="server" Text="已提交订单,接收部分汇款,缴费中" CssClass="button" OnClick="btnOperate_Click" CommandName="2" OnClientClick="return scheck()" />
                                    <asp:Button ID="Btn_3" runat="server" Text="已提交订单,接收部分汇款,未缴费" CssClass="button" OnClick="btnOperate_Click" CommandName="3" OnClientClick="return scheck()" />
                                    <asp:Button ID="Btn_4" runat="server" Text="已提交订单,金额已付,缴费中" CssClass="button" OnClick="btnOperate_Click" CommandName="4" OnClientClick="return scheck()" />
                                    <br />
                                    <asp:Button ID="Btn_5" runat="server" Text="缴费成功,部分金额未付" CssClass="button" OnClick="btnOperate_Click" CommandName="5" OnClientClick="return scheck()" />
                                    <asp:Button ID="Btn_6" runat="server" Text="缴费成功,发票已发出" CssClass="button" OnClick="btnOperate_Click" CommandName="6" OnClientClick="return scheck()" />
                                    <asp:Button ID="Btn_7" runat="server" Text="缴费成功" CssClass="button" OnClick="btnOperate_Click" CommandName="7" OnClientClick="return scheck()" />
                                    <asp:Button ID="Btn_8" runat="server" Text="取消缴费" CssClass="button" OnClick="btnOperate_Click" CommandName="8" OnClientClick="return scheck()" />
                                    <asp:Button ID="Btn_9" runat="server" Text="无效订单" CssClass="button" OnClick="btnOperate_Click" CommandName="9" OnClientClick="return scheck()" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="list-div">
                        <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="20%">
                                    身份/操作者
                                </th>
                                <th width="20%">
                                    操作时间
                                </th>
                                <th width="20%">
                                    订单状态
                                </th>
                                <th width="40%">
                                    备注
                                </th>
                            </tr>
                            <asp:Repeater runat="server" ID="repOperateDetail">
                                <ItemTemplate>
                                    <tr align="center">
                                        <td height="26">
                                            (管理员)<%#Eval("nvc_Name")%>
                                        </td>
                                        <td>
                                            <%#Eval("dt_AddTime")%>
                                        </td>
                                        <td>
                                            <%#Eval("nvc_Type")%>
                                        </td>
                                        <td>
                                            <%#Eval("nvc_Remark")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <%if (pagedel)
                      {%>
                    <asp:Button ID="lbtnDelete" runat="server" OnClientClick="return confirm('您确定进行删除操作吗？')" OnClick="lbtnDelete_Click" Text="删除订单" CssClass="button"></asp:Button>
                    <%} %>
                    <input name="Submit8" type="button" value="返回" onclick="javascript:window.location='Shop_M_PatentOrder.aspx?<%=pageurl %>';" class="button" />
                    <%--<input name="Submit8" type="button" value="打印订单" onclick="printPage();"
                        class="button" />
                    <script type="text/javascript">
                        function printPage() {
                            var newWin = window.open();
                            var titleHTML = document.getElementById("pr_table").innerHTML;
                            newWin.document.write(titleHTML);
                            newWin.document.location.reload();
                            newWin.print();
                        } 
                    </script>--%>
                </td>
            </tr>
        </table>
    </div>
    <script src="js/hoot.js" type="text/javascript"></script>
    <div id="daochu" runat="server">
    </div>
    <script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server">
    </div>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript" language="javascript">
    function scheck() {
        if (!confirm('确认进行该操作吗？')) return false;
    }

    function GetTotalFee(k) {
        var a = $('#Txt_GuanFei').val();
        var b = $('#Txt_DaiLiFei').val();
        var c = $('#Txt_ShouXuFei').val();
        var d = $('#Txt_ChangXiangFei').val();
        var e = $('#Txt_PeiSongFee').val();
        var t = parseFloat(a) + parseFloat(b) + parseFloat(c) + parseFloat(d) + parseFloat(e);
        $('#Txt_TotalMoney').attr('value', t);
    }
</script>
