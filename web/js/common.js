function setUi(type, selector, fn) {
    if ($(selector).length > 0 || selector == "") {
        if (type == "now") {
            fn();
        };
        if (type == "ready") {
            $(function () {
                fn();
            })
        };
        if (type == "loaded") {
            window.onload = fn;
        };

    }
}

// top关注

setUi("ready", "", function () {

    $("li.icon_careus").hover(
		function () {
		    $(this).find("div.top_aboutus").stop(false, true).slideDown(200)
		},
		function () {
		    $(this).find("div.top_aboutus").stop(false, true).slideUp(200)
		}
	)

})

// submenu

setUi("ready", "div.menu", function () {
    var timer1 = null;
    var submenubox = $("div.submenubox");
    var submenus = $("div.submenu");
    var menus = $("div.menu li.hasSub a");
    menus.each(function (i) {
        $(this).hover(
			function () {
			    window.clearTimeout(timer1);
			    menus.removeClass("on");
			    $(this).addClass("on");
			    submenus.hide().eq(i).show(0, function () {
			        submenubox.show();
			    });
			},
			function () {
			    timer1 = window.setTimeout(function () {
			        submenubox.hide();
			        menus.removeClass("on");
			    }, 100)
			}
		)
    });
    submenubox.hover(
		function () {
		    window.clearTimeout(timer1);
		},
		function () {
		    timer1 = window.setTimeout(function () {
		        submenubox.hide();
		        menus.removeClass("on");
		    }, 100)
		}
	);
    /*$("div.menu li a").not(".hasSub").hover(
		function () {
		    $("div.menu li a").removeClass("on")
		},
		function () {

		}
	)*/
});

// 购买流程
//setUi("ready", "#buystep1", function () {

//	var pros = $("ul.member_order_list li.bustepproli");
//	var allpirce_old = $("#F_priceall_a");
//	var allpirce_off = $("#F_priceall_b");
//	var allpirce_new = $("#F_priceall_c");

//	var up   = pros.find("a.cart_num_up"),
//		down = pros.find("a.cart_num_down"),
//		num  = pros.find("input.cart_num"),
//		oldp = pros.find("input.F_price1"),
//		newp = pros.find("input.F_price2")
//	;

//	var del = pros.find("a.cart_ctrl_del");

//	var delall = $("div.cart_clear a");


//	pros.each(function(i){

//		up.eq(i).click(function(){
//			var tpnum = Number(num.eq(i).val());

//			if(tpnum >= 0){
//				tpnum++;
//				num.eq(i).val(tpnum)
//			}else{
//				num.eq(i).val(1)
//			}

//			allpirce()
//		});
//		down.eq(i).click(function(){
//			var tpnum = num.eq(i).val();
//			if(tpnum > 0){
//				tpnum--;
//				num.eq(i).val(tpnum)
//			}else{
//				num.eq(i).val(0)
//			}

//			allpirce()
//		});

//		num.eq(i).change(function(){
//			allpirce()
//		})

//		del.eq(i).click(function(){
//			pros.eq(i).remove();
//			allpirce()
//		})

//	})

//	function allpirce(p){
//		var pros = $("ul.member_order_list li.bustepproli");
//		var allp1=0,allp2=0;
//		if(p == undefined){
//			pros.each(function(i){
//				allp1 += oldp.eq(i).val()*num.eq(i).val();
//				allp2 += newp.eq(i).val()*num.eq(i).val();
//			});
//		}

//		allpirce_old.text(allp1);
//		allpirce_off.text(allp1-allp2);
//		allpirce_new.text(allp2);
//	}

//	delall.click(function(){
//		pros.remove();
//		allpirce(0)
//	})


//    // 第二部，提交订单

//    $("a.cart_step2_submit").click(function () {
//        orderok();
//    });

//});


// 支付方式

setUi("ready", "dl.cart_pay", function () {
    $("dl.cart_pay").find("dt").click(function () {
        if ($(this).siblings("dd").css("display") != "none") {
            $(this).siblings("dd").hide();
        } else {
            $(this).siblings("dd").show();
        }
    })
})

