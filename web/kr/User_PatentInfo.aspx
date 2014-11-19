<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentInfo.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>특허 정보 보기_나의 특허_서비스 센터_회원센터_특허시스템_Global Patent</title>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <input type="hidden" id="hd_id" runat="server" value="0" />
  <input type="hidden" id="hd_userId" runat="server" value="0" />
  <input type="hidden" id="hd_yaoqiuxiang" runat="server" value="0" />
  <uc1:zscqtop2 ID="zscqtop21" runat="server" />
  <uc2:zscqadv ID="zscqadv1" TypeId="97" runat="server" />
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
                  <td align="left">홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의 특허 >> 특허 정보 보기 </td>
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
                  <td width="25" height="28">&nbsp;</td>
                  <td width="691" align="right">
<%--                  <a href="User_PatentExport.aspx?pId=<%=hd_id.Value%>">
                  <img src="images/user_daochu.gif" width="85" height="29" border="0" /></a>--%>
                      <asp:ImageButton ID="ImageButton1" ImageUrl="images/user_daochu.gif" 
                          runat="server" width="85" height="29" border="0" onclick="ImageButton1_Click"/>&nbsp;
                  <a href="User_PatentAdd1.aspx?pId=<%=hd_id.Value%>">
                  <img src="images/user_zl_b12.gif" width="85" height="29" border="0" id="imgedit" runat="server" /></a> &nbsp; 
                  <a href="<%=pagehref %>"><img src="images/user_zl_b13.gif" width="85" height="29" border="0" /></a>
                  </td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td width="691" align="left" valign="top">
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="center" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">기본정보</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="278" height="32" align="right"><strong>시스템번호：<br />
                                    </strong></td>
                                    <td width="411" align="left">
                                      <asp:Literal ID="Ltl_OrderBy" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허번호：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_Number" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허명칭：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_Name" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허등록한 국가：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_AuthorizeNationalityId" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>专利类型：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_PatentType" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허출원일：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_AuthorizeIsNationalityDate" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허 공고일：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_AuthorizeIsAuthorizeDate" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr id="tr_qlyqx" runat="server">
                                    <td height="32" align="right"><strong>청구항：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_yaoqiuxiang" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허권자：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_PatentHolder" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>특허권자 국적：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_PatentHolderNationalityId" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>발명인：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_PatentInventor" runat="server"></asp:Literal></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">특허 상태</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>특허등록국에서의 특허권 효력발생일：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeDateStart" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>특허등록국에서의 특허권 만료일：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeDateEnd" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>특허건 유지기한(년)：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeYear" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>특허권 유효기간：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeRestYear" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>특허등로국에서의 연차료 납부 상태：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeStatus" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>연차료 납부된 년도：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeePaymentYear" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>특허등록국에서의 지난번 연차료 납부마감일：</strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeePrevYear" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">우선권정보</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="279" height="32" align="right"><strong>우선권 출원번호：<br />
                                    </strong></td>
                                    <td width="410" align="left">
                                      <asp:Literal ID="Ltl_PriorityNumber" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>우선권 나라：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_PriorityNationalityId" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>우선권 신청일：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_PriorityDate" runat="server"></asp:Literal></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">PCT정보</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="64" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="278" height="32" align="right"><strong>PCT신청번호：</strong></td>
                                    <td width="411" align="left">
                                      <asp:Literal ID="Ltl_PtcNumber" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="278" height="32" align="right"><strong>PCT신청일：</strong></td>
                                    <td width="411" align="left">
                                      <asp:Literal ID="Ltl_PtcDate" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">납부정보</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="277" height="32" align="right"><strong>납부기한일：</strong></td>
                                    <td width="412" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeNextYear" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="277" height="32" align="right"><strong>기한일：</strong></td>
                                    <td width="412" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeRestDay" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="277" height="32" align="right"><strong>납부년도：</strong></td>
                                    <td width="412" align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeNotPaymentYear" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>관비：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_AnnualFeeNextPaymentMoney" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>대리비용：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_AgentServiceFee" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>송금수수료：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_RemittanceFee" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr id="tr_chaoxiangfee" runat="server">
                                    <td height="32" align="right"><strong>가산료：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_chaoxiang" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr id="tr_jianmianfee" runat="server">
                                    <td height="32" align="right"><strong>감면：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_jianmian1" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr id="tr_zhinajinfee" runat="server">
                                    <td height="32" align="right"><strong>추가 지체료：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_zhinajin" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>합계：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_FeeSubtotal" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>외화종류：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_HuoBiType" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>비고：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_Remark" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">제삼방 정보</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="278" height="32" align="right"><strong>안건번호：<br />
                                    </strong></td>
                                    <td width="411" align="left">
                                      <asp:Literal ID="Ltl_anjuanhao" runat="server"></asp:Literal>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>련락처：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_linkman" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>주소：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_address" runat="server"></asp:Literal></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>전화：</strong></td>
                                    <td align="left">
                                      <asp:Literal ID="Ltl_phone" runat="server"></asp:Literal></td>
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
  <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="false">
<Columns>
<asp:BoundField DataField="i_OrderBy" HeaderText="시스템번호" />
<asp:BoundField DataField="nvc_Number" HeaderText="특허번호" />
<asp:BoundField DataField="nvc_Name" HeaderText="특허명칭" />
<asp:TemplateField HeaderText="특허등록한 국가">
    <ItemTemplate>
     <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_koreanName" HeaderText="专利类型" />
<asp:TemplateField HeaderText="특허출원일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="특허 공고일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_YaoQiuXiang" HeaderText="청구항" />
<asp:BoundField DataField="nvc_PatentHolder" HeaderText="특허권자 " />
<asp:TemplateField HeaderText="특허권자 국적">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PatentInventor" HeaderText="발명인" />
<asp:TemplateField HeaderText="특허등록국에서의 특허권 효력발생일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="특허등록국에서의 특허권 만료일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeYear" HeaderText="특허건 유지기한(년)" />
<asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="특허권 유효기간" />
<asp:TemplateField HeaderText="특허등로국에서의 연차료 납부 상태">
    <ItemTemplate>
    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")),"kr")%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="연차료 납부된 년도" />
<asp:TemplateField HeaderText="마지막으로 연회비 납부 마감일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PriorityNumber" HeaderText="우선권 신청버호" />
<asp:TemplateField HeaderText="우선권 나라">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="우선권 신청일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PriorityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT신청번호" />
<asp:TemplateField HeaderText="PCT신청일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PtcDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="납부기한일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeRestDay" HeaderText="기한일" />
<asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="납부년도" />
<asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="관비" />
<asp:BoundField DataField="dm_AgentServiceFee" HeaderText="대리비용" />
<asp:BoundField DataField="dm_RemittanceFee" HeaderText="송금수수료" />
<asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="가산료" />
<asp:BoundField DataField="i_JianMian1" HeaderText="감면" />
<asp:TemplateField HeaderText="滞纳金">
    <ItemTemplate>
    <%#Ltl_zhinajin.Text%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_CurrencyType" HeaderText="외화종류" />
<asp:BoundField DataField="dm_FeeSubtotal" HeaderText="합계" />
<asp:BoundField DataField="nt_Remarks" HeaderText="비고" />
</Columns>
  </asp:GridView>
  <uc4:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
