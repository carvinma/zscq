//验证Enter digits only或是字母
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
        alert('Please enter a customer account');
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
                    alert("该The username was existed already！");
                    return false;
                }
            }
        });
    } 
    
    if ($("#Txt_UserPassword").val() == "") {
        alert("Please enter password!");
        isok = false;
        $("#Txt_UserPassword").focus();
        return isok;
    }
   
    if ($("#Txt_UserPassword2").val() == "") {
        alert("Please enter the password again!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Txt_UserPassword2").val() != $("#Txt_UserPassword").val()) {
        alert("Enter the new password twice inconsistent!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Txt_UserPassword2").val().length < 6 || $("#Txt_UserPassword2").val().length > 21) {
        alert("Password length is between 6 to 21!");
        isok = false;
        $("#Txt_UserPassword2").focus();
        return isok;
    }
    if ($("#Drp_GuoJi").val() == "0" ) {
        alert("Please select location address！");
        isok = false; $("#Drp_GuoJi").focus();
        return isok;
    }
    if ($("#text_Address").val() == "") {

        alert("Please enter the Address！");
        isok = false; $("#text_Address").focus(); return isok;

    }
    if ($("#c_Name").val() == "") {
        alert('Please enter a real name');
        isok = false; $("#c_Name").focus(); return isok;
    }
    //国际 中国判断和英文
    if ($("#hi_guoji").val() == "1") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_Idcard").val() == "") {
                alert('Please enter the ID card number！');
                isok = false; $("#c_Idcard").focus(); return isok;
            }
            else {
                var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;
                if (!partten.test($("#c_Idcard").val())) {
                    alert("ID card number is wrong！");
                    isok = false; $("#c_Idcard").focus(); return isok;
                }
            }
        }
    }
    if ($("#hi_usertype").val() == "2") {
        if ($("#c_company").val() == "") {
            alert("Please enter company name！");
            isok = false; $("#c_company").focus(); return isok;
        }

    }
    if ($("#hi_usertype").val() == "3") {
        if ($("#c_dailiName").val() == "") {
            isok = false;
            alert("Please enter the agent organization name！");
            $("#c_dailiName").focus();
            return isok;
        }
    }
    //国际 国外判断和英文
    if ($("#hi_guoji").val() == "0") {
        if ($("#hi_usertype").val() == "1") {
            if ($("#c_youxiao").val() == "") {
                alert('Please enter Valid certificates！');
                isok = false; $("#c_youxiao").focus(); return isok;
            }
            else {
                if (!$("#c_youxiao").val().match("^[0-9]*$")) {
                    alert("Enter digits only！");
                    isok = false; $("#c_youxiao").focus(); return isok;
                }
            }
            if ($("#c_NameEn").val() == "") {
                isok = false;
                alert("Please enter the contact name in English！");
                $("#c_NameEn").focus(); return isok;

            }
            if ($("#c_addressEn").val() == "") {
                alert('Please enter the contact address in English！');
                isok = false; $("#c_addressEn").focus(); return isok;
            }
            else {
                if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
                    alert("You can only enter the English！");
                    isok = false; $("#c_addressEn").focus(); return isok;
                }
            }
        }
        if ($("#hi_usertype").val() == "2") {
            if ($("#c_companyEn").val() == "") {
                alert("Please enter Company Name！");
                isok = false; $("#c_companyEn").focus(); return isok;
            }
            if ($("#c_addressEn").val() == "") {
                alert('Please enter the contact address in English！');
                isok = false; $("#c_addressEn").focus(); return isok;
            }
            else {
                if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
                    alert("You can only enter the English！");
                    isok = false; $("#c_addressEn").focus(); return isok;
                }
            }
        }
    }

    if ($("#c_youbian").val() == "") {
        isok = false;
        alert('Please enter the contact Zip！');
        $("#c_youbian").focus();
        return isok;
    }
    else {
       
        if (!$("#c_youbian").val().match("^[0-9]*$")) {
            alert("Enter digits only！");
            isok = false; $("#c_youbian").focus(); return isok;
        }
    }
    if ($("#c_phone").val() == "") {
        isok = false;
        alert('Please enter a contact Mobile！');
        $("#c_phone").focus();
        return isok;
    }
    else {

        if (reg2.test($("#c_phone").val()) == false) {
            alert('Mobile number format is incorrect!');
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
                        alert("The phone number has been registered！");
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
            alert("Please enter the correct Tel format！");
            isok = false;
            $("#text_Call").focus();
            return isok;
        }
    }
    if ($("#text_Email").val() == "") {
        isok = false;
        alert('Please enter the contact Email！');
        $("#text_Email").focus();
        return isok;
    }
    else {
        if (reg.test($("#text_Email").val()) == false) {
            alert('Email format is wrong!');
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
                        alert("Email is registered！");
                        $("#text_Email").focus();
                    }
                }
            });
        }
       
    }
    if ($("#text_chuanzhen").val() != "") {
        if ($("#text_chuanzhen").val().match(/\D\-/g)) {
            alert("Fax format is incorrect！");
            isok = false; $("#text_chuanzhen").focus(); return isok;
        }
    }
    if ($("#hi_guoji").val() == "1") {
        if ($("#text_QQ").val() != "") {
            if ($("#text_QQ").val().match(/\D/g)) {
                alert("Enter digits only！");
                isok = false; $("#text_QQ").focus(); return isok;
            }
        }
    } else {
        if ($("#text_msn").val() != "") {
            // var reg = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/;
            //var reg = /[^u4e00-u9fa5]/; //禁止输入中文
            if ($("#text_msn").val().search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                alert("Msn entry error！");
                isok = false; $("#text_msn").focus(); return isok;
            }
        }
    }
 
    return isok;
}