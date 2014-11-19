<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_ManagerGroup.aspx.cs" Inherits="Shop_Manage_Shop_A_Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <script type="text/javascript" src="js/vcom.js"></script>
  <script src="js/ss.js" type="text/javascript"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server" name="form1" method="post">
  <h1>
    <span class="action-span"><a href="Shop_M_Admin.aspx">管理员列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 添加管理组 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div id="list-div" class="list-div">
    <table cellpadding="3" cellspacing="1">
      <tr>
        <th colspan="3">
          添加管理组
        </th>
      </tr>
      <tr>
        <td width="100" align="right">组名称： </td>
        <td>
          <input name="admin_name1" runat="server" id="admin_name1" type="text" value="" size="20" class="inputs200text" onblur="checknull('admin_name1','fadmin_name1')" maxlength="25" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fadmin_name1" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写组名称</font> </td>
        <td>&nbsp; </td>
      </tr>
      <tr>
        <td width="100" align="right">备注： </td>
        <td>
          <input name="admin_realname1" runat="server" id="admin_realname1" type="text" value="" class="inputs200text" />
        </td>
        <td>&nbsp; </td>
      </tr>
      <tr>
        <td align="right" valign="top">管理权限： </td>
        <td width="550px">
          <table width="550px">
            <tr>
              <td width="30%">
                <input type="checkbox" name="flag16XX" id="Checkbox1" value="1" onclick="checkflag(this,'idflag')" />全选 </td>
              <td width="14%">&nbsp; </td>
              <td width="14%">&nbsp; </td>
              <td width="14%">&nbsp; </td>
              <td width="14%">&nbsp; </td>
              <td width="14%">&nbsp; </td>
            </tr>
            <tr>
              <td colspan="6"><strong style="margin-left: 50px; font-size: 13px;">专利系统</strong>&nbsp; </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">专利客户管理<input name="flag10" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,10)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag100" id="idflag10" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag101" id="idflag10" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag102" id="idflag10" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag103" id="idflag10" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag104" id="idflag10" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">专利信息管理<input name="flag11" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,11)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag110" id="idflag11" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag111" id="idflag11" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag112" id="idflag11" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag113" id="idflag11" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag114" id="idflag11" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">专利订单管理<input name="flag12" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,12)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag120" id="idflag12" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag121" id="idflag12" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag122" id="idflag12" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag123" id="idflag12" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag124" id="idflag12" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td colspan="6"><strong style="margin-left: 50px; font-size: 13px;">商标系统</strong>&nbsp; </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">商标客户管理<input name="flag20" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,20)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag200" id="idflag20" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag201" id="idflag20" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag202" id="idflag20" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag203" id="idflag20" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag204" id="idflag20" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">商标信息管理<input name="flag21" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,21)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag210" id="idflag21" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag211" id="idflag21" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag212" id="idflag21" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag213" id="idflag21" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag214" id="idflag21" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">商标订单管理<input name="flag22" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,22)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag220" id="idflag22" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag221" id="idflag22" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag222" id="idflag22" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag223" id="idflag22" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag224" id="idflag22" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td colspan="6"><strong style="margin-left: 50px; font-size: 13px;">积分商城系统</strong>&nbsp; </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">积分会员管理<input name="flag33" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,33)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag330" id="idflag33" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag333" id="idflag33" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag794" id="idflag79" type="checkbox" value="1" <% if (MD.ManagerPowre_Check(Mid, 79, 4)) { %> checked <% } %> onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag791" id="idflag79" type="checkbox" value="1" <% if (MD.ManagerPowre_Check(Mid, 79, 1)) { %> checked <% } %> onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--修改<input name="Yidflag792" id="idflag79" type="checkbox" value="1" <% if (MD.ManagerPowre_Check(Mid, 79, 2)) { %> checked <% } %> onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">积分流水管理<input name="flag79" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,79)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag790" id="idflag79" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag793" id="idflag79" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag794" id="idflag79" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag791" id="idflag79" type="checkbox" value="1" <% if (MD.ManagerPowre_Check(Mid, 79, 1)) { %> checked <% } %> onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--修改<input name="Yidflag792" id="idflag79" type="checkbox" value="1" <% if (MD.ManagerPowre_Check(Mid, 79, 2)) { %> checked <% } %> onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">积分礼品管理<input name="flag30" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,30)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag300" id="idflag30" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag301" id="idflag30" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag302" id="idflag30" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag303" id="idflag30" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag304" id="idflag30" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">礼品订单管理<input name="flag32" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,32)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag320" id="idflag32" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag321" id="idflag32" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag322" id="idflag32" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag323" id="idflag32" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag324" id="idflag32" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">优惠券管理<input name="flag38" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,38)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag380" id="idflag38" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag381" id="idflag38" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag382" id="idflag38" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag383" id="idflag38" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag384" id="idflag38" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">优惠券分类管理<input name="flag39" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,39)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag390" id="idflag39" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag391" id="idflag39" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag392" id="idflag39" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag393" id="idflag39" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag394" id="idflag39" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td colspan="6"><strong style="margin-left: 50px; font-size: 13px;">系统管理</strong>&nbsp; </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">会员等级管理<input name="flag40" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,40)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag400" id="idflag40" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag401" id="idflag40" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag402" id="idflag40" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag403" id="idflag40" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag404" id="idflag40" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">国家管理<input name="flag41" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,41)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag410" id="idflag41" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag411" id="idflag41" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag412" id="idflag41" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag413" id="idflag41" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag414" id="idflag41" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">省市地区管理<input name="flag42" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,42)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag420" id="idflag42" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag421" id="idflag42" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag422" id="idflag42" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag423" id="idflag42" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag424" id="idflag42" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">专利年次设置<input name="flag43" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,43)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag430" id="idflag43" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag431" id="idflag43" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag432" id="idflag43" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag433" id="idflag43" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag434" id="idflag43" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">专利类型设置<input name="flag44" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,44)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag440" id="idflag44" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag441" id="idflag44" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag442" id="idflag44" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag443" id="idflag44" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag444" id="idflag44" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">国家专利费用设置<input name="flag45" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,45)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag450" id="idflag45" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag451" id="idflag45" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag452" id="idflag45" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag453" id="idflag45" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag454" id="idflag45" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">国家钱币汇率设置<input name="flag46" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,46)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag460" id="idflag46" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag461" id="idflag46" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag462" id="idflag46" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag463" id="idflag46" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag464" id="idflag46" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">商标费用设置<input name="flag47" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,47)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag470" id="idflag47" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag472" id="idflag47" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag471" id="idflag47" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag473" id="idflag47" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag474" id="idflag47" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">邮件设置<input name="flag50" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,50)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag500" id="idflag50" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag502" id="idflag50" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag501" id="idflag50" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag503" id="idflag50" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag504" id="idflag50" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">邮件模板管理<input name="flag51" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,51)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag510" id="idflag51" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag511" id="idflag51" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag512" id="idflag51" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag513" id="idflag51" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag514" id="idflag51" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">邮件管理<input name="flag52" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,52)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag520" id="idflag52" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag521" id="idflag52" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag522" id="idflag52" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag523" id="idflag52" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag524" id="idflag52" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">短信设置<input name="flag55" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,55)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag550" id="idflag55" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag552" id="idflag55" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag551" id="idflag55" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag553" id="idflag55" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag554" id="idflag55" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">短信管理<input name="flag56" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,56)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag560" id="idflag56" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag561" id="idflag56" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag562" id="idflag56" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag563" id="idflag56" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag564" id="idflag56" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">新闻管理<input name="flag60" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,60)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag600" id="idflag60" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag601" id="idflag60" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag602" id="idflag60" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag603" id="idflag60" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag604" id="idflag60" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">新闻类别管理<input name="flag61" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,61)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag610" id="idflag61" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag611" id="idflag61" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag612" id="idflag61" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag613" id="idflag61" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag614" id="idflag61" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">文件管理<input name="flag64" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,64)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag640" id="idflag64" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag641" id="idflag64" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag642" id="idflag64" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag643" id="idflag64" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag644" id="idflag64" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">文件图标管理<input name="flag65" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,65)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag650" id="idflag65" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag651" id="idflag65" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag652" id="idflag65" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag653" id="idflag65" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag654" id="idflag65" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">广告管理<input name="flag67" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,67)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag670" id="idflag67" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag671" id="idflag67" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag672" id="idflag67" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag673" id="idflag67" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag674" id="idflag67" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">广告类别管理<input name="flag68" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,68)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag680" id="idflag68" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag681" id="idflag68" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag682" id="idflag68" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag683" id="idflag68" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag684" id="idflag68" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <%--<tr>
              <td align="right" style="font-size: 13px;">
                帮助管理<input name="flag70" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,70)" />&nbsp;
              </td>
              <td align="right">
                &nbsp;浏览<input name="Yidflag700" id="idflag70" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;添加<input name="Yidflag701" id="idflag70" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;修改<input name="Yidflag702" id="idflag70" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;删除<input name="Yidflag703" id="idflag70" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;导出<input name="Yidflag704" id="idflag70" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">
                帮助类别管理<input name="flag71" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,71)" />&nbsp;
              </td>
              <td align="right">
                &nbsp;浏览<input name="Yidflag710" id="idflag71" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;添加<input name="Yidflag711" id="idflag71" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;修改<input name="Yidflag712" id="idflag71" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;删除<input name="Yidflag713" id="idflag71" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">
                &nbsp;导出<input name="Yidflag714" id="idflag71" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
            </tr>--%>
            <tr>
              <td align="right" style="font-size: 13px;">Link管理<input name="flag73" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,73)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag730" id="idflag73" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag731" id="idflag73" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag732" id="idflag73" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag733" id="idflag73" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag734" id="idflag73" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">Link区域管理<input name="flag74" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,74)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag740" id="idflag74" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag741" id="idflag74" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag742" id="idflag74" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag743" id="idflag74" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag744" id="idflag74" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">商标国家分布统计<input name="flag76" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,76)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag760" id="idflag76" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag761" id="idflag76" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--修改<input name="Yidflag762" id="idflag76" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag763" id="idflag76" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag764" id="idflag76" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">商标订单统计<input name="flag78" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,78)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag780" id="idflag78" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag781" id="idflag78" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--修改<input name="Yidflag782" id="idflag78" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag783" id="idflag78" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag784" id="idflag78" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">专利国家分布统计<input name="flag77" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,77)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag770" id="idflag77" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag771" id="idflag77" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--修改<input name="Yidflag772" id="idflag77" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag773" id="idflag77" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag774" id="idflag77" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">留言管理<input name="flag9" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,9)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag90" id="idflag9" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag92" id="idflag9" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag93" id="idflag9" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag91" id="idflag9" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag94" id="idflag9" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">管理员管理<input name="flag80" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,80)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag800" id="idflag80" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag801" id="idflag80" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag802" id="idflag80" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag803" id="idflag80" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag804" id="idflag80" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">管理员组管理<input name="flag81" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,81)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag810" id="idflag81" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag811" id="idflag81" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag812" id="idflag81" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag813" id="idflag81" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag814" id="idflag81" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">账户管理<input name="flag82" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,82)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag820" id="idflag82" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;添加<input name="Yidflag821" id="idflag82" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag822" id="idflag82" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag823" id="idflag82" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag824" id="idflag82" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">公司信息设置<input name="flag0" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,0)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag00" id="idflag0" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag02" id="idflag0" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag01" id="idflag0" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag03" id="idflag0" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag04" id="idflag0" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">积分设置<input name="flag1" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,1)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag10" id="idflag1" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag12" id="idflag1" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag11" id="idflag1" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag13" id="idflag1" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag14" id="idflag1" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">单页管理<input name="flag2" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,2)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag20" id="idflag2" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag22" id="idflag2" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag21" id="idflag2" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag23" id="idflag2" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag24" id="idflag2" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">页面优化设置<input name="flag4" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,4)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag40" id="idflag4" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag42" id="idflag4" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag41" id="idflag4" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--删除<input name="Yidflag43" id="idflag4" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
              <td align="right">&nbsp;<%--导出<input name="Yidflag44" id="idflag4" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">系统日志管理<input name="flag6" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,6)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag60" id="idflag6" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag62" id="idflag6" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag63" id="idflag6" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag64" id="idflag6" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag61" id="idflag6" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
            <tr>
              <td align="right" style="font-size: 13px;">系统日志管理<input name="flag7" id="idflag" type="checkbox" value="1" onclick="checkidflag(this,7)" />&nbsp; </td>
              <td align="right">&nbsp;浏览<input name="Yidflag70" id="idflag7" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;修改<input name="Yidflag72" id="idflag7" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;删除<input name="Yidflag73" id="idflag7" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;导出<input name="Yidflag74" id="idflag7" type="checkbox" value="1" onclick="checkauto(this)" />
              </td>
              <td align="right">&nbsp;<%--添加<input name="Yidflag71" id="idflag7" type="checkbox" value="1" onclick="checkauto(this)" />--%>
              </td>
            </tr>
          </table>
        </td>
        <td align="right">&nbsp; </td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px; background: #dfeef5;">
    <table cellspacing='1' width="100%" cellpadding='3'>
      <tr>
        <td width="100" align="right">&nbsp; </td>
        <td>
          <% if (pageadd)
             { %><asp:Button ID="Button1" runat="server" Text="添加" CssClass="button" OnClientClick="return checkinput();" OnClick="Button1_Click" /><%} %>
        </td>
        <td align="right">&nbsp; </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript" language="javascript">
  var dianji = 0;
  function checkinput() {
    if (dianji == 0) {
      dianji = 1;
    }

    var flag = true;

    //TextBox1
    var txt1 = $("#admin_name1").val();
    if (txt1 == "") {
      $("#fadmin_name1").attr("style", "display: ;");
      flag = false;
    } else {
      $("#fadmin_name1").attr("style", "display: none;");
      flag = true;
    }

    return flag;
  }
  function checknull(inputid, fontid) {
    if (dianji == 1) {
      if (document.getElementById(inputid).value != "") {
        document.getElementById(fontid).style.display = "none";
      }
      else {
        document.getElementById(fontid).style.display = "";
      }
    }
  }
  function checkauto(inputcheck) {
    var cname = inputcheck.name;
    if (inputcheck.checked) {
      var cbs = document.getElementsByName('Y' + inputcheck.id + '0');
      for (i = 0; i < cbs.length; i++) {
        cbs[i].checked = true;
      }
    }
    else {
      document.getElementById('flag16XX').checked = false;
      if (cname.substring(cname.length - 1, cname.length) == "0") {
        var cid = inputcheck.id;
        var targetid = document.getElementsByTagName("input");
        alert(targetid.length);
        for (i = 0; i < targetid.length; i++) {
          if (targetid[i].type == "checkbox") {
            if (targetid[i].id == cid) {
              targetid[i].checked = false;
            }
          }
        }
      }
    }
  }
  function checkflag(checkinput, id) //大全选函数
  {
    var targetid = document.getElementsByTagName("input");

    if (targetid) {
      for (i = 0; i < targetid.length; i++) {
        if (targetid[i].type == "checkbox") {
          targetid[i].checked = checkinput.checked;
        }
      }
    }
  }
  function checkfalgidflag(checkidstr)//连续小全选函数
  {
    var cbs = checkidstr.toString().split(',');
    for (var i = 0; i < cbs.length; i++) {
      var cbss = document.getElementsByName("flag" + cbs[i]);
      for (var j = 0; j < cbss.length; j++) {
        cbss[j].checked = !cbss[j].checked;
        checkidflag(cbss[j], cbs[i]);
      }
    }
  }
  function checkidflag(checkinput, id)//小全选函数
  {
    var targetid = document.getElementsByTagName("input");

    if (targetid) {
      for (i = 0; i < targetid.length; i++) {
        if (targetid[i].type == "checkbox") {
          if (targetid[i].id == 'idflag' + id) {
            targetid[i].checked = checkinput.checked;
          }
        }
      }
    }
    if (checkinput.checked) {
      jiancha();
    }
    else {
      document.getElementById('flag16XX').checked = false;
    }
  }
  function jiancha() {
    document.getElementById('flag16XX').checked = true;
    var targetid2 = document.getElementsByTagName("input");
    for (i = 0; i < targetid2.length; i++) {
      if (targetid2[i].type == "checkbox") {
        if (targetid2[i].id == 'idflag') {
          if (targetid2[i].checked == false) {
            document.getElementById('flag16XX').checked = false;
          }
        }
      }
    }
  }
</script>
