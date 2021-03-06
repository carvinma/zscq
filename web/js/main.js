$(function () {

    /* 首页tab切换 */

    $("div.index_tabs li").each(function (i) {
        $(this).click(function () {
            $("div.index_tabs li").removeClass("tabOn").eq(i).addClass("tabOn");
            $("div.index_tab_conts").hide().eq(i).show();
        })
    })

    $("ul.index_tab_qg").each(function () {
        $(this).find("li").last().addClass("last");
    })


    /* 首页左侧导航 */

    $("ul.leftnav_list li").eq(0).addClass("first")

    hidesub = null;
    subhide = function () {
        hidesub = window.setTimeout(function () {
            $("div.leftnav_sub").hide();
            $("ul.leftnav_list li a").removeClass("on");
        }, 500)
    }
    $("ul.leftnav_list li a").each(function (i) {
        $(this).hover(
			function () {
			    window.clearTimeout(hidesub);
			    $("ul.leftnav_list li a").removeClass("on");
			    $(this).addClass("on");

			    $("div.leftnav_sub").show();
			    $("div.left_subnav").hide().eq(i).show();
			},
			function () {
			    subhide();
			}
		)
    });

    $("div.leftnav_sub").hover(
		function () {
		    window.clearTimeout(hidesub);
		},
		function () {
		    subhide();
		}
	)

    // 首页幻灯片

    var foucs_pics = $("div.focuspic li"); // 图集
    var foucs_txts = $("div.focustxt p"); // 文集
    var foucs_bts = $("div.focusbts a"); // 按钮

    var focus_time = 2000; 					// 轮播间隔时间

    // 切换方法
    function foucs_slide(pic, txt, bts, n, f) {

        /*
        pic: 图集
        txt: 文集
        bts: 按钮
        n  : 要显示的索引值
        f  : 回调函数
        */

        var fn = f || function () { };

        pic.each(function (i) {
            if ($(this).css("z-index") == 100) {
                $(this).css({ "z-index": 99 });
            } else {
                $(this).css({ "z-index": 10 });
            }
            if (i == n) {
                $(this).css({ "z-index": 100, "opacity": 0 });
            };
        })

        pic.eq(n).animate({ "opacity": 1 }, 500, function () {
            fn();
        });

        txt.hide().eq(n).show();

        bts.removeClass("current").eq(n).addClass("current");

    }

    var sindex = 1; // 默认显示第一个，则从第二个开始切换

    var focus_go; // 自动切换		计时id
    var rerun;   // 重启自动切换	计时id

    // 自动切换
    function run() {
        focus_go = window.setInterval(function () {
            window.clearInterval(rerun);
            if (sindex == foucs_pics.length) {
                sindex = 0;
            }

            foucs_slide(foucs_pics, foucs_txts, foucs_bts, sindex, function () {
                sindex++;
            })

        }, focus_time);
    }
    run();

    // 重启自动切换
    function autorrun() {
        rerun = window.setInterval(function () {
            run();
        }, 4000); // 重启自动切换间隔
    }

    // 幻灯片按钮点击事件
    foucs_bts.each(function (i) {
        $(this).click(function () {
            window.clearInterval(focus_go);
            window.clearInterval(rerun);
            sindex = i;
            foucs_slide(foucs_pics, foucs_txts, foucs_bts, sindex, function () {
                sindex++;
            })
            autorrun();
        })
    });


})


/* start 倒计时 动态显示剩余时间 */
function countDownTime(endtime, left_time, tmpl) {
    var now = new Date();
    var md = endtime.getTime() - now.getTime();
    //如果已到期，则显示“已到期”，并隐藏抢购按钮
    if (md <= 0) {
        $("#" + left_time).addClass("timeOver");
        document.getElementById(left_time).innerHTML = '已经结束';
        //document.getElementById("tpmesg"+id).innerHTML = '';
        // document.getElementById("tpmesg"+id).style.backgroundImage="url('../themes/xhm_ver2/images/huise_02.gif')";
        return 0;    //已经到期
    } else {
        md = Math.round(md / 1000);
        var sec = md % 60;
        md = (md - sec) / 60;
        var min = md % 60;
        md = (md - min) / 60;
        var hour = md % 24;
        md = (md - hour) / 24;
        var day = md;
        if (sec < 10) sec = '0' + sec;
        if (min < 10) min = '0' + min;
        if (day > 0) {
            var timehtml = tmpl;
            timehtml = timehtml.replace("{d}", day);
            timehtml = timehtml.replace("{h}", hour);
            timehtml = timehtml.replace("{m}", min);
            timehtml = timehtml.replace("{s}", sec);

            document.getElementById(left_time).innerHTML = timehtml;

            // document.getElementById(left_time).innerHTML = '剩余<span class="index_tabg_qg_timer_day">'+day+'</span>天<span class="index_tabg_qg_timer_h">'+hour+'</span>小时<span class="index_tabg_qg_timer_m">'+min+'</span>分<span class="index_tabg_qg_timer_s">'+sec+'</span>秒'
        } else {
            var timehtml = tmpl;
            timehtml = timehtml.replace("{d}", 0);
            timehtml = timehtml.replace("{h}", hour);
            timehtml = timehtml.replace("{m}", min);
            timehtml = timehtml.replace("{s}", sec);

            document.getElementById(left_time).innerHTML = timehtml;

            // document.getElementById(left_time).innerHTML = '剩余<span class="index_tabg_qg_timer_h">'+hour+'</span>小时<span class="index_tabg_qg_timer_m">'+min+'</span>分<span class="index_tabg_qg_timer_s">'+sec+'</span>秒'
        }
    }
    setTimeout(function () { countDownTime(endtime, left_time, tmpl); }, 1000);
}
// 调用countDownTime(new Date(2012,11,27,13,00,00),'left_time15697',15697);
/* end 倒计时 动态显示剩余时间 */

