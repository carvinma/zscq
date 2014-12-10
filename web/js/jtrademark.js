
var htmlCommon1 = '<div class="popbox" id="p_popbox">' +
      '<div class="mainhelp">' +
        '<div>';
var htmlCommon2 = '</div><div class="mainhelp_foot">';
 var htmltable= '<table border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0"><tbody><tr>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</th>' +
              '<th width="920" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">说明</th></tr>';
var htmlCommon3 = '</tbody></table></div></div></div>';

var htmlddl1 = '<div class="mainhelp_main"><ul>' +
            '<li>商品/服务关键字：' +
              '<input type="text" class="input1" id="searchkey1">' +
            '</li>' +
            ' <li>类别：' +
              '<select class="select1" id="searchsort1">' +
                '<option val="-1">全部</option>';

var htmlddl2 = '</select>' +
           '</li>' +
            '<li>' +
              '<input type="button" value="查询" class="input2" onclick="searchdetail()">' +
            '</li>' +
          '</ul></div>';

//删除已经选择的商品的js
function del_onegoods(startnum) {
    var strval = new Array();
    //获取以下数组的长度
    $("tr[classname='arr_goods']").each(function (i) {
        // strval.push($(this).val());
        strval[i] = new Array();
        strval[i].push($(this).attr("val"));
        strval[i].push($(this).find("td:eq(1)").text());
        strval[i].push($(this).find("td:eq(2)").text());
        strval[i].push($(this).find("td:eq(3)").text());
        strval[i].push($(this).find("td:eq(4)").text());
        if (startnum != $(this).find("td:eq(0)").text())
            goodscalc.add($(this).find("td:eq(1)").text(), 1);
    });
//    var arr = new Array();
//    for (var i = 0; i < strval.length; i++) {
//        var j = parseInt(i) + parseInt(1);
//        arr[i] = new Array();
//        for (var k = 0; k < 4; k++) {
//            arr[i].push($("#" + k + j + "").text());
//        }
//    }
    //数组重构
    var arr = strval.reverse();
    var starticn = parseInt(startnum) - parseInt(1);
    var brr = new Array();
    arr.splice(starticn, 1);
    //清空table重新添加内容
    $("#th_table tr:gt(0)").remove();
    for (var m = 0; m < arr.length; m++) {
        var n = parseInt(m) + parseInt(1);
        //$("#th_box").after('<tr classname="arr_goods" name="arr_goods[]" id="arr_goods' + n + '"><td id="4' + n + '">' + n + '</td><td id="3' + n + '"><input type="hidden" name="hid_sort[]" classname="hid_classsort" value="' + arr[m][3] + '">' + arr[m][3] + '</td><td id="2' + n + '"><input type="hidden" name="hid_group[]" value="' + arr[m][2] + '">' + arr[m][2] + '</td><td id="1' + n + '"><input type="hidden" name="hid_goods[]" value="' + arr[m][1] + '">' + arr[m][1] + '</td><td id="0' + n + '"><input type="hidden" name="hid_goodsname[]" classname="' + sel_sortid + '"  value="' + arr[m][0] + '">' + arr[m][0] + '</td><td><a href="javascript:;" style="color:red;" onclick="del_onegoods(' + n + ')">删除</a></td></tr>');
        $("#th_box").after('<tr classname="arr_goods"  name="arr_goods[]" val="' + arr[m][0] + '" id="arr_goods' + n + '"><td height="25" align="center" bgcolor="#FFFFFF" id="4' + n + '">' + n + '</td><td height="25" align="center" bgcolor="#FFFFFF" id="3' + n + '"><input type="hidden" name="hid_sort[]" classname="hid_classsort" value="' + arr[m][1] + '">' + arr[m][1] + '</td><td height="25" align="center" bgcolor="#FFFFFF" id="2' + n + '"><input type="hidden" name="hid_group[]" value="' + arr[m][2] + '">' + arr[m][2] + '</td><td height="25" align="center" bgcolor="#FFFFFF" id="1' + n + '"><input type="hidden" name="hid_goods[]" value="' + arr[m][3] + '">' + arr[m][3] + '</td><td height="25" align="center" bgcolor="#FFFFFF" id="0' + n + '"><input type="hidden" name="hid_goodsname[]" classname="sel_sortid"  value="' + arr[m][4] + '">' + arr[m][4] + '</td><td height="25" align="center" bgcolor="#FFFFFF"><a href="javascript:;" style="color:red;" onclick="del_onegoods(' + n + ')">删除</a></td></tr>');
    }

    //更改分类
    var sortarr = $("#sortarr").val();
    var s_arr = sortarr.split(",");

    var p_arr = new Array();
    //获取以下数组的长度
    $("tr[classname='arr_goods']").each(function () {

        p_arr.push($(this).val());

    });
    if (p_arr.length > 0) {
        var mrr = new Array();
        for (var i = 0; i < p_arr.length; i++) {
            var j = parseInt(i) + parseInt(1);
            if ($.inArray($("#" + 3 + j + "").text(), mrr) == -1) {
                mrr.push($("#" + 3 + j + "").text());
            }
        }
        mrr.sort();
        var qarr = mrr.join(",");
        $("#sortarr").val(qarr);
    } else {
        $("#sortarr").val('');
    }
    goodscalc.toChangeDisplay();
}

