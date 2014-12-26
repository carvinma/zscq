function ExportToExcel() {
    var $this = $("input[name='chkItem']:checked");
    if ($this.length == 0) {
        $.jBox.info("请选择续展案！", "提示");
        return false;
    }
    return true;
}
function DelTrademarkListDailog() {
    var $this = $("input[name='chkItem']:checked");
    if($this.length==0)
    {
        $.jBox.info("请选择续展案！", "提示");
       return false;
    }

    var strval = new Array();
    $this.each(function () {
        var status = $(this).attr("status");
        if (!isEmpty(status)) {
            if (status == "0" || status == "1" || status == "10" || status == "11") {
                $.jBox.info("商标状态为：<br/>无需我公司监管<br/>放弃续费<br/>已提交订单，尚未接收汇款<br/>已提交订单，续展中<br/>的续展案不能删除！<br/>---------------------------<br/>请重新选择！", "提示");
                strval = [];
                return false;
            }
            else {
                strval.push($(this).val());
            }
        }
    });
    if (strval.length == 0) {
        return false;
    }
    $.jBox.confirm("确定要删除吗？<div style='display:none'>" + strval.join(",") + "</div>", "提示", submit);
}
var submit = function (v, h, f) {
    if (v == "ok") {
        var ids = h.find("div:hidden").html();
        $.jBox.tip("正在删除数据...", 'loading');
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=marklistdelete&ids=" + ids,
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


function SubmitTrademarkListDailog() {
 var $this = $("input[name='chkItem']:checked");
    if($this.length==0)
    {
        $.jBox.info("请选择续展案！", "提示");
      return false;
    }
    var strval = new Array();
    $this.each(function () {
        var status = $(this).attr("status");
        if (!isEmpty(status)) {
            if (status == "1" || status == "10" || status == "11") {
                $.jBox.info("只有尚未提交订单的续展案才能提交！<br/>请重新选择！", "提示");
                strval = [];
                return false;
            }
            else {
                strval.push($(this).val());
            }
        }
    });
    if (strval.length == 0) {
        return false;
    }
    $.jBox.confirm("确定要提交吗？<div style='display:none'>" + strval.join(",") + "</div>", "提示", submitStatus);
}
var submitStatus = function (v, h, f) {
    if (v == "ok") {
        var ids = h.find("div:hidden").html();
        window.location.href = "Add_TrademarkrenewalOrder.aspx?ids=" + ids; 
//        var ids = h.find("div:hidden").html();
//        $.jBox.tip("正在提交数据...", 'loading');
//        $.ajax({
//            type: "POST",
//            url: "Handler.ashx",
//            contentType: "application/x-www-form-urlencoded; charset=utf-8",
//            data: "flag=marklistsubmit&ids=" + ids+"&status=10",
//            success: function (data) {
//                if (data == "1") {
//                    jBox.tip("提交成功！", 'success');
//                    $("#btnQuery").click();
//                }
//                else {
//                    jBox.tip("提交失败！", 'info');
//                }
//            }
//        });
    }
    return true;
};