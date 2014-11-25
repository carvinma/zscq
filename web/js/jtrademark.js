
function showGoods() {

    var html1 = '<div class="popbox" id="p_popbox">' +
      '<div class="mainhelp">' +
        '<div class="mainhelp_main">' +
          '<ul>' +
            '<li>商品/服务关键字：' +
              '<input type="text" class="input1" id="searchkey1">' +
            '</li>' +
            ' <li>类别：' +
              '<select class="select1" id="searchsort1">' +
                '<option>全部</option>' +
  '<option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option><option>32</option><option>33</option><option>34</option><option>35</option><option>36</option><option>37</option><option>38</option><option>39</option><option>40</option><option>41</option><option>42</option><option>43</option><option>44</option><option>45</option>              </select>' +
           '</li>' +
            '<li>' +
              '<input type="button" value="查询" class="input2" onclick="searchdetail()">' +
            '</li>' +
          '</ul>' +
        '</div>' +
        '<div class="mainhelp_foot">' +
          '<table border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0"><tbody><tr>' +
           '<th width="100" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</th>' +
              '<th width="920" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">说明</th></tr>';

    var html2 = '<div class="msg-div">' +
            '<p>给卖家留言：</p><div class="field"><textarea id="message" name="message"></textarea></div>' +
            '</div>';
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=maincategory",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                html1 = html1 + '<tr><td height="32" align="center" bgcolor="#FFFFFF"><a href="javascript:;" onclick="showsort(01)">' + data[i].CategoryCode + '</a></td>' + '<td align="center" bgcolor="#FFFFFF">' + data[i].CategoryRemark + '</td></tr>';
            }
            html1 = html1 + '</tbody></table></div></div></div>';
            jboxShow(html1, html2);
        }
    });
    //     $.ajax({
    //         url: "goods_details.php",
    //         type: "POST",
    //         data: { key: key, sort: sort },
    //         dataType: "json",
    //         success: function (data) {//如果调用php成功
    //             //显示提示信息

    //             $("#notice_search").next('p').remove();
    //             $("#notice_search").after('<p>您的关键字为<span style="color: #f00;">' + key + '</span>，所查到的结果共有<span style="color: #f00;">' + data.length + '</span>条</p>');

    //             //显示查询结果
    //             $("#search_row").next("table").remove();

    //             $("#search_row").after('<table class="main_lei" ><tr id="search_rowtr"><th width="100"><input type="checkbox" onclick="doSelect_search()" id="selectall_search" /></th><th width="100">类别</th><th width="400">类似群号</th><th width="100">商品编号</th><th width="600">商品名称</th></tr></table>');

    //             if (data.length == 0) {
    //                 $("#search_rowtr").after('<tr><td colspan="5" style="color:red;">没有相关数据，请确认您输入的关键字是否正确！<td></tr>');
    //             } else {
    //                 for (var i = 0; i < data.length; i++) {

    //                     var j = data[i]['pid'].substr(0, 2);
    //                     var quyu = i % 2;
    //                     if (quyu == 1) {
    //                         $("#search_rowtr").after('<tr><td><input type="checkbox" name="chkItem_search" value="' + data[i]['id'] + '"  /></td><td>' + j + '</td><td>' + data[i]['pid'] + ' </td><td>' + data[i]['sid'] + '</td><td>' + data[i]['name'] + '</td></tr>');
    //                     } else {
    //                         $("#search_rowtr").after('<tr class="changebg"><td><input type="checkbox" name="chkItem_search" value="' + data[i]['id'] + '"  /></td><td>' + j + '</td><td>' + data[i]['pid'] + ' </td><td>' + data[i]['sid'] + '</td><td>' + data[i]['name'] + '</td></tr>');
    //                     }
    //                 }
    //             }
    //         }
    //     });


}
function jboxShow(html1, html2) {

    var data = {};
    var states = {};
    states.state1 = {
        content: html1,
        buttons: { '取消': 0 },
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
                // 或 $.jBox.goToState('state2')
            }

            return false;
        }
    };
    states.state2 = {
        content: html2,
        buttons: { '上一步': -1, '提交': 1, '取消': 0 },
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
        buttons: {} // no buttons
    };
    states.state4 = {
        content: '',
        buttons: { '确定': 0 }
    };
    //$.jBox.open(states, '选择分类', '80%', '80%');
    $.jBox.open(states, '提交订单', '80%', 550, { top: 20 });
}

