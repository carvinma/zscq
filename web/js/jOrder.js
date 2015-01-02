function orderDelCase(id, type) {
    if (!isEmpty(type)) 
        $.jBox.confirm("确定要删除该案件吗？<div style='display:none'>" + id + "</div>", "提示", delCaseSubmitRenewal);
    else
       $.jBox.confirm("确定要删除该案件吗？<div style='display:none'>" + id + "</div>", "提示", delCaseSubmit);
}
var delCaseSubmit = function (v, h, f) {
    if (v == "ok") {
        var id = h.find("div:hidden").html();
        var totalmoney = $("#guifei").html();
        var money = $("#ordertr" + id).find("td:eq(4)").text();
        //h.find('#amount').val();
        var nowemoney = parseFloat(totalmoney) - parseFloat(money);
        $("#guifei").html(nowemoney.toFixed(2));
        $("#tax").html((nowemoney * 0.033).toFixed(2))

        $("#ordertr" + id).remove();
        if ($("#tabOrder tr").length ==2) {
            $("#guifei").html(0);
            $("#zhinajin").html(0);
            $("#dailifei").html(0);
            $("#youhuiquan").html(0);
            $("#tax").html(0);
        }
        calcTotalMoney();
    }
    return true;
};

var delCaseSubmitRenewal = function (v, h, f) {
    if (v == "ok") {
        var id = h.find("div:hidden").html();
        var totalmoney = $("#guifei").html();
        var money = $("#ordertr" + id).find("td:eq(6)").text();
        var nowemoney = parseFloat(totalmoney) - parseFloat(money);
        $("#guifei").html(nowemoney.toFixed(2));
        $("#tax").html((nowemoney * 0.033).toFixed(2))

        $("#ordertr" + id).remove();
        if ($("#tabOrder tr").length == 2) {
            $("#guifei").html(0);
            $("#zhinajin").html(0);
            $("#dailifei").html(0);
            $("#youhuiquan").html(0);
            $("#tax").html(0);
        }
        calcTotalMoney();
    }
    return true;
};
function calcTotalMoney() {
    var guifei = $("#guifei").html();
    var dailifei = $("#dailifei").html();
    var youhuiquan = $("#youhuiquan").html();
    var zhinajin = 0;
    if ($("#zhinajin").length > 0) {
        zhinajin = $("#zhinajin").html();
        if (isEmpty(zhinajin)) {
            zhinajin = 0;
        }
    } 
    if (isEmpty(youhuiquan)) {
        youhuiquan = 0;
    }
    var v; var sxf;
    var tax = 0;
    if ($("#checkfp").is(":checked")) {
        tax = $("#tax").html();
    }
    $("input[name='payway']:checked").each(function () {
        v = $(this).val();
    });
    if (v.indexOf("网银直接支付") >= 0) {
        sxf = (parseFloat(guifei) + parseFloat(tax) + parseFloat(dailifei) + parseFloat(zhinajin)) * 0.012;
        $("#shouxufei").html(sxf.toFixed(2));
    }
    else if (v.indexOf("财付通支付") >= 0) {
        sxf = (parseFloat(guifei) + parseFloat(tax) + parseFloat(dailifei) + parseFloat(zhinajin)) * 0.01;
        $("#shouxufei").html(sxf.toFixed(2));
    }
    else if (v.indexOf("支付宝支付") >= 0) {
        sxf = (parseFloat(guifei) + parseFloat(tax) + parseFloat(dailifei) + parseFloat(zhinajin)) * 0.012;
        $("#shouxufei").html(sxf.toFixed(2));
    }
    else {
        sxf = 0;
        $("#shouxufei").html(0);
    }
    $("#hi_shouxufei").val(sxf.toFixed(2));
    var all = parseFloat(guifei) + sxf + parseFloat(tax) + parseFloat(dailifei) + parseFloat(youhuiquan) + parseFloat(zhinajin);
    $("#allmoney").html(all.toFixed(2));
    $("#hi_allmy").val(all.toFixed(2));
}

function orderCaseDetail(id,type) {
    var ids = [];
    $("#tabOrder tr:gt(0)").each(function () {
        var id = $(this).attr("id");
        if (!isEmpty(id)) {
            ids.push(id.replace('ordertr', ''));
        }
    });
    // $("#hi_ids").val(ids);
   if(!isEmpty(type)) //xz
        window.location.href = "trademarkrenewal_detail.aspx?t_r_id=" + id + "&order=1&ids=" + ids.join(',');
    else
        window.location.href = "trademark_detail.aspx?t_r_id=" + id + "&order=1&ids=" + ids.join(',');
}
var submit = function (v, h, f) {
    if (v == "ok") {
        var id = h.find("div:hidden").html();
        $.jBox.tip("正在删除数据...", 'loading');
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=delete&id=" + id,
            success: function (data) {
                if (data == "1") {
                    jBox.tip("删除成功！", 'success');
                    $("#btnQuery").click();
                }
                else {
                    jBox.tip("删除失败！", 'info');
                }
            }
        });
    }
    return true;
};

function isEmpty(value) {

    if (value == null || value == "" || value == "undefined" || value == undefined || value == "null") {
        return true;
    }
    else {
        value = value.toString();
        value = value.replace(/\s/g, "");
        if (value == "") {
            return true;
        }
        return false;
    }
}