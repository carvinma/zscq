//验证数値のみを記入してください或是字母
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
        alert('请输入客户帐号');
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
                    alert("该このユーザー名が既に存在しています！");
                    return false;
                }
            }
        });
    } 
    
    if ($("#Txt_UserPassword").val() == "") {
        alert("パスワードを記入してください!");
        isok = false;
        $("#Txt_UserPassword").focus();
        return isok;
    }
   
    if ($("#Txt_UserPassword2").val() == "") {
        alert("请再次输入密码!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Txt_UserPassword2").val() != $("#Txt_UserPassword").val()) {
        alert("两次输入的新密码不一致!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Txt_UserPassword2").val().length < 6 || $("#Txt_UserPassword2").val().length > 21) {
        alert("パスワードの長さが6〜21桁の間に!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Drp_GuoJi").val() == "0" ) {
        alert("位置アドレスを選択してください！");
        isok = false; $("#Drp_GuoJi").focus();
        return isok;
    }
    if ($("#text_Address").val() == "") {

        alert("完全なアドレスを入力してください！");
        isok = false; $("#text_Address").focus(); return isok;

    }
    if ($("#c_Name").val() == "") {
        alert('请输入真实姓名');
        isok = false; $("#c_Name").focus(); return isok;
    }
    //国际 中国判断和英文
    if ($("#hi_guoji").val() == "1") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_Idcard").val() == "") {
                alert('请输入身份证号码！');
                isok = false; $("#c_Idcard").focus(); return isok;
            }
            else {
                var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;
                if (!partten.test($("#c_Idcard").val())) {
                    alert("身份证号码有误！");
                    isok = false; $("#c_Idcard").focus(); return isok;
                }
            }
        }
    }
    if ($("#hi_usertype").val() == "2") {
        if ($("#c_company").val() == "") {
            alert("请填写公司名称！");
            isok = false; $("#c_company").focus(); return isok;
        }

    }
    if ($("#hi_usertype").val() == "3") {
        if ($("#c_dailiName").val() == "") {
            isok = false;
            alert("请输入代理组织名称！");
            $("#c_dailiName").focus();
            return isok;
        }
    }
    //国际 国外判断和英文
    if ($("#hi_guoji").val() == "0") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_youxiao").val() == "") {
                alert('请输入有效证件！');
                isok = false; $("#c_youxiao").focus(); return isok;
            }
            else {
                if (!$("#c_youxiao").val().match("^[0-9]*$")) {
                    alert("数値のみを記入してください！");
                    isok = false; $("#c_youxiao").focus(); return isok;
                }
            }
            if ($("#c_NameEn").val() == "") {
                isok = false;
                alert("请输入联系人英文名称！");
                $("#c_NameEn").focus(); return isok;

            }
            if ($("#c_addressEn").val() == "") {
                alert('英語で連絡先アドレスを入力してください。！');
                isok = false; $("#c_addressEn").focus(); return isok;
            }
            else {
                if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
                    alert("あなたは英語だけを入力することができます！");
                    isok = false; $("#c_addressEn").focus(); return isok;
                }
            }
        }
        if ($("#hi_usertype").val() == "2") {
            if ($("#c_companyEn").val() == "") {
                alert("请填写公司英文名称！");
                isok = false; $("#c_companyEn").focus(); return isok;
            }
            if ($("#c_addressEn").val() == "") {
                alert('英語で連絡先アドレスを入力してください。！');
                isok = false; $("#c_addressEn").focus(); return isok;
            }
            else {
                if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
                    alert("あなたは英語だけを入力することができます！");
                    isok = false; $("#c_addressEn").focus(); return isok;
                }
            }
        }
    }

    if ($("#c_youbian").val() == "") {
        isok = false;
        alert('连絡先の郵便番号を入力してください！');
        $("#c_youbian").focus();
        return isok;
    }
    else {
       
        if (!$("#c_youbian").val().match("^[0-9]*$")) {
            alert("数値のみを記入してください！");
            isok = false; $("#c_youbian").focus(); return isok;
        }
    }
    if ($("#c_phone").val() == "") {
        isok = false;
        alert('携帯電話帳を入力してください！');
        $("#c_phone").focus();
        return isok;
    }
    else {

        if (reg2.test($("#c_phone").val()) == false) {
            alert('携帯番号フォーマットの誤りがある!');
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
                        alert("この携帯番号登録済み！");
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
            alert("正しい電話フォーマットを入力してください！");
            isok = false;
            $("#text_Call").focus();
            return isok;
        }
    }
    if ($("#text_Email").val() == "") {
        isok = false;
        alert('连絡先のメールアドレスを入力してください！');
        $("#text_Email").focus();
        return isok;
    }
    else {
        if (reg.test($("#text_Email").val()) == false) {
            alert('メールアドレスフォーマットの誤りがある!');
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
                        alert("このメールアドレスの登録済み！");
                        $("#text_Email").focus();
                    }
                }
            });
        }
       
    }
    if ($("#text_chuanzhen").val() != "") {
        if ($("#text_chuanzhen").val().match(/\D\-/g)) {
            alert("ファックスの形式が正しくありません！");
            isok = false; $("#text_chuanzhen").focus(); return isok;
        }
    }
    if ($("#hi_guoji").val() == "1") {
        if ($("#text_QQ").val() != "") {
            if ($("#text_QQ").val().match(/\D/g)) {
                alert("数値のみを記入してください！");
                isok = false; $("#text_QQ").focus(); return isok;
            }
        }
    } else {
        if ($("#text_msn").val() != "") {
            // var reg = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/;
            //var reg = /[^u4e00-u9fa5]/; //禁止输入中文
            if ($("#text_msn").val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                alert("Msn 入力ミス！");
                isok = false; $("#text_msn").focus(); return isok;
            }
        }
    }
 
    return isok;
}