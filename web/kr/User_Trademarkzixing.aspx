<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Trademarkzixing.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscqAddress.ascx" TagName="zscqaddress" TagPrefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>자기 부담의 상표 파일 다운로드_서비스 센터_상표시시템_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="HQHT 연차료관리 전자상거래 플랫폼" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
  <style type="text/css">
    .style1 { width: 25px; }
    #allmoney{font-size:20px;color:#999;}
  </style>
</head>
<body id="index" onload="checkpay(1);">
  <form id="form1" runat="server" method="post">
  <uc1:zscqtop2 ID="zscqtop21" runat="server" />
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
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;>>&nbsp;상표시시템&nbsp;>>&nbsp;서비스 센터&nbsp;>>&nbsp;자기 부담의 상표 파일 다운로드</td>
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
                                <table width="264" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="249" align="center" class="font12bt">자기 부담의 상표 파일 다운로드</td>
                                    <td width="5"></td>
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
                                    <td width="115" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상표 출원번호</td>
                                    <td width="81" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상표 분류</td>
                                    <td width="96" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">납부유형</td>
                                    <td width="88" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">로그인 성명</td>
                                    <%--<td width="77" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">심사상태</td>--%>
                                    <td width="86" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">납부여부</td>
                                    <td width="86" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">유효기간</td>
                                    <td width="115" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">다운로드</td>
                                  </tr>
                                  <%=sb_trademrk %>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="24" align="left">&nbsp;</td>
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
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
   
  $(document).ready(function () {
   // $("#checkfp").attr("checked", "")
//    $("#checkyj").attr("checked", "")
    $(".tr_fp1").hide();
    $(".tr_fp4").hide();
    $(".tr_fp3").hide(); 
    $("#shuidian").hide(); 
    $("#youji").hide();
    $("#kuaidi").hide();
});
  var ischeck=false;
  function fpshow() {
      var allmoney = $("#allmoney").html();    
      if ($("#checkfp").attr("checked") == "checked") {
          if (!ischeck) {
              $(".tr_fp1").show();
              $("#shuidian").show();
              $(".FP").show();
              var sui = parseFloat(parseFloat(allmoney) * 0.035).toFixed(2);
              $("#hi_fapiao").val(sui);
              $("#suidian").html("RMB " + parseFloat(sui).toFixed(2));
              var nowmoney = (parseFloat(allmoney) + parseFloat(sui)).toFixed(2);
              $("#allmoney").html(nowmoney);
              $("#hi_allmy").val(nowmoney);
              yjshow();
              ischeck = true;
          }
      //alert(nowmoney);
    }
    else {
      $(".tr_fp").hide();
      $("#shuidian").hide();
      $(".FP").hide(); 
      var sui = $("#hi_fapiao").val();       
      $("#hi_fapiao").val = 0;       
      var nowmoney =(parseFloat(allmoney) -parseFloat(sui)).toFixed(2);
      $("#allmoney").html(nowmoney);
      $("#hi_allmy").val(nowmoney);
      yjshow();
      ischeck = false;
    }
  }
  function yjshow() {
      if ($("#checkfp").attr("checked") == "checked") {
          var allmoney = $("#allmoney").html();         
          var guowaiyouji = $("#hi_guowaifee").val(); //国外邮寄费用
      var hui = $("#hi_hui").val();
      if ($("#hi_guoji").val() != 1) {//国外              
          $(".tr_fp3").show();
          $("#youji").show();
          $(".YJ").show();
          $("#youji").html("RMB " + guowaiyouji + "");
          var nowmoney = (parseFloat(allmoney) + parseFloat(guowaiyouji)) / parseFloat(hui);        
          $("#allmonymei").html(nowmoney.toFixed(2));
          $("#allmoney").html(parseFloat(allmoney) + parseFloat(guowaiyouji));
          $("#hi_allmy").val(parseFloat(allmoney) + parseFloat(guowaiyouji));
          $("#hi_allmymei").val(nowmoney.toFixed(2));
      }
      else {
          $(".tr_fp4").show();
          $("#shuidian").show();
          kuaidicheck();
      }
    }
    else {
      $(".tr_fp3").hide();
      $(".tr_fp4").hide();
      var allmoney = $("#allmoney").html();
      var guowaiyouji = $("#hi_guowaifee").val();//国外邮寄费用
      var hui = $("#hi_hui").val();
      $("#youji").hide();
      $(".YJ").hide();
      $("#kuaidi").hide();
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

  function kuaidicheck() {
      var allmoney = $("#allmoney").html();
      var ways = document.getElementsByName('way');
      for (var i = 0; i < ways.length; i++) {
          if (ways[i].checked) {
              var psfs = ways[i].value.split(',')[0];
              var psje = ways[i].value.split(',')[1];
              if ($("#input_Way").val() != "0") {
                  allmoney = parseFloat(allmoney) - parseFloat($("#input_Way").val());
              }
              $("#lb_Way").val(psfs);
              $("#input_Way").val(psje);
              $("#kuaidi").show();
              $(".YJ").show();
              $("#kuaidi").html("RMB " + psje + "");
              $("#allmoney").html(parseFloat(parseFloat(allmoney) + parseFloat(psje)).toFixed(2));
              $("#hi_allmy").val(parseFloat(parseFloat(allmoney) +parseFloat(psje)).toFixed(2));
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
              $("#input_Way").val(psje);
              $("#kuaidi").hide();
              $(".YJ").hide();
              $("#allmoney").html(parseFloat(parseFloat(allmoney) - parseFloat(psje)).toFixed(2));
              $("#hi_allmy").val(parseFloat(parseFloat(allmoney) - parseFloat(psje)).toFixed(2));
              $("#input_Way").val("0");
          }
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