/* 首页 js  */
$(function () {
    // 限时抢购
    //	$("div.index_tab_qg_timer").each(function(){
    //		var time = $(this).attr("endtime").split(",");
    //		var timer_Id = $(this).attr("id");
    //		var time_tpl = '剩余<span class="index_tabg_qg_timer_day">{d}</span>天<span class="index_tabg_qg_timer_h">{h}</span>小时<span class="index_tabg_qg_timer_m">{m}</span>分<span class="index_tabg_qg_timer_s">{s}</span>秒';
    //		countDownTime(new Date(time[0],time[1]-1,time[2],time[3],time[4],time[5]),timer_Id,time_tpl);
    //	});
    //	// 秒杀
    //	$("#seckill_timer").each(function(){
    //		var time = $(this).attr("endtime").split(",");
    //		var timer_Id = $(this).attr("id");
    //		var time_tpl = '<span class="index_ms_t_h">{h}</span><span class="index_ms_t_m">{m}</span><span class="index_ms_t_s">{s}</span>';
    //		countDownTime(new Date(time[0],time[1]-1,time[2],time[3],time[4],time[5]),timer_Id,time_tpl);
    //	})

    // 病症专区

    $("dl.proM_item").hover(
		function () {
		    $(this).find("dd").addClass("hover");
		},
		function () {
		    $(this).find("dd").removeClass("hover");
		}
	)
})

/* 列表页js */

$(function () {
    // 列表左侧-常见病症专区 下拉菜单
    $("div.pleft_menu_list dl").each(function () {
        var that = $(this);
        $(this).find("dt div").click(function () {
            if (that.hasClass("on")) {
                that.find("dd").stop(false, true).slideUp();
                that.removeClass("on");
            } else {

                $("div.pleft_menu_list dl").find("dd").stop(false, true).slideUp(function () {
                    $(this).parent().removeClass("on");
                });


                that.find("dd").stop(false, true).slideDown();
                that.addClass("on");
            }
        })
    })

    // 标签检索下拉

    $("dl.proStags dd.proStagsMore a").click(function () {

        if ($(this).hasClass("show")) {
            $(this).removeClass("show").text("展开");
            $(this).parent().prev().css({ "height": 20 });

        } else {
            $(this).addClass("show").text("收起");
            $(this).parent().prev().css({ "height": "auto" });

        }
    })
})

/* 公用js */
$(function () {

    $("div.com_checkbox").each(function () {
        var check = $(this).find(".com_check");

        check.click(function () {
            if (!$(this).hasClass("com_checked")) {
                $(this).addClass("com_checked");
                $(this).find("input").attr("checked", "checked")
            } else {
                $(this).removeClass("com_checked");
                $(this).find("input").attr("checked", false)
            }
        })

    })


    $("div.com_radiolist").each(function () {
        var that = $(this);
        $(this).find("div.com_radiobox").each(function () {
            var radio = $(this).find(".com_radio");

            radio.click(function () {
                if (!$(this).hasClass("com_checked")) {

                    that.find("div.com_radiobox .com_radio").removeClass("com_checked");
                    that.find("div.com_radiobox input:radio").attr("checked", false);

                    $(this).addClass("com_checked");
                    $(this).find("input").attr("checked", "checked")
                }
            })


        })
    })
})

/* 文章页js*/

