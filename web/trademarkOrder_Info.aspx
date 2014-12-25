<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademarkOrder_Info.aspx.cs" Inherits="trademarkOrder_Info" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>我的商标订单_服务中心_商标系统_环球汇通</title>
  <meta name="Keywords" content="环球汇通" />
  <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
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
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;商标系统&nbsp;>>&nbsp;服务中心&nbsp;>>&nbsp;我的商标订单&nbsp;&gt;&gt;&nbsp;订单详情</td>
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
                                <table width="147" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="130" align="center" class="font12bt">订单基本信息</td>
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
                              <td height="30" width="5%" align="right" valign="middle"> </td>
                              <td align="left" width="35%" valign="middle">
                               <span class="ordertext">您的订单号：</span> <%=OrderNum %></td>
                              <td align="right" width="3%" valign="middle"></td>
                              <td align="left" width="17%" valign="middle">
                               会员号： <%=UserNum %></td>
                              <td align="right" width="3%" valign="middle"></td>
                              <td align="left" width="20%" valign="middle">
                                订单状态：<%=OrderState %>  </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="30" align="right" valign="middle"></td>
                              <td align="left" valign="middle">
                               提交时间： <%=dt_addtime %></td>
                              <td align="right" valign="middle"></td>
                              <td align="left" valign="middle">
                             提交人： <%=UserName%></td>
                              <td align="right" valign="middle"></td>
                              <td align="left" valign="middle"></td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="147" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="130" align="center" class="font12bt">缴费商标清单</td>
                                    <td width="7"></td>
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
                                    <td width="106" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">案件号</td>
                                    <td width="85" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">申请人</td>
                                    <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">图样</td>
                                    <td width="121" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</td>
                                    <td width="79" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">金额</td>
                                    <td width="67" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">申请书</td>
                                    <td width="48" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">委托书</td>
                                  </tr>
                                  <asp:Repeater ID="rp_trademark" runat="server">
                                    <ItemTemplate>
                                      <tr>
                                        <td width="106" height="32" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("CaseNo")%></td>
                                        <td width="75" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("ApplyName")%></td>
                                        <td width="80" align="center" bgcolor="#FFFFFF">
                                          <img alt="" src="<%# Eval("TrademarkPattern1") %>" width="50" height="30" />
                                        <td width="141" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("TrademarkType")%></td>
                                        <td width="69" align="center" bgcolor="#FFFFFF">
                                          <%# (decimal.Parse(Eval("TrademarkMoney").ToString()) + dailiFee)%></td>
                                        <td width="67" align="center" bgcolor="#FFFFFF">
                                          <%# (Eval("ApplyBook") != null && string.IsNullOrEmpty(Eval("ApplyBook").ToString()) == false)
                                                                     ? ("<a href='"+Eval("ApplyBook")+"' title='点击查看' target='_blank'>已上传</a>") : "未上传"%>
                                        </td>
                                        <td width="48" align="center" bgcolor="#FFFFFF">
                                        <%# (Eval("AgentBook") != null && string.IsNullOrEmpty(Eval("AgentBook").ToString()) == false)
                                                                        ? ("<a href='" + Eval("AgentBook") + "' title='点击查看' target='_blank'>已上传</a>") : "未上传"%>
                                        </td>
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
                                快递（到付）</td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">邮寄地址：</td>
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
                              <td height="32" align="right" style="line-height: 21px;">电话：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhib%>
                              </td>
                            </tr>
                          </table>
                          <%} %>
                          <table width="687" border="0" cellspacing="0" cellpadding="0" runat="server" id="Table_YouHuiQuan1">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">优惠券</td>
                                    <td width="6"></td>
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
                                    <td width="100" align="right">是否使用优惠券：</td>
                                    <td width="326" align="left">
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
                                    <td width="100" align="right">使用优惠券：</td>
                                    <td width="326" align="left">
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
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">金额相关</td>
                                    <td width="6"></td>
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
                                <td width="200" align="right">使用优惠劵：</td><td width="110" id="youhuiquan"><%=youhuifee %></td><td width="30"></td><td width="100"></td>
                                </tr>
                                <%} %>
                                <%if(isfapiao==1){ %> 
                                 <tr align="left" >  
                                <td width="200" align="right">邮寄费用：</td><td width="110" id="youji"><%=youjifee %></td><td width="30"></td><td width="100"></td>
                                </tr> 
                                 <tr align="left" >  
                                <td width="200" align="right">增值税金额：</td><td width="110" id="suidian"><%=fapiaosui%></td><td width="30"></td><td width="100"></td>
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
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">支付方式</td>
                                    <td width="6"></td>
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
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/user_zl_b10.gif" OnClick="ImageButton1_Click" />
                          <%} %>
                          &nbsp;&nbsp;<a href="trademarkOrder_list.aspx"><img src="images/user_zl_b11.gif" width="85" height="29" border="0" /></a>  &nbsp;&nbsp;  <a href="javascript:void(0)"> <img src="images/user_zl_pr.jpg" onclick="printPage()" /></a>
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
