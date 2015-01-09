<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademarkrenewal_list.aspx.cs"
    Inherits="trademarkrenewal_list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商标列表_我的商标_服务中心_商标系统_环球汇通</title>
    <meta name="Keywords" content="环球汇通" />
    <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="js/jtrademark.js" type="text/javascript"></script>
     <script src="js/swfobject.js" type="text/javascript"></script>
    <script src="js/jquery.uploadify.min.js" type="text/javascript"></script>
      <script src="js/upfile.js" type="text/javascript"></script>
    <link href="jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
    <script src="js/TrademarkRenewalList.js" type="text/javascript"></script>
    <%--  <link href="css/pager.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript">
        $(function () {
            var ody1 = $("#Hi_orderby1").val().split('_');
            var ody2 = $("#Hi_orderby2").val().split('_');
            var ody3 = $("#Hi_orderby3").val().split('_');
            var ody4 = $("#Hi_orderby4").val().split('_');
            var ody5 = $("#Hi_orderby5").val().split('_');
            var ody6 = $("#Hi_orderby6").val().split('_');

            if (ody1[1] == "1") {
                orderby(ody1[0], 1);
            }
            if (ody2[1] == "2") {
                orderby(ody2[0], 2);
            }
            if (ody3[1] == "3") {
                orderby(ody3[0], 3);
            }
            if (ody4[1] == "4") {
                orderby(ody4[0], 4);
            }
            if (ody5[1] == "5") {
                orderby(ody5[0], 5);
            }
            if (ody6[1] == "6") {
                orderby(ody6[0], 6);
            }
        });
        function orderby(ody, index) {
            if (ody == "desc") {
                $("#daoxu" + index).hide();
                $("#zhengxu" + index).show();
            }
            else {
                $("#zhengxu" + index).hide();
                $("#daoxu" + index).show();
            }
        }
    </script>
    <script language="javascript">
        function switchTag1(tag, content, k) {
            for (i = 1; i < 3; i++) {
                if (i == k)
                { document.getElementById(tag + i).className = "font12bt"; document.getElementById(content + i).className = ""; }
                else
                { document.getElementById(tag + i).className = "font12bs"; document.getElementById(content + i).className = "h_lsit_none"; }
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
                    //document.all[sub_str+rollFlag].style.display="none";
                    document.all[str].style.display = "";
                }

                document.all[str].style.display = "";
                rollFlag = sub_num;
            }
        }
    </script>
    <style type="text/css">
        .time0
        {
            font-size: 12px;
            color: #1e2b6c;
            font-weight: bold;
        }
        .time1
        {
            font-size: 12px;
            color: #1e2b6c;
            font-weight: bold;
        }
        .time2
        {
            font-size: 12px;
            color: #50245f;
            font-weight: bold;
        }
        .time3
        {
            font-size: 12px;
            color: #852349;
            font-weight: bold;
        }
        .time4
        {
            font-size: 12px;
            color: #b2333d;
            font-weight: bold;
        }
        .time5
        {
            font-size: 12px;
            color: #d14b1a;
            font-weight: bold;
        }
        .time6
        {
            font-size: 12px;
            color: #ebbf1c;
            font-weight: bold;
        }
        
        .aspnetpager a
        {
            display: block;
            float: left;
            padding: 2px 10px;
            background: #fff;
            text-align: center;
            line-height: 20px;
            border: 1px solid #ccc;
            color: #0065DB;
            margin: 0 3px;
        }
        .aspnetpager a:hover
        {
            border: 1px solid #FF5500;
            color: #FF5500;
            background: #FFEEE6;
            text-decoration: none;
        }
        .aspnetpager td .pagetext
        {
            width: 35px;
            height: 23px;
            background: #fff;
            text-align: center;
            line-height: 23px;
            border: 1px solid #ccc;
        }
        .aspnetpager td .submitbutton
        {
            width: 39px;
            height: 23px;
            background: url(images/fenbar.jpg);
            color: #fff;
            line-height: 23px;
            text-align: center;
            border: none;
            margin-left: 5px;
        }
    </style>
    <style type="text/css">
        #bg
        {
            display: none;
            z-index: 1;
            background: #0b0b0b;
            left: 0px;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0px;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
        #show
        {
            display: none;
            z-index: 2;
            position: absolute;
            top: 0px;
        }
    </style>
</head>
<body id="index">
    <form id="form1" runat="server">
    <input type="hidden" id="Hi_orderby1" runat="server" value="0" />
    <input type="hidden" id="Hi_orderby2" runat="server" value="0" />
    <input type="hidden" id="Hi_orderby3" runat="server" value="0" />
    <input type="hidden" id="Hi_orderby4" runat="server" value="0" />
    <input type="hidden" id="Hi_orderby5" runat="server" value="0" />
    <input type="hidden" id="Hi_orderby6" runat="server" value="0" />
    <input type="hidden" id="hi_time" runat="server" value="0" />
    <input type="hidden" id="hi_trademark" runat="server" value="" />
    <input type="hidden" id="HF_ORDERBY" runat="server" value="" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
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
                <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
            </td>
            <td align="left" valign="top">
                <table width="741" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
                            <table width="739" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="701">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">首页</a>&nbsp;>>&nbsp;商标系统&nbsp;>>&nbsp;服务中心&nbsp;>>&nbsp;我的商标&nbsp;>>&nbsp;全部商标信息
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="29" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="114" height="29" align="center" style="background-color: #1e2b6c;">
                                                                <a href='trademarkrenewal_list.aspx?stime=90_1&<%=Geturl("stime") %>' class="ac2">90天以上</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="114" align="center" style="background-color: #50245f;">
                                                                <a href='trademarkrenewal_list.aspx?stime=61-90_2&<%=Geturl("stime") %>' class="ac2">
                                                                    61-90天</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="114" align="center" style="background-color: #852349;">
                                                                <a href='trademarkrenewal_list.aspx?stime=31-60_3&<%=Geturl("stime") %>' class="ac2">
                                                                    31-60天</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="114" align="center" style="background-color: #b2333d;">
                                                                <a href='trademarkrenewal_list.aspx?stime=16-30_4&<%=Geturl("stime") %>' class="ac2">
                                                                    16-30天</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="114" align="center" style="background-color: #d14b1a;">
                                                                <a href='trademarkrenewal_list.aspx?stime=0-15_5&<%=Geturl("stime") %>' class="ac2">
                                                                    0-15天</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="114" align="center" style="background-color: #ebbf1c;">
                                                                <a href='trademarkrenewal_list.aspx?stime=chao_6&<%=Geturl("stime") %>' class="ac2">
                                                                    过期商标</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="26" align="left">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="29" align="right" nowrap="nowrap">
                                                                <strong>案件号</strong>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtCaseNo" runat="server" Width="70px"></asp:TextBox>
                                                            </td>
                                                            <td align="center" nowrap="nowrap">
                                                                <strong>申请号</strong>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtApplyNo" runat="server" Width="70px"></asp:TextBox>
                                                            </td>
                                                            <td align="center" nowrap="nowrap">
                                                                <strong>申请人</strong>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtApplyUser" runat="server" Width="70px"></asp:TextBox>
                                                            </td>
                                                            <td width="30" align="center" nowrap="nowrap">
                                                                <strong>类别</strong>
                                                            </td>
                                                            <td width="114">
                                                                <asp:DropDownList ID="ddlApplyType" runat="server">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="80" align="center">
                                                                <asp:Button ID="btnQuery" CssClass="BtnShow" runat="server" Text="查 询" OnClick="btnQuery_Click" />
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="110" align="center">
                                                                  <a href="javascript:void(0)" class="BtnShowhref" onclick="printPage()" > 打印全部列表</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                                        <tr>
                                                            <td width="76" height="42" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                <span>案件号</span><a href="trademarkrenewal_list.aspx?sbcaseno=desc_1" title="倒序" id="daoxu1">↑</a><a
                                                                                href="trademarkrenewal_list.aspx?sbcaseno=asc_1" title="正序" id="zhengxu1" style="display: none;">↓</a>
                                                            </td>
                                                            <td width="76" height="42" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                <span>申请号</span><a href="trademarkrenewal_list.aspx?sbapplyno=desc_5" title="倒序"
                                                                                id="daoxu5">↑</a> <a href="trademarkrenewal_list.aspx?sbapplyno=asc_5" title="正序"
                                                                                    id="zhengxu5" style="display: none;">↓</a>
                                                            </td>
                                                            <td width="160" height="42" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                <table width="100%" height="42" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="center">
                                                                            <span>申请人</span><a href="trademarkrenewal_list.aspx?sbname=desc_2" title="倒序" id="daoxu2">↑</a>
                                                                            <a href="trademarkrenewal_list.aspx?sbname=asc_2" title="正序" id="zhengxu2" style="display: none;">
                                                                                ↓</a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="55" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                <table width="100%" height="42" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td  align="center">
                                                                            图样
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                          
                                                            <td width="70" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                <span>期限日</span><a href="trademarkrenewal_list.aspx?sbtime=desc_4" title="倒序" id="daoxu4">↑</a>
                                                                <a href="trademarkrenewal_list.aspx?sbtime=asc_4" title="正序" id="zhengxu4" style="display: none;">
                                                                    ↓</a>
                                                            </td>
                                                            <td width="40" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                申请书
                                                            </td>
                                                            <td width="40" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                委托书
                                                            </td>
                                                          
                                                              <td width="90" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                               <span>状态</span><a href="trademarkrenewal_list.aspx?sbstatus=desc_6" title="倒序" id="daoxu6">↑</a><a
                                                                                href='trademarkrenewal_list.aspx?sbstatus=asc_6' title="正序" id="zhengxu6" style="display: none;">↓</a>
                                                            </td>
                                                              <td width="25" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                <input type="checkbox" onclick="doSelect()" id="selectall" />
                                                            </td>
                                                        </tr>
                                                        <asp:Repeater ID="Rp_sb_list" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td height="42" align="center" bgcolor="#FFFFFF">
                                                                        <a href="trademarkrenewal_detail.aspx?t_r_id=<%# Eval("i_Id") %>" class="ac5t">
                                                                            <%# Eval("CaseNo")%></a>
                                                                    </td>
                                                                    <td height="42" align="center" bgcolor="#FFFFFF">
                                                                        <%# Eval("RegisteredNo")%>
                                                                    </td>
                                                                    <td height="42" align="center" bgcolor="#FFFFFF">
                                                                        <%# Eval("ApplyName")%>
                                                                    </td>
                                                                    <td align="center" bgcolor="#FFFFFF">
                                                                        <img alt="" src="<%# Eval("TrademarkPattern1") %>" width="50" height="30" />
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                            <%# string.Format("{0:yyyy-MM-dd}",Eval("RenewalDate"))%>
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF" class="font12b4e">
                                                                         <a href="javascript:void(0)" casetype="1" booktype="0" caseno="<%# Eval("CaseNo")%>" class="upfile">上传</a>
                                                                        <p></p>
                                                                         <a href='<%# Eval("RenewalApplyBook")%>' title='点击下载' target='_blank'>下载</a> 
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF" class="font12b4e">
                                                                         <a href="javascript:void(0)" casetype="1" booktype="1" caseno="<%# Eval("CaseNo")%>" class="upfile">上传</a>
                                                                          <p></p>
                                                                     <a href='<%# Eval("RenewalAgentBook")%>' title='点击下载' target='_blank'>下载</a> 
                                                                        </td>
                                                                        
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                           <%# GetApplyStatus(Eval("Status"))%>
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                            <input name="chkItem" type="checkbox" status="<%#Eval("Status")%>" value="<%#Eval("i_Id")%>"
                                                                                id="Checkbox1" />
                                                                        </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <%if (Rp_sb_list.Items.Count > 0)
                                              { %>
                                            <tr>
                                                <td align="center">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <a href="javascript:void(0)" onclick="SubmitTrademarkListDailog()" class="BtnShowhref"
                                                                    style="width: 73px">提交订单</a>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnExcel" CssClass="BtnShow" runat="server" Text="导出" OnClientClick=" return ExportToExcel();"
                                                                    OnClick="btnExcel_Click" />
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)" onclick="DelTrademarkListDailog()" class="BtnShowhref"
                                                                    style="width: 73px">删 除</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <%} %>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="font12b4e">
                                                    <table class="aspnetpager" cellspacing="5">
                                                        <tr>
                                                            <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always"
                                                                runat="server" ShowFirstLast="False" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页"
                                                                NextPageText="下一页" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right"
                                                                CustomInfoHTML="共 %PageCount% 页 " InputBoxClass="pagetext" PageIndexBoxType="TextBox"
                                                                SubmitButtonText="确定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged"
                                                                TextAfterInputBox=" 页" TextBeforeInputBox="跳转到 ">
                                                            </webdiyer:AspNetPager>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                                                        BorderWidth="1px">
                                                        <Columns>
                                                            <asp:BoundField DataField="CaseNo" HeaderText="案件号" />
                                                            <asp:BoundField DataField="RegisteredNo" HeaderText="申请号" ItemStyle-CssClass="text" />
                                                            <asp:TemplateField HeaderText="申请人类别">
                                                                <ItemTemplate>
                                                                    <%# GetApplyTypeName(Eval("ApplyType"))%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ApplyName" HeaderText="申请人名称" />
                                                            <asp:TemplateField HeaderText="身份证件">
                                                                <ItemTemplate>
                                                                    身份证
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="CardNo" HeaderText="身分证件号码" ItemStyle-CssClass="text" />
                                                            <asp:TemplateField HeaderText="身份证件扫描件">
                                                                <ItemTemplate>
                                                                    <%# Eval("CardNoPDF") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="营业执照副本">
                                                                <ItemTemplate>
                                                                    <%# Eval("Businesslicense") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="申请人行政区划">
                                                                <ItemTemplate>
                                                                    <%#GetProviceArea(Eval("ProvinceId"), Eval("CityId"), Eval("AreaId"))%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Address" HeaderText="申请人地址" ItemStyle-CssClass="text" />
                                                            <asp:BoundField DataField="ContactPerson" HeaderText="联系人" ItemStyle-CssClass="text" />
                                                            <asp:BoundField DataField="Phone" HeaderText="联系电话" ItemStyle-CssClass="text" />
                                                            <asp:BoundField DataField="Fax" HeaderText="传真" ItemStyle-CssClass="text" />
                                                            <asp:BoundField DataField="PostCode" HeaderText="邮编" ItemStyle-CssClass="text" />
                                                            <asp:TemplateField HeaderText="三维标志">
                                                                <ItemTemplate>
                                                                    <%# bool.Parse(Eval("Is3D") == null ? "false" : Eval("Is3D").ToString()) == true ? "是" : "否"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="颜色组合">
                                                                <ItemTemplate>
                                                                    <%# bool.Parse(Eval("IsColor")==null? "false":Eval("IsColor").ToString()) == true ? "是" : "否"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="声音商标">
                                                                <ItemTemplate>
                                                                    <%# bool.Parse(Eval("IsSound") == null ? "false" : Eval("IsSound").ToString()) == true ? "是" : "否"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="声音文件">
                                                                <ItemTemplate>
                                                                    <%# Eval("SoundFile") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="TrademarkRemark" HeaderText="商标说明" />
                                                            <asp:BoundField DataField="TrademarkType" HeaderText="商标类别" />
                                                            <asp:TemplateField HeaderText="描述类型">
                                                                <ItemTemplate>
                                                                    <%# Eval("TrademarkDescribeType").ToString()=="0"? "文字商标":(Eval("TrademarkDescribeType").ToString()=="1" ? "图形商标":"文字与图形商标") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="TrademarkDescribe" HeaderText="商标描述" />
                                                            <asp:TemplateField HeaderText="注册证书">
                                                                <ItemTemplate>
                                                                    <%# Eval("TrademarkRegBook") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="商标申请日" />
                                                            <asp:BoundField DataField="PublicPreliminaryDate" DataFormatString="{0:yyyy-MM-dd}"
                                                                HeaderText="初审公告日" />
                                                            <asp:BoundField DataField="PublicPreliminaryDate" DataFormatString="{0:yyyy-MM-dd}"
                                                                HeaderText="期限日" />
                                                            <asp:TemplateField HeaderText="最近状态">
                                                                <ItemTemplate>
                                                                    <%# GetApplyStatus(Eval("Status"))%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="注册申请书">
                                                                <ItemTemplate>
                                                                    <%# Eval("ApplyBook") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="申请委托书">
                                                                <ItemTemplate>
                                                                    <%# Eval("AgentBook") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="续展申请书">
                                                                <ItemTemplate>
                                                                    <%# Eval("RenewalApplyBook") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="续展委托书">
                                                                <ItemTemplate>
                                                                    <%# Eval("RenewalAgentBook") != null ? "已上传" : "未上传"%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr style="display:none">
                                            <td id="pr_table">
                                            <table width="689" border="1" cellspacing="0" cellpadding="0" bgcolor="#d0d0d0" style="border-collapse: collapse;border: none;">
                                                        <tr>
                                                            <td width="76" height="42" align="center" bgcolor="#FFFFFF">
                                                               案件号
                                                            </td>
                                                            <td width="76" height="42" align="center" bgcolor="#FFFFFF">
                                                                申请号
                                                            </td>
                                                            <td width="66" height="42" align="center" bgcolor="#FFFFFF">
                                                               申请人
                                                            </td>
                                                            <td width="55" align="center" bgcolor="#FFFFFF">
                                                               图样
                                                            </td>
                                                            <td width="90" align="center" bgcolor="#FFFFFF">
                                                              类别
                                                            </td>
                                                            <td width="70" align="center" bgcolor="#FFFFFF">
                                                               期限日
                                                            </td>
                                                            <td width="53" align="center" bgcolor="#FFFFFF">
                                                                申请书
                                                            </td>
                                                            <td width="53" align="center" bgcolor="#FFFFFF">
                                                                委托书
                                                            </td>
                                                        </tr>
                                                        <asp:Repeater ID="rptPrint" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td height="42" align="center" bgcolor="#FFFFFF">
                                                                        <%# Eval("CaseNo")%>
                                                                    </td>
                                                                    <td height="42" align="center" bgcolor="#FFFFFF">
                                                                        <%# Eval("RegisteredNo")%>
                                                                    </td>
                                                                    <td height="42" align="center" bgcolor="#FFFFFF">
                                                                        <%# Eval("ApplyName")%>
                                                                    </td>
                                                                    <td align="center" bgcolor="#FFFFFF">
                                                                        <img alt="" src="<%# Eval("TrademarkPattern1") %>" width="50" height="30" />
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                            <%# GetApplyTypeName(Eval("ApplyType"))%>
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                            <%# string.Format("{0:yyyy-MM-dd}",Eval("RenewalDate"))%>
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                            <%# (Eval("RenewalApplyBook") != null && string.IsNullOrEmpty(Eval("RenewalApplyBook").ToString()) == false)
                                                                                                                                                              ? "已上传" : "未上传"%>
                                                                        </td>
                                                                        <td align="center" bgcolor="#FFFFFF">
                                                                            <%# (Eval("RenewalAgentBook") != null && string.IsNullOrEmpty(Eval("RenewalAgentBook").ToString()) == false)
                                                                                                                                                              ? "已上传" : "未上传"%>
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
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function printPage() {
            var newWin = window.open();
            var titleHTML = document.getElementById("pr_table").innerHTML;
            newWin.document.write(titleHTML);
            newWin.document.location.reload();
            newWin.print();
        }
        function Selbox(obj) {
            if ($(obj).attr("checked") != "checked") {
                SetSectet(obj.value, "nocheck");
            }
            else {
                SetSectet(obj.value, "check");
            }
        }
        function SetSectet(txtvalue, tyid) {
            var pids = "";
            if (tyid == "check") {

                if (getCookie("hqht_Trademarktidstr") == null) {
                    pids = "";
                }
                else {
                    pids = pids + getCookie("hqht_Trademarktidstr");
                }

                if (pids.indexOf("|" + txtvalue + ",1") < 0) {

                    pids = pids + "|" + txtvalue + ",1";
                }
            }
            else if (tyid == "nocheck") {
                var getpidstr = getCookie("hqht_Trademarktidstr");
                pids = pids + getpidstr.replace("|" + txtvalue + ",1", "");
            }

            writeCookie("hqht_Trademarktidstr", pids, 1);

        }
        //    function SetSectet(txtvalue, tyid) {
        //        var rand = Math.floor(Math.random() * 1000000);
        //        var cs = "flag=Sbjiaofei&CheckValue=" + txtvalue + "&SelectType=" + tyid + "&n=" + rand;
        //        //        $.post("Handler.ashx", cs, function (msg) {
        //        //            alert(msg);
        //        //        });
        //        $.ajax({
        //            type: "POST",
        //            url: "Handler.ashx",
        //            contentType: "application/x-www-form-urlencoded; charset=utf-8",
        //            data: cs,
        //            success: function (msg) {
        //                // alert(msg);
        //            }
        //        });
        //    }

        function Maxjiaofei() {
            var num = 0;
            var isok;
            var inputlist = document.getElementsByName("inputPageid");
            for (var j = 0; j < inputlist.length; j++) {
                if (inputlist[j].checked) {
                    num++;

                }
            }
            if (num != 0) {
                var rand = Math.floor(Math.random() * 1000000);
                var cs = "flag=SbMaxDays&SelectType=maxjiaofei&n=" + rand;
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "Handler.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: cs,
                    success: function (msg) {
                        if (msg != "1") {
                            $("#maxdays").html(msg);
                            openBg(1);
                            showdiv('1');
                            isok = false;
                        }
                        else {
                            $("#hi_time").val("true");
                            isok = true;
                        }
                    }
                });
            }
            else {
                alert("请选择你要缴费的商标！");
                isok = false;
            }
            //alert(isok);
            return isok;
        } 
     
    </script>
    <div id="div_a" runat="server">
    </div>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    <div id="div_html" runat="server">
    </div>
    </form>
</body>
</html>
