<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_User.aspx.cs" Inherits="Shop_Manage_Shop_A_User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
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
  </script>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <h1>
      <span class="action-span"><a href="Shop_M_User.aspx?type=1">会员列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 添加会员 </span>
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
          <td width="20%" align="right">登录名：</td>
          <td>
            <input type="text" id="Txt_UserAccount" runat="server" class="inputs200text" maxlength="20" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_UserAccount" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="Txt_UserAccount" Display="Dynamic" SetFocusOnError="true" Text="用户名已存在！" ClientValidationFunction="ClientValidate"></asp:CustomValidator>
          </td>
        </tr>
        <tr>
          <td width="20%" align="right">密码：</td>
          <td>
            <input type="password" id="Txt_UserPassword" runat="server" class="inputs200text" maxlength="20" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_UserPassword" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td width="20%" align="right">确认密码：</td>
          <td>
            <input type="password" id="Txt_UserPasswords" runat="server" class="inputs200text" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_UserPasswords" Display="Dynamic" SetFocusOnError="true" Text="请确认密码！"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ValidationGroup="a" ControlToValidate="Txt_UserPasswords" SetFocusOnError="true" ControlToCompare="Txt_UserPassword" Text="密码输入不一致！"></asp:CompareValidator>
          </td>
        </tr>
      </table>
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th colspan="2">
            公司信息
          </th>
        </tr>
        <tr>
          <td width="20%" align="right">客户名称：</td>
          <td>
            <input type="text" id="Txt_VipKeHuName" runat="server" class="inputs200text" maxlength="50" />
            </td>
        </tr>
        <tr>
          <td align="right">英文名称：</td>
          <td>
            <input type="text" id="Txt_VipKeHuEngLishName" runat="server" class="inputs200text" maxlength="200" />
            </td>
        </tr>
        <tr>
          <td align="right">会员类型： </td>
          <td>
            <input type="radio" name="usertype" id="rd_type1" value="1" runat="server" checked="true" />个人 &nbsp;
            <input type="radio" name="usertype" id="rd_type2" value="2" runat="server" />企业&nbsp;
            <input type="radio" name="usertype" id="rd_type3" value="3" runat="server" />事务所 </td>
        </tr>
        <tr>
          <td align="right">所在地区：</td>
          <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                <asp:DropDownList ID="Drp_GuoJi" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                <%--<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                  <asp:ListItem Value="0">请选择省</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                  <asp:ListItem Value="0">请选择市/区</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList4" runat="server">
                  <asp:ListItem Value="0">请选择区/县</asp:ListItem>
                </asp:DropDownList>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Drp_GuoJi" Display="Dynamic" SetFocusOnError="true" Text="请选择国家！" InitialValue="0"></asp:RequiredFieldValidator>
              </ContentTemplate>
            </asp:UpdatePanel>
          </td>
        </tr>
        <tr>
          <td align="right">详细地址：</td>
          <td>
            <input type="text" id="Txt_Address" runat="server" size="36" maxlength="300" class="inputs200text" /></td>
        </tr>
        <tr>
          <td align="right">邮编：</td>
          <td>
            <input type="text" id="Txt_VipZipCode" runat="server" class="inputs200text" maxlength="6" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipZipCode" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[1-9]\d*$">
            </asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">公司主页：</td>
          <td>
            <input type="text" id="Txt_VipCompanyHomePage" runat="server" class="inputs200text" maxlength="100" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipCompanyHomePage" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">
            </asp:RegularExpressionValidator>
          </td>
        </tr>
      </table>
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th colspan="2">
            联系人信息
          </th>
        </tr>
        <tr>
          <td width="20%" align="right">姓名：</td>
          <td>
            <input type="text" id="Txt_VipLinkManName" runat="server" class="inputs200text" maxlength="20" />
          </td>
        </tr>
        <tr>
          <td align="right">手机：</td>
          <td>
            <input type="text" id="Txt_VipLinkManMobilePhone" runat="server" class="inputs200text" maxlength="20" />
            
          </td>
        </tr>
        <tr>
          <td align="right">电子邮箱：</td>
          <td>
            <input type="text" id="Txt_VipLinkManEmail" runat="server" class="inputs200text" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManEmail" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManEmail" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManEmail" Display="Dynamic" SetFocusOnError="true" Text="邮箱已被注册过！" ClientValidationFunction="ClientValidateEmail"></asp:CustomValidator>
          </td>
        </tr>
        <tr>
          <td align="right">关联邮箱： </td>
          <td align="left">
            <textarea rows="2" type="text" name="text_Email" id="text_BYEmail" runat="server" style="width: 300px; height: 40px;" class="font12000"></textarea>
            <br />
            多个邮箱使用“|”分割，如：123@xx.com|456@xx.com </td>
        </tr>
        <tr>
          <td align="right">传真：</td>
          <td>
            <input type="text" id="Txt_VipLinkManFax" runat="server" class="inputs200text" maxlength="20" /></td>
        </tr>
        <tr>
          <td align="right">电话：</td>
          <td>
            <input type="text" id="Txt_VipLinkManPhone" runat="server" class="inputs200text" maxlength="20" />
          </td>
        </tr>
        <tr>
          <td align="right">QQ：</td>
          <td>
            <input type="text" id="Txt_VipLinkManQQ" runat="server" class="inputs200text" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManQQ" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[1-9][0-9]{4,}">
            </asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">SKYPE：</td>
          <td>
            <input type="text" id="Txt_VipLinkManSKYPE" runat="server" class="inputs200text" maxlength="20" /></td>
        </tr>
        <tr>
          <td align="right">MSN：</td>
          <td>
            <input type="text" id="Txt_VipLinkManMSN" runat="server" class="inputs200text" maxlength="20" /></td>
        </tr>
        <tr>
          <td align="right">性别：</td>
          <td>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="1" Selected="True">男</asp:ListItem>
              <asp:ListItem Value="0">女</asp:ListItem>
            </asp:RadioButtonList>
          </td>
        </tr>
        <tr>
          <td align="right">等级：</td>
          <td>
            <asp:DropDownList ID="DDL_Grade" runat="server">
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td align="right">是否接收邮件：</td>
          <td>
            <asp:CheckBox ID="cb_ReceiveEmail" runat="server" />
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
          <td width="20%" align="right">备注：</td>
          <td>
            <textarea runat="server" id="Text_VipBeiZhu" rows="3" class="input" style="width: 400px;"></textarea>
          </td>
        </tr>
        <tr>
          <td></td>
          <td>
            <%if (pageupdate)
              {%><asp:Button ID="btUpDate" runat="server" class="button" Text="添加" ValidationGroup="a" OnClick="btUpDate_Click" /><%} %>
            <input type="button" class="button" value="返回" onclick="javascript:window.location='Shop_M_User.aspx?type=1';" />
          </td>
        </tr>
      </table>
    </div>
  </div>
  <div id="div_a" runat="server">
  </div>
  <input type="hidden" id="hi_name" value="" />
  <input type="hidden" id="hi_phone" value="" />
  <input type="hidden" id="hi_email" value="" />
  </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript">
  function ClientValidate(source, arguments) {
    var lname = $("#Txt_UserAccount").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "../Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=name&membertype=1&uName=" + lname + "&n=" + rand,
      success: function (msg) {
        $("#hi_name").val(msg);
      }
    });
    if ($("#hi_name").val() == "1") {
      arguments.IsValid = false;
    }
    else {
      arguments.IsValid = true;
    }
  }
  function ClientValidatePhone(source, arguments) {
    var lname = $("#Txt_VipLinkManMobilePhone").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "../Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=phone&membertype=1&uName=" + lname + "&n=" + rand,
      success: function (msg) {
        $("#hi_phone").val(msg);
      }
    });
    if ($("#hi_phone").val() == "1") {
      arguments.IsValid = false;
    }
    else {
      arguments.IsValid = true;
    }
  }
  function ClientValidateEmail(source, arguments) {
    var lname = $("#Txt_VipLinkManEmail").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "../Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=email&membertype=1&uName=" + lname + "&n=" + rand,
      success: function (msg) {
        $("#hi_email").val(msg);
      }
    });
    if ($("#hi_email").val() == "1") {
      arguments.IsValid = false;
    }
    else {
      arguments.IsValid = true;
    }
  }
</script>
