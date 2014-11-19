<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentSelect.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>特許情報検索_私の特許_サービスセンター_会員センター_特許システム_環球匯通</title>
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
    <uc2:zscqadv ID="zscqadv1" TypeId="83" runat="server" />
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
                フロントページ >> 特許システム >> 会員センター >> サービスセンター >> 私の特許 >> 特許情報検索
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
                    <td width="642" align="left" class="font14d4">快速検索</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26" align="left"></td>
              </tr>
              <tr>
                <td height="115" align="left" valign="top"><table width="671" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="238" height="32" align="right"><strong>特許番号：</strong></td>
                    <td width="433" align="left">
                    <input type="text" name="s1" id="txt_zlh" runat="server" class="font12000 tooltip" tips="<p>中国特許号様式：9-13桁（例：200812345678.9）</p><p>他の国のフォーマットは限りません</p>" maxlength="50"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_zlh" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>特許名称：</strong></td>
                    <td align="left">
                    <input type="text" name="s2" id="txt_zlmc" runat="server" class="font12000 tooltip" tips="200キャラクター以内" maxlength="200" />
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>特許権利人：</strong></td>
                    <td align="left">
                    <input type="text" name="s3" id="txt_zlqr" runat="server" class="font12000 tooltip" tips="100キャラクター以内" maxlength="100" />
                    </td>
                  </tr>
