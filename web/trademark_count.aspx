<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademark_count.aspx.cs"
    Inherits="trademark_count" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商标案件统计_我的商标_服务中心_商标系统_环球汇通</title>
    <meta name="Keywords" content="环球汇通" />
    <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script language="javascript">
        function switchTag1(tag, content, k) {
            for (i = 1; i < 3; i++) {
                if (i == k)
                { document.getElementById(tag + i).className = "font12bt"; document.getElementById(content + i).className = ""; }
                else
                { document.getElementById(tag + i).className = "font12bs"; document.getElementById(content + i).className = "h_lsit_none"; }
            }
        }
        var rollFlag = 0;

        function txt_roll(str) {
            sub_num = str.substring(str.length - 2);
            sub_str = str.substring(0, str.length - 2);

            if (document.all[str].style.display == "") {
                document.all[str].style.display = "none";
                rollFlag = 0;
                return;
            }
            else {
                if (rollFlag != 0) {
                    //document.all[sub_str+rollFlag].style.display="none";
                    document.all[str].style.display = "";
                }

                document.all[str].style.display = "";
                rollFlag = sub_num;
            }

        }
    </script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
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
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="701">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;商标信息检索
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table width="691" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="653">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td align="left" valign="top">
                                        <table width="654" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">
                                                                &nbsp;
                                                            </td>
                                                            <td width="116" align="center" class="font12bt">
                                                                申请案状态统计
                                                            </td>
                                                            <td align="right">
                                                                <b>商标总数:<%=ApplyTotal%></b>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="h_lsitt1">
                                                        <asp:Repeater ID="rptApplyStatus" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td width="345" height="30" align="right" class="user_leftline" style='<%# Eval("StatusValue").ToString()=="1" ? "font-weight: bold;color: #ff0510;":""%>'>
                                                                        <%# Eval("StatusName")%>：
                                                                    </td>
                                                                    <td width="285" class="user_rightline">
                                                                      &nbsp;&nbsp; <a href="trademark_list.aspx?t_r_id=<%# Eval("tids") %>" class="ac_hei" style='<%# Eval("StatusValue").ToString()=="1" ? "font-weight: bold;color: #ff0510;":""%>'>
                                                                            <%# Eval("counts")%>个</a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                            </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr><td>
                     <table width="691" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38"  height="123">
                                        &nbsp;
                                    </td>
                                    <td width="653" align="left" valign="top">
                                        <table width="654" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">
                                                                &nbsp;
                                                            </td>
                                                            <td width="116" align="center" class="font12bt">
                                                                续展案状态统计
                                                            </td>
                                                            <td align="right">
                                                                <b>商标总数:<%=RenewalTotal%></b>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="Table3">
                                                        <asp:Repeater ID="rptRenewalStatus" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                   <td width="345" height="30" align="right" class="user_leftline" style='<%#RenewalStyle(Eval("StatusValue"))%>'>
                                                                        <%# Eval("StatusName")%>：
                                                                    </td>
                                                                    <td width="285" class="user_rightline" >
                                                                      &nbsp;&nbsp; <a href="trademark_list.aspx?t_r_id=<%# Eval("tids") %>" class="ac_hei" style='<%#RenewalStyle(Eval("StatusValue"))%>'>
                                                                            <%# Eval("counts")%>个</a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                            </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                    </td></tr>
                    <tr>
                        <td valign="top">
                            <table width="691" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="653">
                                           <table width="654" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">
                                                                &nbsp;
                                                            </td>
                                                            <td width="116" align="center" class="font12bt">
                                                                订单统计
                                                            </td>
                                                            <td align="right">
                                                                <b>商标总数:<%=OrderTotal%></b>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="Table6">
                                                        <asp:Repeater ID="rptOrder" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td width="345" height="30" align="right" class="user_leftline" style='<%# Eval("StatusValue").ToString()=="0" ? "font-weight: bold;color: #ff0510;":""%>'>
                                                                       <%# Eval("StatusName")%>：
                                                                    </td>
                                                                    <td width="285" class="user_rightline" style='<%# Eval("StatusValue").ToString()=="0" ? "font-weight: bold;color: #ff0510;":""%>'>
                                                                       &nbsp;&nbsp; 申请案：<a href="trademark_list.aspx?t_r_id=<%# Eval("tidsApply") %>" class="ac_hei" style='<%# Eval("StatusValue").ToString()=="0" ? "font-weight: bold;color: #ff0510;":""%>'>
                                                                            <%# Eval("countsApply")%>个</a>
                                                                            &nbsp;&nbsp;续展案：<a href="trademark_list.aspx?t_r_id=<%# Eval("tidsRenewal") %>" class="ac_hei" style='<%# Eval("StatusValue").ToString()=="0" ? "font-weight: bold;color: #ff0510;":""%>'>
                                                                            <%# Eval("countsRenewal")%>个</a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td align="left" valign="top">
                                        <table width="654" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">
                                                                &nbsp;
                                                            </td>
                                                            <td width="116" align="center" class="font12bt">
                                                                类别统计
                                                            </td>
                                                            <td align="right">
                                                                <b>商标总数:<%=TypeTotal%></b>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="Table1">
                                                        <asp:Repeater ID="rptTrademarkType" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td width="345" height="30" align="right" class="user_leftline">
                                                                        类别（<%# Eval("CategoryCode")%>）：
                                                                    </td>
                                                                    <td width="285" class="user_rightline">
                                                                       &nbsp;&nbsp; 申请案：<a href="trademark_list.aspx?t_r_id=<%# Eval("tidsApply") %>" class="ac_hei">
                                                                            <%# Eval("countsApply")%>个</a>
                                                                            &nbsp;&nbsp;续展案：<a href="trademark_list.aspx?t_r_id=<%# Eval("tidsRenewal") %>" class="ac_hei">
                                                                            <%# Eval("countsRenewal")%>个</a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                   <td></td>
                                    <td align="left" valign="top">
                                          <table width="654" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">
                                                                &nbsp;
                                                            </td>
                                                            <td width="116" align="center" class="font12bt">
                                                                常用申请人统计
                                                            </td>
                                                            <td align="right">
                                                                <b>商标总数:<%=ApplyUserTotal%></b>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="630" border="0" cellspacing="0" cellpadding="0" id="Table5">
                                                        <asp:Repeater ID="rptApplyUser" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td width="345" height="30" align="right" class="user_leftline">
                                                                        <%# Eval("ApplyName")%>：
                                                                    </td>
                                                                    <td width="285" class="user_rightline">
                                                                       &nbsp;&nbsp; 申请案：<a href="trademark_list.aspx?t_r_id=<%# Eval("tidsApply") %>" class="ac_hei">
                                                                            <%# Eval("countsApply")%>个</a>
                                                                            &nbsp;&nbsp;续展案：<a href="trademark_list.aspx?t_r_id=<%# Eval("tidsRenewal") %>" class="ac_hei">
                                                                            <%# Eval("countsRenewal")%>个</a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
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
            </td>
        </tr>
    </table>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
