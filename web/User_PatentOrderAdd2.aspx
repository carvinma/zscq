<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentOrderAdd2.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>成功提交订单_我的专利订单_服务中心_会员中心_专利系统_环球汇通</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <style type="text/css">
        .style1
        {
            width: 25px;
        }
    </style>
</head>
<body id="index">
    <form id="form1" runat="server">
    <asp:HiddenField ID="HF_oId" runat="server" Value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
      <tr>
        <td height="3"></td>
      </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;background-color: #fff;">
      <tr>
        <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <!--专利左侧START-->
         <uc3:patentleft ID="patentleft1" runat="server" />
        <!--专利左侧END-->
        </td>
        <td align="left" valign="top"><table width="741" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);"><table width="739" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38" height="28">&nbsp;</td>
            <td width="701">&nbsp;</td>
            </tr>
          <tr>
            <td height="19">&nbsp;</td>
             <td align="left">首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的专利订单 >> 成功提交订单</td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="639" valign="top"><table width="716" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="28">&nbsp;</td>
            <td width="691">&nbsp;</td>
            </tr>
          <tr>
            <td height="123">&nbsp;</td>
            <td width="691" align="left" valign="top"><table width="689" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="107" align="left" valign="top"><table width="687" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="132" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="115" align="center" class="font12bt">成功提交订单</td>
                            <td width="7"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="26" align="left"></td>
                      </tr>
                    </table>
                      <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                        <tr class="orderxx">
                          <td height="30" align="left" valign="middle" width="35%">
                          <span class="ordertext">
                          您的订单号：<asp:Literal ID="Ltl_OrderNum" runat="server"></asp:Literal>
                          </span>
                          </td>
                          <td  height="30" align="left" valign="middle" width="30%">
                          <span class="ordertext">
                          应付金额：<asp:Literal ID="Ltl_Money" runat="server"></asp:Literal>
                          </span>
                          </td>
                          <td  height="30" align="left" valign="middle" width="30%">
                          <span class="ordertext">
                          支付方式：<asp:Literal ID="Ltl_PayType" runat="server"></asp:Literal>
                          </span>
                          </td>
                        </tr>
                      </table>
                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle" width="35%">
                      会员号：<asp:Literal ID="Ltl_MemberNum" runat="server"></asp:Literal>
                      </td>
                      <td height="30" align="left" valign="middle" width="60%">
                      用户名：<asp:Literal ID="Ltl_MemberName" runat="server"></asp:Literal>
                      </td>
                    </tr>
                    </table>
                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle" width="35%">
                      提交时间：<asp:Literal ID="Ltl_AddTime" runat="server"></asp:Literal>
                      </td>
                      <td height="30" align="left" valign="middle" width="60%">
                      订单状态：<asp:Literal ID="Ltl_Status" runat="server"></asp:Literal>
                      </td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle" colspan="2">
                        友情提示：24小时未接收到汇款的，订单自动失效
                      </td>
                    </tr>
                    <tr>
                      <td height="15" align="left"></td>
                    </tr>
                    </table>
                  </td>
              </tr>
              <tr>
                <td align="right" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="center" class="font12b4e">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/images/user_zl_b6.gif" onclick="ImageButton1_Click"  />
                &nbsp;&nbsp;
                <asp:ImageButton ID="ImgBtn_Add" runat="server" ImageUrl="~/images/user_zl_b7.gif" 
                        onclick="ImgBtn_Add_Click"  />
                &nbsp;&nbsp;
                <a href="User_PatentList.aspx"><img src="images/user_zl_b8.gif" width="85" height="29" border="0" /></a>
                </td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="687" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="132" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="115" align="center" class="font12bt">付款注意事项</td>
                        <td width="7"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="left"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left" valign="top" style="line-height:21px;word-break:break-all;word-wrap:break-word;">
                    <asp:Literal ID="Ltl_ZhuYi" runat="server"></asp:Literal>
                </td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
              </tr>
            </table></td>
            </tr>
          </table></td>
      </tr>
    </table></td>
      </tr>
    </table>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div runat="server" id="div_a"></div>
    </form>
</body>
</html>
