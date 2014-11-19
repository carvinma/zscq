<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_TrademarkOrderOk.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Order submitted successfully_My Trademark Order_Service Center_System of Trademark Maintenance_Global Patent</title>
<meta name="Keywords" content="Global Patent"/>
<meta name="Description" content="Global patent Intellectual property annuity fee e-commerce platform"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <style type="text/css">
        .style1
        {
            width: 25px;
        }
    </style>
</head>
<body id="index" onload="showfile();">
    <form id="form1" runat="server">
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
 <uc3:zscqadv ID="zscqadv1" TypeId="68" runat="server" />

 <div id="divbg" class="divbg">
</div>
<div id="divshowxiazai" class="divshow">
  <table width="571" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="38" align="left" valign="top" style="background-image: url(images/faq_bg1.gif);">
        <table width="700" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="662" height="38">&nbsp;</td>
            <td width="38"><a href="#"><img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidedivbox('divshowxiazai');" /></a></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="150" align="left" valign="top" style="background-image: url(images/faq_bg2.gif);">
        <table width="700" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="36">&nbsp;</td>
            <td align="center" style="line-height: 21px; font-size: 14px; font-weight: bold;color:red;">If the Chinese information of Trademark has not been filled completely, you cannot use the below generated application form normally, so please fill the relevent information completely or contact us at your convenience.</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="40" height="150">&nbsp;</td>
            <td width="615" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
           
         <iframe id="ffi" width="665" height="300" scrolling="no" frameborder="0" src="user_Xiazai.aspx?order=<%=sbOrderId%>" ></iframe>
            </td>
            <td width="45">&nbsp;</td>
          </tr>
        </table>





      </td>
    </tr>
    <tr>
      <td height="15"><img src="images/faq_bg3.gif" width="700" height="20" /></td>
    </tr>
  </table>
</div>
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
            <td align="left"><a href="index.aspx">Front page</a>&nbsp;>>&nbsp;System of Trademark&nbsp;>>&nbsp;Service Center&nbsp;>>&nbsp;My Trademark Order&nbsp;&gt;&gt;&nbsp;Order submitted successfully</td>
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
                    <td width="687" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="208" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="10" height="20">&nbsp;</td>
                        <td width="191" align="center" class="font12bt">Order submitted successfully</td>
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
                      <td height="30" align="left" valign="middle"><span class="ordertext">Your Order number：<span><%=OrderNum %></span>
                      &nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle"><span class="ordertext">Amount payable：<span class="font12ac5">CNY <%=all_money %></span>
                          <%if (guoji == 0)
                        { %>
&nbsp;&nbsp;&nbsp;&nbsp;Amount payable in foreign currency：<span class="font12ac5"><%=bizhong%> <%=all_moneymei%></span></span></td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle">User ID：<%=UserNum %>&nbsp;&nbsp;Username：<%=UserName %><span class="ordertext">
                      <%} %>
&nbsp;&nbsp;&nbsp;&nbsp;Payment methods：Offline remittance&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle">Submitted time：<%=dt_addtime %>&nbsp;&nbsp;Order status：<%=OrderState %></td>
                    </tr>
                    <tr class="orderxx">
                      <td height="30" align="left" valign="middle">Kindly note：<span class="ordertext">the order will be invalid automatically without receiving the remittance within 24 hours.</span></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="right" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="center" class="font12b4e">
                  <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="images/user_zl_b6.gif" onclick="ImageButton1_Click"  />                
                &nbsp;&nbsp;<a href="user_sbddck.aspx?order=<%=sbOrderId%>">



                <img src="images/user_zl_b7.gif" width="85" height="29" border="0" />
                </a>&nbsp;&nbsp;<a href="user_sblb.aspx"><img src="images/user_zl_b8.gif" width="145" height="29" border="0" /></a></td>
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
                        <td width="115" align="center" class="font12bt">Payment note</td>
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
    });
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
<script type="text/javascript">
    function showfile() {
        openboxBg(1);
        showdivbox('divshowxiazai');
    }
    function openboxBg(state) { //遮照打开关闭控制
        if (state == 1) {
            document.getElementById("divbg").style.display = "block";
            var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
            h = h > document.body.scrollHeight ? h : document.body.scrollHeight;
            document.getElementById("divbg").style.height = h + "px";
        }
        else {
            document.getElementById("divbg").style.display = "none";
        }
    }
    function showdivbox(id) {
        var top1 = document.documentElement.scrollTop + document.body.scrollTop;
        document.getElementById(id).style.display = "block";
        document.getElementById(id).style.left = (document.getElementById("divbg").offsetWidth - document.getElementById(id).offsetWidth) / 2 + "px";
        document.getElementById(id).style.top = top1 + 150 + "px"; //document.documentElement.scrollTop + 100 + "px";  
    }
    function hidedivbox(id) {
        document.getElementById("divbg").style.display = "none";
        document.getElementById(id).style.display = "none";
    } 
</script>