// 产品列表

setUi("ready", "dl.pro_class", function () {
    // 
    $("dl.pro_class").find("dd.pro_classMore").click(function () {
        if (!$(this).find("a").hasClass("show")) {
            $(this).siblings("dd").css("height", "auto");
            $(this).find("a").addClass("show").text("收起");
            $("div.pro_class_list").css("height", "auto");
        } else {
            $(this).siblings("dd").css("height", "30px");
            $(this).find("a").removeClass("show").text("展开");
            $("div.pro_class_list").css("height", "auto");
        }
    });

    // 
    $("div.pro_class_show a").click(function () {
        if ($(this).hasClass("a2")) {
            $("dl.pro_class").each(function () {
                $(this).find("dd.pro_classMore").siblings("dd").css("height", "30px");
                $(this).find("dd.pro_classMore").find("a").removeClass("show").text("展开");
            });
            $("div.pro_class_list").css("height", "auto");
            $(this).removeClass("a2").text("展开");
        } else {
            $("dl.pro_class").each(function () {
                $(this).find("dd.pro_classMore").siblings("dd").css("height", "auto");
                $(this).find("dd.pro_classMore").find("a").addClass("show").text("收起");
            });
            $("div.pro_class_list").css("height", "auto");
            $(this).addClass("a2").text("收起");
        }
    })
})


// 实体店品牌
setUi("ready", "div.realshop_bdshow", function () {

    $("div.realshop_bdshow").click(function () {
        if ($(this).hasClass("show")) {
            $(this).siblings("div.realshop_bdbox").find("div.realshop_bdlist").height(220);
            $(this).removeClass("show");
        } else {
            $(this).siblings("div.realshop_bdbox").find("div.realshop_bdlist").css("height", "auto");
            $(this).addClass("show");
        }
    });

})


// 产品详情页
setUi("ready", "div.protabbox", function () {
    var protab_tags = $("div.protabbox div.protab_tags li");
    var protab_conts = $("div.protabbox div.protab_conts");

    protab_tags.each(function (i) {
        $(this).click(function () {
            protab_tags.removeClass("on").eq(i).addClass("on");
            protab_conts.hide().eq(i).show();
        })
    });


    $("div.ask_sortlist").hover(
		function () {
		    $(this).find("div.ask_sort_i").stop(false, true).slideDown(500)
		},
		function () {
		    $(this).find("div.ask_sort_i").stop(false, true).slideUp(500)
		}
	);

    // chima

    //	$("div.pro_size .sel-size span a").click(function(){
    //		var siz = $(this).attr("title")
    //		$("#sle_size").val(siz);
    //		$("div.pro_size .sel-size span a").removeClass("on");
    //		$(this).addClass("on");
    //	})
})


//function changeguige(v, v2, v3) {
//    document.getElementById('Hi_CS' + v2).value = v;
//    $("div.pro_size .sel-size span a").removeClass("on");
//    v3.setAttribute("class", "on");
//}

/* 提交订单成功，显示提示框 */

function orderok() {
    $("div.tipbox").height($("body").height()).show();
    $("div.tipcont").css("margin-top", $("html").scrollTop() + ($(window).height() - $("div.tipcont").height()) / 2);
}
/* 会员中心 菜单 */
$(function () {
    $("dl.member_menu li").each(function () {
        var that = $(this);
        that.find("div.member_subtit").click(function () {
            $(this).parent().addClass("on");
            $(this).parent().siblings().removeClass("on");

            if (that.hasClass("show")) {
                //menus.removeClass("on");
                //$(this).addClass("on");.member_menu dd li
                that.find("div.member_sublist").stop(false, true).slideUp(500, function () {
                    that.removeClass("show");
                });
            } else {
                that.siblings().find("div.member_sublist").slideUp();
                that.find("div.member_sublist").stop(false, true).slideDown(500, function () {
                    that.siblings().removeClass("show");
                    that.addClass("show");
                });
            }

        })
    })
})