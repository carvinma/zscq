<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_PatentInfo.aspx.cs" ValidateRequest="false" Inherits="Shop_Manage_Shop_A_Patent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/Calendar.js"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <style type="text/css">
    .colordiv { border: solid 1px #8dcff4; width: 16px; height: 16px; padding: 1px; float: left; margin-right: 5px; cursor: pointer; }
    .colordiv:hover { border: solid 1px #e8641b; }
    .colordiv img { width: 16px; height: 16px; }
    .colordivselect { padding: 1px; float: left; margin-right: 5px; cursor: pointer; width: 32px; height: 32px; border: solid 1px #e8641b; }
    .colordivselect img { width: 32px; height: 32px; }
  </style>
  <style type="text/css">
    .checkprodiv { position: fixed; _position: absolute; top: 40px; height: 450px; width: 100%; z-index: 1000; }
    .inputs110text { width: 110px; height: 18px; line-height: 18px; }
    .inputs110text:hover { width: 110px; height: 18px; line-height: 18px; border: solid 2px #eb10a3d; }
  </style>
  <style type="text/css">
    #msg_win{background:#EAEAEA;width:450px;position:absolute;right:0;font-size:12px;font-family:Arial;margin:0px;display:none;overflow:hidden;z-index:99;}
    #msg_win .icos{position:absolute;top:2px;*top:0px;right:2px;z-index:9;}
    .icos a{float:left;color:#833B02;margin:1px;text-align:center;font-weight:bold;width:14px;height:22px;line-height:22px;padding:1px;text-decoration:none;font-family:webdings;}
    .icos a:hover{color:#fff;}
    #msg_title{background:#D10003;border-bottom:1px solid #A67901;border-top:1px solid #FFF;border-left:1px solid #FFF;color:#000;height:25px;line-height:25px;text-indent:5px;}
    #msg_content{margin:5px;margin-right:0;width:440px;height:auto;overflow:hidden;border:1px solid #A67901;}
    </style>
</head>
<body>
  <form id="form1" runat="server">
  <%-- 弹出框 START--%>
  <div id="msg_win" style="display: block; top: 490px; visibility: visible; opacity: 1;">
    <div class="icos">
      <a id="msg_min" title="最小化" href="javascript:void 0">_</a> <a id="msg_close" title="关闭" href="javascript:void 0">×</a>
    </div>
    <div id="msg_title">
      客户信息及费用情况</div>
    <div id="msg_content">
      <div class="list-div">
        <table cellspacing='1' cellpadding='3'>
          <tr>
            <td colspan="4" align="center"><strong>客户信息</strong></td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">会员号:</td>
            <td>
              <asp:Literal ID="Ltl_VipNumber" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">客户名称:</td>
            <td>
              <asp:Literal ID="Ltl_VipKeHuName" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">英文名称:</td>
            <td>
              <asp:Literal ID="Ltl_VipKeHuEnglishName" runat="server"></asp:Literal>
            </td>
          </tr>
            <tr>
                <td width="20%" align="right" valign="top">
                    联系人地址:
                </td>
                <td>
                    <asp:Literal ID="Ltl_VipCompanyAddress" runat="server"></asp:Literal>
                </td>
            </tr>
          <tr>
            <td width="20%" align="right" valign="top">邮编:</td>
            <td>
              <asp:Literal ID="Ltl_VipCompanyZip" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">联系人姓名:</td>
            <td>
              <asp:Literal ID="Ltl_VipLinkName" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">联系人邮箱:</td>
            <td>
              <asp:Literal ID="Ltl_VipLinkEmail" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center"><strong>费用信息</strong></td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">预付款:</td>
            <td>
              <asp:Literal ID="Ltl_VipYuFuKuan" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">余额:</td>
            <td>
              <asp:Literal ID="Ltl_VipYuE" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">欠费:</td>
            <td>
              <asp:Literal ID="Ltl_VipQianFei" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">币种:</td>
            <td>
              <asp:Literal ID="Ltl_VipBiZhong" runat="server"></asp:Literal>
            </td>
          </tr>
          <tr>
            <td width="20%" align="right" valign="top">信用等级:</td>
            <td>
              <asp:Literal ID="Ltl_VipXinYong" runat="server"></asp:Literal>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  <%-- 弹出框 END--%>
  <input type="hidden" id="hd_id" runat="server" value="0" /> <input type="hidden" id="hd_userId" runat="server" value="0" /> <input type="hidden" runat="server" id="HI_ATT" value="" />
  <h1>
    <span class="action-span"><a href="Shop_M_Patent.aspx?<%=returnurl %>">专利列表</a></span> <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 专利详情</span>
    <div style="clear: both">
    </div>
  </h1>
  <%--        <div class="list-div" id="Div1">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="4">
                        会员信息
                    </th>
                </tr>
               <tr>
                    <td width="20%" align="right" valign="top">用户名：</td>
                    <td>     
                    <asp:Literal ID="Ltl_UserName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">用户真实姓名：</td>
                    <td>     
                    <asp:Literal ID="Ltl_UserRealName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">用户编号：</td>
                    <td>     
                    <asp:Literal ID="Ltl_UserNum" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">用户所属国籍：</td>
                    <td>     
                    <asp:Literal ID="Ltl_UserGuoJi" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">用户电话：</td>
                    <td>     
                    <asp:Literal ID="Ltl_UserMobilePhone" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">用户邮箱：</td>
                    <td>     
                    <asp:Literal ID="Ltl_UserEmail" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">专利个数：</td>
                    <td colspan="3">     
                    <asp:Literal ID="Ltl_UserPatentCount" runat="server"></asp:Literal> 个
                    </td>
                </tr>
            </table>
        </div>
        <br />--%>
  <div class="list-div" id="Div2">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          专利信息
        </th>
      </tr>
      <tr>
        <td height="26" align="right">会员编号：</td>
        <td height="26">
          <asp:Literal ID="Ltl_MemberId" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" height="26" align="right">系统序号：</td>
        <td height="26">
          <asp:Literal ID="Ltl_OrderBy" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" height="26" align="right">专利号：</td>
        <td height="26">
          <asp:Literal ID="Ltl_Number" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">专利名称：</td>
        <td height="26">
          <asp:Literal ID="Ltl_Name" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right" valign="top">专利授权国：</td>
        <td height="26">
          <asp:Literal ID="Ltl_AuthorizeNationalityId" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">专利类型：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PatentType" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利申请日：</td>
        <td>
          <asp:Literal ID="Ltl_AuthorizeIsNationalityDate" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利授权日：</td>
        <td>
          <asp:Literal ID="Ltl_AuthorizeIsAuthorizeDate" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" height="26" align="right">权利要求项：</td>
        <td height="26">
          <asp:Literal ID="Ltl_yaoqiuxiang" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">专利权人：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PatentHolder" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">专利权人国籍：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PatentHolderNationalityId" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">发明人：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PatentInventor" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">该项专利范围：</td>
        <td>
          <asp:Literal ID="Ltl_PatentScope" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div class="list-div" id="Div6">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          专利状态
        </th>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">专利有效维持期限起始日：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeDateStart" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利有效维持期限终止日：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeDateEnd" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利有效维持年限：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeYear" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利剩余有效维持年限：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeRestYear" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利于该授权国的年费缴费状态：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeStatus" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">专利已缴纳年度：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeePaymentYear" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">上一次年费缴纳期限日：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeePrevYear" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div class="list-div" id="Div3">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          专利优先权信息
        </th>
      </tr>
      <tr>
        <td width="20%" height="26" align="right" valign="top">优先权申请号：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PriorityNumber" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right" valign="top">优先权国：</td>
        <td>
          <asp:Literal ID="Ltl_PriorityNationalityId" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right" valign="top">优先权申请日：</td>
        <td>
          <asp:Literal ID="Ltl_PriorityDate" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div class="list-div" id="Div4">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          专利PCT信息
        </th>
      </tr>
      <tr>
        <td width="20%" height="26" align="right">PCT申请号：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PtcNumber" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">PCT申请日：</td>
        <td height="26">
          <asp:Literal ID="Ltl_PtcDate" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div class="list-div" id="Div5">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          缴费信息
        </th>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">缴费期限日：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeNextYear" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">距缴费期限所剩天数：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeRestDay" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">待缴年度：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeNotPaymentYear" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">官费：</td>
        <td>
          <asp:Literal ID="Ltl_AnnualFeeNextPaymentMoney" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">代理费：</td>
        <td>
          <asp:Literal ID="Ltl_AgentServiceFee" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">汇款手续费：</td>
        <td>
          <asp:Literal ID="Ltl_RemittanceFee" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">超项费：</td>
        <td>
          <asp:Literal ID="Ltl_chaoxiang" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">减免：</td>
        <td>
          <asp:Literal ID="Ltl_jianmian1" runat="server"></asp:Literal></td>
      </tr>
      <tr>
        <td align="right" valign="top">滞纳金：</td>
        <td>
          <asp:Literal ID="Ltl_zhinajin" runat="server" Text=""></asp:Literal>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">费用小计：</td>
        <td>
          <asp:Literal ID="Ltl_FeeSubtotal" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td height="26" align="right">货币种类：</td>
        <td>
          <asp:Literal ID="Ltl_HuoBiType" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div class="list-div" id="Div7">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          第三方信息
        </th>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">案卷号：</td>
        <td>
          <asp:Literal ID="Ltl_anjuanhao" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">联系人：</td>
        <td>
          <asp:Literal ID="Ltl_linkman" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">地址：</td>
        <td>
          <asp:Literal ID="Ltl_address" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">电话：</td>
        <td>
          <asp:Literal ID="Ltl_phone" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <th colspan="2">
          专利设置
        </th>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">前台是否显示：</td>
        <td>
          <asp:Literal ID="Ltl_Show" runat="server"></asp:Literal>
        </td>
      </tr>
      <tr>
        <td width="20%" align="right" valign="top">是否接受邮件期限提醒：</td>
        <td>
            <asp:Literal ID="Ltl_ReceiveEmail" runat="server"></asp:Literal>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <div class="list-div" id="Div8">
    <table cellspacing='1' cellpadding='3' id="tblData">
      <tr>
        <th width="2%">
        </th>
        <th width="10%">
          账单号
        </th>
        <th width="10%">
          添加时间
        </th>
        <th width="10%">
          收款时间
        </th>
        <th width="10%">
          交费时间
        </th>
        <th width="10%">
          发送时间
        </th>
        <th width="10%">
          收据时间
        </th>
        <th width="15%">
          备注1
        </th>
        <th width="15%">
          备注2
        </th>
        <th width="8%">
          操作
        </th>
      </tr>
      <asp:Repeater ID="reptlist" runat="server">
        <ItemTemplate>
          <tr>
            <td height="26" align="center"><input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' /></td>
            <td align="center"><input type="text" id='txt_orderNum<%# Eval("i_Id")%>' class="inputs110text" value='<%#Eval("nvc_OrderNum")%>' /> </td>
            <td align="center"><input type="text" id='dt_addtime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_AddOrderTime", "{0:yyyy-MM-dd}")%>' /> </td>
            <td align="center"><input type="text" id='dt_shoutime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_ShouKuanTime", "{0:yyyy-MM-dd}") %>' /> </td>
            <td align="center"><input type="text" id='dt_jiaofeitime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_JiaoFeiTime", "{0:yyyy-MM-dd}") %>' /> </td>
            <td align="center"><input type="text" id='dt_sendtime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_SendInfoTime", "{0:yyyy-MM-dd}") %>' /> </td>
            <td align="center"><input type="text" id='dt_shoujutime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_KaiJuTime", "{0:yyyy-MM-dd}") %>' /> </td>
            <td align="center"><input type="text" id='t_info1<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info1") %>' /> </td>
            <td align="center"><input type="text" id='t_info2<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info2") %>' /> </td>
            <td align="center"><input id="Btn_Update" type="button" class="inputicoeditbutton" onclick="Edit(<%#Eval("i_Id") %>)" /> </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr id="tRow0">
        <td height="26" align="center" width="2%"></td>
        <td align="center" width="10%"><input type="text" onblur="bb();" name='txt_orderNum' class="inputs110text" value='' /> </td>
        <td align="center" width="10%"><input type="text" name='dt_addtime' class="inputs110text" value='' /> </td>
        <td align="center" width="10%"><input type="text" name='dt_shoutime' class="inputs110text" value='' /> </td>
        <td align="center" width="10%"><input type="text" name='dt_jiaofeitime' class="inputs110text" value='' /> </td>
        <td align="center" width="10%"><input type="text" name='dt_sendtime' class="inputs110text" value='' /> </td>
        <td align="center" width="10%"><input type="text" name='dt_shoujutime' class="inputs110text" value='' /> </td>
        <td align="center" width="15%"><input type="text" name='t_info1' class="inputs130text" value='' /> </td>
        <td align="center" width="15%"><input type="text" name='t_info2' class="inputs130text" value='' /> </td>
        <td align="center" width="8%"></td>
      </tr>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td height="25" width="40%" align="right"><input type="hidden" id="hidNum" name="hidNum" value="0" /> <input type="button" id="btnAdd" runat="server" class="button" style="display: none;" value="增加一条明细" /> </td>
        <td align="left">
          <asp:Button ID="Button1" runat="server" CssClass="button" Text="提交数据" OnClick="Button1_Click" OnClientClick="return dalclick();" /></td>
      </tr>
    </table>
    <table cellspacing='1' cellpadding='3'>
      <tr align="left">
        <td height="25"><input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value='' />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" /> </td>
      </tr>
    </table>
  </div>
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40%"></td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 15%; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="40%" align="right"><img alt="" width="30" src="images/caozuo_2.jpg" /></td>
              <td width="60%" align="left" style="font-size: 14px;">&nbsp;删除成功</td>
            </tr>
          </table>
        </td>
        <td width="45%"></td>
      </tr>
    </table>
  </div>
  <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px; height: 100px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp; </td>
        <td width="230px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /></td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /></td>
            </tr>
          </table>
        </td>
        <td>&nbsp; </td>
      </tr>
      <tr>
        <td></td>
        <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece; background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /></td>
              <td width="80%" align="left" style="font-size: 14px;">&nbsp;确认要进行删除操作吗？</td>
            </tr>
          </table>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td style="font-size: 14px;"><a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDel_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
            </tr>
          </table>
        </td>
        <td></td>
      </tr>
    </table>
  </div>
  <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp; </td>
        <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red; padding: 5px; width: 200px; font-size: 16px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /></td>
              <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录</td>
            </tr>
          </table>
        </td>
        <td width="40%"></td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" language="javascript">
    function divoperation(ctype, divid)//操作div
    {
      if (ctype == 2) {
        document.getElementById("divbox" + divid).style.display = "none";
      }
      else {
        for (var i = 1; i < 4; i++) {
          if (i == divid) {
            document.getElementById("divbox" + i).style.display = "";
          }
          else {
            document.getElementById("divbox" + i).style.display = "none";
          }
        }
      }
    }
    if (document.getElementById('HiddenDel').value == "del") {
      divoperation(1, '3');
      setTimeout("divoperation(2,'3')", 1500); //1.5秒
    }
    function xwshow() {
      var inputs = document.getElementsByName("inputPageid");
      var jb = 0;
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == true) {
          jb = 1;
        }
      }
      if (jb == 0) {
        divoperation(1, '2');
        setTimeout("divoperation(2,'2')", 1500); //1.5秒
      }
      else {
        divoperation(1, '1');
      }
    }
  </script>
  <img style="position: absolute; display: none; border: solid 2px #578ece;" id="xsimg" alt="" src="images/noimage.jpg" width="164" />
  <br />
  <br />
  <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px; background: #dfeef5; padding-left: 150px;">
      <asp:Button ID="Button2" runat="server" Text="生成文档" CssClass="button" 
          onclick="Button2_Click" />
    <input type="button" id="Btn_Back" value="返回" class="button" onclick="javascript:window.location='<%=href %>';" />
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
      <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript">
  function bb() {
    var lname = document.getElementById('btnAdd');
    lname.style.display = "block";
  }
  function checknull() {
    var lname = document.getElementById('btnAdd');
    lname.style.display = "block";
  }
  var s = "";
  function dalclick() {
    var datanum = document.getElementsByName('txt_orderNum');
    var addtime = document.getElementsByName('dt_addtime');
    var shoutime = document.getElementsByName('dt_shoutime');
    var jiaofeitime = document.getElementsByName('dt_jiaofeitime');
    var sendtime = document.getElementsByName('dt_sendtime');
    var shoujutime = document.getElementsByName('dt_shoujutime');
    var info1 = document.getElementsByName('t_info1');
    var info2 = document.getElementsByName('t_info2');
    var hi = document.getElementById('HI_ATT');
    for (var i = 0; i < datanum.length; i++) {
      if (datanum[i].value == "") {
        alert("请填写账单号");
        return false;
      }
      else {
		  
        if (datanum[i].value != "") {
          s += datanum[i].value + "_" + addtime[i].value + "_" + shoutime[i].value + "_" + jiaofeitime[i].value + "_" + sendtime[i].value + "_" + shoujutime[i].value + "_" + info1[i].value + "_" + info2[i].value + "|";
        }
      }
	 
    }
    hi.value = s;
  }


</script>
<script type="text/javascript">
  $(document).ready(function () {
    $("#btnAdd").click(function () {
      var num = $("#hidNum").val(); //
      num = parseInt(num);
      num++; //点击自加
      $("#hidNum").val(num); //重新赋值          
      $("#tRow0").clone(true).attr("id", "tRow" + num).appendTo("#tblData"); //clone tr 并重新给定ID,装到table
      $("#tRow" + num + " td").each(function () {//循环克隆的新行里面的td
        $(this).find("input[type='text']").val(""); //清空克隆行的数据
      });
    });

  });
</script>
<script type="text/javascript">
  function SelAll() {
    var inputs = document.getElementsByTagName("input");
    var checkall = document.getElementById("checkall");
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].type == "checkbox") {
        inputs[i].checked = checkall.checked;
      }
    }
  }
  function Selbox(obj) {
    var inputs = document.getElementsByName("inputPageid");
    var checkall = document.getElementById("checkall");
    if (obj.checked == false) {
      checkall.checked = false;
    }
    else {
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == false) {
          checkall.checked = false;
          return;
        }
        else {
          checkall.checked = true;
        }
      }
    }
  }
  function Edit(obj) {
    var data1 = $("#txt_orderNum" + obj).val();
    var data2 = $("#dt_addtime" + obj).val();
    var data3 = $("#dt_shoutime" + obj).val();
    var data4 = $("#dt_jiaofeitime" + obj).val();
    var data5 = $("#dt_sendtime" + obj).val();
    var data6 = $("#dt_shoujutime" + obj).val();
    var data7 = $("#t_info1" + obj).val();
    var data8 = $("#t_info2" + obj).val();
    var datastr = data1 + "|" + data2 + "|" + data3 + "|" + data4 + "|" + data5 + "|" + data6 + "|" + data7 + "|" + data8;

    $.ajax({
      type: "POST",
      url: "Shop_A_DataOrder.ashx",
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      data: "flag=PatentOrder&id=" + obj + "&data=" + datastr,
      success: function (msg) {
        if (msg == "ok") {
          alert("修改成功");
        }
      }
    });
  }
