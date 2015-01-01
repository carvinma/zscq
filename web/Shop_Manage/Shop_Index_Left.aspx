<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Index_Left.aspx.cs" Inherits="Shop_Manage_shop_Index_Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="js/vsport.js" type="text/javascript"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" language="javascript">
    var noHelp = "<p align='center' style='color: #666'>暂时还没有该部分内容</p>";
    var helpLang = "zh_cn";
  </script>
  <style type="text/css">
    body { background: #6DABDC; }
    #tabbar-div { background: #3166AF; padding-left: 10px; height: 21px; padding-top: 0px; }
    #tabbar-div p { margin: 1px 0 0 0; }
    .tab-front { background: #6DABDC; line-height: 20px; font-weight: bold; padding: 4px 15px 4px 18px; border-right: 2px solid #335b64; cursor: hand; cursor: pointer; }
    .tab-back { color: #F4FAFB; line-height: 20px; padding: 4px 15px 4px 18px; cursor: hand; cursor: pointer; }
    .tab-hover { color: #F4FAFB; line-height: 20px; padding: 4px 15px 4px 18px; cursor: hand; cursor: pointer; background: #2F9DB5; }
    #top-div { padding: 3px 0 2px; background: #BBDDE5; margin: 5px; text-align: center; }
    #main-div { padding: 10px; margin: 5px; border-right: #767676 1px solid; border-top: #767676 1px; background: url(images/bg25.gif) #fff repeat-x 50% bottom; border-left: #767676 1px solid; border-bottom: #767676 1px solid; }
    #menu-list { padding: 0; margin: 0; }
    #menu-list ul { padding: 0; margin: 0; list-style-type: none; color: #335B64; }
    #menu-list li { padding-left: 16px; line-height: 16px; cursor: hand; cursor: pointer; }
    #main-div a:visited, #menu-list a:link, #menu-list a:hover { color: #335B64; text-decoration: none; }
    #menu-list a:active { color: #EB8A3D; }
    .explode { background: url(images/tree_folder3.gif) no-repeat 0px -1px; font-weight: bolder; }
    .collapse { background: url(images/tree_folder4.gif) no-repeat 0px -1px; font-weight: bolder; }
    .menu-item1 { font-weight: 600; }
    .menu-item { background: url(images/tree_folder3.gif) no-repeat 0px -1px; font-weight: normal; }
    #help-title { font-size: 14px; color: #000080; margin: 5px 0; padding: 0px; }
    #help-content { margin: 0; padding: 0; }
    .tips { color: #CC0000; }
    .link { color: #000099; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <div id="tabbar-div">
    <p>
      <span style="float: right; padding: 3px 5px;"><a href="javascript:toggleCollapse();"><img id="toggleImg" src="images/menu_minus.gif" width="9" height="9" border="0" alt="闭合" /></a></span> <span class="tab-front" id="menu-tab">菜单</span>
    </p>
  </div>
  <div id="main-div" style="width: 185px">
    <div id="menu-list">
      <ul>
        <!--*******************************************************-->
        <li class="explode" key="zl_1" name="menu">&nbsp;专利系统
          <ul>
            <% if (flag[10][0].ToString() == "1")
               {%>
            <li class="explode menu-item1" key="zl_1_1" name="menu1">&nbsp;专利客户管理
              <ul>
                <%if (flag[10][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_User.aspx?type=1" target="main">客户列表</a></li><%} %>
                <%if (flag[10][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_User.aspx" target="main">添加客户</a></li>
                  <li class="menu-item">&nbsp;<a href="Shop_Apl_User.aspx?type=1" target="main">导入客户</a></li>
                  <%} %>
              </ul>
            </li>
            <%} if (flag[11][0].ToString() == "1" || flag[11][1].ToString() == "1")
               {%>
            <li class="explode menu-item1" key="zl_1_2" name="menu1">&nbsp;专利信息管理
              <ul>
                <%if (flag[11][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PatentSelect.aspx" target="main">专利查询</a></li><%} %>
                <%if (flag[11][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Patent.aspx" target="main">专利列表</a></li><%} %>
                <%if (flag[11][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_Patent.aspx" target="main">添加专利</a></li><%} %>
                <%if (flag[11][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_Apl_Patent.aspx" target="main">导入专利</a></li><%} %>
              </ul>
            </li>
            <%} if (flag[12][0].ToString() == "1")
               { %>
            <li class="explode menu-item1" key="zl_1_3" name="menu1">&nbsp;专利订单管理
              <ul>
                <%if (flag[12][0].ToString() == "1")
                  { %>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=0" target="main">全部订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=1" target="main">尚未接收汇款</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=2" target="main">接收部分汇款,缴费中</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=3" target="main">接收部分汇款,未缴费</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=4" target="main">金额已付,缴费中</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=5" target="main">缴费成功,部分金额未付</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=6" target="main">缴费成功,发票已发出</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=7" target="main">缴费成功订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=8" target="main">取消缴费订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_PatentOrder.aspx?Status=9" target="main">无效订单</a></li>
                <%} %>
              </ul>
            </li>
            <%} %>
          </ul>
        </li>
        <li class="explode" key="zl_2" name="menu">&nbsp;商标系统
          <ul>
            <%if (flag[20][0].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_2_1" name="menu1">&nbsp;商标客户管理
              <ul>
                <%if (flag[20][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_User.aspx?type=2" target="main">客户列表</a></li><%} %>
                <%if (flag[20][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_SBUser.aspx" target="main">添加客户</a></li>
                  <li class="menu-item">&nbsp;<a href="Shop_Apl_User.aspx?type=2" target="main">导入客户</a></li>
                  <%} %>
              </ul>
            </li>
            <%} if (flag[21][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_2_2" name="menu1">&nbsp;商标信息管理
              <ul>
                <%if (flag[21][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Trademark.aspx" target="main">商标列表</a></li><%} %>
                <%if (flag[21][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_Trademark.aspx" target="main">商标添加</a></li>
                  <li class="menu-item">&nbsp;<a href="Shop_Apl_Trademark.aspx" target="main">导入商标</a></li><%} %>
              </ul>
            </li>
            <%} if (flag[22][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_2_3" name="menu1">&nbsp;商标订单管理
              <ul>
                <%if (flag[22][0].ToString() == "1")
                  { %>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=0" target="main">全部订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=1" target="main">待付款订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=2" target="main">已付款订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=3" target="main">已审核</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=4" target="main">已完成订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=5" target="main">无效订单</a></li>
                <%} %>
              </ul>
            </li>
            <%} %>
          
          </ul>
        </li>
        <li class="explode" key="zl_5" name="menu">&nbsp;商标申请系统
          <ul>
            <%if (flag[50][0].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_5_1" name="menu1">&nbsp;商品类别管理
              <ul>
                <%if (flag[50][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="NewManage/Goods_MainCategoryList.aspx" target="main">添加商大类</a></li><%} %>
                <%if (flag[50][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="NewManage/Goods_SubCategoryList.aspx" target="main">添加商品小类</a></li>
                  <li class="menu-item">&nbsp;<a href="NewManage/Goods_ShopList.aspx" target="main">添加商品</a></li>
                  <%} %>
              </ul>
            </li>
            <%} if (flag[51][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_2_2" name="menu1">&nbsp;费用设置
              <ul>
                <%if (flag[21][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="NewManage/Goods_CategoryFees.aspx" target="main">类别费用</a></li><%} %>
                <%if (flag[21][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="NewManage/TradeMarkWriteSample.aspx" target="main">商标填写示例</a></li>
                 <%-- <li class="menu-item">&nbsp;<a href="Shop_Apl_Trademark.aspx" target="main">导入商标</a></li>--%><%} %>
              </ul>
            </li>
            <%} if (flag[51][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_2_2" name="menu1">&nbsp;商标状态管理
              <ul>
                  <li class="menu-item">&nbsp;<a href="NewManage/TradeMarkStatus.aspx?type=0" target="main">商标申请状态</a></li> 
                  <li class="menu-item">&nbsp;<a href="NewManage/TradeMarkStatus.aspx?type=1" target="main">商标续展状态</a></li>
                  <li class="menu-item">&nbsp;<a href="NewManage/TradeMarkStatus.aspx?type=2" target="main">商标状态</a></li>
              </ul>
            </li>
              <li class="explode menu-item1" key="zl_2_2" name="menu1">&nbsp;商标管理
              <ul>
                  <li class="menu-item">&nbsp;<a href="NewManage/Q_M_TradeMarkSelect.aspx?type=0" target="main">综合查询</a></li> 
                  <li class="menu-item">&nbsp;<a href="NewManage/L_M_TradeMark.aspx" target="main">商标列表</a></li>
                  <li class="menu-item">&nbsp;<a href="NewManage/M_A_TradeMark.aspx" target="main">申请添加</a></li>
                  <li class="menu-item">&nbsp;<a href="NewManage/TradeMarkStatus.aspx?type=1" target="main">续展添加</a></li>
                  <li class="menu-item">&nbsp;<a href="NewManage/TradeMarkStatus.aspx?type=1" target="main">案件统计</a></li>
              </ul>
            </li>
            <%} if (flag[52][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_2_3" name="menu1">&nbsp;商标订单管理
              <ul>
                <%if (flag[22][0].ToString() == "1")
                  { %>
                <li class="menu-item">&nbsp;<a href="NewManage/Q_TrademarkApplyOrder.aspx?Status=0" target="main">申请案订单</a></li>
                 <li class="menu-item">&nbsp;<a href="NewManage/Q_TrademarkRenewalOrder.aspx?Status=0" target="main">续展案订单</a></li>
             <%--   <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=1" target="main">待付款订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=2" target="main">已付款订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=3" target="main">已审核</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=4" target="main">已完成订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_TrademarkOrder.aspx?Status=5" target="main">无效订单</a></li>--%>
                <%} %>
              </ul>
            </li>
            <%} %>
              <li class="explode menu-item1" key="zl_2_4" name="menu1">统计管理
             <ul>
                <li class="menu-item">&nbsp;<a href="NewManage/Trademark_Count.aspx" target="main">商标统计</a></li>
                <li class="menu-item">&nbsp;<a href="NewManage/Trademark_ApplyCount.aspx" target="main">商标个人统计</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="explode" key="zl_3" name="menu">&nbsp;积分商城系统
          <ul>
            <%if (flag[33][0].ToString() == "1" || flag[79][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_3_1" name="menu1">&nbsp;积分会员管理
              <ul>
                <%if (flag[33][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_IntegralUser.aspx" target="main">会员列表</a></li><%} %>
                <%if (flag[79][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_IntegralNote.aspx" target="main">积分流水统计</a></li><%} %>
              </ul>
            </li>
            <%}%>
            <%if (flag[30][0].ToString() == "1" || flag[30][1].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_3_1" name="menu1">&nbsp;礼品管理
              <ul>
                <%if (flag[30][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_IntegralProduct.aspx" target="main">礼品列表</a></li><%} %>
                <%if (flag[30][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_IntegralProduct.aspx" target="main">添加礼品</a></li><%} %>
              </ul>
            </li>
            <%} if (flag[32][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_3_2" name="menu1">&nbsp;礼品订单管理
              <ul>
                <%if (flag[32][0].ToString() == "1")
                  { %>
                <li class="menu-item">&nbsp;<a href="Shop_M_IntegralOrder.aspx?status=0" target="main">全部订单</a></li>
                <%--<li class="menu-item">&nbsp;<a href="Shop_M_IntegralOrder.aspx?status=1" target="main">待处理</a></li>--%>
                <li class="menu-item">&nbsp;<a href="Shop_M_IntegralOrder.aspx?status=2" target="main">待发货</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_IntegralOrder.aspx?status=3" target="main">待收货订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_IntegralOrder.aspx?status=4" target="main">已完成订单</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_IntegralOrder.aspx?status=5" target="main">无效订单</a></li>
                <%} %>
              </ul>
            </li>
            <%} if (flag[38][0].ToString() == "1" || flag[39][0].ToString() == "1" || flag[39][1].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_3_3" name="menu1">&nbsp;优惠券管理
              <ul>
                <%if (flag[38][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Coupon.aspx" target="main">优惠券列表</a></li><%} %>
                <%if (flag[38][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_U_UserCoupon.aspx" target="main">优惠券赠送</a></li><%} %>
                <%if (flag[39][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_CouponType.aspx" target="main">优惠券种类列表</a></li><%} %>
                <%if (flag[39][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_CouponType.aspx" target="main">添加优惠券种类</a></li><%} %>
              </ul>
            </li>
            <% }%>
          </ul>
        </li>
        <li class="explode" key="zl_4" name="menu">&nbsp;系统管理
          <ul>
            <%if (flag[40][0].ToString() == "1" || flag[40][1].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_4_1" name="menu1">&nbsp;会员等级管理
              <ul>
                <%if (flag[40][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_UserGrade.aspx" target="main">会员等级列表</a></li><%} %>
                <%if (flag[40][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_UserGrade.aspx" target="main">添加会员等级</a></li><%} %>
              </ul>
            </li>
            <%} if (flag[41][0].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_4_2" name="menu1">&nbsp;国家管理
              <ul>
                <%if (flag[41][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Country.aspx" target="main">国家列表</a></li><%} %>
                <%if (flag[41][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_Country.aspx" target="main">添加国家</a></li><%} %>
              </ul>
            </li>
            <%} if (flag[42][0].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_4_3" name="menu1">&nbsp;省市地区管理
              <ul>
                <%if (flag[42][0].ToString() == "1")
                  { %>
                <li class="menu-item">&nbsp;<a href="Shop_M_Province.aspx" target="main">省份列表</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_City.aspx" target="main">城市列表</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_M_Area.aspx" target="main">地区列表</a></li>
                <%} %>
                <%--<li class="menu-item">&nbsp;<a href="Shop_A_Province.aspx" target="main">添加省份</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_A_City.aspx" target="main">添加城市</a></li>
                <li class="menu-item">&nbsp;<a href="Shop_A_Area.aspx" target="main">添加地区</a></li>--%>
              </ul>
            </li>
            <%} %>
            <%if (flag[43][0].ToString() == "1" || flag[44][0].ToString() == "1" || flag[45][0].ToString() == "1" || flag[46][0].ToString() == "1" || flag[47][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_4" name="menu1">&nbsp;基础设置
              <ul>
                <%if (flag[43][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PatentYear.aspx" target="main">专利年次设置</a></li><%} %>
                <%if (flag[44][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PatentType.aspx" target="main">专利类型设置</a></li><%} %>
                <%if (flag[45][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PatentFee.aspx" target="main">国家专利费用设置</a></li><%} %>
                <%if (flag[46][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_ExChange.aspx" target="main">国家钱币汇率设置</a></li><%} %>
                <%if (flag[47][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_TrademarkSetup.aspx" target="main">商标费用设置</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[50][0].ToString() == "1" || flag[51][0].ToString() == "1" || flag[52][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_5" name="menu1">&nbsp;邮件管理
              <ul>
                <%if (flag[50][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_MailSystem.aspx" target="main">邮件设置</a></li><%} %>
                <%if (flag[51][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_EmailModel.aspx" target="main">邮件模板列表</a></li><%} %>
                <%if (flag[51][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_EmailModel.aspx" target="main">添加邮件模板</a></li><%} %>
                <%if (flag[52][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Mail.aspx" target="main">邮件发送流水</a></li><%} %>
                <%if (flag[52][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_Apl_Mail.aspx" target="main">邮件群发</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[55][0].ToString() == "1" || flag[56][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_6" name="menu1">&nbsp;短信管理
              <ul>
                <%if (flag[55][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_MessageNoteSystem.aspx" target="main">短信设置</a></li><%} %>
                <%if (flag[56][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_MessageNote.aspx" target="main">短信发送流水</a></li><%} %>
                <%if (flag[56][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_Apl_MessageNote.aspx" target="main">短信群发</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[60][0].ToString() == "1" || flag[61][0].ToString() == "1" || flag[62][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_7" name="menu1">&nbsp;新闻管理
              <ul>
                <%if (flag[60][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_News.aspx" target="main">新闻列表</a></li><%} %>
                <%if (flag[60][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_News.aspx" target="main">添加新闻</a></li><%} %>
                <%if (flag[61][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_NewsType.aspx" target="main">新闻类别列表</a></li><%} %>
                <%if (flag[62][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_NewsType.aspx" target="main">添加新闻类别</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[64][0].ToString() == "1" || flag[65][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_8" name="menu1">&nbsp;文件管理
              <ul>
                <%if (flag[64][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Files.aspx" target="main">文件列表</a></li><%} %>
                <%if (flag[64][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_Files.aspx" target="main">添加文件</a></li><%} %>
                <%if (flag[65][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_FileExPic.aspx" target="main">文件图标列表</a></li><%} %>
                <%if (flag[65][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_FileExPic.aspx" target="main">添加图标文件</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[67][0].ToString() == "1" || flag[68][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_9" name="menu1">&nbsp;广告管理
              <ul>
                <%if (flag[67][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Adv.aspx?PageType=0" target="main">广告列表</a></li><%} %>
                <%if (flag[67][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_Adv.aspx?PageType=0" target="main">添加广告</a></li><%} %>
                <%if (flag[68][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_AdvType.aspx" target="main">广告类别列表</a></li><%} %>
                <%if (flag[68][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_AdvType.aspx" target="main">广告类别添加</a></li><%} %>
                <%if (flag[67][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_AdvIndex.aspx" target="main">首页广告列表</a></li><%} %>
                <%if (flag[67][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_AdvIndex.aspx" target="main">添加首页广告</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%--<%if (flag[70][0].ToString() == "9" || flag[71][0].ToString() == "9")
              {%>
            <li class="explode menu-item1" key="zl_4_10" name="menu1">&nbsp;帮助中心管理系统
              <ul>
                <%if (flag[70][0].ToString() == "1" || flag[72][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_Help.aspx" target="main">帮助中心列表</a></li><%} %>
                <%if (flag[70][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_Help.aspx" target="main">添加帮助信息</a></li><%} %>
                <%if (flag[71][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_HelpType.aspx" target="main">帮助类别管理</a></li><%} %>
              </ul>
            </li>
            <%} %>--%>
            <%if (flag[73][0].ToString() == "1" || flag[74][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_11" name="menu1">&nbsp;Link管理
              <ul>
                <%if (flag[73][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_FriendLink.aspx" target="main">Link列表</a></li><%} %>
                <%if (flag[73][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_A_FriendLink.aspx" target="main">添加Link</a></li><%} %>
                <%if (flag[74][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_QuYu.aspx" target="main">Link区域列表</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[76][0].ToString() == "1" || flag[77][0].ToString() == "1" || flag[78][0].ToString() == "1" || flag[79][0].ToString() == "1")
              {%>
            <li class="explode menu-item1" key="zl_4_12" name="menu1">&nbsp;统计管理
              <ul>
                <%if (flag[76][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_TrademarkFenBu.aspx" target="main">商标国家分布</a></li>
                <%} if (flag[78][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_C_TrademarkOrder.aspx" target="main">商标订单统计</a></li>
                <%} if (flag[77][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PatentFenBu.aspx" target="main">专利国家分布</a></li>
                <%} %>
                <%--<%if (flag[79][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_IntegralNote.aspx" target="main">积分流水列表</a></li><%} %>--%>
                  <li class="menu-item">&nbsp;<a href="Shop_C_Patent.aspx" target="main">专利个人统计</a></li>
                  <li class="menu-item">&nbsp;<a href="Shop_C_Trademark.aspx" target="main">商标个人统计</a></li>
              </ul>
            </li>
            <%} %>
            <%if (flag[9][0].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_4_13" name="menu1">&nbsp;留言管理
              <ul>
                <%if (flag[9][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_OnlineMessage.aspx" target="main">留言列表</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[80][0].ToString() == "1" || flag[80][1].ToString() == "1" || flag[81][1].ToString() == "1" || flag[82][0].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_4_14" name="menu1">&nbsp;权限管理
              <ul>
                <%if (flag[80][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp; <a href="Shop_M_Admin.aspx" target="main">管理员列表</a></li><%} %>
                <%if (flag[80][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp; <a href="Shop_A_Admin.aspx" target="main">添加管理员</a></li><%} %>
                <%if (flag[81][1].ToString() == "1")
                  { %><li class="menu-item">&nbsp; <a href="Shop_A_ManagerGroup.aspx" target="main">添加管理组</a></li><%} %>
                <%if (flag[82][2].ToString() == "1")
                  { %><li class="menu-item">&nbsp; <a href="Shop_U_ThisAdmin.aspx" target="main">修改账户</a></li><%} %>
              </ul>
            </li>
            <%} %>
            <%if (flag[0][2].ToString() == "1" || flag[2][2].ToString() == "1" || flag[4][2].ToString() == "1" || flag[6][0].ToString() == "1" || flag[1][2].ToString() == "1")
              { %>
            <li class="explode menu-item1" key="zl_4_15" name="menu1">&nbsp;系统设置管理
              <ul>
                <%if (flag[0][2].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_System.aspx" target="main">公司信息设置</a></li><%} %>
                    <%if (flag[0][2].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PSWay.aspx" target="main">配送设置</a></li><%} %>
                <%if (flag[1][2].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_IntergralSet.aspx" target="main">积分设置</a></li><%} %>
                <%if (flag[2][2].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_SinglePage.aspx" target="main">单页设置</a></li><%} %>
                <%if (flag[4][2].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_PageInfo.aspx" target="main">页面优化设置</a></li><%} %>
                <%if (flag[6][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_SystemLog.aspx" target="main">系统日志列表</a></li><%} %>
                <%if (flag[7][0].ToString() == "1")
                  { %><li class="menu-item">&nbsp;<a href="Shop_M_UserLog.aspx" target="main">用户日志列表</a></li><%} %>
              </ul>
            </li>
            <%} %>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <div id="help-div" style="display: none">
    <h1 id="help-title">
    </h1>
    <div id="help-content">
    </div>
  </div>
  <script type="text/javascript" src="js/global.js"></script>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" language="javascript">
<!--
    var collapse_all = "闭合";
    var expand_all = "展开";
    var collapse = true;

    function toggleCollapse() {
      var items = document.getElementsByTagName('li');
      for (i = 0; i < items.length; i++) {

        if (collapse) {
          if (items[i].className.indexOf("explode") >= 0) {
            toggleCollapseExpand(items[i], "collapse");
          }
        }
        else {
          if (items[i].className.indexOf("collapse") >= 0) {
            toggleCollapseExpand(items[i], "explode");
            ToggleHanlder.Reset();
          }
        }
      }

      collapse = !collapse;
      document.getElementById('toggleImg').src = collapse ? 'images/menu_minus.gif' : 'images/menu_plus.gif';
      document.getElementById('toggleImg').alt = collapse ? collapse_all : expand_all;
    }

    function toggleCollapseExpand(obj, status) {
      if (obj.tagName.toLowerCase() == 'li' && obj.className != 'menu-item') {
        for (i = 0; i < obj.childNodes.length; i++) {

          if (obj.childNodes[i].tagName == "UL") {
            if (status == null) {
              if (obj.childNodes[1].style.display != "none") {
                obj.childNodes[1].style.display = "none";
                ToggleHanlder.RecordState(obj.getAttribute("key"), "collapse");
                if (obj.getAttribute("name") == "menu1") {
                  obj.className = "collapse menu-item1";
                } else {
                  obj.className = "collapse";
                }
              }
              else {
                obj.childNodes[1].style.display = "block";
                ToggleHanlder.RecordState(obj.getAttribute("key"), "explode");
                if (obj.getAttribute("name") == "menu1") {
                  obj.className = "explode menu-item1";
                } else {
                  obj.className = "explode";
                }
              }

              break;
            }
            else {
              if (status == "collapse") {
                ToggleHanlder.RecordState(obj.getAttribute("key"), "collapse");
                if (obj.getAttribute("name") == "menu1") {
                  obj.className = "collapse menu-item1";
                } else {
                  obj.className = "collapse";
                }
              }
              else {
                ToggleHanlder.RecordState(obj.getAttribute("key"), "explode");
                if (obj.getAttribute("name") == "menu1") {
                  obj.className = "explode menu-item1";
                } else {
                  obj.className = "explode";
                }
              }
              obj.childNodes[1].style.display = (status == "explode") ? "block" : "none";
            }
          }
        }
      }
    }
    document.getElementById('menu-list').onclick = function (e) {
      var obj = Utils.srcElement(e);
      toggleCollapseExpand(obj);
    }

    document.getElementById('tabbar-div').onmouseover = function (e) {
      var obj = Utils.srcElement(e);

      if (obj.className == "tab-back") {
        obj.className = "tab-hover";
      }
    }

    document.getElementById('tabbar-div').onmouseout = function (e) {
      var obj = Utils.srcElement(e);

      if (obj.className == "tab-hover") {
        obj.className = "tab-back";
      }
    }

    document.getElementById('tabbar-div').onclick = function (e) {
      var obj = Utils.srcElement(e);

      // var mnuTab = document.getElementById('menu-tab');
      var hlpTab = document.getElementById('help-tab');
      var mnuDiv = document.getElementById('menu-list');
      var hlpDiv = document.getElementById('help-div');

      //if (obj.id == 'menu-tab')
      //  {
      //    mnuTab.className = 'tab-front';
      //    hlpTab.className = 'tab-back';
      //    mnuDiv.style.display = "block";
      //    hlpDiv.style.display = "none";
      //  }

      if (obj.id == 'help-tab') {
        mnuTab.className = 'tab-back';
        hlpTab.className = 'tab-front';
        mnuDiv.style.display = "none";
        hlpDiv.style.display = "block";

        loc = parent.frames['main-frame'].location.href;
        pos1 = loc.lastIndexOf("/");
        pos2 = loc.lastIndexOf("?");
        pos3 = loc.indexOf("act=");
        pos4 = loc.indexOf("&", pos3);

        filename = loc.substring(pos1 + 1, pos2 - 4);
        act = pos4 < 0 ? loc.substring(pos3 + 4) : loc.substring(pos3 + 4, pos4);
        loadHelp(filename, act);
      }
    }

    /**
    * 创建XML对象
    */
    function createDocument() {
      var xmlDoc;

      // create a DOM object
      if (window.ActiveXObject) {
        try {
          xmlDoc = new ActiveXObject("Msxml2.DOMDocument.6.0");
        }
        catch (e) {
          try {
            xmlDoc = new ActiveXObject("Msxml2.DOMDocument.5.0");
          }
          catch (e) {
            try {
              xmlDoc = new ActiveXObject("Msxml2.DOMDocument.4.0");
            }
            catch (e) {
              try {
                xmlDoc = new ActiveXObject("Msxml2.DOMDocument.3.0");
              }
              catch (e) {
                alert(e.message);
              }
            }
          }
        }
      }
      else {
        if (document.implementation && document.implementation.createDocument) {
          xmlDoc = document.implementation.createDocument("", "doc", null);
        }
        else {
          alert("Create XML object is failed.");
        }
      }
      xmlDoc.async = false;

      return xmlDoc;
    }

    //菜单展合状态处理器
    var ToggleHanlder = new Object();

    Object.extend(ToggleHanlder, {
      SourceObject: new Object(),
      CookieName: 'Toggle_State',
      RecordState: function (name, state) {
        if (state == "collapse") {
          this.SourceObject[name] = state;
        }
        else {
          if (this.SourceObject[name]) {
            delete (this.SourceObject[name]);
          }
        }
        var date = new Date();
        date.setTime(date.getTime() + 99999999);
        document.setCookie(this.CookieName, this.SourceObject.toJSONString(), date.toGMTString());
      },

      Reset: function () {
        var date = new Date();
        date.setTime(date.getTime() + 99999999);
        document.setCookie(this.CookieName, "{}", date.toGMTString());
      },

      Load: function () {
        if (document.getCookie(this.CookieName) != null) {
          this.SourceObject = eval("(" + document.getCookie(this.CookieName) + ")");
          var items = document.getElementsByTagName('LI');
          for (var i = 0; i < items.length; i++) {
            if (items[0].getAttribute("name") == "menu") {
              for (var k in this.SourceObject) {
                if (typeof (items[i]) == "object") {
                  if (items[i].getAttribute('key') == k) {
                    toggleCollapseExpand(items[i], this.SourceObject[k]);
                    collapse = false;
                  }
                }
              }
            }
          }
        }
        document.getElementById('toggleImg').src = collapse ? 'images/menu_minus.gif' : 'images/menu_plus.gif';
        document.getElementById('toggleImg').alt = collapse ? collapse_all : expand_all;
      }
    });

    ToggleHanlder.CookieName += "_1";
    //初始化菜单状态
    ToggleHanlder.Load();

//-->
  </script>
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
