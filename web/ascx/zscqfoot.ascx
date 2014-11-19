<%@ Control Language="C#" AutoEventWireup="true" CodeFile="zscqfoot.ascx.cs" Inherits="ascx_zscqfoot" %>
<script type="text/javascript">
    checkInstalled = function (m) {
        switch (m) {
            case 'msn':
                try {
                    new ActiveXObject("MSNMessenger.P4QuickLaunch");
                    return true;
                }
                catch (e) {
                    return false;
                }
            case 'skype':
                try {
                    new ActiveXObject("Skype.Detection");
                    return true;
                } catch (e) {
                    return false;
                }
            case 'qq':
                try {
                    new ActiveXObject("TimwpDll.TimwpCheck");
                    return true;
                }
                catch (e) {
                    return false;
                }
        }
    }  
</script>
<script src="js/validate.js" type="text/javascript"></script>
<script type="text/javascript">
    function checkfaq() {
        var titleField = $("#text_subtitle");
        var emailField = $("#text_email");
        var textField = $("#text_content");
        if (FieldValidation.validate(titleField, emailField, textField)) {
            return true;
        }
        else {
            return false;
        }
    }

    function sendMsg() {
        var suiji = Math.floor(Math.random() * 1000000);
        var titleField = $("#text_subtitle");
        var emailField = $("#text_email");
        var textField = $("#text_content");
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=faq&ipt_subtitle=" + titleField.val() + "&ipt_email=" + emailField.val() + "&txt_content=" + textField.val() + "&sj=" + suiji,
            success: function (msg) {
                if (msg == "ok") {
                    hidedivbox('divshow3');
                    alert("问题已发送到客服中心，我们将在24小时之内回复您，请注意及时登录查询!");
                    window.location.reload()
                    return true;
                }
                else {
                    hidedivbox('divshow3');
                    alert(msg);
                    window.location.reload()
                    return false;
                }
            }
        });

    }
</script>
<div id="divbg" class="divbg">
</div>
<div id="divshow1" class="divshow">
    <table width="571" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="38" align="left" valign="top" style="background-image: url(images/faq_bg1.gif);">
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="662" height="38">&nbsp;
                            
                        </td>
                        <td width="38">
                            <a href="#">
                                <img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidedivbox('divshow1');" /></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="150" align="left" valign="top" style="background-image: url(images/faq_bg2.gif);">
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="36">&nbsp;
                            
                        </td>
                        <td align="center" style="line-height: 21px; font-size: 14px; font-weight: bold;">
                            使用条款
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td width="40" height="150">&nbsp;
                            
                        </td>
                        <td width="615" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                            <div style="width: 611px; min-height: 570px; max-height: 480px; overflow-y: auto;">
                                <%= contents1%>
                            </div>
                        </td>
                        <td width="45">&nbsp;
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="15">
                <img src="images/faq_bg3.gif" width="700" height="20" />
            </td>
        </tr>
    </table>
</div>
<div id="divshow2" class="divshow">
    <table width="571" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="38" align="left" valign="top" style="background-image: url(images/faq_bg1.gif);">
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="662" height="38">&nbsp;
                            
                        </td>
                        <td width="38">
                            <a href="#">
                                <img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidedivbox('divshow2');" /></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="150" align="left" valign="top" style="background-image: url(images/faq_bg2.gif);">
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="36">&nbsp;
                            
                        </td>
                        <td align="center" style="line-height: 21px; font-size: 14px; font-weight: bold;">
                            隐私条款
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td width="40" height="150">&nbsp;
                            
                        </td>
                        <td width="615" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                            <div style="width: 611px; min-height: 570px; max-height: 480px; overflow-y: auto;">
                                <%= contents2%>
                            </div>
                        </td>
                        <td width="45">&nbsp;
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="15">
                <img src="images/faq_bg3.gif" width="700" height="20" />
            </td>
        </tr>
    </table>
