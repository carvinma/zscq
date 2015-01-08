<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Q_TrademarkRenewalOrderInfo.aspx.cs" Inherits="Q_TrademarkRenewalOrderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="../js/Calendar.js"></script>
       <script type="text/javascript">
           $(document).ready(function () {
               var orderNo = $("#labOrderNum").text();
               if (orderNo != null && orderNo != "") {
                   $("#downAll").attr("href", "File_Zscq/AccountPDF/TotalBill" + orderNo + ".pdf");
                   $("#downDetail").attr("href", "File_Zscq/AccountPDF/SeparateBill" + orderNo + ".pdf");
               }
           });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="hidAddressIsOpen" runat="server" Value="false" />
    <input type="hidden" id="Hi_OrderId" runat="server" value="0" />
    <input type="hidden" id="Hi_CheckPower" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="Q_TrademarkRenewalOrder.aspx?<%=pageurl %>">订单列表</a></span> <span class="action-span1"><a href="../Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 订单信息 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="../js/fucties.js"></script>
    <script type="text/javascript" src="../js/listtb.js"></script>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2" align="center">
                    订单浏览
                </th>
            </tr>
            <tr>
                <td width="120" height="25" align="right">
                    订单号：
                </td>
                <td>
                    <font color="#FF0000">
                        <asp:Label ID="labOrderNum" runat="server"></asp:Label></font> 下单日期： <font color="#808080">
                            <asp:Label ID="labAddTime" runat="server"></asp:Label></font> &nbsp;&nbsp;订单类型：
                    <asp:Label ID="lb_ordertype" runat="server" Text="商标国内订单"></asp:Label>
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    订单状态：
                </td>
                <td>
                    <asp:Label ID="Lb_OrderStatus" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    用户编号：
                </td>
                <td>
                    <a href="Shop_U_User.aspx?id=<%=userid %>">
                        <asp:Label ID="lb_cbianhao" runat="server"></asp:Label></a>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    用户名：
                </td>
                <td>
                    <a href="Shop_U_User.aspx?id=<%=userid %>">
                        <asp:Label ID="labUserName" runat="server"></asp:Label></a>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    联系人：
                </td>
                <td>
                    <a href="Shop_U_User.aspx?id=<%=userid %>">
                        <asp:Label ID="lb_cname" runat="server"></asp:Label></a>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    手机号码：
                </td>
                <td>
                    <asp:Label ID="labMobile" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    电话号码：
                </td>
                <td>
                    <asp:Label ID="labTel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    邮箱：
                </td>
                <td>
                    <asp:Label ID="labEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="25" align="right">
                    支付方式：
                </td>
                <td>
                    <%=bankpay%>
                </td>
            </tr>
            <tr style="display:none">
                <td height="25" align="right" id="huikuan" runat="server" visible="false">
                    汇款帐号：
                </td>
                <td>
                    
                </td>
            </tr>
            <tr id="tr_fapiao2" runat="server" visible="false">
                <td height="25" align="right">
                    付款金额：
                </td>
                <td>
                    <asp:Label ID="Lb_totlemoney" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_1" runat="server" visible="false">
                <td height="25" align="right">
                    发票抬头：
                </td>
                <td>
                    <asp:Label ID="lb_fapiao" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_2" runat="server" visible="false">
                <td height="25" align="right">
                    发票金额：
                </td>
                <td>
                    <asp:Label ID="lb_fapiaomoney" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_3" runat="server" visible="false">
                <td height="25" align="right">
                    邮寄地址：
                </td>
                <td>
                    <asp:Label ID="labAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_4" runat="server" visible="false">
                <td height="25" align="right">
                    邮编：
                </td>
                <td>
                    <asp:Label ID="labZipCode" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="tr_fapiao_5" runat="server" visible="false">
                <td height="25" align="right">
                    电话：</td>
                <td>
                    <asp:Label ID="labPhone" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
         <table><tr><td><asp:Literal ID="Ltl_PayType" runat="server"></asp:Literal>
        </td></tr></table>
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="9">
                    商标列表
                </th>
            </tr>
            <tr>
                <td width="2%" align="center">
                    &nbsp;
                </td>
                <td width="12%" align="center">
                    案件号
                </td>
                 <td width="12%" align="center">
                    注册号
                </td>
                <td width="12%" align="center">
                    申请人
                </td>
                <td width="10%" align="center">
                    图样
                </td>
                <td width="10%" align="center" height="25">
                    商标类别
                </td>
                <td width="15%" align="center" height="25">
                   金额
                </td>
                <td width="20%" align="center" height="25">
                     申请书
                </td>
                <td width="20%" align="center" height="25">
                    委托书
                </td>
            </tr>
            <asp:Repeater runat="server" ID="repSB">
                <ItemTemplate>
                    <tr>
                        <td align="center">
                            <%--<input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' />--%>
                        </td>
                        <td align="center">
                             <%# Eval("CaseNo")%>
                        </td>
                          <td align="center">
                             <%# Eval("RegisteredNo")%>
                        </td>
                        <td align="center">
                            <%# Eval("ApplyName")%>
                        </td>
                        <td align="center">
                             <img alt="" src="../../<%# Eval("TrademarkPattern1") %>" width="50" height="30" />
                        </td>
                        <td height="25" align="center">
                            <%# Eval("TrademarkType")%>
                        </td>
                        <td height="25" align="center" style="color: #C80C1A">
                            <%# decimal.Parse(Eval("TrademarkMoney").ToString()) + decimal.Parse(Eval("TrademarkAgencyFee").ToString())%>
                        </td>
                        <td height="25" align="center">
                            <a href='<%#Eval("ApplyBook")%>' title='点击下载' target='_blank'>下载</a> 
                        </td>
                        <td align="center">
                           <a href='<%#Eval("AgentBook")%>' title='点击下载' target='_blank'>下载</a> 
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th>
                    费用信息
                </th>
            </tr>
            <tr>
                <td align="right">
                    <table width="450" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="59" align="right" valign="top" style="line-height: 22px;">
                                <table>
                                    <tr>
                                        <td height="59" align="right">
                                            <table width="440" border="0" cellspacing="0" cellpadding="0">
                                              <tbody>
                                                <tr align="left">
                                                    <td width="200" align="right">
                                                        商标局规费：
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
                                                        <asp:Label ID="Lal_zhinajin" runat="server"></asp:Label>
                                                        <asp:TextBox ID="Txt_Zhinajin" runat="server" CssClass="inputs60text" 
                                                            Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
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
                                                       增值税：
                                                    </td>
                                                    <td width="110">
                                                        <asp:Label ID="Lal_ZengzhiTax" runat="server"></asp:Label>
                                                        <asp:TextBox ID="Txt_ZengzhiTax" runat="server" CssClass="inputs60text" 
                                                            Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
                                                    </td>
                                                    <td width="30">
                                                    </td>
                                                    <td style="width: 100px;">
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td width="200" align="right">
                                                        手续费：</td>
                                                    <td width="110">
                                                        <asp:Label ID="Lal_ShouxuFei" runat="server"></asp:Label>
                                                        <asp:TextBox ID="Txt_ShouxuFei" runat="server" CssClass="inputs60text" 
                                                            Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
                                                    </td>
                                                    <td width="30">
                                                        &nbsp;</td>
                                                    <td style="width: 100px;">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr align="left">
                                                    <td width="200" align="right">
                                                        优惠券：</td>
                                                    <td width="110">
                                                        -<asp:Label ID="Lal_Youhui" runat="server"></asp:Label>
                                                        <asp:TextBox ID="Txt_Youhui" runat="server" CssClass="inputs60text" 
                                                            Visible="false" onkeyup="GetTotalFee()"></asp:TextBox>
                                                    </td>
                                                    <td width="30">
                                                        &nbsp;</td>
                                                    <td style="width: 100px;">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr align="left">
                                                    <td width="200" align="right">
                                                    </td>
                                                    <td width="110" align="right">
                                                        总计：
                                                    </td>
                                                    <td width="30">
                                                        <asp:Label ID="Lal_BiZhong" runat="server" CssClass="inputs60text" ForeColor="Red">CNY</asp:Label>
                                                    </td>
                                                    <td align="left" style="width: 100px;">
                                                        <asp:Label ID="Lal_TotalMoney" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                        <asp:TextBox ID="Txt_TotalMoney" runat="server" CssClass="inputs60text" 
                                                            Visible="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                                <%--<input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' />--%>
                                            </table>
                                            <table width="440" border="0" cellspacing="0" cellpadding="0">
                                                 <%# Eval("CaseNo")%>
                                            </table>
                                        </td>
                                        <td width="30">
                                        </td>
                                    </tr>
                                    <tr>
                                    <td align="center">
                                      <a href="#" id="downAll" target="_blank">下载总帐单</a>
                                         <a href="#" id="downDetail" target="_blank">下载分帐单</a> &nbsp; &nbsp; &nbsp; 
                                         <asp:Button ID="Btn_EditFee" runat="server" Text="修改费用" CssClass="button" OnClick="Btn_EditFee_Click" />
                                        </td>
                                        <td align="left">
                                            &nbsp;</td>
                                       
                                        </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    订单操作
                </th>
            </tr>
            <tr>
                <td width="120" align="right">
                    <strong>操作备注：</strong>
                </td>
                <td>
                    <textarea id="area_beizhu" runat="server" cols="50" rows="3" class="input"></textarea>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <strong>可执行操作：</strong>
                </td>
                <td>
                    <asp:Button ID="btnNoPay" runat="server" Text="未支付" CssClass="button" 
                        OnClick="btnOperate_Click" CommandName="0"  
                        OnClientClick="return scheck()" />
                    <asp:Button ID="btnPay" runat="server" Text="已支付" CssClass="button" 
                        OnClick="btnOperate_Click" CommandName="1"  
                        OnClientClick="return scheck()" />
                    <asp:Button ID="btnIdeal" runat="server" Text="处理中" CssClass="button" 
                        OnClick="btnOperate_Click" CommandName="2"  
                        OnClientClick="return scheck()" />
                    <asp:Button ID="btnComplete" runat="server" Text="已完成" CssClass="button" 
                        OnClick="btnOperate_Click" CommandName="4"  
                        OnClientClick="return scheck()" />
                    <asp:Button ID="btnEsc" runat="server" Text="取消订单" CssClass="button" 
                        OnClick="btnOperate_Click" CommandName="3"   
                        OnClientClick="return scheck()" />
                </td>
            </tr>
        </table>
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th width="20%">
                    身份/操作者
                </th>
                <th width="20%">
                    操作时间
                </th>
                <th width="15%">
                    订单状态
                </th>
                <th width="45%">
                    备注
                </th>
            </tr>
            <asp:Repeater runat="server" ID="repOperateDetail">
                <ItemTemplate>
                    <tr align="center">
                        <td height="26">
                            <%#Eval("nvc_ManagerName") != null ? "（管理员）" + Eval("nvc_ManagerName") : "（会员）" + Eval("nvc_MemberName")%>
                        </td>
                        <td>
                            <%#Eval("dt_AddTime")%>
                        </td>
                        <td>
                            <%#ConvertStatus(Eval("i_Type"))%>
                        </td>
                        <td>
                            <%#Eval("nvc_Info_1")%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table>
            <tr>
                <td align="center">
                    <asp:Button ID="lbtnDelete" runat="server" OnClientClick="return confirm('您确定进行删除操作吗？')" OnClick="lbtnDelete_Click" Text="删除订单" CssClass="button"></asp:Button>
                    <%# Eval("RegisteredNo")%><%# Eval("ApplyName")%>
                    <input name="Submit8" type="button" value="返回" onclick="javascript:window.location='Q_TrademarkRenewalOrder.aspx?<%=pageurl %>';" class="button" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function daochuxls(dtype, oid) {
            var rand = Math.floor(Math.random() * 1000000);
            var cs = "PageType=DaochuOrder&DType=" + dtype + "&OId=" + oid + "&n=" + rand;
            $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
                success: function (data) {
                    if (data.toString().split(';;;;;')[0] == "1") {
                        document.getElementById('daochu').innerHTML = data.toString().split(';;;;;')[1];
                        AutomateExcel('daochutable');
                    }
                    else if (data.toString().split(';;;;;')[0] == "0") {
                        alert(data.toString().split(';;;;;')[1]);
                    }
                }
            });
        }
    </script>
    <script src="../js/hoot.js" type="text/javascript"></script>
    <div id="daochu" runat="server">
    </div>
    <script type="text/javascript" src="../js/ss.js"></script>
    <input type="hidden" id="HiddenDel" value="" runat="server" />
    <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="40%">
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 15%; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="40%" align="right">
                                <img alt="" width="30" src="../images/caozuo_2.jpg" />
                            </td>
                            <td width="60%" align="left" style="font-size: 14px;">
                                &nbsp;订单拆分成功
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="45%">
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px; height: 100px; text-align: center; width: 100%; display: none;">
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
                            <td align="left" background="../images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">
                                温馨提示
                            </td>
                            <td width="34" background="images/ts_bg.jpg">
                                <img alt="取消" src="../images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" />
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
                <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece; background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="20%" align="right" style="text-align: right">
                                <img alt="" width="30" src="../images/caozuo_1.jpg" />
                            </td>
                            <td width="80%" align="left" style="font-size: 14px;">
                                &nbsp;确认要进行拆分操作吗？
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
                <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 200px; font-size: 16px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="25%" align="right">
                                <img alt="" width="30" src="../images/caozuo_3.jpg" />
                            </td>
                            <td width="75%" align="left" style="font-size: 14px;">
                                &nbsp;请选中您要拆分的商标
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="40%">
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
</body>
</html>
<script type="text/javascript">
    function strnull() {
        var checkpowre = document.getElementById('Hi_CheckPower');
        if (checkpowre.value == "1") {
            var str_ps = document.getElementById('str_ps');
            var text_ps = document.getElementById('text_ps');
            str_ps.style.display = "none";
            text_ps.style.display = "";
        }
    }
    function textnull() {
        var str_ps = document.getElementById('str_ps');
        var text_ps = document.getElementById('text_ps');
        if (!(document.activeElement.id == "text_ps")) {
            str_ps.style.display = "";
            text_ps.style.display = "none";
        }
    }
    function textok(tvalue) {
        var str_ps = document.getElementById('str_ps');
        var text_ps = document.getElementById('text_ps');
        if (parseFloat(str_ps.innerHTML) != parseFloat(text_ps.value)) {
            var lb_sum = document.getElementById('labTotalMoney');

            var orderid = document.getElementById('Hi_OrderId');
            var rand = Math.floor(Math.random() * 1000000);
            var cs = "PageType=UpdateOrderPSF&OrderId=" + orderid.value + "&PSF=" + tvalue + "&n=" + rand;
            $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
                success: function (data) {
                    if (data != "NO") {
                        str_ps.innerHTML = tvalue;
                        lb_sum.innerHTML = data.toString().split(',')[0];
                        if (document.getElementById('Lb_JE')) {
                            document.getElementById('Lb_JE').innerHTML = data.toString().split(',')[1];
                        }
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
<script type="text/javascript">
    function Selbox(obj) {
        var inputs = document.getElementsByName("inputPageid");
        var bools = true;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i] != obj && inputs[i].checked == false) {
                bools = false;
            }
        }
        if (bools) {
            obj.checked = false;
        }
    }
</script>
<script type="text/javascript" language="javascript">
    function scheck() {
        if (!confirm('确认进行该操作吗？')) return false;
    }
    function GetTotalFee() {

        var a = $('#Txt_GuanFei').val();
        var b = $('#Txt_Zhinajin').val();
        var c = $('#Txt_DaiLiFei').val();
        var d = $('#Txt_ZengzhiTax').val();
        var e = $('#Txt_ShouxuFei').val();
        var f = $('#Txt_Youhui').val();
        var t = parseFloat(a) + parseFloat(b) + parseFloat(c) + parseFloat(d) + parseFloat(e) - parseFloat(f);
        $('#Txt_TotalMoney').attr('value', t.toFixed(2));
    }
    function alls() {
        var n;
        n = window.form.selectid.length;
        if (n > 0) {
            for (var i = 0; i < n; i++) {
                window.form.selectid[i].checked = window.form.checkbox2.checked;
            }
        }
        else {
            window.form.selectid.checked = window.form.checkbox2.checked;
        }

    }
    var rollFlag = 0;

    function txt_roll(str) {
        sub_num = str.substring(str.length - 2);
        sub_str = str.substring(0, str.length - 2);

        if (document.all[str].style.display == "") {
            document.all[str].style.display = "none";
            rollFlag = 0;
            return;
        }
        else {
            if (rollFlag != 0) {
                document.all[sub_str + rollFlag].style.display = "none";
                document.all[str].style.display = "";
            }

            document.all[str].style.display = "";
            rollFlag = sub_num;
        }

    }
</script>
<script type="text/javascript" language="javascript">
    function subform_onsubmit() {
        if (document.all.sub_from.value == "") {
            alert("请填写收货人姓名。")
            document.all.sub_from.focus()
            return false
        }
        else if (document.all.sub_from.value.length > 12) {
            alert("不能超过12个字符或6个汉字。")
            document.all.sub_from.focus()
            return false
        }
        //else if(document.all.prov.value=="")
        //	{
        //	  alert("请选择省。")
        //	  document.all.prov.focus()
        //	  return false
        //	 }
        else if (document.all.sub_fromadds.value == "") {
            alert("详细地址不能为空。")
            document.all.sub_fromadds.focus()
            return false
        }
        else if (document.all.sub_frompost.value == "") {
            alert("请填写邮政编码。")
            document.all.sub_frompost.focus()
            return false
        }
        else if ((document.all.sub_frommobi.value == "") && (document.all.sub_fromtel.value == "")) {
            alert("手机和电话至少有一项必填。")
            document.all.sub_frommobi.focus()
            return false
        }

        else if (document.all.sub_frommail.value.length != 0) {
            if (document.all.sub_frommail.value.charAt(0) == "." ||
         document.all.sub_frommail.value.charAt(0) == "@" ||
         document.all.sub_frommail.value.indexOf('@', 0) == -1 ||
         document.all.sub_frommail.value.indexOf('.', 0) == -1 ||
         document.all.sub_frommail.value.lastIndexOf("@") == document.all.sub_frommail.value.length - 1 ||
         document.all.sub_frommail.value.lastIndexOf(".") == document.all.sub_frommail.value.length - 1) {
                alert("电子邮件地址格式不正确。");
                document.all.sub_frommail.focus();
                return false;
            }
        }
        else {
            alert("请填写电子邮件。");
            document.all.sub_frommail.focus();
            return false;
        }
    }

    function load(sel) {
        var url = sel.options[sel.selectedIndex].value;
        if (url != "") {
            if (typeof (sel.options[sel.selectedIndex].target) != "undefined") {
                open(url, sel.options[sel.selectedIndex].target);
            } else {
                eval(sel.options[sel.selectedIndex].value)
            }
            sel.selectedIndex = 0
        }
        else {

        }
        return false;
    }
    function OnlyNumber(obj) {
        var t = obj.value;
        if (t.length <= 0) {
            //alert("数量不能为空。");
        }
        else {
            for (var i = 0; i < t.length; i++) {
                if (t.charAt(i) in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) {

                }
                else {
                    alert("请填写正整数。");
                    $(obj).attr("value", "");
                    obj.focus();
                }
            }
        }
    }
    // -->
</script>
