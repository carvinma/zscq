<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentAddOk.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>특허 추가 성공되였습니다_특허정보 추가_나의 특허_서비스 센터_회원센터_특허시스템_Global Patent</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
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
                <td align="left">
                홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의 특허 >> 특허정보 추가 >> 특허 추가 성공되였습니다
                </td>
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
                <td align="left" valign="top"><table width="687" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="687" height="21" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="190" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="173" align="center" class="font12bt">특허 추가 성공되였습니다</td>
                        <td width="7"></td>
                        </tr>
                      </table></td>
                    </tr>
                  <tr>
                    <td height="26" align="left"></td>
                  </tr>
                  <tr>
                    <td height="29" align="left"><table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                        <tr class="orderxx">
                          <td height="30" align="left" valign="middle"><span class="ordertext">특허 추가 성공한 수량：<span class="font12ac5"><%=AddOkCount%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="95" align="center" class="font12b4e"><a href="User_PatentAdd1.aspx">
                <img src="images/user_zl_b16.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="User_PatentList.aspx"><img src="images/user_zl_b17.gif"  border="0" /></a>&nbsp;&nbsp;
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
    </form>
</body>
</html>
