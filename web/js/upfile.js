$(function () {
    $(".upfile").click(function () {
        var caseType = $(this).attr("casetype");
        var bookType = $(this).attr("booktype");
        var caseno = $(this).attr("caseno");
        var html = '<table width="100%"><tr><td height="90px" align="center">';
        html += '<input id="file_upload" name="file_upload" type="file" multiple="true"></td><tr height="80px">';
        html += '<td align="center"><div id="newfilename" style="display:none"></div><div id="fileQueue"></div><div id="upSucessImg" style="display:none"><img src="img/duigou.gif" width="40" height="40"/></div></td></tr><tr><td height="30px" align="center" style="color: Red;font-size:larger">彩色扫描，PDF格式，大小不超过1M</td></tr></table>';
        html += '<input id="filecaseType" type="hidden" name="caseType" value="">';
        html += '<input id="filebookType" type="hidden" name="bookType" value="">';
        html += '<input id="filecaseno" type="hidden" name="caseno" value="">';
        $.jBox(html, { title: "文件上传", width: 500, height: 300, submit: submit, buttons: { '确定': 1, '取消': 0} });
        file_url('*.pdf;*.*', '1MB', caseType, bookType, caseno);
    });

    var submit = function (v, h, f) {
        if (v == 1) {
            var filename = h.find("#newfilename").html(); //文件名
            var caseType = h.find("#filecaseType").val();
            var bookType = h.find("#filebookType").val();
            var caseNo = h.find("#filecaseno").val();
            if (filename != '') {
                $.ajax({
                    type: "POST",
                    url: "Handler.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: 'flag=movebook&filename=' + filename + '&caseType=' + caseType + '&bookType=' + bookType + '&caseNo=' + caseNo,
                    success: function (data) {
                        if (data == "1") {
                            return true;
                        }
                    }
                });
            }
        }
        return true;
    };
});


function file_url(file_type, file_size, caseType, bookType, caseNo) {
    $('#file_upload').uploadify({
        'buttonClass': '',
        'buttonText': '<a href="javascript:void(0)" class="BtnShowhref">选择文件</a>',
        'auto': true,
        'multi': false,        //多文件上传    
        'queueID': 'fileQueue',
        'queueSizeLimit': 1, 	//同时上传文件数量 
        'progressData': 'percentage', //上传显示
        'overrideEvents': ['onDialogClose'],
        'fileSizeLimit': file_size, 	//最大值
         'fileTypeExts': file_type, //文件类型
        'removeCompleted': false,   //上传完成后是否自动消失
        'swf': 'js/SWF/uploadify.swf',
        'uploader': 'Handler.ashx?flag=uploadbookfile&caseType=' + caseType + '&bookType=' + bookType + '&caseNo=' + caseNo,
        'onUploadSuccess': function (file, data, response) {
            $('#' + file.id).find('.data').html(' 上传完毕');
            $("#fileQueue").html("");
            $("#newfilename").html(data);
            $("#upSucessImg").show();
            $("#filecaseType").val(caseType);
            $("#filebookType").val(bookType);
            $("#filecaseno").val(caseNo);
        },
        //返回一个错误，选择文件的时候触发
        'onSelectError': function (file, errorCode, errorMsg) {
            switch (errorCode) {
                case -100:
                    alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                    break;
                case -110:
                    alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
                    break;
                case -120:
                    alert("文件 [" + file.name + "] 大小异常！");
                    break;
                case -130:
                    alert("文件 [" + file.name + "] 类型不正确！");
                    break;
            }
        }
    });
}

//单击上传文件的取消按钮时，判断该文件是否已经上传过，如果已经上传过，需要做清理工作
$("#fileQueue .cancel").live("click", function () {
    $(".upfile").uploadify('cancel', '*');

    // $("#fileQueue").uploadifyCancel(queueID);
    //    //取得本次取消的上传文件ID号
    //    var fileId = $(this).parents(".uploadify-queue-item").attr("id");
    //    var fileInfo = null;
    //    //fileList中保存了所有的已上传文件信息。
    //    for (var i = 0; i < fileList.length; i++) {
    //        if (fileList[i].fileId == fileId) {
    //            fileInfo = fileList[i];
    //            fileList.splice(i, 1);
    //            break;
    //        }
    //    }
    //    //如果文件已经上传（即fileInfo不为空）
    //    if (fileInfo != null) {
    //        //将已经上传的文件从上传文件队列中清除（不然取消该已上传的文件后，再选择相同的文件上传将会提示“文件已存在！”
    //        delete uploadifyQueueData.files[fileId];
    //        //将垃圾文件从后台服务器中清除
    //        var suggest = {};
    //        suggest.fileList = [fileInfo];
    //        $.ajax({
    //            type: "POST",
    //            contentType: "application/json",
    //            url: "deleteFile",
    //            dataType: "json",
    //            data: JSON.stringify(suggest),
    //            error: function (data) {
    //                alert('删除失败');
    //            }
    //        });
    //    }
});

//查看图片的js 2014年7月24日09:23:42
$(function () {
    $('#chakan').click(function () {
        if ($("#picurl").val() == '') {
            return false;
        } else {
            var imgurl = $("#picurl").val();
        }

        var d = dialog({
            title: '图样查看',
            content: '<img width="817" height="479" src="./uploadify/' + imgurl + '" />',
            fixed: true
        });
        d.show();
    });
});