//获取选中数据的value值
function addgoods() {
    var strval = new Array();
    $("input[name='chkItem']:checked").each(function () {
        //strval.push($(this).val());
        strval.push([$(this).val(), $(this).parent().next().html(), $(this).parent().next().next().html()]);
    });
    if (strval.length == 0) {
        return false;
    }
    //获取选中的商品服务所有的分类和类似群
    var sel_sortid = $("#sel_sortid").text();
    var sel_groupid = $("#sel_groupid").text();

    //获取已经选择分类
    var sortarr = $("#sortarr").val();
    if (sortarr == '') {
        $("#sortarr").val(sel_sortid);
    }
    else {
        var parr = new Array();
        parr = sortarr.split(",");
        //判断是否已经存在选择的类
        var state = 0;
        for (var i = 0; i < parr.length; i++) {
            if (parr[i] == sel_sortid) {
                state = 1;
                break;
            }
        }
        if (state == 0) {
            parr.push(sel_sortid);
        }
        //排序
        parr.sort();
        var qarr = parr.join(",");
        $("#sortarr").val(qarr);
    }
    //获取已经选择的商品服务的sid
    var arr_goods = new Array();
    //获取以下数组的长度
    $("tr[classname='arr_goods']").each(function () {
        //arr_goods.push($(this).val());
        //alert($(this).attr("val"));
        arr_goods.push($(this).attr("val"));
        goodscalc.add($(this).find("td:eq(1)").text(), 1);
    });
    var endnum = $("tr[classname='arr_goods']").length;
    $.each(strval, function (i, n) {
        if ($.inArray(n[0], arr_goods) == '-1') {
            endnum = endnum + parseInt(1);
            goodscalc.add(sel_sortid, 1);
            $("#th_box").after('<tr classname="arr_goods" name="arr_goods[]" val="' + n[0] + '" id="arr_goods' +
      endnum + '"><td height="25" align="center" bgcolor="#FFFFFF" id="4' + endnum + '">' + endnum + '</td><td align="center" bgcolor="#FFFFFF" id="3' + endnum
      + '"><input type="hidden" classname="hid_classsort" name="hid_sort[]" value="' +
      sel_sortid + '">' + sel_sortid +
      '</td><td align="center" bgcolor="#FFFFFF" id="2' + endnum + '"><input type="hidden" name="hid_group[]" value="' +
       sel_groupid + '">' + sel_groupid +
       '</td><td align="center" bgcolor="#FFFFFF" id="1' + endnum + '"><input type="hidden" name="hid_goods[]" value="'
       + n[1] + '">' + n[1] + '</td><td align="center" bgcolor="#FFFFFF" id="0' + endnum + '"><input type="hidden" name="hid_goodsname[]" classname="'
       + sel_sortid + '" value="' + n[2] + '">'
       + n[2] + '</td><td align="center" bgcolor="#FFFFFF"><a href="javascript:;" style="color:red;" onclick="del_onegoods(' + endnum + ')">删除</a></td></tr>');
        }
    });
    goodscalc.toChangeDisplay();
}
var goodscalc = {
    v: new Array(),
    add: function (key, value) { if (!this.v[key]) this.v[key] = 0; this.v[key] += value; },
    del: function (key, value) { if (!this.v[key]) this.v[key] = 0; this.v[key] -= value; },
    toString: function () {
        var s = '';
        for (var k in this.v)
        { s += k + '=' + this.v[k]; }
        return s;
    },
    toChangeDisplay: function () {
        var html = ""; var MainFees = $("#hi_MainFees").val();
        var ItemNum = $("#hi_ItemNum").val(); var ExceedFees = $("#hi_ExceedFees").val();
        var sum = 0; var totalgoods = 0;
        for (var k in this.v) {
            totalgoods+=this.v[k];
            if (this.v[k] > ItemNum) {
                var cost = parseFloat(MainFees) + (parseFloat(this.v[k]) - parseFloat(ItemNum)) * parseFloat(ExceedFees);
                sum += cost;
                html += "<p>类别【" + k + "】" + "共选择" + this.v[k] + "个商品项目，超出" + (this.v[k] - ItemNum) + "个，费用是：" + cost + "元</p><br/>";
            }
            else {
                sum += parseFloat(MainFees);
                html += "<p>类别【" + k + "】" + "共选择" + this.v[k] + "个商品项目，费用是：" + MainFees + "元</p><br/>";
            }
        }
        if (sum > 0) {
            html += "<p>共选择" + totalgoods + "个商品项目，费用" + sum + "元</p><br/>";
        }
        $("#goodsCalcInfo").html(html);
        this.v = [];
    }
}
var returnPostion = 0; //当搜索商品时返回上一级的标志
function searchdetail() {
    
    var key = $("#searchkey1").val();
    //var sort = ($("#searchsort1 option:selected").text());
    var sort = $("#searchsort1 option:selected").attr("val");
    //判断用户是否输入，自动去除空格
    key = key.replace(/[ ]/g, "");
    if (key == '') {
        return false;
    }
    returnPostion = 1;
    var htmltable = '<table border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0"><tbody><tr>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><input type="checkbox" onclick="doSelect()" id="selectall"></th>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</th>' +
           '<th width="300" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类似群号</th>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品编号</th>' +
           '<th width="600" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品名称</th></tr>';
    $.ajax({
        url: "Handler.ashx",
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=searchgoodsdetail&key=" + key + "&maincategoryid=" + sort,
        dataType: "json",
        success: function (data) {
            alert(data);
            var html = '';
            var tmp = '';
            for (var i = 0; i < data.length; i++) {
                tmp = tmp + '<tr><td height="32" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="chkItem" value="' + data[i].id + '"></td><td align="center" bgcolor="#FFFFFF">' + data[i].MainCategoryCode + '</td><td align="center" bgcolor="#FFFFFF">' + data[i].DetailCategoryCode + '</td><td align="center" bgcolor="#FFFFFF"><a href="javascript:;" onclick="showSelectGoods(' + "'" + data[i].id + "')" + '"' + ">" + data[i].GoodsCode + '</a></td>' + '<td align="center" bgcolor="#FFFFFF">' + data[i].GoodsRemark + '</td></tr>';
            }
            if (tmp == '')
                tmp = '<tr><td align="center" bgcolor="#FFFFFF" colspan="5" style="color:red;">没有相关数据，请确认您输入的关键字是否正确！<td></tr>';
            var resultHtml = '<div class="nowstyle"><p> 您的关键字为<span style="color: #f00;">' + key + '</span>，所查到的结果共有<span style="color: #f00;">' + data.length + '</span> 条</p></div>';
            html = htmlCommon1 + resultHtml + htmlCommon2 + htmltable + tmp + htmlCommon3;
            $.jBox.goToState('state3', html);
        }
    });
}
function showGoods() {
    var html1 = '';
    var html2 = '';
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=maincategory",
        dataType: "json",
        success: function (data) {
            var tmphtml = '';
            var htmlddl = '';
            for (var i = 0; i < data.length; i++) {
                htmlddl = htmlddl + '<option val="' + data[i].i_Id + '">' + data[i].CategoryCode + '</option>';
                tmphtml = tmphtml + '<tr><td height="32" align="center" bgcolor="#FFFFFF"><a href="javascript:;" onclick="showSort(' + "'" + data[i].i_Id + "','" + data[i].CategoryCode + "','" + data[i].CategoryRemark + "')" + '"' + ">" + data[i].CategoryCode + '</a></td>' + '<td align="center" bgcolor="#FFFFFF">' + data[i].CategoryRemark + '</td></tr>';
            }
            html1 = htmlCommon1 + htmlddl1 + htmlddl + htmlddl2 + htmlCommon2 + htmltable + tmphtml + htmlCommon3;
            returnPostion = 0;
            jboxShow(html1, html2);
        }
    });
}
function showSort(maminid, maincode, mainremark) {
    var selectedHtml = '<div class="nowstyle"><p> 当前类别为:<br><span>【' + maincode + '】' + mainremark + '</span> </p></div>';
    var html = '';
    //var tmp = '';
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=detailcategory&id=" + maminid,
        dataType: "json",
        success: function (data) {
            var msg = [];
            for (var i = 0; i < data.length; i++) {
                //tmp = tmp + '<tr><td height="32" align="center" bgcolor="#FFFFFF"><a href="javascript:;" onclick="showSelectGoods(' + "'" + data[i].i_Id + "')" + '"' + ">" + data[i].CategoryCode + '</a></td>' + '<td align="center" bgcolor="#FFFFFF">' + data[i].CategoryRemark + '</td></tr>';
                msg.push('<tr><td height="32" align="center" bgcolor="#FFFFFF"><a href="javascript:;" onclick="showSelectGoods(');
                msg.push("'"); msg.push(data[i].i_Id); msg.push("',");
                msg.push("'"); msg.push(data[i].CategoryCode); msg.push("',");
                msg.push("'"); msg.push(data[i].CategoryRemark); msg.push("',");
                msg.push("'"); msg.push(maincode); msg.push("',");
                msg.push("'"); msg.push(mainremark); msg.push("'");
                msg.push(')">'); msg.push(data[i].CategoryCode); msg.push('</a></td>');
                msg.push('<td align="center" bgcolor="#FFFFFF">'); msg.push(data[i].CategoryRemark); msg.push('</td></tr>')
            }

            html = htmlCommon1 + selectedHtml + htmlCommon2 + htmltable + msg.join('') + htmlCommon3;
            $.jBox.goToState('state2', html);
        }
    });

}
function showSelectGoods(detailid, detailcode, detailremark, maincode, mainremark) {
    var htmltable = '<table border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0"><tbody><tr>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><input type="checkbox" onclick="doSelect()" id="selectall"></th>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">编号</th>' +
           '<th width="880" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品名称</th></tr>';
    var selectedHtml = '<div class="nowstyle"><p> 当前类别为:<br><span>【<span id="sel_sortid">' + maincode + '</span>】' + mainremark + '</span> </p>' + '<p> 当前类别为:<br><span>【<span id="sel_groupid">' + detailcode + '</span>】' + detailremark + '</span> </p></div>';
    var html = '';
    var tmp = '';
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=goods&id=" + detailid,
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                tmp = tmp + '<tr><td height="32" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="chkItem" value="' + data[i].i_Id + '"></td><td height="32" align="center" bgcolor="#FFFFFF">'+ data[i].GoodsCode + '</td><td align="center" bgcolor="#FFFFFF">' + data[i].GoodsRemark + '</td></tr>';
            }
            html = htmlCommon1 + selectedHtml+htmlCommon2 + htmltable + tmp + htmlCommon3;
            $.jBox.goToState('state3', html, { title: '商品名称' });
        }
    });
}
function jboxShow(html1, html2) {

    var data = {};
    var states = {};
    states.state1 = {
        content: html1,
        buttons: { },
        submit: function (v, h, f) {
            if (v == 0) {
                return true; // close the window
            }
            else {
                h.find('.errorBlock').hide('fast', function () { $(this).remove(); });
                data.amount = f.amount; //或 h.find('#amount').val();
                if (data.amount == '' || parseInt(data.amount) < 1) {
                    $('<div class="errorBlock" style="display: none;">请输入购买数量！</div>').prependTo(h).show('fast');
                    return false;
                }
                data.address = f.address;
                if (data.address == '') {
                    $('<div class="errorBlock" style="display: none;">请输入收货地址！</div>').prependTo(h).show('fast');
                    return false;
                }

                $.jBox.nextState(); //go forward
                // 或 $.jBox.goToState('state2','ddddddd')
            }

            return false;
        }
    };
    states.state2 = {
        content: html2,
        buttons: { '返回上一级': -1, '取消': 0 },
        buttonsFocus: 1, // focus on the second button
        submit: function (v, o, f) {
            if (v == 0) {
                return true; // close the window
            } else if (v == -1) {
                $.jBox.prevState() //go back
                // 或 $.jBox.goToState('state1');
            }
            else {
                data.message = f.message;

                // do ajax request here
                $.jBox.nextState('<div class="msg-div">正在提交...</div>');
                // 或 $.jBox.goToState('state3', '<div class="msg-div">正在提交...</div>')
                // asume that the ajax is done, than show the result
                var msg = [];
                msg.push('<div class="msg-div">');
                msg.push('<p>下面是提交的数据</p>');
                for (var p in data) {
                    msg.push('<p>' + p + ':' + data[p] + '</p>');
                }
                msg.push('</div>');
                window.setTimeout(function () { $.jBox.nextState(msg.join('')); }, 2000);
            }
            return false;
        }
    };
    states.state3 = {
        content: '',
        buttons: { '返回上一级': -1, '添加所选商品': 1, '取消': 0 }, // no buttons
        submit: function (v, o, f) {
            if (v == 0) {
                return true; // close the window
            } else if (v == -1) {
                if (returnPostion == 1) {
                    $.jBox.goToState('state1');
                    returnPostion = 0
                }
                else $.jBox.prevState();
            }
            else if (v == 1) {
                addgoods();
                return true;
            }
            return false;
        }
    };
    
    //$.jBox.open(states, '选择分类', '80%', '80%');
    $.jBox.open(states, '选择分类', '80%', 550, { top: 20 });
}

