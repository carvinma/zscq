/// <reference path="jquery-1.8.0-vsdoc.js" />
//if (typeof jQuery == 'undefined') {
//    document.write("<script type=\"text/javascript\" src=\"js/jquery-1.4.2.min.js\"><\/script>");
//}
/*
* 使用方法很简单：
* 比如某个输入域必须经过邮箱验证，那么它的class带上email即可，比如
* <input type="text" name="userEmail" id="userEmail" class="userEmail email" />;
*/
var FieldValidation = {
    rules: {
        // 验证规则class名称
        required: /./,                             // 必填
        requiredNotWhiteSpace: /\S/,               // 单个非空白字符
        positiveInteger: /^\d*[1-9]\d*$/,          // 正整数
        positiveOrZeroInteger: /^\d+$/,            // 正整数或0
        integer: /^-?\d+$/,                        // 整数
        decimal: /^-?\d+(.\d+)?$/,                 // 整数和小数
        email: /^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]+$/, // 邮箱
        mobile: /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/ // 手机 

    },
    errors: {
        // 验证失败时的错误提示信息
        required: "空になることはできない",
        requiredNotWhiteSpace: "できない空白",
        positiveInteger: "必ず正整数",
        positiveOrZeroInteger: "なければならない非負の整数",
        integer: "なければならない整数",
        decimal: "なければならない数字",
        email: "メールアドレスフォーマットミス",
        mobile: "携帯番号フォーマットミス"
    },
    validate: function (fields) {
        // field是要验证的域，比如<input class="required" id="username" />
        var flag = true;
        $(arguments).each(function (num, field) {
            //alert($(field).val());
            //var classRegExp = /(^|\b)(\S+)(\b|$)/g; // 匹配类
            var classRegExp = /(\b)(\S+)(\b|$)/g; // 匹配类
            var className = $(field).attr("class");
            var classResult; //  className.split(' '); // classRegExp.exec(className);
            //alert(className + "  1");
            //alert(classRegExp); 
            while ((classResult = classRegExp.exec(className)) != null) {
                //alert(className);
                //if (classResult[2] != "") {
                var ruleClass = classResult[2];
                //alert(ruleClass);
                var rule = FieldValidation.rules[ruleClass];
                if (typeof rule != "null" && typeof rule != "undefined") {   // 命中验证规则class 
                    if (!rule.test($(field).val())) {
                        $(field).next().remove();
                        field.after('<span style="color:red;vertical-align:middle;height: 23px; line-height: 23px; "><img src="images/tError.gif">' + FieldValidation.errors[ruleClass] + '</span>');
                        //field.focus();
                        flag = false * flag;
                        break;
                        //return false;
                    }
                    else {
                        $(field).next().remove();
                        field.after('<img src="images/tOk.gif">');
                        flag = true * flag;
                    }
                }
                // }
            }
            if (!flag)
                return flag;
        })
        return flag;
    }
};
//验证数値のみを記入してください或是字母
function checkBianhao(ob) {
    var obj = document.getElementById(ob);
    if (obj.value.match(/[^A-Za-z0-9]/ig)) {
        alert("密码只能为数字和字母");
        return false;
    }
    return true;
}

