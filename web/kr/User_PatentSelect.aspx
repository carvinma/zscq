<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentSelect.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>특허정보 검색_나의 특허_서비스 센터_회원센터_특허시스템_Global Patent</title>
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
                홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의 특허 >> 특허정보 검색
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
                    <td width="642" align="left" class="font14d4">간단검색</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26" align="left"></td>
              </tr>
              <tr>
                <td height="115" align="left" valign="top"><table width="671" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="238" height="32" align="right"><strong>특허번호：</strong></td>
                    <td width="433" align="left">
                    <input type="text" name="s1" id="txt_zlh" runat="server" class="font12000 tooltip" tips="<p>중국특허번호격식:9-13개 수자(례:200812345678.9)</p><p>기타국가격식 제한하지 않음</p>" maxlength="20"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_zlh" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>특허명칭：</strong></td>
                    <td align="left">
                    <input type="text" name="s2" id="txt_zlmc" runat="server" class="font12000 tooltip" tips="200자 이내" maxlength="200" />
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>특허권자：</strong></td>
                    <td align="left">
                    <input type="text" name="s3" id="txt_zlqr" runat="server" class="font12000 tooltip" tips="100자 이내" maxlength="100" />
                    </td>
                  </tr>
<%--                  <tr>
                    <td height="32" align="right"><strong>안건번호：</strong></td>
                    <td align="left">
                    <input type="text" name="s4" id="txt_ajh" runat="server" class="font12000" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_ajh" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
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
                        <img src="images/user_js_b3.gif" onclick="onclickt2()" width="125" height="27" border="0" style="cursor:hand"/>
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
                      <td width="642" align="left" class="font14d4">상세검색</td>
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
                          <td width="98" align="center" class="font12bt">기본정보</td>
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
                          <td width="221" height="32" align="right"><strong>시스템번호：<br />
                          </strong></td>
                          <td width="415" align="left">
                          <input type="text" name="s6" runat="server" id="txt_XiTongNum" class="font12000 tooltip" tips="수자만 입력해주세요" maxlength="6" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_XiTongNum" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,6}">
                </asp:RegularExpressionValidator>    
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>특허번호：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Number" class="font12000 tooltip" tips="<p>중국특허번호격식:9-13개 수자(례:200812345678.9)</p><p>기타국가격식 제한하지 않음</p>" maxlength="20" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_Number" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>특허명칭：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Name" class="font12000 tooltip" tips="200자 이내" maxlength="200" />
                          </td>
                        </tr>

                        <tr>
                          <td height="32" align="right"><strong>특허등록한 국가：</strong></td>
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
                          <td height="32" align="right"><strong>특허류형：</strong></td>
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
                          <td height="32" align="right"><strong>청구항：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_yaoqiuxiang" class="font12000 tooltip" tips="수자만 입력해주세요" maxlength="4" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_yaoqiuxiang" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-5]{1,5}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>특허권자：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentHolder" class="font12000 tooltip" tips="100자 이내" maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>특허권자 국적：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server" class="font12000_t">
                                </asp:DropDownList>  
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>발명인：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentInventor" class="font12000 tooltip" tips="100자 이내"  maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                        <td width="221" height="32" align="right"><strong>특허출원일：</strong></td>
                        <td width="409" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                        <td width="221" height="32" align="right"><strong>특허 공고일：</strong></td>
                        <td width="409" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>납부상태：</strong></td>
                          <td align="left">
                              <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server" class="font_auto">
                                <asp:ListItem Value="0">선택</asp:ListItem>
                                <asp:ListItem Value="1">납부완성  다음기한일까지(>90일)</asp:ListItem>
                                <asp:ListItem Value="2">지불 날짜 <90 데이즈, 순서는 아직 제출하지 않은</asp:ListItem>
                                <asp:ListItem Value="3">지불 날짜 <60 데이즈, 순서는 아직 제출하지 않은</asp:ListItem>
                                <asp:ListItem Value="4">지불 날짜 <30 데이즈, 순서는 아직 제출하지 않은</asp:ListItem>
                                <asp:ListItem Value="5">지불 날짜 <15 데이즈, 순서는 아직 제출하지 않은 </asp:ListItem>
                                <asp:ListItem Value="6">지불 날짜 <0 데이즈, 순서는 아직 제출하지 않은</asp:ListItem>
                                <asp:ListItem Value="7">발주서 제출  송금않함</asp:ListItem>
                                <asp:ListItem Value="8">발주서 제출   납부중</asp:ListItem>
                                <asp:ListItem Value="9">포기처리</asp:ListItem>
                                <asp:ListItem Value="10">련락없어서 포기처리함</asp:ListItem>
                                <asp:ListItem Value="11">지시없어서 포기처리함</asp:ListItem>
                                <asp:ListItem Value="12">동일한시간에 출원한특허 자동적으로 실효</asp:ListItem>
                                <asp:ListItem Value="13">납부완성되였습니다</asp:ListItem>
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
                            <td width="98" align="center" class="font12bt">우선권정보</td>
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
                            <td width="221" height="32" align="right"><strong>우선권 신청버호：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s7" runat="server" id="txt_PriorityNumber" class="font12000 tooltip" tips="수자와 영어자모만 입려해주세요" maxlength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PriorityNumber" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>우선권 나라：</strong></td>
                            <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PriorityNationalityId" runat="server" class="font12000_t">
                                <asp:ListItem Value="0">국가를 선택하세요</asp:ListItem>
                                </asp:DropDownList>  
                            </span>
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>우선권 신청일：</strong></td>
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
                            <td width="98" align="center" class="font12bt">PCT정보</td>
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
                            <td height="32" align="right"><strong>PCT신청번호：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcNumber" class="font12000 tooltip" tips="수자와 영어자모만 입려해주세요"  maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PtcNumber" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>PCT신청일：</strong></td>
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
                            <td width="98" align="center" class="font12bt">납부정보</td>
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
                            <td width="221" height="32" align="right"><strong>납부기한일：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>기한일：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeRestDay" class="font12000" maxlength="5" /><%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeeRestDay" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,5}">
                </asp:RegularExpressionValidator>--%>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>납부년도：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNotPaymentYear" class="font12000 tooltip" tips="수자를 입력해주세요" maxlength="10" />
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
                            <td width="98" align="center" class="font12bt">제삼방 정보</td>
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
                            <td width="256" height="32" align="right"><strong>안건번호：<br />
                            </strong></td>
                            <td width="415" align="left">
                            <input type="text" name="s10" runat="server" id="txt_anjuanhao" class="font12000 tooltip" tips="수자와 영어자모만 입려해주세요" maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="고객님이 입력한정보의 격식은 착아가있습니다 확인해주세요！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>담당자 이름：</strong></td>
                            <td align="left">
                            <input type="text" name="s8" runat="server" id="txt_linkman" class="font12000" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>주소：</strong></td>
                            <td align="left">
                            <textarea id="txt_address" runat="server" class="font12000" style="height:50px"></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>전화：</strong></td>
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
                                <img src="images/user_js_b4.gif" width="125" height="27" border="0" onclick="onclickt1()"/>
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