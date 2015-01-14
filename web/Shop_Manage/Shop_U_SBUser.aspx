<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_U_SBUser.aspx.cs" Inherits="Shop_Manage_Shop_U_SBUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
        function isEmpty(value) {

            if (value == null || value == "" || value == "undefined" || value == undefined || value == "null") {
                return true;
            }
            else {
                value = value.toString();
                value = value.replace(/\s/g, "");
                if (value == "") {
                    return true;
                }
                return false;
            }
        }

        //编辑时初始化行政区划
        function EditProCityArea(proviceid, cityid, areaid) {
            SelProv(proviceid, cityid, areaid);
        }
        
        function SelProv(proviceid, cityid, areaid) {
            $.ajax({
                type: "POST",
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=selprov",
                success: function (date) {
                    $("#live_prov").html(date);
                    if (!isEmpty(proviceid)) {
                        $("#live_prov").val(proviceid).attr("selected", "selected");
                        SelCity(proviceid, cityid, areaid);
                    }
                }
            });
        }


        function SelCity(val, cityid, areaid) {
            var provinceName = isEmpty(val) ? "" : $("#live_prov").find("option:selected").text();
            $("#live_country").html("<option selected=\"\" value=\"\">请选择</option>");
            var provinceId = $("#live_prov").find("option:selected").val();
            $("#Hi_prov").val(provinceId);

            $.ajax({
                type: "POST",
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=selcity&provinceid=" + val,
                success: function (data) {
                    $("#live_city").html(data);
                    if (!isEmpty(cityid)) {
                        $("#live_city").val(cityid).attr("selected", "selected");
                        if (!isEmpty(areaid)) {
                            SelArea(cityid, areaid);
                        }
                    }
                    if (val == null || val == "") {
                        $("#live_city").html("<option selected=\"\" value=\"\">请选择</option>");
                        $("#live_country").html("<option selected=\"\" value=\"\">请选择</option>");
                        return;
                    }
                }
            });
        }
        function SelArea(val, areaid) {
            var provinceName = $("#live_prov").find("option:selected").text();
            var cityName = isEmpty(val) ? "" : $("#live_city").find("option:selected").text().replace("市辖区", "").replace("县", "");
            var cityId = $("#live_city").find("option:selected").val();
            $("#Hi_city").val(cityId);
            $.ajax({
                type: "POST",
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=selarea&cityid=" + val,
                success: function (data) {
                    $("#live_country").html(data);
                    if (areaid != null) {
                        $("#live_country").val(areaid).attr("selected", "selected");
                        SetAddress(areaid);
                    }
                    if (val == null || val == "") {
                        $("#live_country").html("<option selected=\"\" value=\"\">请选择</option>");
                        return;
                    }
                }
            });
        }
        function SetAddress(val) {
            var provinceName = $("#live_prov").find("option:selected").text();
            var cityName = $("#live_city").find("option:selected").text().replace("市辖区", "").replace("县", "");
            var countyName = isEmpty(val) ? "" : $("#live_country").find("option:selected").text();
            //    var provinceId = $("#live_prov").find("option:selected").val();
            //    var cityId = $("#live_city").find("option:selected").val();
            var countyId = $("#live_country").find("option:selected").val();
            $("#Hi_country").val(countyId);
            //$("#areaNameTxt").text(trimAll(provinceName) + trimAll(cityName) + trimAll(countyName));
        }
        $(function () {
            var porviceid = $("#Hi_prov").val();
            var cityid = $("#Hi_city").val();
            var areaid = $("#Hi_country").val();
            EditProCityArea(porviceid, cityid, areaid);
        });
    </script>
