<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbAdd1.aspx.cs" Inherits="user_sbupdate" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>选择录入方式_我的商标_服务中心_商标系统_环球汇通</title>
    <meta name="Keywords" content="环球汇通" />
    <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
  
</head>
<body id="index">
    <form id="form1" runat="server">
    <input id="hi_guoji" type="hidden" runat="server"/>
     <input id="hi_usertype" type="hidden" runat="server"/>
   <uc4:zscqtop2 ID="zscqtop21" runat="server" />

 <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />

<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;background-color: #fff;">
  <tr>
    <td width="260" height="618" align="left" valign="top"style="background-image: url(images/server2.gif);">
    
   <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
    </td>
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
            <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;选择录入方式</td>
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
                    <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="132" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="115" align="center" class="font12bt">选择录入方式</td>
                        <td width="7"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="left"></td>
                  </tr>
                </table></td>
              </tr>
               <%if (booldaoru)
                 { %>
              <tr>
                <td height="95" align="center" class="font12b4e">
                <a href="user_sbadd.aspx"><img src="images/user_zl_b14.gif" border="0" width="163" height="42" /></a>
                &nbsp;&nbsp;&nbsp;&nbsp;

                <a href="user_sbadd2.aspx"><img src="images/user_zl_b15.gif"  border="0" width="163" height="42" /></a>
                
                &nbsp;&nbsp;</td>
              </tr>
              <%}
                 else { %>
                     <tr>
                <td height="95" align="center" class="font12b4e">
                <a href="user_pageinfo.aspx"><img src="images/user_zl_b14.gif" border="0" width="163" height="42" /></a>
                &nbsp;&nbsp;&nbsp;&nbsp;

                <a href="user_pageinfo.aspx"><img src="images/user_zl_b15.gif"  border="0" width="163" height="42" /></a>
                
                &nbsp;&nbsp;</td>
              </tr>
                <% } %>
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
<div id="div_a" runat="server"></div>
 <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
    <script src="js/CheckTrademark.js" type="text/javascript"></script>
 
</body>
</html>
