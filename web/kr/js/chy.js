function obj(id) {
  return document.getElementById(id);
}
function reloadcode(v) {
  obj(v).src = "v.aspx?" + Math.random();
}

function OnEnter(field) { if (field.value == field.defaultValue) { field.value = ""; } }
function OnExit(field) { if (field.value == "") { field.value = field.defaultValue; } }

function validateName() {
  var userName = $("#txt_username").val();
}
//验证码
function checkCode() {
  var code = $("#txt_code").val();
  if (code == "") {
    alert("인증 번호 입력해주세요");
    $("#txt_code").focus();
    return false;
  }
  else {
    $.ajax({
      type: "POST",
      url: "Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=checkCode&code=" + code,
      success: function (msg) {
        if (msg == "1") {
          return true;
        }
        else {
          return false;
        }
      }
    });
  }
}

function user_login() {
  var pageFlag = $("#Hf_PageFlag").val();
  var href = $("#Hf_Href").val();
  var href2 = $("#Hf_Href2").val();
  var userName = $("#txt_username").val();
  var userPassword = $("#txt_userpassword").val();
  var code = $("#txt_code").val();
  var rememberPwd = $("#cb_remember").attr("checked") == true ? 1 : 0;
  var autoLogin = $("#cb_auto").attr("checked") == true ? 1 : 0;
  if (userName == "" || userName == "아이디" || userName == "아이디/메일/핸드폰") {
    alert("로그인 이름을 입력하십시오.");
    $("#txt_username").focus();
    return false;
  }
  else if (userPassword == "") {
    alert("로그인 암호를 입력하십시오.");
    $("#txt_userpassword").focus();
    return false;
  }
  else if (code == "") {
    alert("인증 번호 입력해주세요");
    $("#txt_code").focus();
    return false;
  }
  else {
    $.ajax({
      type: "POST",
      url: "Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=login&uName=" + userName + "&uPwd=" + userPassword + "&code=" + code + "&rememberPwd=" + rememberPwd + "&autoLogin=" + autoLogin + "&pageFlag=" + pageFlag,
      success: function (msg) {
        if (msg == "登陆成功") {
          window.location = href; return;
        }
        else if (msg == "wanshanziliao") {
            alert("자료 저주하지않으니 완선해주세요");
          window.location = href2; return;
        }
        else {
          if (msg!="")
			{
          alert(msg);
			}
        }
      }
    });
  }
}
//用户注册
function user_register() {
  var rand = Math.floor(Math.random() * 1000000);
  var href = $("#Hf_Href").val();
  var uName = $("#txt_username").val();
  var uType = 1;
  var pageFlag = $("#Hf_PageFlag").val();
  if ($("#rd_type1").attr("checked")) {
    uType = 1;
  }
  if ($("#rd_type2").attr("checked")) {
    uType = 2;
  }
  if ($("#rd_type3").attr("checked")) {
    uType = 3;
  }
  var uGuoJi = $("#Drp_GuoJi").val();
  var uEmail = $("#txt_email").val();
  var uPwd = $("#txt_pwd").val();
  var uPwdOk = $("#txt_okpwd").val();
  if (uName == "") {
    alert("명칭을  입력해주세요");
    $("#txt_username").focus();
    return false;
  }
  //  if (checkname(uName) == false) {
  //    alert("用户名只能用数字字母或者下划线组成");
  //    $("#txt_username").focus();
  //    return false;
  //  }
  if (isNaN(uName) == false && uName.length == 11) {
    alert("명칭은 전부수자로 입력할수 없습니다");
    $("#txt_username").focus();
    return false;
  }
  if (uGuoJi == "0") {
    alert("국적을 선태하세요");
    $("#Drp_GuoJi").focus();
    return false;
  }
  if (uEmail == "") {
    alert("E-mail입력해주세요");
    $("#txt_email").focus();
    return false;
  }
  else if (checkEmail(uEmail) == false) {
    alert("정확한 E-mail 주소를  입력해주세요");
    $("#txt_email").focus();
    return false;
  }
  else if (uPwd == "") {
    alert("비밀번호 입력해주세요");
    $("#txt_pwd").focus();
    return false;
  }
  else if (uPwdOk == "") {
    alert("비밀번호 다시한번 입력해주세요 ");
    $("#txt_okpwd").focus();
    return false;
  }
  else if (uPwdOk != uPwd) {
    alert("두번입력한 비밀번호가 일치하지 않습니다");
    $("#txt_okpwd").focus();
    return false;
  }
  else {
      $.ajax({
          type: "POST",
          url: "Handler.ashx",
          contentType: "application/x-www-form-urlencoded; charset=utf-8",
          data: "flag=register&uName=" + uName + "&uPwd=" + uPwdOk + "&uType=" + uType + "&uGuoJi=" + uGuoJi + "&uEmail=" + uEmail + "&pageFlag=" + pageFlag + "&r=" + rand,
          success: function (data) {
              var v = data.toString().split(';;;;;')[0];
              var v2 = data.toString().split(';;;;;')[1];
              if (v == "2") {
                
                  alert(v2);
                  if (href != "") {
                      document.location.href = href;
                  }
                  else if (pageFlag == "zl") {
                      document.location.href = 'User_PatentCoupon.aspx';
                  }
                  else if (pageFlag == "sb") {
                      document.location.href = 'user_sbcoupon.aspx';
                  }
                  else {
                      document.location.href = 'index.aspx';
                  }
              } else if (v == "1") {

                  if (href != "") {
                      document.location.href = href;
                  }
                  else if (pageFlag == "zl") {
                      alert("자료 저주하지않으니 완선해주세요！");
                      document.location.href = 'User_PatentUpdateData.aspx';
                  }
                  else if (pageFlag == "sb") {
                      alert("자료 저주하지않으니 완선해주세요！");
                      document.location.href = 'user_sbzl.aspx';
                  }
                  else {
                      document.location.href = 'index.aspx';
                  }
              }
              else {
                 // alert(data);
                  alert(v2);
                  if (v2 == "이미  존제한 명칭입니다") {
                      $("#txt_username").focus();
                  }
                  if (v2 == "전자 메일 이미 그에 의해 등록") {
                      $("#txt_email").focus();
                  }
                  return false;
              }
          }
      });
  }
}
//邮箱验证
function checkEmail(email) {
  var isemail = /^\w+([-\.]\w+)*@\w+([\.-]\w+)*\.\w{2,4}$/;
  //var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  //  if (!myreg.test(email)) {
  //    return false;
  //  }
  if (!isemail.test(email)) {
    return false;
  }
  return true;
}
//用户名验证(数字字母下划线)
function checkname(str) {
  var myreg = /^[a-zA-Z0-9_]{3,30}$/;
  if (!myreg.test(str)) {
    return false;
  }
  return true;
}