<%--                  <tr>
                    <td height="32" align="right"><strong>公文書番号：</strong></td>
                    <td align="left">
                    <input type="text" name="s4" id="txt_ajh" runat="server" class="font12000" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_ajh" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
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
                        <img src="images/user_js_b3.gif" onclick="onclickt2()" width="91" height="27" border="0" style="cursor:hand"/>
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
            <td width="691" align="left" valign="top">
            <table width="671" border="0" cellspacing="0" cellpadding="0" id="table_search2" style="display:none">
              <tr>
                  <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);"><table width="671" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="6" colspan="2"></td>
                    </tr>
                    <tr>
                      <td width="29" height="20">&nbsp;</td>
                      <td width="642" align="left" class="font14d4">高級検索</td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="26" align="left"></td>
                </tr>
                <tr>
                  <td height="115" align="center" valign="top">
                  <table width="630" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10" height="20">&nbsp;</td>
                          <td width="98" align="center" class="font12bt">基本情報</td>
                          <td width="6"></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="18" align="left"></td>
                    </tr>
                    <tr>
                      <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="221" height="32" align="right"><strong>システム番号：<br />
                          </strong></td>
                          <td width="415" align="left">
                          <input type="text" name="s6" runat="server" id="txt_XiTongNum" class="font12000 tooltip" tips="数値のみを記入してください" maxlength="6" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_XiTongNum" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,6}">
                </asp:RegularExpressionValidator>    
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>特許番号：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Number" class="font12000 tooltip" tips="<p>中国特許号様式：9-13桁（例：200812345678.9）</p><p>他の国のフォーマットは限りません</p>" maxlength="20" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_Number" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>特許名称：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Name" class="font12000 tooltip" tips="200キャラクター以内" maxlength="200" />
                          </td>
                        </tr>

                        <tr>
                          <td height="32" align="right"><strong>特許授権国：</strong></td>
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
                          <td height="32" align="right"><strong>特許種類：</strong></td>
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
                          <td height="32" align="right"><strong>権利要求項目：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_yaoqiuxiang" class="font12000 tooltip" tips="数値のみを記入してください" maxlength="4" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_yaoqiuxiang" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-5]{1,5}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>特許権利人：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentHolder" class="font12000 tooltip" tips="100キャラクター以内" maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>特許権利人国籍：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server" class="font12000_t">
                                </asp:DropDownList>  
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>発明者：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentInventor" class="font12000 tooltip" tips="100キャラクター以内"  maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                        <td width="221" height="32" align="right"><strong>特許申請日：</strong></td>
                        <td width="409" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                        <td width="221" height="32" align="right"><strong>特許授権日：</strong></td>
                        <td width="409" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>授権国での年金納付状態：</strong></td>
                          <td align="left">
                              <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server" class="font_auto">
                                <asp:ListItem Value="0">選択して下さい</asp:ListItem>
                                <asp:ListItem Value="1">納付済。次回の納付待ち（＞90日間）</asp:ListItem>
                                <asp:ListItem Value="2">納付期限日まで＜90日間、オーダーを未提出</asp:ListItem>
                                <asp:ListItem Value="3">納付期限日まで＜60日間、オーダーを未提出</asp:ListItem>
                                <asp:ListItem Value="4">納付期限日まで＜30日間、オーダーを未提出单</asp:ListItem>
                                <asp:ListItem Value="5">納付期限日まで＜15日間、オーダーを未提出 </asp:ListItem>
                                <asp:ListItem Value="6">納付期限日まで＜0日間、オーダーを未提出</asp:ListItem>
                                <asp:ListItem Value="7">オーダーを提出済、未支払</asp:ListItem>
                                <asp:ListItem Value="8">オーダーを提出済、費用納付中</asp:ListItem>
                                <asp:ListItem Value="9">費用納付を放棄することを確認済费</asp:ListItem>
                                <asp:ListItem Value="10">納付人と連絡できない為、費用納付を放棄す</asp:ListItem>
                                <asp:ListItem Value="11">ることと見なす</asp:ListItem>
                                <asp:ListItem Value="12">同日に特許を申請、自動的に失効</asp:ListItem>
                                <asp:ListItem Value="13">全ての年度を納付済</asp:ListItem>
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
                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">優先権情報</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="221" height="32" align="right"><strong>優先権申請番号：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s7" runat="server" id="txt_PriorityNumber" class="font12000 tooltip" tips="数値或いは字母のみを記入してください" maxlength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PriorityNumber" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>優先権国：</strong></td>
                            <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PriorityNationalityId" runat="server" class="font12000_t">
                                <asp:ListItem Value="0">选择国家</asp:ListItem>
                                </asp:DropDownList>  
                            </span>
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>優先権申請日：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_PriorityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_PriorityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">PCT情報</td>
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
                            <td height="32" align="right"><strong>PCT申請番号：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcNumber" class="font12000 tooltip" tips="数値或いは字母のみを記入してください"  maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PtcNumber" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>PCT申請日：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_PtcDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">納付情報</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="221" height="32" align="right"><strong>納付期限日：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>納付期限までの残り天数：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeRestDay" class="font12000" maxlength="5" /><%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeeRestDay" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,5}">
                </asp:RegularExpressionValidator>    --%>
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>納付待ち年度：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNotPaymentYear" class="font12000 tooltip"  maxlength="10" />
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                  </table>
                  <table width="630" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server" visible="false">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">第三方情報</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="256" height="32" align="right"><strong>公文書番号：<br />
                            </strong></td>
                            <td width="415" align="left">
                            <input type="text" name="s10" runat="server" id="txt_anjuanhao" class="font12000 tooltip" tips="数値或いは字母のみを記入してください" maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="お客様の記入した情報の格式が正しくありません。ご確認をください！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>連絡者：</strong></td>
                            <td align="left">
                            <input type="text" name="s8" runat="server" id="txt_linkman" class="font12000" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>住所：</strong></td>
                            <td align="left">
                            <textarea id="txt_address" runat="server" class="font12000" style="height:50px"></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>電話：</strong></td>
                            <td align="left">
                            <input type="text" name="s11" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td align="right">&nbsp;</td>
                            <td align="left" valign="top">
                            <table width="389" border="0" cellspacing="0" cellpadding="0"></table>
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
                             <table width="389" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="8" height="35"></td>
                                <td width="95" align="left">
                                <asp:ImageButton ID="ImgBtn_Search2" runat="server"  ValidationGroup="a"
                                ImageUrl="images/user_js_b1.gif" onclick="ImgBtn_Search2_Click" />
                                </td>
                                <td width="108" align="left">
                                <input id="Reset2" type="reset" value="" style=" width:86px; height:27px; background-image:url(images/user_js_b2.gif); border:0px;" />
                                </td>
                                <td width="178" align="left">
                                <img src="images/user_js_b4.gif" width="91" height="27" border="0" onclick="onclickt1()"/>
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