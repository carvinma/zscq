﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentAdd2.aspx.cs"
    Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Batch input Patent_Patent adding_My patent_Service Center_User Center_System
        of Patent Annuity Fee_Global Patent</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
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
                                    <td width="38" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="701">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">&nbsp;
                                        
                                    </td>
                                    <td align="left">
                                        Front page>>System of Patent Annuity Fee>>User Center>>Service Center>>My
                                        patent>>Patent adding>>Batch input Patent
                                    </td>
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
                                                                &nbsp;
                                                                <asp:FileUpload ID="Fu_ExcelTable" text="views" runat="server"  Style="border: 0px;"/>
                                                                <%--<asp:FileUpload ID="Fu_ExcelTable" runat="server" onchange="document.getElementById('txtfile').value = document.getElementById('Fu_ExcelTable').value;"
                                                                    Style="display: none;" />
                                                                <asp:TextBox ID="txtfile" runat="server" ReadOnly="true"></asp:TextBox>
                                                                <input type="button" value="Brow" onclick="document.getElementById('Fu_ExcelTable').click();" />--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                <strong>Note：</strong>
                                                            </td>
                                                            <td align="left">
                                                                Download of the form format：<a href="<%=excelpath %>" class="ac9">click here</a>
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
                                                                            <asp:ImageButton ID="ImgBtn_Add2" runat="server" ImageUrl="images/user_zl_b5.gif"
                                                                                OnClick="ImgBtn_Add2_Click" />
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
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div runat="server" id="div_a">
    </div>
    </form>
</body>
</html>