//全选+全不选
function doSelect() {
    var state = $("#selectall").is(':checked');
    var arr = document.getElementsByName("chkItem");
    for (var i = 0; i < arr.length; i++) {
        if (state == false) {
            arr[i].checked = false;
        } else {
            arr[i].checked = true;
        }
    }
}
function showDelDailog(id) {
    $.jBox.confirm("确定要删除该申请人吗？<div style='display:none'>"+id+"</div>", "提示", submit);
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
//常用申请联系人
var applys = [];
function GetApplysDDL(userid, applytype) {
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=applysddl&userid=" + userid + "&applytype=" + applytype,
        dataType: "json",
        success: function (data) {
            var newapplys = [];
            var commonapplys = new Array();
            for (var i = 0; i < data.length; i++) {
                if (i <= 9)
                    commonapplys[i] = new Array(data[i].i_Id, data[i].ApplyName, data[i].ApplyPinYin, data[i].ApplyPinYin);
                newapplys[i] = new Array(data[i].i_Id, data[i].ApplyName, data[i].ApplyPinYin, data[i].ApplyPinYin, data[i].MainQualificationPath, data[i].provinceID, data[i].cityID, data[i].areaID, data[i].Address,
                 data[i].PhoneNo, data[i].FaxNo, data[i].PostCode, data[i].ApplyCardNo, data[i].CardNoPath);
            }
            applys = newapplys;
            $("#txt_applyname").suggest(newapplys, { hot_list: commonapplys, dataContainer: '#applyname_3word',
                attachObject: "#suggest", onSelect: function () { DisplaySelectedApplyInfo(applys); }
            });
        }
    });
}

