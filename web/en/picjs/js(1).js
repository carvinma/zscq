
var isIE6 = false;
var starref = false;
$(document).ready(function() {}); 
function SumPrice() {
    var a = $(".goodsCar .dpxj0523");
    if (getCloseCode()) {
        var c = Number($("#selectedAmount").val());
        var b = Number($(".cuxiaoPrice strong").eq(0).text());
        a.show().children("span").html((c * b).toFixed(2))
    } else {
        a.hide()
    }
}


var sizetitle = "";
$(function() {

	/*放大镜*/
    
    $("#imageMenu").scrollTop(0); 
	
	(function() {
        function s(z) {
            var v = $(".qwbig");
            var w = $(".qwbig img").css({
                width: "800px",
                height: "800px;"
            });
            var A = $("#midimg").attr("src") || "";
            var y = w.attr("src");
            if (A != "" && A.replace("mid", "big") != y) {
                w.attr("src", A).show();
                var x = new Image();
                x.src = A.replace("mid", "big");
                x.onload = function() {
                    w.attr("src", x.src)
                }
            }
            t(z);
            z.stopPropagation();
            return false
        }
        function t(v) {
            if ($("#winSelector").css("display") == "none") {
                $("#winSelector,.qwbig").show()
            }
            $("#winSelector").css(r(v));
            v.stopPropagation();
            return false
        }
        function u(v) {
            if ($("#winSelector").css("display") != "none") {
                $("#winSelector,.qwbig").hide()
            }
            v.stopPropagation();
            return false
        }
        if (document.createTouch) {
            $("#midimg,#winSelector").live("touchmove", t).live("touchstart", s).live("touchend", u)
        } else {
            $("#midimg, #winSelector").live("mouseenter", s);
            $("#winSelector").live("mousemove", t);
            $("#midimg,#winSelector").live("mouseout", u)
        }
        var n = $("#winSelector").width();
        var e = $("#winSelector").height();
        var p = $("#midimg").width();
        var o = $("#midimg").height();
        var q = $viewImgHeight = $height = null;
        $("#bigView").scrollTop(0);
        function r(x) {
            if (x == null) {
                return
            }
            var z = x.clientX + $(document).scrollLeft();
            var A = x.clientY + $(document).scrollTop();
            if (document.createTouch) {
                z = event.touches[0].pageX;
                A = event.touches[0].pageY
            }
            var v = $("#midimg").offset().left;
            var w = $("#midimg").offset().top;
            X = z - v - n / 2;
            Y = A - w - e / 2;
            X = X < 0 ? 0 : X;
            Y = Y < 0 ? 0 : Y;
            X = X + n > p ? p - n: X;
            Y = Y + e > o ? o - e: Y;
			/*
            if (q == null) {
                q = $("#bigView img").outerWidth();
                $viewImgHeight = $("#bigView img").height();
                if (q < 200 || $viewImgHeight < 200) {
                    q = $viewImgHeight = 800
                }
                $height = e * $viewImgHeight / o;
                $("#bigView").width(460);
                $("#bigView").height(410)
            }
            var B = X * q / p;
            var C = Y * $viewImgHeight / o;
            $("#bigView img").css({
                left: B * -1,
                top: C * -1
            });
            var E = document.documentElement.clientHeight == 0 ? document.body.clientHeight: document.documentElement.clientHeight;
            var D = ((E - $height) / 2);
            D = D < 245 ? 245 : D;
            var y = $(".danpinBox").offset().left + 495;
            if (isIE6) {
                y = ie6.setLeft(y)
            }
            $("#bigView").css({
                top: D,
                left: y
            });*/
            return {
                left: X,
                top: Y
            }
        }
    })();
	/*放大镜结束*/

	
	(function() {
        $(".RsetTabMenu li").click(function() {
            var n = $(".RsetTabMenu li");
            n.removeClass("hover").addClass("down");
            $(this).addClass("hover").removeClass("down");
            var e = $(this).prevAll().length;
            var o = $(".RsetTabCon");
            o.hide();
            if ($.trim(o.eq(e).html()) == "") {
                $.get($(this).find("a").attr("href"),
                function(p) {
                    o.eq(e).html(p)
                }).success(function() {
                    o.eq(e).show()
                })
            } else {
                o.eq(e).show()
            }
            if (e > 0) {
                $(".RsetTabArea>.liketabfg,.RsetTabArea>.blank20,.RsetTabArea>.blank15,#starvancl").hide()
            } else {
                $(".RsetTabArea>.liketabfg,.RsetTabArea>.blank20,.RsetTabArea>.blank15,#starvancl").show();
                o.eq(1).hide();
                o.eq(2).hide()
            }
            return false
        })
    })();
	
    $("#selectedAmount").live("change", SumPrice);
    $(window).one("scroll",function() {}); 

});



