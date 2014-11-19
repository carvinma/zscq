﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_TrademarkOrderAdd.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscqAddress.ascx" TagName="zscqaddress" TagPrefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>确认订单_我的商标订单_服务中心_商标系统_环球汇通</title>
  <meta name="Keywords" content="环球汇通" />
  <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
  <style type="text/css">
    .style1 { width: 25px; }
    #allmoney{font-size:12px;color:#999;}
  </style>
</head>
<body id="index" onload="checkpay(1);">
  <form id="form1" runat="server" method="post">
  <input type="hidden" runat="server" id="input_payway" value="" />
  <input type="hidden" runat="server" id="bank" value="" />
  <input type="hidden" runat="server" id="hi_hui" value="1" />
  <input type="hidden" runat="server" id="hi_guoji" value="0" />
  <input type="hidden" runat="server" id="hi_fapiao" value="0" />
  <input type="hidden" runat="server" id="hi_allmy" value="0" />
  <input type="hidden" runat="server" id="hi_allmymei" value="0" />
   <input type="hidden" runat="server" id="hi_dfaid" value="0" />
     <input type="hidden" runat="server" id="hi_GanfeeZhinajin" value="0" />
      <input type="hidden" runat="server" id="hi_youhui" value="0" />
      <input type="hidden" runat="server" id="hi_total" value="0" />
      
  <uc1:zscqtop2 ID="zscqtop21" runat="server" />
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
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;商标系统&nbsp;>>&nbsp;服务中心&nbsp;>>&nbsp;我的商标订单&nbsp;&gt;&gt;&nbsp;确认订单</td>
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
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
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
                               <div id="trademarkinfo"> 
                                <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <tr>
                                    <td width="131" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商标注册号</td>
                                    <td width="92" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商标类别</td>
                                    <td width="92" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">交费类型</td>
                                    <td width="203" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">注册人姓名</td>
                                   <%-- <td width="77" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">审核状态</td>
                                    <td width="61" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">是否缴费</td>--%>
                                    <td width="77" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">到期日</td>
                                    <td width="75" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">详情</td>
                                  </tr>
                                  <%=sb_trademrk %>
                                </table>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td height="24" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="115" align="center" class="font12bt">发票相关</td>
                                    <td width="7"></td>
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
                              <td width="15%" height="30" align="right" style="line-height: 21px;">是否开票： </td>
                              <td colspan="5" align="left"  style="line-height: 21px;">
                               <input type="radio" name="v" id="aa" value="" onclick ="fpshow()" runat="server"  checked="true"/>&nbsp;暂不需要发票 
                                 <input id="checkfp" name="v" type="radio"   value="" onclick="fpshow()" runat="server" />&nbsp;需要发票(官费加3.3%的增值税) </td>
                            </tr>
                            <tr class="tr_fp  tr_fp1">
                              <td width="15%" height="58" align="right" valign="top" style="line-height: 21px;">发票抬头：</td>
                              <td width="85%" colspan="5" align="left" valign="top" style="line-height: 21px;">
                                <input type="text" name="s5" id="txt_fptt" runat="server" class="font12000t" maxlength="100" />
                                &nbsp;&nbsp;<br />
                                您填写的内容将被系统自动打印到发票上，所以千万别填写和发票抬头无关的信息。 </td>
                            </tr>
                          <%--  <tr class="tr_fp tr_fp2">
                              <td width="15%" height="24" align="right" valign="top" style="line-height: 21px;">是否需要邮寄：</td>
                              <td colspan="5" align="left" valign="top" style="line-height: 21px;">
                                <input id="checkyj" name="v2" type="checkbox" value="" onclick="yjshow()" runat="server" />&nbsp;&nbsp; </td>
                            </tr>--%>
                            <tr class="tr_fp tr_fp3">
                              <td width="15%" height="34" align="right" style="line-height: 21px;">邮寄方式：</td>
                              <td colspan="5" align="left" style="line-height: 21px;">
                                  <asp:HiddenField ID="hi_guowaifee" runat="server" Value="0"/>
                                     <asp:HiddenField ID="hi_youji" runat="server" Value="0"/>
                                <input name="" type="radio" id="radio_guowaifs" value="" checked="checked" />快递&nbsp;( 加收<%=guowaiyouji%>元邮寄费)</td>
                            </tr>
                            <tr class="tr_fp tr_fp4">
                              <td width="15%" height="34" align="right" style="line-height: 21px;">邮寄方式：</td>
                              <td colspan="5" align="left" style="line-height: 21px;">
                                  <asp:HiddenField ID="lb_Way" runat="server"/>
   <asp:HiddenField ID="input_Way" runat="server"  Value="0"/>

                             <%--   <input name="radio" type="radio" id="radio1" value="radio" checked="true" onchange="kuaidicheck();" runat="server" />
                                挂号信(免费)&nbsp;&nbsp;
                                <input type="radio" name="radio" id="radio2" value="radio" onchange="kuaidicheck();" runat="server" />
                                快递&nbsp;(加收25元快递费)&nbsp;&nbsp;&nbsp;--%>
                                
                               <%=PSWay%>
                                </td>
                            </tr>
                            <tr class="tr_fp tr_fp3 tr_fp4">
                              <td width="15%" height="34" align="right" style="line-height: 21px;" valign="top">邮寄地址：</td>
                              <td colspan="5" align="left" style="line-height: 21px;">
                                <uc5:zscqaddress ID="zscqaddress" runat="server" /><%--
                                <asp:Literal ID="Ltl_DefaultAddress" runat="server"></asp:Literal>
                                <span id="s_adress" runat="server">
                                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                      <asp:DropDownList ID="Drp_GuoJi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Drp_GuoJi_SelectedIndexChanged">
                                      </asp:DropDownList>
                                      <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                        <asp:ListItem Value="0">请选择省</asp:ListItem>
                                      </asp:DropDownList>
                                      <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                        <asp:ListItem Value="0">请选择市/区</asp:ListItem>
                                      </asp:DropDownList>
                                      <asp:DropDownList ID="DropDownList4" runat="server">
                                        <asp:ListItem Value="0">请选择区/县</asp:ListItem>
                                      </asp:DropDownList>
                                    </ContentTemplate>
                                  </asp:UpdatePanel>
                                </span>
                                <input id="t_address" type="text" runat="server" style="width: 350px; height: 50px;" />--%>
                              </td>
                            </tr>
                            <tr>
                              <td height="16" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0" id="table_youhuiquan" runat="server">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="115" align="center" class="font12bt">优惠券</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto" id="table_yhq1" runat="server">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="14%" align="right" valign="top" style="line-height:18px;">使用优惠券：</td>
                                    <td width="86%" align="left"><DIV id=relatedDiv style="OVERFLOW: hidden; WIDTH: 100%">
            <DIV style="WIDTH: 100%">
            <DIV id=related_page_0 style="FLOAT: left; WIDTH: 100%"><span class="font12b4e user_zlbottomline">
                                      <asp:Repeater ID="rp_youhui" runat="server">
                                        <ItemTemplate>
                                        
            <DIV style="FLOAT: left; WIDTH: 270px;height:25px;"><input type="checkbox" name="inputPageid" lang="<%# Eval("i_Money")%>" onclick="CheckYouhui('cb_youhui<%#Eval("i_Id") %>');" id="cb_youhui<%#Eval("i_Id") %>" value='<%# Eval("i_Id")%>'>&nbsp;<%# Eval("nvc_Name")+"(面值：CNY "+Eval("i_Money")+")"%></DIV>
                                        </ItemTemplate>
                                      </asp:Repeater>
                                    </span></DIV></DIV></DIV>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="15" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <script type="text/javascript">
                            var ii = 0;
                              function CheckYouhui(obj) {
                                  var i = 0; ii = 0;
                                  var dmyouhui = 0;
                                  $("input[name='inputPageid']").each(function () {
                                      if ($(this).attr("checked") == "checked") {
                                          i++;
                                      }
                                      else {
                                          ii = i;
                                      }
                                  });
                                  if (i <= parseInt('<%=sbnum%>')) {
                                      if (i != 0) {
                                          jiayouhui(obj);
                                      }
                                      else {
                                          jiayouhui(obj);
                                          $("#youhuiquan").hide();
                                          $(".YH").hide();
                                      }
                                  }
                                  else {
                                      alert("最多可以使用<%=sbnum%>张优惠券");
                                      $("#" + obj).attr("checked", false);
                                  }
                              }
                            function jiayouhui(obj) {                          
                                var allmoney = $("#allmoney").html();
                                if ($("#" + obj).attr("checked") == "checked") {
                                    //alert(allmoney);
                                    $("#youhuiquan").show();                                 
                                    $(".YH").show(); 
                                     dmyouhui = parseFloat($("#" + obj).attr("lang"));
                                     var youhuisui = dmyouhui;
                                     if ($("#hi_youhui").val() != 0) {
                                         youhuisui = parseFloat(parseFloat(dmyouhui) + parseFloat($("#hi_youhui").val())).toFixed(2);
                                    }
                                     $("#hi_youhui").val(youhuisui);
                                    //                                    if ($("#checkfp").attr("checked") == "checked") {
                                  
//                                        var suiold = $("#hi_fapiao").val();
//                                        var suinew = parseFloat(parseFloat(suiold)).toFixed(2); 
//                                        $("#hi_fapiao").val(suinew);                                       
//                                        $("#suidian").html(parseFloat(suinew).toFixed(2));
                                    //                                    }   
                                    $("#hi_total").val(youhuisui);
                                    $("#youhuiquan").html("-" + youhuisui);
                                    var nowmoney = parseFloat(allmoney - dmyouhui);
                                    var hui = $("#hi_hui").val();
                                    if ($("#hi_guoji").val() != 1) {//国外                                        
                                        var nowmoneymei = nowmoney * parseFloat(hui);
                                        $("#allmonymei").html(nowmoneymei.toFixed(2));
                                        $("#hi_allmymei").val(nowmoneymei.toFixed(2));
                                    }
                                   // var nowmoney = parseFloat(allmoney) - parseFloat(dmyouhui);
                                    $("#allmoney").html(nowmoney.toFixed(2));
                                    $("#hi_allmy").val(nowmoney.toFixed(2));
                                }
                                else {
                                    var allmoney = $("#allmoney").html();                                  
                                    if (ii == 0) {
                                        $("#hi_youhui").val('0');
                                    }
                                    var youhuisui = 0;
                                   var dmyouhui = parseFloat($("#" + obj).attr("lang"));
                                    if ($("#hi_youhui").val() != 0) {
                                        youhuisui = parseFloat(parseFloat($("#hi_total").val() - parseFloat(dmyouhui))).toFixed(2);
                                    }
                                    var dmyouhuino = parseFloat($("#" + obj).attr("lang"));
                                    $("#hi_youhui").val(youhuisui);
                                   // $("#hi_total").val(youhuisui);
                                    $("#youhuiquan").html("-" + youhuisui);
//                                    if ($("#checkfp").attr("checked") == "checked") {
//                                        youhuisui = parseFloat(dmyouhui);                                       
//                                        var suiold = $("#hi_fapiao").val();                                       
//                                        var suinew = parseFloat(suiold);
//                                        $("#hi_fapiao").val(suinew.toFixed(2));
//                                        $("#suidian").html(parseFloat(suinew).toFixed(2));
//                                    }
//                                    else {

//                                    }                                   
                                    var nowmoney = parseFloat(allmoney) + parseFloat(dmyouhuino);
                                    var hui = $("#hi_hui").val();
                                    if ($("#hi_guoji").val() != 1) {//国外
                                        var nowmoneymei = nowmoney * parseFloat(hui);
                                        $("#allmonymei").html(nowmoneymei.toFixed(2));
                                        $("#hi_allmymei").val(nowmoneymei.toFixed(2));
                                    }
                                    $("#allmoney").html(nowmoney.toFixed(2));
                                    $("#hi_allmy").val(nowmoney.toFixed(2));
                                }
                            }
                          </script>
                          <table width="687" border="0" cellspacing="0" cellpadding="0" id="table_yhq2" runat="server">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="115" align="center" class="font12bt">金额相关</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="right" valign="top">  
                        <div id="FeeInfo" runat="server">                       
                          <table width="415" border="0" cellspacing="0" cellpadding="0" >
                            <tr>
                              <td height="59" align="right" valign="top" style="line-height: 22px;">
                                <%--   获赠积分：10<br />
                   优惠券抵：<strong class="font14ac5" ></strong><br />