// for add_trademark.aspx 当选中常用申请人时，给页面赋值
function DisplaySelectedApplyInfo(applys) {
    var selectapplyid = $("#applyname_3word").val();
 
     var findArray=new Array();
     for(var i=0;i<applys.length;i++) {
        if(applys[i][0]==selectapplyid)
        {
            findArray = applys[i];
           break;
        }
   }
   //alert(findArray[0]);
   //
   if (findArray[4] != null && findArray[4] != "") {
       $("#aBusinessLicense").attr("href", findArray[4]).show();
       $("#upBusinessLinces").val(findArray[4]);
   }
   else {
       $("#aBusinessLicense").attr("href", "").hide();
       $("#upBusinessLinces").val("");
   }
   $("#live_prov").val(findArray[5]).attr("selected", "selected");
   SelCity(findArray[5], findArray[6]);
   //$("#live_city").val(findArray[6]).attr("selected", "selected");
   SelArea(findArray[6], findArray[7]);
   //$("#live_country").val(findArray[7]);
   $("#txt_address").val(findArray[8]);
   $("#txt_phone").val(findArray[9]);
   $("#txt_fax").val(findArray[10]);
   $("#txt_postcode").val(findArray[11]);
   $("#txt_applyCardNo").val(findArray[12]);
   if (findArray[13] != null && findArray[13] != "") {
       $("#aCardNoPdf").attr("href", findArray[13]).show();
       $("#hiUpCardNo").val(findArray[13]);
   }
   else {
       $("#aCardNoPdf").attr("href", "").hide();
       $("#hiUpCardNo").val("");
   }
   $("#name_div_error").hide();
   $("#Hi_city").val(findArray[6]);
   $("#Hi_country").val(findArray[7]);
}

