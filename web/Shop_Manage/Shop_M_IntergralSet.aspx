<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_M_IntergralSet.aspx.cs" Inherits="Shop_Manage_shop_upsystem" %>

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
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
</head>
<body>
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 积分设置 </span>
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
          积分设置
        </th>
      </tr>
      <tr>
        <td width="200" align="right">专利： </td>
        <td>
        一个专利<asp:TextBox ID="Txt_PatentIntergral" class="inputs80text" runat="server" MaxLength="6"></asp:TextBox>积分
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_PatentIntergral" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_PatentIntergral" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,6}">
                </asp:RegularExpressionValidator>
        </td>
      </tr>
      <tr>
        <td align="right">商标： </td>
        <td>
          一个商标<asp:TextBox ID="Txt_SbIntergral" class="inputs80text" runat="server" MaxLength="6"></asp:TextBox>积分
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="a" ControlToValidate="Txt_SbIntergral" Display="Dynamic" SetFocusOnError="true" Text="不能为空！"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="Txt_SbIntergral" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,6}">
                </asp:RegularExpressionValidator>
          </td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <div class="list-div" id="Div1">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="200"></td>
        <td>
          <% if (pageupdate)
             { %><asp:Button ID="btnUpdate" runat="server" Text="修改" class="button" ValidationGroup="a" OnClick="btnUpdate_Click" /><%} %>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div id="div_a" runat="server">
  </div>
  </form>
  <script type="text/javascript" src="js/ss.js"></script>
        <!-- #include file="push.html" -->    
</body>
</html>

