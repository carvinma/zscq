<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_Xiazai.aspx.cs" Inherits="user_sbddck" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/pager.css" rel="stylesheet" type="text/css" />
</head>
<body id="index">
  <form id="form1" runat="server">
                                <table width="660" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <tr>
                                    <td width="123" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상표 출원번호</td>
                                    <td width="98" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상표 분류</td>
                                    <td width="105" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">납부유형</td>
                                   <td width="101" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">로그인 성명</td>
                                     <td width="105" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">출원일</td>
                                    <td width="109" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">다운로드</td>
                                  </tr>
                                  <asp:Repeater ID="rp_trademark" runat="server">
                                    <ItemTemplate>
                                      <tr>
                                        <td width="123" height="32" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBRegNum") %></td>
                                        <td width="98" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBType")%></td>
                                        <td width="105" align="center" bgcolor="#FFFFFF">
                                          <%#Eval("i_JiaoFeiType").ToString() == "1" ?"스스로 비용을 납부하다" :"위탁 납부"%></td>
                                        <td width="101" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBRegName") %><br />
                                          <%# GetGuojiName(Eval("i_GuoJiId"))!="中国"? Eval("nvc_SBRegEnName"):""%></td> <td width="105" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SbRegTime")%></td>
                                           <td width="109" align="center" bgcolor="#FFFFFF" style="line-height:20px;">
                                           <a href="user_World_sbweituo.aspx?id=<%#Eval("i_TrademarkId")%>&type=2" target="_blank" class="ac5t">위임장 다운로드</a><br><a href="user_World_sb.aspx?id=<%#Eval("i_TrademarkId")%>&type=3" target="_blank" class="ac5t">신청서 다운로드</a></td>
                                      </tr>
                                    </ItemTemplate>
                                  </asp:Repeater>

                                    <tr>
                  <td align="center" valign="top" colspan="6">
                    <table class="aspnetpager" cellspacing="3" cellpadding="0" width="100%">
                      <tr>
                        <webdiyer:AspNetPager NumericButtonCount="5" ID="AspNetPager1" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="true" ShowPageIndex="true" runat="server" ShowFirstLast="true" FirstPageText="홈" LastPageText="끝페지로" PrevPageText="전으로" NextPageText="다음으로" ShowInputBox="Never" PageSize="5" SubmitButtonText="GO" TextAfterInputBox="페지" CustomInfoHTML="총 %PageCount% 페지 " CustomInfoTextAlign="Right" ShowCustomInfoSection="Right" SubmitButtonClass="button" ShowDisabledButtons="true">
                        </webdiyer:AspNetPager>
                        <td>총<%= AspNetPager1.PageCount%>페지 </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                                </table>
  </form>  
</body>
</html>