</script>
<script language="javascript">
  var Message = {
    set: function () {//最小化与恢复状态切换
      var set = this.minbtn.status == 1 ? [0, 1, 'block', this.char[0], '最小化'] : [1, 0, 'none', this.char[1], '展开'];
      this.minbtn.status = set[0];
      this.win.style.borderBottomWidth = set[1];
      this.content.style.display = set[2];
      this.minbtn.innerHTML = set[3]
      this.minbtn.title = set[4];
      this.win.style.top = this.getY().top;
    },
    close: function () {//关闭
      this.win.style.display = 'none';
      window.onscroll = null;
    },
    setOpacity: function (x) {//设置透明度
      var v = x >= 100 ? '' : 'Alpha(opacity=' + x + ')';
      this.win.style.visibility = x <= 0 ? 'hidden' : 'visible'; //IE有绝对或相对定位内容不随父透明度变化的bug
      this.win.style.filter = v;
      this.win.style.opacity = x / 100;
    },
    show: function () {//渐显
      clearInterval(this.timer2);
      var me = this, fx = this.fx(0, 100, 0.1), t = 0;
      this.timer2 = setInterval(function () {
        t = fx();
        me.setOpacity(t[0]);
        if (t[1] == 0) { clearInterval(me.timer2) }
      }, 10);
    },
    fx: function (a, b, c) {//缓冲计算
      var cMath = Math[(a - b) > 0 ? "floor" : "ceil"], c = c || 0.1;
      return function () { return [a += cMath((b - a) * c), a - b] }
    },
    getY: function () {//计算移动坐标
      var d = document, b = document.body, e = document.documentElement;
      var s = Math.max(b.scrollTop, e.scrollTop);
      var h = /BackCompat/i.test(document.compatMode) ? b.clientHeight : e.clientHeight;
      var h2 = this.win.offsetHeight;
      //alert(s + "--" + h + "--" + h2);

      //return { foot: s + h + h2 + 2 + 'px', top: s + h - h2 - 2 + 'px' }
      return { foot: s + h2 + 'px', top: s + 'px' }

    },
    moveTo: function (y) {//移动动画
      clearInterval(this.timer);
      var me = this, a = parseInt(this.win.style.top) || 0;
      var fx = this.fx(a, parseInt(y));
      var t = 0;
      this.timer = setInterval(function () {
        t = fx();
        me.win.style.top = t[0] + 'px';
        if (t[1] == 0) {
          clearInterval(me.timer);
          me.bind();
        }
      }, 10);
    },
    bind: function () {//绑定窗口滚动条与大小变化事件
      var me = this, st, rt;
      window.onscroll = function () {
        clearTimeout(st);
        clearTimeout(me.timer2);
        me.setOpacity(0);
        st = setTimeout(function () {
          me.win.style.top = me.getY().top;
          me.show();
        }, 600);
      };
      window.onresize = function () {
        clearTimeout(rt);
        rt = setTimeout(function () { me.win.style.top = me.getY().top }, 100);
      }
    },
    init: function () {//创建HTML
      function $(id) { return document.getElementById(id) };
      this.win = $('msg_win');
      var set = { minbtn: 'msg_min', closebtn: 'msg_close', title: 'msg_title', content: 'msg_content' };
      for (var Id in set) { this[Id] = $(set[Id]) };
      var me = this;
      this.minbtn.onclick = function () { me.set(); this.blur() };
      this.closebtn.onclick = function () { me.close() };
      this.char = navigator.userAgent.toLowerCase().indexOf('firefox') + 1 ? ['_', '::', '×'] : ['0', '2', 'r']; //FF不支持webdings字体
      this.minbtn.innerHTML = this.char[0];
      this.closebtn.innerHTML = this.char[2];
      setTimeout(function () {//初始化最先位置
        me.win.style.display = 'block';
        me.win.style.top = me.getY().foot;
        me.moveTo(me.getY().top);
      }, 0);
      return this;
    }
  };
  Message.init();
</script>
