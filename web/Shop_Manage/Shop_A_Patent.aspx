<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_Patent.aspx.cs" ValidateRequest="false"
    Inherits="Shop_Manage_Shop_A_Patent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
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
        .colordiv
        {
            border: solid 1px #8dcff4;
            width: 16px;
            height: 16px;
            padding: 1px;
            float: left;
            margin-right: 5px;
            cursor: pointer;
        }
        .colordiv:hover
        {
            border: solid 1px #e8641b;
        }
        .colordiv img
        {
            width: 16px;
            height: 16px;
        }
        .colordivselect
        {
            padding: 1px;
            float: left;
            margin-right: 5px;
            cursor: pointer;
            width: 32px;
            height: 32px;
            border: solid 1px #e8641b;
        }
        .colordivselect img
        {
            width: 32px;
            height: 32px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input type="hidden" id="hd_id" runat="server" value="0" />
    <input type="hidden" id="hd_userId" runat="server" value="0" />
    <input type="hidden" id="hd_yaoqiuxiang" runat="server" value="0" />
    <input type="hidden" id="Hi_ShenQingRi" runat="server" value="0" />
    <input type="hidden" id="Hi_ShouQuanRi" runat="server" value="0" />
    <input type="hidden" id="Hi_YaoQiuXiang" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_Patent.aspx?<%=returnurl %>">专利列表</a></span>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
            class="action-span1">-
            <%=PageType%></span>
        <div style="clear: both">
        </div>
    </h1>
    <div class="list-div" id="list-div">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    <%=PageType%>信息
                </th>
            </tr>
            <tr>
                <td height="26" align="right">
                    会员编号：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_MemberId" class="inputs200text" maxlength="20" />
                    &nbsp;<font color="#FF0000">*</font>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ValidationGroup="a" ControlToValidate="txt_MemberId" Display="Dynamic" SetFocusOnError="true"
                        Text="不能为空！"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator"
                        ValidationGroup="a" ControlToValidate="txt_MemberId" Display="Dynamic" SetFocusOnError="true"
                        Text="请输入正确的用户编号！" ClientValidationFunction="ClientValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td width="200" height="26" align="right">
                    系统序号：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_OrderBy" readonly="readonly" class="inputs60text"
                        onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    专利号：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_Number" class="inputs200text" maxlength="50" />
                    &nbsp;<font color="#FF0000">*</font>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                        ValidationGroup="a" ControlToValidate="txt_Number" Display="Dynamic" SetFocusOnError="true"
                        Text="不能为空！"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="txt_Number" Text="您输入的信息格式有误，请核实！" Display="Dynamic"
                        SetFocusOnError="true" ValidationExpression="[\s\S]{4,18}">
                    </asp:RegularExpressionValidator>
                    <%-- <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="txt_Number" Display="Dynamic" SetFocusOnError="true" Text="专利号不能重复！" ClientValidationFunction="ClientValidatePatentNumber"></asp:CustomValidator>--%>
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    专利名称：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_Name" class="inputs400text" maxlength="200" />
                </td>
            </tr>
            <tr>
                <td height="26" align="right" valign="top">
                    专利授权国：
                </td>
                <td height="26">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="Drp_AuthorizeNationalityId" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="Drp_AuthorizeNationalityId_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;<font color="#FF0000">*</font>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="a" ControlToValidate="Drp_AuthorizeNationalityId" Display="Dynamic"
                                SetFocusOnError="true" Text="请选择！" InitialValue="0"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    专利类型：
                </td>
                <td height="26">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="Drp_PatentType" runat="server" OnChange="YaoQiuXiangShow()"
                                AutoPostBack="true" OnSelectedIndexChanged="Drp_PatentType_SelectedIndexChanged">
                                <asp:ListItem Value="0">请选择</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<font color="#FF0000">*</font>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                                runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Drp_PatentType"
                                Display="Dynamic" SetFocusOnError="true" Text="请选择！" InitialValue="0"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利申请日：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AuthorizeIsNationalityDate" class="inputs100text Wdate"
                        onclick="WdatePicker({el:'txt_AuthorizeIsNationalityDate',dateFmt:'yyyy-MM-dd',onpicked:CheckShenQingRi})" />
                    &nbsp;<font color="#FF0000" id="txt_AuthorizeIsNationalityDate1" style="display: none;">*</font>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="不能为空！" ControlToValidate="txt_AuthorizeIsNationalityDate"
                        ClientValidationFunction="ClientValidateAuthorizeIsNationalityDate" ValidateEmptyText="True"
                        ValidationGroup="a" Display="Dynamic" SetFocusOnError="true"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利授权日：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AuthorizeIsAuthorizeDate" class="inputs100text Wdate"
                        onclick="WdatePicker({el:'txt_AuthorizeIsAuthorizeDate',dateFmt:'yyyy-MM-dd',onpicked:CheckShouQuanRi})" />
                    &nbsp;<font color="#FF0000" id="txt_AuthorizeIsAuthorizeDate1" style="display: none;">*</font>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="不能为空！" ControlToValidate="txt_AuthorizeIsAuthorizeDate"
                        ClientValidationFunction="ClientValidateAuthorizeIsAuthorizeDate" ValidateEmptyText="True"
                        ValidationGroup="a" Display="Dynamic" SetFocusOnError="true"></asp:CustomValidator>
                </td>
            </tr>
            <tr id="tr_yaoqiuxiang" style="<%=hd_yaoqiuxiang.Value=="0"?"display:none": ""%>">
                <td width="200" height="26" align="right">
                    权利要求项：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_yaoqiuxiang" class="inputs60text" maxlength="4"
                        value="0" />&nbsp;<font color="#FF0000" >*</font>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="不能为空！" ControlToValidate="txt_yaoqiuxiang"
                        ClientValidationFunction="ClientValidateYaoQiuXiang" ValidateEmptyText="True"
                        ValidationGroup="a" Display="Dynamic" SetFocusOnError="true"></asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="txt_yaoqiuxiang" Text="您输入的信息格式有误，请核实！"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    专利权人：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_PatentHolder" class="inputs200text" maxlength="500" />
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    专利权人国籍：
                </td>
                <td height="26">
                    <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    发明人：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_PatentInventor" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    该项专利范围：
                </td>
                <td>
                    <asp:DropDownList ID="Drp_PatentScope" runat="server">
                        <asp:ListItem Value="">选择专利范围</asp:ListItem>
                        <asp:ListItem Value="国内">国内</asp:ListItem>
                        <asp:ListItem Value="国外">国外</asp:ListItem>
                        <asp:ListItem Value="国内&国外">国内&国外</asp:ListItem>
                    </asp:DropDownList>
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
        </table>
        <br />
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    专利状态
                </th>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利有效维持期限起始日：
                </td>
                <td>
                    <%--onclick="WdatePicker({el:'txt_AnnualFeeDateStart',dateFmt:'yyyy-MM-dd',onpicked:GetInfoByDate})" --%>
                    <input type="text" runat="server" id="txt_AnnualFeeDateStart" readonly="readonly"
                        class="inputs100text Wdate" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利有效维持期限终止日：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeeDateEnd" readonly="readonly" class="inputs80text" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    专利有效维持年限：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeeYear" class="inputs60text" readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利剩余有效维持年限：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeeRestYear" class="inputs60text"
                        maxlength="2" readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利于该授权国的年费缴费状态：
                </td>
                <td>
                    <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server">
                        <asp:ListItem Value="0">请选择</asp:ListItem>
                        <asp:ListItem Value="1">已完成缴费，等待下次缴费（>90天)</asp:ListItem>
                        <asp:ListItem Value="2">距缴费日期<90天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="3">距缴费日期<60天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="4">距缴费日期<30天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="5">距缴费日期<15天，尚未提交订单 </asp:ListItem>
                        <asp:ListItem Value="6">距缴费日期<0天，尚未提交订单</asp:ListItem>
                        <asp:ListItem Value="7">已提交委托订单，尚未接收汇款</asp:ListItem>
                        <asp:ListItem Value="8">已提交委托订单，缴费中</asp:ListItem>
                        <asp:ListItem Value="9">经确认，放弃续费</asp:ListItem>
                        <asp:ListItem Value="10">联系不到缴费人，视为放弃缴费</asp:ListItem>
                        <asp:ListItem Value="11">缴费人无答复，视为放弃缴费</asp:ListItem>
                        <asp:ListItem Value="12">同日申请专利，自动失效</asp:ListItem>
                        <asp:ListItem Value="13">已完成所有年度缴费</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    专利已缴纳年度：
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="txt_AnnualFeePaymentYear" runat="server" OnChange="SelectChanged()">
                                <asp:ListItem Value="0">请选择</asp:ListItem>
                            </asp:DropDownList>
                            <font color="#FF0000">*</font>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="a" ControlToValidate="txt_AnnualFeePaymentYear" Display="Dynamic"
                                SetFocusOnError="true" Text="请选择！" InitialValue="0"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    上一次年费缴纳期限日：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeePrevYear" class="inputs100text Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                    &nbsp;<img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
        </table>
        <br />
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    专利优先权信息
                </th>
            </tr>
            <tr>
                <td width="200" height="26" align="right" valign="top">
                    优先权申请号：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_PriorityNumber" class="inputs200text" maxlength="50" />
                </td>
            </tr>
            <tr>
                <td height="26" align="right" valign="top">
                    优先权国：
                </td>
                <td>
                    <asp:DropDownList ID="Drp_PriorityNationalityId" runat="server">
                        <asp:ListItem Value="0">选择国家</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="26" align="right" valign="top">
                    优先权申请日：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_PriorityDate" class="inputs100text Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                </td>
            </tr>
        </table>
        <br />
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    专利PCT信息
                </th>
            </tr>
            <tr>
                <td width="200" height="26" align="right">
                    PCT申请号：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_PtcNumber" class="inputs200text" maxlength="50" />
                </td>
            </tr>
            <tr>
                <td height="26" align="right">
                    PCT申请日：
                </td>
                <td height="26">
                    <input type="text" runat="server" id="txt_PtcDate" class="inputs100text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                </td>
            </tr>
        </table>
        <br />
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    缴费信息
                </th>
            </tr>
            <%--                <tr>
                    <td align="right" valign="top">专利于该授权国已缴纳年费总额：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_AnnualFeeSumMoney" class="inputs60text" maxlength="50" readonly="readonly"/>                               
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                    </td>
                </tr>--%>
            <tr>
                <td width="200" align="right" valign="top">
                    缴费期限日：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeeNextYear" readonly="readonly"
                        class="inputs80text" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    距缴费期限所剩天数：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeeRestDay" class="inputs60text"
                        maxlength="5" readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    待缴年度：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AnnualFeeNotPaymentYear" class="inputs60text"
                        maxlength="2" readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    官费：
                </td>
                <td>
                    <input type="hidden" id="hf_guanfei" value="0" runat="server" />
                    <input type="text" runat="server" id="txt_AnnualFeeNextPaymentMoney" class="inputs60text"
                        maxlength="8" readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    代理费：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_AgentServiceFee" class="inputs60text" maxlength="8"
                        readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    汇款手续费：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_RemittanceFee" class="inputs60text" maxlength="8"
                        readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    超项费：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_chaoxiang" class="inputs60text" maxlength="8"
                        readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    滞纳金：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_zhinajin" class="inputs60text" maxlength="8"
                        readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    减免：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_jianmian1" class="inputs60text" onkeyup="this.value=this.value.replace(/\D/g,'');SetJianMian()"
                        onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" />
                    %
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    费用小计：
                </td>
                <td>
                    <input type="hidden" id="hf_total" value="0" runat="server" />
                    <input type="text" runat="server" id="txt_FeeSubtotal" class="inputs60text" maxlength="8"
                        onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" />
                    <img src="images/ico_notice.gif" title="如需缴费请与我司联系，具体金额以我司账单为准" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    货币种类：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_CurrencyType" class="inputs60text" maxlength="50"
                        readonly="readonly" />
                    <img src="images/ico_notice.gif" title="系统自动计算" />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    备注：
                </td>
                <td>
                    <textarea runat="server" id="nt_Remarks" rows="3" class="input" style="width: 400px;"></textarea>
                </td>
            </tr>
            <%--                <tr>
                    <td align="right" valign="top">专利申请号：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_ApplicationMumber" class="inputs200text" maxlength="50" />                               </td>
                </tr>
                <tr>
                    <td align="right" valign="top">专利于该授权国申请时的代理机构：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_AuthorizeAgency" class="inputs200text" maxlength="100" />                                </td>
                </tr>
                <tr>
                    <td align="right" valign="top">代理人：</td>
                    <td>     
                    <input type="text" runat="server" id="txt_AuthorizeAgent" class="inputs200text" maxlength="20" />
                    </td>
                </tr>--%>
        </table>
        <br />
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    第三方信息
                </th>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    案卷号：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_anjuanhao" class="inputs200text" maxlength="100" />
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="您输入的信息格式有误，请核实！"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w\.]{6,18}">
                    </asp:RegularExpressionValidator>--%>
                </td>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    联系人：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_linkman" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    地址：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_address" class="inputs200text" maxlength="200" />
                </td>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    电话：
                </td>
                <td>
                    <input type="text" runat="server" id="txt_phone" class="inputs200text" maxlength="20" />
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    专利设置
                </th>
            </tr>
            <tr>
                <td width="200" align="right" valign="top">
                    &nbsp;&nbsp;
                </td>
                <td>
                    <asp:CheckBox ID="cb_Show" runat="server" />
                    是否显示&nbsp;&nbsp;
                    <asp:CheckBox ID="cb_ReceiveEmail" runat="server" Checked="true" />
                    是否接受邮件期限提醒
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="width: 100%; position: ; left: 0; bottom: 0px; height: 30px; background: #dfeef5;">
        <%if ((pageadd && hd_id.Value == "0") || (pageupdate && hd_id.Value != "0"))
          { %><asp:Button ID="btOK" runat="server" Text="提交" class="button" ValidationGroup="a"
              OnClick="btOK_Click" Style="margin-left: 350px;" /><%} %><% if (hd_id.Value != "0")
                                                                          { %><input type="button" id="Button3" value="返回" class="button" onclick="javascript:window.location='Shop_M_Patent.aspx?<%=returnurl %>';" /><%} %>
    </div>
    <div id="div_a" runat="server">
    </div>
    <input type="hidden" id="hi_ishave" value="" />
    <input type="hidden" id="hi_zlh" value="" />
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/JavaScript">
    function ClientValidate(source, arguments) {
        var member = document.getElementById("txt_MemberId").value;
        $.ajax({
            type: "post",
            async: false,
            url: "Shop_A_Patent.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=user&member=" + member,
            success: function (msg) {
                $("#hi_ishave").val(msg);
            }
        });
        if ($("#hi_ishave").val() == "no") {
            arguments.IsValid = false;
        }
        else {
            arguments.IsValid = true;
        }
    }
    function ClientValidatePatentNumber(source, arguments) {
        var zl_num = document.getElementById("txt_Number").value;
        var zl_id = document.getElementById("hd_id").value;
        $.ajax({
            type: "post",
            async: false,
            url: "Shop_A_Patent.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=zl_num&zl_num_id=" + zl_id + "&zl_num=" + zl_num,
            success: function (msg) {
                $("#hi_zlh").val(msg);
            }
        });
        if ($("#hi_zlh").val() == "no") {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }
    //选择申请日后调用
    function CheckShenQingRi() {
        var rand = Math.floor(Math.random() * 1000000);
        var Gid = $("#Drp_AuthorizeNationalityId").val(); //专利授权国
        var Pid = $("#Drp_PatentType").val(); //专利类型
        var sqr = $("#txt_AuthorizeIsNationalityDate").val(); //申请日
        if (Gid == "1") {
            $("#Drp_PatentScope").val("国内");
        }
        else {
            $("#Drp_PatentScope").val("国外");
        }
        if (Pid != 0) {
            $.ajax({
                type: "POST",
                url: "Shop_A_Patent.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=shenqingri&Pid=" + Pid + "&sqr=" + sqr + "&n=" + rand,
                success: function (msg) {
                    var json = eval("(" + msg + ")");
                    if (json.sq_qs != "") {
                        $("#txt_AnnualFeeDateStart").val(json.sq_qs);
                        $("#txt_AnnualFeeDateEnd").val(json.sq_date);
                        $("#txt_AnnualFeeYear").val(json.sq_year);
                        $("#txt_AnnualFeeRestYear").val(json.sq_year);
                    }
                }
            });
        }
    }
    //选择授权日后启用
    function CheckShouQuanRi() {
        var rand = Math.floor(Math.random() * 1000000);
        var Gid = $("#Drp_AuthorizeNationalityId").val(); //专利授权国
        var Pid = $("#Drp_PatentType").val(); //专利类型
        var sqr = $("#txt_AuthorizeIsAuthorizeDate").val(); //授权日
        if (Gid == "1") {
            $("#Drp_PatentScope").val("国内");
        }
        else {
            $("#Drp_PatentScope").val("国外");
        }
        if (Pid != 0) {
            $.ajax({
                type: "POST",
                url: "Shop_A_Patent.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=shouquanri&Pid=" + Pid + "&sqr=" + sqr + "&n=" + rand,
                success: function (msg) {
                    var json = eval("(" + msg + ")");
                    if (json.sq_qs != "") {
                        $("#txt_AnnualFeeDateStart").val(json.sq_qs);
                        $("#txt_AnnualFeeDateEnd").val(json.sq_date);
                        $("#txt_AnnualFeeYear").val(json.sq_year);
                        $("#txt_AnnualFeeRestYear").val(json.sq_year);
                    }
                }
            });
        }
    }
    //选择有效期后调用
    //  function GetInfoByDate() {
    //    var rand = Math.floor(Math.random() * 1000000);
    //    var Gid = $("#Drp_AuthorizeNationalityId").val(); //专利授权国
    //    var Pid = $("#Drp_PatentType").val(); //专利类型
    //    var yxq = $("#txt_AnnualFeeDateStart").val(); //有效期起始日
    //    var Sid = $("#Drp_PatentHolderNationalityId").val(); //专利授权人国籍
    //    if (Gid != "0") {
    //        if (Gid == "1") {
    //            $("#Drp_PatentScope").val("国内");
    //        }
    //        else{
    //            $("#Drp_PatentScope").val("国外");
    //        }
    //    }
    //    if (Pid != 0) {
    //        $.ajax({
    //            type: "POST",
    //            url: "Shop_A_Patent.ashx",
    //            contentType: "application/x-www-form-urlencoded; charset=utf-8",
    //            data: "flag=yyt&Pid=" + Pid + "&yxq=" + yxq + "&n=" + rand,
    //            success: function (msg) {
    //                var json = eval("(" + msg + ")");
    //                $("#txt_AnnualFeeDateEnd").val(json.yx_date);
    //                $("#txt_AnnualFeeYear").val(json.yx_year);
    //                $("#txt_AnnualFeeRestYear").val(json.yx_year);
    //            }
    //        });
    //    }
    //  }
    function SelectChanged() {
        var rand = Math.floor(Math.random() * 1000000);
        var userNum = $("#txt_MemberId").val();
        var selIndex = $("#Drp_AuthorizeNationalityId").val();
        var patentTypeId = $("#Drp_PatentType").val();
        var shenqingri = $("#txt_AuthorizeIsNationalityDate").val();
        var shouquanri = $("#txt_AuthorizeIsAuthorizeDate").val();
        var quanrenguoji = $("#Drp_PatentHolderNationalityId").val(); //专利授权人国籍
        var yijiaoyear = $("#txt_AnnualFeePaymentYear").val();
        var yaoqiuxiang = $("#txt_yaoqiuxiang").val(); //超项个数
        if (yaoqiuxiang == "") {
            yaoqiuxiang = 0;
        }
        if (selIndex != 0) {
            $.ajax({
                type: "POST",
                url: "Shop_A_Patent.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=getpinfo&selIndex=" + selIndex + "&patentTypeId=" + patentTypeId + "&shenqingri=" + shenqingri + "&shouquanri=" + shouquanri + "&quanrenguoji=" + quanrenguoji + "&yijiaoyear=" + yijiaoyear + "&userNum=" + userNum + "&yaoqiuxiang=" + yaoqiuxiang + "&n=" + rand,
                success: function (msg) {
                    var json = eval("(" + msg + ")"); //转换后的JSON对象
                    //alert(json.Year);
                    $("#txt_AnnualFeeYear").val(json.Year);
                    $("#txt_AnnualFeeSumMoney").val(json.YearFeeTotal);
                    $("#txt_AnnualFeeRestYear").val(json.ShengYear);
                    $("#txt_AnnualFeeNextPaymentMoney").val(json.SetFee);
                    $("#txt_RemittanceFee").val(json.ShouXuFee);
                    $("#txt_AgentServiceFee").val(json.AgentServiceFee);
                    $("#txt_CurrencyType").val(json.MoneyType);
                    $("#txt_chaoxiang").val(json.ChaoXiangFee);
                    $("#txt_FeeSubtotal").val(json.TotalFee);
                    $("#txt_AnnualFeeDateStart").val(json.YouXiaoQiStart);
                    $("#txt_AnnualFeeDateEnd").val(json.YouXiaoQiEnd);
                    $("#txt_AnnualFeePrevYear").val(json.PrevJiaoFeeDate);
                    $("#txt_AnnualFeeNextYear").val(json.JiaoFeeDate);
                    $("#txt_AnnualFeeRestDay").val(json.JiaoFeeday);
                    $("#txt_AnnualFeeNotPaymentYear").val(json.DaiJiaoYear);

                    $("#hf_guanfei").val(json.SetFee); //官费
                    $("#hf_total").val(json.TotalFee); //小计

                    $("#Drp_AnnualFeeStatus").val(json.Status);
                }
            });
        }
    }
    function YaoQiuXiangShow() {
        var patentTypeId = $("#Drp_PatentType").val();
        $.ajax({
            type: "POST",
            url: "Shop_A_Patent.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=yaoqiuxiang&patentTypeId=" + patentTypeId,
            success: function (date) {
                var v1 = date.split(';')[0];
                var v2 = date.split(';')[1];
                var v3 = date.split(';')[2];
                if (v1 == "1") {
                    $("#tr_yaoqiuxiang").show();
                    $("#Hi_YaoQiuXiang").val("1");
                }
                else {
                    $("#tr_yaoqiuxiang").hide();
                    $("#Hi_YaoQiuXiang").val("0");
                }
                if (v2 == "0" || v3 == "0" || v3 == "2") {
                    //申请日必填
                    $("#txt_AuthorizeIsNationalityDate1").show();
                    $("#Hi_ShenQingRi").val("1");
                }
                else {
                    $("#txt_AuthorizeIsNationalityDate1").hide();
                    $("#Hi_ShenQingRi").val("0");
                }
                if (v2 == "1" || v3 == "1" || v3 == "3") {
                    //授权日必填
                    $("#txt_AuthorizeIsAuthorizeDate1").show();
                    $("#Hi_ShouQuanRi").val("1");
                }
                else {
                    $("#txt_AuthorizeIsAuthorizeDate1").hide();
                    $("#Hi_ShouQuanRi").val("0");
                }
            }
        });
    }
    function SetJianMian() {
        if ($("#txt_jianmian1").val() == "") {
            $("#txt_jianmian1").val(0);
        }
        var jianmian = $("#txt_jianmian1").val();
        var guanfei = $("#hf_guanfei").val();
        var total = $("#hf_total").val();
        var cha = (parseFloat(guanfei) * parseFloat(jianmian)) / 100;
        var newsetfee = guanfei - cha;
        $("#txt_AnnualFeeNextPaymentMoney").val(newsetfee.toFixed(2));
        var newtotal = total - cha;
        $("#txt_FeeSubtotal").val(newtotal.toFixed(2));

    }
</script>
<script type="text/javascript">
    //申请日
    function ClientValidateAuthorizeIsNationalityDate(source, args) {
        var obj1 = document.getElementById("Hi_ShenQingRi");
        var obj2 = document.getElementById("txt_AuthorizeIsNationalityDate");
        if ((obj1.value == "1") && (obj2.value == "")) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    //授权日
    function ClientValidateAuthorizeIsAuthorizeDate(source, args) {
        var obj1 = document.getElementById("Hi_ShouQuanRi");
        var obj2 = document.getElementById("txt_AuthorizeIsAuthorizeDate");
        if ((obj1.value == "1") && (obj2.value == "")) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    //权利要求项
    function ClientValidateYaoQiuXiang(source, args) {
        var obj1 = document.getElementById("Hi_YaoQiuXiang");
        var obj2 = document.getElementById("txt_yaoqiuxiang");
        if ((obj1.value == "1") && (obj2.value == "")) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
</script>
<script type="text/C#" runat="server">
    //申请日
    public void ServerValidateAuthorizeIsNationalityDate(object source, ServerValidateEventArgs args)
    {
        if ((Hi_ShenQingRi.Value == "1") && (string.IsNullOrEmpty(txt_AuthorizeIsNationalityDate.Value)))
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    //授权日
    public void ServerValidateAuthorizeIsAuthorizeDate(object source, ServerValidateEventArgs args)
    {
        if ((Hi_ShouQuanRi.Value == "1") && (string.IsNullOrEmpty(txt_AuthorizeIsAuthorizeDate.Value)))
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    //权利要求项    
    public void ServerValidateYaoQiuXiang(object source, ServerValidateEventArgs args)
    {
        if ((Hi_YaoQiuXiang.Value == "1") && (string.IsNullOrEmpty(txt_yaoqiuxiang.Value)))
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }                
</script>
