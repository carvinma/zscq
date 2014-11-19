<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentSelect.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Patent search_My patent_Service Center_User Center_System of Patent Annuity Fee_Global Patent</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
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
                Front page >> System of Patent Annuity Fee >> User Center >> Service Center >> My patent >> Patent search
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="639" valign="top"><table width="743" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="28">&nbsp;</td>
            <td width="718">&nbsp;</td>
          </tr>
          <tr id="table_search1">
            <td height="123">&nbsp;</td>
            <td align="left" valign="top">
            <table width="671" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);"><table width="671" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="6" colspan="2"></td>
                  </tr>
                  <tr>
                    <td width="29" height="20">&nbsp;</td>
                    <td width="642" align="left" class="font14d4">Quick search</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26" align="left"></td>
              </tr>
              <tr>
                <td height="115" align="left" valign="top"><table width="671" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="238" height="32" align="right"><strong>Patent number：</strong></td>
                    <td width="433" align="left">
                    <input type="text" name="s1" id="txt_zlh" runat="server" class="font12000 tooltip" tips="<p>Format of Chinese patent number:9 to 13 digits (for example 200812345678.9)</p><p>No limits the format of patents in other countries</p>" maxlength="20"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_zlh" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>Title of patent：</strong></td>
                    <td align="left">
                    <input type="text" name="s2" id="txt_zlmc" runat="server" class="font12000 tooltip" tips="Less than 200 characters" maxlength="200" />
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>Patentee：</strong></td>
                    <td align="left">
                    <input type="text" name="s3" id="txt_zlqr" runat="server" class="font12000 tooltip" tips="Less than 100 characters" maxlength="100" />
                    </td>
                  </tr>
