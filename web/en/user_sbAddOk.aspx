<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbAddOk.aspx.cs" Inherits="user_sbupdate" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Trademark Search_My Trademark_Service Center_System of Trademark Maintenance_Global Patent</title>
    <meta name="Keywords" content="Global Patent" />
    <meta name="Description" content="Global patent Intellectual property annuity fee e-commerce platform" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script language="javascript">
        var rollFlag = 0;
        function txt_roll(str) {
            sub_num = str.substring(str.length - 2);
            sub_str = str.substring(0, str.length - 2);

            if (document.all[str].style.display == "") {
                document.all[str].style.display = "none";
                rollFlag = 0;
                return;
            }
            else {
                if (rollFlag != 0) {
                    //document.all[sub_str+rollFlag].style.display="none";
                    document.all[str].style.display = "";
                }

                document.all[str].style.display = "";
                rollFlag = sub_num;
            }

        }
    </script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <input id="hi_guoji" type="hidden" runat="server"/>
     <input id="hi_usertype" type="hidden" runat="server"/>
   <uc4:zscqtop2 ID="zscqtop21" runat="server" />

<uc3:zscqadv ID="zscqadv1" TypeId="68" runat="server" />


<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;background-color: #fff;">
  <tr>
    <td width="260" height="618" align="left" valign="top"style="background-image: url(images/server2.gif);">
    <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" /></td>
    <td align="left" valign="top">
    <table width="741" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);"><table width="739" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38" height="28">&nbsp;</td>
            <td width="701">&nbsp;</td>
          </tr>
          <tr>
            <td height="19">&nbsp;</td>
            <td align="left"><a href="index.aspx">Front page</a>&nbsp;&gt;&gt;&nbsp;User Center&nbsp;&gt;&gt;&nbsp;Service Center&nbsp;&gt;&gt;&nbsp;My Trademark&nbsp;&gt;&gt;&nbsp;<span class="ordertext">Input Trademark successfully</span></td>
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
                    <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="232" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="205" align="center" class="font12bt">Input Trademark successfully</td>
                        <td width="17"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="left"></td>
                  </tr>
                  <tr>
                    <td height="29" align="left"><table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                      <tr class="orderxx">
                        <td height="30" align="left" valign="middle"><span class="ordertext">Quantity of Trademark successfully inputted：<span class="font12ac5"><%=sbshu%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="95" align="center" class="font12b4e"><a href="user_sbadd.aspx"><img src="images/user_zl_b16.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_sblb.aspx"><img src="images/user_zl_b17.gif"  border="0" /></a>&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<div id="div_a" runat="server"></div>
 <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
    <script type="text/javascript">
        function CheckUpdate() {
            var isok = true;
            if ($("#Sb_type").val() == "") {
                isok = false;
            }
            if ($("#Sb_miaosu").val() == "") {
                isok = false;
            }
            if ($("#Sb_Regname").val() == "") {
                isok = false;
            }
            if ($("#hi_guoji").val() == "0" && $("#hi_usertype").val() == "3") {
                if ($("#Sb_RegnameEn").val() == "") {
                    isok = false;
                }
                if ($("#Sb_Reg_AddressEn").val() == "") {
                    isok = false;
                }
            }
            if ($("#Sb_Reg_youbian").val() == "") {
                isok = false;
            }
            if ($("#Sb_Reg_Address").val() == "") {
                isok = false;
            }
            return isok;
        }
    
    
    </script>
</body>
</html>
