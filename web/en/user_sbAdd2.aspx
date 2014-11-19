<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbAdd2.aspx.cs" Inherits="user_sbupdate" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Entry Trademark Information_My Trademark_Service Center_System of Trademark Maintenance_Global        Patent</title>
    <meta name="Keywords" content="Global Patent" />
    <meta name="Description" content="Global patent Intellectual property annuity fee e-commerce platform" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body id="index">
    <form id="form1" runat="server">
    <input id="hi_guoji" type="hidden" runat="server" />
    <input id="hi_usertype" type="hidden" runat="server" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="68" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;
        background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
            </td>
            <td align="left" valign="top">
                <table width="741" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
                            <table width="739" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="701">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">&nbsp;
                                        
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">Front page</a>&nbsp;&gt;&gt;&nbsp;User Center&nbsp;&gt;&gt;&nbsp;Service
                                    Center&nbsp;&gt;&gt;&nbsp;My Trademark&nbsp;&gt;&gt;&nbsp;Entry Trademark Information </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="691">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">&nbsp;
                                        
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="115" align="center" class="font12bt">
                                                                            Batch input
                                                                        </td>
                                                                        <td width="7">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="26" align="left">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="238" height="32" align="right">
                                                                <strong>Upload the Excel form：</strong>
                                                            </td>
                                                            <td width="433" align="left">
                                                                <asp:FileUpload ID="ful_price" runat="server" />&nbsp;
                                                                <%--<asp:FileUpload ID="ful_price" runat="server" onchange="document.getElementById('txtfile').value = document.getElementById('ful_price').value;"
                                                                    Style="display: none;" />
                                                                <asp:TextBox ID="txtfile" runat="server" ReadOnly="true"></asp:TextBox>
                                                                <input type="button" value="Brow" onclick="document.getElementById('ful_price').click();" />--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Note：</strong>
                                                            </td>
                                                            <td align="left">
                                                                Download of the form format：
                                                                <%if (usertype == 3)
                                                                  { %>
                                                                <a href="FileLoad/Trademark Informaiton(2).xls" class="ac9">click here</a><%}
                                                                  else
                                                                  { %>
                                                                <a href="FileLoad/Trademark Informaiton(1).xls" class="ac9">click here</a>
                                                                <% } %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">&nbsp;
                                                                
                                                            </td>
                                                            <td align="left" valign="top">
                                                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="8" height="35">
                                                                        </td>
                                                                        <td width="95" align="left">
                                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/user_zl_b5.gif"
                                                                                OnClick="ImageButton1_Click" />
                                                                        </td>
                                                                        <td width="108" align="left">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td width="204" align="left">&nbsp;
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;
                                                    
                                                </td>
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
    <div id="div_a" runat="server">
    </div>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
    <script src="js/CheckTrademark.js" type="text/javascript"></script>
</body>
</html>