/*商标信息添加验证
*/

function addmarkCheck_data() {

    //获取以下选择商品的ID
    var goodsids = new Array();
    $("tr[classname='arr_goods']").each(function () {
        goodsids.push($(this).attr("val"));
    });
     $("#sortGoods").val(goodsids.join(','));
    var obj = $('input:radio[name="person"]:checked').val();
    if (obj == "" || obj == null) {
        alert("请选择申请人类别");
        return false;
    }
    if (!$(".appusertype").is(":hidden")) { //当申请人为自然人时，需要上传
        if (!check_ApplyUser("cardno_div")) {
            return false;
        }
        if ($("#hiUpCardNo").val() == "") {
            alert("请上传身份证扫描件");
            return false;
        }
    }
    if ($("#upBusinessLinces").val() == "") {
        alert("请上传营业执照");
        return false;
    }
    if ($("#upPattern1").val() == null || $("#upPattern1").val() == "") {
        alert("请上传商标图样1");
        return false;
    }
    if (check_ApplyUser("name_div") && check_ApplyUser("address_div")
    && check_ApplyUser("ContactPerson_div") && check_ApplyUser("phone_div")
    && check_ApplyUser("postcode_div")
    && check_ApplyUser("remark_div") && check_ApplyUser("sortarr_div"))
        return true;
    
    return false;
}