</div>
<div id="divshow3" class="divshow">
    <table width="571" height="299" border="0" cellspacing="0" cellpadding="0" style="background-image: url(images/faq_bg.png);">
        <tr>
            <td height="299" align="left" valign="top">
                <table width="571" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="36" height="58">&nbsp;
                            
                        </td>
                        <td width="480">&nbsp;
                            
                        </td>
                        <td width="55" align="right" valign="top">
                            <a href="javascript:void(0);">
                                <img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidedivbox('divshow3');" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td height="205">&nbsp;
                            
                        </td>
                        <td align="left" valign="top">
                            <table width="480" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="41" height="32" align="left">
                                        <strong>主题：</strong>
                                    </td>
                                    <td width="432">
                                        <input type="text" name="text_subtitle" id="text_subtitle" onblur="checkfaq()" class="required" style="height: 23px; width: 346px; font-size: 12px; border: 1px solid #bebebe;" maxlength="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32" align="left">
                                        <strong>邮箱：</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="text_email" id="text_email" onblur="checkfaq()" class="required email" value="<%=email %>" style="height: 23px; width: 346px; font-size: 12px; border: 1px solid #bebebe;" maxlength="50" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="88" align="left">
                                        <strong>内容：</strong>
                                    </td>
                                    <td>
                                        <textarea name="text_content" id="text_content" onblur="checkfaq()" class="required" cols="45" rows="5" style="height: 80px; width: 346px; font-size: 12px; border: 1px solid #bebebe;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" colspan="2" align="center">
                                        <strong style="color: #d34245;">如您需得到更全面的帮助请直接联系我们</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" colspan="2" align="center">
                                        <img src="images/faq3.gif" style="border: 0px; width: 118px; height: 29px; cursor: pointer;" onclick="if(checkfaq())sendMsg();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td height="15">&nbsp;
                            
                        </td>
                        <td>&nbsp;
                            
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="divshow4" class="divshow">
    <table width="571" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="38" align="left" valign="top" style="background-image: url(images/faq_bg1.gif);">
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="662" height="38">&nbsp;
                            
                        </td>
                        <td width="38">
                            <a href="#">
                                <img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidedivbox('divshow4');" /></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="150" align="left" valign="top" style="background-image: url(images/faq_bg2.gif);">
                <table width="700" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="36">&nbsp;
                            
                        </td>
                        <td align="center" style="line-height: 21px; font-size: 14px; font-weight: bold;">
                            本年度假期安排
                        </td>
                        <td>&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td width="40" height="150">&nbsp;
                            
                        </td>
                        <td width="615" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                            <div style="width: 611px; min-height: 570px; max-height: 480px; overflow-y: auto;">
                                <%= contents4%>
                            </div>
                        </td>
                        <td width="45">&nbsp;
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="15">
                <img src="images/faq_bg3.gif" width="700" height="20" />
            </td>
        </tr>
    </table>
</div>
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
        <td height="64" align="left" valign="top">
            <table width="1001" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="64" align="left" valign="top">
                        <table width="1001" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="25">
                                </td>
                            </tr>
                            <tr>
                                <td height="34" align="center" style="line-height: 21px;">
                                    <%=contents3 %>
                                </td>
                            </tr>
                            <tr>
                                <td height="8">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <table width="1001" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="395">&nbsp;
                                                
                                            </td>
                                            <td width="606" align="left">
                                                <table style="line-height: 15px;" width="600" border="0" cellspacing="0" cellpadding="0">
                                                    <tr valign="middle">
                                                        <td style="width: 79px; text-align: center; background-color: #bf2831; vertical-align: middle; line-height: 15px; height: 15px;">
                                                            <a href="javascript:openboxBg(1);showdivbox('divshow1');" class="ac3">使用条款</a>
                                                        </td>
                                                        <td width="2">
                                                        </td>
                                                        <td style="width: 79px; text-align: center; background-color: #bf2831; vertical-align: middle; line-height: 15px; height: 15px;">
                                                            <a href="javascript:openboxBg(1);showdivbox('divshow2');" class="ac3">隐私条款</a>
                                                        </td>
                                                        <td width="2">
                                                        </td>
                                                        <td style="width: 79px; text-align: center; background-color: #bf2831; vertical-align: middle; line-height: 15px; height: 15px;">
                                                            <a href="sitemap.aspx" class="ac3">网站地图</a>
                                                        </td>
                                                        <td width="359">&nbsp;
                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="31">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript" src="js/kf.js"></script>
