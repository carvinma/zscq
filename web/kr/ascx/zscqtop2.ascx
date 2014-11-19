<%@ Control Language="C#" AutoEventWireup="true" CodeFile="zscqtop2.ascx.cs" Inherits="ascx_zscqtop2" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto; height: 112px;">
  <tr>
    <td height="109" valign="top" align="center">
      <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
          <td height="51" align="left" valign="top">
            <table width="1001" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="675" height="52" align="left" valign="top">&nbsp; </td>
                <td width="326" align="left" valign="top">
                  <table width="326" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" colspan="7"></td>
                    </tr>
                    <tr>
                      <td width="184" height="19" align="left" valign="top" style="background-image: url(images/search.gif);">
                        <table width="180" border="0" align="right" cellpadding="0" cellspacing="0" height="19">
                          <tr>
                            <td width="152" height="19">
                              <input type="text" name="skeywords" id="skeywords" value="<%=Keywords %>" style="height: 13px; width: 152px; font-size: 12px; border: 1px solid #fff; outline: 0 none;" maxlength="30" onkeyup="if(event.keyCode==13){searchOk(); }" /></td>
                            <td width="24" align="left" height="19"><img src="images/search1.gif" width="23" height="17" style="cursor: pointer;" onclick="searchOk();" title="홈에서 검색" /></td>
                          </tr>
                        </table>
                      </td>
                      <td width="6"></td>
                      <td width="32" align="center"><a href="../"><img src="images/Chinese.gif" width="25" height="16" title="중국어" /></a></td>
                      <td width="32" align="center"><a href="../en/"><img src="images/French.gif" width="25" height="16" title="영어" /></a></td>
                      <td width="32" align="center"><a href="../kr/"><img src="images/Korean.gif" width="25" height="16" title="한국어" /></a></td>
                      <td width="32" align="center"><a href="../jp/"><img src="images/Japanese.gif" width="25" height="16" title="일본어" /></a></td>
                      <td width="8">&nbsp; </td>
                    </tr>
                  </table>
                  <script type="text/javascript">
                    function searchOk() {
                      var key = document.getElementById("skeywords").value.replace(/(^\s*)|(\s.$)/g, "");
                      if (key == "") {
                        alert("입력하십시오. 키워드！");
                      } else {
                        window.location = "Search.aspx?keywords=" + escape(key);
                      }
                    }
                  </script>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="75" align="left" valign="top" style="background-color: #bf2831;">
            <table width="1001" height="72" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="72" align="left" valign="top">
                  <table class="topbox" width="1001" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="390" height="72" align="left" valign="top" bgcolor="#d34245"><a href="http://www.hqht-online.com/"><img src="images/logo.gif" width="388" height="72" border="0" title="Global Patent 특허 年费 대리 주식회사 주요 경영 국가 특허 年费 대리, 무료 조회 국가 특허 年费 표준, 고품질, 낮은 가격의 전문 年费 서비스." /></a> </td>
                      <td class="index" width="70" align="center"><a href="index.aspx" class="ac2">홈</a> </td>
                      <td class="about" width="88" align="center"><a href="AboutUs.aspx" class="ac2">회사소개</a> </td>
                      <td class="services" width="89" align="center"><a href="services.aspx" class="ac2">업무분야</a> </td>
                      <td class="nianfei" width="123" align="center"><a href="nianfei.aspx" class="ac2">특허연차료 조회</a> </td>
                      <td class="youhui" width="90" align="center"><a href="youhui.aspx" class="ac2">할인 활동</a> </td>
                      <td class="faq" width="70" align="center"><a href="faq.aspx" class="ac2">FAQ</a> </td>
                      <td class="links" width="70" align="center"><a href="links.aspx" class="ac2">LINK</a> </td>
                      <td class="other" width="11" align="center">&nbsp; </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<script type="text/javascript">
  $(".topbox tr td").each(
 function (index, element) {
   if (index > 0 && index < 9) {
     if ($(element).attr("class") == $("body").attr("id")) {
       $(element).css("background-color", "#bf2831");
     } else {
       $(element).css("background-color", "#d34245").mousemove(function () { $(this).css('background-color', '#bf2831') }).mouseout(function () { $(this).css('background-color', '#d34245') });
     }
   }
 }); 
</script>
