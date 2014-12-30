<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademark_count.aspx.cs" Inherits="trademark_count" %>

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
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
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
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;商标信息检索</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp;</td>
                  <td width="653">&nbsp;</td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td align="left" valign="top">
                    <table width="654" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                          <table width="600" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp;</td>
                              <td width="116" align="center" class="font12bt">申请案状态统计</td>
                              <td  align="right"><b>商标总数:<%=SbTotal %></b></td>
                               <td></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="630" border="0" cellspacing="0" cellpadding="0" id="h_lsitt1">
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">已完成缴费，等待下次缴费（&gt;90天）：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=90_1" class="ac_hei"><%=stime90 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">距缴费日期<90天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=61-90_2" class="ac_hei"><%=stime_90 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">距缴费日期<60天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=31-60_3" class="ac_hei"><%=stime_60 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #b2333d;">距缴费日期<30天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=16-30_4" class="ac_hong1"><%=stime_30 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #d14b1a;">距缴费日期<15天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=0-15_5" class="ac_hong2"><%=stime_15 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #ebbf1c;">距缴费日期&lt;0天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=chao_6" class="ac_huang"><%=stime_0 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #ff0510;">已提交订单，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=1" class="ac_hong3"><%=yitijiao%>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">取消：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=4" class="ac_hei"><%=wuyingda %>个</a></td>
                            </tr>
                          </table>
                        </td>
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
            <td valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp;</td>
                  <td width="653">&nbsp;</td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td align="left" valign="top">
                    <table width="654" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                          <table width="600" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp;</td>
                              <td width="116" align="center" class="font12bt">续展案状态统计</td>
                              <td  align="right"><b>商标总数:<%=SbTotal %></b></td>
                               <td></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="630" border="0" cellspacing="0" cellpadding="0" id="Table1">
                            <%--<tr>
                              <td width="345" height="30" align="right" class="user_leftline">全部已缴费商标：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=2" class="ac_hei"><%=jiaofei%>个</a></td>
                            </tr>--%>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">已完成缴费，等待下次缴费（&gt;90天）：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=90_1" class="ac_hei"><%=stime90 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">距缴费日期<90天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=61-90_2" class="ac_hei"><%=stime_90 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">距缴费日期<60天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=31-60_3" class="ac_hei"><%=stime_60 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #b2333d;">距缴费日期<30天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=16-30_4" class="ac_hong1"><%=stime_30 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #d14b1a;">距缴费日期<15天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=0-15_5" class="ac_hong2"><%=stime_15 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #ebbf1c;">距缴费日期&lt;0天，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=chao_6" class="ac_huang"><%=stime_0 %>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #ff0510;">已提交订单，尚未续费：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=1" class="ac_hong3"><%=yitijiao%>个</a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">取消：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=4" class="ac_hei"><%=wuyingda %>个</a></td>
                            </tr>
                          </table>
                        </td>
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
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