//倒计时
function daojishi(buttonid, divid, miaoshu, textid) {
  if (miaoshu > 0) {
    document.getElementById(divid).innerHTML = "인정번호 발송하였습니다  받지못할경우에 " + miaoshu + " 초후 다시 발송할수있습니다！";
    setTimeout("daojishi('" + buttonid + "','" + divid + "'," + (miaoshu - 1) + ",'" + textid + "')", 1000);
    document.getElementById(buttonid).disabled = true;
    document.getElementById(textid).disabled = true;
  }
  else {
    document.getElementById(textid).disabled = false;
    document.getElementById(buttonid).disabled = false;
    document.getElementById(divid).style.display = "none";
  }
}
//向邮箱发送验证码
function sendEmail() {
  var temail = $("#Txt_Email").val();
  if (temail != "") {
    if (checkEmail(temail) == false) {
      alert("정확한 E-mail 주소를  입력해주세요");
      $("#Txt_Email").focus();
      return false;
    }
    else {
      document.getElementById('imgCheck').src = "v.aspx?" + Math.random();
      //var rand = Math.floor(Math.random() * 1000000);
      $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=sendEmail&SEmail=" + temail,
        success: function (msg) {
          if (msg == "发送成功") {
            daojishi('fasong', 'divfasong', 60, 'Txt_Email');
            document.getElementById('divfasong').style.display = "";
          }
          else {
            alert(msg);
          }
        }
      });
    }
  }
  else {
    alert('E-mail 입력해주세요!');
    $("#Txt_Email").focus();
    return false;
  }
}
//验证邮箱验证码
function Member_ValidateEmail() {
  var vEmail = $("#Txt_Email").val();
  var vCode = $("#Txt_ValidateCode").val();
  if (vCode != "") {
    $.ajax({
      type: "POST",
      url: "Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=validateEmail&VEmail=" + vEmail + "&VCode=" + vCode,
      success: function (msg) {
        alert(msg);
      }
    });
  }
  else {
    alert('인증번호를 입력해주세요!');
    $("#Txt_ValidateCode").focus();
    return false;
  }
}
//向手机发送验证码
function sendPhone() {
  var tphone = $("#Txt_Phone").val();
  if (tphone != "") {
    var reg = new RegExp("^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$");
    if (reg.test(tphone) == false) {
      alert("정확한 핸드폰 번호를 입력하십시오.");
      $("#Txt_Phone").focus();
      return false;
    }
    else {
      document.getElementById('imgCheck').src = "v.aspx?" + Math.random();
      $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=sendPhone&SPhone=" + tphone,
        success: function (msg) {
          if (msg == "发送成功") {
            daojishi('fasong', 'divfasong', 60, 'Txt_Phone');
            document.getElementById('divfasong').style.display = "";
          }
          else {
            alert(msg);
          }
        }
      });
    }
  }
  else {
    alert('핸드폰번호를  입력해주세요!');
    $("#Txt_Phone").focus();
    return false;
  }
}
//验证手机验证码
function Member_ValidatePhone() {
  var vPhone = $("#Txt_Phone").val();
  var vCode = $("#Txt_ValidateCode").val();
  if (vCode != "") {
    $.ajax({
      type: "POST",
      url: "Handler.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=validatePhone&VPhone=" + vPhone + "&VCode=" + vCode,
      success: function (msg) {
        alert(msg);
      }
    });
  }
  else {
    alert('인증번호를 입력해주세요!');
    $("#Txt_ValidateCode").focus();
    return false;
  }
}