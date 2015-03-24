var reg = /^([a-zA-Z0-9]+[-\_\_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
var reg2 = new RegExp("^1((3[0-9])|(4[5-7])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$");
function obj(id) {
  return document.getElementById(id);
}
function objs(name) {
  return document.getElementsByName(name);
}
function IsDigit() {
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
function jfpnumber(v) {
  var s = 1;
  if (obj('ibuycount').value != "") {
    s = parseInt(obj('ibuycount').value);
  }
  else {
    obj('ibuycount').value = 1;
  }
  if (v == 1) {
    obj('ibuycount').value = s + 1;
  }
  if (v == 2) {
    if (s > 1) {
      obj('ibuycount').value = s - 1;

    } else {
      obj('ibuycount').value = 1;
    }
  }
  jfchange();
}

function jfchange() {
  var pid = obj('Hi_PId').value;
  var number = obj('ibuycount').value;
  if (number <= 0) {
    obj('ibuycount').value = 1;
    number = 1;
  }
  obj('Hi_Number').value = number;
  obj('jfzj').innerHTML = parseInt(obj('Hi_Jifen').value, 10) * number;
}
//点击兑换 
function duihuan() {
  var mid = obj('Hi_MemberId').value;
  if (mid == null || mid == undefined || mid == 0) {
    window.location.href = "shoplogin.aspx?pageurl2=" + escape(window.location); return;
  }
  var pid = parseInt(obj('Hi_PId').value, 10);
  var number = parseInt(obj('Hi_Number').value, 10);
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "flag=cartaddproduct&Pid=" + pid + "&Number=" + number + "&n=" + rand;

  $.ajax({ type: "post", url: "Handler.ashx", data: cs,
    success: function (data) {

      switch (data.toString().split(',')[3]) {
        case "1":
          window.location.href = 'user_shoporder1.aspx';
          break;
        case "3":
          window.location.href = "shoplogin.aspx?pageurl2=" + escape(window.location);
          break;
        case "4":
          alert('인자가！');
          window.location.href = "jifen.aspx";
          break;
        case "5":
          alert('죄송합니다. 제가 포인트 부족하다！');
          //window.location.href = 'user_shoporder1.aspx';
          break;
        case "6":
          alert('죄송합니다, 수량, 적어도 위해1！');
          break;
        case "7":
          alert('죄송합니다. 상품은 이미 아래틀 선택하십시오. 다른 상품！');
          break;
        case "8":
          alert('이 상품은 찾을 수 없습니다！');
          window.location.href = "jifen.aspx";
          break;
        case "9":
          alert('당신은 현금으로 바꿀 수 자기보다 등급 낮은 등급！');
          break;
        case "10":
          alert('상품 구입 하나 밖에 등급！');
          break;
        case "11":
          alert('당신 못 타 급 바꾸다！');
          break;
        case "12":
          alert('당신 아직 개통 포인트 핸드폰！');
          break;
          case "13":
              alert('고객님이  사용하신  적분계좌는 특허시스템/상표시스템아이디과 련결하지않았으므로   상품태환을  진행할수없습니다 ！');
              break;
        default:
          alert('알 수 없는 오류 문의 관리자！');
          // window.location.href = "jifen.aspx";
          break;
      }
    }
  });
}
function checkaddress(ytype) {
  if (ytype == 1) {
    obj('div_address1').style.display = "";
    obj('div_address0').style.display = "none";
  }
  else {
    obj('div_address1').style.display = "none";
    obj('div_address0').style.display = "";
    obj('if_address').src = "iframe/ReceiveAddress.aspx?aid=" + obj('Hi_AddressId').value + "&ctype=1&n=" + Math.random();
  }
}
function addcart(v, n, x) {
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "flag=addcart&PId=" + v + "&Number=" + n + "&pcolor=" + x + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      if (data == "1") {
        showcart();
        addsuccess();
      }
      else {
        alert("의외의 사고가 발생한！");
      }
    }
  });
}
function addsuccess() {
  var gaodu = document.documentElement.scrollTop + document.body.scrollTop;
  obj('div_addcart').style.top = (gaodu + 200) + 'px';
  obj('div_addcart').style.display = "";
  setTimeout(function () {
    obj('div_addcart').style.display = "none";
  }
    , 5000);
}
function showcart() {
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "flag=showcart&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      //obj('shopcarboxcons').innerHTML=data.toString().split(';;;;;')[0]; 
      obj('span_count').innerHTML = data.toString().split(';;;;;')[1];
      obj('span_minicartnumber').innerHTML = data.toString().split(';;;;;')[1];
    }
  });
}
function managepnumber(ntype, mtype, wz, pid, nub, ptype) {
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "flag=" + mtype + "&PId=" + pid + "&Number=" + nub + "&ptype=" + ptype + +"&n=" + rand;
  $.ajax({ type: "post", url: "Handler.ashx", data: cs,
    success: function (data) {
      if (data != "" & data.toString().split(',')[3] == "1") {
        var number = data.toString().split(',')[0];
        var integral = data.toString().split(',')[1];
        var allintegral = data.toString().split(',')[2];
        if (ntype == 1) {
          obj('pnumber' + wz).value = number;
        }
        obj('hi_pnumber' + wz).value = number;
        obj('span_integral' + wz).innerHTML = integral;
        obj('span_allintegral').innerHTML = allintegral;
      }
      else {
        switch (data.toString().split(',')[3]) {
          case "5":
            alert('죄송합니다. 제가 포인트 부족하다.');
            window.location.href = 'user_shoporder1.aspx';
            break;
          case "6":
            alert('죄송합니다, 수량, 적어도 위해1！');
            break;
          case "10":
            alert('상품 구입 하나 밖에 등급！');
            break;
          default:
            alert('알 수 없는 오류 문의 관리자！');
            // window.location.href = "jifen.aspx";
            break;
        }
      }
    }
  });
}
function blurpnumber(wz, pid) {
  var number = obj('pnumber' + wz);
  var hi_number = obj('hi_pnumber' + wz);
  if (parseInt(number.value) < 1) {
    alert('수량, 적어도 위해1!');
    number.value = hi_number.value;
  }
  else {
    if (parseInt(number.value) != parseInt(hi_number.value)) {
      if (parseInt(number.value) < parseInt(hi_number.value)) {
        var cha = parseInt(hi_number.value) - parseInt(number.value);
        managepnumber(0, 'cartsubproduct', wz, pid, cha, '1');
      }
      else {
        var cha = parseInt(number.value) - parseInt(hi_number.value);
        managepnumber(0, 'cartaddproduct', wz, pid, cha, '1');
      }
    }
  }
}
function okaddress() {
  if (obj('div_addr')) {
    if (obj('Hi_AddressId').value == "0") {
      alert("물품 주소 선택하십시오.");
      if (obj('div_address1') && obj('div_address0')) {
        if (obj('div_address1').style.display == 'none') {
          obj('div_address0').focus();
        }
        else {
          obj('div_address1').focus();
        }
      }
      return false;
    }
  }
  return true;
}
function OnlyNumber() {
  if (!((window.event.keyCode >= 48) && (window.event.keyCode <= 57))) {
    window.event.keyCode = 0;
  }
}
function CheckSubmit() {
  if (obj("text_shouhuoren").value == "") {
    alert("수하인 작성해 주십시오!");
    obj("text_shouhuoren").focus();
    return false;
  }
  if (obj('ddlsheng').value == "0") {
    obj("ddlsheng").focus();
    alert("성이 선택하십시오.");
    return false;
  }
  if (obj('ddlshi').value == "0") {
    obj("ddlshi").focus();
    alert("도시 선택!");
    return false;
  }
  if (obj('ddlqu').value == "0") {
    obj("ddlqu").focus();
    alert("지역을 선택하십시오.");
    return false;
  }
  if (obj("text_shouhuodizhi").value == "") {
    alert("자세한 주소를 적어 주세요!");
    obj("text_shouhuodizhi").focus();
    return false;
  }
  if (obj("text_shoujihaoma").value == "" && obj("text_gudingdianhua").value == "") {
    obj("text_shoujihaoma").focus();
    alert("핸드폰 번호 및 전화 반드시 작성 한 가지!");
    return false;
  }
  //    if (obj("text_shoujihaoma").value == "") {
  //        alert("请填写手机号!");
  //        obj("text_shoujihaoma").focus();
  //        return false;
  //    }
  //   if(obj("text_shoujihaoma").value != "")
  //   {
  if (reg2.test(obj("text_shoujihaoma").value) == false) {
    alert('핸드폰 번호 형식 잘못된!');
    obj("text_shoujihaoma").focus();
    return false;
  }
  //   }
  if (obj("text_dianziyoujian").value != "") {
    if (reg.test(obj("text_dianziyoujian").value) == false) {
      alert('메일함 형태 잘못된!');
      obj("text_dianziyoujian").focus();
      return false;
    }
  }
}
 