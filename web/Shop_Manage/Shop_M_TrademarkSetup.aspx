<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_M_TrademarkSetup.aspx.cs"
    Inherits="Shop_Manage_shop_upsystem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/vcom.js"></script>

    <script src="js/Calendar.js" type="text/javascript"></script>

    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript">
    function IsDigit()
    {
          return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
    </script>
</head>
<body>
    <h1>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span
            id="search_id" class="action-span1">- 商标费用设置 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <form id="form1" runat="server">
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                     商标费用基本信息
                </th>
            </tr>
            <tr>
                <td width="200" align="right">
                    商标官费：
                </td>
                <td>
                  <input type="text" runat="server" id="dlguanfei" class="inputs80text" maxlength="8" />   
                   <img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="请填写钱币金额,以人民币为标准。例：100.00" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="dlguanfei" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="dlguanfei" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator> </td>
            </tr>
            <tr>
                <td align="right">
                    商标代理费：
                </td>
                <td>  <input type="text" runat="server" id="dldaili" class="inputs80text" maxlength="8" />
                  <img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="请填写钱币金额,以人民币为标准。例：100.00"/><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="dldaili" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>  </td>
            </tr>
            <tr>
                <td align="right">
                    商标滞纳金：
                </td>
                <td>
                <input type="text" runat="server" id="dlzhinajin" class="inputs80text" maxlength="8" />
                  <img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="请填写钱币金额,以人民币为标准。例：100.00"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="dlzhinajin" Text="您输入的信息格式有误，请核实" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]\d*\.\d*|0\.\d*[0-9]\d*$"></asp:RegularExpressionValidator>  </td>
            </tr>
        </table>
    </div>
    <br />
    <br /> 
    <div class="list-div" id="Div1">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <td width="200"></td>
                <td><% if (pageupdate)
                    { %><asp:Button ID="btnUpdate" runat="server" Text="修改" ValidationGroup="a" class="button"
                        OnClick="btnUpdate_Click" /><%} %>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div id="div_a" runat="server"></div>
    </form>
    <script type="text/javascript" src="js/ss.js"></script>
  <!-- #include file="push.html" -->  
</body>
</html>
