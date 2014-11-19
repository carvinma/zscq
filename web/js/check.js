
        var cloneAid = 0;
        var templateId = -1;
        var jump = 0;
        var cookieDomain = 'icoc.cn';
        var unionAid = 0;
        var trackApp = 5;
        var trackParam = '%E7%BD%91%E9%A1%B5%E6%B3%A8%E5%86%8C%E6%A8%A1%E7%89%88';

        $(function () {
            /* cacct blur validate */
            $('#cacct').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    cacctValidate(true);
	})

            $('#cacct').keyup(function () {
                if ($("#cacct").val() != "") {
                    $("#regUrl").show();
                } else {
                    $("#regUrl").hide();
                }
                $("#cUrl").text($('#cacct').val());
                if ($("#cUrl2").length > 0) {
                    $("#cUrl2").text($('#cacct').val());
                }
            });

            /* cname blur validate */
            $('#cname').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    cnameValidate();
	})

            /* sacct blur validate */
            $('#sacct').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    sacctValidate();
	})

            /* pwd blur validate */
            $('#youzheng').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    youzhengValidate();
	})



            /* email blur validate */
            $('#email').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    emailValidate();
	});
  /* email blur validate */
            $('#chuanzhen').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    chuanzhenValidate();
	});

	$('#Url').focus(function () {
	    $(this).parent().parent().find(".item5").hide();
	    $(this).parent().parent().find(".item4").hide();
	    $(this).parent().parent().find(".item3").show();
	})
	.blur(function () {
	    UrlValidate();
	});



            /* phone blur validate */
            $('#phone').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    phoneValidate();
	});

            /* validateCode blur validate */
            $('#validateCode').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    validateCodeValidate();
	});

            /* validateTrade blur validate */
            $('#biaoti').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    biaotiValidate();
	});

            $('#neirong').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item44").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    $(this).parent().parent().find(".item44").hide();
	    neirongValidate();
	});

            $('#username').focus(function () {
                $(this).parent().parent().find(".item5").hide();
                $(this).parent().parent().find(".item4").hide();
                $(this).parent().parent().find(".item3").show();
            })
	.blur(function () {
	    usernameValidate();
	});

	$('#usertel').focus(function () {
	    $(this).parent().parent().find(".item5").hide();
	    $(this).parent().parent().find(".item4").hide();
	    $(this).parent().parent().find(".item3").show();
	})
	.blur(function () {
	    usertelValidate();
	});


	$('#userphone').focus(function () {
	    $(this).parent().parent().find(".item5").hide();
	    $(this).parent().parent().find(".item4").hide();
	    $(this).parent().parent().find(".item3").show();
	})
	.blur(function () {
	    userphoneValidate();
	});


        });

        /* ---------CheckValidate--------  */
        function cacctValidate(isCheck) {
            var cacct = $('#cacct');
            var checkThrough = true;
            if (cacct.val() == "") {
                showErr(cacct, "请输入公司名称");
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#cacct'));
            }
            return checkThrough;
           
        }

        function cnameValidate() {
            var checkThrough = true;
            
            if($('#cname').val() == ""){
            showErr($('#cname'), '请输入联系人');
            checkThrough = false;
            return checkThrough;
            }
           
            if (checkThrough == true) {
                regShowCheckThrough($('#cname'));
            }
            return checkThrough;
        }

        function sacctValidate() {
            var checkThrough = true;
            if ($('#sacct').val() == "") {
                showErr($('#sacct'), '请输入联系地址');
                checkThrough = false;
                return checkThrough;
            }

            if (checkThrough == true) {
                regShowCheckThrough($('#sacct'));
            }
            return checkThrough;
        }

        function youzhengValidate() {
            var checkThrough = true;
            if ($('#youzheng').val() == "") {
                showErr($('#youzheng'), '请输入邮政编码');
                checkThrough = false;
                return checkThrough;
            }
            var reg = new RegExp("^[0-9]*$");
            if (!reg.test($('#youzheng').val())) {
                showErr($('#youzheng'), '邮编是由数字组成');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#youzheng'));
            }
            return checkThrough;
        }

        function phoneValidate() {
            var checkThrough = true;
            if ($('#phone').val() == "") {
                showErr($('#phone'), '请输入您的电话');
                checkThrough = false;
                return checkThrough;
            }
            var reg = new RegExp("^[0-9]*$");
            if (!reg.test($('#phone').val())) {
                showErr($('#phone'), '电话格式不正确');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#phone'));
            }
            return checkThrough;
        }

        function biaotiValidate() {
            var checkThrough = true;
            if ($('#biaoti').val() == "") {
                showErr($('#biaoti'), '请输入标题');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#biaoti'));
            }
          
            return checkThrough;
        }


        function neirongValidate() {
            var checkThrough = true;
            if ($('#neirong').val() == "") {
                showErr($('#neirong'), '请输入内容');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#neirong'));
            }
////            alert($('#neirong').val());
//            if (neirong.value == "") {
//                showErr(neirong, '请输入内容');
//                return false;
//            }
            return checkThrough;
        }
        function usernameValidate() {
            var checkThrough = true;
            if ($('#username').val() == "") {
                showErr($('#username'), '请输入姓名');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#username'));
            }
            return checkThrough;
        }

        function usertelValidate() {
            var checkThrough = true;
            if ($('#usertel').val() == "") {
                showErr($('#usertel'), '请输入电话');
                checkThrough = false;
                return checkThrough;
            }

            var reg = new RegExp("^[0-9]*$");
            if (!reg.test($('#usertel').val())) {
                showErr($('#usertel'), '请输入正确的电话');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#usertel'));
            }
            return checkThrough;
            
        }


        function userphoneValidate() {
            var checkThrough = true;
            if ($('#userphone').val() == "") {
                showErr($('#userphone'), '请输入手机');
                checkThrough = false;
                return checkThrough;
            }

            var reg = new RegExp("^[0-9]*$");
            if (!reg.test($('#userphone').val())) {
                showErr($('#userphone'), '请输入正确的手机');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#userphone'));
            }
            return checkThrough;

        }

        function UrlValidate() {
            var checkThrough = true;
            if ($('#Url').val() == ""||$('#Url').val()=="http://") {
                showErr($('#Url'), '请输入您公司的网址');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#Url'));
            }
            return checkThrough;
        }



        function chuanzhenValidate() {
            var checkThrough = true;
            if ($('#chuanzhen').val() == "") {
                showErr($('#chuanzhen'), '请输入您的传真');
                checkThrough = false;
                return checkThrough;
            }
            var reg = new RegExp("^[0-9]*$");
            if (!reg.test($('#chuanzhen').val())) {
                showErr($('#chuanzhen'), '请输入正确的传真');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                regShowCheckThrough($('#chuanzhen'));
            }
            return checkThrough;
        }
        function validateCodeValidate() {
            if ($('#validateCode').val() == "") {
                showErr($('#validateCode'), '请输入验证码');
                return false;
            }
            return true;
        }

        function emailValidate() {
            var checkThrough = true;
            $('#email').val($.trim($('#email').val()));
            if ($('#email').val() == "") {
                showErr($('#email'), '请输入电子邮箱');
                checkThrough = false;
                return checkThrough;
            }
           
            var reg = new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/);
            var tmp_email = $('#email').val();
            if (!reg.test(tmp_email)) {
                showErr($('#email'),'请输入正确的电子邮箱');
                checkThrough = false;
                return checkThrough;
            }
            if (checkThrough == true) {
                    regShowCheckThrough($('#email'));
                }
            return checkThrough;
        }


        function showErr(obj, str) {
            if (obj.attr("id") == "regging") {
                if (str != "") {
                    $("#reggingLine").show();
                } else {
                    $("#reggingLine").hide();
                }
            }
            if (str != "") {
                obj.parent().parent().find(".item4").show();
                obj.parent().parent().find(".item44").show();
                obj.parent().parent().find(".item4").text(str);
                obj.parent().parent().find(".item44").text(str);
            } else {
                obj.parent().parent().find(".item4").hide();
                obj.parent().parent().find(".item44").text(str);
                obj.parent().parent().find(".item4").hide();
                obj.parent().parent().find(".item44").text(str);
            }
            obj.parent().parent().find(".item3").hide();
            obj.parent().parent().find(".item33").show();
            obj.parent().parent().find(".item5").hide();
        }

        function regShowCheckThrough(obj, options) {
            var regline_parent = obj.parent().parent(); // cache parent
            var reg_item5 = regline_parent.find('.item5');
            reg_item5.show();
            regline_parent.find('.item4').hide();
            regline_parent.find('.item3').hide();
            if (options) {
                if (options.itemExtText) {
                    reg_item5.text(options.itemExtText);
                }
            }
        }


        function changeValidateImg() {
            $("#validateCodeImg").attr("src", "img.aspx?id");
        }

        function register() {

           // alert("dd");
            var me = $('#registerBtn');
            if (me.hasClass('disabled')) {
                return;
            }
            if (!$("#agree").attr("checked")) {
                showErr($("#regging"), "您尚未同意服务条款");
                return false;
            }
            var cacct = $('#cacct').val(); //公司名称
            var comtypeid = $('#DropDownList1').val();

            var comtypename = $("#DropDownList1 option:selected").text(); // $('#DropDownList1').text();
            var comaddress = $("#province").val() + $("#city").val() + $("#district").val();
           // alert(comaddress);
            if ($("#province").val() == "--请选择省份/地区--") {
                alert("请选择公司所在地!");
                return false;
            }
            var cname = $('#cname').val(); //联系人
            var sacct = $('#sacct').val(); //联系地址
            var youzheng = $('#youzheng').val();
            var phone = $('#phone').val();


            var email = $("#email").val(); //电子邮箱
            var chuanzhen = $("#chuanzhen").val(); //chuanzhen

            var url =  $("#Url").val();
            var biaoti = $("#biaoti").val(); //广告标题
            var neirong = $("#neirong").val(); //广告内容
            var username = $("#username").val();
            var sex = $("input[name=sex]:checked").val();
            var usertel = $("#usertel").val();
            var userphone = $("#userphone").val();
            var validateCode = $("#validateCode").val();
            var valid = true;

            if (!cacctValidate(false)) { valid = false; } //Cacct Check
            if (!cnameValidate()) { valid = false; } //Cname Check
            if (!sacctValidate()) { valid = false; } //Sacct Check
            if (!youzhengValidate()) { valid = false; } //邮政 Check
            //if (!tradeValidate()) { valid = false; }
            if (!validateCodeValidate()) { valid = false; } //验证码

            if (!phoneValidate()) { valid = false; }
            if (!biaotiValidate()) { valid = false; }
            if (!neirongValidate()) { valid = false; }
            if (!usernameValidate()) { valid = false; }
            if (!chuanzhenValidate()) { valid = false; }
            if (!UrlValidate()) { valid = false; }
            if (!emailValidate()) { valid = false; }
            if (!usernameValidate()) { valid = false; }
            if (!usertelValidate()) { valid = false; }
            if (!userphoneValidate()) { valid = false; }
            if (!valid) {
                showErr($("#regging"), "注册信息有误，请检查您填写的信息。");
                return;
            }
            showErr($("#regging"), "正在提交注册信息，请稍候...");
           // disableRegisterImg(true);

           
            var params = cacct + "," + comtypeid + "," + comtypename + "," + comaddress + "," + sacct + "," + youzheng + "," + cname + "," + phone + "," + email + "," + chuanzhen + ","+url+"," + biaoti + "," + neirong + "," + username + "," + sex + "," + usertel + "," + userphone + "," + validateCode;

            $.post("post.aspx", { cmd: params }, function (data, state) {
                if (state == "success") {
                    //alert(data);

                    if (data == "codeError") {
                        showErr($("#regging"), "验证码错误，请重新输入！");
                        return;
                    }
                    if (data == "ok") {
                        disableRegisterImg(true);
                        alert("注册成功！");
                        parent.location.reload();
                    }
                    else {
                        showErr($("#regging"), "注册信息有误，请检查您填写的信息。");
                        return;
                    }
                }
                else {
                    showErr($("#regging"), "服务器不稳定，请稍后再试...");
                    return;
                }
            });
          
        }

        function disableRegisterImg(bool) {
            var button = $("#registerBtn");
            if (bool) {
                button.unbind("click");
                button.removeAttr("onclick");
            } else {
                button.bind("click", function () {
                    register();
                });
            }
        }

        function dropdownIndustry() {
            var h = $("#selectDiv");
            if (h.css("display") == "none") {
                h.show();
                $("#dropdownInput").focus();
            } else {
                h.hide();
            }
        }
        function selectIndustry(groupId, e) {
            $("#dropdownInput").val($.trim($(e).text()));
            $("#selectDiv").hide();

            $("#trade").val(groupId);
            if (groupId == 0) {
                $('#regTradePanel').show();
            } else {
                $('#regTradePanel').hide();
            }
        }
        
        
  