<%--                  <tr>
                    <td height="32" align="right"><strong>Reference number：</strong></td>
                    <td align="left">
                    <input type="text" name="s4" id="txt_ajh" runat="server" class="font12000" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_ajh" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                    </td>
                  </tr>--%>
                  <tr>
                    <td height="32" align="right">&nbsp;</td>
                    <td align="left" valign="top"><table width="415" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8" height="35"></td>
                        <td width="95" align="left">
                            <asp:ImageButton ID="ImgBtn_Search1" runat="server" ValidationGroup="b"
                                ImageUrl="images/user_js_b1.gif" onclick="ImgBtn_Search1_Click" />
                        </td>
                        <td width="108" align="left">
                            <input id="Reset1" type="reset" value="" style=" width:86px; height:27px; background-image:url(images/user_js_b2.gif); border:0px;" />
                        </td>
                        <td width="204" align="left">
                        <img src="images/user_js_b3.gif" onclick="onclickt2()" width="150" height="27" border="0" style="cursor:hand"/>
                        </td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
              </tr>
            </table> 
            </td>
          </tr>
          <tr>
            <td height="123">&nbsp;</td>
            <td width="718" align="left" valign="top">
            <table width="700" border="0" cellspacing="0" cellpadding="0" id="table_search2" style="display:none">
              <tr>
                  <td width="717" height="26" align="left" valign="top"><table width="671" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td width="671" height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);"><table width="671" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="6" colspan="2"></td>
                    </tr>
                    <tr>
                      <td width="29" height="20">&nbsp;</td>
                      <td width="642" align="left" class="font14d4">Advanced search</td>
                    </tr>
                  </table></td>
                </tr>
                </table></td>
                </tr>
                <tr>
                  <td height="26" align="left"></td>
                </tr>
                <tr>
                  <td height="115" align="center" valign="top">
                  <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="190" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10" height="20">&nbsp;</td>
                          <td width="172" align="center" class="font12bt">Basic information</td>
                          <td width="8"></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="18" align="left"></td>
                    </tr>
                    <tr>
                      <td height="115" align="left" valign="top"><table width="700" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="287" height="32" align="right"><strong>System serial number：<br />
                          </strong></td>
                          <td width="413" align="left">
                          <input type="text" name="s6" runat="server" id="txt_XiTongNum" class="font12000 tooltip" tips="Enter digits only" maxlength="6" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_XiTongNum" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,6}">
                </asp:RegularExpressionValidator>    
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Patent number：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Number" class="font12000 tooltip" tips="<p>Format of Chinese patent number:9 to 13 digits (for example 200812345678.9)</p><p>No limits the format of patents in other countries</p>" maxlength="20" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_Number" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Title of patent：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Name" class="font12000 tooltip" tips="Less than 200 characters" maxlength="200" />
                          </td>
                        </tr>

                        <tr>
                          <td height="32" align="right"><strong>Granted Country：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always"> 
                            <ContentTemplate>
                                <asp:DropDownList ID="Drp_AuthorizeNationalityId" runat="server" class="font12000_t" onselectedindexchanged="Drp_AuthorizeNationalityId_SelectedIndexChanged" AutoPostBack="true" >
                                </asp:DropDownList>  
                            </ContentTemplate>
                            </asp:UpdatePanel>
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Type of patent：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always"> 
                                <ContentTemplate>
                                <asp:DropDownList ID="Drp_PatentType" runat="server" class="font12000_t">
                                </asp:DropDownList>  
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Number of claims：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_yaoqiuxiang" class="font12000 tooltip" tips="Enter digits only" maxlength="4" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_yaoqiuxiang" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-5]{1,5}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Patentee：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentHolder" class="font12000 tooltip" tips="Less than 100 characters" maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Nationality of patentee：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server" class="font12000_t" style="width: 185px;">
                                </asp:DropDownList>  
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Inventor：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentInventor" class="font12000 tooltip" tips="Less than 100 characters"  maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                        <td width="287" height="32" align="right"><strong>Filing date of patent：</strong></td>
                        <td width="413" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                        <td width="287" height="32" align="right"><strong>Grant date of patent ：</strong></td>
                        <td width="413" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>Current payment status in the Granted Country：</strong></td>
                          <td align="left">
                              <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server" class="font_auto" style="width:400px;">
                                <asp:ListItem Value="0">Please select</asp:ListItem>
                                <asp:ListItem Value="1">Current payment already done, and please wait for the next payment（>90 days）</asp:ListItem>
                                <asp:ListItem Value="2"><90 days before the deadline, and no order submitted yet</asp:ListItem>
                                <asp:ListItem Value="3"><60 days before the deadline, and no order submitted yet</asp:ListItem>
                                <asp:ListItem Value="4"><30 days before the deadline, and no order submitted yet</asp:ListItem>
                                <asp:ListItem Value="5"><15 days before the deadline, and no order submitted yet </asp:ListItem>
                                <asp:ListItem Value="6"><0 day before the deadline, and no order submitted yet</asp:ListItem>
                                <asp:ListItem Value="7">Order already submitted, and no remittance received yet</asp:ListItem>
                                <asp:ListItem Value="8">Order already submitted and payment in progress</asp:ListItem>
                                <asp:ListItem Value="9">Abandon the future payment through confirmation with the payer</asp:ListItem>
                                <asp:ListItem Value="10">Deemed to abandon the further payment since failing to contact with the payer</asp:ListItem>
                                <asp:ListItem Value="11">Deemed to abandon the further payment since receiving no response from the payer</asp:ListItem>
                                <asp:ListItem Value="12">Auto invalidation upon invention patent at the same filing date</asp:ListItem>
                                <asp:ListItem Value="13">All the annuity fee payments already done</asp:ListItem>
                                </asp:DropDownList>
                              </span>
                          </td>
                        </tr>
                        
                        </table></td>
                    </tr>
                    <tr>
                      <td height="30" align="left">&nbsp;</td>
                    </tr>
                  </table>
                    <table width="700" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="194" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="176" align="center" class="font12bt">Priority information</td>
                            <td width="8"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="250" height="32" align="right"><strong>Priority application number：</strong></td>
                            <td width="380" align="left">
                            <input type="text" name="s7" runat="server" id="txt_PriorityNumber" class="font12000 tooltip" tips="Enter digits and characters only" maxlength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PriorityNumber" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>Priority country：</strong></td>
                            <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PriorityNationalityId" runat="server" style="width: 185px;">
                                <asp:ListItem Value="0">Please select a country</asp:ListItem>
                                </asp:DropDownList>  
                            </span>
                            </td>
                          </tr>
                          <tr>
                            <td width="250" height="32" align="right"><strong>Priority filing date：</strong></td>
                            <td width="380" align="left">
                            <input type="text" name="s10" runat="server" id="txt_PriorityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_PriorityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="700" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="161" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="145" align="center" class="font12bt">PCT information</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="64" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="32" align="right"><strong>PCT application number：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcNumber" class="font12000 tooltip" tips="Enter digits and characters only"  maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PtcNumber" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td width="254" height="32" align="right"><strong>PCT filing date：</strong></td>
                            <td width="376" align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_PtcDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="700" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="196" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="179" align="center" class="font12bt">Payment information</td>
                            <td width="7"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="258" height="32" align="right"><strong>Deadline of payment：</strong></td>
                            <td width="372" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                          <tr>
                            <td width="258" height="32" align="right"><strong>Days before the deadline：</strong></td>
                            <td width="372" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeRestDay" class="font12000" maxlength="5" /><%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeeRestDay" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,5}">
                </asp:RegularExpressionValidator>--%>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>Annuity year：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNotPaymentYear" class="font12000 tooltip" tips="less than 10 characters" maxlength="10" />
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                  </table>
                  <table width="700" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server" visible="false">
                      <tr>
                        <td width="639" height="21" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="245" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="228" align="center" class="font12bt">Information of the third party</td>
                            <td width="7"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="257" height="32" align="right"><strong>Reference number：<br />
                            </strong></td>
                            <td width="373" align="left">
                            <input type="text" name="s10" runat="server" id="txt_anjuanhao" class="font12000 tooltip" tips="Enter digits and characters only" maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="Information format you entered is incorrect,please check again！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>Contact person：</strong></td>
                            <td align="left">
                            <input type="text" name="s8" runat="server" id="txt_linkman" class="font12000 tooltip" tips="Less than 20 characters" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>Address：</strong></td>
                            <td align="left">
                            <textarea id="txt_address" runat="server" class="font12000" style="height:50px"></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>Tel：</strong></td>
                            <td align="left">
                            <input type="text" name="s11" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td align="right">&nbsp;</td>
                            <td align="left" valign="top">
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                  </table>
                  <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
                        <table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="256" height="9" align="right"></td>
                            <td width="415" align="left"> 
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right">&nbsp;</td>
                            <td align="left" valign="top">
                             <table width="412" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="7" height="35"></td>
                                <td width="96" align="left">
                                <asp:ImageButton ID="ImgBtn_Search2" runat="server"  ValidationGroup="a"
                                ImageUrl="images/user_js_b1.gif" onclick="ImgBtn_Search2_Click" />
                                </td>
                                <td width="104" align="left">
                                <input id="Reset2" type="reset" value="" style=" width:86px; height:27px; background-image:url(images/user_js_b2.gif); border:0px;" />
                                </td>
                                <td width="205" align="left">
                                <img src="images/user_js_b4.gif" width="150" height="27" border="0" onclick="onclickt1()" style="cursor:hand"/>
                                </td>
                              </tr>
                            </table>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                  </table>
                 </td>
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>
                </tr>
            </table> 
           </td>
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
<script type="text/javascript">
    function onclickt1() {
        document.getElementById("table_search1").style.display = "";
        document.getElementById("table_search2").style.display = "none";
    }
    function onclickt2() {
        document.getElementById("table_search1").style.display = "none";
        document.getElementById("table_search2").style.display = "";
    }
</script>