<div id="div_kefuleft" style="position: absolute; right: 0px; top: 130px; width: 32px; z-index: 10000;">
    <table width="32" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="32" height="0" align="left" valign="top">
                <table width="32" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="56" align="right" valign="top">
                            <a href="javascript:void(0)" onclick="openkefu();">
                                <img src="images/hqht_kf1s.gif" width="32" height="108" border="0" /></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="div_kefu" style="float: left; position: absolute; right: 0; top: 130px; width: 162px; z-index: 10000; display: none">
    <table width="160" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="32" height="0" align="left" valign="top">
                <table width="32" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="56" align="right" valign="top">
                            <a href="javascript:void(0)" onclick="esckefu();">
                                <img src="images/hqht_kf1.jpg" width="32" height="108" border="0" /></a>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="128" align="center" valign="top">
                <table id="kefu1" style="border-left: 1px solid #d4484b; border-top: 1px solid #d4484b; border-bottom: 1px solid #d4484b; border-right: 1px solid #d4484b; background-color: #fff;" width="126" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    </tr>
                    <tr>
                        <td height="40" align="center">
                            <img src="images/hqht_kf2.jpg" width="109" height="24" />
                        </td>
                    </tr>
                    <tr>
                        <td height="42" align="center" style="line-height: 21px;">
                            <strong>工作日</strong>（北京时间）<br />
                            9:00-17:00
                        </td>
                    </tr>
                    <tr>
                        <td height="28" align="center">
                            <a href="javascript:openboxBg(1);showdivbox('divshow4');" class="ac10">本年度假期安排</a>
                        </td>
                    </tr>
                    <tr>
                        <td height="33" align="center">
                            <a href="javascript:openboxBg(1);showdivbox('divshow3');">
                                <img src="images/hqht_kf3.jpg" width="109" height="24" border="0" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td height="33" align="center">
                            <a href="javascript:void(0)" onclick="kk2();this.blur();">
                                <img src="images/hqht_kf4.jpg" width="109" height="24" border="0" /></a>
                        </td>
                    </tr>
                    <tr id="kefu2" style="display: none">
                        <td align="left" valign="top">
                            <table width="126" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="33" align="center">
                                        <a href="http://wpa.qq.com/msgrd?V=1&Uin=331236387&Site=www.hqht-online.com&Menu=yes" target="_blank">
                                            <img src="images/hqht_kf7.jpg" width="109" height="27" border="0" /></a>
                                    </td>
                                </tr>
                                <%-- <tr>
                  <td height="33" align="center"><a href="msnim:chat?contact=hqht@live.com&Site=在线咨询" onclick="return checkInstalled('msn');" target="_blank"><img src="images/hqht_kf8.jpg" width="109" height="27" border="0" /></a></td>
                </tr>--%>
                                <tr>
                                    <td height="33" align="center">
                                        <a href="skype:zourilan612?call" target="_blank" onclick="return skypeCheck();">
                                            <img src="images/hqht_kf9.jpg" width="109" height="27" border="0" /></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="35" align="center">
                            <img src="images/hqht_kf5.jpg" width="109" height="24" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="left" valign="top">
                            <table width="126" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="10" height="79">&nbsp;
                                        
                                    </td>
                                    <td width="109" align="left" valign="top" style="line-height: 21px;">
                                        <strong>TEL:</strong><br />
                                        86-10-84505596<br />
                                        <strong style="color: #d4484b;">E-MAIL:</strong><br />
                                        <a href="mailto:pat-annuity@hqht-online.com" class="ac10">pat-annuity@hqht-online.com</a>
                                    </td>
                                    <td width="10">&nbsp;
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="center" valign="bottom">
                            <a href="faq.aspx">
                                <img src="images/hqht_kf6.jpg" width="109" height="24" border="0" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td height="10" align="center">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    var rollFlag = 0;
    function kk2() {
        //sub_num = str.substring(str.length - 2);
        //		sub_str = str.substring(0, str.length -2);

        if (document.getElementById("kefu2").style.display == "") {
            document.getElementById("kefu2").style.display = "none";
            rollFlag = 0;
            return;
        }
        else {
            if (rollFlag != 0) {
                //document.all[sub_str+rollFlag].style.display="none";
                document.getElementById("kefu2").style.display = "";
            }

            document.getElementById("kefu2").style.display = "";
        }
    }
    function openkefu() {
        document.getElementById("div_kefuleft").style.display = "none";
        document.getElementById("div_kefu").style.display = "";
    }
    function esckefu() {
        document.getElementById("div_kefuleft").style.display = "";
        document.getElementById("div_kefu").style.display = "none";
    }
</script>
<script type="text/javascript">
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
        document.getElementById(id).style.top = top1 + 20 + "px"; //document.documentElement.scrollTop + 100 + "px";  
    }
    function hidedivbox(id) {
        document.getElementById("divbg").style.display = "none";
        document.getElementById(id).style.display = "none";
    } 
</script>
<%--<script type="text/javascript">
  function openBg(state) { //遮照打开关闭控制
    if (state == 1) {
      document.getElementById("bg_faq").style.display = "block";
      var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
      h = h > document.body.scrollHeight ? h : document.body.scrollHeight;
      document.getElementById("bg_faq").style.height = h + "px";
    }
    else {
      document.getElementById("bg_faq").style.display = "none";
    }
  }
  function showdiv(id) {
    $("#show_faq").show();
    document.getElementById("show_faq").style.left = (document.getElementById("bg_faq").offsetWidth - document.getElementById("show_faq").offsetWidth) / 2 + "px";
    document.getElementById("show_faq").style.top = 150 + "px";
  }
  function hidediv() {
    $("#show_faq").hide();
    $("#bg_faq").hide();
  }
</script>--%>
<%--<style type="text/css">
  #bg_faq { display: none; z-index: 1; background: #0b0b0b; left: 0px; width: 100%; height: 100%; position: absolute; top: 0px; filter: alpha(opacity=70); opacity: 0.7; }
  #show_faq { display: none; margin-top: 10px; z-index: 2; position: absolute; top: 0px; }
</style>--%>
