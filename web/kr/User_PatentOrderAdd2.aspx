<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentOrderAdd2.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>주문 제출 성공_나의특허 발주서_서비스 센터_회원센터_특허시스템_Global Patent</title>
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
    <uc2:zscqadv ID="zscqadv1" TypeId="97" runat="server" />
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
             <td align="left">홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의특허 발주서 >> 주문 제출 성공</td>
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
                            <td width="115" align="center" class="font12bt">주문 제출 성공</td>
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
                          <td height="30" align="left" valign="middle" width="31%">
                          <span class="ordertext">
                          발주서 번호：<asp:Literal ID="Ltl_OrderNum" runat="server"></asp:Literal>
                          </span>
                          </td>
                          <td  height="30" align="left" valign="middle" width="37%">
                          <span class="ordertext">
                          금액：<asp:Literal ID="Ltl_Money" runat="server"></asp:Literal>
                          </span>
                          </td>
                          <td  height="30" align="left" valign="middle" width="32%">
                          <span class="ordertext">
                          지불 방식：<asp:Literal ID="Ltl_PayType" runat="server"></asp:Literal>
                          </span>
                          </td>
                        </tr>
                      </table>
                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle" width="31%">
                      회원아이디：<asp:Literal ID="Ltl_MemberNum" runat="server"></asp:Literal>
                      </td>
                      <td height="30" align="left" valign="middle" width="69%">
                      아이디：<asp:Literal ID="Ltl_MemberName" runat="server"></asp:Literal>
                      </td>
                    </tr>
                    </table>
                    <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle" width="31%">
                      제출시간：<asp:Literal ID="Ltl_AddTime" runat="server"></asp:Literal>
                      </td>
                      <td height="30" align="left" valign="middle" width="69%">
                      주문 상태：<asp:Literal ID="Ltl_Status" runat="server"></asp:Literal>
                      </td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle" colspan="2">
                        우제시:24시간내로 송금하지않으면 본 주문이 자동적으로 실효됩니다
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
                        ImageUrl="images/user_zl_b6.gif" onclick="ImageButton1_Click"  />
                &nbsp;&nbsp;
                <asp:ImageButton ID="ImgBtn_Add" runat="server" ImageUrl="images/user_zl_b7.gif" 
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
                        <td width="115" align="center" class="font12bt">납부주의사항</td>
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