$(function () {
    // 详情
    $("div.pro_rbox_tabs li").each(function (i) {
        $(this).click(function () {
            $("div.pro_rbox_tabs li").removeClass("on").eq(i).addClass("on");
            if (i != 0) {
                $("div.pro_rbox_cont").hide().eq(i).show();
            }
            else {
                $("div.pro_rbox_cont").show();
            }
        })
    })
    // 评价
    $("div.pro_distab li").each(function (i) {
        $(this).click(function () {
            $("div.pro_distab li").removeClass("on").eq(i).addClass("on");
            $("div.pro_discont").hide().eq(i).show();
        })
    })

    $("span.pro_buynum_add").click(function () {
        var pronum = parseInt($("input.pro_buynum_num").val());
        pronum++
        $("input.pro_buynum_num").val(pronum)
    })
    $("span.pro_buynum_del").click(function () {
        var pronum = parseInt($("input.pro_buynum_num").val());
        if (pronum > 0) {
            pronum--;
        }
        $("input.pro_buynum_num").val(pronum)
    })
})

/* 会员中心 */
$(function () {

    // 订单展开
    $("td.member_slideIcon span").click(function () {
        if ($(this).hasClass("on")) {
            $(this).parents("tr").next().hide();
            $(this).removeClass("on")
        } else {
            $(this).parents("tr").next().show();
            $(this).addClass("on")
        }
    })
    // 订单tab
    $("div.member_order_tabs span").each(function (i) {
        $(this).click(function () {
            $("div.member_order_tabs span").removeClass("on").eq(i).addClass("on");
            $("div.member_order_cont").hide().eq(i).show();
        })
    })


})

/* 优惠活动 */

//$(function(){

//	// 限时抢购 timer
//	$("div.pro_timers1").each(function(){
//		var time = $(this).attr("endtime").split(",");
//		var timer_Id = $(this).attr("id");
//		var time_tpl = '<strong>{d}</strong><span>天</span><strong>{h}</strong><span>小时</span><strong>{m}</strong><span>分</span><strong>{s}</strong><span>秒</span>';
//		countDownTime(new Date(time[0],time[1]-1,time[2],time[3],time[4],time[5]),timer_Id,time_tpl,true);
//	});
//});


/* 按症找药 */
$(function () {
    /* 按部位找药 */
    $("div.zzbox_tabs li").each(function (i) {

        $(this).click(function () {
            $("div.zzbox_tabs li").removeClass("on").eq(i).addClass("on");
            $("div.zzbox_tabcont").hide().eq(i).show();
        })
    })
    /* 按症找药 */
    $("div.zzbox_tabs2 li").each(function (i) {

        $(this).click(function () {
            $("div.zzbox_tabs2 li").removeClass("on").eq(i).addClass("on");
            $("div.zzbox_tab2cont").hide().eq(i).show();
        })
    })

})

/* 品牌 */

$(function () {
    $("div.all_dismore a").click(function () {
        if ($(this).hasClass("show")) {
            $(this).removeClass("show").text("展开全部")
            $("div.all_discont").css("height", 180);
        } else {
            $(this).addClass("show").text("收起全部");
            $("div.all_discont").css("height", "auto");
        }
    }).focus(function () {
        $(this).blur();
    })
})


/* 团购 */
$(function () {
    // 标签检索下拉

    $("dl.t_proStags dd.t_proStagsMore a").click(function () {

        if ($(this).hasClass("show")) {
            $(this).removeClass("show").text("展开");
            $(this).parents("div.t_proStags_list").css({ "height": 78 });

        } else {
            $(this).addClass("show").text("收起");
            $(this).parents("div.t_proStags_list").css({ "height": "auto" });

        }
    })

    $("div.buypro_num").each(function () {
        var that = $(this);
        // 增
        that.find(".buypro_num_add").click(function () {
            var n = that.find("input.buypro_num_i").val();
            var price = Number(that.parents("tr").find(".buypro_price").text().replace(/(^\s*)|(\s*$)/g, "").replace("￥", ""));
            n++;
            that.find("input.buypro_num_i").val(n);
        });
        // 减
        that.find(".buypro_num_del").click(function () {
            var n = that.find("input.buypro_num_i").val();
            var price = Number(that.parents("tr").find(".buypro_price").text().replace(/(^\s*)|(\s*$)/g, "").replace("￥", ""));
            n--;
            if (n < 0) { n = 0 };
            that.find("input.buypro_num_i").val(n);
        });
    })

    // 限时抢购 timer
    //	$("div.tbuybox_buytimer").each(function(){
    //		var time = $(this).attr("endtime").split(",");
    //		var timer_Id = $(this).attr("id");
    //		var time_tpl = '<strong class="time">{d}</strong>天<strong>{h}</strong>时<strong>{m}</strong>分<strong>{s}</strong>秒';
    //		countDownTime(new Date(time[0],time[1]-1,time[2],time[3],time[4],time[5]),timer_Id,time_tpl,true);
    //	});
})

