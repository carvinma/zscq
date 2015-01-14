<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_SBUser.aspx.cs" Inherits="Shop_Manage_Shop_A_SBUser" %>

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
        function IsDigitDian() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57) || event.keyCode == 46);
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

        function InitProCityArea() {
            SelProv();
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
            InitProCityArea();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="hi_guoji" type="hidden" runat="server" value="0" />
    <input id="hi_usertype" type="hidden" runat="server" value="1" />
    <div>
        <h1>
            <span class="action-span"><a href="Shop_M_User.aspx?type=2">会员列表</a></span> <span
                class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
                    class="action-span1">- 添加会员 </span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="list-div" id="list-div">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        详细资料
                    </th>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        用户名：
                    </td>
                    <td>
                        <input type="text" id="Txt_UserAccount" runat="server" class="inputs200text" onblur="ClientValidate();" />
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        密码：
                    </td>
                    <td>
                        <input type="password" id="Txt_UserPassword" runat="server" class="inputs200text" />
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        确认密码：
                    </td>
                    <td>
                        <input type="password" id="Txt_UserPassword2" runat="server" class="inputs200text" />
                    </td>
                </tr>
            </table>
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        用户选择
                    </th>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        所属国籍：
                    </td>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:DropDownList ID="Drp_GuoJi" runat="server" onchange="miaoshutype();">
                        </asp:DropDownList>
                        <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
             <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                  <asp:ListItem Value=" ">请选择省</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                  <asp:ListItem Value=" ">请选择市/区</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList4" runat="server">
                  <asp:ListItem Value=" ">请选择区/县</asp:ListItem>
                </asp:DropDownList>
              </ContentTemplate>
            </asp:UpdatePanel>--%>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="right">
                        会员类型：
                    </td>
                    <td>
                        <input type="radio" name="usertype" id="rd_type1" value="1" onclick="miaoshutype();"
                            checked="checked" />个人&nbsp;
                        <input type="radio" name="usertype" id="rd_type2" value="2" onclick="miaoshutype();" />公司&nbsp;
                        <input type="radio" name="usertype" id="rd_type3" value="3" onclick="miaoshutype();" />代理机构
                    </td>
                </tr>
            </table>
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                        联系人信息
                    </th>
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
                        <input type="text" name="s8" id="c_companyEn" class="font12000" maxlength="200" runat="server" />
                    </td>
                </tr>
                <tr id="daili" style="display: none;">
                    <td height="32" align="right">
                        代理机构名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_dailiName" class="inputs200text" maxlength="200"
                            runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr>
                    <td width="20%" height="32" align="right">
                        联系人名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s10" id="c_Name" class="inputs200text" maxlength="100" runat="server" /><%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr id="nameEn" style="display: none;">
                    <td height="32" align="right">
                        联系人英文名称：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_NameEn" class="inputs200text" maxlength="200"
                            runat="server" />
                    </td>
                </tr>
                <tr id="idcard" style="display: none;">
                    <td height="32" align="right">
                        联系人身份证：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_Idcard" class="inputs200text" maxlength="30" runat="server" /><%--<span style="color: Red;">*</span>--%>
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
                    <td height="32" align="right">
                        联系人电话：
                    </td>
                    <td align="left">
                        <input type="text" name="text_Call" id="text_Call" runat="server" class="inputs200text"
                            maxlength="30" />
                        <%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        联系人传真：
                    </td>
                    <td align="left">
                        <input type="text" id="text_chuanzhen" runat="server" maxlength="30" class="inputs200text" />
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        行政区划：
                    </td>
                    <td align="left">
                        <select id="live_prov" name="live_prov" onchange="SelCity(this.value);">
                            <option value="">请选择</option>
                        </select>
                        <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                            <option value="">请选择</option>
                        </select>
                        <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                            <option value="">请选择</option>
                        </select>
                        <span class="status error" id="area_div_error"></span>
                        <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static" />
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
                            class="font12000" maxlength="250" runat="server"></textarea>
                        <%--<span style="color: Red;">*</span>--%>
                    </td>
                </tr>
                <tr id="addressEn" style="display: none;">
                    <td height="32" align="right">
                        联系人英文地址：
                    </td>
                    <td align="left">
                        <textarea rows="2" name="s6" id="c_addressEn" style="width: 300px; height: 40px;"
                            class="font12000" maxlength="300" runat="server"></textarea>
                        <%--<span style="color: Red;">*</span> --%>
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        联系人邮编：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_youbian" class="inputs200text" maxlength="10"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        手机：
                    </td>
                    <td align="left">
                        <input type="text" name="s8" id="c_phone" class="inputs200text" maxlength="30" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right">
                        电子邮箱：
                    </td>
                    <td align="left">
                        <input type="text" name="text_Email" id="text_Email" runat="server" maxlength="100"
                            class="inputs200text" onblur="ClientValidateEmail();" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        关联邮箱：
                    </td>
                    <td align="left">
                        <textarea rows="2" type="text" name="text_Email" id="text_BYEmail" runat="server"
                            style="width: 300px; height: 40px;" class="font12000"></textarea>
                        <br />
                        多个邮箱使用“|”分割，如：123@xx.com|456@xx.com
                    </td>
                </tr>
                <tr id="qq" style="display: none;">
                    <td height="32" align="right">
                        QQ：
                    </td>
                    <td align="left">
                        <input type="text" name="text_QQ" id="text_QQ" runat="server" class="inputs200text"
                            maxlength="50" />
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
            </table>
            <table cellspacing='1' cellpadding='3'>
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
                    <td>
                    </td>
                    <td>
                        <%if (pageupdate)
                          {%><asp:Button ID="btUpDate" runat="server" class="button" Text="添加" OnClick="btUpDate_Click"
                  OnClientClick="return Checkadd();" /><%} %>
                        <input type="button" class="button" value="返回" onclick="javascript:window.location='Shop_M_User.aspx?type=2';" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <input type="hidden" id="hi_name" value="" />
    <script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
    <script src="js/checksb_kefu.js" type="text/javascript"></script>
    <script type="text/javascript">

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
            var lname = $("#c_phone").val();
            var rand = Math.floor(Math.random() * 1000000);
            //alert(lname);
            $.ajax({
                type: "post",
                async: false,
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=phone&membertype=2&uName=" + lname + "&n=" + rand,
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
            var rand = Math.floor(Math.random() * 1000000);
            $.ajax({
                type: "post",
                async: false,
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=email&membertype=2&uName=" + lname + "&n=" + rand,
                success: function (msg) {
                    if (msg == "1") {
                        alert("该邮箱已注册！");
                        $("#text_Email").focus();
                    }
                }
            });
        }
        function ClientValidate() {
            var lname = $("#Txt_UserAccount").val();
            var rand = Math.floor(Math.random() * 1000000);
            $.ajax({
                type: "post",
                async: false,
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=name&membertype=2&uName=" + lname + "&n=" + rand,
                success: function (msg) {
                    if (msg == "1") {
                        alert("该用户名已存在！");
                        return false;
                    }
                }
            });
        }
    </script>
    <div id="div_a" runat="server">
    </div>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript">
    //    function Checkadd() {
    //        var guoji = document.getElementById("Drp_GuoJi");
    //        if (guoji.value == 0) {
    //            alert("请先选择国家！");
    //            return false;
    //        }
    //    }
</script>
