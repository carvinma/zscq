<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentCount.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>특허안건 통계_나의 특허_서비스 센터_회원센터_특허시스템_Global Patent</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
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
                홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의 특허 >> 특허안건 통계
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="639" valign="top"><table width="691" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="38" height="28">&nbsp;</td>
                <td width="653" align="right"><b>특허총수：<a href="User_PatentList.aspx" ><%=TotalCount%></a></b></td>
                </tr>
              <tr>
                <td height="123">&nbsp;</td>
                <td align="left" valign="top"><table width="654" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="654" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="260" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="116" align="center" class="font12bt" id="tt1" style="cursor:hand;" onClick="switchTag1('tt','h_lsitt','1');this.blur();">기한 및 상태 통계</td>
                        <td width="8"></td>
                        <td width="116" align="center" class="font12bs" id="tt2" style="cursor:hand;" onClick="switchTag1('tt','h_lsitt','2');this.blur();">특허등로국 통계</td>
                        <td width="10"></td>
                        </tr>
                      </table></td>
                    </tr>
                  <tr>
                    <td height="18" align="left"></td>
                    </tr>
                  <tr>
                    <td height="115" align="left" valign="top">
                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="h_lsitt1">
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">납부완료 다음 다음기한일 까지&gt;90날：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=1" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_1" runat="server"></asp:Literal></a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">납부기한일&lt;90날 발주서 제출하지 않음：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=2" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_2" runat="server"></asp:Literal></a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">납부기한일&lt;60날발주서 제출하지 않음：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=3" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_3" runat="server"></asp:Literal></a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#b2333d;">납부기한일<30날발주서 제출하지 않음：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=4" class="ac_hong1"><asp:Literal ID="Ltl_PatentCount_4" runat="server"></asp:Literal></a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#d14b1a;">납부기한일<15날발주서 제출하지 않음：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=5" class="ac_hong2"><asp:Literal ID="Ltl_PatentCount_5" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#ebbf1c;">나부기한일<0날  발주서 제출하지 않음：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=6" class="ac_huang"><asp:Literal ID="Ltl_PatentCount_6" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#ff0510;">발주서 제출  아직 송금받지 못함：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=7" class="ac_hong3"><asp:Literal ID="Ltl_PatentCount_7" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">발주서 제출 납부중：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=8" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_8" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">포기처리：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=9" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_9" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">련락없어서 포기처리함：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=10" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_10" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">지시없어서 포기처리함：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=11" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_11" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">동일한시간에 출원한특허 자동적으로 실효：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=12" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_12" runat="server"></asp:Literal></a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline user_bottomline">납부완성되였습니다：</td>
                        <td width="285" class="user_rightline user_bottomline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=13" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_13" runat="server"></asp:Literal></a></td>
                        </tr>
                      </table>
                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="h_lsitt2" class="h_lsit_none">
                    <tr>
                        <td height="30" align="left" valign="top">
                        <div class="index_main5concene auto">
<%--                        <asp:Repeater ID="Rpt_PatentCountList" runat="server">
                        <ItemTemplate>
                        <div class="index_main5proe auto <%#(Container.ItemIndex+1) % 5 == 0 ? "index_main5pro1e" : ""%>">
                            <div class="index_main5protite auto">
                            <%#Eval("nvc_Name")%>：<a href="User_PatentList.aspx?ShouQuanGuo=<%#Eval("i_Id")%>" class="ac_hei"><%#DALP.Patent_SelectView_AuthorizeNationalityId(Convert.ToInt32(Eval("i_Id")),uId)%/a>
                            </div>
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>--%>
                        <%=sb_count%>
                        </div>
                        </td>
                        </tr>
                    </table>
                    </td>
                    </tr>
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
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
