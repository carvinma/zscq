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
          alert('不足パラメータ！');
          window.location.href = "jifen.aspx";
          break;
        case "5":
          alert('すみません、お積分不足！');
          //window.location.href = 'user_shoporder1.aspx';
          break;
        case "6":
          alert('申し訳ありませんが、数は少なくとも1！');
          break;
        case "7":
          alert('申し訳ありませんが、商品はすでに撤去し、他の商品を選択することができます！');
          break;
        case "8":
          alert('見つからない商品！');
          window.location.href = "jifen.aspx";
          break;
        case "9":
          alert('あなたで両替はできません自分よりレベルの低いレベル！');
          break;
        case "10":
          alert('商品購入一つしかないレベル！');
          break;
        case "11":
          alert('あなたはクロス級の両替！');
          break;
        case "12":
          alert('あなたはまだ開通積分携帯！');
          break;
        default:
          alert('未知のミスで、管理者に連絡してください！');
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
        alert("事故の発生！");
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
            alert('すみません、お積分不足！');
            window.location.href = 'user_shoporder1.aspx';
            break;
          case "6":
            alert('申し訳ありませんが、数は少なくとも1！');
            break;
          case "10":
            alert('商品購入一つしかないレベル！');
            break;
          default:
            alert('未知のミスで、管理者に連絡してください！');
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
    alert('商品の数は少なくとも1!');
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
      alert("の住所を選択してください！");
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
    alert("荷受人を記入してください!");
    obj("text_shouhuoren").focus();
    return false;
  }
  if (obj('ddlsheng').value == "0") {
    obj("ddlsheng").focus();
    alert("地方を選択してください!");
    return false;
  }
  if (obj('ddlshi').value == "0") {
    obj("ddlshi").focus();
    alert("都市を選択してください!");
    return false;
  }
  if (obj('ddlqu').value == "0") {
    obj("ddlqu").focus();
    alert("地域を選択してください!");
    return false;
  }
  if (obj("text_shouhuodizhi").value == "") {
    alert("詳しい住所を記入してください!");
    obj("text_shouhuodizhi").focus();
    return false;
  }
  if (obj("text_shoujihaoma").value == "" && obj("text_gudingdianhua").value == "") {
    obj("text_shoujihaoma").focus();
    alert("携帯電話の番号を記入する必要があるとの電話!");
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
    alert('携帯番号フォーマットの誤りがある!');
    obj("text_shoujihaoma").focus();
    return false;
  }
  //   }
  if (obj("text_dianziyoujian").value != "") {
    if (reg.test(obj("text_dianziyoujian").value) == false) {
      alert('メールアドレスフォーマットの誤りがある!');
      obj("text_dianziyoujian").focus();
      return false;
    }
  }
}
 