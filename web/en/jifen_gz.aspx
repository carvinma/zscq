<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jifen_gz.aspx.cs" Inherits="jifen_gz" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    .style1 { height: 397px; }
    .style2 { height: 11px; }
    .style3 { height: 439px; }
  </style>
</head>
<body id="youhui">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="65" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" align="left" valign="top" style="background-image: url(images/youhui2.gif);">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="64" align="left" valign="top" style="background-image: url(images/jifen3.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="73" align="left" valign="top">
              <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="youhui.aspx" class="ac2">Activity</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td width="10">&nbsp; </td>
                  <td width="221" height="22" bgcolor="#d34245">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="jifen.aspx" class="ac2">Reward Points Shop</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td align="left" valign="top">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                      <tr>
                        <td width="23">&nbsp; </td>
                        <td width="178" height="18" align="left" valign="top">
                          <table width="170" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen5.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=2" >Coupon Exchange</a> </td>
                            </tr>
                            <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen6.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=3">User Level Exchange</a> </td>
                            </tr>
                              <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen4.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=1" >Reward points exchange</a> </td>
                            </tr>
                               <tr>
                                <td width="27" height="26" align="left"></td>
                                <td>
                                    <div runat="server" id="producttypelist">
                                        
                                    </div>

                                </td>
                            </tr>
                          </table>
                        </td>
                        <td width="20">&nbsp; </td>
                      </tr>
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                    </table>
                  </td>
                  <td align="left" valign="top">&nbsp; </td>
                </tr>
                <tr>
                  <td width="10">&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="25" height="22">&nbsp; </td>
                        <td width="13">&nbsp; </td>
                        <td width="183" align="left">
                          <%if (isLogin)
                            { %>
                          <a href="user_shopintegral.aspx" class="ac2">Enter personal center</a>
                          <%} %>
                          <%else
                            { %>
                          <a href="ShopLogin.aspx" class="ac2">Enter reward points system</a>
                          <%} %>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="33"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=1"><img src="<%=  index == 1 ? "images/jifen7s.gif" : "images/jifen7.gif"%>" width="217" height="31" border="0" onmouseover="this.src='images/jifen7s.gif';" onmouseout="this.src='<%=  index == 1 ? "images/jifen7s.gif" : "images/jifen7.gif"%>';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=2"><img src="<%=  index == 2 ? "images/jifen8s.gif" : "images/jifen8.gif"%>" width="217" height="31" border="0" onmouseover="this.src='images/jifen8s.gif';" onmouseout="this.src='<%=  index == 2 ? "images/jifen8s.gif" : "images/jifen8.gif"%>';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=3"><img src="<%=  index == 3 ? "images/jifen9s.gif" : "images/jifen9.gif"%>" width="217" height="31" border="0" onmouseover="this.src='images/jifen9s.gif';" onmouseout="this.src='<%=  index == 3 ? "images/jifen9s.gif" : "images/jifen9.gif"%>';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="left" valign="top" style="background-image: url(images/aboutus_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="36">&nbsp; </td>
                  <td width="678" align="left">
                    <table width="678" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        
                        <td width="131" align="left">
                          <select runat="server" id="Jifen" onchange="s();" name="Jifen" style="border-right: #d7d7d7 1px solid; border-top: #d7d7d7 1px solid; font-size: 12px; border-left: #d7d7d7 1px solid; width: 129px; border-bottom: #d7d7d7 1px solid; height: 24px;">
                            <option value="-1,-1">&nbsp;&nbsp;Please select Reward Points Scope</option>
                            <option value="0,50">&nbsp;&nbsp;0 to 50 reward points</option>
                            <option value="51,100">&nbsp;&nbsp;51 to 100 reward points</option>
                            <option value="101,300">&nbsp;&nbsp;101 to 300 reward points</option>
                            <option value="301,500">&nbsp;&nbsp;301 to 500 reward points</option>
                            <option value="500,0">&nbsp;&nbsp;More than 500 points</option>
                          </select>
                        </td>
                           <td width="138" align="left">
                          <select runat="server" id="producttype" onchange="s();" name="producttype" style="padding-top: 3px; padding-bottom: 2px; font-size: 12px; width: 129px; height: 24px; line-height: 24px; overflow: hidden; vertical-align: text-bottom; border: #d7d7d7 1px solid;">                           
                 
                          </select>
                        </td> 
                        
                        <td width="184" align="left">
                          <table width="172" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="172" height="24" align="left" valign="top" style="background-image: url(images/jifen10.gif);">
                                <table width="172" border="0" align="right" cellpadding="0" cellspacing="0" height="24">
                                  <tr>
                                    <td width="146" height="24" align="right">
                                      <input runat="server" type="text" name="pagekey" id="pagekey" style="height: 18px; width: 141px; font-size: 12px; border: 1px solid #fff;" maxlength="30" /></td>
                                    <td width="26" align="left"><a href="javascript:void(0);" onclick="s();"><img src="images/jifen11.gif" width="25" height="22" /></a></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td><a class="ac5"  style="float:left; width: 163px;" href="jifen.aspx?myself=1">The exchangable commodity</a></td>
                        <td width="1">&nbsp; </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">Front page</a>&nbsp;>>&nbsp;<a href="youhui.aspx">Preferential Benefit Activity</a>&nbsp;>>&nbsp;<a href="jifen.aspx">Reward Points Shop</a>&nbsp;>>&nbsp;<%=cname %>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td valign="top" class="style3">
              <table width="715" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="59" height="26">&nbsp; </td>
                  <td width="656">&nbsp; </td>
                </tr>
                <tr>
                  <td width="59" class="style1">&nbsp; </td>
                  <td align="left" valign="top" class="style1">
                    <table width="622" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="622" height="25" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                          <%= content %>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td align="left" valign="top"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td align="left" valign="top"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  </form>
  <script type="text/javascript">
    function myKeyDown() {
      var k = window.event.keyCode;

      if ((k == 46) || (k == 8) || (k == 189) || (k == 109) || (k == 190) || (k == 110) || (k >= 48 && k <= 57) || (k >= 96 && k <= 105) || (k >= 37 && k <= 40))
      { }
      else if (k == 13) {
        window.event.keyCode = 9;
      }
      else {
        window.event.returnValue = false;
      }

    }
    function OnlyNumber() {
      if (!((window.event.keyCode >= 48) && (window.event.keyCode <= 57))) {
        window.event.keyCode = 0;
      }
    }

  </script>
</body>
</html>
<script type="text/javascript">
    function s() {
        //window.location = "jifen.aspx?sel=" + $('#Jifen option:selected').val() + "&keyword=" + escape($('#pagekey').val());

        window.location = "jifen.aspx?sel=" + $('#Jifen option:selected').val() + "&producttype=" + $('#producttype option:selected').val() + "&keyword=" + escape($('#pagekey').val());

    }
</script>

