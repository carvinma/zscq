//验证수자만 입력해주세요或是字母
function checkBianhao(ob) {
    var obj =$("#"+ob);
    if (obj.val().match(/[^A-Za-z0-9]/ig)) {
        return false;
    }
    return true;
}
function CheckUserSbregnum(id) {
    if (id == "0") {
        var txt_sbnum = $("#sb_num").val();
        if (txt_sbnum != "") {
            $.ajax({
                type: "POST",
                url: "Shop_Manage/Shop_A_Trademark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "sbregnum=" + txt_sbnum,
                success: function (msg) {
                    if (msg == "ok") {
                        alert("상표 등록 번호가 이미 존재합니다！");
                        $("#sb_num").val("");
                        $("#sb_num").focus();
                        $("#sb_num1").html("<img  src='images/tError.gif' />");
                    }
                    else {
                        $("#sb_num1").html("<img  src='images/tOk.gif' />");
                    }
                }
            });
        }
        else {
            $("#sb_num1").html("<img  src='images/tError.gif' />");
        }
    }
    else {
        var txt_sbnum = $("#sb_num").val();
        var txt_sbid = $("#hi_sbid").val();
        if (txt_sbnum != "") {
            $.ajax({
                type: "POST",
                url: "Shop_Manage/Shop_A_Trademark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "sbregnum=" + txt_sbnum + "&sbid=" + txt_sbid,
                success: function (msg) {
                    if (msg == "ok") {
                        alert("상표 등록 번호가 이미 존재합니다！");
                        $("#sb_num").val("");
                        $("#sb_num").focus();
                        $("#sb_num1").html("<img  src='images/tError.gif' />");
                    }
                    else {
                        $("#sb_num1").html("<img  src='images/tOk.gif' />");
                    }
                }
            });
        } else {
            $("#sb_num1").html("<img  src='images/tError.gif' />");
        }
    }
}

function Checksbzhenshu(id) {
    var oo = $("#hi_usertype").val();
 if (oo == "3") {
    if (id == "0") {
        var txt_sbnum = $("#Sb_Regname").val();
        if (txt_sbnum != "") {
            $.ajax({
                type: "POST",
                url: "Shop_Manage/Shop_A_Trademark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "sbregnamenum=" + txt_sbnum,
                success: function (msg) {
                    if (msg != "") {
                        //alert("상표 등록 번호가 이미 존재합니다！");
                        //$("#sb_num").val("");
                        //$("#sb_num").focus();
                        //document.getElementById("FileUpload3").display = 'none';
                        $("#FileUpload3").hide();
                        $("#hi_zhitifiles").val(msg);
                        $("#sb_namenum1").html("<a href='" + msg + "'  title='클릭하여 조사'  target='_blank'>신분을 증명할수있는 증명파일가 이미 업로드 되였습니다</a>");
                    }
                    //                    else {
                    //                        $("#sb_namenum1").html("<img  src='images/tOk.gif' />");
                    //                    }
                }
            });
        }
//        else {
//            $("#sb_num1").html("<img  src='images/tError.gif' />");
//        }
    }
    else {
        var txt_sbnum = $("#Sb_Regname").val();
        var txt_sbid = $("#hi_sbnameid").val();
        if (txt_sbnum != "") {
            $.ajax({
                type: "POST",
                url: "Shop_Manage/Shop_A_Trademark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "sbregnamenum=" + txt_sbnum + "&sbnameid=" + txt_sbid,
                success: function (msg) {
                    if (msg != "") {
                        //alert("상표 등록 번호가 이미 존재합니다！");
                        //$("#sb_num").val("");
                        //$("#sb_num").focus();
                        //document.getElementById("FileUpload3").display = 'none';
                        $("#FileUpload3").hide();
                        $("#hi_zhitifiles").val(msg);
                        $("#sb_namenum1").html("<a href='" + msg + "'  title='클릭하여 조사'  target='_blank'>신분을 증명할수있는 증명파일가 이미 업로드 되였습니다</a>");
                    }
//                    else {
//                        $("#sb_namenum1").html("<img  src='images/tOk.gif' />");
//                    }
                }
            });
        } 
//        else {
//            $("#sb_num1").html("<img  src='images/tError.gif' />");
//        }
    }
}
}
function checkanjuanhao() {
    if ($("#t_anjuanhao").val() != "") {
        if ($("#t_anjuanhao").val().match(/[^A-Za-z0-9]/ig)) {
            alert("당신은 문자와 숫자를 입력 할 수 있습니다");
            isok = false;
           // $("#txt_anjuanhao").focus();
            $("#txt_anjuanhao1").html("<img  src='images/tError.gif' />");
            return false;
        }
        else {
            $("#txt_anjuanhao1").html("<img  src='images/tOk.gif' />");
        }
    }
}

