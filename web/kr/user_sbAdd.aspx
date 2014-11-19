<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbAdd.aspx.cs" Inherits="user_sbupdate" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>상표정보 검색_나의 상표_서비스 센터_상표시시템_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="HQHT 연차료관리 전자상거래 플랫폼" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />
<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
     <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script src="js/tooltips.js" type="text/javascript"></script>
</head>
<body id="index" onload="miaoshutype();">
  <form id="form1" runat="server">
    <input type="hidden" id="Hi_MemberId" runat="server" value="" />
  <input id="hi_guoji" type="hidden" runat="server" value="0"/>
  <input id="hi_usertype" type="hidden" runat="server" />
  <input id="hi_zhitifiles" type="hidden" runat="server" />
  <input id="hi_sbid" type="hidden" runat="server" value="0"/> 
   <input id="hi_sbzlok" type="hidden" runat="server" value="0"/>
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="96" runat="server" />
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
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
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;&gt;&gt;&nbsp;회원센터&nbsp;&gt;&gt;&nbsp;서비스 센터&nbsp;&gt;&gt;&nbsp;나의 상표&nbsp;&gt;&gt;&nbsp;상표 정보 입력</td>
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
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="center" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">기본정보</td>
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
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right"><strong>상표 출원번호：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s5" id="sb_num" class="font12000 tooltip" onkeyup="this.value=this.value.replace(/\D/g,'')" tips="수자와 영어문자만 입력해주세요" maxlength="20" runat="server" onblur="CheckUserSbregnum('0');"/> <span style="color: Red;" id="sb_num1">*</span><span ></span></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>상표 류형：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s5" id="Sb_type" class="font12000 tooltip" tips="상표 등록 증명서의 내용과 일치주세요" maxlength="20" runat="server" onblur="checkOk('Sb_type');" />
                                      <span style="color: Red;" id="Sb_type1">*</span><span ></span></td>
                                  </tr><%if (usertype != 3)
                                         { %>
                                 <tr>
                                    <td height="32" align="right"><strong>자료중의 정버를  쓰시겠습니까：</strong></td>
                                    <td align="left">
                                        <input id="cb_user" type="checkbox" onclick="Usercheck();" /><span style="color: Red;">&nbsp;자료정보와 상표증서안의 정보가 일치하지않으면  선택하지말아주세요</span>
                                     </td> </tr>
                                     <%}%>
                                    
                                  <tr>
                                    <td height="32" align="right"><strong>출원인<%if (usertype == 3)
                                                                      { %>(중국어)<%} %>：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s6" runat="server" id="Sb_Regname" onblur="checkOk('Sb_Regname');Checksbzhenshu(0);" class="font12000 tooltip" tips="상표 등록 증명서의 내용과 일치주세요" maxlength="50" />
                                      <span style="color: Red;" id="Sb_Regname1"></span><span ></span></td> </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>출원인(영어)：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s6" id="Sb_RegnameEn" onblur="checkOk('Sb_RegnameEn');" class="font12000 tooltip" maxlength="20" runat="server" onkeyup="value=value.replace(/[^a-zA-Z ]/g,'')"  /><span style="color: Red;" id="Sb_RegnameEn1">*</span><span ></span></td>
                                  </tr>
                                  <%} %>
                                  <tr>
                                    <td height="46" align="right"><strong>출원인 주소 <%if (usertype == 3)
                                                                      { %>(중국어)<%} %>：</strong></td>
                                    <td align="left">
                                    <textarea cols="20" rows="2" type="text" name="s6" id="Sb_Reg_Address" style="width: 300px;height:40px;"  onblur="checkOk('Sb_Reg_Address');"  class="font12000 tooltip" tips="상표 등록 증명서의 내용과 일치주세요" maxlength="250" runat="server" ></textarea><span style="color: Red;" id="Sb_Reg_Address1"></span><span ></span></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>등록자 코드：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s6" id="Sb_Reg_youbian" onblur="checkOk('Sb_Reg_youbian');"  class="font12000 tooltip" maxlength="10" runat="server" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/><span style="color: Red;" id="Sb_Reg_youbian1"></span><span ></span></td>
                                </tr>
                                   <%if (guoji == 0 && usertype == 3)
                                    { %> <tr>
                                    <td height="46" align="right"><strong>출원인 주소(영어) ：</strong></td>
                                    <td align="left">
                                     <textarea rows="2" name="s6" id="Sb_Reg_AddressEn"  onblur="checkOk('Sb_Reg_AddressEn');" onkeyup="value=value.replace(/[^a-zA-Z ]/g,'')" style="width: 300px;height:40px;" class="font12000" maxlength="150" runat="server"></textarea><span style="color: Red;" id="Sb_Reg_AddressEn1">*</span><span ></span></td>
                                  </tr>
                                 <%} %>
                                  
                                  
                                    <tr>
                        <td height="32" align="right"><strong>출원일：</strong></td>
                        <td align="left">        <input type="text" name="s6" runat="server" id="Sb_passTime" onblur="checkOk('Sb_passTime');"  class="font12000 tooltip" maxlength="50" style="background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});daoqidate();"  tips="상표 등록 증명서의 내용과 일치주세요" /><span style="color: Red;" id="Sb_passTime1">*</span><span ></span></td>
                        </tr>   <tr>
                        <td height="32" align="right"><strong>상표 납부기한일：</strong></td>
                        <td align="left">  <input id="t_daoqi" type="text"  runat="server" class="font12000" readonly="readonly"/></td>
                        </tr>
                          <tr>
                    <td height="32" align="right"><strong>상표표시 류형：</strong></td>
                    <td>    <%-- <input name="radio" type="radio" id="radio1" value="radio" checked="true" onchange="miaoshutype();" runat="server" /> 文字商标
                     <input name="radio" type="radio" id="radio2" value="radio"  onchange="miaoshutype();" runat="server" /> 도형상표
                      <input name="radio" type="radio" id="radio3" value="radio"  onchange="miaoshutype();" runat="server" /> 문자와 도형상표  --%>  
                       <asp:RadioButton ID="RadioButton1" runat="server" onclick="miaoshutype();" GroupName="aa" Checked="true"/>문자 상표 &nbsp;<asp:RadioButton ID="RadioButton2"
                            runat="server" GroupName="aa" onclick="miaoshutype();" />도형상표&nbsp;<asp:RadioButton ID="RadioButton3" runat="server" GroupName="aa" onclick="miaoshutype();" />문자와 도형상표                  
                    </td>
                </tr>
                           <tr id="sbmiaoshu">
                                    <td height="32" align="right"><strong>상표표시：</strong></td>
                                    <td align="left" style="text-li:left;">
                                      
                                        <input type="text" name="s6" id="Sb_miaosu" class="font12000" maxlength="50" runat="server" onblur="checkOk('Sb_miaosu');"  value="신청한 상표문자 를 적으주세요" onClick="value='';focus()" style="width:300px;"/> <span style="color: Red;" id="Sb_miaosu1">*</span></td>
                                  </tr>
                                </table>
                             
                              </td>
                            </tr>
                            <tr>
                              <td height="30" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">납부정보</td>
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
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                               
                                     <tr id="dailifei">                                   
                                    <td height="32" align="right" >상표 수수료의 공식 웹 사이트：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                   CNY&nbsp;<%=Str_Moneysb%>                                    
                                    </span></td>                                  
                                    </tr>
                                     <tr>
                                    <td height="32" align="right" >상표 에이전트 수수료：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                   CNY&nbsp;<%=sbdailiweituo%>                                    
                                    </span></td>                                  
                                    </tr> 
                                     
                                      <tr>
                                    <td align="right" height="32">합계：</td><td><span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=zongjiweituo%>                                    
                                    </span></td>                                    
                                    </tr>
                                    <tr>
                                    <td height="5"></td><td></td>
                                    </tr>
                                     <%if (guoji == 0)
                                       { %>                                     
                                      <tr>
                                    <td width="260" align="right" height="32">외국 비용 합계：</td><td><span class="font12b4e user_zlbottomline" style="color:Red;">
                                 <%=bizhong %>&nbsp;<%=zongjimeiweituo%>
                                    </span></td>                                    
                                    </tr>                                     
                                    <%} %>                                     
                                         <%--<tr>
                                    <td height="32" align="right">외화종류：</td>
                                    <td width="429" align="left"><span class="font12b4e user_zlbottomline" style="color:Red;">
                                      
                                    </span></td>
                                  </tr>  --%>
                                    
                                 
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                                  <%if (usertype == 3)
                            { %>                          
                          <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">제삼방 정보</td>
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
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>안건번호</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="t_anjuanhao" class="font12000" maxlength="50"  onblur="checkanjuanhao();"  onkeyup="value=value.replace(/[^\w]/ig,'')" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>련락처</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_linkman" class="font12000" maxlength="20" />
                                    </td>
                                  </tr>
                                
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>전화</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                                    </td>
                                  </tr>
                                    <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>주소</strong>：</td>
                                    <td width="429" valign="middle">                                
                                        <textarea cols="20" rows="2" type="text" name="s6" id="txt_address" style="width: 300px;height:40px;"  class="font12000" maxlength="250" runat="server" ></textarea>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <%} %>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">파일 업로드</td>
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
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                               <%if(zhutifileIsOk==1&&usertype!=3){ %>
<tr id="zhitiOk">
                                    <td style="height:50px;width:260px;"  align="right">
                               <strong><%if(usertype==1){ %>주민등록증, 여권등 신분을 증명할수있는 증명서류<%}
							    else if(usertype!=1){ %>사업자등록증 등 신분을 증명할수있는 증명서류<%} %>：</strong>
                              </td>
                               <td ><%=zhutiwenjian %></td></tr>
                               <%} %>  <%if (usertype==3)
                                  { %>
                               <tr id="zhutifile" runat="server">
                                    <td style="height:50px; width:260px;" align="right">
                               <strong> 사업자등록증 등 신분을 증명할수있는 증명서류：</strong>
                              </td>
                               <td ><asp:FileUpload ID="FileUpload3" runat="server" Width="200px"/><div id="sb_namenum1"><span style="color:Red;">형식. Jpg.gif.png.PDF, 더 못하는 것보다 500K</span></div> </td>  
                                  </tr>
                                  <%} %>                                 
                                   <tr>
                                    <td style="height:50px;width:260px;" align="right">
                               <strong> 상표증서 복사건：</strong>
                              </td>
                               <td ><asp:FileUpload ID="FileUpload4" runat="server" Width="200px"/><br><span style="color:Red;">형식. Jpg.gif.png.PDF, 더 못하는 것보다 500K</span> </td>   
                                  </tr>
                                  </table>
                                  </td>
                                  </tr>
                                  </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                          
                         
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">    
                                  <tr>
                                    <td height="32" align="right">&nbsp;</td>
                                    <td align="left">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right">&nbsp;</td>
                                    <td align="left" valign="top">
                                      <table width="389" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="100" height="35" ></td>
                                          <td width="95" align="right">
                                            <asp:Button ID="Button1" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_zl_b5.gif); width: 85px; height: 29px;" OnClick="Button1_Click" OnClientClick="return Checkadd();" /></td>
                                          <td width="108" align="right">
                                            <%--<input id="Reset1" type="reset" value="" style="border: 0; cursor: pointer; background: url(images/user_js_b2.gif); width: 86px; height: 27px;" />
                                            <img src="images/user_js_b2.gif" width="86" height="27" />--%></td>
                                        
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
  <div id="div_a" runat="server">
  </div>  
      <script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
  <script src="js/CheckTrademark.js" type="text/javascript"></script> 
  <script type="text/javascript">
      $(function () {         
          if ($("#hi_sbzlok").val() == "0") {
              alert("자료 저주하지않으니 완선해주세요！");
              location.href = "user_sbzl.aspx";
          }
      });
      function daoqidate() {
          var datedaoqi = document.getElementById("Sb_passTime").value;        
          if (datedaoqi!= "") {
              $.ajax({
                  type: "POST",
                  url: "Sb_Handler.ashx",
                  contentType: "application/x-www-form-urlencoded; charset=utf-8",
                  data: "sbdaoqi=" + datedaoqi,
                  success: function (msg) {                      
                      if (msg != "no") {
                          document.getElementById("t_daoqi").value = msg;
                      }
                  }
              });
          }
      }

    
      function miaoshutype() {
          var rb1 = document.getElementById("RadioButton1");
          var rb2 = document.getElementById("RadioButton2");
          var rb3 = document.getElementById("RadioButton3");
          if (rb1.checked) {
              $("#Sb_miaosu").val("신청한 상표문자 를 적으주세요");
              $("#Sb_miaosu").disabled = false;
              $("#sbmiaoshu").show();
          }
          if (rb2.checked) {
              $("#sbmiaoshu").hide();
              $("#Sb_miaosu").val("");
          }
          if (rb3.checked) {
              $("#Sb_miaosu").val("신청한 상표문자 를 적으주세요");
              $("#Sb_miaosu").disabled = false;
              $("#sbmiaoshu").show();
          }
      }



  </script>
   <script type="text/javascript">
       function ClientValidatePhone() {
           var id = $("#Hi_MemberId").val();
           var lname = $("#c_Phone").val();
           var rand = Math.floor(Math.random() * 1000000);
           if (lname != "") {
               $.ajax({
                   type: "post",
                   async: false,
                   url: "Handler.ashx",
                   contentType: "application/x-www-form-urlencoded; charset=utf-8",
                   data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
                   success: function (msg) {
                       if (msg == "1") {
                           alert("该手机号码已注册！");
                           $("#c_Phone").focus();
                       }
                       else {
                           $("#c_Phone1").html("<img  src='images/tOk.gif' />");
                       }
                   }
               });
           }
           else {
               $("#c_Phone1").html("<img  src='images/tError.gif' />");
           }
       }
     

       function Jiaofei() {
           if ($("#dd_jiaofeitype").val() == "1") {
               $("#dailifei").hide();
               $("#nodaili").show();
               $("#weituo").hide();
           }
           if ($("#dd_jiaofeitype").val() == "2") {
               $("#dailifei").show();
               $("#nodaili").hide();
               $("#weituo").show();
           }
       }
       function checkOk(obj) {
           if ($("#" + obj).val()!= "") {
               $("#" + obj + "1").html("<img  src='images/tOk.gif' />");
           }
           else {
               $("#" + obj + "1").html("<img  src='images/tError.gif' />");
           }
       }
       function Usercheck() {
           if ($("#cb_user").attr("checked") == "checked") {
               var u_mid = $("#Hi_MemberId").val();
               $.ajax({
                   type: "POST",
                   url: "../Shop_Manage/Shop_A_Trademark.ashx",
                   contentType: "application/x-www-form-urlencoded; charset=utf-8",
                   data: "memberId=" + u_mid,
                   success: function (msg) {
                       if (msg == "no") {
                           alert("회원정보가  저조합니다！");
                       }
                       else {
                           $("#Sb_Regname ").val(msg.split('_')[0]);
                           $("#Sb_Reg_Address").val(msg.split('_')[1]); 
                           $("#Sb_Reg_youbian").val(msg.split('_')[2]);
                       }
                   }
               });
           }
           else {
               $("#Sb_Regname ").val("");
               $("#Sb_Reg_youbian").val("");
               $("#Sb_Reg_Address").val("");
           }
       }
    </script>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
   
</body>
</html>