/**
* 验证申请人消息提示
* 
*/
function submitCheck_ApplyUser() {
    if (check_ApplyUser("name_div") && check_ApplyUser("cardno_div") && check_ApplyUser("phone_div")
    && check_ApplyUser("fax_div") && check_ApplyUser("address_div") && check_ApplyUser("postcode_div")
    && check_ApplyUser("email_div")&& check_ApplyUser("mobile_div"))
        return true;
    return false;
}
function check_ApplyUser(divId) {
    var errorFlag = false;
    var errorMessage = null;
    var value = null;
    if (divId == "name_div") {
        value = $("#txt_applyname").val().replace('中文/拼音','');
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您填写申请人名称";
        }
        if (value.length > 50) {
            errorFlag = true;
            errorMessage = "申请人名称不能大于50位";
        }
        if (!is_forbid(value)) {
            errorFlag = true;
            errorMessage = "申请人名称中含有非法字符";
        }
    }
   else if (divId == "cardno_div") {
        if (!$(".appusertype").is(":hidden")) {
            value = $("#txt_applyCardNo").val();
            if (isEmpty(value)) {
                errorFlag = true;
                errorMessage = "请您填写身份证号码";
            }
            else {
                if (!is_forbid(value)) {
                    errorFlag = true;
                    errorMessage = "身份证号码含有非法字符";
                }
                if (!check_idcardno(value)) {
                    errorFlag = true;
                    errorMessage = "身份证号码不正确";
                }
            }
        }
    }
    else if (divId == "phone_div") {
        value = $("#txt_phone").val();
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您填写电话号码";
        }
         else {
            if (!is_forbid(value)) {
                errorFlag = true;
                errorMessage = "固定电话号码中含有非法字符";
            }
            if (!checkPhone(value)) {
                errorFlag = true;
                errorMessage = "固定电话号码格式不正确";
            }
        }
    }
     else if (divId == "fax_div") {
        value = $("#txt_fax").val();
        if (!isEmpty(value)) {
            if (!check_fax(value)) {
                errorFlag = true;
                errorMessage = "传真格式不正确";
            }
        }
    }
    // 验证邮箱格式
    else if (divId == "email_div") {
        value = $("#txt_email").val();
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您填写电子邮箱";
        }
        else {
            if (value.length > 50) {
                errorFlag = true;
                errorMessage = "电子邮箱不能大于50位";
            }
            else {
                if (!check_email(value)) {
                    errorFlag = true;
                    errorMessage = "邮箱格式不正确";
                }
            }
        }  
    }
    else if (divId == "address_div") {
        var areavalue = $("#areaNameTxt").text();
         value = $("#txt_address").val();
         if (isEmpty(areavalue)) {
            divId="area_div";
            errorFlag = true;
            errorMessage = "请您选择行政区划";
        }
        else {
           $("#area_div_error").html("");
            if (isEmpty(value)) {
                errorFlag = true;
                errorMessage = "请您填写申请人详细地址";
            }
            if (!is_forbid(value)) {
                errorFlag = true;
                errorMessage = "申请人详细地址中含有非法字符";
            }
            if (value.length > 50) {
                errorFlag = true;
                errorMessage = "申请人详细地址过长";
            }
        }
    }
    else if (divId == "postcode_div") {
        value = $("#txt_postcode").val();
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您填写邮政编码";
        }
         else {
            if (!is_forbid(value)) {
                errorFlag = true;
                errorMessage = "邮政编码中含有非法字符";
            }
            if (!check_postcode(value)) {
                errorFlag = true;
                errorMessage = "邮政编码格式不正确";
            }
        }
    }
    
    else if (divId == "mobile_div") {
        value = $("#txt_mobile").val();
        if (!isEmpty(value)) {
            if (!check_mobile(value)) {
                errorFlag = true;
                errorMessage = "手机号码格式不正确";
            }
        }
    }
    else if (divId == "ContactPerson_div") {
        value = $("#txt_ContactPerson").val();
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您填写联系人名称";
        }
        if (value.length > 50) {
            errorFlag = true;
            errorMessage = "联系人名称不能大于50位";
        }
        if (!is_forbid(value)) {
            errorFlag = true;
            errorMessage = "联系人名称中含有非法字符";
        }
    }
    else if (divId == "remark_div") {
        value = $("#txt_remark").val();
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您填写商标说明";
        }
    }
    else if (divId == "sortarr_div") {
        value = $("#sortarr").val();
        if (isEmpty(value)) {
            errorFlag = true;
            errorMessage = "请您选择商标类别";
        }
    }

    if (errorFlag) {
        $("#" + divId + "_error").html(errorMessage);
        $("#" + divId).addClass("message");
        return false;
    } else {
        $("#" + divId).removeClass("message");
        $("#" + divId + "_error").html("");
    }
    return true;
}


