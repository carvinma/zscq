<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_U_User.aspx.cs" Inherits="Shop_Manage_shop_modify" %>

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
  <input type="hidden" id="Hi_MemberId" runat="server" value="" />
  <div>
    <h1>
      <span class="action-span"><a href="Shop_M_User.aspx?<%=returnurl %>">会员列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 修改会员 </span>
      <div style="clear: both">
      </div>
    </h1>
    <div class="list-div" id="list-div">
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th colspan="2">
            <%=UserName %>&nbsp;详细资料
          </th>
        </tr>
        <tr>
          <td width="20%" align="right">会员号：</td>
          <td>
            <asp:TextBox ID="Ltl_VipNumber" runat="server" class="inputs200text" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Ltl_VipNumber" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Ltl_VipNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w\.]{9,10}"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">登录名：</td>
          <td>
            <asp:Literal ID="Ltl_VipLoginName" runat="server"></asp:Literal>
          </td>
        </tr>
        <tr>
          <td align="right">密码：</td>
          <td>
            <input type="password" id="Txt_VipLoginPwd" runat="server" class="inputs200text" />
          </td>
        </tr>
        <tr>
          <td align="right">注册日期：</td>
          <td>
            <asp:Literal ID="Ltl_VipRegisterTime" runat="server"></asp:Literal>
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
            <input type="text" id="Txt_VipKeHuName" runat="server" class="inputs200text" maxlength="50" /></td>
        </tr>
        <tr>
          <td align="right">英文名称：</td>
          <td>
            <input type="text" id="Txt_VipKeHuEngLishName" runat="server" class="inputs200text" maxlength="200" /></td>
        </tr>
          <tr>
              <td align="right">
                  会员类型：
              </td>
              <td align="left">
                  <asp:RadioButtonList ID="RadioButtonList20" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                      <asp:ListItem Value="1">  个人  </asp:ListItem>
                      <asp:ListItem Value="2" Selected="True">  企业  </asp:ListItem>
                      <asp:ListItem Value="3" Selected="True">  事务所  </asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
        <tr>
          <td align="right">所在国家：</td>
          <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                <asp:DropDownList ID="Drp_GuoJi" runat="server">
                </asp:DropDownList>
                <%--<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
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
          <td align="right">详细地址：</td>
          <td>
            <input type="text" id="Txt_Address" runat="server" size="36" class="inputs200text" maxlength="250" style="width:300px;" /></td>
        </tr>
        <tr>
          <td align="right">邮编：</td>
          <td>
            <input type="text" id="Txt_VipZipCode" runat="server" class="inputs200text" maxlength="6" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipZipCode" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[1-9]\d*$">
            </asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">公司主页：</td>
          <td>
            <input type="text" id="Txt_VipCompanyHomePage" runat="server" class="inputs200text" maxlength="50" /></td>
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
            <input type="text" id="Txt_VipLinkManName" runat="server" class="inputs200text" maxlength="20" /></td>
        </tr>
        <tr>
          <td align="right">开启到期短信提醒： </td>
          <td align="left">
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="1">  是  </asp:ListItem>
              <asp:ListItem Value="0" Selected="True">  否  </asp:ListItem>
            </asp:RadioButtonList>
          </td>
        </tr>
        <tr>
          <td align="right">手机：</td><%-- onkeypress="event.returnValue=IsDigit();"--%>
          <td>
            <input type="text" id="Txt_VipLinkManMobilePhone" runat="server" class="inputs200text" maxlength="20" />
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManMobilePhone" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>--%>
            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManMobilePhone" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^1(3|5|8)\d{9}$">
            </asp:RegularExpressionValidator>--%>
            <%--<asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="CustomValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManMobilePhone" Display="Dynamic" SetFocusOnError="true" Text="手机号已被注册过！" ClientValidationFunction="ClientValidatePhone"></asp:CustomValidator>--%>
          </td>
        </tr>
        <tr>
          <td align="right">传真：</td>
          <td>
            <input type="text" id="Txt_VipLinkManFax" runat="server" class="inputs200text" maxlength="20" /></td>
        </tr>
        <tr>
          <td align="right">电话：</td>
          <td>
            <input type="text" id="Txt_VipLinkManPhone" runat="server" class="inputs200text" maxlength="20" /></td>
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
            多个邮箱使用“|”分割，如：123@xx.com|456@xx.com
          </td>
        </tr>
        <tr>
          <td align="right">QQ：</td>
          <td>
            <input type="text" id="Txt_VipLinkManQQ" runat="server" class="inputs200text" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipLinkManQQ" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[1-9][0-9]{4,}">
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
              <asp:ListItem Value="1">  男  </asp:ListItem>
              <asp:ListItem Value="0">  女  </asp:ListItem>
            </asp:RadioButtonList>
          </td>
        </tr>
      </table>
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th colspan="2">
            费用信息
          </th>
        </tr>
        <tr>
          <td width="20%" align="right">预付款：</td>
          <td>
            <input type="text" id="Txt_VipYuFuKuan" runat="server" class="inputs60text" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipYuFuKuan" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">余额：</td>
          <td>
            <input type="text" id="Txt_VipYuE" runat="server" class="inputs60text" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipYuE" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">欠费：</td>
          <td>
            <input type="text" id="Txt_VipQianFei" runat="server" class="inputs60text" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipQianFei" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td align="right">币种：</td>
          <td>
            <asp:Literal ID="Ltl_BiZhong" runat="server"></asp:Literal>
          </td>
        </tr>
        <tr>
          <td align="right">信用等级：</td>
          <td>
            <asp:DropDownList ID="DDL_Grade" runat="server">
            </asp:DropDownList>
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
          <td width="20%" align="right">会员权限：</td>
          <td>
            <asp:CheckBox ID="Cb_VipPower1" runat="server" />导入&nbsp;&nbsp;
            <asp:CheckBox ID="Cb_VipPower2" runat="server" />导出&nbsp;&nbsp;
            <asp:CheckBox ID="Cb_VipPower3" runat="server" />修改&nbsp;&nbsp;
            <asp:CheckBox ID="Cb_VipPower4" runat="server" />删除 &nbsp;&nbsp; 打折设定
            <asp:TextBox ID="Txt_VipPowerDaZhe" CssClass="inputs60text" runat="server"></asp:TextBox>%
            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_VipPowerDaZhe" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*$"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td width="20%" align="right">是否接收邮件：</td>
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
              {%><asp:Button ID="btUpDate" runat="server" class="button" Text="修改" ValidationGroup="a" OnClick="btUpDate_Click" /><%} %><input type="button" class="button" value="返回" onclick="javascript:window.location='Shop_M_User.aspx?<%=returnurl %>';" />
          </td>
        </tr>
      </table>
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
                    <td width="20%" align="right">积分手机号：</td>
                    <td align="left">
                      <asp:TextBox ID="Txt_VipIntegralMobile" CssClass="inputs100text" runat="server" MaxLength="15"></asp:TextBox>
                      <asp:RequiredFieldValidator runat="server" ID="V0" ControlToValidate="Txt_VipIntegralMobile" ValidationGroup="A" Display="Dynamic" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator runat="server" ValidationGroup="A" ID="V3" ControlToValidate="Txt_VipIntegralMobile" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$" ErrorMessage="格式不正确"></asp:RegularExpressionValidator>
                    </td>
                  </tr>
                  <tr>
                    <td align="right">积分手机密码：</td>
                    <td align="left">
                      <asp:TextBox ID="Txt_VipIntegralPasssWord" TextMode="Password" CssClass="inputs100text" runat="server" MaxLength="15"></asp:TextBox>
                      <asp:RequiredFieldValidator runat="server" ID="V1" ControlToValidate="Txt_VipIntegralPasssWord" ValidationGroup="A" Display="Dynamic" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr>
                    <td align="right">剩余积分：</td>
                    <td align="left">
                      <asp:TextBox ID="Txt_VipPowerJiFen" CssClass="inputs60text" MaxLength="4" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                  </tr>
                  <tr>
                    <td align="right">积分操作：</td>
                    <td align="left">
                      <asp:TextBox ID="Txt_VipAddJiFen" CssClass="inputs60text" MaxLength="5" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator runat="server" ID="V4" ControlToValidate="Txt_VipAddJiFen" ValidationGroup="A" Display="Dynamic" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator runat="server" ValidationGroup="A" ID="V2" ControlToValidate="Txt_VipAddJiFen" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^-?\d+$" ErrorMessage="格式不正确"></asp:RegularExpressionValidator>
                    </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="left">
                      <asp:Button ID="btn_Integral" runat="server" class="button" Text="修改" ValidationGroup="A" OnClick="btn_Integral_Click" />
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
                    <th width="13%">
                      联系人
                    </th>
                    <th width="35%">
                      详细地址
                    </th>
                    <th width="11%">
                      邮政编码
                    </th>
                    <th width="12%">
                      手机
                    </th>
                    <th width="13%">
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
                          <%#Eval("nvc_Consignee")%></td>
                        <td>
                          <%#Get_GuoJiaName(Eval("i_Gid"))%>&nbsp;&nbsp;<%#Eval("nvc_StreetAddress")%></td>
                        <td>
                          <%#Eval("nvc_ZipCode")%></td>
                        <td>
                          <%#Eval("nvc_MobilePhone")%></td>
                        <td>
                          <%#Eval("nvc_TelPhone")%></td>
                        <td>
                          <%#Eval("nvc_Email")%></td>
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
                          <%# Eval("i_Integral_1")%></td>
                        <td align="center">
                          <%# Convert.ToDecimal(Eval("i_Integral_2").ToString()) > 0 ? ("+" + Eval("i_Integral_2")) : Eval("i_Integral_2")%></td>
                        <td align="center">
                          <%# Eval("i_Integral_3")%></td>
                        <td align="center">
                          <%# Eval("nvc_NoteType")%></td>
                        <td align="center">
                          <%# Eval("dt_AddTime")%></td>
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
                                <th width="20%">
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
                        <%# Eval("nvc_Code") %></td>
                      <td align="center">
                        <%# Eval("nvc_Name") %></td>
                      <td align="center">
                        <%# Eval("i_Money") %></td>
                      <td align="center">
                        <%# Eval("i_Where") %></td>
                      <td align="center">
                        <%# Eval("i_State") != null && Eval("i_State").ToString() == "1" ? "未使用" : Eval("i_State").ToString() == "2" ? "已使用：" + Eval("dt_UpdateStateTime").ToString() : "已作废：" + Eval("dt_UpdateStateTime").ToString()%></td>
                      <td align="center">
                        <%# Eval("nvc_From") %></td>
                      <td align="center">
                        <%# Eval("dt_AddTime")%>&nbsp;至&nbsp;<%# Eval("dt_ExpireTime")%></td>
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
    <input type="hidden" id="hi_phone" value="" />
  <input type="hidden" id="hi_email" value="" />
  <div id="div_a" runat="server">
  </div>
  </form>
  <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
  function ClientValidatePhone(source, arguments) {
    var mid = $("#Hi_MemberId").val();
    var lname = $("#Txt_VipLinkManMobilePhone").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "../Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=phone&membertype=1&memberId=" + mid + "&uName=" + lname + "&n=" + rand,
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
    var mid = $("#Hi_MemberId").val();
    var lname = $("#Txt_VipLinkManEmail").val();
    var rand = Math.floor(Math.random() * 1000000);
    $.ajax({
      type: "post",
      async: false,
      url: "../Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=email&membertype=1&memberId=" + mid + "&uName=" + lname + "&n=" + rand,
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
