//验证수자만 입력해주세요或是字母
function checkBianhao(ob) {
    var obj = $("#" + ob);
    if (obj.val().match(/[^A-Za-z0-9]/ig)) {
        return false;
    }
    return true;
}
var reg = /^([a-zA-Z0-9]+[-\_\_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
var reg3 = /^[a-zA-Z0-9_]{4,20}$/;
var reg4 = /^(\d{3,4}-)?\d{7,8}$/;
var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/; //身份证
function Checkadd() {
    var isok = true;

    //客户信息
    if ($("#c_Name").val() == "") {
        alert('실제 이름을 입력하십시오.');
        isok = false; $("#c_Name").focus(); return isok;
    }

    //国际 中国判断和英文
    if ($("#hi_guoji").val() == "1") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_Idcard").val() == "") {
                alert('유효한 증명서를 번호를 입력하십시오.！');
                isok = false; $("#c_Idcard").focus(); return isok;
            }
            else {
                var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;
                if (!partten.test($("#c_Idcard").val())) {
                    alert("유효 여권번호 잘못된！");
                    isok = false; $("#c_Idcard").focus(); return isok;
                }
            }
        }
    }
    //if ($("#hi_usertype").val() == "2") {
   //     if ($("#c_company").val() == "") {
    //        alert("请填写公司名称！");
     //       isok = false; $("#c_company").focus(); return isok;
     //   }

    //}
    if ($("#hi_usertype").val() == "3") {
        if ($("#c_dailiName").val() == "") {
            isok = false;
            alert("대리 조직 이름을 입력하십시오.！");
            $("#c_dailiName").focus();
            return isok;
        }
    }
    // alert($("#hi_guoji").val());
    //国际 国外判断和英文
    if ($("#hi_guoji").val() == "0") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_youxiao").val() == "") {
                alert('유효한 증명서를 입력하십시오.');
                isok = false; $("#c_youxiao").focus(); return isok;
            }
            else {
                if ($("#c_youxiao").val().match(/\D/g)) {
                    alert("수자만 입력해주세요！");
                    isok = false; $("#c_youxiao").focus(); return isok;
                }
            }
            if ($("#c_NameEn").val() == "") {
                isok = false;
                alert("연락처 영어 이름을 입력하십시오.");
                $("#c_NameEn").focus(); return isok;

            }
            //if ($("#c_addressEn").val() == "") {
//                alert('연락처 영어 주소를 입력하십시오.');
//                isok = false; $("#c_addressEn").focus(); return isok;
//            }
//            else {
//                if ($("#c_addressEn").val().match(/[^a-zA-Z0-9]/g)) {
//                    alert("영문, 숫자 못 입력！");
//                    isok = false; $("#c_addressEn").focus(); return isok;
//                }
//            }
        }
        if ($("#hi_usertype").val() == "2") {
            if ($("#c_companyEn").val() == "") {
                alert("회사 영어 이름 적어 주세요！");
                isok = false; $("#c_companyEn").focus(); return isok;
            }
            if ($("#c_addressEn").val() == "") {
                alert('연락처 영어 주소를 입력하십시오.！');
                isok = false; $("#c_addressEn").focus(); return isok;
            }
            else {
                if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
                    alert("입력 영어 수밖에 없다！");
                    isok = false; $("#c_addressEn").focus(); return isok;
                }
            }
        }
    }

     //  if ($("#c_youbian").val() == "") {
   //     isok = false;
   //     alert('请输入联系人郵便番号！');
   //     $("#c_youbian").focus();
   //     return isok;
   // }
  //  else {
     //   if ($("#c_youbian").val().match(/\D/g)) {
     //       alert("数値のみを記入してください！");
     //       isok = false; $("#c_youbian").focus(); return isok;
     //   }
   // }
    if ($("#c_phone").val() == "") {
        //isok = false;
//        alert('请输入联系人手机！');
//        $("#c_phone").focus();
//        return isok;
    }
    else {

        if (reg2.test($("#c_phone").val()) == false) {
            alert('핸드폰 번호 형식 잘못된!');
            $("#c_phone").focus();
            isok = false;
            return isok;
        }
        else {
            var id = $("#Hi_MemberId").val();
            var lname = $("#c_phone").val();
            var rand = Math.floor(Math.random() * 1000000);
            $.ajax({
                type: "post",
                async: false,
                url: "Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
                success: function (msg) {
                    if (msg == "1") {
                        alert("이 핸드폰 번호 이미 등록！");
                        $("#c_phone").focus();
                        isok = false;
                        return isok;
                    }

                }
            });
        }
    }

        if ($("#text_Call").val() == "") {
            isok = false;
            alert('연락처 전화 입력하십시오.！');
            $("#text_Call").focus();
            return isok;
        }
 //    else {
    //if ($("#text_Call").val() != "") {
    //    if (reg4.test($("#text_Call").val()) == false) {
    //        alert("请输入正确的电话格式！");
    //        isok = false;
    //        $("#text_Call").focus();
    //        return isok;
     //   }
    //}
		//}
    if ($("#text_Email").val() == "") {
        isok = false;
        alert('연락처 메일로 입력하십시오.');
        $("#text_Email").focus();
        return isok;
    }
    else {
        if (reg.test($("#text_Email").val()) == false) {
            alert('메일함 형태 잘못된!');
            isok = false;
            $("#text_Email").focus(); return isok;
        }
        else {
            var lname = $("#text_Email").val();
            var id = $("#Hi_MemberId").val();
            var rand = Math.floor(Math.random() * 1000000);
            $.ajax({
                type: "post",
                async: false,
                url: "Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=email&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
                success: function (msg) {
                    if (msg == "1") {
                        alert("이 메일 이미 등록！");
                        $("#text_Email").focus();
                        isok = false;
                        return false;
                    }
                }
            });
        }
    }
    //if ($("#text_chuanzhen").val() != "") {
     //   if ($("#text_chuanzhen").val().match(/\D\-/g)) {
     //       alert("传真格式不正确！");
    //        isok = false; $("#text_chuanzhen").focus(); return isok;
    //    }
    //}
    //alert($("#hi_guoji").val());
    if ($("#hi_guoji").val() == "1") {
        if ($("#text_QQ").val() != "") {
            if ($("#text_QQ").val().match(/\D/g)) {
                alert("수자만 입력해주세요！");
                isok = false; $("#text_QQ").focus(); return isok;
            }
        }
    } else {
        // alert("dd");
        if ($("#text_msn").val() != "") {
            // var reg = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/;
            // var reg = /[^u4e00-u9fa5]/;//禁止输入中文
            if ($("#text_msn").val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                alert("Msn 잘못된 입력！");
                isok = false; $("#text_msn").focus(); return isok;
            }
        }
    }
    if ($("#Drp_GuoJi").val() == "0") {
        alert("위치 주소를 선택하세요！");
        isok = false; $("#Drp_GuoJi").focus();
        return isok;
    }
    if ($("#text_Address").val() == "") {
        alert("전체 주소를 입력하십시오！");
        isok = false; $("#text_Address").focus(); return isok;
    }
    return isok;
}