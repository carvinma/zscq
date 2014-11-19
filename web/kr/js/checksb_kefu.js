//验证수자만 입력해주세요或是字母
function checkBianhao(ob) {
    var obj =$("#"+ob);
    if (obj.val().match(/[^A-Za-z0-9]/ig)) {
        return false;
    }
    return true;
}
var reg = /^([a-zA-Z0-9]+[-\_\_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
var reg3 = /^[a-zA-Z0-9_]{4,20}$/;
var reg4 = /^(\d{3,4}-)?\d{7,8}$/;
var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;//身份证
function Checkadd() {
    var isok = true;

    //客户信息
    if ($("#Txt_UserAccount").val() == "") {
        alert('고객 번호 입력하십시오.');
        isok = false;
        $("#Txt_UserAccount").focus();
        return isok;
    }
    else {
        $.ajax({
            type: "post",
            async: false,
            url: "../Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=name&membertype=2&uName=" + $("#Txt_UserAccount").val(),
            success: function (msg) {
                if (msg == "1") {
                    alert("이미  존제한 명칭입니다！");
                    return false;
                }
            }
        });
    } 
    
    if ($("#Txt_UserPassword").val() == "") {
        alert("비밀번호 입력해주세요!");
        isok = false;
        $("#Txt_UserPassword").focus();
        return isok;
    }
   
    if ($("#Txt_UserPassword2").val() == "") {
        alert("부디 다시 암호를 입력하십시오!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Txt_UserPassword2").val() != $("#Txt_UserPassword").val()) {
        alert("두 번 입력한 새 암호 불일치!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Txt_UserPassword2").val().length < 6 || $("#Txt_UserPassword2").val().length > 21) {
        alert("비밀번호 길이 여섯 ~ 21 분 사이에!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Drp_GuoJi").val() == "0" ) {
        alert("위치 주소를 선택하세요！");
        isok = false; $("#Drp_GuoJi").focus();
        return isok;
    }
    if ($("#text_Address").val() == "") {

        alert("전체 주소를 입력하십시오！");
        isok = false; $("#text_Address").focus(); return isok;

    }
    if ($("#c_Name").val() == "") {
        alert('실제 이름을 입력하십시오.');
        isok = false; $("#c_Name").focus(); return isok;
    }
    //国际 中国判断和英文
    if ($("#hi_guoji").val() == "1") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_Idcard").val() == "") {
                alert('신분증 번호를 입력하십시오.！');
                isok = false; $("#c_Idcard").focus(); return isok;
            }
            else {
                var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;
                if (!partten.test($("#c_Idcard").val())) {
                    alert("신분증 번호 잘못된！");
                    isok = false; $("#c_Idcard").focus(); return isok;
                }
            }
        }
    }
    if ($("#hi_usertype").val() == "2") {
        if ($("#c_company").val() == "") {
            alert("회사 이름 적어 주세요！");
            isok = false; $("#c_company").focus(); return isok;
        }

    }
    if ($("#hi_usertype").val() == "3") {
        if ($("#c_dailiName").val() == "") {
            isok = false;
            alert("대리 조직 이름을 입력하십시오.");
            $("#c_dailiName").focus();
            return isok;
        }
    }
    //国际 国外判断和英文
    if ($("#hi_guoji").val() == "0") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_youxiao").val() == "") {
                alert('유효한 증명서를 입력하십시오.');
                isok = false; $("#c_youxiao").focus(); return isok;
            }
            else {
                if (!$("#c_youxiao").val().match("^[0-9]*$")) {
                    alert("수자만 입력해주세요！");
                    isok = false; $("#c_youxiao").focus(); return isok;
                }
            }
            if ($("#c_NameEn").val() == "") {
                isok = false;
                alert("연락처 영어 이름을 입력하십시오.");
                $("#c_NameEn").focus(); return isok;

            }
            if ($("#c_addressEn").val() == "") {
                alert('연락처 영어 주소를 입력하십시오.');
                isok = false; $("#c_addressEn").focus(); return isok;
            }
            else {
                if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
                    alert("입력 영어 수밖에 없다！");
                    isok = false; $("#c_addressEn").focus(); return isok;
                }
            }
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

    if ($("#c_youbian").val() == "") {
        isok = false;
        alert('연락처 우편번호 입력하십시오.！');
        $("#c_youbian").focus();
        return isok;
    }
    else {
       
        if (!$("#c_youbian").val().match("^[0-9]*$")) {
            alert("수자만 입력해주세요！");
            isok = false; $("#c_youbian").focus(); return isok;
        }
    }
    if ($("#c_phone").val() == "") {
        isok = false;
        alert('연락처 핸드폰 입력하십시오.！');
        $("#c_phone").focus();
        return isok;
    }
    else {

        if (reg2.test($("#c_phone").val()) == false) {
            alert('핸드폰 번호 형식 잘못된!');
            $("#c_phone").focus();
            isok = false;
            return isok;
        }
        else {
            var lname = $("#c_phone").val();
            var rand = Math.floor(Math.random() * 1000000);
            alert(lname);
            $.ajax({
                type: "post",
                async: false,
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=phone&membertype=2&uName=" + lname + "&n=" + rand,
                success: function (msg) {
                    if (msg == "1") {
                        alert("이 핸드폰 번호 이미 등록！");
                        $("#c_phone").focus();
                    }
                }
            });
        }
    }

    //    if ($("#text_Call").val() == "") {
    //        isok = false;
    //        alert('请输入联系人电话！');
    //        $("#text_Call").focus();
    //        return isok;
    //    }
    //    else {
    if ($("#text_Call").val() != "") {
        if (reg4.test($("#text_Call").val()) == false) {
            alert("입력하십시오. 정확한 전화 형식！");
            isok = false;
            $("#text_Call").focus();
            return isok;
        }
    }
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
            var rand = Math.floor(Math.random() * 1000000);
            $.ajax({
                type: "post",
                async: false,
                url: "../Handler.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=email&membertype=2&uName=" + lname + "&n=" + rand,
                success: function (msg) {
                    if (msg == "1") {
                        alert("이 메일 이미 등록！");
                        $("#text_Email").focus();
                    }
                }
            });
        }
       
    }
    if ($("#text_chuanzhen").val() != "") {
        if ($("#text_chuanzhen").val().match(/\D\-/g)) {
            alert("팩스 형식이 잘못되었습니다.！");
            isok = false; $("#text_chuanzhen").focus(); return isok;
        }
    }
    if ($("#hi_guoji").val() == "1") {
        if ($("#text_QQ").val() != "") {
            if ($("#text_QQ").val().match(/\D/g)) {
                alert("수자만 입력해주세요！");
                isok = false; $("#text_QQ").focus(); return isok;
            }
        }
    } else {
        if ($("#text_msn").val() != "") {
            // var reg = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/;
            //var reg = /[^u4e00-u9fa5]/; //禁止输入中文
            if ($("#text_msn").val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                alert("Msn 잘못된 입력！");
                isok = false; $("#text_msn").focus(); return isok;
            }
        }
    }
 
    return isok;
}