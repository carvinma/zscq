<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateWxOrder.aspx.cs" Inherits="WxPay_CreateWxOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>
            <table style="width:33%;">
                <tr style="height:40px;">
                    <td style="width:150px;">咨询商标名称:</td>
                    <td><asp:TextBox ID="txtSbName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>商品/服务项目:</td>
                    <td><asp:TextBox ID="ServcieName" runat="server"></asp:TextBox></td>
                   
                </tr>
                 <tr>
                    <td>联系人:</td>
                    <td><asp:TextBox ID="txtPerson" runat="server"></asp:TextBox></td>                  
                </tr>
                <tr>
                    <td>回复电话:</td>
                    <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>                  
                </tr>
                  <tr>
                    <td></td>
                    <td><asp:Button ID="btnSubmit" runat="server" Text="提交订单" OnClick="btnSubmit_Click" /></td>                  
                </tr>
            </table>
        </div>
    
    </div>
        
    </form>
</body>
</html>
