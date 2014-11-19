// JavaScript Document
(function($) {
    $.Autocompleter = function(input, options) {
        var KEY = {
            UP: 38,
            DOWN: 40,
            DEL: 46,
            TAB: 9,
            RETURN: 13,
            ESC: 27,
            COMMA: 188,
            PAGEUP: 33,
            PAGEDOWN: 34,
            BACKSPACE: 8
        };
        var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);
        var timeout;
        var previousValue = "";
        var cache = $.Autocompleter.Cache(options);
        var hasFocus = 0;
        var lastKeyPressCode;
        var config = {
            mouseDownOnSelect: false
        };
        var select = $.Autocompleter.Select(options, input, selectCurrent, config);
        var blockSubmit;
        var requestQueue = 0;
        $.browser.opera && $(input.form).bind("submit.autocomplete",
        function() {
            if (blockSubmit) {
                blockSubmit = false;
                return false
            }
        });
        $input.bind(($.browser.opera ? "keypress": "keydown") + ".autocomplete",
        function(event) {
            hasFocus = 1;
            lastKeyPressCode = event.keyCode;
            switch (event.keyCode) {
            case KEY.UP:
                event.preventDefault();
                if (select.visible()) {
                    select.prev()
                } else {
                    onChange(0, true)
                }
                break;
            case KEY.DOWN:
                event.preventDefault();
                if (select.visible()) {
                    select.next()
                } else {
                    onChange(0, true)
                }
                break;
            case KEY.PAGEUP:
                event.preventDefault();
                if (select.visible()) {
                    select.pageUp()
                } else {
                    onChange(0, true)
                }
                break;
            case KEY.PAGEDOWN:
                event.preventDefault();
                if (select.visible()) {
                    select.pageDown()
                } else {
                    onChange(0, true)
                }
                break;
            case options.multiple && $.trim(options.multipleSeparator) == "," && KEY.COMMA: case KEY.TAB:
            case KEY.RETURN:
                if (selectCurrent()) {
                    event.preventDefault();
                    blockSubmit = true;
                    return false
                } else {
                    $input.trigger("noresult")
                }
                break;
            case KEY.ESC:
                select.hide();
                break;
            default:
                clearTimeout(timeout);
                timeout = setTimeout(onChange, options.delay);
                break
            }
        }).focus(function() {
            hasFocus++
        }).blur(function() {
            hasFocus = 0;
            if (!config.mouseDownOnSelect) {
                hideResults()
            }
        }).click(function() {
            if (hasFocus++>1 && !select.visible()) {
                onChange(0, true)
            }
        }).bind("search",
        function() {
            var fn = (arguments.length > 1) ? arguments[1] : null;
            function findValueCallback(q, data) {
                var result;
                if (data && data.length) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].result.toLowerCase() == q.toLowerCase()) {
                            result = data[i];
                            break
                        }
                    }
                }
                if (typeof fn == "function") {
                    fn(result)
                } else {
                    $input.trigger("result", result && [result.data, result.value])
                }
            }
            $.each(trimWords($input.val()),
            function(i, value) {
                request(value, findValueCallback, findValueCallback)
            })
        }).bind("flushCache",
        function() {
            cache.flush()
        }).bind("setOptions",
        function() {
            $.extend(options, arguments[1]);
            if ("data" in arguments[1]) {
                cache.populate()
            }
        }).bind("unautocomplete",
        function() {
            select.unbind();
            $input.unbind();
            $(input.form).unbind(".autocomplete")
        }).bind("input",
        function() {
            onChange(0, true)
        });
        function selectCurrent() {
            var selected = select.selected();
            if (!selected) {
                return false
            }
            var v = selected.result;
            previousValue = v;
            if (options.multiple) {
                var words = trimWords($input.val());
                if (words.length > 1) {
                    var seperator = options.multipleSeparator.length;
                    var cursorAt = $(input).selection().start;
                    var wordAt, progress = 0;
                    $.each(words,
                    function(i, word) {
                        progress += word.length;
                        if (cursorAt <= progress) {
                            wordAt = i;
                            return false
                        }
                        progress += seperator
                    });
                    words[wordAt] = v;
                    v = words.join(options.multipleSeparator)
                }
                v += options.multipleSeparator
            }
            $input.val(v);
            hideResultsNow();
            $input.trigger("result", [selected.data, selected.value, selected.idx]);
            return true
        }
        function onChange(crap, skipPrevCheck) {
            if (lastKeyPressCode == KEY.DEL) {
                select.hide();
                return
            }
            var currentValue = $input.val();
            if (!skipPrevCheck && currentValue == previousValue) {
                return
            }
            previousValue = currentValue;
            currentValue = lastWord(currentValue);
            if (currentValue.length >= options.minChars) {
                $input.addClass(options.loadingClass);
                if (!options.matchCase) {
                    currentValue = currentValue.toLowerCase()
                }
                request(currentValue, receiveData, hideResultsNow)
            } else {
                stopLoading();
                select.hide()
            }
        }
        function trimWords(value) {
            if (!value) {
                return [""]
            }
            if (!options.multiple) {
                return [$.trim(value)]
            }
            return $.map(value.split(options.multipleSeparator),
            function(word) {
                return $.trim(value).length ? $.trim(word) : null
            })
        }
        function lastWord(value) {
            if (!options.multiple) {
                return value
            }
            var words = trimWords(value);
            if (words.length == 1) {
                return words[0]
            }
            var cursorAt = $(input).selection().start;
            if (cursorAt == value.length) {
                words = trimWords(value)
            } else {
                words = trimWords(value.replace(value.substring(cursorAt), ""))
            }
            return words[words.length - 1]
        }
        function autoFill(q, sValue) {
            if (options.autoFill && (lastWord($input.val()).toLowerCase() == q.toLowerCase()) && lastKeyPressCode != KEY.BACKSPACE) {
                $input.val($input.val() + sValue.substring(lastWord(previousValue).length));
                $(input).selection(previousValue.length, previousValue.length + sValue.length)
            }
        }
        function hideResults() {
            clearTimeout(timeout);
            timeout = setTimeout(hideResultsNow, 200)
        }
        function hideResultsNow() {
            var wasVisible = select.visible();
            select.hide();
            clearTimeout(timeout);
            stopLoading();
            if (options.mustMatch) {
                $input.search(function(result) {
                    if (!result) {
                        if (options.multiple) {
                            var words = trimWords($input.val()).slice(0, -1);
                            $input.val(words.join(options.multipleSeparator) + (words.length ? options.multipleSeparator: ""))
                        } else {
                            $input.val("");
                            $input.trigger("result", null)
                        }
                    }
                })
            }
        }
        function receiveData(q, data) {
            if (data && data.length && hasFocus) {
                stopLoading();
                select.display(data, q);
                autoFill(q, data[0].value);
                select.show()
            } else {
                hideResultsNow()
            }
        }
        function request(term, success, failure) {
            if (!options.matchCase) {
                term = term.toLowerCase()
            }
            var data = cache.load(term);
            if (data && data.length) {
                success(term, data)
            } else {
                if ((typeof options.url == "string") && (options.url.length > 0)) {
                    var extraParams = {};
                    $.each(options.extraParams,
                    function(key, param) {
                        extraParams[key] = typeof param == "function" ? param() : param
                    });
                    var current = ++requestQueue;
                    window.setTimeout(function() {
                        if (current != requestQueue) {
                            return
                        }
                        $.ajax({
                            mode: "abort",
                            port: "autocomplete" + input.name,
                            dataType: options.dataType,
                            jsonpCallback: "jqautocompletecallback",
                            cache: true,
                            url: options.url,
                            data: $.extend({
                                k: lastWord(term),
                                limit: options.max
                            },
                            extraParams),
                            success: function(data) {
                                var parsed = options.parse && options.parse(data) || parse(data);
                                cache.add(term, parsed);
                                success(term, parsed)
                            }
                        })
                    },
                    200)
                } else {
                    select.emptyList();
                    failure(term)
                }
            }
        }
        function parse(data) {
            var parsed = [];
            var json = eval(data);
            if (typeof(json) != "undefined" && json != null && json.length > 0) {
                for (var i = 0; i < json.length; i++) {
                    parsed.push({
                        data: json[i],
                        value: json[i],
                        result: json[i].name,
                        idx: i
                    })
                }
            }
            return parsed
        }
        function stopLoading() {
            $input.removeClass(options.loadingClass)
        }
    };
    $.Autocompleter.defaults = {
        inputClass: "ac_input",
        resultsClass: "ac_results",
        loadingClass: "ac_loading",
        minChars: 1,
        delay: 400,
        matchCase: false,
        matchSubset: false,
        matchContains: false,
        cacheLength: 10,
        max: 100,
        mustMatch: false,
        extraParams: {},
        selectFirst: true,
        formatItem: function(row) {
            return row[0]
        },
        formatMatch: null,
        autoFill: false,
        width: 0,
        multiple: false,
        multipleSeparator: ", ",
        highlight: function(value, term) {
            return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>")
        },
        scroll: false,
        scrollHeight: 180
    };
    $.Autocompleter.Cache = function(options) {
        var data = {};
        var length = 0;
        function matchSubset(s, sub) {
            if (!options.matchCase) {
                s = s.toLowerCase()
            }
            var i = s.indexOf(sub);
            if (options.matchContains == "word") {
                i = s.toLowerCase().search("\\b" + sub.toLowerCase())
            }
            if (i == -1) {
                return false
            }
            return i == 0 || options.matchContains
        }
        function add(q, value) {
            if (length > options.cacheLength) {
                flush()
            }
            if (!data[q]) {
                length++
            }
            data[q] = value
        }
        function populate() {
            if (!options.data) {
                return false
            }
            var stMatchSets = {},
            nullData = 0;
            if (!options.url) {
                options.cacheLength = 1
            }
            stMatchSets[""] = [];
            for (var i = 0,
            ol = options.data.length; i < ol; i++) {
                var rawValue = options.data[i];
                rawValue = (typeof rawValue == "string") ? [rawValue] : rawValue;
                var value = options.formatMatch(rawValue, i + 1, options.data.length);
                if (value === false) {
                    continue
                }
                var firstChar = value.charAt(0).toLowerCase();
                if (!stMatchSets[firstChar]) {
                    stMatchSets[firstChar] = []
                }
                var row = {
                    value: value,
                    data: rawValue,
                    result: options.formatResult && options.formatResult(rawValue) || value
                };
                stMatchSets[firstChar].push(row);
                if (nullData++<options.max) {
                    stMatchSets[""].push(row)
                }
            }
            $.each(stMatchSets,
            function(i, value) {
                options.cacheLength++;
                add(i, value)
            })
        }
        setTimeout(populate, 25);
        function flush() {
            data = {};
            length = 0
        }
        return {
            flush: flush,
            add: add,
            populate: populate,
            load: function(q) {
                if (!options.cacheLength || !length) {
                    return null
                }
                if (!options.url && options.matchContains) {
                    var csub = [];
                    for (var k in data) {
                        if (k.length > 0) {
                            var c = data[k];
                            $.each(c,
                            function(i, x) {
                                if (matchSubset(x.value, q)) {
                                    csub.push(x)
                                }
                            })
                        }
                    }
                    return csub
                } else {
                    if (data[q]) {
                        return data[q]
                    } else {
                        if (options.matchSubset) {
                            for (var i = q.length - 1; i >= options.minChars; i--) {
                                var c = data[q.substr(0, i)];
                                if (c) {
                                    var csub = [];
                                    $.each(c,
                                    function(i, x) {
                                        if (matchSubset(x.value, q)) {
                                            csub[csub.length] = x
                                        }
                                    });
                                    return csub
                                }
                            }
                        }
                    }
                }
                return null
            }
        }
    };
    $.Autocompleter.Select = function(options, input, select, config) {
        var CLASSES = {
            ACTIVE: "ac_over"
        };
        var listItems, active = -1,
        data, term = "",
        needsInit = true,
        element, list;
        function init() {
            if (!needsInit) {
                return
            }
            element = $("<div/>").hide().addClass(options.resultsClass).css("position", "absolute").appendTo(document.body);
            list = $("<ul/>").appendTo(element).mouseover(function(event) {
                if (target(event).nodeName && target(event).nodeName.toUpperCase() == "LI") {
                    active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
                    $(target(event)).addClass(CLASSES.ACTIVE)
                }
            }).click(function(event) {
                $(target(event)).addClass(CLASSES.ACTIVE);
                select();
                input.focus();
                return false
            }).mousedown(function() {
                config.mouseDownOnSelect = true
            }).mouseup(function() {
                config.mouseDownOnSelect = false
            });
            if (options.width > 0) {
                element.css("width", options.width)
            }
            needsInit = false
        }
        function target(event) {
            var element = event.target;
            while (element && element.tagName != "LI") {
                element = element.parentNode
            }
            if (!element) {
                return []
            }
            return element
        }
        function moveSelect(step) {
            listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
            movePosition(step);
            var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
            input.value = data[active].data.name;
            if (options.scroll) {
                var offset = 0;
                listItems.slice(0, active).each(function() {
                    offset += this.offsetHeight
                });
                if ((offset + activeItem[0].offsetHeight - list.scrollTop()) > list[0].clientHeight) {
                    list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight())
                } else {
                    if (offset < list.scrollTop()) {
                        list.scrollTop(offset)
                    }
                }
            }
        }
        function movePosition(step) {
            active += step;
            if (active < 0) {
                active = listItems.size() - 1
            } else {
                if (active >= listItems.size()) {
                    active = 0
                }
            }
        }
        function limitNumberOfItems(available) {
            return options.max && options.max < available ? options.max: available
        }
        function fillList() {
            list.empty();
            var max = limitNumberOfItems(data.length);
            for (var i = 0; i < max; i++) {
                if (!data[i]) {
                    continue
                }
                var formatted = options.formatItem(data[i].data, i + 1, max, data[i].value, term);
                if (formatted === false) {
                    continue
                }
                var li = $("<li/>").html(options.highlight(formatted, term)).addClass(i % 2 == 0 ? "ac_even": "ac_odd").appendTo(list)[0];
                $.data(li, "ac_data", data[i])
            }
            listItems = list.find("li");
            if (options.selectFirst) {
                listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
                active = 0
            }
            if ($.fn.bgiframe) {
                list.bgiframe()
            }
        }
        return {
            display: function(d, q) {
                init();
                data = d;
                term = q;
                fillList()
            },
            next: function() {
                moveSelect(1)
            },
            prev: function() {
                moveSelect( - 1)
            },
            pageUp: function() {
                if (active != 0 && active - 8 < 0) {
                    moveSelect( - active)
                } else {
                    moveSelect( - 8)
                }
            },
            pageDown: function() {
                if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
                    moveSelect(listItems.size() - 1 - active)
                } else {
                    moveSelect(8)
                }
            },
            hide: function() {
                element && element.hide();
                listItems && listItems.removeClass(CLASSES.ACTIVE);
                active = -1
            },
            visible: function() {
                return element && element.is(":visible")
            },
            current: function() {
                return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0])
            },
            show: function() {
                var offset = $(input).offset();
                var offsetleft = offset.left;
                var bodyleft = $("#Head").offset().left;
                if ($(document.body).css("position") == "relative") {
                    offsetleft = offsetleft - bodyleft
                }
                element.css({
                    width: typeof options.width == "string" || options.width > 0 ? options.width: $(input).width(),
                    top: offset.top + input.offsetHeight,
                    left: offsetleft
                }).show();
                if (options.scroll) {
                    list.scrollTop(0);
                    list.css({
                        maxHeight: options.scrollHeight,
                        overflow: "auto"
                    });
                    if ($.browser.msie && typeof document.body.style.maxHeight === "undefined") {
                        var listHeight = 0;
                        listItems.each(function() {
                            listHeight += this.offsetHeight
                        });
                        var scrollbarsVisible = listHeight > options.scrollHeight;
                        list.css("height", scrollbarsVisible ? options.scrollHeight: listHeight);
                        if (!scrollbarsVisible) {
                            listItems.width(list.width() - parseInt(listItems.css("padding-left")) - parseInt(listItems.css("padding-right")))
                        }
                    }
                }
            },
            selected: function() {
                var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
                return selected && selected.length && $.data(selected[0], "ac_data")
            },
            emptyList: function() {
                list && list.empty()
            },
            unbind: function() {
                element && element.remove()
            }
        }
    };
    $.fn.selection = function(start, end) {
        if (start !== undefined) {
            return this.each(function() {
                if (this.createTextRange) {
                    var selRange = this.createTextRange();
                    if (end === undefined || start == end) {
                        selRange.move("character", start);
                        selRange.select()
                    } else {
                        selRange.collapse(true);
                        selRange.moveStart("character", start);
                        selRange.moveEnd("character", end);
                        selRange.select()
                    }
                } else {
                    if (this.setSelectionRange) {
                        this.setSelectionRange(start, end)
                    } else {
                        if (this.selectionStart) {
                            this.selectionStart = start;
                            this.selectionEnd = end
                        }
                    }
                }
            })
        }
        var field = this[0];
        if (field.createTextRange) {
            var range = document.selection.createRange(),
            orig = field.value,
            teststring = "<->",
            textLength = range.text.length;
            range.text = teststring;
            var caretAt = field.value.indexOf(teststring);
            field.value = orig;
            this.selection(caretAt, caretAt + textLength);
            return {
                start: caretAt,
                end: caretAt + textLength
            }
        } else {
            if (field.selectionStart !== undefined) {
                return {
                    start: field.selectionStart,
                    end: field.selectionEnd
                }
            }
        }
    }
})(jQuery);
function bookmarksite(a, b) {
    if (document.all) {
        window.external.AddFavorite(b, a)
    } else {
        if (window.sidebar) {
            window.sidebar.addPanel(a, b, "")
        }
    }
}
function OnEnter(b) {
    var a = $.trim($("#skey").attr("defaultkey"));
    if (typeof(a) != "undefined" && a != "") {
        if ($.trim(b.value) == $.trim(b.defaultValue)) {
            b.value = ""
        }
    }
}
function OnExit(a) {}
function OnKeyUp(a) {}
function OnMouseOver(a) {
    a.select()
}
function Search(f, b, g, d) {
    f = $.trim(f);
    var c = $.trim($("#skey").attr("defaultkey"));
    if (typeof(c) != "undefined" && c != "") {
        if (f == "搜 " + c + " 试试") {
            f = c
        }
    }
    var e = $("#searchBar li.hover").attr("key") == "vjia";
    if (e) {
        trackurl("s-hp_s-vjia_keyword-0");
        window.location.href = "http://www.vjia.com/Product/Product_KeyWordPost.aspx?Source=vjia-search-keywords&skey=" + encodeURIComponent(f);
        return
    }
    var h = "";
    if (typeof(d) != "undefined" && d != null) {
        h = "s-hp_s-0_keyword_auto-";
        if (typeof(b) != "undefined" && b != null) {
            h += b
        } else {
            h += "0"
        }
        h += "-" + d
    } else {
        h = "s-hp_s-0_keyword-0"
    }
    trackurl(h);
    var i = "search";
    if (typeof(b) != "undefined" && b != null) {
        i = b + ".html"
    }
    var a = "";
    if (typeof(g) != "undefined" && g != null) {
        a = "&orig=" + g
    }
    window.location.href = "http://s.vancl.com/" + i + "?k=" + encodeURIComponent(f) + a
}
var VANCL = VANCL || {};
VANCL.Global = {
    setLoginInfo: function() {
        var c = this.getCookie("UserLogin");
        if (c != null && c != "" && c.length > 0) {
            var a = c.split("&");
            for (var b = 0; b < a.length; b++) {
                if (a[b].indexOf("NewUserName=") == 0) {
                    var d = a[b].substring(12);
                    d = decodeURIComponent(d);
                    d = this._sub(d, 10);
                    $("#welcome").html("您好, <a href='http://my.vancl.com' class='top track' name='head-denglu' style='color: rgb(51, 51, 51);'>" + d + "</a> <span style='color: #a10000'><a class='top track' style='color: #a10000'  href='https://login.vancl.com/Login/UserLoginOut.aspx' target='_parent' name='head-tcdl' >退出登录</a>&nbsp;|&nbsp;<a class='track' name='head-ghyh' href=\"javascript:location.href='https://login.vancl.com/login/login.aspx?'+location.href\" style='color: #a10000'>更换用户</a></span>");
                    break
                }
            }
        }
    },
    getCookie: function(b) {
        var a = "";
        var c = b + "=";
        if (document.cookie.length > 0) {
            offset = document.cookie.indexOf(c);
            if (offset != -1) {
                offset += c.length;
                end = document.cookie.indexOf(";", offset);
                if (end == -1) {
                    end = document.cookie.length
                }
                a = document.cookie.substring(offset, end)
            }
        }
        return a
    },
    _sub: function(e, c) {
        var d = /[^\x00-\xff]/g;
        if (e.replace(d, "mm").length <= c) {
            return e
        }
        var b = Math.floor(c / 2);
        for (var a = b; a < e.length; a++) {
            if (e.substr(0, a).replace(d, "mm").length >= c) {
                return e.substr(0, a) + "..."
            }
        }
        return e
    }
};
var VANCL = VANCL || {};
VANCL.MiniCart = {
    config: {
        mcShoppingCartUrl: "http://shopping.vancl.com/mycart",
        gettting: 0,
        trackSBUSetting: 0
    },
    setCartNum: function() {
        var e = this,
        a = this.config,
        d = 0;
        var c = e._getCartCookie();
        if (c) {
            var b = c.split("$");
            if (b.length > 1 && b[1] != null) {
                d = b[1]
            }
        }
        $('span[car_product_total="shoppingCar_product_totalcount"]').html(d + "")
    },
    getCart: function() {
        var b = this,
        a = this.config;
        if (a.gettting == false) {
            b._ajaxProductJsonData()
        }
        if (a.trackSBUSetting == false) {
            b.trackSBU()
        }
    },
    _showNoProductStatus: function() {
        var c = this,
        a = this.config;
        var b = '<div class="shopnopru">';
        b = b + '<div class="SCtotalpageno">您的购物车中没有任何商品</div>';
        b = b + '<div class="SCtotalpageBottom"></div>';
        b = b + "</div>";
        $("#shoppingCarNone .shopDropList").html(b);
        $('span[car_product_total="shoppingCar_product_totalcount"]').html("0")
    },
    _showLoading: function() {
        var c = this,
        a = this.config;
        var b = '<div class="shopnopru">';
        b = b + '<div class="SCtotalpageno" style="text-align:center; vertical-align:middle;"><img src="http://i.vanclimg.com/alterorder/loading.gif" alt="购物车数据加载中" /></div>';
        b = b + '<div class="SCtotalpageBottom"></div>';
        b = b + "</div>";
        $("#shoppingCarNone .shopDropList").html(b)
    },
    _formatterPrice: function(d) {
        var b = d.indexOf("."),
        c = d.length,
        a = "";
        if (b > 0) {
            while (true) {
                a = d.substr(c - 1, 1);
                if (a == "0") {
                    c--
                } else {
                    if (a == ".") {
                        c--;
                        break
                    } else {
                        break
                    }
                }
            }
        }
        return d.substr(0, c)
    },
    _ajaxProductJsonData: function() {
        var c = this,
        a = this.config;
        c._showLoading();
        c._log("_ajaxProductJsonData");
        var b = {
            userId: c._getEncryptUserIdFromCookie(),
            indexPage: 1,
            pageSize: 7,
            shoppingcart: "",
            shoppingpointcart: "",
            shoppingPresent: ""
        };
        var d = "http://minicart.vancl.com/DealMiniShoppingServer.asmx/GetMiniJsonDataByPage?callback=?";
        $.ajax({
            contentType: "application/json;utf-8",
            url: d,
            data: b,
            dataType: "json",
            success: function(e) {
                c._callbackProductJsonData(e);
                c._setCartCookie(e)
            },
            error: function(e) {
                c._showNoProductStatus();
                $("#" + a.mcCountId).html("0")
            }
        })
    },
    _callbackProductJsonData: function(d, f, e) {
        var j = 0,
        k = 0,
        g = this,
        a = this.config,
        c = [],
        h = "http://i.vanclimg.com/36";
        g._log("_callbackProductJsonData");
        if (d && d.data && d.data.length > 0) {
            j = d.TotalCount;
            k = d.TotalPrice;
            k = g._formatterPrice(k);
            c.push('<div class="havepru">');
            c.push('<div class="havepruTop"></div>');
            c.push('<div class="havepruMid">');
            c.push("<h2>最近加入的商品：</h2>");
            c.push("<ul>");
            $.each(d.data,
            function(m) {
                var n = this["productImageUrl"],
                s = this["ProductUrl"],
                o = this["ProductName"],
                q = this["ProductPrice"],
                v = this["Qty"],
                l = this["clothesCode"],
                r = this["productType"],
                t = this["PromoteeId"],
                u = this["PromoteeIndex"],
                p = o;
                if (o.length > 14) {
                    p = o.substring(0, 14) + "…"
                }
                if (n.indexOf("https://sslimg.vancl.com")) {
                    n = h + n.substring(23)
                } else {
                    if (n.indexOf("https://sslimg.vanclimg.com")) {
                        n = h + n.substring(26)
                    } else {
                        if (n.indexOf("http://images.vancl.com")) {
                            n = h + n.substring(22)
                        } else {
                            if (n.indexOf("http://i.vanclimg.com")) {
                                n = h + n.substring(20)
                            }
                        }
                    }
                }
                c.push("<li>");
                c.push('<div class="carListLeft">');
                c.push('    <a href="' + s + '"><img src="' + n + '" alt="' + o + '" width="36" heigth="36" /></a>');
                c.push("</div>");
                c.push('<div class="carListRight">');
                c.push('    <h3><a href="' + s + '" title="' + o + '">' + p + "</a></h3>");
                c.push('    <span class="blank0"></span>');
                c.push('    <div class="priceArea">');
                c.push("        <strong>￥" + q + "</strong><em>×" + v + "</em>");
                c.push("    </div>");
                c.push("</div>");
                c.push('<div class="carListDelect">');
                c.push('    <a class="track" name="head-minicart-delproduct" style="cursor:pointer;" onclick="VANCL.MiniCart.deleteProduct(\'' + l + "','" + r + "','" + t + "','" + u + "','" + v + "','" + q + "')\">Delete</a>");
                c.push("</div>");
                c.push('<span class="blank0"></span>');
                c.push("</li>")
            });
            c.push("</ul>");
            c.push('<div class="ShopCarPageLine"></div>');
            var b = function(l) {
                g._log("defaultCallcack:" + l);
                c.push('<div class="ShopCarPage">');
                c.push('    <div class="SCtotalpage">');
                c.push("        <div>共计(未计算促销折扣)<span>￥" + k + "</span></div>");
                c.push('        <strong><a class="track" name="head-minicart-shopping" href="' + a.mcShoppingCartUrl + '" rel="nofollow">查看购物车(<span car_product_total="shoppingCar_product_totalcount">' + j + "</span>件)</a></strong>");
                c.push('        <span class="blank0"></span>');
                c.push("    </div>");
                c.push("</div>");
                c.push("</div>");
                c.push('<div class="havepruBom"></div>');
                c.push("</div>");
                $("#shoppingCarNone .shopDropList").html(c.join(""))
            };
            var i = function(l) {
                g._log("successCallback" + l);
                c.push('<div class="ShopCarPage">');
                c.push('    <div class="SCtotalpage">');
                c.push("        <div>共计(未计算促销折扣)<span>￥" + k + "</span></div>");
                c.push('        <a class="track settleMent" name="head-minicart-buynow" href="//buy.vancl.com/?from=minicart" rel="nofollow">立即结算</a>');
                c.push('        <strong><a class="track" name="head-minicart-shopping" href="' + a.mcShoppingCartUrl + '" rel="nofollow">查看购物车(<span car_product_total="shoppingCar_product_totalcount">' + j + "</span>件)</a></strong>");
                c.push('        <span class="blank0"></span>');
                c.push("    </div>");
                c.push("</div>");
                c.push("</div>");
                c.push('<div class="havepruBom"></div>');
                c.push("</div>");
                $("#shoppingCarNone .shopDropList").html(c.join(""))
            };
            if (d.IsShowBuy && d.IsShowBuy == "1") {
                g.statisticsCheckoutNowPV();
                i()
            } else {
                b()
            }
            a.gettting = !0
        } else {
            g._showNoProductStatus()
        }
        $('span[car_product_total="shoppingCar_product_totalcount"]').html(j + "")
    },
    deleteProduct: function(b, e, f, g, h, d) {
        var i = this,
        a = this.config;
        i._showLoading();
        var c = {
            userId: i._getEncryptUserIdFromCookie(),
            indexPage: 1,
            pageSize: 7,
            clotheCode: b,
            productType: e,
            PromoteeId: f,
            PromoteeIdIndex: g,
            shoppingcart: "",
            shoppingpointcart: "",
            shoppingPresent: ""
        };
        var j = "http://minicart.vancl.com/DealMiniShoppingServer.asmx/DelMiniJsonProduct?callback=?";
        $.ajax({
            contentType: "application/json;utf-8",
            data: c,
            dataType: "json",
            url: j,
            success: function(k) {
                i._callbackProductJsonData(k);
                i._setCartCookie(k, h, d)
            },
            error: function(k) {
                i._showNoProductStatus();
                $("#" + a.mcCountId).html("0")
            }
        })
    },
    _setCartCookie: function(f, h, g) {
        var j = 0,
        i = this,
        a = this.config,
        b = [];
        i._log("_setCartCookie");
        if (f && f.data) {
            j = f.TotalCount;
            var d = f.delStaues;
            var c = i._getCartCookie();
            if (c) {
                b = c.split("$");
                if (b.length > 1) {
                    if (parseInt(b[1]) == j) {
                        return
                    }
                    if (d == "ok" && h != null && g != null) {
                        h = h == null ? 1 : parseInt(h);
                        g = g == null ? 0 : parseFloat(g);
                        b[1] = parseInt(b[1]) - h;
                        b[0] = parseFloat(b[0]) - h * g
                    }
                    if (parseInt(b[1]) != j) {
                        b[1] = j
                    }
                    var e = new Date();
                    if (j == 0) {
                        e.setTime(e.getTime() - 15 * 24 * 60 * 60 * 1000)
                    } else {
                        e.setTime(e.getTime() + 15 * 24 * 60 * 60 * 1000)
                    }
                    i._setShoppingCookie("ShoppingCarInfo", b[0] + "$" + b[1], e, false)
                }
            }
        }
        $("#" + a.mcCountId).html(j + "")
    },
    _getCartCookie: function() {
        this._log("_getCartCookie");
        return this._getShoppingCookie("ShoppingCarInfo", false)
    },
    _getShoppingCookie: function(a, b) {
        if (document.cookie.length > 0) {
            c_start = document.cookie.indexOf(a + "=");
            if (c_start != -1) {
                c_start = c_start + a.length + 1;
                c_end = document.cookie.indexOf(";", c_start);
                if (c_end == -1) {
                    c_end = document.cookie.length
                }
                value = document.cookie.substring(c_start, c_end);
                return b ? unescape(value) : value
            }
        }
        return ""
    },
    _setShoppingCookie: function(a, d, c, b) {
        document.cookie = a + "=" + (b ? escape(d) : d) + ((c == null) ? ";": ";expires=" + c + ";") + "path=/;domain=.vancl.com;"
    },
    _getEncryptUserIdFromCookie: function() {
        var e = VANCL.Global.getCookie("UserLogin");
        if (e != null && e != "" && e.length > 0) {
            var c = e.split("&");
            if (c.length > 0) {
                var a = c[0].replace("UserID=", "");
                return a
            }
        }
        var d = VANCL.Global.getCookie("_vuca");
        if (d != null && d != "" && d.length > 0) {
            var b = d.split("@");
            if (b.length > 0) {
                return b[0]
            }
        }
        return "0"
    },
    trackSBU: function() {
        this._log("trackSBU");
        this.config.trackSBUSetting = !0;
        var j = VANCL.Global.getCookie("_vuca");
        if (j != null) {
            var h = document.location.href;
            var d = ["ref=", "source="];
            for (var b = 0; b < d.length; b++) {
                var f = h.indexOf(d[b]);
                if (f > -1) {
                    var g = h.substring(f, h.length);
                    h = h.substring(0, f);
                    if (g.indexOf("&") > -1) {
                        h += g.substring(g.indexOf("&") + 1)
                    }
                }
            }
            var c = h.length - 1;
            if (h[c] == "#") {
                h = h.substring(0, c);
                c = h.length - 1
            }
            if (h[c] == "&") {
                h = h.substring(0, c);
                c = h.length - 1
            }
            if (h[c] == "?") {
                h = h.replace(h[c], "")
            }
            try {
                $.getScript("http://counter.vanclimg.com/kv/sbu_" + j + "/?value=" + encodeURIComponent(h))
            } catch(a) {}
        }
    },
    statisticsCheckoutNowPV: function() {
        this._log("statisticsCheckoutNowPV");
        var b = function() {
            var f = function(i) {
                if (i < 10) {
                    return "0" + i
                }
                return i
            };
            var c = new Date();
            var h = c.getFullYear();
            var g = f(c.getMonth() + 1);
            var e = f(c.getDate());
            var d = h + "" + g + "" + e;
            return d
        };
        try {
            $.getScript("" + b())
        } catch(a) {}
    },
    _log: function(a) {}
};
$.fn.extend({
    renderVanclHeadView: function() {
        var g = {
            viewId: "sub_floor_menus",
            hideDelay: 0.15 ,                  //这个是控制的鼠标移出后的停留时间
			showDelay: 10
        };
        g.container = this;
        function h() {
            g.itemViews = $("li.MenuItem", g.container);
            g.itemViews.each(function(j) {
                $(this).mouseenter(function() {
                    var i = j;
                    g.index = i;
                    g.status = "visiable";
                    if (!g.viewer) {
                        if (!g.viewerHtml) {
                            a();
                            return
                        }
                        d()
                    }
                    g.showTimer && clearTimeout(g.showTimer);
                    g.showTimer = setTimeout(function() {
                        f(g.index);
                        e()
                    },
                    g.hideDelay * 1000);
                    g.hideTimer = clearTimeout(g.hideTimer)
                }).mouseleave(function() {
                    g.status = "hidden";
					
                    g.showTimer && clearTimeout(g.showTimer);
                    if (g.hideTimer) {
                        return
                    }
                    g.hideTimer = setTimeout(function() {
                        b();
                        g.hideTimer = clearTimeout(g.hideTimer)
                    },
                    g.hideDelay * 1000)
                })
            })
        }
        function d() {
            g.viewer || $("#" + g.viewId).length || (g.viewer = $("<div></div>"), $(g.viewer).attr({
                id: g.viewId,
                "class": "sub-floor-menus"
            }).css({
                position: "absolute",
                left: "0px",
                top: "0px"
            }).hide(), $(g.viewer).html(g.viewerHtml), g.container.append(g.viewer), c())
        }
        function c() {
            g.subViews = $("div.menu", g.container);
            g.subViews.each(function() {
                var i = this;
                $(i).mouseenter(function() {
                    g.hideTimer = clearTimeout(g.hideTimer);
                    g.selectedSubView = i
                }).mouseleave(function() {
                    g.hideTimer = setTimeout(function() {
                        b();
                        g.hideTimer = clearTimeout(g.hideTimer)
                    },
                    g.hideDelay * 1000)
                })
            })
        }
        function f(j) {
            var i = g.subViews;
            i.each(function() {
                $(this).hide()
            });
            if (j >= 8) {
                i.eq(j).addClass("menuRight")
            }
            i.eq(j).show();
            $("a", g.itemViews).removeClass("hover");
            $("a", g.itemViews.eq(j)).addClass("hover")
        }
        function e() {
            g.viewer.show()
        }
        function b() {
            if (g.viewer) {
                g.viewer.hide()
            }
            $("a", g.itemViews).removeClass("hover")
        }
        function a() {
            if ($("#" + g.viewId).length > 0 && $("#" + g.viewId).html() !== "") {
                g.viewer = $("#" + g.viewId);
                c();
                if ("hidden" == g.status) {
                    return
                }
                f(g.index);
                e();
                g.getting = !0
            }
            if (g.getting) {
                return
            }
            window._subCatCallback = function() {};
            var i = "http://page.vanclimg.com/all_sub_cat_asyn.ashx";
            $.ajax({
                cache: true,
                url: i,
                dataType: "JSONP",
                data: jQuery.param({
                    area: (window.area || ""),
                    timespan: "20130318162358"
                }),
                jsonp: "jsoncallback",
                jsonpCallback: "_subCatCallback",
                success: function(j) {
                    if (j && j.subcats) {
                        g.viewerHtml = j.subcats;
                        d();
                        if ("hidden" == g.status) {
                            return
                        }
                        f(g.index);
                        e();
                        g.getting = !0
                    }
                }
            })
        }
        h()
    }
});
$(function() {
    function b(g) {
        if ($("#searchWordsAllbody", g).length == 1) {
            return
        }
        window._hotkeywordCallback = function() {};
        var h = "";
        $.ajax({
            cache: true,
            url: h,
            dataType: "jsonp",
            data: jQuery.param({
                area: (window.area || ""),
                timespan: "20130318162358"
            }),
            jsonp: "jsoncallback",
            jsonpCallback: "_hotkeywordCallback",
            success: function(i) {
                if (i && i.keywords) {
                    $(g).append(i.keywords)
                }
            },
            error: function(i) {}
        })
    }
    function c(g) {
        if ($(".mainNavvjiaTip", g).length == 1) {
            return
        }
        window._vjiaSubCatCallback = function() {};
        var h = "";
        $.ajax({
            cache: true,
            url: h,
            dataType: "jsonp",
            data: jQuery.param({
                area: (window.area || ""),
                timespan: "20130318162358"
            }),
            jsonp: "jsoncallback",
            jsonpCallback: "_vjiaSubCatCallback",
            success: function(i) {
                if (i && i.vjiasubcats) {
                    $(g).append(i.vjiasubcats)
                }
            },
            error: function(i) {}
        })
    }
    function a() {
        VANCL.MiniCart.setCartNum();
        $("#shoppingCarNone").mouseenter(function() {
            VANCL.MiniCart.getCart();
            this.className = "hover"
        }).mouseleave(function() {
            this.className = "active"
        });
        $("#myVancl").mouseenter(function() {
            this.className = "hover"
        }).mouseleave(function() {
            this.className = "active"
        });
        $("#vanclMap").mouseenter(function() {
            this.className = "hover"
        }).mouseleave(function() {
            this.className = "active"
        });
        $("#vanclHelp").mouseenter(function() {
            this.className = "hover"
        }).mouseleave(function() {
            this.className = "active"
        });
        $("#vanclFavorite").attr("href", "javascript:bookmarksite('');");
        $("#skey").click(function() {
            OnEnter(this)
        }).blur(function() {
            OnExit(this)
        }).keyup(function(g) {
            OnKeyUp(g, this)
        }).mouseover(function() {
            OnMouseOver(this)
        });
        $("input.searchBtn").click(function() {
            Search($("#skey").val(), null, 3)
        });
        $("#searchBar li").click(d);
        VANCL.MoreHotKeyword = VANCL.MoreHotKeyword || {};
        $("#searchWordsMore").mouseenter(function() {
            VANCL.MoreHotKeyword.that = this;
            if (VANCL.MoreHotKeyword.hideTimer) {
                clearTimeout(VANCL.MoreHotKeyword.hideTimer)
            }
            VANCL.MoreHotKeyword.hideTimer = setTimeout(function() {
                VANCL.MoreHotKeyword.that.className = "hover"
            },
            150);
            b(VANCL.MoreHotKeyword.that)
        }).mouseleave(function() {
            VANCL.MoreHotKeyword.that = this;
            if (VANCL.MoreHotKeyword.hideTimer) {
                clearTimeout(VANCL.MoreHotKeyword.hideTimer)
            }
            VANCL.MoreHotKeyword.hideTimer = setTimeout(function() {
                VANCL.MoreHotKeyword.that.className = "active"
            },
            150)
        });
        VANCL.MainNavVjia = VANCL.MainNavVjia || {};
        $("#mainNavvjia").mouseenter(function() {
            VANCL.MainNavVjia.that = this;
            if (VANCL.MainNavVjia.hideTimer) {
                clearTimeout(VANCL.MainNavVjia.hideTimer)
            }
            VANCL.MainNavVjia.hideTimer = setTimeout(function() {
                VANCL.MainNavVjia.that.className = "hover"
            },
            150);
            c(VANCL.MainNavVjia.that)
        }).mouseleave(function() {
            VANCL.MainNavVjia.that = this;
            if (VANCL.MainNavVjia.hideTimer) {
                clearTimeout(VANCL.MainNavVjia.hideTimer)
            }
            VANCL.MainNavVjia.hideTimer = setTimeout(function() {
                VANCL.MainNavVjia.that.className = "active"
            },
            150)
        })
    }
    function d() {
        if (this.className == "hover") {
            return
        }
        $(this).addClass("hover").siblings().removeClass("hover");
        var g = $(this).attr("key") == "vancl";
        e(g);
        $("#skey").click(function() {
            OnEnter(this)
        }).blur(function() {
            OnExit(this)
        }).keyup(function(h) {
            OnKeyUp(h, this)
        }).mouseover(function() {
            OnMouseOver(this)
        })
    }
    function e(h) {
        if ($.fn.autocomplete) {
            var g = "http://page.vanclimg.com/autocompletehandler.ashx";
            if (!h) {
                g = "http://s.vjia.com/autocomplete/vancl"
            }
            $("#skey").unautocomplete();
            $("#skey").autocomplete(g, {
                delay: 10,
                dataType: "jsonp",
                minChars: 1,
                max: 13,
                width: $("#skey").outerWidth(),
                matchContains: false,
                selectFirst: false,
                formatItem: function(m, j, l) {
                    var k = '<span class="ks-suggest-key">' + m.name;
                    if (m.categoryname) {
                        k += ' 在 <font color="#A10000"><b>' + m.categoryname + "</b></font> 中搜索"
                    }
                    k += "</span>";
                    if (m.count && parseInt(m.count) > 0) {
                        k += '<span class="ks-suggest-result">约' + m.count + "条</span>"
                    }
                    return k
                },
                formatMatch: function(l, j, k) {
                    return l.name
                },
                highlight: null
            }).result(function(j, i, l, k) {
                Search(i.name, i.categoryid, 3, k)
            }).noresult(function(i) {
                Search($("#skey").val(), null, 3)
            })
        }
    }
    function f() {
        VANCL.Global.setLoginInfo();
        a();
        e(true);
        if ($.fn.renderVanclHeadView) {
            $("#subNav").renderVanclHeadView()
        }
    }
    if ($("#Head").html() === "") {
        $.ajax({
            dataType: "text",
            url: "/public/common.aspx",
            success: function(j) {
                var i = document.createElement("DIV");
                i.innerHTML = j;
                var g = $(i);
                var h = g.find("#Head");
                $("#Head").html(h.children());
                $("#footer").html(g.find("#bottom"));
                f()
            },
            error: function(g) {}
        })
    } else {
        if ($("#welcome").length > 0) {
            f()
        }
    }
});
var VA_GLOBAL = {};
VA_GLOBAL.namespace = function(c) {
    var a = c.split("."),
    b = VA_GLOBAL;
    for (i = (a[0] == "VA_GLOBAL") ? 1 : 0; i < a.length; i++) {
        b[a[i]] = b[a[i]] || {};
        b = b[a[i]]
    }
};
VA_GLOBAL.namespace("Lang");
VA_GLOBAL.Lang.trim = function(a) {
    return a.replace(/^\s+|\s+$/g, "")
};
VA_GLOBAL.Lang.isEmpty = function(a) {
    return /^\s*$/.test(a)
};
VA_GLOBAL.Lang.isNone = function(a) {
    return ((typeof a == "undefined") || a == null || ((typeof a == "string") && VA_GLOBAL.Lang.trim(a) == "") || a == "undefined")
};
VA_GLOBAL.Lang.isNumber = function(a) {
    return ! isNaN(a)
};
VA_GLOBAL.Lang.random = function(b, c) {
    var a = c - b + 1;
    return Math.floor(Math.random() * a + b)
};
VA_GLOBAL.Lang.dateTimeStrWms0 = function(b) {
    try {
        var j = b.getFullYear()
    } catch(c) {
        b = new Date()
    }
    var f = b.getMonth() + 1;
    f = f < 10 ? "0" + f: "" + f;
    var a = b.getDate();
    a = a < 10 ? "0" + a: "" + a;
    var d = b.getHours();
    d = d < 10 ? "0" + d: "" + d;
    var e = b.getMinutes();
    e = e < 10 ? "0" + e: "" + e;
    var h = b.getSeconds();
    h = h < 10 ? "0" + h: "" + h;
    var g = b.getMilliseconds();
    if (g < 10) {
        g = "00" + g
    } else {
        if (g < 100) {
            g = "0" + g
        }
    }
    return b.getFullYear() + f + a + d + e + h + g
};
VA_GLOBAL.Lang.timeSeq32 = function() {
    return VA_GLOBAL.Lang.dateTimeStrWms0() + VA_GLOBAL.Lang.random(100000000000000, 999999999999999)
};
VA_GLOBAL.namespace("Http");
VA_GLOBAL.Http = {
    isIp: function(a) {
        var b = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
        return (b.test(a))
    },
    getQueryStringArgs: function() {
        var g = (location.search.length > 0 ? location.search.substring(1) : "");
        var a = {};
        var e = g.split("&");
        var d = null,
        f = null,
        j = null;
        for (var c = 0; c < e.length; c++) {
            d = e[c].split("=");
            if (d.length > 1) {
                try {
                    f = decodeURIComponent(d[0]);
                    j = decodeURIComponent(d[1]);
                    a[f] = j
                } catch(h) {}
            }
        }
        var b = (window.location.hash.length > 0 ? window.location.hash.substring(1) : "");
        e = b.split("&");
        for (var c = 0; c < e.length; c++) {
            d = e[c].split("=");
            if (d.length > 1) {
                try {
                    f = decodeURIComponent(d[0]);
                    j = decodeURIComponent(d[1]);
                    a[f] = j
                } catch(h) {}
            }
        }
        return a
    }
};
VA_GLOBAL.namespace("Dom");
VA_GLOBAL.Dom.loadScriptURL = function(b) {
    var a = document.createElement("script");
    a.type = "text/javascript";
    a.src = b;
    document.body.appendChild(a)
};
VA_GLOBAL.Dom.loadImageBeacon = function(b) {
    var a = document.createElement("img");
    a.type = "image/png";
    a.src = b;
    a.border = 0;
    a.height = 1;
    a.width = 1;
    document.body.appendChild(a)
};
VA_GLOBAL.namespace("Event");
VA_GLOBAL.Event = {
    getEvent: function(a) {
        return a ? a: window.event
    },
    getTarget: function(a) {
        a = a ? a: window.event;
        return a.target || a.srcElement
    },
    stopPropagation: function(a) {
        a = a ? a: window.event;
        if (a.stopPropagation) {
            a.stopPropagation()
        } else {
            a.cancelBubble = true
        }
    },
    preventDefault: function(a) {
        a = a ? a: window.event;
        if (a.preventDefault) {
            a.preventDefault()
        } else {
            a.returnValue = false
        }
    },
    addHandler: function(a, c, b) {
        a = typeof a == "string" ? document.getElementById(a) : a;
        if (a.addEventListener) {
            a.addEventListener(c, b, false)
        } else {
            if (a.attachEvent) {
                a.attachEvent("on" + c, b)
            } else {
                a["on" + c] = b
            }
        }
    }
};
VA_GLOBAL.namespace("Cookie");
VA_GLOBAL.Cookie = {
    get: function(e) {
        var b = null;
        var a = document.cookie.split("; ");
        for (var c = 0,
        d = a.length; c < d; c++) {
            var f = a[c].split("=");
            if (f != null && f != "undefined") {
                if (f[0] === e) {
                    if (f[1] != null && f[1] != "undefined") {
                        b = f[1]
                    }
                }
            }
        }
        return b
    },
    set: function(d, g, c, e, b, f) {
        var a = encodeURIComponent(d) + "=" + encodeURIComponent(g);
        if (c instanceof Date) {
            a += "; expires=" + c.toGMTString()
        }
        if (e) {
            a += "; path=" + e
        }
        if (b) {
            a += "; domain=" + b
        }
        if (f) {
            a += "; secure"
        }
        document.cookie = a
    },
    unset: function(b, c, a, d) {
        this.set(b, "", new Date(0), c, a, d)
    }
};
VA_GLOBAL.namespace("SubCookie");
VA_GLOBAL.SubCookie = {
    get: function(a, c) {
        var b = this.getAll(a);
        if (b) {
            return b[c]
        } else {
            return null
        }
    },
    getAll: function(g) {
        var b = encodeURIComponent(g) + "=",
        c = document.cookie.indexOf(b),
        d = null,
        j = {};
        if (c > -1) {
            var a = document.cookie.indexOf(";", c);
            if (a == -1) {
                a = document.cookie.length
            }
            d = document.cookie.substring(c + b.length, a);
            if (d.length > 0) {
                var k = d.split("&");
                for (var e = 0,
                f = k.length; e < f; e++) {
                    var h = k[e].split("=");
                    j[decodeURIComponent(h[0])] = decodeURIComponent(h[1])
                }
                return j
            }
        }
        return j
    },
    set: function(c, g, h, b, d, a, e) {
        var f = this.getAll(c) || {};
        f[g] = h;
        this.setAll(c, f, b, d, a, e)
    },
    setAll: function(d, h, c, e, b, f) {
        var a = encodeURIComponent(d) + "=";
        var g = new Array();
        for (var j in h) {
            if (j.length > 0 && h.hasOwnProperty(j)) {
                g.push(encodeURIComponent(j) + "=" + encodeURIComponent(h[j]))
            }
        }
        if (g.length > 0) {
            a += g.join("&");
            if (c instanceof Date) {
                a += "; expires=" + c.toGMTString()
            }
            if (e) {
                a += "; path=" + e
            }
            if (b) {
                a += "; domain=" + b
            }
            if (f) {
                a += "; secure"
            }
        } else {
            a += "; expires=" + (new Date(0)).toGMTString()
        }
        document.cookie = a
    },
    unset: function(b, f, c, a, d) {
        var e = this.getAll(b);
        if (e) {
            delete e[f];
            this.setAll(b, e, null, c, a, d)
        }
    },
    unsetAll: function(b, c, a, d) {
        this.setAll(b, null, new Date(0), c, a, d)
    }
};
VA_GLOBAL.namespace("vanew");
VA_GLOBAL.vanew = {
    prepare: function() {
        var c = new Date().getTime();
        VA_GLOBAL.new_begintime = c;
        VA_GLOBAL.new_requestid = VA_GLOBAL.Lang.timeSeq32();
        var p = window.location.protocol.toLowerCase();
        VA_GLOBAL.new_protocol = p;
        var e = "//vamr.vancl.com:";
        var f = p == "https:" ? 443 : 80;
        VA_GLOBAL.new_server = p + e + f;
        var g = window.location.hostname.toLowerCase();
        VA_GLOBAL.new_domain = g;
        var m = VA_GLOBAL.Http.isIp(g);
        var k = g.lastIndexOf(".");
        if (k > 0) {
            k = g.lastIndexOf(".", k - 1)
        }
        var h = m ? g: (k == -1 ? ("." + g) : g.substring(k));
        VA_GLOBAL.new_domain1 = h;
        var v = window.location.pathname;
        if (VA_GLOBAL.Lang.isEmpty(v)) {
            v = "/"
        }
        VA_GLOBAL.uri = v;
        var q = window.location.search;
        if (q.length > 0) {
            q = q.substring(1)
        }
        VA_GLOBAL.new_query = q;
        var o = VA_GLOBAL.Http.getQueryStringArgs();
        var t = o.source;
        if (VA_GLOBAL.Lang.isNone(t)) {
            t = null
        }
        var j = (window.location.hash.length > 0 ? window.location.hash.substring(1) : "");
        if (VA_GLOBAL.Lang.isNone(j)) {
            j = "-"
        }
        VA_GLOBAL.new_source = t;
        VA_GLOBAL.new_hash = j;
        var r = document.referrer;
        if (r == null || (typeof r == "undefined") || r == "") {
            VA_GLOBAL.Cookie.unset("va_click", "/", VA_GLOBAL.new_domain1, null)
        } else {
            if (r.indexOf(".vancl.com") == -1) {
                VA_GLOBAL.Cookie.unset("va_click", "/", VA_GLOBAL.new_domain1, null)
            }
        }
        VA_GLOBAL.new_referer = r;
        VA_GLOBAL.new_useragent = navigator.userAgent;
        var s = VA_GLOBAL.Cookie.get("sid");
        if ((typeof s == "undefined") || s == null || s == "") {
            s = "-"
        }
        var z = VA_GLOBAL.Cookie.get("va_sid");
        var A = null;
        if (z != null && z == s) {
            A = "g"
        } else {
            if (r == null || (typeof r == "undefined") || r == "") {
                A = "l";
                VA_GLOBAL.Cookie.unset("va_click", "/", VA_GLOBAL.new_domain1, null)
            } else {
                if (r.indexOf(".vancl.com") == -1) {
                    A = "l";
                    VA_GLOBAL.Cookie.unset("va_click", "/", VA_GLOBAL.new_domain1, null)
                } else {
                    A = "g"
                }
            }
            z = s
        }
        VA_GLOBAL.new_sid = z;
        VA_GLOBAL.new_visitsequence = A;
        var b = new Date();
        b.setTime(c + 24 * 60 * 60 * 1000);
        VA_GLOBAL.Cookie.set("va_sid", z, b, "/", VA_GLOBAL.new_domain1, null);
        var d = VA_GLOBAL.SubCookie.getAll("va_click");
        VA_GLOBAL.new_parentrequestid = (typeof d.rid == "undefined") ? "-": d.rid;
        VA_GLOBAL.new_clickid = (typeof d.cid == "undefined") ? "-": d.cid;
        VA_GLOBAL.new_trackurl = (typeof d.turl == "undefined") ? "-": decodeURIComponent(d.turl);
        VA_GLOBAL.new_trackname = (typeof d.tname == "undefined") ? "-": d.tname;
        VA_GLOBAL.new_tracklabel = VA_GLOBAL.Lang.trim((typeof d.tlabel == "undefined") ? "-": d.tlabel);
        var w = VA_GLOBAL.SubCookie.getAll("va_visit");
        var u = w.uid;
        var x = w.uvc;
        if (VA_GLOBAL.Lang.isNone(u)) {
            u = VA_GLOBAL.Lang.timeSeq32();
            x = 1;
            w.uid = u;
            w.uvc = x;
            w.ft = c;
            w.lt = c;
            w.tt = c
        } else {
            if (A == "l") {
                try {
                    x = Number(x) + 1;
                    if (Number(x) > 999) {
                        x = 999
                    }
                } catch(y) {
                    x = 1
                }
                w.uvc = x;
                w.lt = w.tt;
                w.tt = c
            } else {
                try {
                    x = Number(x);
                    if (Number(x) > 999) {
                        x = 999
                    }
                } catch(y) {
                    x = 1
                }
                w.uvc = x
            }
        }
        VA_GLOBAL.new_uid = w.uid;
        VA_GLOBAL.new_uservisitcount = w.uvc;
        VA_GLOBAL.new_firsttime = w.ft;
        VA_GLOBAL.new_lasttime = w.lt;
        VA_GLOBAL.new_thistime = w.tt;
        var a = new Date();
        a.setTime(c + 365 * 24 * 60 * 60 * 1000);
        VA_GLOBAL.SubCookie.setAll("va_visit", w, a, "/", VA_GLOBAL.new_domain1, null);
        var l = "-";
        if ((typeof track_sinput != "undefined") && track_sinput != null && track_sinput != "") {
            l = track_sinput
        }
        VA_GLOBAL.new_insitesearchway = l;
        var n = getPageLab();
        if (n != "") {
            VA_GLOBAL.new_pagelab = n
        } else {
            VA_GLOBAL.new_pagelab = "-"
        }
    },
    request: function() {
        try {
            if (typeof VA_GLOBAL.new_server != "undefined") {
                var c = VA_GLOBAL.new_referer;
                var b = VA_GLOBAL.new_hash;
                var f = VA_GLOBAL.new_trackname;
                var e = VA_GLOBAL.new_tracklabel;
                var d = VA_GLOBAL.new_server + "/visit.ashx?";
                d += "version=1.0";
                d += "&requestid=" + VA_GLOBAL.new_requestid;
                d += "&parentrequestid=" + VA_GLOBAL.new_parentrequestid;
                d += "&sid=" + VA_GLOBAL.new_sid;
                d += "&uid=" + VA_GLOBAL.new_uid;
                d += "&referer=" + (c == "" ? "-": encodeURIComponent(c.replace(/[\r\n\t]/g, " ").substring(0, 400)));
                d += "&visitsequence=" + VA_GLOBAL.new_visitsequence;
                d += "&uservisitcount=" + VA_GLOBAL.new_uservisitcount;
                d += "&firsttime=" + VA_GLOBAL.new_firsttime;
                d += "&lasttime=" + VA_GLOBAL.new_lasttime;
                d += "&thistime=" + VA_GLOBAL.new_thistime;
                d += "&insitesearchway=" + VA_GLOBAL.new_insitesearchway;
                d += "&pagelab=" + encodeURIComponent(VA_GLOBAL.new_pagelab);
                d += "&hash=" + (b == "" ? "-": encodeURIComponent(b));
                d += "&clickid=" + VA_GLOBAL.new_clickid;
                d += "&trackname=" + (f == "" ? "-": encodeURIComponent(f.replace(/[\r\n\t\'\"]/g, " ")));
                d += "&tracklabel=" + (e == "" ? "-": encodeURIComponent(e.replace(/[\r\n\t\'\"]/g, " ")));
                $.getScript(d)
            }
        } catch(a) {}
    },
    loadtime: function() {
        try {
            if (typeof VA_GLOBAL.new_server != "undefined") {
                var c = new Date().getTime() - VA_GLOBAL.new_begintime;
                var b = VA_GLOBAL.new_referer;
                var d = VA_GLOBAL.new_server + "/render.ashx?";
                d += "version=1.0";
                d += "&requestid=" + VA_GLOBAL.new_requestid;
                d += "&parentrequestid=" + VA_GLOBAL.new_parentrequestid;
                d += "&sid=" + VA_GLOBAL.new_sid;
                d += "&uid=" + VA_GLOBAL.new_uid;
                d += "&rendertime=" + c;
                d += "&referer=" + (b == "" ? "-": encodeURIComponent(b.replace(/[\r\n\t]/g, " ").substring(0, 400)));
                $.getScript(d)
            }
        } catch(a) {}
    },
    listenclick: function() {
        try {
            VA_GLOBAL.Event.addHandler(document, "mousedown",
            function(b) {
                var d = VA_GLOBAL.Event.getTarget(b);
                if (d.nodeType == 1) {
                    var c = VA_GLOBAL.vanew.elementclicked(d);
                    if (c == false) {
                        VA_GLOBAL.vanew.elementclicked(d.parentNode)
                    }
                }
            })
        } catch(a) {}
    },
    elementclicked: function(h) {
        if (h.nodeType != 1) {
            return false
        }
        var g = false;
        var c = h.className;
        if (c == null || (typeof c == "undefined")) {
            c = ""
        }
        c = c.toLowerCase();
        var b = c.split(" ");
        for (var f = 0; f < b.length; f++) {
            if (b[f] == "track") {
                g = true;
                break
            }
        }
        var l = null;
        if (g) {
            try {
                l = h.name
            } catch(d) {}
        }
        if (g == false || (typeof l == "undefined") || l == null || l == "") {
            l = "-"
        }
        var j = h.nodeName.toLowerCase();
        var k = null;
        var m = null;
        if (j == "a") {
            try {
                k = h.innerHTML;
                var e = h.href;
                if ((typeof e != "undefined") && e != null) {
                    if (/^https?:\/\/./i.test(e)) {
                        m = e
                    } else {
                        if (/^\/\/./i.test(e)) {
                            m = e
                        } else {
                            if (/^\/./i.test(e)) {
                                m = e
                            }
                        }
                    }
                }
                m = encodeURIComponent(m)
            } catch(d) {}
        } else {
            try {
                k = h.value;
                if ((typeof k == "undefined") || k == null) {
                    k = h.title;
                    if ((typeof k == "undefined") || k == null) {
                        k = h.data
                    }
                }
            } catch(d) {}
        }
        if ((typeof k == "undefined") || k == null) {
            k = "-"
        }
        try {
            if (typeof k != "string") {
                k = ""
            } else {
                k = k.replace(/[\r\n\t\'\"]/g, " ")
            }
        } catch(d) {}
        k = VA_GLOBAL.Lang.trim(k);
        if (k.length > 100) {
            k = encodeURIComponent(k.substring(0, 100))
        } else {
            k = encodeURIComponent(k)
        }
        var a = VA_GLOBAL.Lang.timeSeq32();
        if (g) {
            VA_GLOBAL.vanew.recordtrackclick(a, l, m, k)
        }
        if (j == "a") {
            VA_GLOBAL.vanew.recordaclick(a, l, m, k)
        }
        return g || j == "a"
    },
    recordaclick: function(b, e, f, d) {
        if (e == null || (typeof e == "undefined") || e == "") {
            e = "-"
        }
        if (d == null || (typeof d == "undefined") || d == "") {
            d = "-"
        }
        if (f == null || (typeof f == "undefined") || f == "") {
            f = "-"
        }
        var c = {};
        c.rid = VA_GLOBAL.new_requestid;
        c.cid = b;
        c.turl = f;
        c.tname = e;
        c.tlabel = d;
        var a = new Date();
        a.setTime(new Date().getTime() + 60 * 1000);
        VA_GLOBAL.SubCookie.setAll("va_click", c, a, "/", VA_GLOBAL.new_domain1, null)
    },
    recordtrackclick: function(a, e, f, d) {
        if (e == null || (typeof e == "undefined") || e == "") {
            e = "-"
        }
        if (d == null || (typeof d == "undefined") || d == "") {
            d = "-"
        }
        if (f == null || (typeof f == "undefined") || f == "") {
            f = "-"
        }
        if (typeof VA_GLOBAL.new_server != "undefined") {
            var b = VA_GLOBAL.new_referer;
            var c = VA_GLOBAL.new_server + "/click.ashx?";
            c += "version=1.0";
            c += "&clickid=" + a;
            c += "&trackurl=" + (f == "" ? "-": encodeURIComponent(f.replace(/[\r\n\t]/g, " ").substring(0, 400)));
            c += "&trackname=" + (e == "" ? "-": encodeURIComponent(e.replace(/[\r\n\t]/g, " ").substring(0, 400)));
            c += "&tracklabel=" + (d == "" ? "-": encodeURIComponent(d.replace(/[\r\n\t]/g, " ").substring(0, 400)));
            c += "&requestid=" + VA_GLOBAL.new_requestid;
            c += "&sid=" + VA_GLOBAL.new_sid;
            c += "&uid=" + VA_GLOBAL.new_uid;
            c += "&referer=" + (b == "" ? "-": encodeURIComponent(b.replace(/[\r\n\t]/g, " ").substring(0, 400)));
            $.getScript(c)
        }
    },
    send: function() {
        try {
            if (typeof VA_GLOBAL.v4sreadyed != "undefined") {
                return
            }
            VA_GLOBAL.v4sreadyed = "1";
            VA_GLOBAL.vanew.prepare();
            VA_GLOBAL.vanew.request()
        } catch(a) {}
    },
    loaded: function() {
        try {
            if (typeof VA_GLOBAL.v4sloaded != "undefined") {
                return
            }
            VA_GLOBAL.v4sloaded = "1";
            VA_GLOBAL.vanew.loadtime();
            VA_GLOBAL.vanew.listenclick()
        } catch(a) {}
    }
};
var PAGELAB_PATTERN = /^(PageLab_PLE[0-9]{4})=([^;]*)$/;
var weblog_loadtime = new Date();
try {
    $(document).ready(function() {
        VA_GLOBAL.vanew.send()
    })
} catch(err) {}
function getPageLab() {
    var b = "";
    var c = document.cookie.split(";");
    for (var a = 0; a < c.length; a++) {
        if (PAGELAB_PATTERN.test(trim(c[a]))) {
            b += trim(c[a].split("=")[1]) + ","
        }
    }
    b = (b.length > 0) ? b.substr(0, b.length - 1) : "";
    return b
}
function trim(c) {
    for (var a = 0; a < c.length && c.charAt(a) == " "; a++) {}
    for (var b = c.length; b > 0 && c.charAt(b - 1) == " "; b--) {}
    if (a > b) {
        return ""
    }
    return c.substring(a, b)
}
try {
    $(window).load(function() {
        VA_GLOBAL.vanew.loaded()
    })
} catch(err) {};