</head>
<body onload="checktype();">
    <form id="form1" runat="server">
    <input id="hi_guoji" type="hidden" runat="server" value="0" />
    <input id="hi_usertype" type="hidden" runat="server" value="1" />
    <input id="Hi_MemberId" type="hidden" runat="server" value="0" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <h1>
            <span class="action-span"><a href="Shop_M_User.aspx?<%=returnurl %>">会员列表</a></span>
            <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
                class="action-span1">- 修改会员 </span>
        </h1>
        <div class="list-div">
            <table cellspacing='1' cellpadding='3'>
                <tr align="center">
                    <th colspan="2">
                        <%=UserName %>&nbsp;会员资料
                    </th>
                </tr>
                <tr>
                    <td width="10%" align="right">
                        会员号：
                    </td>
                    <td>
                        <%=VipNumber%>
                    </td>
                </tr>
                <tr>
                    <td width="10%" align="right">
                        登录名：
                    </td>
                    <td>
                        <%=VipLoginName %>
                    </td>
                </tr>
                <tr>
                    <td width="10%" align="right">
                        密码：
                    </td>
                    <td>
                        <input type="password" id="Txt_UserPassword" runat="server" class="inputs200text" />
                    </td>
                </tr>
                <tr>
                    <td width="10%" align="right">
                        所在地区：
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="Drp_GuoJi" runat="server" onchange="miaoshutype();">
                                </asp:DropDownList>
                                <%-- <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                  <asp:ListItem Value=" ">请选择省</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                  <asp:ListItem Value=" ">请选择市/区</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList4" runat="server">
                  <asp:ListItem Value=" ">请选择区/县</asp:ListItem>
                </asp:DropDownList>--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        会员类型：
                    </td>
                    <td>
                        <input type="radio" name="usertype" id="rd_type1" value="1" onclick="miaoshutype();" />个人&nbsp;
                        <input type="radio" name="usertype" id="rd_type2" value="2" onclick="miaoshutype();" />公司&nbsp;
                        <input type="radio" name="usertype" id="rd_type3" value="3" onclick="miaoshutype();" />代理机构
                    </td>
                </tr>
               
                <tr id="company" style="display: none;">
                    <td height="32" align="right">
                        公司名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_company" class="inputs200text" maxlength="200"
                            runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr id="companyEn" style="display: none;">
                    <td height="32" align="right">
                        公司英文名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_companyEn" class="inputs200text" maxlength="200" runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr id="daili" style="display: none;">
                    <td height="32" align="right">
                        代理机构名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_dailiName" class="inputs200text" maxlength="200" runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr>
                    <td width="20%" height="32" align="right">
                        联系人名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s10" id="c_Name" class="inputs200text" maxlength="100" runat="server" /><%--<span
                            style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr id="nameEn" style="display: none;">
                    <td height="32" align="right">
                        联系人英文名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_NameEn" class="inputs200text" maxlength="200" runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                
                
                <tr id="idcard" style="display: none;">
                    <td height="32" align="right">
                        联系人身份证：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_Idcard" class="inputs200text" maxlength="30" runat="server" /><%--<span
                            style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr id="youxiao" style="display: none;">
                    <td height="32" align="right">
                        有效证件：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_youxiao" class="inputs200text" maxlength="30"
                            runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                 <tr>
                    <td height="32" align="right">联系人电话：
                  </td>
                    <td align="left">
                        <input type="text" name="text_Call" id="text_Call" runat="server" class="inputs200text"
                            maxlength="30" />
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">联系人传真：
                  </td>
                    <td align="left">
                        <input type="text" id="text_chuanzhen" runat="server" maxlength="30" class="inputs200text" />
                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        行政区划：</td>
                    <td>
                        <select id="live_prov" name="live_prov" onchange="SelCity(this.value);">
                                  <option value="">请选择</option></select>
                                  <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                                  <option value="">请选择</option></select>
                                  <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                                  <option value="">请选择</option></select>
                                   <span class="status error" id="area_div_error"></span>
                                    <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static"  />
                                    <input type="hidden" runat="server" id="Hi_city" clientidmode="Static" />
                                    <input type="hidden" runat="server" id="Hi_country" clientidmode="Static" />
                                    </td>
                </tr>
                 <tr>
                    <td align="right">
                        联系人地址：
                    </td>
                    <td>
                        <textarea rows="2" name="s6" id="text_Address" style="width: 300px; height: 40px;"
                            class="font12000" maxlength="250" runat="server"> </textarea>
                    </td>
                </tr>
                
                <tr id="addressEn" style="display: none;">
                    <td height="32" align="right">
                        联系人英文地址：
                    </td>
                    <td align="left">
                        <textarea rows="2" name="s6" id="c_addressEn" 
                            style="width: 300px; height: 40px;" class="font12000" maxlength="300" runat="server"> </textarea>
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        联系人邮编：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_youbian" class="inputs200text"
                            maxlength="10" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        开启到期短信提醒：
                    </td>
                    <td align="left">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow">
                            <asp:ListItem Value="1">  是  </asp:ListItem>
                            <asp:ListItem Value="0">  否  </asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        手机：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_phone"
                            class="inputs200text" maxlength="30" runat="server" />
                    </td>
                </tr>
               
                <tr>
                    <td height="32" align="right">
                        电子邮箱：
                    </td>
                    <td align="left">
                        <input type="text" name="text_Email" id="text_Email" runat="server" maxlength="100"
                            class="inputs200text" onblur="ClientValidateEmail();" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        关联邮箱：
                    </td>
                    <td align="left">
                        <textarea rows="2" type="text" name="text_Email" id="text_BYEmail" runat="server"
                            style="width: 300px; height: 40px;" class="font12000"></textarea>
                        <br />
                        多个邮箱使用“|”分割，如:123@xx.com|456@xx.com
                    </td>
                </tr>
                
                <tr id="qq" style="display: none;">
                    <td height="32" align="right">
                        QQ：
                    </td>
                    <td align="left">
                        <input type="text" name="text_QQ" id="text_QQ" 
                            runat="server" class="inputs200text" maxlength="50" />
                    </td>
                </tr>
                <tr id="msn" style="display: none;">
                    <td height="32" align="right">
                        MSN：
                    </td>
                    <td align="left">
                        <input type="text" id="text_msn" name="text_msn" runat="server" class="inputs200text"
                            maxlength="100" />
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        主体资格证明：
                    </td>
                    <td align="left">
                        <%=zhutiwenjian %>
                    </td>
                </tr>
                <tr align="center">
                    <th colspan="2">
                        费用信息
                    </th>
                </tr>
                <tr>
                    <td align="right">
                        预付款：
                    </td>
                    <td>
                        <input type="text" id="Txt_VipYuFuKuan" runat="server" class="inputs200text" onkeyup="if(isNaN(value))execCommand('undo')"
                            onafterpaste="if(isNaN(value))execCommand('undo')" />
                    </td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="Txt_VipYuFuKuan" Text="您输入的信息格式有误，请核实"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>
                </tr>
                <tr>
                    <td align="right">
                        余额：
                    </td>
                    <td>
                        <input type="text" id="Txt_VipYuE" runat="server" class="inputs200text" onkeyup="if(isNaN(value))execCommand('undo')"
                            onafterpaste="if(isNaN(value))execCommand('undo')" />
                    </td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="Txt_VipYuE" Text="您输入的信息格式有误，请核实" Display="Dynamic"
                        SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>
                </tr>
                <tr>
                    <td align="right">
                        欠费：
                    </td>
                    <td>
                        <input type="text" id="Txt_VipQianFei" runat="server" class="inputs200text" onkeyup="if(isNaN(value))execCommand('undo')"
                            onafterpaste="if(isNaN(value))execCommand('undo')" />
                    </td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="Txt_VipQianFei" Text="您输入的信息格式有误，请核实"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>
                </tr>
                <tr>
                    <td align="right">
                        币种：
                    </td>
                    <td>
                        <asp:Label ID="T_bizhong" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        权限设定：
                    </th>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        会员权限：
                    </td>
                    <td>
                        <asp:CheckBox ID="Cb_VipPower1" runat="server" />导入&nbsp;&nbsp;
                        <asp:CheckBox ID="Cb_VipPower2" runat="server" />导出&nbsp;&nbsp;
                        <asp:CheckBox ID="Cb_VipPower3" runat="server" />修改&nbsp;&nbsp;
                        <asp:CheckBox ID="Cb_VipPower4" runat="server" />删除&nbsp;&nbsp; 打折设定
                        <asp:TextBox ID="Txt_VipPowerDaZhe" CssClass="inputs60text" runat="server" Text="0"
                            onkeypress="event.returnValue=IsDigitDian();"></asp:TextBox>%
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        是否接收邮件：
                    </td>
                    <td>
                        <asp:CheckBox ID="cb_ReceiveEmail" runat="server" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th colspan="2">
                        备注：
                    </th>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        备注：
                    </td>
                    <td>
                        <textarea runat="server" id="Text_VipBeiZhu" rows="3" class="input" style="width: 400px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                    </td>
                    <td align="left">
                        <%if (pageupdate)
                          {%><asp:Button ID="btUpDate" runat="server" class="button" Text="修改" OnClientClick="return Checkaddu();"
                  OnClick="btUpDate_Click" /><%} %><input type="button" class="button" value="返回" onclick="javascript:window.location='Shop_M_User.aspx?<%=returnurl %>';" />
                    </td>
                </tr>
            </table>
            <script type="text/javascript">
                function checkpass() {
                    var pass = document.getElementById("Txt_VipLoginPwd");
                    if (pass.value.length < 6) {
                        alert("密码长度不能小于6位！");
                        return false;
                    }
                } 
            </script>
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        积分设定：
                    </th>
                </tr>
                <tr>
                    <td align="center">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table cellspacing='1' cellpadding='3'>
                                    <tr>
                                        <td width="20%" align="right">
                                            积分手机号：
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="Txt_VipIntegralMobile" CssClass="inputs100text" runat="server" MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="V0" ControlToValidate="Txt_VipIntegralMobile"
                                                ValidationGroup="A" Display="Dynamic" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ValidationGroup="A" ID="V3" ControlToValidate="Txt_VipIntegralMobile"
                                                Display="Dynamic" SetFocusOnError="true" ValidationExpression="^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$"
                                                ErrorMessage="格式不正确"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            积分手机密码：
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="Txt_VipIntegralPasssWord" TextMode="Password" CssClass="inputs100text"
                                                runat="server" MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="V1" ControlToValidate="Txt_VipIntegralPasssWord"
                                                ValidationGroup="A" Display="Dynamic" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            剩余积分：
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="Txt_VipPowerJiFen" CssClass="inputs60text" MaxLength="4" runat="server"
                                                ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            积分操作：
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="Txt_VipAddJiFen" CssClass="inputs60text" MaxLength="5" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="V4" ControlToValidate="Txt_VipAddJiFen"
                                                ValidationGroup="A" Display="Dynamic" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ValidationGroup="A" ID="V2" ControlToValidate="Txt_VipAddJiFen"
                                                Display="Dynamic" SetFocusOnError="true" ValidationExpression="^-?\d+$" ErrorMessage="格式不正确"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            <asp:Button ID="btn_Integral" runat="server" class="button" Text="修改" ValidationGroup="A"
                                                OnClick="btn_Integral_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th>
                        地址簿
                    </th>
                </tr>
                <tr>
                    <td>
                        <div class="list-div" id="listDiv">
                            <table cellspacing='1' cellpadding='3'>
                                <thead>
                                    <tr>
                                        <th width="15%">
                                            联系人
                                        </th>
                                        <th width="33%">
                                            详细地址
                                        </th>
                                        <th width="12%">
                                            邮政编码
                                        </th>
                                        <th width="12%">
                                            手机
                                        </th>
                                        <th width="12%">
                                            电话
                                        </th>
                                        <th width="16%">
                                            电子邮件
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repitem" runat="server">
                                        <ItemTemplate>
                                            <tr align="center">
                                                <td height="26">
                                                    <%#Eval("nvc_Consignee")%>
                                                </td>
                                                <td>
                                                    <%#Get_GuoJiaName(Eval("i_Gid"))%>&nbsp;&nbsp;<%#Eval("nvc_StreetAddress")%>
                                                </td>
                                                <td>
                                                    <%#Eval("nvc_ZipCode")%>
                                                </td>
                                                <td>
                                                    <%#Eval("nvc_MobilePhone")%>
                                                </td>
                                                <td>
                                                    <%#Eval("nvc_TelPhone")%>
                                                </td>
                                                <td>
                                                    <%#Eval("nvc_Email")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        积分
                    </th>
                </tr>
                <tr>
                    <td>
                        <table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="19%">
                                    变更前积分
                                </th>
                                <th width="20%">
                                    变更积分
                                </th>
                                <th width="19%">
                                    变更后积分
                                </th>
                                <th width="21%">
                                    操作类型
                                </th>
                                <th width="21%">
                                    操作时间
                                </th>
                            </tr>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Repeater ID="Rpt_IntegralNote" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center">
                                                    <%# Eval("i_Integral_1")%>
                                                </td>
                                                <td align="center">
                                                    <%# Convert.ToDecimal(Eval("i_Integral_2").ToString()) > 0 ? ("+" + Eval("i_Integral_2")) : Eval("i_Integral_2")%>
                                                </td>
                                                <td align="center">
                                                    <%# Eval("i_Integral_3")%>
                                                </td>
                                                <td align="center">
                                                    <%# Eval("nvc_NoteType")%>
                                                </td>
                                                <td align="center">
                                                    <%# Eval("dt_AddTime")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </table>
                    </td>
                </tr>
                <%--    <tr>
                    <th>
                        评价
                    </th>
                </tr>
              <tr>
                    <td>
                        <div class="list-div" id="Div10"><table cellspacing='1' cellpadding='3'>
                            <tr>
                                <th width="10%">商品图片</th>
                                <th width="15%">
                                    商品名称
                                </th>
                                <th width="50%">
                                    评价内容
                                </th>
                                <th width="10%">
                                    分数
                                </th>
                                <th width="15%">
                                    发表时间
                                </th>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center"><img src="../pic_Small/<%# Eval("nvc_Picmain") %>" width="60" border="0" /></td>
                                        <td align="center"><a href="Shop_M_Comment.aspx?Keyword=<%# Eval("nvc_ProductName")%>&SType=3" title='<%# Eval("nvc_ProductName")%>'>
                                          <%# Eval("nvc_ProductName").ToString().Length > 10 ? (Eval("nvc_ProductName").ToString().Substring(0, 10) + "...") : Eval("nvc_ProductName").ToString()%></a></td>
                                        <td align="center"><%# Eval("nvc_CommentContent")%></td>
                                        <td align="center"><img src="images/prg_00<%# Eval("i_Fraction") %>.jpg"></td>
                                        <td align="center"><%# Eval("dt_AddTime")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table></div>
                    </td>
                </tr>--%>
                <tr>
                    <th>
                        优惠券
                    </th>
                </tr>
                <tr>
                    <td>
                        <div class="list-div" id="Div13">
                            <table cellspacing='1' cellpadding='3'>
                                <tr>
                                    <th width="11%">
                                        优惠券码
                                    </th>
                                    <th width="16%">
                                        优惠券种类名称
                                    </th>
                                    <th width="6%">
                                        面值
                                    </th>
                                    <th width="6%">
                                        购物满
                                    </th>
                                    <th width="16%">
                                        状态
                                    </th>
                                    <th width="16%">
                                        来源
                                    </th>
                                    <th width="29%">
                                        有效期
                                    </th>
                                </tr>
                                <asp:Repeater ID="Repeater3" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td align="center">
                                                <%# Eval("nvc_Code") %>
                                            </td>
                                            <td align="center">
                                                <%# Eval("nvc_Name") %>
                                            </td>
                                            <td align="center">
                                                <%# Eval("i_Money") %>
                                            </td>
                                            <td align="center">
                                                <%# Eval("i_Where") %>
                                            </td>
                                            <td align="center">
                                                <%# Eval("i_State") != null && Eval("i_State").ToString() == "1" ? "未使用" : Eval("i_State").ToString() == "2" ? "已使用：" + Eval("dt_UpdateStateTime").ToString() : "已作废：" + Eval("dt_UpdateStateTime").ToString()%>
                                            </td>
                                            <td align="center">
                                                <%# Eval("nvc_From") %>
                                            </td>
                                            <td align="center">
                                                <%# Eval("dt_AddTime")%>&nbsp;至&nbsp;<%# Eval("dt_ExpireTime")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="div_a" runat="server">
    </div>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="js/checksb_kefu.js" type="text/javascript"></script>
