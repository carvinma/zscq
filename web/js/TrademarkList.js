function ExportToExcel() {
    var $this = $("input[name='chkItem']:checked");
    if ($this.length == 0) {
        $.jBox.info("请选择要导出的商标！", "提示");
        return false;
    }
    return true;
}
function DelTrademarkListDailog() {
    var $this = $("input[name='chkItem']:checked");
    if($this.length==0)
    {
        $.jBox.info("请选择要删除的商标！", "提示");
       return false;
    }

    var strval = new Array();
    $this.each(function () {
        var status = $(this).attr("status");
        if (!isEmpty(status)) {
            if (status != "0") {
                $.jBox.info("只有保存状态的商标才能删除！<br/>请重新选择！", "提示");
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
        $.jBox.info("请选择要提交的商标！", "提示");
      return false;
    }
    var strval = new Array();
    $this.each(function () {
        var status = $(this).attr("status");
        if (!isEmpty(status)) {
            if (status != "0") {
                $.jBox.info("只有保存状态的商标才能提交！<br/>请重新选择！", "提示");
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
        $.jBox.tip("正在提交数据...", 'loading');
        $.ajax({
            type: "POST",
            url: "Handler.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=marklistsubmit&ids=" + ids + "&status=1",
            success: function (data) {
                if (data == "1") {
                    jBox.tip("提交成功！", 'success');
                    $("#btnQuery").click();
                }
                else {
                    jBox.tip("提交失败！", 'info');
                }
            }
        });
    }
    return true;
};