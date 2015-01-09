<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademarkOrderOk.aspx.cs" Inherits="trademarkOrderOk" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>成功提交订单_我的商标订单_服务中心_商标系统_环球汇通</title>
<meta name="Keywords" content="环球汇通"/>
<meta name="Description" content="环球汇通知识产权代缴年费电子商务平台"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <link href="css/downBill.css" rel="stylesheet" type="text/css" />
</head>
<body id="index">
    <form id="form1" runat="server">
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
 <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;background-color: #fff;">
  <tr>
    <td width="260" height="618" align="left" valign="top"style="background-image: url(images/server2.gif);">
       <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" /></td>
    <td align="left" valign="top"><table width="741" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);"><table width="739" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38" height="28">&nbsp;</td>
            <td width="701">&nbsp;</td>
            </tr>
          <tr>
            <td height="19">&nbsp;</td>
            <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;商标系统&nbsp;>>&nbsp;服务中心&nbsp;>>&nbsp;我的商标订单&nbsp;&gt;&gt;&nbsp;成功提交订单 </td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="639" valign="top"><table width="716" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="28">&nbsp;</td>
            <td width="691">&nbsp;</td>
          </tr>
          <tr>
            <td height="123">&nbsp;</td>
            <td width="691" align="left" valign="top"><table width="689" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="107" align="left" valign="top"><table width="687" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="132" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="115" align="center" class="font12bt">成功提交订单</td>
                        <td width="7"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="left"></td>
                  </tr>
                </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle"><span class="ordertext">您的订单号：<span><%=OrderNum %></span>
                      &nbsp;&nbsp;&nbsp;&nbsp;应付金额：<span class="font12ac5">CNY <%=all_money %></span>
                      <%if (guoji == 0)
                        { %>
                      &nbsp;&nbsp;&nbsp;&nbsp;国外应付金额：<span class="font12ac5"><%=bizhong%> <%=all_moneymei%></span>
                      <%} %>
                      &nbsp;&nbsp;&nbsp;&nbsp;支付方式：<span><%=payway %></span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle">会员号：<%=UserNum %>&nbsp;&nbsp;提交人：<%=UserName %></td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle">提交时间：<%=dt_addtime %>&nbsp;&nbsp;订单状态：<%=OrderState %></td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle">友情提示：<span class="ordertext">24小时未接收到汇款的，订单自动失效</span></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="right" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="center" class="font12b4e">
                <table><tr><td> <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/images/user_zl_b6.gif" onclick="ImageButton1_Click"  />    
                        </td>
                        <td> &nbsp;&nbsp;<a href="trademarkOrder_Info.aspx?order=<%=sbOrderId%>&tIds=<%=tIds %>">
                            <img src="images/user_zl_b7.gif" width="85" height="29" border="0" />
                           </a></td>
                <td style="width:80px"><a style="display:none" href="user_sblb.aspx"><img src="images/user_zl_b8.gif" width="85" height="29" border="0" /></a>
                </td>
                <td > 
                 <ul id="nav">
                <li><a href="javascript:void(0)">下载帐单<span>&nbsp;</span></a>
                <ul>
                        <li>
                            <a href="#" id="downAll" target="_blank">下载总帐单</a>
                        </li>
        
                        <li>
                            <a href="#" id="downDetail" target="_blank">下载分帐单</a>
                        </li>
                </ul>
                </li>
                </ul>
                </td></tr></table>               
                </td>

              </tr>
              <tr>
                <td align="left">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="687" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="132" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="115" align="center" class="font12bt">付款注意事项</td>
                        <td width="7"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="left"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="left" valign="top" style="line-height:21px;word-break:break-all;word-wrap:break-word;">
                <asp:Literal ID="Ltl_ZhuYi" runat="server"></asp:Literal>
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
    <div runat="server" id="div_a"></div>
    </form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $("#checkfp").attr("checked", "")
        $("#checkyj").attr("checked", "")
        $(".tr_fp").hide();
        menuFix();
        var orderNo = getUrlParam("orderNo");
        if (orderNo != null && orderNo != "") {
            $("#downAll").attr("href", "File_Zscq/AccountPDF/TotalBill" + orderNo + ".pdf");
            $("#downDetail").attr("href", "File_Zscq/AccountPDF/SeparateBill" + orderNo + ".pdf");
        }
    });
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }
    function menuFix() {
        var sfEls = document.getElementById("nav").getElementsByTagName("li");
        for (var i = 0; i < sfEls.length; i++) {
            sfEls[i].onmouseover = function () {
                this.className += (this.className.length > 0 ? " " : "") + "sfhover";
            }
            sfEls[i].onMouseDown = function () {
                this.className += (this.className.length > 0 ? " " : "") + "sfhover";
            }
            sfEls[i].onMouseUp = function () {
                this.className += (this.className.length > 0 ? " " : "") + "sfhover";
            }
            sfEls[i].onmouseout = function () {
                this.className = this.className.replace(new RegExp("( ?|^)sfhover\\b"),"");
            }
        }
    }

    function fpshow() {
        if ($("#checkfp").attr("checked") == true) {
            $(".tr_fp1").show();
            $(".tr_fp2").show();
        }
        else {
            $(".tr_fp").hide();
            $("#checkyj").attr("checked", "")
        }
    }
    function yjshow() {
        if ($("#checkyj").attr("checked") == true) {
            $.ajax({
                type: "POST",
                url: "Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=guoji",
                success: function (msg) {
                    if (msg == "true") {
                        $(".tr_fp3").show();
                    }
                    else {
                        $(".tr_fp4").show();
                    }
                }
            });
        }
        else {
            $.ajax({
                type: "POST",
                url: "Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=guoji",
                success: function (msg) {
                    if (msg == "true") {
                        $(".tr_fp3").hide();
                    }
                    else {
                        $(".tr_fp4").hide();
                    }
                }
            });
        }
    }
</script>
 