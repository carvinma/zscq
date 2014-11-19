<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindPwd.aspx.cs" Inherits="FindPwd" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <style type="text/css">
    .msgshow { color: Red; }
  </style>
  <script type="text/javascript">
    function IsDigit() {
      return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }  
  </script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <input type="hidden" id="Hid_UserName" runat="server" />
  <input type="hidden" id="Hid_Mobile" runat="server" />
  <input type="hidden" id="Hid_Email" runat="server" />
  <input type="hidden" id="Hid_MemberType" runat="server" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="45" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="548" align="left" valign="top" style="background-color: #f5f5f5;">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="42" align="left" valign="top"><img src="images/password2.gif" width="260" height="69" /></td>
          </tr>
          <tr>
            <td width="260" height="73" align="left" valign="top" style="background-image: url(images/aboutus_left2.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td height="405" align="left" valign="top" style="background-image: url(images/youhui2.gif);">&nbsp; </td>
          </tr>
        </table>
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp; </td>
                  <td width="701">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;&gt;&gt;&nbsp;パスワードを取り戻す </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="496" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691">&nbsp; </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td width="691" align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="center" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="183" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="166" align="center" class="font12bt">パスワードを取り戻す </td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="center" valign="top">
                                <div id="setup1" style="display: ;">
                                  <table width="689" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td height="32" align="right"><strong>取戻し方式：</strong> </td>
                                      <td align="left">
                                        <input runat="server" id="ridE" type="radio" name="mode" value="2" checked="true" />
                                        電子メール                                        <span id="msg_mode" class="msgshow"></span></td>
                                    </tr>
                                    <tr>
                                      <td width="260" height="32" align="right"><strong>ユーザー名： </strong></td>
                                      <td width="429" align="left">
                                        <input type="text" name="TXT_USERNAME" id="TXT_USERNAME" runat="server" class="font12000" maxlength="50" />
                                        <span id="msg_uname" class="msgshow"></span></td>
                                    </tr>
                                    <tr>
                                      <td width="260" height="32" align="right"><strong></strong></td>
                                      <td width="429" align="left"><img src="images/userreg.jpg" name="fasong" width="149" height="22" border="0" id="fasong" /></td>
                                    </tr>
                                  </table>
                                  <img id="vcode" style="display: none;" />
                                </div>
                                <div id="setup2" style="display: none;">
                                  <table width="689" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="260" height="32" align="right"><strong>検証番号：</strong> </td>
                                      <td width="429" height="32" align="left">
                                        <input type="text" id="TXT_V" class="font120" runat="server" maxlength="6" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" name="" value="" placeholder="" />
                                        <span id="msg_v" class="msgshow"></span><a id="resend" href="javascript:void(0);">再送信</a> </td>
                                    </tr>
                                    <tr>
                                      <td height="32" align="right"><strong>新しいパスワードを記入する：</strong> </td>
                                      <td align="left">
                                        <input type="password" name="" id="TXT_NEWPWD" runat="server" tips="パスワードの長さが6〜21桁の間に!" class="font12000 tooltip" value="" placeholder="" />
                                        <span id="msg_pwd" class="msgshow"></span></td>
                                    </tr>
                                    <tr>
                                      <td height="32" align="right"><strong>パスワードを確認する：</strong> </td>
                                      <td align="left">
                                        <input type="password" name="" id="TXT_NEWPWD2" runat="server" class="font12000" value="" placeholder="" />
                                        <span id="msg_pwd2" class="msgshow"></span></td>
                                    </tr>
                                    <tr>
                                      <td height="32" align="right">&nbsp; </td>
                                      <td align="left" valign="top">
                                        <table width="389" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="8" height="35"></td>
                                            <td width="95" align="left">
                                              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                  <asp:ImageButton ID="lbtn_OK" ImageUrl="images/user_zl_b5.gif" Width="85" Height="29" BorderWidth="0" runat="server" OnClick="lbtn_OK_Click" OnClientClick="return checksubmit();" />
                                                </ContentTemplate>
                                              </asp:UpdatePanel>
                                            </td>
                                            <td width="108" align="left">&nbsp; </td>
                                            <td width="178" align="left">&nbsp; </td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                  </table>
                                  <div id="divfasong" style="height: 50px; line-height: 22px; border: solid 1px #ffcc7f; background-color: #ffffe5;">
                                    提示メッセージ</div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp; </td>
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
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
  var reg1 = /./;
  var reg2 = /^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]+$/;
  var reg3 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
  $('#TXT_USERNAME').focus(); //设置焦点 
  $('#setup1').show();
  $('#setup2').hide();
  $('#divfasong').hide();
  $('#fasong').click(reloadcode).css("cursor", "pointer"); //设置按钮
  $('#lbtn_OK').attr("disabled", true)
  $(':radio[name="mode"]').blur(function () { checkMode(); });
  $('#TXT_USERNAME').blur(function () { checkUserName(); });

  function checkMode() {
    var mode = $(':radio[name="mode"]:checked').val();
    if (mode == "1" || mode == "2") {
      $("#msg_mode").text("");
      return true;
    }
    else {
      $("#msg_mode").text("パスワードを取り戻す方法を選択してください!");
      return false;
    }
  }
  function checkUserName() {
    var name = $('#TXT_USERNAME').val();
    $("#msg_uname").text("");
    if (!reg1.test(name)) {
      $("#msg_uname").text("ユーザー名を記入してください");
      return false;
    }
    else {
      $("#msg_uname").text("");
      return true;
    }
  }
  function reloadcode() {
    var mode = $(':radio[name="mode"]:checked').val();
    var name = $('#TXT_USERNAME').val();
    var pagetype = $('#Hid_MemberType').val();
    var flag = true;
    var cs = "";
    var rand = Math.floor(Math.random() * 1000000);
    //验证表单
    flag = flag * checkMode();
    flag = flag * checkUserName();
    if (mode == "1") {
      cs = "flag=findpwd&m=1&u=" + name + "&p=" + pagetype + "&r=" + rand;
    }
    if (mode == "2") {
      cs = "flag=findpwd&m=2&u=" + name + "&p=" + pagetype + "&r=" + rand;
    }
    if (flag == 0)
    { return false; }
    //生成验证码
    $("#resend").show().unbind("click", "reloadcode").css("cursor", "").attr("disabled", true);
    $('#fasong').attr("disabled", true).css("cursor", "");
    $('#vcode').attr("src", "v.aspx?" + rand);
    $.ajax({
      type: "get",
      url: "Handler.ashx",
      data: cs,
      success: function (data) {
        var v = data.toString().split(';;;;;')[0];
        var v2 = data.toString().split(';;;;;')[1];
        if (v == "1") {
          setstate(1, v2);
        } else {
          $('#fasong').attr("disabled", false).css("cursor", "pointer");
          alert(v2); //发生错误，重置状态
        }
      }
    });
  }
  function setstate(v, v2) {
    if (v == 1) {//成功生成验证码
      $("#msg_v").text("");
      $("#msg_pwd").text("");
      $("#divfasong").html("");
      $('#divfasong').show();
      $('#setup1').hide();
      $('#setup2').show();
      $('#fasong').hide().unbind('click', 'reloadcode').css("cursor", ""); //设置按钮
      $('#lbtn_OK').attr("disabled", false);
      daojishi(v2, 60);
    }
  }
  function daojishi(con, miaoshu) {
    if (miaoshu > 0) {
      $('#divfasong').show();
      con = con.replace(miaoshu + "秒", (miaoshu - 1) + "秒")
      $('#divfasong').html(con);
      setTimeout("daojishi('" + con + "'," + (miaoshu - 1) + ")", 1000);
    }
    else {
      clearTimeout(daojishi);
      $('#divfasong').hide();
      $("#resend").show().click(reloadcode).css("cursor", "pointer").attr("disabled", false);
    }
  }
  function checksubmit() {
    $("#Hid_UserName").val($('#TXT_USERNAME').val());
    var code = $.trim($('#TXT_V').val());
    var pwd = $("#TXT_NEWPWD").val();
    var pwd2 = $("#TXT_NEWPWD2").val();

    $("#msg_v").text("");
    $("#msg_pwd").text("");

    if (code == "") {
      $("#msg_v").text("検証コードを記入してください！");
      return false;
    } else if (pwd == "") {
      $("#msg_pwd").text("パスワードを記入してください！");
      return false;
    } else if (pwd.length < 6 || pwd.length > 21) {
      $("#msg_pwd").text("パスワードの長さが6〜21桁の間に！");
      return false;
    } else if (pwd2 != pwd) {
      $("#msg_pwd2").text("パスワードが一緻しない！");
      return false;
    }
    return true;
  } 
</script>
<script src="js/tooltips.js" type="text/javascript"></script>
