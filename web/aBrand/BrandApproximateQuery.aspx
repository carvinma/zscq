<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BrandApproximateQuery.aspx.cs" Inherits="BrandApproximateQuery" %>
<%@ Register Src="../ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div  style="text-align:center;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;" height="112">
    <tr>
      <td height="127" valign="top" align="center">
        <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
          <tr>
            <td height="127" align="left" valign="top">
              <table width="915" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="667" height="52" align="left" valign="top"><table width="200" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="103">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="left">&nbsp;<a href="../index.aspx">返回首页&gt;&gt;</a></td>
                    </tr>
                  </table></td>
                  <td width="248" align="left" valign="top">
                    <table width="248" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="248" height="65" colspan="7"></td>
                      </tr>
                      <tr>
                        <td height="62" colspan="7" align="right" valign="top"><a href="../index.aspx"><img src="../images/logo1.gif" width="236" height="62" border="0" /></a> </td>
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
    <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
    <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
        <td colspan="2" align="left" valign="top" style="line-height:21px;word-break:break-all;word-wrap:break-word;"> 
          <div style="min-height: 355px;*+height:100%;_height:355px;">
           <asp:Literal ID="Ltl_LoginInfo" runat="server" ></asp:Literal>
           </div>
        </td>
     </tr>
    </table>
    <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr><td height="20px"></td></tr>
    <tr>
       <td align="center"><a href="../Register.aspx?flag=sb" class="BtnShowhref"  style="width:80px">新会员注册</a></td>
       <td align="center"><a href="../Login.aspx?flag=sb" class="BtnShowhref" style="width:80px">已有账号登录</a> </td>
    </tr>
    </table>
    </div>
      <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