function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
/**
* 判断是否是空
* @param value
*/
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

/**
* 判断是否是数字
*/
function isNumber(value) {
    if (isNaN(value)) {
        return false;
    }
    else {
        return true;
    }
}

/**
* 只包含中文和英文
* @param cs
* @returns {Boolean}
*/
function isGbOrEn(value) {
    var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (value.search(re) != -1) {
        return true;
    } else {
        return false;
    }
}

/**
* 检查邮箱格式
* @param email
* @returns {Boolean}
*/
function check_email(email) {
    if (email) {
        var myReg = /(^\s*)\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(\s*$)/;
        if (!myReg.test(email)) { return false; }
        return true;
    }
    return false;
}
function check_idcardno(idCardNo) {
    var check = /^(\d{15}|\d{17}[\dXx])$/.test(idCardNo);
    if (!check) return false;
     return true;
}
function check_fax(faxno)
{
    var reg=/(^[0-9]{3,4}-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^([0-9]{3,4})[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
     if (!reg.test(faxno)) { return false; }
     return true;               
}
function check_postcode(postcode)
{
     var reg= /^[1-9][0-9]{5}$/;
     if(!reg.test(postcode)) return false;
     return true;
}
/**
* 检查手机号码
* @param mobile
* @returns {Boolean}
*/
function check_mobile(mobile) {
    var regu = /^\d{11}$/;
    var re = new RegExp(regu);
    if (!re.test(mobile)) {
        return false;
    }
    return true;
}

/**
* 验证电话号码，带"(,),-"字符和数字其他不通过
* @param str
* @returns {Boolean}
*/
function checkPhone(str) {
    if (str.length > 20) {
        return false;
    }
    var patternStr = "(0123456789-)";
    var strlength = str.length;
    for (var i = 0; i < strlength; i++) {
        var tempchar = str.substring(i, i + 1);
        if (patternStr.indexOf(tempchar) < 0) {
            return false;
        }
    }
    return true;
}
//左右空格
function trimTxt(txt) {
    return txt.replace(/(^\s*)|(\s*$)/g, "");
}
//所有空格
function trimAll (txt) { return txt.replace(/\s/g, ''); }
/**
* 检查是否含有非法字符
* @param temp_str
* @returns {Boolean}
*/
function is_forbid(temp_str) {
    temp_str = trimTxt(temp_str);
    temp_str = temp_str.replace('*', "@");
    temp_str = temp_str.replace('--', "@");
    temp_str = temp_str.replace('/', "@");
    temp_str = temp_str.replace('+', "@");
    temp_str = temp_str.replace('\'', "@");
    temp_str = temp_str.replace('\\', "@");
    temp_str = temp_str.replace('$', "@");
    temp_str = temp_str.replace('^', "@");
    temp_str = temp_str.replace('.', "@");
    temp_str = temp_str.replace(';', "@");
    temp_str = temp_str.replace('<', "@");
    temp_str = temp_str.replace('>', "@");
    temp_str = temp_str.replace('"', "@");
    temp_str = temp_str.replace('=', "@");
    temp_str = temp_str.replace('{', "@");
    temp_str = temp_str.replace('}', "@");
    var forbid_str = new String('@,%,~,&');
    var forbid_array = new Array();
    forbid_array = forbid_str.split(',');
    for (i = 0; i < forbid_array.length; i++) {
        if (temp_str.search(new RegExp(forbid_array[i])) != -1)
            return false;
    }
    return true;
}

/**
* 检查数量
* @param txtObj
* @returns {Number}
*/
function checkLength(txtObj) {
    var val = txtObj;
    var valLength = 0;
    for (var ii = 0; ii < val.length; ii++) {
        var word = val.substring(ii, 1);
        if (/[^\x00-\xff]/g.test(word)) {
            valLength += 2;
        } else {
            valLength++;
        }
    }
    return valLength;
}

function InitProCityArea() {
    $("#areaNameTxt").text("");
    SelProv();
}
function SelProv() {
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=selprov",
        success: function (date) {
            $("#live_prov").html(date);
        }
    });
}


