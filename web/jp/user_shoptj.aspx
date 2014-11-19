<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shoptj.aspx.cs" Inherits="user_shoptj" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="84" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <uc1:zscq_sp_leftmenu ID="zscq_sp_leftmenu1" runat="server" />
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
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;&gt;&gt;&nbsp;会員センター&nbsp;&gt;&gt;&nbsp;サービスセンター&nbsp;&gt;&gt;&nbsp; <span left-pos="0|6" right-pos="0|6" space="">私の</span><span left-pos="6|6" right-pos="6|6" space="">積分</span><span left-pos="12|6" right-pos="12|6" space="">受注</span><span left-pos="18|6" right-pos="18|6" space="">統計</span></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
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
                          <table width="217" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10" height="20">&nbsp;</td>
                              <td width="201" align="center" class="font12bt">ポイントオーダー数と状態統計</td>
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
                          <table width="630" border="0" cellspacing="0" cellpadding="0" id="h_lsitt1">
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">出荷待ちオーダー：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_shopdd.aspx?state=2" class="ac_hei"><%= GetOrderCount(2) %></a> </td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">受取待ちオーダー：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_shopdd.aspx?state=3" class="ac_hei"><%= GetOrderCount(3)  %></a> </td>
                            </tr>
                            <tr>
                              <td width="345" height="30" align="right" class="user_leftline">完成済オーダー：</td>
                              <td width="285" class="user_rightline">&nbsp;&nbsp;<a href="user_shopdd.aspx?state=4" class="ac_hei"><%= GetOrderCount(4)  %></a> </td>
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
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
