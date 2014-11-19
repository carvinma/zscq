<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbddck.aspx.cs" Inherits="user_sbddck" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>My Trademark Order_Service Center_System of Trademark Maintenance_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="Global patent Intellectual property annuity fee e-commerce platform" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
  <asp:HiddenField ID="HF_oId" runat="server" Value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="68" runat="server" />
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
                  <td align="left"><a href="index.aspx">Front page</a>&nbsp;>>&nbsp;System of Trademark Maintenance&nbsp;>>&nbsp;Service Center&nbsp;>>&nbsp;My Trademark Order&nbsp;&gt;&gt;&nbsp;Order details</td>
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
                  <td height="123">&nbsp;</td>
                  <td width="691" align="left" valign="top">
                    <table id="pr_table" width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="224" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="207" align="center" class="font12bt">Orders basic information</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0">
                            <tr class="orderxx">
                              <td height="30" width="8%" align="right" valign="middle"> </td>
                              <td align="left" width="32%" valign="middle">
                               <span class="ordertext">Your Order number：</span> <%=OrderNum %></td>
                              <td align="right" width="3%" valign="middle"></td>
                              <td align="left" width="28%" valign="middle">
                               User ID： <%=UserNum %></td>
                              <td width="29%" align="left" valign="middle">
                              Order status：<%=OrderState %>  </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="30" align="right" valign="middle"></td>
                              <td align="left" valign="middle">
                               Submitted time： <%=dt_addtime %></td>
                              <td align="right" valign="middle"></td>
                              <td colspan="2" align="left" valign="middle">
                              Submitted person： <%=UserName%></td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="229" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="211" align="center" class="font12bt">Trademark list to be renewed</td>
                                    <td width="8"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <tr>
                                    <td width="106" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Trademark Registration number</td>
                                    <td width="75" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Trademark class</td>
                                    <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Payment channel</td>
                                    <td width="141" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Name of Trademark registrant</td>
                                 <%--   <td width="77" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">审核状态</td>--%>
                                    <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Status</td>
                                    <td width="67" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Expiry date</td>
                                    <td width="48" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Detailed information</td>
                                                <td width="78" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">Download</td>
                                  </tr>
                                  <asp:Repeater ID="rp_trademark" runat="server">
                                    <ItemTemplate>
                                      <tr>
                                        <td width="106" height="32" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBRegNum") %></td>
                                        <td width="75" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBType")%></td>
                                        <td width="80" align="center" bgcolor="#FFFFFF">
                                          <%#Eval("i_JiaoFeiType").ToString() == "1" ?"Renew by oneself" :"Entrust to renew"%></td>
                                        <td width="141" align="center" bgcolor="#FFFFFF" style="line-height:20px;">
                                        <%if (usertype == 3)
                                          { %>
                                          <%# Eval("i_GuoJiId").ToString() != "1" ? Eval("nvc_SBRegName") + "<br>" + Eval("nvc_SBRegEnName") : Eval("nvc_SBRegName")%>
                                          <%} %>
                                          <%else 
                                          { %>
                                          <%# Eval("nvc_SBRegName")%>
                                          <%} %>
                                        </td>
                                     <%--   <td width="77" align="center" bgcolor="#FFFFFF">
                                          <%#Eval("i_State").ToString() == "1" ? "Audited" :(Eval("i_State").ToString() == "2"?"Not passed":"Not checked")%>
                                        </td>--%>
                                        <td width="69" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("i_IsPayState").ToString()=="1"?"Entrust to renew":(Eval("i_IsPayState").ToString()=="2"?"Paid":"Unpaid")%></td>
                                        <td width="67" align="center" bgcolor="#FFFFFF">
         <%# Eval("nvc_SbDaoqiTime")%></td>
                                        <td width="48" align="center" bgcolor="#FFFFFF"><a href="user_sbck.aspx?t_r_id=<%#Eval("i_TrademarkId")%>" target="_blank" class="ac5t">Check</a></td>
                                         <td width="78" align="center" bgcolor="#FFFFFF"><a href="user_World_sbweituo.aspx?id=<%#Eval("i_TrademarkId")%>&type=2" target="_blank" class="ac5t">Attorney Download</a> <br /><a href="user_World_sb.aspx?id=<%#Eval("i_TrademarkId")%>&type=3" target="_blank" class="ac5t">Application Download</a></td>
                                      </tr>
                                    </ItemTemplate>
                                  </asp:Repeater>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="24" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <%if (isfapiao == 1)
                            { %>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">发票相关</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="15%" height="32" align="right" style="line-height: 21px;">发票抬头：</td>
                              <td width="85%" colspan="5" align="left" style="line-height: 21px;">
                                <%=fapiaotaitou%></td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">邮寄方式：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjitype%>&nbsp;&nbsp; </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">邮寄Address：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhi%>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">收件人：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhia%>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">Tel：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhib%>
                              </td>
                            </tr>
                          </table>
                          <%} %>
                          <table width="687" border="0" cellspacing="0" cellpadding="0" runat="server" id="Table_YouHuiQuan1">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="130" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="112" align="center" class="font12bt">Coupon</td>
                                    <td width="8"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto" runat="server" id="Table_YouHuiQuan2">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="184" align="right">Whether to use coupons：</td>
                                    <td width="231" align="left">
                                      <%=isuseyouhui %>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr class="orderxx" id="youhuiquan1" runat="server">
                              <td height="30" align="left" valign="middle">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="184" align="right">Use coupons：</td>
                                    <td width="231" align="left">
                                      <%=youhuiquan %>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="15" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;"><table width="164" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="10" height="20">&nbsp;</td>
                                  <td width="149" align="center" class="font12bt">Amounts related</td>
                                  <td width="5"></td>
                                </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="59" align="right" valign="top" style="line-height: 22px;">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="59" align="right" valign="top" style="line-height: 22px;">
                               
                                <table>
                                <tr>
                                <td height="59" align="right"> 
                                <table width="440" border="0" cellspacing="0" cellpadding="0">
                                   <%=Str_Money %>
                                </table>
                                     <table width="440" border="0" cellspacing="0" cellpadding="0">
                                     <%if (isyouhuiquan == 1)
                                       { %>
                                <tr align="left" >  
                                <td width="200" align="right">Use coupon：</td><td width="110" id="youhuiquan"><%=youhuifee %></td><td width="30"></td><td width="100"></td>
                                </tr>
                                <%} %>
                                
                                </table>
                                <table width="440" border="0" cellspacing="0" cellpadding="0">
                               <%=Str_AllMoney%>
                                </table>
                               </td>
                                <td width="30"></td>
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
                      <tr>
                        <td align="left">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="162" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="149" align="center" class="font12bt">Payment methods</td>
                                    <td width="3"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">
                                <%=payway%></td>
                            </tr>
                            <tr class="orderxx">
                              <td height="15" align="left">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="41" align="right">
                        <%if (xianxiafukuan == 0)
                          {%>
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/user_zl_b10.gif" OnClick="ImageButton1_Click" />
                          <%} %>
                          &nbsp;&nbsp;<a href="user_sbdd.aspx"><img src="images/user_zl_b11.gif" width="145" height="29" border="0" /></a>  &nbsp;&nbsp;  <a href="javascript:void(0)"> <img src="images/user_zl_pr.jpg" onclick="printPage()" /></a>
                              <script type="text/javascript">
                                                        function printPage() {
                                                            var newWin = window.open();
                                                            var titleHTML = document.getElementById("pr_table").innerHTML;
                                                            newWin.document.write(titleHTML);
                                                            newWin.document.location.reload();
                                                            newWin.print();
                                                        }
                                                    </script></td>
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
  </td>
  </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
  <script type="text/javascript">
    function Checkshow() {
      var youhui = document.getElementById("cb_youhui");
      if (youhui.checked) {
        document.getElementById("youhuiquan").style.display = "";
      }
      else {
        document.getElementById("youhuiquan").style.display = "none";
      }
    }
    
    
    
    
  </script>
</body>
</html>
