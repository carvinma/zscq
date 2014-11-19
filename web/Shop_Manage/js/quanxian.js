
/*
数组 第一位：浏览； 第二位：添加； 第三位：修改； 第四位：删除； 第五位：导出；
*/

/*定义数组*/

/*商品管理*/
var chanpinguanli = "";
/*商品订单管理*/
var danpindingdanguanli = "";
/*解决方案管理*/
var jiejuefanganguanli = "";
/*成功案例管理*/
var chenggonganliguanli = "";
/*预约订单管理*/
var yuyuedingdanguanli = "";
/*销售统计管理*/
var xiaoshoutongjiguanli = "";
/*会员管理*/
var huiyuanguanli = "";
/*楼盘与户型管理*/
var loupanyuhuxingguanli = "";
/*促销管理*/
var cuxiaoguanli = "";
/*广告管理*/
var guanggaoguanli = "";
/*站内统计*/
var zhanneitongji = "";
/*胭脂币管理*/
var lipinkaguanli = "";
/*代金券管理*/
var youhuiquanguanli = "";
/*新闻管理*/
var xinwenzixunguanli = "";
/*权限管理*/
var quanxianguanli = "";
/*设计师管理*/
var shejishiguanli = "";
/*实体店管理*/
var shitidianguanli = "";
/*系统设置*/
var xitongshezhi = "";
/*省市地区管理*/
var shengshidiquguanli = "";
/*数据库管理*/
var shujukuguanli = "";
/*短信管理*/
var duanxinguanli = "";
/*邮件管理*/
var youjianguanli = "";
/*帮助中心管理*/
var bangzhuzhongxinguanli = "";