<script type="text/javascript">
    function checktype() {
        var usertype = $("#hi_usertype").val();
        //alert(usertype);
        if (usertype != "0") {
            if (usertype == "1") {
                document.getElementById("rd_type1").checked = true;
            }
            if (usertype == "2") {
                document.getElementById("rd_type2").checked = true;
            }
            if (usertype == "3") {
                document.getElementById("rd_type3").checked = true;
            }
            miaoshutype();
        }
    }
    function miaoshutype() {
        var rb1 = document.getElementById("rd_type1");
        var rb2 = document.getElementById("rd_type2");
        var rb3 = document.getElementById("rd_type3");
        var guoji = document.getElementById("Drp_GuoJi");
        var nametext = guoji.options[guoji.selectedIndex].text;


        if (guoji.value == 0) {
            alert("请先选择国家！");
            return;
        }
        else {
            if (nametext == "中国") {
                $("#hi_guoji").val("1");
                if (rb1.checked) {
                    $("#hi_usertype").val("1");
                    $("#idcard").show();
                    $("#qq").show();

                    $("#nameEn").hide();
                    $("#youxiao").hide();
                    $("#company").hide();
                    $("#companyEn").hide();
                    $("#daili").hide();
                    $("#msn").hide();
                    $("#addressEn").hide();


                }
                if (rb2.checked) {
                    $("#hi_usertype").val("2");
                    $("#idcard").hide();
                    $("#qq").show();

                    $("#nameEn").hide();
                    $("#youxiao").hide();
                    $("#company").show();
                    $("#companyEn").hide();
                    $("#daili").hide();
                    $("#msn").hide();
                    $("#addressEn").hide();

                }
                if (rb3.checked) {
                    $("#hi_usertype").val("3");
                    $("#idcard").hide();
                    $("#qq").show();

                    $("#nameEn").hide();
                    $("#youxiao").hide();
                    $("#company").hide();
                    $("#companyEn").hide();
                    $("#daili").show();
                    $("#msn").hide();
                    $("#addressEn").hide();
                }
            }
            else {
                if (rb1.checked) {
                    $("#hi_usertype").val("1");
                    $("#idcard").hide();
                    $("#qq").hide();
                    $("#nameEn").show();
                    $("#youxiao").show();
                    $("#company").hide();
                    $("#companyEn").hide();
                    $("#daili").hide();
                    $("#msn").show();
                    $("#addressEn").show();
                }
                if (rb2.checked) {
                    $("#hi_usertype").val("2");
                    $("#idcard").hide();
                    $("#qq").hide();

                    $("#nameEn").show();
                    $("#youxiao").hide();
                    $("#company").show();
                    $("#companyEn").show();
                    $("#daili").hide();
                    $("#msn").show();
                    $("#addressEn").show();

                }
                if (rb3.checked) {
                    $("#hi_usertype").val("3");
                    $("#idcard").hide();
                    $("#qq").hide();
                    $("#nameEn").show();
                    $("#youxiao").hide();
                    $("#company").hide();
                    $("#companyEn").hide();
                    $("#daili").show();
                    $("#msn").show();
                    $("#addressEn").hide();
                }
            }
        }
    }
    function ClientValidatePhone() {
        var id = $("#Hi_MemberId").val();
        var lname = $("#c_phone").val();
        var rand = Math.floor(Math.random() * 1000000);

        $.ajax({
            type: "post",
            async: false,
            url: "../Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
            success: function (msg) {
                if (msg == "1") {
                    alert("该手机号码已注册！");
                    $("#c_phone").focus();
                }
            }
        });
    }
    function ClientValidateEmail() {
        var lname = $("#text_Email").val();
        var id = $("#Hi_MemberId").val();
        // alert(lname);
        var rand = Math.floor(Math.random() * 1000000);
        $.ajax({
            type: "post",
            async: false,
            url: "../Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=email&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
            success: function (msg) {
                if (msg == "1") {
                    alert("该邮箱已注册！");
                    $("#text_Email").focus();
                }
            }
        });
    }
    //      function ClientValidate(source) {
    //          var lname = $("#Txt_UserAccount").val();
    //          var rand = Math.floor(Math.random() * 1000000);
    //          $.ajax({
    //              type: "post",
    //              async: false,
    //              url: "../Handler.ashx",
    //              contentType: "application/x-www-form-urlencoded; charset=utf-8",
    //              data: "flag=name&membertype=2&uName=" + lname + "&n=" + rand,
    //              success: function (msg) {
    //                  if (msg == "1") {
    //                      alert("该用户名已存在！");
    //                      return false;
    //                  }
    //              }
    //          });
    //      }
</script>
