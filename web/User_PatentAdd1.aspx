<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentAdd1.aspx.cs"
    Inherits="User_PatentAdd1" ValidateRequest="false" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>手动导入专利信息_添加专利信息_我的专利_服务中心_会员中心_专利系统_环球汇通</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/tooltips.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input type="hidden" id="hd_id" runat="server" value="0" />
    <input type="hidden" id="hd_userId" runat="server" value="0" />
    <input type="hidden" id="hd_yaoqiuxiang" runat="server" value="0" />
    <input type="hidden" id="hd_xuanxiang" runat="server" value="0" />
    <input type="hidden" id="txt_MemberId" runat="server" />
    <input type="hidden" id="Hi_ShenQingRi" runat="server" value="0" />
    <input type="hidden" id="Hi_ShouQuanRi" runat="server" value="0" />
    <input type="hidden" id="Hi_YaoQiuXiang" runat="server" value="0" />
    <asp:HiddenField ID="Hi_ShouQuanGuoId" runat="server" Value="0" />
    <asp:HiddenField ID="Hi_PatentTypeId" runat="server" Value="0" />
    <asp:HiddenField ID="Hi_NianDu" runat="server" Value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
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
                <!--专利左侧START-->
                <uc3:patentleft ID="patentleft1" runat="server" />
                <!--专利左侧END-->
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
                                        首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的专利 >> 添加专利信息 >> 手动导入专利信息
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
                                                <td height="115" align="center" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            基本信息
                                                                        </td>
                                                                        <td width="6">
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
                                                                <table width="689" border="0" cellpadding='0' cellspacing='0'>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>系统序号</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_OrderBy" readonly="readonly" class="font12000 tooltip"
                                                                                tips="系统自动生成" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利号</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_Number" class="font12000 tooltip" tips="<p>中国专利号格式：9-13位数字（例：200812345678.9）</p><p>其他国家格式不限</p>"
                                                                                maxlength="50" />
                                                                            <span id="zhuaquinfo" style="color: Red;"></span><span class="error">*</span>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                                                                                ValidationGroup="a" ControlToValidate="txt_Number" Display="Dynamic" SetFocusOnError="true"
                                                                                Text="不能为空！"></asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator"
                                                                                ValidationGroup="a" ControlToValidate="txt_Number" Text="您输入的信息格式有误，请核实！" Display="Dynamic"
                                                                                SetFocusOnError="true" ValidationExpression="[\s\S]{4,18}">
                                                                            </asp:RegularExpressionValidator>
                                                                            <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="txt_Number" Display="Dynamic" SetFocusOnError="true" Text="您输入的信息格式有误，请核实！" ClientValidationFunction="ClientValidatePatentNumberFormat"></asp:CustomValidator>--%>
                                                                            <%--<asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="txt_Number" Display="Dynamic" SetFocusOnError="true" Text="专利号不能重复！" ClientValidationFunction="ClientValidatePatentNumber"></asp:CustomValidator>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利名称</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <div id="div_name" runat="server">
                                                                            </div>
                                                                            <input type="text" runat="server" id="txt_Name" class="font12000 tooltip" tips="200个字符以内"
                                                                                maxlength="200" />
                                                                            <script type="text/javascript">
                                                                                document.getElementById("txt_Name").value = document.getElementById("div_name").innerHTML;
                                                                            </script>
                                                                            <span id="txt_Name1"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利授权国</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                        <span class="font12b4e">
                                          <asp:DropDownList ID="Drp_AuthorizeNationalityId" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Drp_AuthorizeNationalityId_SelectedIndexChanged" CssClass="font12000_t">
                                          </asp:DropDownList>
                                          </span>
                                          <span class="error">*</span>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Drp_AuthorizeNationalityId" InitialValue="0" Display="Dynamic" SetFocusOnError="true" Text="请选择！"></asp:RequiredFieldValidator>
                                        </ContentTemplate>
                                      </asp:UpdatePanel>--%>
                                                                            <span class="font12b4e">
                                                                                <select id="Drp_AuthorizeNationalityId" onchange="select_shouquanguo()" runat="server"
                                                                                    class="font12000_t">
                                                                                </select>
                                                                            </span><span class="error">*</span>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                                                                                ValidationGroup="a" ControlToValidate="Drp_AuthorizeNationalityId" InitialValue="0"
                                                                                Display="Dynamic" SetFocusOnError="true" Text="请选择！"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利类型</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                        <span class="font12b4e">
                                          <asp:DropDownList ID="Drp_PatentType" runat="server" OnChange="YaoQiuXiangShow();ZhuaQu();" AutoPostBack="true" OnSelectedIndexChanged="Drp_PatentType_SelectedIndexChanged" CssClass="font12000_t">
                                            <asp:ListItem Value="0">请选择</asp:ListItem>
                                          </asp:DropDownList>
                                          </span>
                                       <span class="error">*</span>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Drp_PatentType" InitialValue="0" Display="Dynamic" SetFocusOnError="true" Text="请选择！"></asp:RequiredFieldValidator>
                                        </ContentTemplate></asp:UpdatePanel>--%>
                                                                            <span class="font12b4e">
                                                                                <select id="Drp_PatentType" onchange="select_pantentype();YaoQiuXiangShow();ZhuaQu();"
                                                                                    runat="server" class="font12000_t">
                                                                                </select>
                                                                            </span><span class="error">*</span>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                                                runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Drp_PatentType"
                                                                                InitialValue="0" Display="Dynamic" SetFocusOnError="true" Text="请选择！"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利申请日</strong>：
                                                                        </td>
                                                                        <td width="429" align="left" valign="middle">
                                                                            <input type="text" readonly="readonly" runat="server" id="txt_AuthorizeIsNationalityDate"
                                                                                class="font12000" style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat;
                                                                                background-position: right;" onclick="WdatePicker({el:'txt_AuthorizeIsNationalityDate',dateFmt:'yyyy-MM-dd',onpicked:CheckShenQingRi})" />
                                                                            <span class="error" id="txt_AuthorizeIsNationalityDate1" style="display: none;">*
                                                                            </span>
                                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="不能为空！" ControlToValidate="txt_AuthorizeIsNationalityDate"
                                                                                ClientValidationFunction="ClientValidateAuthorizeIsNationalityDate" ValidateEmptyText="True"
                                                                                ValidationGroup="a" Display="Dynamic" SetFocusOnError="true"></asp:CustomValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利授权日</strong>：
                                                                        </td>
                                                                        <td width="429" align="left" valign="middle">
                                                                            <input type="text" runat="server" readonly="readonly" id="txt_AuthorizeIsAuthorizeDate"
                                                                                class="font12000" style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat;
                                                                                background-position: right;" onclick="WdatePicker({el:'txt_AuthorizeIsAuthorizeDate',dateFmt:'yyyy-MM-dd',onpicked:CheckShouQuanRi})" />
                                                                            <span class="error" id="txt_AuthorizeIsAuthorizeDate1" style="display: none;">*
                                                                            </span>
                                                                            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="不能为空！" ControlToValidate="txt_AuthorizeIsAuthorizeDate"
                                                                                ClientValidationFunction="ClientValidateAuthorizeIsAuthorizeDate" ValidateEmptyText="True"
                                                                                ValidationGroup="a" Display="Dynamic" SetFocusOnError="true"></asp:CustomValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_yaoqiuxiang" style="<%=hd_yaoqiuxiang.Value=="0"?"display:none": ""%>">
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>权利要求项</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_yaoqiuxiang" class="font12000 tooltip"
                                                                                tips="只能输入数字" value="0" maxlength="4" />
                                                                            <span class="error">*</span>
                                                                            <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="不能为空！" ControlToValidate="txt_yaoqiuxiang"
                                                                                ClientValidationFunction="ClientValidateYaoQiuXiang" ValidateEmptyText="True"
                                                                                ValidationGroup="a" Display="Dynamic" SetFocusOnError="true"></asp:CustomValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator"
                                                                                ValidationGroup="a" ControlToValidate="txt_yaoqiuxiang" Text="您输入的信息格式有误，请核实！"
                                                                                Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利权人</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_PatentHolder" class="font12000 tooltip"
                                                                                tips="500个字符以内" maxlength="500" />
                                                                            <span id="txt_PatentHolder1"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利权人国籍</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <span class="font12b4e">
                                                                                <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server" CssClass="font12000_t">
                                                                                </asp:DropDownList>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>发明人</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_PatentInventor" class="font12000 tooltip"
                                                                                tips="100个字符以内" maxlength="100" />
                                                                            <span id="txt_PatentInventor1"></span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            专利状态
                                                                        </td>
                                                                        <td width="6">
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
                                                                <table width="689" cellpadding='0' cellspacing='0'>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利有效维持期限起始日</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <%--onclick="WdatePicker({el:'txt_AnnualFeeDateStart',dateFmt:'yyyy-MM-dd',onpicked:GetInfoByDate})"--%>
                                                                            <input type="text" runat="server" id="txt_AnnualFeeDateStart" readonly="readonly"
                                                                                class="font12000 tooltip" tips="系统自动计算" style="background-image: url(images/user_js_date.gif);
                                                                                background-repeat: no-repeat; background-position: right;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利有效维持期限终止日</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeDateEnd" readonly="readonly" class="font12000 tooltip"
                                                                                tips="系统自动计算" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利有效维持年限</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeYear" class="font12000 tooltip"
                                                                                tips="系统自动计算" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利剩余有效维持年限</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeRestYear" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="2" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利于该授权国的年费缴费状态</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <span class="font12b4e">
                                                                                <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server" class="font_auto" onchange="selectChange()">
                                                                                    <asp:ListItem Value="0">请选择</asp:ListItem>
                                                                                    <asp:ListItem Value="1">已完成缴费，等待下次缴费（>90天)</asp:ListItem>
                                                                                    <asp:ListItem Value="2">距缴费日期<90天，尚未提交订单</asp:ListItem>
                                                                                    <asp:ListItem Value="3">距缴费日期<60天，尚未提交订单</asp:ListItem>
                                                                                    <asp:ListItem Value="4">距缴费日期<30天，尚未提交订单</asp:ListItem>
                                                                                    <asp:ListItem Value="5">距缴费日期<15天，尚未提交订单 </asp:ListItem>
                                                                                    <asp:ListItem Value="6">距缴费日期<0天，尚未提交订单</asp:ListItem>
                                                                                    <asp:ListItem Value="-1">已提交委托订单，尚未接收汇款</asp:ListItem>
                                                                                    <asp:ListItem Value="-1">已提交委托订单，缴费中</asp:ListItem>
                                                                                    <asp:ListItem Value="9">经确认，放弃续费</asp:ListItem>
                                                                                    <asp:ListItem Value="-1">联系不到缴费人，视为放弃缴费</asp:ListItem>
                                                                                    <asp:ListItem Value="-1">缴费人无答复，视为放弃缴费</asp:ListItem>
                                                                                    <asp:ListItem Value="12">同日申请专利，自动失效</asp:ListItem>
                                                                                    <asp:ListItem Value="13">已完成所有年度缴费</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>专利已缴纳年度</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                        <span class="font12b4e">
                                          <asp:DropDownList ID="txt_AnnualFeePaymentYear" runat="server" OnChange="SelectChanged()" CssClass="font12000_t">
                                            <asp:ListItem Value="0">请选择</asp:ListItem>
                                          </asp:DropDownList>
                                        </span><span class="error">*</span> <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeePaymentYear" Display="Dynamic" SetFocusOnError="true" Text="请选择！" InitialValue="0"></asp:RequiredFieldValidator>
                                        </ContentTemplate>
                                      </asp:UpdatePanel>--%>
                                                                            <span class="font12b4e">
                                                                                <select id="txt_AnnualFeePaymentYear" onchange="select_niandu();SelectChanged()"
                                                                                    runat="server" class="font12000_t">
                                                                                </select>
                                                                            </span><span class="error">*</span>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator"
                                                                                ValidationGroup="a" ControlToValidate="txt_AnnualFeePaymentYear" Display="Dynamic"
                                                                                SetFocusOnError="true" Text="请选择！" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>上一次年费缴纳期限日</strong>：
                                                                        </td>
                                                                        <td width="429" height="32" align="left" valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeePrevYear" class="font12000 tooltip"
                                                                                tips="系统自动计算" style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat;
                                                                                background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
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
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            优先权信息
                                                                        </td>
                                                                        <td width="6">
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
                                                                <table width="689" border="0" cellpadding='0' cellspacing='0'>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>优先权申请号</strong>：
                                                                        </td>
                                                                        <td width="429" height="26" valign="middle">
                                                                            <input type="text" runat="server" id="txt_PriorityNumber" class="font12000" maxlength="50" />
                                                                            <%--<span id="txt_PriorityNumber1"></span>
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PriorityNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w\.]{6,18}">
                </asp:RegularExpressionValidator>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>优先权国</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <span class="font12b4e">
                                                                                <asp:DropDownList ID="Drp_PriorityNationalityId" runat="server" CssClass="font12000_t">
                                                                                </asp:DropDownList>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>优先权申请日</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input readonly="readonly" type="text" runat="server" id="txt_PriorityDate" class="font12000"
                                                                                style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat;
                                                                                background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
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
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            PCT信息
                                                                        </td>
                                                                        <td width="6">
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
                                                            <td height="64" align="left" valign="top">
                                                                <table width="689" border="0" cellpadding='0' cellspacing='0'>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>PCT申请号</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input type="text" runat="server" id="txt_PtcNumber" class="font12000" maxlength="50" />
                                                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PtcNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w\.]{6,18}">
                </asp:RegularExpressionValidator>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>PCT申请日</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input type="text" readonly="readonly" runat="server" id="txt_PtcDate" class="font12000"
                                                                                style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat;
                                                                                background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
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
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            缴费信息
                                                                        </td>
                                                                        <td width="6">
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
                                                                <table width="689" border="0" cellpadding='0' cellspacing='0'>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>缴费期限日</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeNextYear" readonly="readonly"
                                                                                class="font12000 tooltip" tips="系统自动计算" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>距缴费期限所剩天数</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeRestDay" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="5" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>待缴年度</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeNotPaymentYear" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="2" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>官费</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_AnnualFeeNextPaymentMoney" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="8" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>代理费</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_AgentServiceFee" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="8" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>汇款手续费</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_RemittanceFee" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="8" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_chaoxiangfee" runat="server" style="display: none;">
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>超项费</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_chaoxiang" class="font12000 tooltip" tips="系统自动计算"
                                                                                maxlength="8" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_jianmian1" runat="server" visible="false">
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>减免</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_jianmian1" class="font12000" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr_zhinajin" runat="server" visible="false">
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>滞纳金</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_zhinajin" class="font12000 tooltip" tips="系统自动计算"
                                                                                maxlength="8" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>费用小计</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="hidden" id="hf_total" value="0" />
                                                                            <input type="text" runat="server" id="txt_FeeSubtotal" class="font12000 tooltip"
                                                                                tips="如需缴费请与我司联系，具体金额以我司账单为准" maxlength="8" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>货币种类</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input type="text" runat="server" id="txt_CurrencyType" class="font12000 tooltip"
                                                                                tips="系统自动计算" maxlength="50" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>备注</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <textarea id="nt_Remarks" runat="server" class="font12000 tooltip" tips="500个字符以内"
                                                                                style="height: 50px;"></textarea>
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
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            第三方信息
                                                                        </td>
                                                                        <td width="6">
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
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>案卷号</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input type="text" runat="server" id="txt_anjuanhao" class="font12000" maxlength="100" />
                                                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator"
                                                                                ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="您输入的信息格式有误，请核实！"
                                                                                Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w\.]{6,18}">
                                                                            </asp:RegularExpressionValidator>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>联系人</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input type="text" runat="server" id="txt_linkman" class="font12000" maxlength="20" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>地址</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input type="text" runat="server" id="txt_address" class="font12000" maxlength="200" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            <strong>电话</strong>：
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            <input type="text" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="left" valign="middle">
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
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="115" align="left" valign="top">
                                                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="260" height="32" align="right" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="left" valign="middle">
                                                                            <table width="389" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="8" height="35">
                                                                                    </td>
                                                                                    <td width="95" align="left">
                                                                                        <asp:ImageButton ID="ImgBtn_Add" runat="server" ImageUrl="~/images/user_zl_b5.gif"
                                                                                            OnClick="ImgBtn_Add_Click" ValidationGroup="a" />
                                                                                    </td>
                                                                                    <td width="108" align="left">
                                                                                        <input id="Reset1" type="reset" value="" style="width: 86px; height: 27px; background-image: url(images/user_js_b2.gif);
                                                                                            border: 0px;" />
                                                                                    </td>
                                                                                    <td width="178" align="left">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div runat="server" id="div_a">
    </div>
    <input type="hidden" id="hi_zlh" value="" />
    <input type="hidden" id="hi_zlhgs" value="" />
    <div id="divhtml" style="display: none;">
    </div>
    <div id="dd" style="display: none;">
    </div>
    </form>