<strong class="font14ac5">-USD 10</strong><br />--%>
                              
                                <table>
                                <tr>
                                <td height="59" align="right"> 
                                <table width="440" border="0" cellspacing="0" cellpadding="0">
                                   <%=Str_Money %>
                                </table>
                                     <table width="440" border="0" cellspacing="0" cellpadding="0">
                                <tr align="left"  class="YH" style="display:none;">  
                                <td width="200" align="right">使用优惠劵：</td><td width="110" id="youhuiquan"></td><td width="30"></td><td width="100"></td>
                                </tr> 
                                 <tr align="left" class="YJ" style="display:none;">  
                                <td width="200" align="right">邮寄费用：</td><td width="110" id="youji"></td><td width="30"></td><td  width="100"></td>
                                </tr>
                                 <tr align="left" class="FP" style="display:none;">  
                                <td width="200" align="right">增值税金额：</td><td width="110" id="suidian"></td><td width="30"></td><td width="100"></td>
                                </tr>
                                   
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
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="115" align="center" class="font12bt">选择支付方式</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                            <%=tr_PayWay %>
                            <%--<tr class="orderxx">
                              <td width="3%" height="67" align="left" valign="middle">
                                <input name="payway" type="radio" value="线下汇款" onclick="change();"/></td>
                              <td colspan="4">&nbsp;&nbsp;线下汇款</td>
                              <td width="75%"><%=sb_xianxia%></td>
                            </tr>--%>
                            <tr class="orderxx">
                              <td width="29" height="67" align="left" valign="middle">
                                <input name="payway" type="radio" value="网银直接支付" id="wangyin" onclick="showbank();" />
                              </td>
                              <td colspan="4" align="left">&nbsp;&nbsp;网银支付</td>
                              <td width="75%">由支付提供接口，确保您的资金安全。</td>
                            </tr>
                          </table>
                          <script type="text/javascript">
                            function showbank() {
                                if ($("#wangyin").attr("checked") == "checked") {
                                  $("#showbank").show();
                                  $("#input_payway").val("网银支付");                                  
                              }
                              else {
                                $("#showbank").hide();
                              }
                            }                   
                    
                          </script>
                          <table width="95%" id="showbank" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto; display: none;">
                            <tr>
                              <td height="36">
                                <table width="644" height="234">
                                  <tr style="height: 10px;">
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="radio" name="pay_bank" value="2" onclick="changeimg('ICBC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/ICBC_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="3" onclick="changeimg('CMB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/CMB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="4" onclick="changeimg('CCB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/CCB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="5" onclick="changeimg('BOC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/BOC_OUT.gif" border="0" /> </td>
                                  </tr>
                                  <tr style="height: 10px;">
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="radio" name="pay_bank" value="6" onclick="changeimg('ABC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/ABC_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="7" onclick="changeimg('COMM_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/COMM_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="8" onclick="changeimg('SPDB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/SPDB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="9" onclick="changeimg('GDB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/GDB_OUT.gif" border="0" /> </td>
                                  </tr>
                                  <tr style="height: 10px;">
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="radio" name="pay_bank" value="10" onclick="changeimg('CITIC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/CITIC_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="11" onclick="changeimg('CEB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/CEB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="12" onclick="changeimg('CIB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/CIB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="24" onclick="changeimg('FDB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/FDB_OUT.gif" border="0" />
                                      <%--<input type="radio" name="pay_bank" value="13" onclick="changeimg('SDB_OUT')" />&nbsp;<img
                                                                src="alipay/images/SDB_OUT.gif" border="0" />--%>
                                    </td>
                                  </tr>
                                  <tr style="height: 10px;">
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="radio" name="pay_bank" value="14" onclick="changeimg('CMBC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/CMBC_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="15" onclick="changeimg('HZCB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/HZCB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="16" onclick="changeimg('SHBANK_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/SHBANK_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="17" onclick="changeimg('NBBANK_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/NBBANK_OUT.gif" border="0" /> </td>
                                  </tr>
                                  <tr style="height: 10px;">
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="radio" name="pay_bank" value="18" onclick="changeimg('SPABANK_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/SPABANK_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="19" onclick="changeimg('BJRCB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/BJRCB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="20" onclick="changeimg('ENV_ICBC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/ENV_ICBC_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="21" onclick="changeimg('ENV_CCB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/ENV_CCB_OUT.gif" border="0" /> </td>
                                  </tr>
                                  <tr style="height: 10px;">
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="radio" name="pay_bank" value="22" onclick="changeimg('ENV_SPDB_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/ENV_SPDB_OUT.gif" border="0" /> </td>
                                    <td>
                                      <input type="radio" name="pay_bank" value="23" onclick="changeimg('ENV_ABC_OUT');checkpay(0);" />&nbsp;<img src="alipay/images/ENV_ABC_OUT.gif" border="0" /> </td>
                                    <td></td>
                                    <td></td>
                                  </tr>
                                  <tr align="center">
                                    <td height="18" colspan="4"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>

                             <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">                          
                            <tr class="orderxx">
                              <td width="29" height="67" align="left" valign="middle">
                                <input name="payway" type="radio" value="线下汇款" id="xianxia" onclick="change();"/></td>
                              <td colspan="4" align="left">线下汇款</td>
                              <td width="75%"> 
                             
                                 <table id="tpay1" width='100%' border='0' cellspacing='1' cellpadding='0' style="background-color:#CCC;">
                                <tr>
                                    <td width='38%' height='28' align='center' bgcolor='#FFFFFF'><strong>开户行</strong></td>
                                    <td width='30%' align='center' bgcolor='#FFFFFF'><strong>户名</strong></td>
                                    <td width='32%' align='center' bgcolor='#FFFFFF'><strong>卡号</strong></td> </tr>
                                <asp:Repeater ID="Rpt_BankList" runat="server">
                                <ItemTemplate>
                                <tr class="<%#Convert.ToInt32(Eval("i_FaPiao"))==1?"fp_true":"fp_false"%>" >
                                    <td height='28' align='center' bgcolor='#FFFFFF'><%#Eval("nvc_BankDetails")%></td>
                                    <td align='center' bgcolor='#FFFFFF'><%#Eval("nvc_AccountName")%></td>
                                    <td align='center' bgcolor='#FFFFFF'><%#Eval("nvc_BankNumber")%></td>
                                </tr>                                
                                </ItemTemplate>
                                </asp:Repeater>
                              
                              
                              </table>
                           </td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                            <tr class="orderxx">
                             <td>&nbsp;</td> 
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="41" align="right">
                        <table>
                        <tr>
                        <td width="100px">
                            
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/user_zl_b5.gif" OnClick="ImageButton1_Click" OnClientClick="return checkfapiao();" border="0" Width="85px" Height="29px" />
                        </td>
                            <td width="100px">
                            
                          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/user_order_quxiao.gif" OnClick="ImageButton2_Click" OnClientClick="return confirm('确定要取消订单吗？');" border="0" Width="85px" Height="29px" /></td>
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
  <uc4:zscqfoot ID="zscqfoot1" runat="server" />
  <div runat="server" id="div_a">
     <input type="hidden" runat="server" id="hi_feeinfo" value="0" />
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
   
  $(document).ready(function () {
   // $("#checkfp").attr("checked", "")
      //    $("#checkyj").attr("checked", "")
      $(".fp_true").hide();
      $(".fp_false").show();

    $(".tr_fp1").hide();
    $(".tr_fp4").hide();
    $(".tr_fp3").hide();   
});
var isfacheck = false;
var isnofacheck = false;
function fpshow() {
    debugger;
      var allmoney = $("#allmoney").html();
      var ganfeezhinajin = $("#hi_GanfeeZhinajin").val();
      var youhui = $("#hi_youhui").val();  
      if ($("#checkfp").attr("checked") == "checked") {
          if (!isfacheck) {
              //=========银行显示 
              $(".fp_true").show();
              $(".fp_false").hide();
              $(".tr_fp1").show();
              $(".FP").show();
              var youji = $("#hi_youji").val();                         
              var sui = parseFloat(parseFloat(ganfeezhinajin) * 0.033).toFixed(2);
              $("#hi_fapiao").val(sui);
              $("#suidian").html(parseFloat(sui).toFixed(2));
              var nowmoney = (parseFloat(allmoney) + parseFloat(sui)).toFixed(2);
              $("#allmoney").html(nowmoney);
              $("#hi_allmy").val(nowmoney);
               yjshow();
              isfacheck = true;
              isnofacheck = false;
          }
      //alert(nowmoney);
    }
      else {
          if (!isnofacheck) {
          //=========银行显示
              $(".fp_true").hide();
              $(".fp_false").show();
              $(".tr_fp").hide();
              $("#shuidian").hide();
              $(".FP").hide();
              var sui = $("#hi_fapiao").val();             
              $("#hi_fapiao").val("0");
              var nowmoney = (parseFloat(allmoney) - parseFloat(sui)).toFixed(2);
              $("#allmoney").html(nowmoney);
              $("#hi_allmy").val(nowmoney);            
              yjshow();
              isfacheck = false;
              isnofacheck = true;
          }
    }
  }
  function yjshow() {
      if ($("#checkfp").attr("checked") == "checked") {
          var allmoney = $("#allmoney").html();
          var guowaiyouji = $("#hi_guowaifee").val(); //国外邮寄费用
          var hui = $("#hi_hui").val();
          if ($("#hi_guoji").val() != 1) {//国外              
              $(".tr_fp3").show();
              $(".YJ").show();
              $("#youji").html( guowaiyouji + "");
              $("#hi_youji").val(guowaiyouji);
              var nowmoney = (parseFloat(allmoney) + parseFloat(guowaiyouji)) / parseFloat(hui);
              $("#allmonymei").html(nowmoney.toFixed(2));
              $("#allmoney").html(parseFloat(allmoney) + parseFloat(guowaiyouji));
              $("#hi_allmy").val(parseFloat(allmoney) + parseFloat(guowaiyouji));
              $("#hi_allmymei").val(nowmoney.toFixed(2));
          }
          else {
              $(".tr_fp4").show();
              kuaidicheck();
          }
      }
      else {
          $(".tr_fp3").hide();
          $(".tr_fp4").hide();
          var allmoney = $("#allmoney").html();
          var guowaiyouji = $("#hi_guowaifee").val(); //国外邮寄费用
          var hui = $("#hi_hui").val();
          $(".YJ").hide();
          if ($("#hi_guoji").val() != 1) {
              var nowmoney = (parseFloat(allmoney) - parseFloat(guowaiyouji)) / parseFloat(hui);
              // alert(nowmoney);
              $("#allmonymei").html(nowmoney.toFixed(2));
              $("#allmoney").html(parseFloat(allmoney) - parseFloat(guowaiyouji));
              $("#hi_allmy").val(parseFloat(allmoney) - parseFloat(guowaiyouji));
              $("#hi_allmymei").val(nowmoney.toFixed(2));
          }
          else {
              kuaidijian();
          }
      }
}
  var checknum=-1;
  function kuaidicheck() {
      var allmoney = $("#allmoney").html();
     // var ganfeezhinajin = $("#hi_GanfeeZhinajin").val();
      var youhui = $("#hi_youhui").val();     
      var ways = document.getElementsByName('way');
      for (var i = 0; i < ways.length; i++) {
          if (ways[i].checked) {
              if (checknum != i) {
                  checknum = i;
                  var psfs = ways[i].value.split(',')[0];
                  var psje = ways[i].value.split(',')[1];
                 // var sui = parseFloat((parseFloat(ganfeezhinajin))).toFixed(2);
                  var youhuisui = parseFloat(parseFloat(youhui)).toFixed(2);               
                  if ($("#input_Way").val() != "0") {
                      allmoney = (parseFloat(allmoney) - parseFloat($("#input_Way").val()));// + parseFloat(parseFloat(sui));
                  }                
                  $("#lb_Way").val(psfs);
                  $("#input_Way").val(psje);
                  $(".YJ").show();
                  // alert(psje);             
                  $("#hi_youji").val(psje);
                
//                  var suiyouji = parseFloat((parseFloat(psje))).toFixed(2);
//                  var zongsui = parseFloat(parseFloat(sui)+parseFloat(suiyouji) - parseFloat(parseFloat(youhui))).toFixed(2);
                   
                
                  $("#youji").html( psje + "");
                  $("#allmoney").html(parseFloat(parseFloat(allmoney) + parseFloat(psje)).toFixed(2));
                  $("#hi_allmy").val(parseFloat(parseFloat(allmoney) + parseFloat(psje)).toFixed(2));
              }
          }
      }
  }
  function kuaidijian() {
      var allmoney = $("#allmoney").html();
      // if ($("#radio2").attr("checked") == "checked") {
      var ways = document.getElementsByName('way');
      for (var i = 0; i < ways.length; i++) {
          if (ways[i].checked) {
              var psfs = ways[i].value.split(',')[0];
              var psje = ways[i].value.split(',')[1];
              $("#lb_Way").val(psfs);
              $("#input_Way").val("0");
              $("#hi_youji").val("0")
              $("#hi_fapiao").val("0");             
              $(".YJ").hide();             
              $("#allmoney").html(parseFloat(parseFloat(allmoney) - parseFloat(psje)).toFixed(2));
              $("#hi_allmy").val(parseFloat(parseFloat(allmoney) - parseFloat(psje)).toFixed(2));
              $("#input_Way").val("0");
          }
      }
      for (var j = 0; j < ways.length; j++) {
          ways[j].checked = false;      
      }
  }
  function okway() {
      var ways = document.getElementsByName('way');
      for (var i = 0; i < ways.length; i++) {
          if (ways[i].checked) {
              var psfs = ways[i].value.split(',')[0];
              var psje = ways[i].value.split(',')[1];
              $("#lb_Way").val(psfs);
              $("#input_Way").val(psje);
          }
      }
  }
  function change() {
      var pays = document.getElementsByName('payway');
      for (var i = 0; i < pays.length - 1; i++) {        
          if (pays[i].checked) {               
              obj('input_payway').value = pays[i].value.split(',')[0];
          }
      }
      if (document.getElementById("xianxia").checked) {
          obj('input_payway').value = "线下汇款";
          //obj("tpay1").style.display = "block";
      }
      else {
          //obj("tpay1").style.display = "none";   
      }
      var pays2 = objs('pay_bank');
      for (var j = 0; j < pays2.length; j++) {
          pays2[j].checked = false;
      }
      showbank();
  }
  function obj(id) {
    return document.getElementById(id);
  }
  function objs(name) {
    return document.getElementsByName(name);
  }
  function checkpay(ytype) {
 //  document.getElementById('pay1').style.display = "";
   //document.getElementById('pay0').style.display = "";
    document.getElementById('pay' + ytype).style.display = "none";
  }
  function changeimg(img) {
      var pays = objs('pay_bank');
      for (var i = 0; i < pays.length; i++) {
          if (pays[i].checked) {
              obj('bank').value = pays[i].value;
          }
      }
      var pays2 = objs('payway');
      for (var j = 0; j < pays2.length-1; j++) {
          pays2[j].checked = false;
      }
      
      $("#wangyin").attr("checked","checked") ;
      showbank();
  }
  function checkfapiao() {
      $(".hidesbinfo").html("");
      $("#hi_feeinfo").val($("#trademarkinfo").html()+"<br/><br/>"+$("#FeeInfo").html());
     // alert($("#hi_feeinfo").val());
      if ($("#checkfp").attr("checked") == "checked") {
          if ($("#txt_fptt").val() == "") {
              alert("请填写发票抬头！");
              $("#txt_fptt").focus();
              return false;
          }
          else if ($("#zscqaddress_Hi_AddressId").val() == 0) {
              alert("请选择默认票据地址！");
              return false;
          }
          var ways = document.getElementsByName('way');
          var numyj = 0;
          for (var i = 0; i < ways.length; i++) {
              if (ways[i].checked) {
                  numyj++;
              }
          }
          if (numyj == 0) {
              alert("请选择邮寄方式！");
              return false;
          }
      }
      var pays = document.getElementsByName('payway');
      var paynum = 0,banknum=0;
      for (var i = 0; i < pays.length; i++) {
          if (pays[i].checked) {
              paynum++;
          }
      }
      var banks = objs('pay_bank');
      for (var i = 0; i < banks.length; i++) {
          if (banks[i].checked) {
              banknum++;
          }
      }
      if (paynum == 0) {
          alert("请选择支付方式！");
          return false;
      }
      else {
          if ($("#input_payway").val() == "网银支付") {
              if (banknum == 0) {
                  alert("请选择支付银行！");
                  return false;
              }
          }
      }
  }

 
                    
</script>
