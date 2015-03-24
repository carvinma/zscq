<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jifen_show.aspx.cs" Inherits="jifen_show" %>

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
  <script src="js/js.js" type="text/javascript"></script>
  <script src="js/shopcart.js" type="text/javascript"></script>
    <style type="text/css">
       ul {
           padding:3px;
           margin:5px;
       }
       li{
           display:inline;
           padding-left:3px;
       }
   </style>
</head>
<body id="youhui">
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_PId" value="0" />
  <input type="hidden" runat="server" id="Hi_Jifen" value="0" />
  <input type="hidden" runat="server" id="Hi_Number" value="1" />
  <input type="hidden" runat="server" id="Hi_PType" value="0" />
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_Herf" value="" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="65" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="752" align="left" valign="top" style="background-color: #f5f5f5;">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="64" align="left" valign="top" style="background-image: url(images/jifen3.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="356" align="left" valign="top" style="background-image: url(images/server2.gif);">
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
                        <td width="183" align="left"><a href="###" class="ac2">Reward Points Shop</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td align="left" valign="top">&nbsp; </td>
                  <td align="left" valign="top" style="background-color: #f4f4f4;">
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
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=2" <%= ptype==2?"class=\"ac5\"":"" %>>Coupon Exchange</a> </td>
                            </tr>
                            <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen6.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=3" <%= ptype==3?"class=\"ac5\"":"" %>>User Level Exchange</a> </td>
                            </tr>
                              <tr>
                              <td width="27" height="26" align="left"><img src="images/jifen4.gif" width="20" height="19" /> </td>
                              <td width="143" height="18" align="left"><a style="font-weight:bold;" href="jifen.aspx?ptype=1" <%= ptype==1?"class=\"ac5\"":"" %>>Reward points exchange</a> </td>
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
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=1"><img src="images/jifen7.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen7s.gif';" onmouseout="this.src='images/jifen7.gif';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=2"><img src="images/jifen8.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen8s.gif';" onmouseout="this.src='images/jifen8.gif';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td height="37"></td>
                  <td height="37" align="left"><a href="jifen_gz.aspx?index=3"><img src="images/jifen9.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen9s.gif';" onmouseout="this.src='images/jifen9.gif';" /></a> </td>
                  <td height="37"></td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td align="left" valign="top"><img src="images/jifen2.gif" width="260" height="292" /> </td>
          </tr>
        </table>
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="left" valign="top" style="background-image: url(images/aboutus_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="41" height="36">&nbsp; </td>
                  <td width="678" align="left">
                    <table width="678" border="0" cellspacing="0" cellpadding="0">
                      <tr>                        
                        <td width="141" align="left">
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
                                      <input runat="server" type="text" name="pagekey" id="pagekey" style="height: 18px; width: 141px; font-size: 12px; border: 1px solid #fff;" maxlength="30" />
                                      <input runat="server" type="hidden" name="pageindex" id="pageindex" /></td>
                                    <td width="26" align="left"><a href="javascript:void(0);" onclick="s();"><img src="images/jifen11.gif" width="25" height="22" /></a></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td><a class="ac5"  style="float:left; width: 157px;" href="jifen.aspx?myself=1">The exchangable commodity</a></td>
                        <td width="1">&nbsp; </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">Front page</a>&nbsp;>>&nbsp;<a href="youhui.aspx">Preferential Benefit Activity</a>&nbsp;>>&nbsp;<a href="jifen.aspx?ptype=<%= Hi_PType.Value%>&ye=<%=ye %>&sel=<%=sel %>&keyword=<%=key %>">Reward Points Shop</a>&nbsp;>>&nbsp;<%=cname %>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="662" valign="top">
              <table width="715" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="59" height="26">&nbsp; </td>
                  <td width="656">&nbsp; </td>
                </tr>
                <tr>
                  <td width="59" height="625">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="622" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="622" height="119" align="left" valign="top">
                          <table width="623" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="271" height="193" align="left" valign="top"><img src="../pic_big/<%=cpic %>" width="260" height="260" /> </td>
                              <td width="352" align="left" valign="top">
                                <table width="351" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="351" height="30" align="left">Gift Name：<%= cname %>
                                    </td>
                                  </tr>
                                  <%--<tr>
                                    <td height="30" align="left">Gift Number：<%= snnumber %></td>
                                  </tr>--%>
                                  <tr>
                                    <td height="30" align="left">Required points：<span class="font14ac5"><%= jifen%></span> </td>
                                  </tr>
                                  <tr>
                                    <td height="30" align="left">Attention Degree：<%= follow %></td>
                                  </tr>
                                    <tr>
                                    <td width="351" height="30" align="left" style="color:#d44147">Commodity tips：<%= ctip %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="30" align="left">&nbsp; </td>
                                  </tr>
                                  <tr>
                                    <td height="92" align="left" style="border: 1px solid #e1e2e3;">
                                      <table width="100%" height="75" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td width="6%" height="42">&nbsp; </td>
                                          <td width="94%" align="left">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <%if (isshow == 1)
                                                  {%>
                                                <%if (ptype == 3)
                                                  { %>
                                                <td width="17%" height="20" style="line-height: 21px; font-size: 12px; color: #656565;">Exchange one level commodity </td>
                                                <%}
                                                  else
                                                  { %>
                                                <td width="17%" height="20" style="line-height: 21px; font-size: 12px; color: #656565;">Exchange </td>
                                                <td width="5%" align="left"><img src="images/icon_jian.gif" style="cursor: pointer;" width="14" height="13" onclick="jfpnumber(2)" /> </td>
                                                <td width="13%" align="center">
                                                  <input runat="server" id="ibuycount" value="1" size="5" maxlength="4" onchange="jfchange();" oncopy="return false" onpaste="return false" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled; height: 18px; width: 35px; font-size: 12px; border: 1px solid #e1e2e3; text-align: center;" />
                                                </td>
                                                <td width="6%" align="left"><img src="images/icon_jia.gif" style="cursor: pointer;" width="14" height="13" onclick="jfpnumber(1)" /> </td>
                                                <td width="20%" align="right" style="line-height: 21px; font-size: 12px; color: #656565;">Total： </td>
                                                <td width="39%" align="left" style="line-height: 21px; font-size: 12px; color: #656565;"><span id="jfzj" class="font14ac5">
                                                  <%=jifen%>
                                                </span></td>
                                                <%}
                                                  }
                                                  else
                                                  {%>
                                                <td width="17%" height="20" style="line-height: 21px; font-size: 12px; color: #656565;">Commodity was already out of stock </td>
                                                <%} %>
                                              </tr>
                                            </table>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td height="33">&nbsp; </td>
                                          <td align="left">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td width="35%" align="left"><a href="javascript:void(0);" onclick="duihuan();"><img src="images/duihuan.jpg" width="105" height="22" border="0" /> </a></td>
                                                <td width="65%">&nbsp; </td>
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
                        </td>
                      </tr>
                      <tr>
                        <td height="19" align="left" valign="top">&nbsp; </td>
                      </tr>
                      <tr>
                        <td height="25" align="left" style="border-bottom: 1px solid #d45156; font-size: 12px; font-weight: bold;">Detailed information： </td>
                      </tr>
                      <tr>
                        <td height="17" align="left" valign="top"></td>
                      </tr>
                      <tr>
                        <td height="25" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                          <%= contents %>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="26">&nbsp; </td>
                  <td align="left" valign="top"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="15"><img src="images/server7.gif" width="741" height="15" /> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
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
  function IsDigit() {
    return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
  }

</script>
<script type="text/javascript">
    function s() {
        //window.location = "jifen.aspx?ptype=" + $("#hd_ptype").val() + "&sel=" + $('#Jifen option:selected').val() + "&keyword=" + escape($('#pagekey').val());
        window.location = "jifen.aspx?ptype=" + $("#hi_ptype").val() + "&sel=" + $('#Jifen option:selected').val() + "&producttype=" + $('#producttype option:selected').val() + "&keyword=" + escape($('#pagekey').val());

    }
</script>