function Checkadd() {
    var isok = true;
    if ($("#sb_num").val() == "") {
        alert("상표 등록 번호를 기입 해주십시오！");
        isok = false;
        $("#sb_num").focus();
        $("#sb_num1").html("<img  src='images/tError.gif' />");
        return isok;
    }
    else {
        if (!checkBianhao("sb_num")) {
            alert("당신은 문자와 숫자를 입력 할 수 있습니다");
            isok = false;
            $("#sb_num").focus();
            $("#sb_num1").html("<img  src='images/tError.gif' />");
            return false;
        }
        else {
            var txt_sbnum = $("#sb_num").val();
            var txt_sbid = $("#hi_sbid").val();
            if (txt_sbid != "0") {
                $.ajax({
                    type: "POST",
                    url: "Shop_Manage/Shop_A_Trademark.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "sbregnum=" + txt_sbnum + "&sbid=" + txt_sbid,
                    success: function (msg) {
                        if (msg == "ok") {
                            alert("상표 등록 번호가 이미 존재합니다！");
                            $("#sb_num").val();
                            isok = false;
                            $("#sb_num").focus();
                            $("#sb_num1").html("<img  src='images/tError.gif' />");
                            return false;
                        }
                        else {
                            $("#sb_num1").html("<img  src='images/tOk.gif' />");
                        }
                    }
                });
            }
            else {
                var txt_sbnum = $("#sb_num").val();
                $.ajax({
                    type: "POST",
                    url: "Shop_Manage/Shop_A_Trademark.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "sbregnum=" + txt_sbnum,
                    success: function (msg) {
                        if (msg == "ok") {
                            alert("상표 등록 번호가 이미 존재합니다！");
                            isok = false;
                            $("#sb_num").val();
                            $("#sb_num").focus();
                            return false;
                        }
                        else {
                            $("#sb_num1").html("<img  src='images/tOk.gif' />");
                        }
                    }
                });
            }
        }
    }
    
    if ($("#Sb_type").val() == "") {
        alert("상표 유형을 기입 해주세요！");
        isok = false; $("#Sb_type").focus();
        $("#Sb_type1").html("<img  src='images/tError.gif' />");
        return isok;       
    }
//    if ($("#Sb_miaosu").val() != "") {
//        isok = false;  $("#Sb_miaosu").focus();
//        return isok;      
    //    }
    if ($("#Sb_passTime").val() == "") {
        alert("상표 출원의 날짜를 기입 해주세요！");
        isok = false;
         $("#Sb_passTime").focus();
        return isok;      
    }

    if ($("#Drp_GuoJi").val() == "0") {
        alert("위치 주소를 선택하세요！");
        isok = false; $("#Drp_GuoJi").focus();      
        return isok;
        
    }
//    if ($("#Sb_Reg_youbian").val() == "") {
//        alert("작성해 주세요 우편번호！");
//        isok = false; $("#Sb_Reg_youbian").focus();
//        $("#Sb_Reg_youbian").html("<img  src='images/tError.gif' />");
//         return isok;
//    }
//    else {
//        if (!$("#Sb_Reg_youbian").val().match("^[0-9]*$")) {
//            alert("수자만 입력해주세요！");
//            isok = false; $("#Sb_Reg_youbian").focus(); return isok;
//        }
//    }

	if ($("#hi_guoji").val() == "0") {
        if ($("#hi_usertype").val() == "3") {
    
	if ($("#Sb_RegnameEn").val() == "") {
        alert("상표 등록의 이름을 기입 해주세요！");
        isok = false; $("#Sb_RegnameEn").focus(); return isok;

    }
	}
	
	}
   
//    if ($("#Sb_Reg_Address").val() == "") {
//        alert("자세한 주소를 적어 주세요！");
//        isok = false; $("#Sb_Reg_Address").focus(); return isok;
//    }
    if ($("#hi_guoji").val() == "0") {
        if ($("#hi_usertype").val() == "3") {
            if ($("#Sb_Reg_AddressEn").val() == "") {
                alert('연락처 영어 주소를 입력하십시오.');
                isok = false; $("#Sb_Reg_AddressEn").focus(); return isok;
            }
            //else {
//                if ($("#Sb_Reg_AddressEn").val().match(/[^a-zA-Z]/g)) {
//                    alert("입력 영어 수밖에 없다！");
//                    isok = false; $("#Sb_Reg_AddressEn").focus(); return isok;
//                }
//            }
        }
    }
    //客户信息  

//    if ($("#t_anjuanhao").val() != "") {
//        if ($("#t_anjuanhao").val().match(/[^A-Za-z0-9]/ig)) {
//            alert("당신은 문자와 숫자를 입력 할 수 있습니다");
//            isok = false;
//            $("#t_anjuanhao").focus();
//            $("#txt_anjuanhao1").html("<img  src='images/tError.gif' />");
//            return false;
//        }
//    }
//    var p1 = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;//验证电话的
//    if ($("#txt_phone").val() != "") {
//        if (p1.test($("#txt_phone").val()) == false) {
//            alert('电话输入有误！');
//            $("#txt_phone").focus();
//            isok = false;
//            return isok;
//        }
//    }
//    if ($("#c_Name").val() == "") {
//        alert('请输入真实姓名');
//        isok = false; $("#c_Name").focus(); return isok;
//    }

//    if ($("#c_Phone").val() == "") {
//        isok = false;
//        alert('请输入联系人手机！');
//        $("#c_Phone").focus();
//        return isok;
//    }
//    else {
//       // alert($("#c_Phone").val());
//        //var p1 = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;验证电话的
//        var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
//        if (reg2.test($("#c_Phone").val()) == false)
//        {
//            alert("请输入正确的手机号码格式！");
//            isok = false;
//            $("#c_Phone").focus(); return isok;
//        }
//        else {
//            var id = $("#Hi_MemberId").val();
//            var lname = $("#c_Phone").val();
//            var rand = Math.floor(Math.random() * 1000000);
//            $.ajax({
//                type: "post",
//                async: false,
//                url: "Handler.ashx",
//                contentType: "application/x-www-form-urlencoded; charset=utf-8",
//                data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
//                success: function (msg) {
//                    if (msg == "1") {
//                        alert("该手机号码已注册！");
//                        $("#c_Phone").focus();
//                        isok = false;
//                        return isok;
//                    }
//                }
//            });
//        }
//    }
//    if ($("#c_youbian").val() == "") {
//        isok = false;
//        alert('请输入联系人邮编！');
//        $("#c_youbian").focus();
//        return isok;
//    }
//    else {

//        if (!$("#c_youbian").val().match("^[0-9]*$")) {
//            alert("수자만 입력해주세요！");
//            isok = false; $("#c_youbian").focus(); return isok;
//        }
//    } 
//    if ($("#Drp_GuoJi2").val() == "0" || $("#DropDownList5").val() == "0" || $("#DropDownList6").val() == "0" || $("#DropDownList7").val() == "0") {
//        alert("위치 주소를 선택하세요！");
//        isok = false; $("#Drp_GuoJi2").focus();
//        return isok;
//    }
//    if ($("#c_address").val() == "") {
//        alert("자세한 주소를 적어 주세요！");
//        isok = false; $("#c_address").focus(); return isok;
//    }

//    //国际 中国判断和英文
////    if ($("#hi_guoji").val() == "1") {
//        if ($("#hi_usertype").val() == "1") {
//            if ($("#c_Idcard").val() == "") {
//                alert('请输入身份证号码！');
//                isok = false; $("#c_Idcard").focus(); return isok;
//            }
//            else {
//              var partten = /^[\d]{6}((19[\d]{2})|(200[0-8]))((0[1-9])|(1[0-2]))((0[1-9])|([12][\d])|(3[01]))[\d]{3}[0-9xX]$/;
//              if (!partten.test($("#c_Idcard").val())) {               
//                    alert("身份证号码有误！");
//                    isok = false; $("#c_Idcard").focus(); return isok;
//                }
//            }
//        }
//        if ($("#hi_usertype").val() == "2") {
//            if ($("#c_company").val() == "") {
//                alert("请填写公司名称！");
//                isok = false; $("#c_company").focus(); return isok;
//            }

//        }
//        if ($("#hi_usertype").val() == "3") {
//            if ($("#c_dailiName").val() == "") {
//                isok = false;
//                alert("请输入代理组织名称！");
//                $("#c_dailiName").focus();
//                return isok;
//            }
//        }
//          //国际 国外判断和英文
//        if ($("#hi_guoji").val() == "0") {
//            if ($("#hi_usertype").val() == "1") {
//                if ($("#c_youxiao").val() == "") {
//                    alert('请输入有效证件！');
//                    isok = false; $("#c_youxiao").focus(); return isok;
//                }
//                else {
//                    if (!$("#c_youxiao").val().match("^[0-9]*$")) {
//                        alert("수자만 입력해주세요！");
//                        isok = false; $("#c_youxiao").focus(); return isok;
//                    }
//                }
//                if ($("#c_NameEn").val() == "") {
//                    isok = false;
//                    alert("请输入联系人英文名称！");
//                    $("#c_NameEn").focus(); return isok;

//                }
//                if ($("#c_addressEn").val() == "") {
//                    alert('请输入联系人英文地址！');
//                    isok = false; $("#c_addressEn").focus(); return isok;
//                }
//                else {
//                    if ($("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
//                        alert("只能输入英文！");
//                        isok = false; $("#c_addressEn").focus(); return isok;
//                    }
//                }
//            }
//            if ($("#hi_usertype").val() == "2") {
//                if ($("#c_companyEn").val() == "") {
//                    alert("请填写公司英文名称！");
//                    isok = false; $("#c_companyEn").focus(); return isok;
//                }
//                if ($("#c_addressEn").val() == "") {
//                    alert('请输入联系人英文地址！');
//                    isok = false; $("#c_addressEn").focus(); return isok;
//                }
//                else {
//                    if (!$("#c_addressEn").val().match(/[^a-zA-Z]/g)) {
//                        alert("只能输入英文！");
//                        isok = false; $("#c_addressEn").focus(); return isok;
//                    }
//                }
//            }
//        }
        
    return isok;
}