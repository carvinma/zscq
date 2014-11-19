function obj(id) {
  return document.getElementById(id);
}
function objs(name) {
  return document.getElementsByName(name);
}
function IsDigit() {
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
function addBookmark(title) {
  var url = parent.location.href;
  if (window.sidebar) {
    window.sidebar.addPanel(title, url, "");
  } else if (document.all) {
    window.external.AddFavorite(url, title);
  } else if (window.opera && window.print) {
    return true;
  }
}
var reg = /^([a-zA-Z0-9]+[-\_\_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
var reg3 = /^[a-zA-Z0-9_]{4,20}$/;
var reg4 = /^(\d{3,4}-)?\d{7,8}$/;
function shopcar(i) {
  if (i == 1) {
    obj("shopcarbox").style.display = "";
  }
  else {
    obj("shopcarbox").style.display = "none";
  }
}
function minicartdel(v, v2) {
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=delcart&pid=" + v + "&xid=" + v2 + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      if (data == "1") {
        showcart();
      }
      else {
        alert("发生意外！");
      }
    }
  });
}
//列表排行
function paihang(pai, v) {
  if (v == 1) {
    for (hang = 1; hang < 11; hang++) {
      var listpaihang1icon = obj("listpaihang1icon" + hang);
      if (listpaihang1icon) {
        var listpaihang1conblck = obj("listpaihang1conblck" + hang);
        if (hang == pai) {
          listpaihang1icon.className = "on";
          listpaihang1conblck.style.display = "";
        }
        else {
          listpaihang1icon.className = "";
          listpaihang1conblck.style.display = "none";
        }
      }
    }
  }
  else {
    for (hang = 1; hang < 11; hang++) {
      var listpaihang1icon = obj("listpaihang2icon" + hang);
      if (listpaihang1icon) {
        var listpaihang1conblck = obj("listpaihang2conblck" + hang);
        if (hang == pai) {
          listpaihang1icon.className = "on";
          listpaihang1conblck.style.display = "";
        }
        else {
          listpaihang1icon.className = "";
          listpaihang1conblck.style.display = "none";
        }
      }
    }
  }
}
//收藏 
function shoucang() {
  var ProId = obj('Hi_PId');
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=collection&PId=" + ProId.value + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      if (data == "1") {
        alert("成功加入收藏夹！");
      }
      else if (data == "2") {
        window.parent.location = 'Login.html?pageurl=ProductShow-' + obj('Hi_PId').value + '.html';
      }
      else if (data == "3") {
        alert("收藏夹已经有此商品!");
      }
      else if (data == "4") {
        alert("未找到该商品!");
      }
    }
  });
}
//配套产品   
function sumprice() {
  var shussd = 0;
  var cbs = objs('goods');
  for (var i = 0; i < cbs.length; i++) {
    if (cbs[i].checked) {
      shussd += parseFloat(cbs[i].value);
    }
  }
  obj('Countss').innerHTML = shussd.toFixed(2);
}
function ptaddcart() {
  var v = "";
  var arraypeitao = objs('goods');
  for (var shu = 0; shu < arraypeitao.length; shu++) {
    if (arraypeitao[shu].checked) {
      v += ";" + arraypeitao[shu].id;
    }
  }
  //v+=";"+obj('Hi_PId').value+","+obj('Hi_XId').value;
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=addcarts&ps=" + v + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      showcart();
      addsuccess();
    }
  });
}
//全部评价  分页
function commentallpage(vpage) {
  obj('Y_Foot_Page1').innerHTML = "<img alt=\"请稍候\" src=\"images/loading.gif\" style=\"margin-left:350px;\" />";
  var ProId = obj('Hi_PId');
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=CommentPage&VPage=" + vpage + "&PId=" + ProId.value + "&stype=0&click=commentallpage&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      obj('Y_Foot_Page1').innerHTML = data;
    }
  });
}
//咨询分页
function zxpage(vpage) {
  obj('Y_Foot_Page2').innerHTML = "<img alt=\"请稍候\" src=\"images/loading.gif\" style=\"margin-left:340px;\" />";
  var ProId = obj('Hi_PId');
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=ZXPage&VPage=" + vpage + "&PId=" + ProId.value + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      obj('Y_Foot_Page2').innerHTML = data;
    }
  });
}
//购买记录分页
function buynotepage(vpage) {
  obj('divbuynote').innerHTML = "<img alt=\"请稍候\" src=\"images/loading.gif\" style=\"margin-left:340px;\" />";
  var ProId = obj('Hi_PId');
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=BuyNotePage&VPage=" + vpage + "&PId=" + ProId.value + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      obj('divbuynote').innerHTML = data.toString().split(';;;;;')[0];
      obj('divbuynotepage').innerHTML = data.toString().split(';;;;;')[1];
    }
  });
}
//显示评价框
function showaddcomment(v) {
  var user = obj('ztop1_Hi_MemberId');
  if (user.value == '0') {
    window.location = 'Login.html?pageurl=ProductShow-' + v + '.html';
  }
  else {
    obj('guandeng').style.display = "";
    var gaodu = document.documentElement.scrollTop + document.body.scrollTop;
    obj('addcomment').style.top = (gaodu + 200) + 'px';
    obj('addcomment').style.display = "";
    obj('if_comment').src = "iframe/Comment.aspx?pid=" + v + "&n=" + Math.random();
  }
}
//隐藏评价框
function addcommentdivhidden() {
  obj('guandeng').style.display = "none";
  obj('addcomment').style.display = "none";
}
//显示咨询框
function showaddadvisory() {
  var user = obj('ztop1_Hi_MemberId');
  if (user.value == '0') {
    window.location = 'Login.html?pageurl=ProductShow-' + obj('Hi_PId').value + '.html';
  }
  else {
    obj('guandeng').style.display = "";
    var gaodu = document.documentElement.scrollTop + document.body.scrollTop;
    obj('addadvisory').style.top = (gaodu + 200) + 'px';
    obj('addadvisory').style.display = "";
    obj('if_advisory').src = "iframe/Advisory.aspx?pid=" + obj('Hi_PId').value + "&n=" + Math.random();
  }
}
//隐藏咨询框
function addadvisorydivhidden() {
  obj('guandeng').style.display = "none";
  obj('addadvisory').style.display = "none";
}
//咨询提交
function commentsubmit() {
  if (obj("t_content").value == "文明上网，理志发言。" || obj("t_content").value.toString() == "") {
    obj('t_content').focus();
    obj('t_content').style.border = "solid 1px red";
    return false;
  }
}
function changecolor(v, v2, v3) {
  if (v2 == 0) {
    //obj(v).style.border="solid 1px red"; 
    //obj(v).style.borderTop="solid 2px red";   
    obj('li_tixing').innerHTML = v3;
  }
  else {
    //obj(v).style.border="solid 1px #bfbfbf";  
    // obj(v).style.borderTop="solid 2px #bfbfbf";   
    obj('li_tixing').innerHTML = "&nbsp;";
  }
}
//登录
function GetLogin() {
  if (obj("text_username").value == "用户名" || obj("text_username").value.toString() == "") {
    obj('text_username').focus();
    changecolor('div_username', 0, "请输入用户名！");
    return false;
  }
  if (obj("TB_pwd").value == "") {
    obj('text_pwd').style.display = 'none';
    obj('TB_pwd').style.display = '';
    obj('TB_pwd').focus();
    changecolor('div_pwd', 0, "请输入密码！");
    return false;
  }
  if (obj("text_v")) {
    if (obj("text_v").value == "验证码" || obj("text_v").value.toString() == "") {
      obj('text_v').focus();
      changecolor('div_checkcode', 0, "请输入验证码！");
      return false;
    }
  }
  //    obj('IBt_Login').innerHTML="正在登录…";
}
//选择注册方式
function nametype(v) {
  if (v == 0) {
    obj('li_mail').style.display = 'none';
    obj('li_phone').style.display = '';
    obj('text_regphone').focus();
  }
  else {
    obj('li_phone').style.display = 'none';
    obj('li_mail').style.display = '';
    obj('text_regmail').focus();
  }
  obj('Hi_RegWay').value = v;
}
function checkonsubmit() {
  if (!obj("cb_Agreement").checked) {
    alert("很抱歉，若要注册为本网站会员，您必须同意会员注册协议！");
    return false;
  }
  //    if (obj("text_regmail").value.toString() == "" || obj('text_regmail').value == "邮箱/手机") {
  //        obj("text_regmail").focus();
  //        changecolor('div_regmail', 0, "请输入用户名！", 'li_tixing2');
  //        return false;
  //        }
  if (obj("text_regmail").value.toString() == "") {
    obj("text_regmail").focus();
    changecolor('div_regmail', 0, "请输入用户名！", 'li_tixing2');
    return false;
  }
  if (reg.test(obj("text_regmail").value.toString()) == false && reg3.test(obj('text_regmail').value) == false) {
    obj("text_regmail").select();
    changecolor('div_regmail', 0, "用户名格式有误！", 'li_tixing2');
    return false;
  }
  //    if (reg3.test(obj("text_regmail").value.toString()) == false) {
  //        obj("text_regmail").select();
  //        changecolor('div_regmail', 0, "用户名格式有误！", 'li_tixing2');
  //        return false;
  //    }
  if (obj('Hi_Repeat').value == "1") {
    obj("text_regmail").select();
    changecolor('div_regmail', 0, obj("text_regmail").value + "已存在！", 'li_tixing2');
    return false;
  }

  if (obj("pwd_regpwd").value.toString() == "") {
    obj('pwd_regpwd').style.display = '';
    obj("pwd_regpwd").focus();
    obj('text_regpwd').style.display = 'none';
    changecolor('div_regpwd', 0, "请输入密码！");
    return false;
  }
  if (obj("pwd_regpwd").value.length < 6 || obj("pwd_regpwd").value.length > 21) {
    obj('pwd_regpwd').style.display = '';
    obj("pwd_regpwd").select();
    obj('text_regpwd').style.display = 'none';
    changecolor('div_regpwd', 0, "密码长度在6至21位之间！");
    return false;
  }
  if (obj("pwd_regpwdok").value.toString() == "") {
    obj('pwd_regpwdok').style.display = '';
    obj("pwd_regpwdok").focus();
    obj('text_regpwdok').style.display = 'none';
    changecolor('div_regpwdok', 0, "请再次输入密码！");
    return false;
  }
  if (obj("pwd_regpwd").value.toString() != obj("pwd_regpwdok").value.toString()) {
    obj('pwd_regpwdok').style.display = '';
    obj("pwd_regpwdok").select();
    obj('text_regpwdok').style.display = 'none';
    changecolor('div_regpwdok', 0, "两次输入的密码不同！");
    return false;
  }
  if (obj('text_regcheckcode').value == "" || obj('text_regcheckcode').value == "验证码") {
    obj("text_regcheckcode").focus();
    changecolor('div_regcheckcode', 0, "请输入验证码！");
    return false;
  }
  obj('IBt_Register').innerHTML = "正在注册…";
}
function addcart(v, n, x, v1, v2, v3) {
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=addcart&PId=" + v + "&Number=" + n + "&pcolor=" + x + "&cs1=" + v1 + "&cs2=" + v2 + "&cs3=" + v3 + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      if (data == "1") {
        showcart();
        addsuccess();
      }
      else {
        alert("发生意外！");
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
  var cs = "PageType=showcart&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      //alert(data.toString().split(';;;;;')[0]);
      //obj('shopcarboxcons').innerHTML = data.toString().split(';;;;;')[0];
      //obj('span_count').innerHTML = data.toString().split(';;;;;')[1];
      obj('span_minicartnumber').innerHTML = data.toString().split(';;;;;')[1];
      obj('eCartCount').innerHTML = data.toString().split(';;;;;')[1]; ;
    }
  });
}
function managepnumber(ntype, mtype, wz, pid, nub, colorx, v1, v2, v3) {
  var rand = Math.floor(Math.random() * 1000000);
  var cs = "PageType=" + mtype + "&PId=" + pid + "&Number=" + nub + "&colorx=" + colorx + "&cs1=" + v1 + "&cs2=" + v2 + "&cs3=" + v3 + "&n=" + rand;
  $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
    success: function (data) {
      if (data != "") {
        obj('hi_pnumber' + wz).value = data.toString().split(',')[0];
        if (ntype == 1) {
          obj('pnumber' + wz).value = data.toString().split(',')[0];
        }
        //            obj('span_money'+wz).innerHTML="￥"+data.toString().split(',')[1].replace(".00","");
        obj('span_sum').innerHTML = data.toString().split(',')[2].replace(".00", "");
        obj('F_priceall_a').innerHTML = data.toString().split(',')[3].replace(".00", "");
        obj('F_priceall_b').innerHTML = data.toString().split(',')[4].replace(".00", "");
        var rand1 = Math.floor(Math.random() * 1000000);
        var cs1 = "PageType=showcart&n=" + rand1;
        $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs1,
          success: function (data) {
            obj('eCartCount').innerHTML = data.toString().split(';;;;;')[1]; ;
          }
        });
      }
      else {
        alert('发生意外!');
      }
    }
  });
}
function blurpnumber(wz, pid, colorx, v1, v2, v3) {
  var number = obj('pnumber' + wz);
  var hi_number = obj('hi_pnumber' + wz);
  if (parseInt(number.value) < 1) {
    alert('商品数量至少为1!');
    number.value = hi_number.value;
  }
  else {
    if (parseInt(number.value) < parseInt(hi_number.value)) {
      var cha = parseInt(hi_number.value) - parseInt(number.value);
      managepnumber(0, 'cartsubproduct', wz, pid, cha, colorx, v1, v2, v3);
    }
    else {
      var cha = parseInt(number.value) - parseInt(hi_number.value);
      managepnumber(0, 'cartaddproduct', wz, pid, cha, colorx, v1, v2, v3);
    }
  }
}
function checkaddress(ytype) {
  if (ytype == 1) {
    obj('div_address1').style.display = "";
    obj('div_address0').style.display = "none";
  }
  else {
    obj('div_address1').style.display = "none";
    obj('div_address0').style.display = "";
    obj('if_address').src = "iframe/ReceiveAddress.aspx?aid=" + obj('Hi_AddressId').value + "&ctype=2&n=" + Math.random();
  }
}
function checkpay(ytype) {
  document.getElementById('pay1').style.display = "";
  document.getElementById('pay0').style.display = "";
  document.getElementById('pay' + ytype).style.display = "none";
}
function change() {
  var pays = document.getElementsByName('payway');
  //            alert("e");
  for (var i = 0; i < pays.length; i++) {
    //            alert("d");
    if (pays[i].checked) {
      //            alert("c");
      obj('span_payway').innerHTML = pays[i].value.split(',')[0];
      obj('input_payway').value = pays[i].value.split(',')[0];
      obj('lb_paywaybz').innerHTML = pays[i].value.split(',')[1];
      //            alert("b");
      //            alert("a");
    }
  }
  var pays2 = objs('pay_bank');
  for (var i = 0; i < pays2.length; i++) {
    pays2[i].checked = false;
  }
}
function checkway(ytype) {
  document.getElementById('way1').style.display = "";
  document.getElementById('way2').style.display = "";
  document.getElementById('way' + ytype).style.display = "none";
}
function okway() {
  var ways = document.getElementsByName('way');
  for (var i = 0; i < ways.length; i++) {
    if (ways[i].checked) {
      var psfs = ways[i].value.split(',')[0];
      var psje = ways[i].value.split(',')[1];
      var sfcx = ways[i].value.split(',')[2];
      document.getElementById('lb_Way').innerHTML = psfs;
      document.getElementById('input_Way').value = psfs;
      document.getElementById('lb_peisongfei').innerHTML = psje;
      document.getElementById('input_peisongfei').value = psje;
      var money = parseFloat(document.getElementById('label1').innerHTML.toString().replace('￥', ''));
      var money2 = parseFloat(psje.replace('￥', ''));
      var money3 = obj('input_coupon') ? parseFloat(obj('input_coupon').value.toString().replace('￥', '')) : 0;
      var money4 = obj('lb_discount') ? parseFloat(obj('lb_discount').innerHTML) : 0;
      var money5 = obj('lb_mpeisongfei') ? parseFloat(obj('lb_mpeisongfei').innerHTML.toString().replace('￥', '')) : 0;
      //                            if(sfcx=="0")
      //                            {
      //                                document.getElementById('Hi_PSSales').value="0";
      //                                if(document.getElementById('Hi_peisong').value=="1")
      //                                {
      //                                    document.getElementById('lb_mpeisongfei').innerHTML=psje; 
      //                                    document.getElementById('input_mpeisongfei').value=psje;
      //                                    document.getElementById('span1').innerHTML="￥"+money;
      //                                }
      //                                else
      //                                {
      //                                    document.getElementById('lb_mpeisongfei').innerHTML="￥0";
      //                                    document.getElementById('input_mpeisongfei').value="0";
      //alert(money +"-"+ money2 +"-"+ money3 +"-"+ money4);
      document.getElementById('span1').innerHTML = "￥" + (money + money2 - money3 - money4 - money5);
      mianyunfei();
      //                                }
      //                            }
      //                            else
      //                            {
      ////                                document.getElementById('Hi_PSSales').value="1";
      //                                document.getElementById('lb_mpeisongfei').innerHTML="￥0";
      //                                document.getElementById('input_mpeisongfei').value="0";
      //                                document.getElementById('span1').innerHTML="￥"+(money+money2);                        
      //                            }
    }
  }
}
function mianyunfei() {
  if (obj('Hi_mianyunfei').value == "1") {

    //obj('lb_mpeisongfei').innerHTML = obj('input_peisongfei').value.toString().replace('￥', '');
    obj('lb_peisongfei').innerHTML = "0";
    var money = parseFloat(document.getElementById('span1').innerHTML.toString().replace('￥', ''));
    var money2 = parseFloat(obj('input_peisongfei').value.toString().replace('￥', ''));
    var ddss = Math.round((money - money2) * 100) / 100;
    document.getElementById('span1').innerHTML = "￥" + (ddss);
  }
}
function checktime(ytype) {
  document.getElementById('time1').style.display = "";
  document.getElementById('time2').style.display = "";
  document.getElementById('time' + ytype).style.display = "none";
}
function oktime() {
  var times = objs('time');
  for (var i = 0; i < times.length; i++) {
    if (times[i].checked) {
      document.getElementById('lb_Time').innerHTML = times[i].value;
      document.getElementById('input_Time').value = times[i].value;

    }
  }
}
function changeimg(img) {
  var pays = objs('pay_bank');
  for (var i = 0; i < pays.length; i++) {
    if (pays[i].checked) {
      obj('span_payway').innerHTML = "<img src='alipay/images/" + img + ".gif' />";
      obj('input_payway').value = pays[i].value;
      obj('lb_paywaybz').innerHTML = "由支付宝提供接口，确保您的资金安全。";
    }
  }
  var pays2 = objs('payway');
  for (var i = 0; i < pays2.length; i++) {
    pays2[i].checked = false;
  }
}
function CheckSubmit() {
  if (obj("text_shouhuoren").value == "") {
    alert("请填写收货人!");
    obj("text_shouhuoren").focus();
    return false;
  }
  if (obj("text_dianziyoujian").value != "") {
    if (reg.test(obj("text_dianziyoujian").value) == false) {
      alert('邮箱格式有误!');
      obj("text_dianziyoujian").focus();
      return false;
    }
  }
 // if (obj("text_shoujihaoma").value == "") {
//    alert("请填写手机号!");
//    obj("text_shoujihaoma").focus();
//    return false;
//  }

//  if (reg2.test(obj("text_shoujihaoma").value) == false) {
//    alert('手机号码格式有误!');
//    obj("text_shoujihaoma").focus();
//    return false;
//  }
  if (obj("text_gudingdianhua").value == "") {
    alert("请填写电话!");
    obj("text_gudingdianhua").focus();
    return false;
  }

  if (obj('ddl_guojia').value == "0") {
    obj("ddl_guojia").focus();
    alert("请选择国家!");
    return false;
  }
  // alert(obj('ddl_guojia').value);
  //  if (obj('ddl_sheng').value == "0") {
  //    obj("ddl_sheng").focus();
  //    alert("请选择省份!");
  //    return false;
  //  }
  //  if (obj('ddl_shi').value == "0") {
  //    obj("ddl_shi").focus();
  //    alert("请选择城市!");
  //    return false;
  //  }
  //  if (obj('ddl_qu').value == "0") {
  //    obj("ddl_qu").focus();
  //    alert("请选择地区!");
  //    return false;
  //  }
  if (obj("text_shouhuodizhi").value == "") {
    alert("请填写详细地址!");
    obj("text_shouhuodizhi").focus();
    return false;
  }
  //   if (obj("text_shoujihaoma").value == "" && obj("text_gudingdianhua").value == "")
  //   {
  //        obj("text_shoujihaoma").focus();
  //        alert("手机号和电话必须填写一项!");
  //        return false;
  //   }

}
function fapiaochange() {
  if (obj('cb_fapiao').checked) {
    obj('dl_fapiao1').style.display = '';
    obj('dl_fapiao2').style.display = '';
  }
  else {
    obj('dl_fapiao1').style.display = 'none';
    obj('dl_fapiao2').style.display = 'none';
  }
}
function okaddress() {
  if (obj('Hi_AddressId').value == "0") {
    alert("请选择收货地址！");
    if (obj('div_address1') && obj('div_address0')) {
      if (obj('div_address1').style.display == 'none') {
        obj('div_address0').focus();
      }
      else {
        obj('div_address1').focus();
      }
    }
    else {
      obj('updateaddress').focus();
    }
    return false;
  }
  if (obj('dl_fapiao2').style.display != 'none' && obj('text_fapiaotaitou').value == "") {
    alert("请填写发票抬头！");
    obj('text_fapiaotaitou').focus();
    return false;
  }
  document.getElementById('Bt_SubmitOrder').style.visibility = 'hidden';
}
function updatepwd() {
  if (document.getElementById("text_pwd1").value.toString() == "") {
    alert("请输入旧密码!");
    document.getElementById("text_pwd1").focus();
    return false;
  }
  if (document.getElementById("text_pwd2").value.toString() == "") {
    alert("请输入新密码!");
    document.getElementById("text_pwd2").focus();
    return false;
  }
  if (document.getElementById("text_pwd3").value.toString() == "") {
    alert("请再输入一次新密码!");
    document.getElementById("text_pwd3").focus();
    return false;
  }
  if (document.getElementById("text_pwd3").value.toString() != document.getElementById("text_pwd2").value.toString()) {
    alert("两次输入的新密码不一致!");
    document.getElementById("text_pwd2").focus();
    return false;
  }
  if (document.getElementById("text_pwd2").value.length < 6 || document.getElementById("text_pwd2").value.length > 21) {
    alert("密码长度在6至21位之间!");
    document.getElementById("text_pwd2").focus();
    return false;
  }
}