/*提问框从这开始*/
function askSubmit() {
    if ($("#content").val() == 0) {
        alert("请填写内容");
        return
    }
    if (typeof($("input[name='questionType']:checked").val()) == "undefined") {
        $("#qtype").show();
        return
    }
    var c = $("#title").val();
    var a = $("#content").val();
    var b = $("input[name='questionType']:checked").val();
    var d = "/styles/AjaxSendQuiz.aspx?styleid=" + $(window.parent.document.body).find("#styleinfo").attr("name");
    $.ajax({
        async: true,
        cache: false,
        type: "POST",
        dataType: "html",
        url: d,
        timeout: 5000,
        data: "title=" + escape(c) + "&addtext=" + escape(a) + "&quizType=" + b,
        success: function(e) {
            if (e == "ok") {
                alert("问题提交成功！请等待审核。")
            } else {
                if (e == "no") {
                    alert("问题提交失败！")
                } else {
                    alert(e)
                }
            }
            $("#content").val("");
            $(".Askquestion").hide()
        },
        error: function(e) {
            alert("服务器内部错误，请与管理员联系！");
            $("#content").val("");
            $(".Askquestion").hide()
        }
    })
}
$(document).ready(function() {
    $("#content").keyup(function() {
        if (this.value.length >= 300) {
            this.value = this.value.substring(0, 300)
        }
    });
    $("#tijiao").click(askSubmit)
});
$(document).ready(function() {
    $("#quiztype").click(function() {
        $("#qtype").hide()
    })
}); 
/*提问框到这结束*/
/*下面控制左侧缩略图上下滚动*/
var smallImgData = [];
smallImgData.downHover = {
    direction: 1,
    target: "last-child",
    className: "downer",
    visible: function() {
        var a = $("#imageMenu");
        if (a.length == 1) {
            return a.scrollTop() + a.height() == a.get(0).scrollHeight
        } else {

            return false
        }
    },
    span: function(a) {
        return a.position().top
    },
    scrollSpan: function(a) {
        return a.scrollTop()
    },
    animateParam: function(a) {
        return {
            scrollTop: a
        }
    }
};
smallImgData.upHover = {
    direction: -1,
    target: "first",
    className: "upper",
    visible: function() {
        return $("#imageMenu").scrollTop() == 0
    },
    span: function(a) {
        return a.position().top
    },
    scrollSpan: function(a) {
        return a.scrollTop()
    },
    animateParam: function(a) {
        return {
            scrollTop: a
        }
    }
};

function checkMenuStatus() {
    for (key in smallImgData) {
        if (smallImgData[key] != undefined && typeof(smallImgData[key].visible) != "undefined" && smallImgData[key].visible()) {
            $("." + key).removeClass(key).addClass(smallImgData[key].className)
        } else {
            $("." + smallImgData[key].className).addClass(key).removeClass(smallImgData[key].className)
        }
    }
}
$(function() {
    $(".smallImgDown,.smallImgUp").live("click",
    function() {
        var b = $(this).attr("class");
        if (b.indexOf("downHover") > -1) {
            b = "downHover"
        }
        if (b.indexOf("upHover") > -1) {
            b = "upHover"
        }
        if (b == "downHover" || b == "upHover") {
            var d = smallImgData[b];
            var e = 0;
            while (d.span($("#imageMenu")) > d.span($("#imageMenu li").eq(e))) {
                e++
            }
            e += 5 * d.direction;
            var a = $("#imageMenu li").eq(e);
            if (a.length == 0 || e < 0) {
                a = $("#imageMenu li:" + d.target)
            }
            var c = d.scrollSpan($("#imageMenu")) + d.span(a) - d.span($("#imageMenu"));
            $("#imageMenu").animate(d.animateParam(c), 500, checkMenuStatus)
        }
    })
});