function SelCity(val,cityid) {
    var provinceName = isEmpty(val) ? "" : $("#live_prov").find("option:selected").text();
    $("#areaNameTxt").html(provinceName); 
    $("#live_country").html("<option selected=\"\" value=\"\">请选择：</option>");
    var provinceId = $("#live_prov").find("option:selected").val();
    $("#Hi_prov").val(provinceId);

    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=selcity&provinceid="+val,
        success: function (data) {
            $("#live_city").html(data);
            if(cityid!=null)
               $("#live_city").val(cityid).attr("selected", "selected");
            if (val == null || val == "") {
                $("#live_city").html("<option selected=\"\" value=\"\">请选择：</option>");
                $("#live_country").html("<option selected=\"\" value=\"\">请选择：</option>");
                return;
            }
        }
    });
}


/*
* 级联选择区县
*
* @access   public
* @val      string  选择的市枚举值
* @input    string  返回的select
* @return   string  返回的option
*/

function SelArea(val,areaid) {
    var provinceName = $("#live_prov").find("option:selected").text();
    var cityName = isEmpty(val) ? "" : $("#live_city").find("option:selected").text().replace("市辖区", "").replace("县", "");
    $("#areaNameTxt").text(trimAll(provinceName) + trimAll(cityName));
    var cityId = $("#live_city").find("option:selected").val();
    //$("#Hi_city").val(cityId);
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=selarea&cityid=" + val,
        success: function (data) {
            $("#live_country").html(data);
            if (areaid != null) {
                $("#live_country").val(areaid).attr("selected", "selected");
                SetAddress(areaid);
            }
            if (val == null || val == "") {
                $("#live_country").html("<option selected=\"\" value=\"\">请选择：</option>");
                return;
            }
        }
    });
}

function SetAddress(val) {
    var provinceName = $("#live_prov").find("option:selected").text();
    var cityName = $("#live_city").find("option:selected").text().replace("市辖区", "").replace("县", "");
    var countyName = isEmpty(val) ? "" : $("#live_country").find("option:selected").text();
    
//    var provinceId = $("#live_prov").find("option:selected").val();
//    var cityId = $("#live_city").find("option:selected").val();
    var countyId = $("#live_country").find("option:selected").val();
    $("#Hi_country").val(countyId);
    $("#areaNameTxt").text(trimAll(provinceName) + trimAll(cityName) + trimAll(countyName));
}


$("textarea[maxlength]").bind("input propertychange", function () {
    if ($(this).val().length > $(this).attr("maxlength"))
        $(this).val($(this).val().substring(0, $(this).attr("maxlength")));
});
$(".numberinput").bind("input propertychange", function () {
    var obj = $(this).val();
    obj = obj.replace(/[^\d.]/g, ""); //清除“数字”和“.”以外的字符
    obj = obj.replace(/^\./g, ""); //验证第一个字符是数字而不是.
    obj = obj.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的.
    obj = obj.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
    $(this).val(obj);
}).bind("paste", function () { //CTR+V事件处理 
    var obj = $(this).val();
    obj = obj.replace(/[^\d.]/g, "").replace(/^\./g, "").replace(/\.{2,}/g, ".");
    obj = obj.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
    $(this).val(obj);
}).css("ime-mode", "disabled");

$(".intinput").bind("input propertychange paste", function () {
    $(this).val($(this).val().replace(/[^\d]/g, ''));
}).css("ime-mode", "disabled");