function checkyuyue() {
  if (obj("text_name").value == "") {
    alert("请填写姓名!");
    obj("text_name").focus();
    return false;
  }
  if (obj("text_phone").value == "") {
    alert("请填写手机号!");
    obj("text_phone").focus();
    return false;
  }
  if (reg2.test(obj("text_phone").value) == false) {
    alert('手机号码格式有误!');
    obj("text_phone").focus();
    return false;
  }
  if (obj("area_content").value == "") {
    alert("请填写投诉内容!");
    obj("area_content").focus();
    return false;
  }
  //   if(obj('text_email').value!=""&&reg.test(obj("text_email").value)==false)
  //   {
  //        obj("text_email").focus(); 
  //        alert('邮箱格式有误!');    
  //        return false;     
  //   }
  if (!window.confirm("确认提交？")) {
    return false;
  }
}
function product_duoxuan() {
  var cbs = objs('cb_duoxuan');
  var cbs2 = objs('cb_duoxuanbrand');
  //    var as = objs('a_duoxuan');
  if (obj('a_duoxuan').innerHTML == "多选") {
    obj('a_duoxuan').innerHTML = "单选";
    obj('div_duoxuan').style.display = "";
    for (var i = 0; i < cbs.length; i++) {
      cbs[i].style.display = "";
      //            as[i].click = "javascript:return false;";
      //            alert(as[i].id);
    }
    for (var i = 0; i < cbs2.length; i++) {
      cbs2[i].style.display = "";
    }
  }
  else {
    obj('a_duoxuan').innerHTML = "多选";
    obj('div_duoxuan').style.display = "none";
    for (var i = 0; i < cbs.length; i++) {
      cbs[i].style.display = "none";
      //            as[i].click = function () {
      //                return true;
      //            }
    }
    for (var i = 0; i < cbs2.length; i++) {
      cbs2[i].style.display = "none";
    }
  }
}
function button_duoxuan() {
  var s = "";
  var sid1 = "";
  var cbs = objs('cb_duoxuan');
  for (var i = 0; i < cbs.length; i++) {
    if (cbs[i].checked) {
      var sid = cbs[i].id.replace("cb_duoxuan", "");
      if (sid != sid1) {
        s += "|" + sid + "," + cbs[i].value;
      }
      else {
        s += "," + cbs[i].value;
      }
      sid1 = sid;
    }
  }
  var sb = "";
  if (obj('Hi_Brand').value != "" && obj('Hi_Brand').value != "0") {
    sb = obj('Hi_Brand').value;
  }
  else {
    var cbs2 = objs('cb_duoxuanbrand');
    for (var i = 0; i < cbs2.length; i++) {
      if (cbs2[i].checked) {
        sb += "," + cbs2[i].value;
      }
    }
  }
  window.location = "Product.html?category=" + obj('Hi_Category').value + "&brand=" + sb + "&cs=" + obj('Hi_cs').value + s + "&sort=" + obj('Hi_Sort').value + "&sortfx=" + obj('Hi_SortFX').value + "&pageindex=1";
}
function button_duoxuan1() {
  var s = "";
  var sid1 = "";
  var cbs = objs('cb_duoxuan');
  for (var i = 0; i < cbs.length; i++) {
    if (cbs[i].checked) {
      var sid = cbs[i].id.replace("cb_duoxuan", "");
      if (sid != sid1) {
        s += "|" + sid + "," + cbs[i].value;
      }
      else {
        s += "," + cbs[i].value;
      }
      sid1 = sid;
    }
  }
  var sb = "";
  if (obj('Hi_Brand').value != "" && obj('Hi_Brand').value != "0") {
    sb = obj('Hi_Brand').value;
  }
  else {
    var cbs2 = objs('cb_duoxuanbrand');
    for (var i = 0; i < cbs2.length; i++) {
      if (cbs2[i].checked) {
        sb += "," + cbs2[i].value;
      }
    }
  }
  window.location = "Search.html?category=" + obj('Hi_Category').value + "&brand=" + sb + "&cs=" + obj('Hi_cs').value + s + "&sort=" + obj('Hi_Sort').value + "&sortfx=" + obj('Hi_SortFX').value + "&keyword=" + obj('Hi_Keyword').value + "&pageindex=1";
}
function CheckInfo() {
  if (obj("text_RealName").value == "") {
    alert("请填写客户名称!");
    obj("text_RealName").focus();
    return false;
  }
  //  if (obj('ddlsheng').value == "0") {
  //    obj("ddlsheng").focus();
  //    alert("请选择省份!");
  //    return false;
  //  }
  //  if (obj('ddlshi').value == "0") {
  //    obj("ddlshi").focus();
  //    alert("请选择城市!");
  //    return false;
  //  }
  //  if (obj('ddlqu').value == "0") {
  //    obj("ddlqu").focus();
  //    alert("请选择地区!");
  //    return false;
  //  }
  if (obj("text_Address").value == "") {
    alert("请填写详细地址!");
    obj("text_Address").focus();
    return false;
  }
  //   if (obj("text_shoujihaoma").value == "" && obj("text_gudingdianhua").value == "")
  //   {
  //        obj("text_shoujihaoma").focus();
  //        alert("手机号和电话必须填写一项!");
  //        return false;
  //   }
  if (obj("text_Mobile").value == "") {
    alert("请填写手机号!");
    obj("text_Mobile").focus();
    return false;
  }
  //   if(obj("text_shoujihaoma").value != "")
  //   { 
  if (reg2.test(obj("text_Mobile").value) == false) {
    alert('手机号码格式有误!');
    obj("text_Mobile").focus();
    return false;
  }
  //   }

  if (obj("text_Call").value != "") {
    if (reg4.test(obj("text_Call").value) == false) {
      alert('固话格式有误!');
      obj("text_Call").focus();
      return false;
    }
  }
  if (obj("text_Email").value != "") {
    if (reg.test(obj("text_Email").value) == false) {
      alert('邮箱格式有误!');
      obj("text_Email").focus();
      return false;
    }
  }

}