function showDelDailog(id) {
    $.jBox.confirm("确定要删除该申请人吗？<div style='display:none'>"+id+"</div>", "提示", submit);
}
var submit = function (v, h, f) {
    if (v == "ok") {
        var id = h.find("div:hidden").html();
        $.jBox.tip("正在删除数据...", 'loading');
        //eval($("#" + id).next("a").attr("href"));
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

//$("#txt_applyname").suggest(citys, { hot_list: commoncitys, dataContainer: '#fromCity_3word', attachObject: "#suggest" });

//初始化常用机场城市
var commoncitys = new Array();

commoncitys[0] = new Array('SZX', '深圳', 'SHENZHEN', 'SZ');

commoncitys[1] = new Array('PEK', '北京', 'BEIJING', 'BJ');

commoncitys[2] = new Array('SHA', '上海', 'SHANGHAI', 'SH');

commoncitys[3] = new Array('CAN', '广州', 'GUANGZHOU', 'GZ');

commoncitys[4] = new Array('CTU', '成都', 'CHENGDU', 'CD');

commoncitys[5] = new Array('HGH', '杭州', 'HANGZHOU', 'HZ');

commoncitys[6] = new Array('CSX', '长沙', 'CHANGSHA', 'CS');

commoncitys[7] = new Array('CKG', '重庆', 'CHONGQING', 'CQ');

commoncitys[8] = new Array('KMG', '昆明', 'KUNMING', 'KM');

commoncitys[9] = new Array('XIY', '西安', 'XIAN', 'XA');

commoncitys[10] = new Array('WUH', '武汉', 'WUHAN', 'WH');

commoncitys[11] = new Array('NKG', '南京', 'NANJING', 'NJ');

commoncitys[12] = new Array('TAO', '青岛', 'QINGDAO', 'QD');

commoncitys[13] = new Array('SYX', '三亚', 'SANYA', 'SY');

commoncitys[14] = new Array('XMN', '厦门', 'XIAMEN', 'XM');


//初始化所有国内机场城市
var citys = new Array();
// A

citys[0] = new Array('SHA', '上海', 'SHANGHAI', 'SH');

citys[1] = new Array('HYN', '黄岩', 'HUANGYAN', 'HY');

citys[2] = new Array('HGH', '杭州', 'HANGZHOU', 'HZ');

citys[3] = new Array('YIW', '义乌', 'YIWU', 'YW');

citys[4] = new Array('JUZ', '衢州', 'JUZHOU', 'QZ');

citys[5] = new Array('HSN', '舟山(普陀山)', 'ZHOUSHAN', 'ZS');

citys[6] = new Array('WNZ', '温州', 'WENZHOU', 'WZ');

citys[7] = new Array('NGB', '宁波', 'NINGBO', 'NB');

citys[8] = new Array('LNJ', '临沧', 'LINCANG', 'LC');

citys[9] = new Array('ZAT', '昭通', 'ZHAOTONG', 'ZT');

citys[10] = new Array('SYM', '思茅', 'SIMAO', 'SM');

citys[11] = new Array('LUM', '芒市', 'MANSHI', 'MS');

citys[12] = new Array('BSD', '保山', 'BAOSHAN', 'BS');

citys[13] = new Array('KMG', '昆明', 'KUNMING', 'KM');

citys[14] = new Array('JHG', '西双版纳', 'XISHUANGBANNA', 'XSBN');

citys[15] = new Array('DLU', '大理', 'DALI', 'DL');

citys[16] = new Array('DIG', '迪庆', 'DIQING', 'DQ');

citys[17] = new Array('LJG', '丽江', 'LIJIANG', 'LJ');

citys[18] = new Array('LXA', '拉萨', 'LASA', 'LS');

citys[19] = new Array('TCG', '塔城', 'TACHENG', 'TC');

citys[20] = new Array('IQM', '且末', 'QIEMO', 'QM');

citys[21] = new Array('KCA', '库车', 'KUCHE', 'KC');

citys[22] = new Array('HTN', '和田', 'HETAN', 'HT');

citys[23] = new Array('HMI', '哈密', 'HAMI', 'HM');

citys[24] = new Array('FYN', '富蕴', 'FUYUN', 'FY');

citys[25] = new Array('AKU', '阿克苏', 'AGESU', 'AKS');

citys[26] = new Array('URC', '乌鲁木齐', 'WULUMUQI', 'WLMQ');

citys[27] = new Array('KHG', '喀什', 'KASHI', 'KS');

citys[28] = new Array('KRL', '库尔勒', 'KUERLE', 'KEL');

citys[29] = new Array('KRY', '克拉玛依', 'KELAMAYI', 'KLMY');

citys[30] = new Array('AAT', '阿勒泰', 'ALETAI', 'ALT');

citys[31] = new Array('YIN', '伊宁', 'YINING', 'YN');

citys[32] = new Array('TSN', '天津', 'TIANJIN', 'TJ');

citys[33] = new Array('AKA', '安康', 'ANKANG', 'AK');

citys[34] = new Array('ENY', '延安', 'YANAN', 'YA');

citys[35] = new Array('HZG', '汉中', 'HANZHONG', 'HZ');

citys[36] = new Array('XIY', '西安', 'XIAN', 'XA');

citys[37] = new Array('UYN', '榆林', 'YULIN', 'YL');

citys[38] = new Array('CIH', '长治', 'CHANGZHI', 'CZ');

citys[39] = new Array('TYN', '太原', 'TAIYUAN', 'TY');

citys[40] = new Array('DAT', '大同', 'DATONG', 'DT');

citys[41] = new Array('YCU', '运城', 'YUNCHENG', 'YC');

citys[42] = new Array('TNA', '济南', 'JINAN', 'JN');

citys[43] = new Array('YNT', '烟台', 'YANTAI', 'YT');

citys[44] = new Array('JNG', '济宁', 'JINING', 'JL');

citys[45] = new Array('DOY', '东营', 'DONGYING', 'DY');

citys[46] = new Array('LYI', '临沂', 'LINYI', 'LY');

citys[47] = new Array('WEF', '潍坊', 'WEIFANG', 'WF');

citys[48] = new Array('TAO', '青岛', 'QINGDAO', 'QD');

citys[49] = new Array('WEH', '威海', 'WEIHAI', 'WH');

citys[50] = new Array('GHN', '广汉', 'GUANGHAN', 'GH');

citys[51] = new Array('DAX', '达县', 'DAXIAN', 'DX');

citys[52] = new Array('CTU', '成都', 'CHENGDU', 'CD');

citys[53] = new Array('MIG', '绵阳', 'MIANYANG', 'MY');

citys[54] = new Array('YBP', '宜宾', 'YIBIN', 'YB');

citys[55] = new Array('LZO', '泸州', 'LUZHOU', 'LZ');

citys[56] = new Array('XIC', '西昌', 'XICHANG', 'XC');

citys[57] = new Array('NAO', '南充', 'NANCHONG', 'NC');

citys[58] = new Array('PZI', '攀枝花', 'PANZHIHUA', 'PZH');

citys[59] = new Array('GOQ', '格尔木', 'GELANMU', 'GEM');

citys[60] = new Array('XNN', '西宁', 'XINING', 'XN');

citys[61] = new Array('ZHY', '中卫', 'ZHONGWEI', 'null');

citys[62] = new Array('INC', '银川', 'YINCHUAN', 'YC');

citys[63] = new Array('XIL', '锡林浩特', 'XILINHAOTE', 'XLHT');

citys[64] = new Array('HLH', '乌兰浩特', 'WULANHAOTE', 'WLHT');

citys[65] = new Array('WUA', '乌海', 'WUHAI', 'WH');

citys[66] = new Array('TGO', '通辽', 'TONGLIAO', 'TL');

citys[67] = new Array('HET', '呼和浩特', 'HUHEHAOTE', 'HHHT');

citys[68] = new Array('DSN', '鄂尔多斯', 'EERDUOSI', 'EEDS');

citys[69] = new Array('NZH', '满洲里', 'MANZHOULI', 'MZL');

citys[70] = new Array('HLD', '海拉尔', 'HAILAER', 'HLE');

citys[71] = new Array('CIF', '赤峰', 'CHIFENG', 'CF');

citys[72] = new Array('BAV', '包头', 'BAOTOU', 'BT');

citys[73] = new Array('CHG', '朝阳', 'CHAOYANG', 'CY');

citys[74] = new Array('SHE', '沈阳', 'SHENYANG', 'SY');

citys[75] = new Array('DLC', '大连', 'DALIAN', 'DL');

citys[76] = new Array('DDG', '丹东', 'DANDONG', 'DD');

citys[77] = new Array('JNZ', '锦州', 'JINZHOU', 'JZ');

citys[78] = new Array('AOG', '鞍山', 'ANSHAN', 'AS');

citys[79] = new Array('KHN', '南昌', 'NANCHANG', 'NC');

citys[80] = new Array('JDZ', '景德镇', 'JINDEZHEN', 'JDZ');

citys[81] = new Array('JIU', '九江', 'JIUJIANG', 'JJ');

citys[82] = new Array('KOW', '赣州', 'GANZHOU', 'GZ');

citys[83] = new Array('JGS', '井冈山', 'JINGGANGSHAN', 'JGS');

citys[84] = new Array('KNC', '吉安', 'JIAN', 'JA');

citys[85] = new Array('LYG', '连云港', 'LIANYUNGANG', 'LYG');

citys[86] = new Array('SZV', '苏州', 'SUZHOU', 'SZ');

citys[87] = new Array('YNZ', '盐城', 'YANCHENG', 'YC');

citys[88] = new Array('XUZ', '徐州', 'XUZHOU', 'XZ');

citys[89] = new Array('NKG', '南京', 'NANJING', 'NJ');

citys[90] = new Array('NTG', '南通', 'NANTONG', 'NT');

citys[91] = new Array('CZX', '常州', 'CHANGZHOU', 'CZ');

citys[92] = new Array('WUX', '无锡', 'WUXI', 'WX');

citys[93] = new Array('TNH', '通化', 'TONGHUA', 'TH');

citys[94] = new Array('JIL', '吉林', 'JILIN', 'JL');

citys[95] = new Array('CGQ', '长春', 'CHANGCHUN', 'CC');

citys[96] = new Array('YNJ', '延吉', 'YANJI', 'YJ');

citys[97] = new Array('HJJ', '芷江', 'ZHIJIANG', 'ZJ');

citys[98] = new Array('DYG', '张家界', 'ZHANGJIAJIE', 'ZJJ');

citys[99] = new Array('CGD', '常德', 'CHANGDE', 'CD');

citys[100] = new Array('CSX', '长沙', 'CHANGSHA', 'CS');

citys[101] = new Array('HNY', '衡阳', 'HENGYANG', 'HY');

citys[102] = new Array('OHE', '漠河', 'MOHE', 'MH');

citys[103] = new Array('HRB', '哈尔滨', 'HAERBIN', 'HRB');

citys[104] = new Array('HEK', '黑河', 'HEIHE', 'HH');

citys[105] = new Array('NDG', '齐齐哈尔', 'QIQIHAER', 'QQHE');

citys[106] = new Array('JMU', '佳木斯', 'JIAMUSI', 'JMS');

citys[107] = new Array('MDG', '牡丹江', 'MUDANJIANG', 'MDJ');

citys[108] = new Array('LYA', '洛阳', 'LUOYANG', 'LY');

citys[109] = new Array('NNY', '南阳', 'NANYANG', 'NY');

citys[110] = new Array('CGO', '郑州', 'ZHENGZHOU', 'ZZ');

citys[111] = new Array('SJW', '石家庄', 'SHIJIAZHUANG', 'SJZ');

citys[112] = new Array('SHP', '秦皇岛', 'QINHUANGDAO', 'QHD');

citys[113] = new Array('HDN', '邯郸', 'HANDAN', 'HD');

citys[114] = new Array('SHS', '沙市', 'SHASHI', 'SS');

citys[115] = new Array('WUH', '武汉', 'WUHAN', 'WH');

citys[116] = new Array('XFN', '襄樊', 'XIANGFAN', 'XF');

citys[117] = new Array('ENH', '恩施', 'ENSHI', 'ES');

citys[118] = new Array('YIH', '宜昌', 'YICHANG', 'YC');

citys[119] = new Array('HAK', '海口', 'HAIKOU', 'HK');

citys[120] = new Array('SYX', '三亚', 'SANYA', 'SY');

citys[121] = new Array('XYI', '兴义', 'XINGYI', 'XY');

citys[122] = new Array('KWE', '贵阳', 'GUIYANG', 'GY');

citys[123] = new Array('TEN', '铜仁', 'TONGREN', 'TR');

citys[124] = new Array('ZYI', '遵义', 'ZUNYI', 'ZY');

citys[125] = new Array('BHY', '北海', 'BEIHAI', 'BH');

citys[126] = new Array('KWL', '桂林', 'GUILIN', 'GL');

citys[127] = new Array('LZH', '柳州', 'LIUZHOU', 'LZ');

citys[128] = new Array('NNG', '南宁', 'NANNING', 'NN');

citys[129] = new Array('BAS', '百色', 'BAISE', 'BS');

citys[130] = new Array('WUZ', '梧州', 'WUZHOU', 'WZ');

citys[131] = new Array('THQ', '天水', 'TIANSHUI', 'null');

citys[132] = new Array('IQN', '庆阳', 'QINGYANG', 'QY');

citys[133] = new Array('CHW', '酒泉', 'JIUQUAN', 'JQ');

citys[134] = new Array('JGN', '嘉峪关', 'JIAYUGUAN', 'JYG');

citys[135] = new Array('DNH', '敦煌', 'DUNHUANG', 'DH');

citys[136] = new Array('LHW', '兰州', 'LANZHOU', 'LZ');

citys[137] = new Array('ZHA', '湛江', 'ZHANJIANG', 'ZJ');

citys[138] = new Array('MXZ', '梅州', 'MEIZHOU', 'MZ');

citys[139] = new Array('ZUH', '珠海', 'ZHUHAI', 'ZH');

citys[140] = new Array('SWA', '汕头', 'SHANTOU', 'ST');

citys[141] = new Array('SZX', '深圳', 'SHENZHEN', 'SZ');

citys[142] = new Array('CAN', '广州', 'GUANGZHOU', 'GZ');

citys[143] = new Array('XMN', '厦门', 'XIAMEN', 'XM');

citys[144] = new Array('WUS', '武夷山', 'WUYISHAN', 'WYS');

citys[145] = new Array('QHU', '泉州', 'QUANZHOU', 'QZ');

citys[146] = new Array('LIC', '连城', 'LIANCHENG', 'LC');

citys[147] = new Array('JJN', '晋江', 'JINJIANG', 'JJ');

citys[148] = new Array('FOC', '福州', 'FUZHOU', 'FZ');

citys[149] = new Array('WXN', '万县', 'WANXIAN', 'WX');

citys[150] = new Array('CKG', '重庆', 'CHONGQING', 'CQ');

citys[151] = new Array('TXN', '黄山', 'HUANGSHAN', 'HS');

citys[152] = new Array('BFU', '蚌埠', 'BENGBU', 'BB');

citys[153] = new Array('FUG', '阜阳', 'FUYANG', 'FY');

citys[154] = new Array('HFE', '合肥', 'HEFEI', 'HF');

citys[155] = new Array('AQG', '安庆', 'ANQING', 'AQ');

citys[156] = new Array('PEK', '北京', 'BEIJING', 'BJ');

/**
* 验证申请人消息提示
* 
* @param divId
* @param value
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
        value = $("#txt_applyname").val();
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


function SelCity(val) {
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

function SelArea(val) {
    var provinceName = $("#live_prov").find("option:selected").text();
    var cityName = isEmpty(val) ? "" : $("#live_city").find("option:selected").text().replace("市辖区", "").replace("县", "");
    $("#areaNameTxt").text(trimAll(provinceName) + trimAll(cityName));
    var cityId = $("#live_city").find("option:selected").val();
    $("#Hi_city").val(cityId);
    $.ajax({
        type: "POST",
        url: "Handler.ashx",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: "flag=selarea&cityid=" + val,
        success: function (data) {
            $("#live_country").html(data);
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