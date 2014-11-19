<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentAdd.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Patent adding_My patent_Service Center_User Center_System of Patent Annuity Fee_Global Patent</title>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <uc1:zscqtop2 ID="zscqtop21" runat="server" />
  <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <!--专利左侧START-->
        <uc3:patentleft ID="patentleft1" runat="server" />
        <!--专利左侧END-->
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left">
                  Front page >> System of Patent Annuity Fee >> User Center >> Service Center >> My patent >> Patent adding 
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp;</td>
                  <td width="691">&nbsp;</td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td width="691" align="left" valign="top">
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="176" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="160" align="center" class="font12bt">Select the inputting method</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="95" align="center" class="font12b4e"><a href="User_PatentAdd1.aspx"><img src="images/user_zl_b14.gif" border="0" width="163" height="42" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="User_PatentAdd2.aspx"><img src="images/user_zl_b15.gif" border="0" width="163" height="42" /></a>&nbsp;&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="115" align="center" class="font12bt">Note</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="95" align="center" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="85" align="left" valign="top" style="line-height:23px;">If you use Internet Explorer to browse,please select IE9 or lower version.<br />
                              If you use IE10 or higher version to browse,it might incur the abnormal status of unavailable operation when you input the patent information into online system,which may be caused by the incompatiblility between the version of IE you use with that at current web page.We are apologized that it cannot be solved properly at present,so in that case,please try the method as following:<br />
                              1.Change to other browser.<br />
                              2.<a href="download.aspx?filename=../<%=filename %>" class="ac7s" target="_blank">Please click here to download file</a>, and set the compatibility of your browser conformed with the instruction of the file.</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
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
  <uc4:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
