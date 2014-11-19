<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbtj.aspx.cs" Inherits="user_sbtj" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>상표  통계_나의 상표_서비스 센터_상표시시템_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="HQHT 연차료관리 전자상거래 플랫폼" />
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
  <uc3:zscqadv ID="zscqadv1" TypeId="96" runat="server" />
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
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;&gt;&gt;&nbsp;회원센터&nbsp;&gt;&gt;&nbsp;서비스 센터&nbsp;&gt;&gt;&nbsp;나의 상표&nbsp;&gt;&gt;&nbsp;상표정보 검색</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="15">&nbsp;</td>
                  <td width="653">&nbsp;</td>
                </tr>
                 <tr>
                  <td width="38" height="28">&nbsp;</td>
                  <td width="653" align="left" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp;</td>
                              <td width="218" align="center">&nbsp;</td>
                              <td width="364"  align="right"><b>상표총수:<a href="user_sblb.aspx" class="ac_hei"><%=SbTotal%></a></b></td>
                               <td width="8"></td>
                            </tr>
                          </table></td>
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
                              <td width="116" align="center" class="font12bt">기한 및 상태 통계</td>
                              <td  align="right">&nbsp;</td>
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
                            <%--<tr>
                              <td width="345" height="30" align="right" class="user_leftline">납부한 상표：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=2" class="ac_hei"><%=jiaofei%></a></td>
                            </tr>--%>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">납부기한일 까지&gt;90, 아직납부 되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=90_1" class="ac_hei"><%=stime90 %></a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">납부기한일 까지&lt;90, 아직납부 되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=61-90_2" class="ac_hei"><%=stime_90 %></a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">납부기한일 까지&lt;60, 아직납부 되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=31-60_3" class="ac_hei"><%=stime_60 %></a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #b2333d;">납부기한일 까지<30, 아직납부 되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=16-30_4" class="ac_hong1"><%=stime_30 %></a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #d14b1a;">납부기한일 까지<15, 아직납부 되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=0-15_5" class="ac_hong2"><%=stime_15 %></a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #ebbf1c;">납부기한일 까지<0, 아직납부 되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?stime=chao_6" class="ac_huang"><%=stime_0 %></a></td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline" style="font-weight: bold; color: #ff0510;">주문제출, 아직 납부되지 않음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=1" class="ac_hong3"><%=yitijiao%></a></td>
                            </tr>
                               <%-- <tr>
                    <td width="345" height="30" align="right" class="user_leftline">已提交委托订单，缴费中：</td>
                    <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=1" class="ac_hei"><%=jiaofei%></a></td>
                    </tr>
                           <tr>
                              <td width="345" height="30" align="right" class="user_leftline">납부할성표 없음：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=0" class="ac_hei"><%=nojiaofei %></a></td>
                            </tr>--%>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">취소：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_sblb.aspx?isjiaofei=4" class="ac_hei"><%=wuyingda %></a></td>
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