/*------------------------拼凑字符串-商品管理-------------------------*/
function pchanpinguanli() {
    chanpinguanli = "";
    /*分类管理*/
    var a = document.getElementsByName("Yidflag11");
    if (a[0].checked == true)
        chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var a1 = document.getElementsByName("Yidflag12");
        if (a1[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var a2 = document.getElementsByName("Yidflag13");
        if (a2[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var a3 = document.getElementsByName("Yidflag14");
        if (a3[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0|";
        /*品牌管理*/
        var b = document.getElementsByName("Yidflag21");
        if (b[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var b1 = document.getElementsByName("Yidflag22");
        if (b1[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var b2 = document.getElementsByName("Yidflag23");
        if (b2[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var b3 = document.getElementsByName("Yidflag24");
        if (b3[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0|";

        /*商品管理*/
        var c = document.getElementsByName("Yidflag31");
        if (c[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var c1 = document.getElementsByName("Yidflag32");
        if (c1[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var c2 = document.getElementsByName("Yidflag33");
        if (c2[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
        var c3 = document.getElementsByName("Yidflag34");
        if (c3[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0|";

        /*评论管理*/
        var d = document.getElementsByName("Yidflag41");
        if (d[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0";
        chanpinguanli += "0";

        var d1 = document.getElementsByName("Yidflag42");
        if (d1[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0|";

        /*咨询管理*/
        var e = document.getElementsByName("Yidflag51");
        if (e[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0";

        var e1 = document.getElementsByName("Yidflag52");
        if (e1[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        var e2 = document.getElementsByName("Yidflag53");
        if (e2[0].checked == true)
            chanpinguanli += "1";
        else
            chanpinguanli += "0";

        chanpinguanli += "0|";

        /*商品类别转移*/
        var f = document.getElementsByName("Yidflag61");
        if (f[0].checked == true) //浏览
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
      
            chanpinguanli += "0";
        var f2 = document.getElementsByName("Yidflag62");
        if (f2[0].checked == true)//修改
            chanpinguanli += "1";
        else
            chanpinguanli += "0";
       
            chanpinguanli += "0";

            chanpinguanli += "0|"; //导出


        /*批量修改价格*/
            var g = document.getElementsByName("Yidflag71");
            if (g[0].checked == true) //浏览
                chanpinguanli += "1";
            else
                chanpinguanli += "0";

            chanpinguanli += "0";
            var g2 = document.getElementsByName("Yidflag72");
            if (g2[0].checked == true)//修改
                chanpinguanli += "1";
            else
                chanpinguanli += "0";

            chanpinguanli += "0";

            chanpinguanli += "0|"; //导出

        }


        /*----------------------拼凑字符串-商品订单管理---------------------*/
        function pdanpindingdanguanli() {
            /*后台订单*/

            danpindingdanguanli += "0";
            var a1 = document.getElementsByName("Yidflag81");
            if (a1[0].checked == true)//添加
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            danpindingdanguanli += "0";
            danpindingdanguanli += "0";

            danpindingdanguanli += "0|"; //导出

            /*待处理订单*/
            var b = document.getElementsByName("Yidflag91");
            if (b[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var b2 = document.getElementsByName("Yidflag92");
            if (b2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var b3 = document.getElementsByName("Yidflag93");
            if (b3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var b4 = document.getElementsByName("Yidflag94");
            if (b4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";

            /*待付款订单*/
            var c = document.getElementsByName("Yidflag101");
            if (c[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var c2 = document.getElementsByName("Yidflag102");
            if (c2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var c3 = document.getElementsByName("Yidflag103");
            if (c3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var c4 = document.getElementsByName("Yidflag104");
            if (c4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";


            /*待发货订单*/
            var d = document.getElementsByName("Yidflag111");
            if (d[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var d2 = document.getElementsByName("Yidflag112");
            if (d2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var d3 = document.getElementsByName("Yidflag113");
            if (d3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var d4 = document.getElementsByName("Yidflag114");
            if (d4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";

            /*已完成订单*/
            var e = document.getElementsByName("Yidflag121");
            if (e[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var e2 = document.getElementsByName("Yidflag122");
            if (e2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var e3 = document.getElementsByName("Yidflag123");
            if (e3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var e4 = document.getElementsByName("Yidflag124");
            if (e4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";

            /*已完成订单*/
            var f = document.getElementsByName("Yidflag131");
            if (f[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var f2 = document.getElementsByName("Yidflag132");
            if (f2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var f3 = document.getElementsByName("Yidflag133");
            if (f3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var f4 = document.getElementsByName("Yidflag134");
            if (f4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";

            /*退货订单*/
            var g = document.getElementsByName("Yidflag141");
            if (g[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var g2 = document.getElementsByName("Yidflag142");
            if (g2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var g3 = document.getElementsByName("Yidflag143");
            if (g3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var g4 = document.getElementsByName("Yidflag144");
            if (g4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";


            /*无效订单*/
            var h = document.getElementsByName("Yidflag151");
            if (h[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var h2 = document.getElementsByName("Yidflag152");
            if (h2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var h3 = document.getElementsByName("Yidflag153");
            if (h3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var h4 = document.getElementsByName("Yidflag154");
            if (h4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";


//            /**/
//            var i = document.getElementsByName("Yidflag161");
//            if (i[0].checked == true) //浏览
//                danpindingdanguanli += "1";
//            else
//                danpindingdanguanli += "0";

//            danpindingdanguanli += "0";
//            var i2 = document.getElementsByName("Yidflag162");
//            if (i2[0].checked == true)//修改
//                danpindingdanguanli += "1";
//            else
//                danpindingdanguanli += "0";
//            var i3 = document.getElementsByName("Yidflag163");
//            if (i3[0].checked == true)//删除
//                danpindingdanguanli += "1";
//            else
//                danpindingdanguanli += "0";

//            var i4 = document.getElementsByName("Yidflag164");
//            if (i4[0].checked == true)//导出
//                danpindingdanguanli += "1|";
//            else
//                danpindingdanguanli += "0|";


            /*投诉订单*/
            var j = document.getElementsByName("Yidflag171");
            if (j[0].checked == true) //浏览
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            danpindingdanguanli += "0";
            var j2 = document.getElementsByName("Yidflag172");
            if (j2[0].checked == true)//修改
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";
            var j3 = document.getElementsByName("Yidflag173");
            if (j3[0].checked == true)//删除
                danpindingdanguanli += "1";
            else
                danpindingdanguanli += "0";

            var j4 = document.getElementsByName("Yidflag174");
            if (j4[0].checked == true)//导出
                danpindingdanguanli += "1|";
            else
                danpindingdanguanli += "0|";


        }

        /*-----------------------解决方案管理--------------------*/
        function pjiejuefanganguanli() {
            /*分类管理*/
            var a = document.getElementsByName("Yidflag181");
            if (a[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var a1 = document.getElementsByName("Yidflag182");
            if (a1[0].checked == true)//添加
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var a2 = document.getElementsByName("Yidflag183");
            if (a2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var a3 = document.getElementsByName("Yidflag184");
            if (a3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出

            /*板材管理*/
            var b = document.getElementsByName("Yidflag191");
            if (b[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var b1 = document.getElementsByName("Yidflag192");
            if (b1[0].checked == true)//添加
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var b2 = document.getElementsByName("Yidflag193");
            if (b2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var b3 = document.getElementsByName("Yidflag194");
            if (b3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出

            /*沙发面料管理*/
            var c = document.getElementsByName("Yidflag201");
            if (c[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var c1 = document.getElementsByName("Yidflag202");
            if (c1[0].checked == true)//添加
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var c2 = document.getElementsByName("Yidflag203");
            if (c2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var c3 = document.getElementsByName("Yidflag204");
            if (c3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出


            /*风格实景管理*/
            var d = document.getElementsByName("Yidflag211");
            if (d[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var d1 = document.getElementsByName("Yidflag212");
            if (d1[0].checked == true)//添加
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var d2 = document.getElementsByName("Yidflag213");
            if (d2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var d3 = document.getElementsByName("Yidflag214");
            if (d3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出

            /*方案管理*/
            var e = document.getElementsByName("Yidflag221");
            if (e[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var e1 = document.getElementsByName("Yidflag222");
            if (e1[0].checked == true)//添加
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var e2 = document.getElementsByName("Yidflag223");
            if (e2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var e3 = document.getElementsByName("Yidflag224");
            if (e3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出

            /*方案高级*/
            var f = document.getElementsByName("Yidflag231");
            if (f[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var f1 = document.getElementsByName("Yidflag232");
            if (f1[0].checked == true)//添加
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var f2 = document.getElementsByName("Yidflag233");
            if (f2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var f3 = document.getElementsByName("Yidflag234");
            if (f3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出

            /*方案咨询管理*/

            var a = document.getElementsByName("Yidflag741");
            if (a[0].checked == true) //浏览
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
           
                jiejuefanganguanli += "0";
            var a2 = document.getElementsByName("Yidflag742");
            if (a2[0].checked == true)//修改
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";
            var a3 = document.getElementsByName("Yidflag743");
            if (a3[0].checked == true)//删除
                jiejuefanganguanli += "1";
            else
                jiejuefanganguanli += "0";

            jiejuefanganguanli += "0|"; //导出

        }

        /*-------------------成功案例管理----------------------*/
        function pchenggonganliguanli() {
            var a = document.getElementsByName("Yidflag241");
            if (a[0].checked == true) //浏览
                chenggonganliguanli += "1";
            else
                chenggonganliguanli += "0";
            var a1 = document.getElementsByName("Yidflag242");
            if (a1[0].checked == true)//添加
                chenggonganliguanli += "1";
            else
                chenggonganliguanli += "0";
            var a2 = document.getElementsByName("Yidflag243");
            if (a2[0].checked == true)//修改
                chenggonganliguanli += "1";
            else
                chenggonganliguanli += "0";
            var a3 = document.getElementsByName("Yidflag244");
            if (a3[0].checked == true)//删除
                chenggonganliguanli += "1";
            else
                chenggonganliguanli += "0";

            chenggonganliguanli += "0|"; //导出


        }

        /*-----------------预约订单管理----------------------*/

        function pyuyuedingdanguanli() {
            /*待处理订单*/
            var a = document.getElementsByName("Yidflag251");
            if (a[0].checked == true) //浏览
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var a1 = document.getElementsByName("Yidflag252");
            if (a1[0].checked == true)//添加
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var a2 = document.getElementsByName("Yidflag253");
            if (a2[0].checked == true)//修改
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var a3 = document.getElementsByName("Yidflag254");
            if (a3[0].checked == true)//删除
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";

            yuyuedingdanguanli += "0|"; //导出

            /*待发货订单*/
            var a10 = document.getElementsByName("Yidflag261");
            if (a10[0].checked == true) //浏览
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var a11 = document.getElementsByName("Yidflag262");
            if (a11[0].checked == true)//添加
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var a21 = document.getElementsByName("Yidflag263");
            if (a21[0].checked == true)//修改
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var a31 = document.getElementsByName("Yidflag264");
            if (a31[0].checked == true)//删除
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";

            yuyuedingdanguanli += "0|"; //导出

            /*待分配订单*/
            var b = document.getElementsByName("Yidflag271");
            if (b[0].checked == true) //浏览
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var b1 = document.getElementsByName("Yidflag272");
            if (b1[0].checked == true)//添加
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var b2 = document.getElementsByName("Yidflag273");
            if (b2[0].checked == true)//修改
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var b3 = document.getElementsByName("Yidflag274");
            if (b3[0].checked == true)//删除
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";

            yuyuedingdanguanli += "0|"; //导出


            /*已完成订单*/
            var c = document.getElementsByName("Yidflag281");
            if (c[0].checked == true) //浏览
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var c1 = document.getElementsByName("Yidflag282");
            if (c1[0].checked == true)//添加
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var c2 = document.getElementsByName("Yidflag283");
            if (c2[0].checked == true)//修改
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var c3 = document.getElementsByName("Yidflag284");
            if (c3[0].checked == true)//删除
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";

            yuyuedingdanguanli += "0|"; //导出

            /*无效订单*/
            var d = document.getElementsByName("Yidflag291");
            if (d[0].checked == true) //浏览
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var d1 = document.getElementsByName("Yidflag292");
            if (d1[0].checked == true)//添加
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var d2 = document.getElementsByName("Yidflag293");
            if (d2[0].checked == true)//修改
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";
            var d3 = document.getElementsByName("Yidflag294");
            if (d3[0].checked == true)//删除
                yuyuedingdanguanli += "1";
            else
                yuyuedingdanguanli += "0";

            yuyuedingdanguanli += "0|"; //导出


        }

        /*--------------销售统计管理 -------------*/
        function pxiaoshoutongjiguanli() {
            /*商品销量统计*/
            var a = document.getElementsByName("Yidflag301");
            if (a[0].checked == true) //浏览
                xiaoshoutongjiguanli += "1";
            else
                xiaoshoutongjiguanli += "0";
           
                xiaoshoutongjiguanli += "0";

                xiaoshoutongjiguanli += "0";
                xiaoshoutongjiguanli += "0";
            var a3 = document.getElementsByName("Yidflag302");
            if (a3[0].checked == true)//导出
                xiaoshoutongjiguanli += "1|";
            else
                xiaoshoutongjiguanli += "0|";


            /*订单数量统计*/
            var b = document.getElementsByName("Yidflag311");
            if (b[0].checked == true) //浏览
                xiaoshoutongjiguanli += "1";
            else
                xiaoshoutongjiguanli += "0";

            xiaoshoutongjiguanli += "0";

            xiaoshoutongjiguanli += "0";
            xiaoshoutongjiguanli += "0";
            var b3 = document.getElementsByName("Yidflag312");
            if (b3[0].checked == true)//导出
                xiaoshoutongjiguanli += "1|";
            else
                xiaoshoutongjiguanli += "0|";

            /*订单付款统计*/
            var c = document.getElementsByName("Yidflag321");
            if (c[0].checked == true) //浏览
                xiaoshoutongjiguanli += "1";
            else
                xiaoshoutongjiguanli += "0";

            xiaoshoutongjiguanli += "0";

            xiaoshoutongjiguanli += "0";
            xiaoshoutongjiguanli += "0";
            var c3 = document.getElementsByName("Yidflag322");
            if (c3[0].checked == true)//导出
                xiaoshoutongjiguanli += "1|";
            else
                xiaoshoutongjiguanli += "0|";

            /*预约测量统计*/
            var d = document.getElementsByName("Yidflag331");
            if (d[0].checked == true) //浏览
                xiaoshoutongjiguanli += "1";
            else
                xiaoshoutongjiguanli += "0";

            xiaoshoutongjiguanli += "0";

            xiaoshoutongjiguanli += "0";
            xiaoshoutongjiguanli += "0";
            var d3 = document.getElementsByName("Yidflag332");
            if (d3[0].checked == true)//导出
                xiaoshoutongjiguanli += "1|";
            else
                xiaoshoutongjiguanli += "0|";


        }

        /*---------------会员管理-------------------*/
        function phuiyuanguanli() {
            /*会员管理*/
            var a = document.getElementsByName("Yidflag341");
            if (a[0].checked == true) //浏览
                huiyuanguanli += "1";
            else
                huiyuanguanli += "0";
            var a1 = document.getElementsByName("Yidflag342");
            if (a1[0].checked == true)//添加
                huiyuanguanli += "1";
            else
                huiyuanguanli += "0";
            var a2 = document.getElementsByName("Yidflag343");
            if (a2[0].checked == true)//修改
                huiyuanguanli += "1";
            else
                huiyuanguanli += "0";
            var a3 = document.getElementsByName("Yidflag344");
            if (a3[0].checked == true)//删除
                huiyuanguanli += "1";
            else
                huiyuanguanli += "0";

            huiyuanguanli += "0|"; //导出

            /*站内消息管理*/
            var b = document.getElementsByName("Yidflag351");
            if (b[0].checked == true) //浏览
                huiyuanguanli += "1";
            else
                huiyuanguanli += "0";
           
                huiyuanguanli += "0";
           
                huiyuanguanli += "0";
            var b3 = document.getElementsByName("Yidflag352");
            if (b3[0].checked == true)//删除
                huiyuanguanli += "1";
            else
                huiyuanguanli += "0";

            huiyuanguanli += "0|"; //导出

        }

        /*-----------------楼盘与户型管理---------------------*/
        function ploupanyuhuxingguanli() {
            /*楼盘管理*/
            var a = document.getElementsByName("Yidflag361");
            if (a[0].checked == true) //浏览
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";
            var a1 = document.getElementsByName("Yidflag362");
            if (a1[0].checked == true)//添加
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";
            var a2 = document.getElementsByName("Yidflag363");
            if (a2[0].checked == true)//修改
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";
            var a3 = document.getElementsByName("Yidflag364");
            if (a3[0].checked == true)//删除
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";

            loupanyuhuxingguanli += "0|"; //导出

            /*户型管理*/
            var b = document.getElementsByName("Yidflag371");
            if (b[0].checked == true) //浏览
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";
            var b1 = document.getElementsByName("Yidflag372");
            if (b1[0].checked == true)//添加
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";
            var b2 = document.getElementsByName("Yidflag373");
            if (b2[0].checked == true)//修改
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";
            var b3 = document.getElementsByName("Yidflag374");
            if (b3[0].checked == true)//删除
                loupanyuhuxingguanli += "1";
            else
                loupanyuhuxingguanli += "0";

            loupanyuhuxingguanli += "0|"; //导出

        }

        /*--------------促销管理-------------------*/
        function pcuxiaoguanli() {
            var a = document.getElementsByName("Yidflag381");
            if (a[0].checked == true) //浏览
                cuxiaoguanli += "1";
            else
                cuxiaoguanli += "0";
           
                cuxiaoguanli += "0";
            var a2 = document.getElementsByName("Yidflag382");
            if (a2[0].checked == true)//修改
                cuxiaoguanli += "1";
            else
                cuxiaoguanli += "0";
            
                cuxiaoguanli += "0";

                cuxiaoguanli += "0|"; //导出

            }

            /*---------------------广告管理-------------------------*/
            function pguanggaoguanli() {
                /*广告类别管理*/
                var a = document.getElementsByName("Yidflag391");
                if (a[0].checked == true) //浏览
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var a1 = document.getElementsByName("Yidflag392");
                if (a1[0].checked == true)//添加
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var a2 = document.getElementsByName("Yidflag393");
                if (a2[0].checked == true)//修改
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var a3 = document.getElementsByName("Yidflag394");
                if (a3[0].checked == true)//删除
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";

                guanggaoguanli += "0|"; //导出

                /*广告管理*/
                var b = document.getElementsByName("Yidflag401");
                if (b[0].checked == true) //浏览
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var b1 = document.getElementsByName("Yidflag402");
                if (b1[0].checked == true)//添加
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var b2 = document.getElementsByName("Yidflag403");
                if (b2[0].checked == true)//修改
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var b3 = document.getElementsByName("Yidflag404");
                if (b3[0].checked == true)//删除
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";

                guanggaoguanli += "0|"; //导出

                /*二级页面广告管理*/
                var c = document.getElementsByName("Yidflag411");
                if (c[0].checked == true) //浏览
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var c1 = document.getElementsByName("Yidflag412");
                if (c1[0].checked == true)//添加
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var c2 = document.getElementsByName("Yidflag413");
                if (c2[0].checked == true)//修改
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";
                var c3 = document.getElementsByName("Yidflag414");
                if (c3[0].checked == true)//删除
                    guanggaoguanli += "1";
                else
                    guanggaoguanli += "0";

                guanggaoguanli += "0|"; //导出

            }

            /*站内统计*/
            function pzhanneitongji() {
                /*搜索统计*/
                var a = document.getElementsByName("Yidflag421");
                if (a[0].checked == true) //浏览
                    zhanneitongji += "1";
                else
                    zhanneitongji += "0";
               
                    zhanneitongji += "0";
               
                    zhanneitongji += "0";
                var a3 = document.getElementsByName("Yidflag422");
                if (a3[0].checked == true)//删除
                    zhanneitongji += "1";
                else
                    zhanneitongji += "0";

                var a4 = document.getElementsByName("Yidflag423");
                if (a4[0].checked == true)//导出
                    zhanneitongji += "1|";
                else
                    zhanneitongji += "0|";

                /*会员订单排行*/
                var b = document.getElementsByName("Yidflag431");
                if (b[0].checked == true) //浏览
                    zhanneitongji += "1";
                else
                    zhanneitongji += "0";

                zhanneitongji += "0";

                zhanneitongji += "0";
               
                    zhanneitongji += "0";

                var b4 = document.getElementsByName("Yidflag432");
                if (b4[0].checked == true)//导出
                    zhanneitongji += "1|";
                else
                    zhanneitongji += "0|";

                /*商品浏览统计*/
                var c = document.getElementsByName("Yidflag441");
                if (c[0].checked == true) //浏览
                    zhanneitongji += "1";
                else
                    zhanneitongji += "0";

                zhanneitongji += "0";

                zhanneitongji += "0";

                zhanneitongji += "0";

                var c4 = document.getElementsByName("Yidflag442");
                if (c4[0].checked == true)//导出
                    zhanneitongji += "1|";
                else
                    zhanneitongji += "0|";


                /*方案浏览统计*/
                var d = document.getElementsByName("Yidflag451");
                if (d[0].checked == true) //浏览
                    zhanneitongji += "1";
                else
                    zhanneitongji += "0";

                zhanneitongji += "0";

                zhanneitongji += "0";

                zhanneitongji += "0";

                var d4 = document.getElementsByName("Yidflag452");
                if (d4[0].checked == true)//导出
                    zhanneitongji += "1|";
                else
                    zhanneitongji += "0|";

  

            }
            /*----------------胭脂币管理--------------*/
            function plipinkaguanli() {
                /*胭脂币种类*/
                var a = document.getElementsByName("Yidflag461");
                if (a[0].checked == true) //浏览
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";
                var a1 = document.getElementsByName("Yidflag462");
                if (a1[0].checked == true)//添加
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";
                var a2 = document.getElementsByName("Yidflag463");
                if (a2[0].checked == true)//修改
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";
                var a3 = document.getElementsByName("Yidflag464");
                if (a3[0].checked == true)//删除
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";

                lipinkaguanli += "0|"; //导出


                /*胭脂币管理*/
                var b = document.getElementsByName("Yidflag471");
                if (b[0].checked == true) //浏览
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";
                var b1 = document.getElementsByName("Yidflag472");
                if (b1[0].checked == true)//添加
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";
                var b2 = document.getElementsByName("Yidflag473");
                if (b2[0].checked == true)//修改
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";
                var b3 = document.getElementsByName("Yidflag474");
                if (b3[0].checked == true)//删除
                    lipinkaguanli += "1";
                else
                    lipinkaguanli += "0";

                lipinkaguanli += "0|"; //导出


            }

            /*--------------代金券管理----------------*/
            function pyouhuiquanguanli() {
                /*代金券种类*/
                var a = document.getElementsByName("Yidflag481");
                if (a[0].checked == true) //浏览
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";
                var a1 = document.getElementsByName("Yidflag482");
                if (a1[0].checked == true)//添加
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";
                var a2 = document.getElementsByName("Yidflag483");
                if (a2[0].checked == true)//修改
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";
                var a3 = document.getElementsByName("Yidflag484");
                if (a3[0].checked == true)//删除
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";

                youhuiquanguanli += "0|"; //导出
                /*代金券管理*/
                var b = document.getElementsByName("Yidflag491");
                if (b[0].checked == true) //浏览
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";
                var b1 = document.getElementsByName("Yidflag492");
                if (b1[0].checked == true)//添加
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";
                var b2 = document.getElementsByName("Yidflag493");
                if (b2[0].checked == true)//修改
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";
                var b3 = document.getElementsByName("Yidflag494");
                if (b3[0].checked == true)//删除
                    youhuiquanguanli += "1";
                else
                    youhuiquanguanli += "0";

                youhuiquanguanli += "0|"; //导出


            }

            /*----------------新闻管理------------------*/
            function pxinwenzixunguanli() {
                /*类别管理*/
                var a = document.getElementsByName("Yidflag501");
                if (a[0].checked == true) //浏览
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var a1 = document.getElementsByName("Yidflag502");
                if (a1[0].checked == true)//添加
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var a2 = document.getElementsByName("Yidflag503");
                if (a2[0].checked == true)//修改
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var a3 = document.getElementsByName("Yidflag504");
                if (a3[0].checked == true)//删除
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";

                xinwenzixunguanli += "0|"; //导出

                /*新闻管理*/
                var b = document.getElementsByName("Yidflag511");
                if (b[0].checked == true) //浏览
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var b1 = document.getElementsByName("Yidflag512");
                if (b1[0].checked == true)//添加
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var b2 = document.getElementsByName("Yidflag513");
                if (b2[0].checked == true)//修改
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var b3 = document.getElementsByName("Yidflag514");
                if (b3[0].checked == true)//删除
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";

                xinwenzixunguanli += "0|"; //导出

                /*建议意见管理*/
                var c = document.getElementsByName("Yidflag521");
                if (c[0].checked == true) //浏览
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                
                    xinwenzixunguanli += "0";
                var c2 = document.getElementsByName("Yidflag522");
                if (c2[0].checked == true)//修改
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";
                var c3 = document.getElementsByName("Yidflag523");
                if (c3[0].checked == true)//删除
                    xinwenzixunguanli += "1";
                else
                    xinwenzixunguanli += "0";

                var c4 = document.getElementsByName("Yidflag524");
                if (c4[0].checked == true)//导出
                    xinwenzixunguanli += "1|";
                else
                    xinwenzixunguanli += "0|";

            }

            /*---------------------权限管理---------------------------*/
            function pquanxianguanli() {
                /*管理员管理*/
                var a = document.getElementsByName("Yidflag531");
                if (a[0].checked == true) //浏览
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
                var a1 = document.getElementsByName("Yidflag532");
                if (a1[0].checked == true)//添加
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
                var a2 = document.getElementsByName("Yidflag533");
                if (a2[0].checked == true)//修改
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
                var a3 = document.getElementsByName("Yidflag534");
                if (a3[0].checked == true)//删除
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";

                quanxianguanli += "0|"; //导出

                /*供应商管理*/
                var aa = document.getElementsByName("Yidflag541");
                if (aa[0].checked == true) //浏览
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
                var aa1 = document.getElementsByName("Yidflag542");
                if (aa1[0].checked == true)//添加
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
                var aa2 = document.getElementsByName("Yidflag543");
                if (aa2[0].checked == true)//修改
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
                var aa3 = document.getElementsByName("Yidflag544");
                if (aa3[0].checked == true)//删除
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";

                quanxianguanli += "0|"; //导出

                /*系统日志*/
                var b = document.getElementsByName("Yidflag551");
                if (b[0].checked == true) //浏览
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";
               
                    quanxianguanli += "0";
                
                    quanxianguanli += "0";
                var b3 = document.getElementsByName("Yidflag552");
                if (b3[0].checked == true)//删除
                    quanxianguanli += "1";
                else
                    quanxianguanli += "0";

                var b4 = document.getElementsByName("Yidflag553");
                if (b4[0].checked == true)//导出
                    quanxianguanli += "1|";
                else
                    quanxianguanli += "0|";

            }

            /*-----------设计师管理--------------*/
            function pshejishiguanli() {
                /*设计师管理*/
                var a = document.getElementsByName("Yidflag561");
                if (a[0].checked == true) //浏览
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";
                var a1 = document.getElementsByName("Yidflag562");
                if (a1[0].checked == true)//添加
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";
                var a2 = document.getElementsByName("Yidflag563");
                if (a2[0].checked == true)//修改
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";
                var a3 = document.getElementsByName("Yidflag564");
                if (a3[0].checked == true)//删除
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";

                shejishiguanli += "0|"; //导出

                /*作品管理*/
                var b = document.getElementsByName("Yidflag571");
                if (b[0].checked == true) //浏览
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";
                var b1 = document.getElementsByName("Yidflag572");
                if (b1[0].checked == true)//添加
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";
                var b2 = document.getElementsByName("Yidflag573");
                if (b2[0].checked == true)//修改
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";
                var b3 = document.getElementsByName("Yidflag574");
                if (b3[0].checked == true)//删除
                    shejishiguanli += "1";
                else
                    shejishiguanli += "0";

                shejishiguanli += "0|"; //导出


            }
            /*------------------实体店管理---------------*/

            function pshitidianguanli() {
                /*城市管理*/
                var a = document.getElementsByName("Yidflag581");
                if (a[0].checked == true) //浏览
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";
                var a1 = document.getElementsByName("Yidflag582");
                if (a1[0].checked == true)//添加
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";
                var a2 = document.getElementsByName("Yidflag583");
                if (a2[0].checked == true)//修改
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";
                var a3 = document.getElementsByName("Yidflag584");
                if (a3[0].checked == true)//删除
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";

                shitidianguanli += "0|"; //导出

                /*实体店管理*/
                var b = document.getElementsByName("Yidflag591");
                if (b[0].checked == true) //浏览
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";
                var b1 = document.getElementsByName("Yidflag592");
                if (b1[0].checked == true)//添加
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";
                var b2 = document.getElementsByName("Yidflag593");
                if (b2[0].checked == true)//修改
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";
                var b3 = document.getElementsByName("Yidflag594");
                if (b3[0].checked == true)//删除
                    shitidianguanli += "1";
                else
                    shitidianguanli += "0";

                shitidianguanli += "0|"; //导出

            }

            /*-------------系统设置-----------*/
            function pxitongshezhi() {
                /*商城设置*/
                var a = document.getElementsByName("Yidflag601");
                if (a[0].checked == true) //浏览
                    xitongshezhi += "1";
                else
                    xitongshezhi += "0";
               
                    xitongshezhi += "0";
                var a2 = document.getElementsByName("Yidflag602");
                if (a2[0].checked == true)//修改
                    xitongshezhi += "1";
                else
                    xitongshezhi += "0";
               
                    xitongshezhi += "0";

                    xitongshezhi += "0|"; //导出

                    /*会员注册协议*/
                    var b = document.getElementsByName("Yidflag611");
                    if (b[0].checked == true) //浏览
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";
                    var b2 = document.getElementsByName("Yidflag612");
                    if (b2[0].checked == true)//修改
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";

                    xitongshezhi += "0|"; //导出

                    /*在线支付*/
                    var c = document.getElementsByName("Yidflag621");
                    if (c[0].checked == true) //浏览
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";
                    var c2 = document.getElementsByName("Yidflag622");
                    if (c2[0].checked == true)//修改
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";

                    xitongshezhi += "0|"; //导出

                    /*关于我们设置*/
                    var d = document.getElementsByName("Yidflag631");
                    if (d[0].checked == true) //浏览
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";
                    var d2 = document.getElementsByName("Yidflag632");
                    if (d2[0].checked == true)//修改
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";

                    xitongshezhi += "0|"; //导出

                    /*商品展示页设置*/
                    var e = document.getElementsByName("Yidflag641");
                    if (e[0].checked == true) //浏览
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";
                    var e2 = document.getElementsByName("Yidflag642");
                    if (e2[0].checked == true)//修改
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0";

                    xitongshezhi += "0|"; //导出

                    /*友情链接管理*/
                    var f = document.getElementsByName("Yidflag651");
                    if (f[0].checked == true) //浏览
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";
                    var f1 = document.getElementsByName("Yidflag652");
                    if (f1[0].checked == true)//添加
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";
                    var f2 = document.getElementsByName("Yidflag653");
                    if (f2[0].checked == true)//修改
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";
                    var f3 = document.getElementsByName("Yidflag654");
                    if (f3[0].checked == true)//删除
                        xitongshezhi += "1";
                    else
                        xitongshezhi += "0";

                    xitongshezhi += "0|"; //导出

                }

                /*省市地区管理*/
                function pshengshidiquguanli() {
                    /*省份管理*/
                    var a = document.getElementsByName("Yidflag661");
                    if (a[0].checked == true) //浏览
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var a1 = document.getElementsByName("Yidflag662");
                    if (a1[0].checked == true)//添加
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var a2 = document.getElementsByName("Yidflag663");
                    if (a2[0].checked == true)//修改
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var a3 = document.getElementsByName("Yidflag664");
                    if (a3[0].checked == true)//删除
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";

                    shengshidiquguanli += "0|"; //导出

                    /*城市管理*/
                    var b = document.getElementsByName("Yidflag671");
                    if (b[0].checked == true) //浏览
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var b1 = document.getElementsByName("Yidflag672");
                    if (b1[0].checked == true)//添加
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var b2 = document.getElementsByName("Yidflag673");
                    if (b2[0].checked == true)//修改
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var b3 = document.getElementsByName("Yidflag674");
                    if (b3[0].checked == true)//删除
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";

                    shengshidiquguanli += "0|"; //导出

                    /*地区管理*/
                    var c = document.getElementsByName("Yidflag681");
                    if (c[0].checked == true) //浏览
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var c1 = document.getElementsByName("Yidflag682");
                    if (c1[0].checked == true)//添加
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var c2 = document.getElementsByName("Yidflag683");
                    if (c2[0].checked == true)//修改
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";
                    var c3 = document.getElementsByName("Yidflag684");
                    if (c3[0].checked == true)//删除
                        shengshidiquguanli += "1";
                    else
                        shengshidiquguanli += "0";

                    shengshidiquguanli += "0|"; //导出

                }

                /*数据库管理*/
                function pshujukuguanli() {
                    /*数据库备份*/
                    var a = document.getElementsByName("Yidflag691");
                    if (a[0].checked == true) //浏览
                        shujukuguanli += "1";
                    else
                        shujukuguanli += "0";
                    var a1 = document.getElementsByName("Yidflag692");
                    if (a1[0].checked == true)//添加
                        shujukuguanli += "1";
                    else
                        shujukuguanli += "0";
                   
                        shujukuguanli += "0";
                  
                        shujukuguanli += "0";

                    shujukuguanli += "0|"; //导出
                }

                /*短信管理*/
                function pduanxinguanli() {
                    var a = document.getElementsByName("Yidflag701");
                    if (a[0].checked == true) //浏览
                        duanxinguanli += "1";
                    else
                        duanxinguanli += "0";
                   
                        duanxinguanli += "0";
                    var a2 = document.getElementsByName("Yidflag702");
                    if (a2[0].checked == true)//修改
                        duanxinguanli += "1";
                    else
                        duanxinguanli += "0";
                    var a3 = document.getElementsByName("Yidflag703");
                    if (a3[0].checked == true)//删除
                        duanxinguanli += "1";
                    else
                        duanxinguanli += "0";

                    duanxinguanli += "0|"; //导出
                }
                /*邮件管理*/
                function pyoujianguanli() {
                    var a = document.getElementsByName("Yidflag711");
                    if (a[0].checked == true) //浏览
                        youjianguanli += "1";
                    else
                        youjianguanli += "0";
                   
                        youjianguanli += "0";
                    var a2 = document.getElementsByName("Yidflag712");
                    if (a2[0].checked == true)//修改
                        youjianguanli += "1";
                    else
                        youjianguanli += "0";
                    var a3 = document.getElementsByName("Yidflag713");
                    if (a3[0].checked == true)//删除
                        youjianguanli += "1";
                    else
                        youjianguanli += "0";

                    youjianguanli += "0|"; //导出
                }
                /*帮助中心管理*/
                function pbangzhuzhongxinguanli() {
                    /*类别管理*/
                    var a = document.getElementsByName("Yidflag721");
                    if (a[0].checked == true) //浏览
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";
                    var a1 = document.getElementsByName("Yidflag722");
                    if (a1[0].checked == true)//添加
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";
                    var a2 = document.getElementsByName("Yidflag723");
                    if (a2[0].checked == true)//修改
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";
                    var a3 = document.getElementsByName("Yidflag724");
                    if (a3[0].checked == true)//删除
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";

                    bangzhuzhongxinguanli += "0|"; //导出

                    /*信息列表管理*/
                    var b = document.getElementsByName("Yidflag731");
                    if (b[0].checked == true) //浏览
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";
                    var b1 = document.getElementsByName("Yidflag732");
                    if (b1[0].checked == true)//添加
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";
                    var b2 = document.getElementsByName("Yidflag733");
                    if (b2[0].checked == true)//修改
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";
                    var b3 = document.getElementsByName("Yidflag734");
                    if (b3[0].checked == true)//删除
                        bangzhuzhongxinguanli += "1";
                    else
                        bangzhuzhongxinguanli += "0";

                    bangzhuzhongxinguanli += "0"; //导出
                }



                /*页面执行方法*/
                function pmain() {
                    var flag = "";
                    pchanpinguanli();
                    pdanpindingdanguanli();
                    pjiejuefanganguanli();
                    pchenggonganliguanli();
                    pyuyuedingdanguanli();
                    pxiaoshoutongjiguanli();
                    phuiyuanguanli();
                    ploupanyuhuxingguanli();
                    pcuxiaoguanli();
                    pguanggaoguanli();
                    pzhanneitongji();
                    plipinkaguanli();
                    pyouhuiquanguanli();
                    pxinwenzixunguanli();
                    pquanxianguanli();
                    pshejishiguanli();
                    pshitidianguanli();
                    pxitongshezhi();
                    pshengshidiquguanli();
                    pshujukuguanli();
                    pduanxinguanli();
                    pyoujianguanli();
                    pbangzhuzhongxinguanli();

                    flag = chanpinguanli + danpindingdanguanli + jiejuefanganguanli + chenggonganliguanli + yuyuedingdanguanli + xiaoshoutongjiguanli +
                    huiyuanguanli + loupanyuhuxingguanli + cuxiaoguanli + guanggaoguanli + zhanneitongji + lipinkaguanli + youhuiquanguanli + xinwenzixunguanli +
                    quanxianguanli + shejishiguanli + shitidianguanli + xitongshezhi + shengshidiquguanli + shujukuguanli + duanxinguanli + youjianguanli + bangzhuzhongxinguanli;

                    document.getElementById("flag").value = flag;            
                }



                /*绑定*/
                function bindflag(list) {
                    var l = list.split('|');
                    if (l.length > 2) {
                   
                    if (l[0][0] == "1")
                        document.getElementsByName("Yidflag11")[0].checked = true;
                    if (l[0][1] == "1")
                        document.getElementsByName("Yidflag12")[0].checked = true;
                    if (l[0][2] == "1")
                        document.getElementsByName("Yidflag13")[0].checked = true;
                    if (l[0][3] == "1")
                        document.getElementsByName("Yidflag14")[0].checked = true;


                     if(l[0][0] == "1"&&l[0][1] == "1"&&l[0][2] == "1"&&l[0][3] == "1")
                     document.getElementsByName("flag1")[0].checked=true;
                     
                    /*品牌管理*/
                    if (l[1][0] == "1")
                        document.getElementsByName("Yidflag21")[0].checked = true;
                    if (l[1][1] == "1")
                        document.getElementsByName("Yidflag22")[0].checked = true;
                    if (l[1][2] == "1")
                        document.getElementsByName("Yidflag23")[0].checked = true;
                    if (l[1][3] == "1")
                        document.getElementsByName("Yidflag24")[0].checked = true;


                     if(l[1][0] == "1"&&l[1][1] == "1"&&l[1][2] == "1"&&l[1][3] == "1")
                     document.getElementsByName("flag2")[0].checked=true;
                     
                    
                    if (l[2][0] == "1")
                        document.getElementsByName("Yidflag31")[0].checked = true;
                    if (l[2][1] == "1")
                        document.getElementsByName("Yidflag32")[0].checked = true;
                    if (l[2][2] == "1")
                        document.getElementsByName("Yidflag33")[0].checked = true;
                    if (l[2][3] == "1")
                        document.getElementsByName("Yidflag34")[0].checked = true;


                     if(l[2][0] == "1"&&l[2][1] == "1"&&l[2][2] == "1"&&l[2][3] == "1")
                     document.getElementsByName("flag3")[0].checked=true;
                     

                    if (l[3][0] == "1")
                        document.getElementsByName("Yidflag41")[0].checked = true;
                    if (l[3][3] == "1")
                        document.getElementsByName("Yidflag42")[0].checked = true;

                     if(l[3][0] == "1"&&l[3][3] == "1")
                     document.getElementsByName("flag4")[0].checked=true;
                     

                    if (l[4][0] == "1")
                        document.getElementsByName("Yidflag51")[0].checked = true;

                    if (l[4][2] == "1")
                        document.getElementsByName("Yidflag52")[0].checked = true;
                    if (l[4][3] == "1")
                        document.getElementsByName("Yidflag53")[0].checked = true;


                     if(l[4][0] == "1"&&l[4][2] == "1"&&l[4][3] == "1")
                     document.getElementsByName("flag5")[0].checked=true;
                     
                    if (l[5][0] == "1")
                        document.getElementsByName("Yidflag61")[0].checked = true;
                    if (l[5][2] == "1")
                        document.getElementsByName("Yidflag62")[0].checked = true;


                     if(l[5][0] == "1"&&l[5][2] == "1")
                     document.getElementsByName("flag6")[0].checked=true;
                     
                    if (l[6][0] == "1")
                        document.getElementsByName("Yidflag71")[0].checked = true;
                    if (l[6][2] == "1")
                        document.getElementsByName("Yidflag72")[0].checked = true;

                     if(l[6][0] == "1"&&l[6][2] == "1")
                     document.getElementsByName("flag7")[0].checked=true;
                     
                    /*商品订单管理  	 */
                    if (l[7][1] == "1")
                    {
                        document.getElementsByName("Yidflag81")[0].checked = true;
                         document.getElementsByName("flag8")[0].checked=true;
                        }

   
                    if (l[8][0] == "1")
                        document.getElementsByName("Yidflag91")[0].checked = true;
                    if (l[8][2] == "1")
                        document.getElementsByName("Yidflag92")[0].checked = true;
                    if (l[8][3] == "1")
                        document.getElementsByName("Yidflag93")[0].checked = true;
                    if (l[8][4] == "1")
                        document.getElementsByName("Yidflag94")[0].checked = true;

                     if(l[8][0] == "1"&&l[8][2] == "1"&&l[8][3] == "1"&&l[8][4] == "1")
                     document.getElementsByName("flag9")[0].checked=true;

                    if (l[9][0] == "1")
                        document.getElementsByName("Yidflag101")[0].checked = true;
                    if (l[9][2] == "1")
                        document.getElementsByName("Yidflag102")[0].checked = true;
                    if (l[9][3] == "1")
                        document.getElementsByName("Yidflag103")[0].checked = true;
                    if (l[9][4] == "1")
                        document.getElementsByName("Yidflag104")[0].checked = true;

 if(l[9][0] == "1"&&l[9][2] == "1"&&l[9][3] == "1"&&l[9][4] == "1")
                     document.getElementsByName("flag10")[0].checked=true;

                    if (l[10][0] == "1")
                        document.getElementsByName("Yidflag111")[0].checked = true;
                    if (l[10][2] == "1")
                        document.getElementsByName("Yidflag112")[0].checked = true;
                    if (l[10][3] == "1")
                        document.getElementsByName("Yidflag113")[0].checked = true;
                    if (l[10][4] == "1")
                        document.getElementsByName("Yidflag114")[0].checked = true;
                        
 if(l[10][0] == "1"&&l[10][2] == "1"&&l[10][3] == "1"&&l[10][4] == "1")
                     document.getElementsByName("flag11")[0].checked=true;

                    if (l[11][0] == "1")
                        document.getElementsByName("Yidflag121")[0].checked = true;
                    if (l[11][2] == "1")
                        document.getElementsByName("Yidflag122")[0].checked = true;
                    if (l[11][3] == "1")
                        document.getElementsByName("Yidflag123")[0].checked = true;
                    if (l[11][4] == "1")
                        document.getElementsByName("Yidflag124")[0].checked = true;

 if(l[11][0] == "1"&&l[11][2] == "1"&&l[11][3] == "1"&&l[11][4] == "1")
                     document.getElementsByName("flag12")[0].checked=true;

                    if (l[12][0] == "1")
                        document.getElementsByName("Yidflag131")[0].checked = true;
                    if (l[12][2] == "1")
                        document.getElementsByName("Yidflag132")[0].checked = true;
                    if (l[12][3] == "1")
                        document.getElementsByName("Yidflag133")[0].checked = true;
                    if (l[12][4] == "1")
                        document.getElementsByName("Yidflag134")[0].checked = true;

 if(l[12][0] == "1"&&l[12][2] == "1"&&l[12][3] == "1"&&l[12][4] == "1")
                     document.getElementsByName("flag13")[0].checked=true;
                     
                    if (l[13][0] == "1")
                        document.getElementsByName("Yidflag141")[0].checked = true;
                    if (l[13][2] == "1")
                        document.getElementsByName("Yidflag142")[0].checked = true;
                    if (l[13][3] == "1")
                        document.getElementsByName("Yidflag143")[0].checked = true;
                    if (l[13][4] == "1")
                        document.getElementsByName("Yidflag144")[0].checked = true;

 if(l[13][0] == "1"&&l[13][2] == "1"&&l[13][3] == "1"&&l[13][4] == "1")
                     document.getElementsByName("flag14")[0].checked=true;

                    if (l[14][0] == "1")
                        document.getElementsByName("Yidflag151")[0].checked = true;
                    if (l[14][2] == "1")
                        document.getElementsByName("Yidflag152")[0].checked = true;
                    if (l[14][3] == "1")
                        document.getElementsByName("Yidflag153")[0].checked = true;
                    if (l[14][4] == "1")
                        document.getElementsByName("Yidflag154")[0].checked = true;

 if(l[14][0] == "1"&&l[14][2] == "1"&&l[14][3] == "1"&&l[14][4] == "1")
                     document.getElementsByName("flag15")[0].checked=true;
                     
                    if (l[15][0] == "1")
                        document.getElementsByName("Yidflag161")[0].checked = true;
                    if (l[15][2] == "1")
                        document.getElementsByName("Yidflag162")[0].checked = true;
                    if (l[15][3] == "1")
                        document.getElementsByName("Yidflag163")[0].checked = true;
                    if (l[15][4] == "1")
                        document.getElementsByName("Yidflag164")[0].checked = true;

 if(l[15][0] == "1"&&l[15][2] == "1"&&l[15][3] == "1"&&l[15][4] == "1")
                     document.getElementsByName("flag16")[0].checked=true;
                     
                    if (l[16][0] == "1")
                        document.getElementsByName("Yidflag171")[0].checked = true;
                    if (l[16][2] == "1")
                        document.getElementsByName("Yidflag172")[0].checked = true;
                    if (l[16][3] == "1")
                        document.getElementsByName("Yidflag173")[0].checked = true;
                    if (l[16][4] == "1")
                        document.getElementsByName("Yidflag174")[0].checked = true;

 if(l[16][0] == "1"&&l[16][2] == "1"&&l[16][3] == "1"&&l[16][4] == "1")
                     document.getElementsByName("flag17")[0].checked=true;
                     
                    /*解决方案管理*/
                    if (l[17][0] == "1")
                        document.getElementsByName("Yidflag181")[0].checked = true;
                    if (l[17][1] == "1")
                        document.getElementsByName("Yidflag182")[0].checked = true;
                    if (l[17][2] == "1")
                        document.getElementsByName("Yidflag183")[0].checked = true;
                    if (l[17][3] == "1")
                        document.getElementsByName("Yidflag184")[0].checked = true;

 if(l[17][0] == "1"&&l[17][1] == "1"&&l[17][2] == "1"&&l[17][3] == "1")
                     document.getElementsByName("flag18")[0].checked=true;

                    if (l[18][0] == "1")
                        document.getElementsByName("Yidflag191")[0].checked = true;
                    if (l[18][1] == "1")
                        document.getElementsByName("Yidflag192")[0].checked = true;
                    if (l[18][2] == "1")
                        document.getElementsByName("Yidflag193")[0].checked = true;
                    if (l[18][3] == "1")
                        document.getElementsByName("Yidflag194")[0].checked = true;

 if(l[18][0] == "1"&&l[18][1] == "1"&&l[18][2] == "1"&&l[18][3] == "1")
                     document.getElementsByName("flag19")[0].checked=true;

                    if (l[19][0] == "1")
                        document.getElementsByName("Yidflag201")[0].checked = true;
                    if (l[19][1] == "1")
                        document.getElementsByName("Yidflag202")[0].checked = true;
                    if (l[19][2] == "1")
                        document.getElementsByName("Yidflag203")[0].checked = true;
                    if (l[19][3] == "1")
                        document.getElementsByName("Yidflag204")[0].checked = true;


 if(l[19][0] == "1"&&l[19][1] == "1"&&l[19][2] == "1"&&l[19][3] == "1")
                     document.getElementsByName("flag20")[0].checked=true;
                     
                    if (l[20][0] == "1")
                        document.getElementsByName("Yidflag211")[0].checked = true;
                    if (l[20][1] == "1")
                        document.getElementsByName("Yidflag212")[0].checked = true;
                    if (l[20][2] == "1")
                        document.getElementsByName("Yidflag213")[0].checked = true;
                    if (l[20][3] == "1")
                        document.getElementsByName("Yidflag214")[0].checked = true;

 if(l[20][0] == "1"&&l[20][1] == "1"&&l[20][2] == "1"&&l[20][3] == "1")
                     document.getElementsByName("flag21")[0].checked=true;

                    if (l[21][0] == "1")
                        document.getElementsByName("Yidflag221")[0].checked = true;
                    if (l[21][1] == "1")
                        document.getElementsByName("Yidflag222")[0].checked = true;
                    if (l[21][2] == "1")
                        document.getElementsByName("Yidflag223")[0].checked = true;
                    if (l[21][3] == "1")
                        document.getElementsByName("Yidflag224")[0].checked = true;

 if(l[21][0] == "1"&&l[21][1] == "1"&&l[21][2] == "1"&&l[21][3] == "1")
                     document.getElementsByName("flag22")[0].checked=true;

                    if (l[22][0] == "1")
                        document.getElementsByName("Yidflag231")[0].checked = true;
                    if (l[22][1] == "1")
                        document.getElementsByName("Yidflag232")[0].checked = true;
                    if (l[22][2] == "1")
                        document.getElementsByName("Yidflag233")[0].checked = true;
                    if (l[22][3] == "1")
                        document.getElementsByName("Yidflag234")[0].checked = true;


 if(l[22][0] == "1"&&l[22][1] == "1"&&l[22][2] == "1"&&l[22][3] == "1")
                     document.getElementsByName("flag23")[0].checked=true;
                     
                    if (l[23][0] == "1")
                        document.getElementsByName("Yidflag741")[0].checked = true;
                   
                    if (l[23][2] == "1")
                        document.getElementsByName("Yidflag742")[0].checked = true;
                    if (l[23][3] == "1")
                        document.getElementsByName("Yidflag743")[0].checked = true;



 if(l[23][0] == "1"&&l[23][2] == "1"&&l[23][3] == "1")
                     document.getElementsByName("flag74")[0].checked=true;

                    if (l[24][0] == "1")
                        document.getElementsByName("Yidflag241")[0].checked = true;
                    if (l[24][1] == "1")
                        document.getElementsByName("Yidflag242")[0].checked = true;
                    if (l[24][2] == "1")
                        document.getElementsByName("Yidflag243")[0].checked = true;
                    if (l[24][3] == "1")
                        document.getElementsByName("Yidflag244")[0].checked = true;


 if(l[24][0] == "1"&& l[24][1] == "1"&& l[24][2] == "1"&& l[24][3] == "1")
                     document.getElementsByName("flag24")[0].checked=true;
                    /*预约订单管理*/
                    if (l[25][0] == "1")
                        document.getElementsByName("Yidflag251")[0].checked = true;
                    if (l[25][1] == "1")
                        document.getElementsByName("Yidflag252")[0].checked = true;
                    if (l[25][2] == "1")
                        document.getElementsByName("Yidflag253")[0].checked = true;
                    if (l[25][3] == "1")
                        document.getElementsByName("Yidflag254")[0].checked = true;

 if(l[25][0] == "1"&& l[25][1] == "1"&& l[25][2] == "1"&& l[25][3] == "1")
                     document.getElementsByName("flag25")[0].checked=true;
                     
                    if (l[26][0] == "1")
                        document.getElementsByName("Yidflag261")[0].checked = true;
                    if (l[26][1] == "1")
                        document.getElementsByName("Yidflag262")[0].checked = true;
                    if (l[26][2] == "1")
                        document.getElementsByName("Yidflag263")[0].checked = true;
                    if (l[26][3] == "1")
                        document.getElementsByName("Yidflag264")[0].checked = true;
                        
                         if(l[26][0] == "1"&& l[26][1] == "1"&& l[26][2] == "1"&& l[26][3] == "1")
                     document.getElementsByName("flag26")[0].checked=true;

                    if (l[27][0] == "1")
                        document.getElementsByName("Yidflag271")[0].checked = true;
                    if (l[27][1] == "1")
                        document.getElementsByName("Yidflag272")[0].checked = true;
                    if (l[27][2] == "1")
                        document.getElementsByName("Yidflag273")[0].checked = true;
                    if (l[27][3] == "1")
                        document.getElementsByName("Yidflag274")[0].checked = true;
                        
 if(l[27][0] == "1"&& l[27][1] == "1"&& l[27][2] == "1"&& l[27][3] == "1")
                     document.getElementsByName("flag27")[0].checked=true;

                    if (l[28][0] == "1")
                        document.getElementsByName("Yidflag281")[0].checked = true;
                    if (l[28][1] == "1")
                        document.getElementsByName("Yidflag282")[0].checked = true;
                    if (l[28][2] == "1")
                        document.getElementsByName("Yidflag283")[0].checked = true;
                    if (l[28][3] == "1")
                        document.getElementsByName("Yidflag284")[0].checked = true;

 if(l[28][0] == "1"&& l[28][1] == "1"&& l[28][2] == "1"&& l[28][3] == "1")
                     document.getElementsByName("flag28")[0].checked=true;

                    if (l[29][0] == "1")
                        document.getElementsByName("Yidflag291")[0].checked = true;
                    if (l[29][1] == "1")
                        document.getElementsByName("Yidflag292")[0].checked = true;
                    if (l[29][2] == "1")
                        document.getElementsByName("Yidflag293")[0].checked = true;
                    if (l[29][3] == "1")
                        document.getElementsByName("Yidflag294")[0].checked = true;
                        
                         if(l[29][0] == "1"&& l[29][1] == "1"&& l[29][2] == "1"&& l[29][3] == "1")
                     document.getElementsByName("flag29")[0].checked=true;

                    /*销售统计管理 */

                    if (l[30][0] == "1")
                        document.getElementsByName("Yidflag301")[0].checked = true;
                    if (l[30][4] == "1")
                        document.getElementsByName("Yidflag302")[0].checked = true;

                     if(l[30][0] == "1"&&l[30][4] == "1")
                     document.getElementsByName("flag30")[0].checked=true;

                    if (l[31][0] == "1")
                        document.getElementsByName("Yidflag311")[0].checked = true;
                    if (l[31][4] == "1")
                        document.getElementsByName("Yidflag312")[0].checked = true;
                        
                     if(l[31][0] == "1"&&l[31][4] == "1")
                     document.getElementsByName("flag31")[0].checked=true;

                    if (l[32][0] == "1")
                        document.getElementsByName("Yidflag321")[0].checked = true;
                    if (l[32][4] == "1")
                        document.getElementsByName("Yidflag322")[0].checked = true;
                        
                     if(l[32][0] == "1"&&l[32][4] == "1")
                     document.getElementsByName("flag32")[0].checked=true;


                    if (l[33][0] == "1")
                        document.getElementsByName("Yidflag331")[0].checked = true;
                    if (l[33][4] == "1")
                        document.getElementsByName("Yidflag332")[0].checked = true;
                        
                        
                     if(l[33][0] == "1"&&l[33][4] == "1")
                     document.getElementsByName("flag33")[0].checked=true;


                    /*会员管理*/


                    if (l[34][0] == "1")
                        document.getElementsByName("Yidflag341")[0].checked = true;
                    if (l[34][1] == "1")
                        document.getElementsByName("Yidflag342")[0].checked = true;
                    if (l[34][2] == "1")
                        document.getElementsByName("Yidflag343")[0].checked = true;
                    if (l[34][3] == "1")
                        document.getElementsByName("Yidflag344")[0].checked = true;

                     if(l[34][0] == "1"&& l[34][1] == "1"&& l[34][2] == "1"&& l[34][3] == "1")
                     document.getElementsByName("flag34")[0].checked=true;


                    if (l[35][0] == "1")
                        document.getElementsByName("Yidflag351")[0].checked = true;
                  
                    if (l[35][3] == "1")
                        document.getElementsByName("Yidflag352")[0].checked = true;
                        
                        
                     if(l[35][0] == "1"&&l[35][3] == "1")
                     document.getElementsByName("flag35")[0].checked=true;

                    /*楼盘与户型管理*/
                    if (l[36][0] == "1")
                        document.getElementsByName("Yidflag361")[0].checked = true;
                    if (l[36][1] == "1")
                        document.getElementsByName("Yidflag362")[0].checked = true;
                    if (l[36][2] == "1")
                        document.getElementsByName("Yidflag363")[0].checked = true;
                    if (l[36][3] == "1")
                        document.getElementsByName("Yidflag364")[0].checked = true;
                        
                        
                     if(l[36][0] == "1"&& l[36][1] == "1"&& l[36][2] == "1"&& l[36][3] == "1")
                     document.getElementsByName("flag36")[0].checked=true;

                    if (l[37][0] == "1")
                        document.getElementsByName("Yidflag371")[0].checked = true;
                    if (l[37][1] == "1")
                        document.getElementsByName("Yidflag372")[0].checked = true;
                    if (l[37][2] == "1")
                        document.getElementsByName("Yidflag373")[0].checked = true;
                    if (l[37][3] == "1")
                        document.getElementsByName("Yidflag374")[0].checked = true;

                     if(l[37][0] == "1"&& l[37][1] == "1"&& l[37][2] == "1"&& l[37][3] == "1")
                     document.getElementsByName("flag37")[0].checked=true;
                    //促销管理

                    if (l[38][0] == "1")
                        document.getElementsByName("Yidflag381")[0].checked = true;

                    if (l[38][2] == "1")
                        document.getElementsByName("Yidflag382")[0].checked = true;
                        
                        
                     if(l[38][0] == "1"&&l[38][2] == "1")
                     document.getElementsByName("flag38")[0].checked=true;
                     
                    //广告管理
                    if (l[39][0] == "1")
                        document.getElementsByName("Yidflag391")[0].checked = true;
                    if (l[39][1] == "1")
                        document.getElementsByName("Yidflag392")[0].checked = true;
                    if (l[39][2] == "1")
                        document.getElementsByName("Yidflag393")[0].checked = true;
                    if (l[39][3] == "1")
                        document.getElementsByName("Yidflag394")[0].checked = true;

                     if(l[39][0] == "1"&& l[39][1] == "1"&& l[39][2] == "1"&& l[39][3] == "1")
                     document.getElementsByName("flag39")[0].checked=true;

                    if (l[40][0] == "1")
                        document.getElementsByName("Yidflag401")[0].checked = true;
                    if (l[40][1] == "1")
                        document.getElementsByName("Yidflag402")[0].checked = true;
                    if (l[40][2] == "1")
                        document.getElementsByName("Yidflag403")[0].checked = true;
                    if (l[40][3] == "1")
                        document.getElementsByName("Yidflag404")[0].checked = true;
                        
                     if(l[40][0] == "1"&& l[40][1] == "1"&& l[40][2] == "1"&& l[40][3] == "1")
                     document.getElementsByName("flag40")[0].checked=true;

                    if (l[41][0] == "1")
                        document.getElementsByName("Yidflag411")[0].checked = true;
                    if (l[41][1] == "1")
                        document.getElementsByName("Yidflag412")[0].checked = true;
                    if (l[41][2] == "1")
                        document.getElementsByName("Yidflag413")[0].checked = true;
                    if (l[41][3] == "1")
                        document.getElementsByName("Yidflag414")[0].checked = true;

                     if(l[41][0] == "1"&& l[41][1] == "1"&& l[41][2] == "1"&& l[41][3] == "1")
                     document.getElementsByName("flag41")[0].checked=true;

                    //站内统计
                    if (l[42][0] == "1")
                        document.getElementsByName("Yidflag421")[0].checked = true;
                    if (l[42][3] == "1")
                        document.getElementsByName("Yidflag422")[0].checked = true;
                    if (l[42][4] == "1")
                        document.getElementsByName("Yidflag423")[0].checked = true;

                     if(l[42][0] == "1"&& l[42][3] == "1"&& l[42][4] == "1")
                     document.getElementsByName("flag42")[0].checked=true;
                     
                     
                     
                    if (l[43][0] == "1")
                        document.getElementsByName("Yidflag431")[0].checked = true;
                    if (l[43][4] == "1")
                        document.getElementsByName("Yidflag432")[0].checked = true;

                     if(l[43][0] == "1"&& l[43][4] == "1")
                     document.getElementsByName("flag43")[0].checked=true;

                    if (l[44][0] == "1")
                        document.getElementsByName("Yidflag441")[0].checked = true;
                    if (l[44][4] == "1")
                        document.getElementsByName("Yidflag442")[0].checked = true;

                     if(l[44][0] == "1"&& l[44][4] == "1")
                     document.getElementsByName("flag44")[0].checked=true;

                    if (l[45][0] == "1")
                        document.getElementsByName("Yidflag451")[0].checked = true;
                    if (l[45][4] == "1")
                        document.getElementsByName("Yidflag452")[0].checked = true;
                        
                     if(l[45][0] == "1"&& l[45][4] == "1")
                     document.getElementsByName("flag45")[0].checked=true;

                    //胭脂币管理

                    if (l[46][0] == "1")
                        document.getElementsByName("Yidflag461")[0].checked = true;
                    if (l[46][1] == "1")
                        document.getElementsByName("Yidflag462")[0].checked = true;
                    if (l[46][2] == "1")
                        document.getElementsByName("Yidflag463")[0].checked = true;
                    if (l[46][3] == "1")
                        document.getElementsByName("Yidflag464")[0].checked = true;
                        
                        
                                             if(l[46][0] == "1"&& l[46][1] == "1"&& l[46][2] == "1"&& l[46][3] == "1")
                     document.getElementsByName("flag46")[0].checked=true;

                    if (l[47][0] == "1")
                        document.getElementsByName("Yidflag471")[0].checked = true;
                    if (l[47][1] == "1")
                        document.getElementsByName("Yidflag472")[0].checked = true;
                    if (l[47][2] == "1")
                        document.getElementsByName("Yidflag473")[0].checked = true;
                    if (l[47][3] == "1")
                        document.getElementsByName("Yidflag474")[0].checked = true;
                        
                                             if(l[47][0] == "1"&& l[47][1] == "1"&& l[47][2] == "1"&& l[47][3] == "1")
                     document.getElementsByName("flag47")[0].checked=true;


                    //代金券管理

                    if (l[48][0] == "1")
                        document.getElementsByName("Yidflag481")[0].checked = true;
                    if (l[48][1] == "1")
                        document.getElementsByName("Yidflag482")[0].checked = true;
                    if (l[48][2] == "1")
                        document.getElementsByName("Yidflag483")[0].checked = true;
                    if (l[48][3] == "1")
                        document.getElementsByName("Yidflag484")[0].checked = true;
                        
                        
                                                                     if(l[48][0] == "1"&& l[48][1] == "1"&& l[48][2] == "1"&& l[48][3] == "1")
                     document.getElementsByName("flag48")[0].checked=true;

                    if (l[49][0] == "1")
                        document.getElementsByName("Yidflag491")[0].checked = true;
                    if (l[49][1] == "1")
                        document.getElementsByName("Yidflag492")[0].checked = true;
                    if (l[49][2] == "1")
                        document.getElementsByName("Yidflag493")[0].checked = true;
                    if (l[49][3] == "1")
                        document.getElementsByName("Yidflag494")[0].checked = true;
                        
                                                                     if(l[49][0] == "1"&& l[49][1] == "1"&& l[49][2] == "1"&& l[49][3] == "1")
                     document.getElementsByName("flag49")[0].checked=true;

                    //新闻管理
                    if (l[50][0] == "1")
                        document.getElementsByName("Yidflag501")[0].checked = true;
                    if (l[50][1] == "1")
                        document.getElementsByName("Yidflag502")[0].checked = true;
                    if (l[50][2] == "1")
                        document.getElementsByName("Yidflag503")[0].checked = true;
                    if (l[50][3] == "1")
                        document.getElementsByName("Yidflag504")[0].checked = true;
                        
                    if(l[50][0] == "1"&& l[50][1] == "1"&& l[50][2] == "1"&& l[50][3] == "1")
                     document.getElementsByName("flag50")[0].checked=true;

                    if (l[51][0] == "1")
                        document.getElementsByName("Yidflag511")[0].checked = true;
                    if (l[51][1] == "1")
                        document.getElementsByName("Yidflag512")[0].checked = true;
                    if (l[51][2] == "1")
                        document.getElementsByName("Yidflag513")[0].checked = true;
                    if (l[51][3] == "1")
                        document.getElementsByName("Yidflag514")[0].checked = true;

                     if(l[51][0] == "1"&& l[51][1] == "1"&& l[51][2] == "1"&& l[51][3] == "1")
                     document.getElementsByName("flag51")[0].checked=true;

                    if (l[52][0] == "1")
                        document.getElementsByName("Yidflag521")[0].checked = true;

                    if (l[52][2] == "1")
                        document.getElementsByName("Yidflag522")[0].checked = true;
                    if (l[52][3] == "1")
                        document.getElementsByName("Yidflag523")[0].checked = true;
                    if (l[52][4] == "1")
                        document.getElementsByName("Yidflag524")[0].checked = true;
                        
                     if(l[52][0] == "1"&& l[52][2] == "1"&& l[52][3] == "1"&& l[52][4] == "1")
                     document.getElementsByName("flag52")[0].checked=true;

                    //权限管理

                    if (l[53][0] == "1")
                        document.getElementsByName("Yidflag531")[0].checked = true;
                    if (l[53][1] == "1")
                        document.getElementsByName("Yidflag532")[0].checked = true;
                    if (l[53][2] == "1")
                        document.getElementsByName("Yidflag533")[0].checked = true;
                    if (l[53][3] == "1")
                        document.getElementsByName("Yidflag534")[0].checked = true;
                        
                        
                                               if(l[53][0] == "1"&& l[53][1] == "1"&& l[53][2] == "1"&& l[53][3] == "1")
                     document.getElementsByName("flag53")[0].checked=true;

                    if (l[54][0] == "1")
                        document.getElementsByName("Yidflag541")[0].checked = true;
                    if (l[54][1] == "1")
                        document.getElementsByName("Yidflag542")[0].checked = true;
                    if (l[54][2] == "1")
                        document.getElementsByName("Yidflag543")[0].checked = true;
                    if (l[54][3] == "1")
                        document.getElementsByName("Yidflag544")[0].checked = true;
                        
                        
                                               if(l[54][0] == "1"&& l[54][1] == "1"&& l[54][2] == "1"&& l[54][3] == "1")
                     document.getElementsByName("flag54")[0].checked=true;

                    if (l[55][0] == "1")
                        document.getElementsByName("Yidflag551")[0].checked = true;
                    
                    if (l[55][3] == "1")
                        document.getElementsByName("Yidflag552")[0].checked = true;
                    if (l[55][4] == "1")
                        document.getElementsByName("Yidflag553")[0].checked = true;
                        
                        
                                               if(l[55][0] == "1"&& l[55][3] == "1"&& l[55][4] == "1")
                     document.getElementsByName("flag55")[0].checked=true;


                    //设计师管理

                    if (l[56][0] == "1")
                        document.getElementsByName("Yidflag561")[0].checked = true;
                    if (l[56][1] == "1")
                        document.getElementsByName("Yidflag562")[0].checked = true;
                    if (l[56][2] == "1")
                        document.getElementsByName("Yidflag563")[0].checked = true;
                    if (l[56][3] == "1")
                        document.getElementsByName("Yidflag564")[0].checked = true;

                                               if(l[56][0] == "1"&& l[56][1] == "1"&& l[56][2] == "1"&& l[56][3] == "1")
                     document.getElementsByName("flag56")[0].checked=true;

                    if (l[57][0] == "1")
                        document.getElementsByName("Yidflag571")[0].checked = true;
                    if (l[57][1] == "1")
                        document.getElementsByName("Yidflag572")[0].checked = true;
                    if (l[57][2] == "1")
                        document.getElementsByName("Yidflag573")[0].checked = true;
                    if (l[57][3] == "1")
                        document.getElementsByName("Yidflag574")[0].checked = true;
                        
                                                                       if(l[57][0] == "1"&& l[57][1] == "1"&& l[57][2] == "1"&& l[57][3] == "1")
                     document.getElementsByName("flag57")[0].checked=true;

                    //实体店管理

                    if (l[58][0] == "1")
                        document.getElementsByName("Yidflag581")[0].checked = true;
                    if (l[58][1] == "1")
                        document.getElementsByName("Yidflag582")[0].checked = true;
                    if (l[58][2] == "1")
                        document.getElementsByName("Yidflag583")[0].checked = true;
                    if (l[58][3] == "1")
                        document.getElementsByName("Yidflag584")[0].checked = true;


                                                                       if(l[58][0] == "1"&& l[58][1] == "1"&& l[58][2] == "1"&& l[58][3] == "1")
                     document.getElementsByName("flag58")[0].checked=true;
                     
                    if (l[59][0] == "1")
                        document.getElementsByName("Yidflag591")[0].checked = true;
                    if (l[59][1] == "1")
                        document.getElementsByName("Yidflag592")[0].checked = true;
                    if (l[59][2] == "1")
                        document.getElementsByName("Yidflag593")[0].checked = true;
                    if (l[59][3] == "1")
                        document.getElementsByName("Yidflag594")[0].checked = true;
                        
                        
                      if(l[59][0] == "1"&& l[59][1] == "1"&& l[59][2] == "1"&& l[59][3] == "1")
                     document.getElementsByName("flag59")[0].checked=true;

                    //系统设置
                    if (l[60][0] == "1")
                        document.getElementsByName("Yidflag601")[0].checked = true;
                    if (l[60][2] == "1")
                        document.getElementsByName("Yidflag602")[0].checked = true;
                        
                        
                        if(l[60][0] == "1"&&l[60][2] == "1")
                        document.getElementsByName("flag60")[0].checked=true;

                    if (l[61][0] == "1")
                        document.getElementsByName("Yidflag611")[0].checked = true;
                    if (l[61][2] == "1")
                        document.getElementsByName("Yidflag612")[0].checked = true;
                        
                          if(l[61][0] == "1"&&l[61][2] == "1")
                        document.getElementsByName("flag61")[0].checked=true;

                    if (l[62][0] == "1")
                        document.getElementsByName("Yidflag621")[0].checked = true;
                    if (l[62][2] == "1")
                        document.getElementsByName("Yidflag622")[0].checked = true;
                        
                        
                          if(l[62][0] == "1"&&l[62][2] == "1")
                        document.getElementsByName("flag62")[0].checked=true;


                    if (l[63][0] == "1")
                        document.getElementsByName("Yidflag631")[0].checked = true;
                    if (l[63][2] == "1")
                        document.getElementsByName("Yidflag632")[0].checked = true;
                        
                          if(l[63][0] == "1"&&l[63][2] == "1")
                        document.getElementsByName("flag63")[0].checked=true;


                    if (l[64][0] == "1")
                        document.getElementsByName("Yidflag641")[0].checked = true;
                    if (l[64][2] == "1")
                        document.getElementsByName("Yidflag642")[0].checked = true;
                        
                          if(l[64][0] == "1"&&l[64][2] == "1")
                        document.getElementsByName("flag64")[0].checked=true;

                    if (l[65][0] == "1")
                        document.getElementsByName("Yidflag651")[0].checked = true;
                    if (l[65][1] == "1")
                        document.getElementsByName("Yidflag652")[0].checked = true;
                    if (l[65][2] == "1")
                        document.getElementsByName("Yidflag653")[0].checked = true;
                    if (l[65][3] == "1")
                        document.getElementsByName("Yidflag654")[0].checked = true;
                        
                                              if(l[65][0] == "1"&& l[65][1] == "1"&& l[65][2] == "1"&& l[65][3] == "1")
                     document.getElementsByName("flag65")[0].checked=true;

                    //省市地区管理
                    if (l[66][0] == "1")
                        document.getElementsByName("Yidflag661")[0].checked = true;
                    if (l[66][1] == "1")
                        document.getElementsByName("Yidflag662")[0].checked = true;
                    if (l[66][2] == "1")
                        document.getElementsByName("Yidflag663")[0].checked = true;
                    if (l[66][3] == "1")
                        document.getElementsByName("Yidflag664")[0].checked = true;
                        
                        
                                                                      if(l[66][0] == "1"&& l[66][1] == "1"&& l[66][2] == "1"&& l[66][3] == "1")
                     document.getElementsByName("flag66")[0].checked=true;

                    if (l[67][0] == "1")
                        document.getElementsByName("Yidflag671")[0].checked = true;
                    if (l[67][1] == "1")
                        document.getElementsByName("Yidflag672")[0].checked = true;
                    if (l[67][2] == "1")
                        document.getElementsByName("Yidflag673")[0].checked = true;
                    if (l[67][3] == "1")
                        document.getElementsByName("Yidflag674")[0].checked = true;
                        
                        
                                                                      if(l[67][0] == "1"&& l[67][1] == "1"&& l[67][2] == "1"&& l[67][3] == "1")
                     document.getElementsByName("flag67")[0].checked=true;


                    if (l[68][0] == "1")
                        document.getElementsByName("Yidflag681")[0].checked = true;
                    if (l[68][1] == "1")
                        document.getElementsByName("Yidflag682")[0].checked = true;
                    if (l[68][2] == "1")
                        document.getElementsByName("Yidflag683")[0].checked = true;
                    if (l[68][3] == "1")
                        document.getElementsByName("Yidflag684")[0].checked = true;
                        
                        
                                                                      if(l[68][0] == "1"&& l[68][1] == "1"&& l[68][2] == "1"&& l[68][3] == "1")
                     document.getElementsByName("flag68")[0].checked=true;

                    //数据库管理
                    if (l[69][0] == "1")
                        document.getElementsByName("Yidflag691")[0].checked = true;
                    if (l[69][1] == "1")
                        document.getElementsByName("Yidflag692")[0].checked = true;
                        
                        if(l[69][0] == "1"&&l[69][1] == "1")
                        document.getElementsByName("flag69")[0].checked=true;
                    //短信管理
                    if (l[70][0] == "1")
                        document.getElementsByName("Yidflag701")[0].checked = true;
                    if (l[70][2] == "1")
                        document.getElementsByName("Yidflag702")[0].checked = true;
                    if (l[70][3] == "1")
                        document.getElementsByName("Yidflag703")[0].checked = true;

 if(l[70][0] == "1"&&l[70][2] == "1"&&l[70][3] == "1")
                        document.getElementsByName("flag70")[0].checked=true;
                    //邮件管理

                    if (l[71][0] == "1")
                        document.getElementsByName("Yidflag711")[0].checked = true;
                    if (l[71][2] == "1")
                        document.getElementsByName("Yidflag712")[0].checked = true;
                    if (l[71][3] == "1")
                        document.getElementsByName("Yidflag713")[0].checked = true;

 if(l[71][0] == "1"&&l[71][2] == "1"&&l[71][3] == "1")
                        document.getElementsByName("flag71")[0].checked=true;
                    //帮助中心管理
                    if (l[72][0] == "1")
                        document.getElementsByName("Yidflag721")[0].checked = true;
                    if (l[72][1] == "1")
                        document.getElementsByName("Yidflag722")[0].checked = true;
                    if (l[72][2] == "1")
                        document.getElementsByName("Yidflag723")[0].checked = true;
                    if (l[72][3] == "1")
                        document.getElementsByName("Yidflag724")[0].checked = true;

                                                                      if(l[72][0] == "1"&& l[72][1] == "1"&& l[72][2] == "1"&& l[72][3] == "1")
                     document.getElementsByName("flag72")[0].checked=true;
                     
                    if (l[73][0] == "1")
                        document.getElementsByName("Yidflag731")[0].checked = true;
                    if (l[73][1] == "1")
                        document.getElementsByName("Yidflag732")[0].checked = true;
                    if (l[73][2] == "1")
                        document.getElementsByName("Yidflag733")[0].checked = true;
                    if (l[73][3] == "1")
                        document.getElementsByName("Yidflag734")[0].checked = true;
                        
                     if(l[73][0] == "1"&& l[73][1] == "1"&& l[73][2] == "1"&& l[73][3] == "1")
                     document.getElementsByName("flag73")[0].checked=true;
                }
                }