</body>
</html>
<script type="text/JavaScript">
    function selectChange() {
        var vv = $("#Drp_AnnualFeeStatus").val();
        if (vv == -1) {
            $("#Drp_AnnualFeeStatus").val($("#hd_xuanxiang").val());
            alert("此项不可选");
        }
        else {
            $("#hd_xuanxiang").val($("#Drp_AnnualFeeStatus").val());
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
        var Pid = $("#Drp_PatentType").val(); //专利类型      
        var sqr = $("#txt_AuthorizeIsNationalityDate").val(); //申请日      
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
        var Pid = $("#Drp_PatentType").val(); //专利类型
        var sqr = $("#txt_AuthorizeIsAuthorizeDate").val(); //授权日
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
    //    function GetInfoByDate() {
    //    var rand = Math.floor(Math.random() * 1000000);
    //    var Pid = $("#Drp_PatentType").val(); //专利类型
    //    var yxq = $("#txt_AnnualFeeDateStart").val(); //有效期起始日
    //    var Sid = $("#Drp_PatentHolderNationalityId").val(); //专利授权人国籍
    //    if (yxq != "") {
    //        if (Pid != 0) {
    //          $.ajax({
    //            type: "POST",
    //            url: "Shop_A_Patent.ashx",
    //            contentType: "application/x-www-form-urlencoded; charset=utf-8",
    //            data: "flag=yyt&Pid=" + Pid + "&yxq=" + yxq + "&n=" + rand,
    //            success: function (msg) {
    //              var json = eval("(" + msg + ")");
    //              $("#txt_AnnualFeeDateEnd").val(json.yx_date);
    //              $("#txt_AnnualFeeYear").val(json.yx_year);
    //              $("#txt_AnnualFeeRestYear").val(json.yx_year);
    //            }
    //          });
    //        }
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
                    if (json.ChaoXiangFee != 0) {
                        $("#tr_chaoxiangfee").show();
                        $("#txt_chaoxiang").val(json.ChaoXiangFee);
                    }
                    else {
                        $("#tr_chaoxiangfee").hide();
                    }
                    $("#txt_FeeSubtotal").val(json.TotalFee);
                    $("#txt_AnnualFeeDateStart").val(json.YouXiaoQiStart);
                    $("#txt_AnnualFeeDateEnd").val(json.YouXiaoQiEnd);
                    $("#txt_AnnualFeePrevYear").val(json.PrevJiaoFeeDate);
                    $("#txt_AnnualFeeNextYear").val(json.JiaoFeeDate);
                    $("#txt_AnnualFeeRestDay").val(json.JiaoFeeday);
                    $("#txt_AnnualFeeNotPaymentYear").val(json.DaiJiaoYear);
                    if (json.ZhiNaJin != "") {
                        $("#tr_zhinajin").show();
                        $("#txt_zhinajin").val(json.ZhiNaJin);
                    }
                    else {
                        $("#tr_zhinajin").hide();
                    }

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
    function ZhuaQu() {
        var patentnum = $("#txt_Number").val();
        var Pid = $("#Drp_PatentType").val(); //专利类型
        if (Pid == 0) {
            alert("请先选择专利国家和专利类型！");
            return false;
        }
        var ptypename = "";

        var guojiname = $("#Drp_AuthorizeNationalityId option:selected").val();
        if (guojiname == 1) {
            ptypename = $("#Drp_PatentType option:selected").text();
        }
        if (patentnum != "") {
            if (guojiname == 1) {
                $("#zhuaquinfo").html("正在搜索专利,请稍等,如系统长时间没有搜索到,请您自行填写以下内容.");
            }
            else {
                $("#zhuaquinfo").html("");
                return false;
            }
            $.ajax({
                type: "POST",
                url: "Patentzhuaqu.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=patent&zlnumber=" + patentnum + "&zltype=" + ptypename,
                success: function (msg) {
                    if (msg != "no" && msg != "chaoshi") {
                        if (guojiname == 1) {
                            if (ptypename == "外观设计") {
                                //                              $("#divhtml").html(msg);
                                //                              $("#txt_Name").val($("#divhtml tbody tr:eq(2) td").eq(0).html().split('&nbsp;')[1]); //专利名称
                                //                              $("#txt_PatentHolder").val($("#divhtml tbody tr:eq(10) td").eq(0).html().split('&nbsp;')[1]); //授权人
                                //                              $("#txt_PatentInventor").val($("#divhtml tbody tr:eq(12) td").eq(0).html().split('&nbsp;')[1]); //发明人
                                //                              $("#txt_AuthorizeIsNationalityDate").val($("#divhtml tbody tr:eq(1) td").eq(0).html().split('&nbsp;')[1].replace(".", "-").replace(".", "-").replace("/", "-").replace("/", "-")); //专利申请日
                                $("#divhtml").html(msg);
                                $("#txt_Name").val($("#divhtml tr:eq(2) td").eq(0).html().split('&nbsp;')[1]); //专利名称
                                $("#txt_PatentHolder").val($("#divhtml tr:eq(10) td").eq(0).html().split('&nbsp;')[1]); //授权人
                                $("#txt_PatentInventor").val($("#divhtml tr:eq(12) td").eq(0).html().split('&nbsp;')[1]); //发明人
                                $("#txt_AuthorizeIsNationalityDate").val($("#divhtml tr:eq(1) td").eq(0).html().split('&nbsp;')[1].replace(".", "-").replace(".", "-").replace("/", "-").replace("/", "-")); //专利申请日
                            }
                            else { //发明，实用新型
                                $("#divhtml").html(msg);
                                $("#txt_Name").val($("#divhtml table tr:eq(1) td").eq(1).html().split('&nbsp;')[1]); //专利名称 
                                $("#txt_PatentHolder").val($("#divhtml table tr:eq(6) td").eq(1).html().split('&nbsp;')[1]); //专利权人
                                $("#txt_PatentInventor").val($("#divhtml table tr:eq(8) td").eq(1).html().split('&nbsp;')[1]); //发明人
                                $("#txt_AuthorizeIsNationalityDate").val($("#divhtml table tr:eq(0) td").eq(3).html().split('&nbsp;')[1].replace(".", "-").replace(".", "-").replace("/", "-").replace("/", "-")); //专利申请日
                            }
                        }
                        else if (guojiname == 8) {
                            $("#divhtml").html(msg);
                            alert(msg);
                            var aa = $("#divhtml tbody tr:eq(5) td").eq(1).html(); //专利权人
                            var bb = aa.replace("<br>", "<b>").replace("<br>", "</b>");
                            $("#dd").html(bb);
                            var cc = $("#dd").find("b").html().trim();
                            $("#txt_PatentHolder").val(cc); //专利权人

                            var aa1 = $("#divhtml tbody tr:eq(8) td").eq(1).html(); //发明人
                            var bb1 = aa1.replace("/", "<b>").replace("<br>", "</b>");

                            $("#dd").html(bb1);
                            var cc1 = $("#dd").find("b").html().trim();
                            $("#txt_PatentInventor").val(cc1); //发明人
                            $("#txt_PriorityNumber").val($("#divhtml tbody tr:eq(18) td").eq(1).html().trim()); //优先权号
                        }
                        if ($("#txt_Name").val() != "") {
                            $("#txt_Name1").html("<img  src='images/tOk.gif' />");
                        }
                        if ($("#txt_PatentHolder").val() != "") {
                            $("#txt_PatentHolder1").html("<img  src='images/tOk.gif' />");
                        }
                        if ($("#txt_PatentInventor").val() != "") {
                            $("#txt_PatentInventor1").html("<img  src='images/tOk.gif' />");
                        }
                        if ($("#txt_AuthorizeIsNationalityDate").val() != "") {
                            CheckShenQingRi();
                            $("#txt_AuthorizeIsNationalityDate1").html("<img src='images/tOk.gif'/>");
                        }
                        if ($("#txt_PriorityNumber").val() != "") {
                            CheckShenQingRi();
                            $("#txt_PriorityNumber1").html("<img src='images/tOk.gif'/>");
                        }
                        $("#zhuaquinfo").html("<img src='images/tOk.gif'/>");
                    }
                    else if (msg == "chaoshi") {
                        // alert("专利号搜索超时，请稍后再试、、、");
                        $("#zhuaquinfo").html("搜索超时！");
                    }
                    else if (msg == "no") {
                        alert("没有该专利号信息可抓取，请手动添加信息");
                        $("#zhuaquinfo").html();
                    }
                }
            });
        }
    }
</script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=selshouquanguo&xuanze=" + $("#Hi_ShouQuanGuoId").val(),
            success: function (date) {
                $("#Drp_AuthorizeNationalityId").html(date);
                select_shouquanguo();
                select_pantentype();
            }
        });
    })
    function select_shouquanguo() {
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=selpatenttype&selshouquanguoid=" + $("#Drp_AuthorizeNationalityId").val() + "&xuanze=" + $("#Hi_PatentTypeId").val(),
            success: function (date) {
                $("#Drp_PatentType").html(date);
                select_pantentype();
                $("#Hi_ShouQuanGuoId").val($("#Drp_AuthorizeNationalityId").val());
            }
        });
    }
    function select_pantentype() {
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=selniandu&selshouquanguoid=" + $("#Drp_AuthorizeNationalityId").val() + "&selpatenttypeid=" + $("#Drp_PatentType").val() + "&xuanze=" + $("#Hi_NianDu").val(),
            success: function (date) {
                $("#txt_AnnualFeePaymentYear").html(date);
                $("#Hi_PatentTypeId").val($("#Drp_PatentType").val());
            }
        });
    }
    function select_niandu() {
        $("#Hi_NianDu").val($("#txt_AnnualFeePaymentYear").val());
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
