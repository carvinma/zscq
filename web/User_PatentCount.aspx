<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentCount.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>专利案件统计_我的专利_服务中心_会员中心_专利系统_环球汇通</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
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
                首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的专利 >> 专利案件统计
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="639" valign="top"><table width="691" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="38" height="28">&nbsp;</td>
                <td width="653" align="right"><b>专利总数：<a href="User_PatentList.aspx" ><%=TotalCount%></a> 个</b></td>
                </tr>
              <tr>
                <td height="123">&nbsp;</td>
                <td align="left" valign="top"><table width="654" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="654" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="260" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="116" align="center" class="font12bt" id="tt1" style="cursor:hand;" onClick="switchTag1('tt','h_lsitt','1');this.blur();">期限及状态统计</td>
                        <td width="8"></td>
                        <td width="116" align="center" class="font12bs" id="tt2" style="cursor:hand;" onClick="switchTag1('tt','h_lsitt','2');this.blur();">专利授权国统计</td>
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
                        <td width="345" height="30" align="right" class="user_leftline">已完成缴费，等待下次缴费（&gt;90天）：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=1" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_1" runat="server"></asp:Literal> 个</a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">距缴费日期&lt;90天，尚未提交订单：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=2" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_2" runat="server"></asp:Literal> 个</a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">距缴费日期&lt;60天，尚未提交订单：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=3" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_3" runat="server"></asp:Literal> 个</a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#b2333d;">距缴费日期&lt;30天，尚未提交订单：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=4" class="ac_hong1"><asp:Literal ID="Ltl_PatentCount_4" runat="server"></asp:Literal> 个</a>
                        </td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#d14b1a;">距缴费日期&lt;15天，尚未提交订单：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=5" class="ac_hong2"><asp:Literal ID="Ltl_PatentCount_5" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#ebbf1c;">距缴费日期&lt;0天，尚未提交订单：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=6" class="ac_huang"><asp:Literal ID="Ltl_PatentCount_6" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline" style="font-weight:bold;color:#ff0510;">已提交委托单，尚未收到汇款：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=7" class="ac_hong3"><asp:Literal ID="Ltl_PatentCount_7" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">已提交委托订单，缴费中：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=8" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_8" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">经确认，放弃续费：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=9" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_9" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">联系不到缴费人，视为放弃缴费：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=10" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_10" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">缴费人无答复，视为放弃缴费：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=11" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_11" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline">同日申请专利，自动失效：</td>
                        <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=12" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_12" runat="server"></asp:Literal> 个</a></td>
                        </tr>
                      <tr>
                        <td width="345" height="30" align="right" class="user_leftline user_bottomline">已完成所有年度缴费：</td>
                        <td width="285" class="user_rightline user_bottomline">&nbsp;&nbsp;<a href="User_PatentList.aspx?ExpireType=13" class="ac_hei"><asp:Literal ID="Ltl_PatentCount_13" runat="server"></asp:Literal> 个</a></td>
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
                            <%#Eval("nvc_Name")%>：<a href="User_PatentList.aspx?ShouQuanGuo=<%#Eval("i_Id")%>" class="ac_hei"><%#DALP.Patent_SelectView_AuthorizeNationalityId(Convert.ToInt32(Eval("i_Id")),uId)%> 个</a>
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
