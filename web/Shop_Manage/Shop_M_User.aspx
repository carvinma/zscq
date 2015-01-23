<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_User.aspx.cs" Inherits="Shop_Manage_shop_user" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
      .style1
      {
          width: 550px;
      }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 会员管理 </span>
    <div style="clear: both">
    </div>
  </h1>
  <div class="form-div">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right">关&nbsp;键&nbsp;词： </td>
        <td class="style1">
          <input type="text" id="user_namee" runat="server" name="user_namee" size="12" class="input" value="" />&nbsp;
          <select id="selectt" name="selectt" runat="server">
            <option value="0">多字段</option>
            <option value="1">会员编号</option>
            <option value="2">会员账号</option>
            <option value="3">客户姓名</option>
            <option value="4">手机号码</option>
            <option value="9">积分手机号</option>
            <option value="5">电话号码</option>
            <option value="6">电子邮箱</option>
            <option value="7">QQ/NSN/SKYPE</option>
          </select>&nbsp; 等&nbsp;&nbsp;级：<asp:DropDownList ID="ddl_grade" runat="server">
          </asp:DropDownList></td>
      </tr>
      
      <tr>
        <td height="28" align="right">注册时间：</td>
        <td class="style1">
          <input name="hot_start_date" type="text" id="hot_start_date" size="10" value='' runat="server" readonly="readonly" /><input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.hot_start_date);" class="inputcalendarbutton" />&nbsp;至&nbsp;<input name="hot_end_date" type="text" id="hot_end_date" size="10" value='' runat="server" readonly="readonly" /><input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.hot_end_date);" class="inputcalendarbutton" />
        </td>
      </tr>
      <tr>
        <td height="28" align="right">国&nbsp;&nbsp;家：</td>
        <td class="style1"><asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              <asp:DropDownList ID="ddl_country" runat="server">
              </asp:DropDownList>
              <%--省：
              <asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
              </asp:DropDownList>
              市：
              <asp:DropDownList ID="ddl_city" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged">
              </asp:DropDownList>
              区：
              <asp:DropDownList ID="ddl_diqu" runat="server">
              </asp:DropDownList>--%>
            </ContentTemplate>
          </asp:UpdatePanel></td>
      </tr>
      <tr>
        <td height="28" align="right">&nbsp;&nbsp;</td>
        <td class="style1"><asp:Button ID="btSelect" runat="server" Text="搜索" class="button" OnClick="btSelect_Click" /></td>
      </tr>
    </table>
  </div>
  <%--    <div class="form-div">查询会员总数：<%=qbyh %>&nbsp;&nbsp;&nbsp;&nbsp;本站会员：<%=bzyh %>&nbsp;&nbsp;&nbsp;&nbsp;QQ会员：<%=qqyh %>&nbsp;&nbsp;&nbsp;&nbsp;支付宝会员：<%=alipayyh %>&nbsp;&nbsp;&nbsp;&nbsp;新浪会员：<%=sinayh %></div>--%>
  <div class="list-div" id="listDiv">
    <%if (rept_list.Items.Count != 0)
      { %>
    <table cellspacing='1' cellpadding='3'>
      <tr align="left">
        <td height="25">
          <input name="checkall" id="checkall2" type="checkbox" onclick="SelAll(this)" />
          <% if (pagedel)
             {%><input type="button" id="Button1" runat="server" value="删除" onclick="xwshow()" class="button" /><%} %>
          <%if (pagechu)
            {%><asp:Button ID="Button2" runat="server" Text="导出" class="button" OnClick="btExProt_Click" /><%} %>
          <%--<asp:Button ID="Button5" runat="server" Text="提取用户名" class="button" OnClick="Bt_UserName_Click" />--%>
          <asp:Button ID="Button3" runat="server" Text="提取手机号" class="button" OnClick="Bt_Phone_Click" />
          <asp:Button ID="Button4" runat="server" Text="提取电子邮箱" class="button" OnClick="Bt_Mail_Click" />
        </td>
      </tr>
    </table>
    <%} %>
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th width="2%">&nbsp;
          
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_1" runat="server" OnCommand="Ob1">用户名↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_11" runat="server" Visible="false" OnCommand="Ob11">用户名↓</asp:LinkButton>
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_2" runat="server" OnCommand="Ob2">用户编号↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_22" runat="server" Visible="false" OnCommand="Ob22">用户编号↓</asp:LinkButton>
        </th>
        <th width="8%">
          <asp:LinkButton ID="Lbtn_3" runat="server" OnCommand="Ob3">等级↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_33" runat="server" Visible="false" OnCommand="Ob33">等级↓</asp:LinkButton>
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_4" runat="server" OnCommand="Ob4">手机↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_44" runat="server" Visible="false" OnCommand="Ob44">手机↓</asp:LinkButton>
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_5" runat="server" OnCommand="Ob5">电话↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_55" runat="server" Visible="false" OnCommand="Ob55">电话↓</asp:LinkButton>
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_6" runat="server" OnCommand="Ob6">邮箱↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_66" runat="server" Visible="false" OnCommand="Ob66">邮箱↓</asp:LinkButton>
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_9" runat="server" OnCommand="Ob9">积分手机↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_99" runat="server" Visible="false" OnCommand="Ob99">积分手机↓</asp:LinkButton>
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_7" runat="server" OnCommand="Ob7">账户积分↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_77" runat="server" Visible="false" OnCommand="Ob77">账户积分↓</asp:LinkButton>
        </th>
        <%if (type == 1)
          { %>
        <th width="9%">
          专利数量
        </th>
        <%}
          else
          { %>
        <th width="9%">
          商标数量
        </th>
       
        <th width="5%">
          申请
        </th>
        <th width="5%">
          续展
        </th>
         <%} %>
        <th width="5%">
          优惠券
        </th>
        <th width="9%">
          接收邮件
        </th>
        <th width="9%">
          <asp:LinkButton ID="Lbtn_8" runat="server" OnCommand="Ob8">注册时间↑</asp:LinkButton>
          <asp:LinkButton ID="Lbtn_88" runat="server" Visible="false" OnCommand="Ob88">注册时间↓</asp:LinkButton>
        </th>
      </tr>
      <asp:Repeater ID="rept_list" runat="server" OnItemCommand="rept_list_ItemCommand">
        <ItemTemplate>
          <tr>
            <td align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' />
            </td>
            <td height="25" align="center">
              <%if (pageupdate)
                {
                  if (type == 1)
                  {%><a title="编辑会员信息" href="Shop_U_User.aspx?id=<%#Eval("i_Id") %>&type=<%=type %>&ye=<%=ye %>&TypeUser=<%=TypeUser %>&statiem=<%=statiem %>&endtime=<%=endtime %>&PId=<%=PId %>&CId=<%=CId %>&AId=<%=AId %>&Keyword=<%=user_namee.Value.Trim() %>"><%#Eval("nvc_Name")%></a><%}
                  else
                  {%><a title="编辑会员信息" href="Shop_U_SBUser.aspx?id=<%#Eval("i_Id") %>&type=<%=type %>&ye=<%=ye %>&TypeUser=<%=TypeUser %>&statiem=<%=statiem %>&endtime=<%=endtime %>&PId=<%=PId %>&CId=<%=CId %>&AId=<%=AId %>&Keyword=<%=user_namee.Value.Trim() %>"><%#Eval("nvc_Name")%></a><%}
                }
                else
                {%><%#Eval("nvc_Name")%><%}%>
            </td>
            <td align="center">
              <%#Eval("nvc_UserNum") %></td>
            <td height="25" align="center">
              <%# Eval("nvc_GradeName")%></td>
            <td height="25" align="center">
              <%#Eval("nvc_MobilePhone")%>
            </td>
            <td align="center">
              <%#Eval("nvc_TelPhone")%>
            </td>
            <td align="center">
              <%#Eval("nvc_Email")%>
            </td>
            <td height="25" align="center">
              <%#Eval("i_IntegralMobileId").ToString() == "0" ? "未设置" : "<a href='Shop_U_ShopUser.aspx?id=" + Eval("i_IntegralMobileId") + "' >" + Eval("nvc_Mobile") + "</a>"%>
            </td>
            <td height="25" align="center">
              <%#  string.IsNullOrWhiteSpace(Convert.ToString(Eval("i_Integral")))? "0" : Eval("i_Integral")%>
            </td>
            <%if (type == 1)
              { %>
            <td align="center"><a href="Shop_M_Patent.aspx?nvc_UserNum=<%#Eval("nvc_UserNum")%>" title="点击查看属于我的专利">
              <%#GetUserPatentCountByMemberId(Convert.ToInt32(Eval("i_Id")))%></a></td>
            <%}
              else
              { %>
            <td align="center"><a href="Shop_M_Trademark.aspx?userid=<%# Eval("i_Id") %>" title="点击查看属于我的商标">
              <%#GetUserTrademarkCountByUserId(Convert.ToInt32(Eval("i_Id")))%></a></td>
           
             <td height="25" align="center"><a href="NewManage/L_M_Trademark.aspx?userid=<%# Eval("i_Id") %>&caseType=0">
              <%#GetUserNewTrademarkCountByUserId(Convert.ToInt32(Eval("i_Id")),0)%></a></td>
             <td height="25" align="center"><a href="NewManage/L_M_Trademark.aspx?userid=<%# Eval("i_Id") %>&caseType=1">
              <%#GetUserNewTrademarkCountByUserId(Convert.ToInt32(Eval("i_Id")),1)%></a></td>
               <%} %>
            <td height="25" align="center"><a href="Shop_M_Coupon.aspx?uid=<%# Eval("i_Id") %>&keyword=<%#Eval("nvc_Name")%>&SType=2">
            <%# Set_Coupon(Eval("i_Id"))%></a></td>
            <td align="center">
              <asp:Button ID="Btn_ReceiveEmail" runat="server" CommandName='IsReceiveEmail' CommandArgument='<%# Eval("i_Id") %>' CssClass='<%#Eval("i_ReceiveEmail").ToString() == "1" ? "inputicoyesbutton" : "inputiconobutton"%>' />
            </td>
            <td height="25" align="center">
              <%#Eval("dt_AddTime")%>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <%if (rept_list.Items.Count != 0)
      { %>
    <table cellspacing='1' cellpadding='3'>
      <tr align="left">
        <td height="25">
          <input name="checkall" id="checkall" type="checkbox" onclick="SelAll(this)" />&nbsp;
          <% if (pagedel)
             {%>
          <input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" /><%} %>
          <%if (pagechu)
            {%><asp:Button ID="btExProt" runat="server" Text="导出" class="button" OnClick="btExProt_Click" /><%} %>
          <%--<asp:Button ID="Bt_UserName" runat="server" Text="提取用户名" class="button" OnClick="Bt_UserName_Click" />--%>
          <asp:Button ID="Bt_Phone" runat="server" Text="提取手机号" class="button" OnClick="Bt_Phone_Click" /><asp:Button ID="Bt_Mail" runat="server" Text="提取电子邮箱" class="button" OnClick="Bt_Mail_Click" />
        </td>
      </tr>
    </table>
    <%} %>
  </div>
  <div style="text-align: center">
    <table class="pager" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>
          &nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;</td>
        <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False">
        </webdiyer:AspNetPager>
      </tr>
    </table>
  </div>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
      onrowcreated="GridView1_RowCreated">
    <Columns>
        <asp:BoundField HeaderText="会员编号" DataField="nvc_UserNum" />
        <asp:BoundField HeaderText="登录名" DataField="nvc_Name" />
        <asp:BoundField HeaderText="注册日期" DataField="dt_AddTime" />

        <asp:BoundField HeaderText="客户名称" DataField="nvc_RealName" />
        <asp:BoundField HeaderText="英文名称" DataField="nvc_EnglishName" />
        <asp:TemplateField HeaderText="所在地区">
            <ItemTemplate>
            <%#GetSuoZaiDiQu(Convert.ToInt32(Eval("i_ProvinceId")), Convert.ToInt32(Eval("i_CityId")), Convert.ToInt32(Eval("i_AreaId")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="详细地址" DataField="nvc_Address" />
        <asp:BoundField HeaderText="邮编" DataField="nvc_ZipCode" />
        <asp:BoundField HeaderText="公司主页" DataField="nvc_CompanyHomePage" />

        <asp:BoundField HeaderText="姓名" DataField="nvc_LinkName" />
        <asp:TemplateField HeaderText="开启到期短信提醒">
            <ItemTemplate>
            <%#GetDuanXinTiXing(Convert.ToInt32(Eval("i_IsSend")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="省份证号">
            <ItemTemplate>
            <%#Eval("nvc_IDCard") != null && Eval("nvc_IDCard") != ""?Eval("nvc_IDCard")+";":""%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="手机" DataField="nvc_MobilePhone" />
        <asp:BoundField HeaderText="传真" DataField="nvc_LinkManFax" />
        <asp:BoundField HeaderText="电话" DataField="nvc_TelPhone" />
        <asp:BoundField HeaderText="电子邮箱" DataField="nvc_Email" />
        <asp:BoundField HeaderText="关联邮箱" DataField="nt_BYEmail" />
        <asp:BoundField HeaderText="QQ" DataField="nvc_LinkManQQ" />
        <asp:BoundField HeaderText="SKYPE" DataField="nvc_LinkManSKYPE" />
        <asp:BoundField HeaderText="MSN" DataField="nvc_LinkManMSN" />
        <asp:TemplateField HeaderText="性别">
            <ItemTemplate>
            <%#GetSex(Convert.ToInt32(Eval("i_Sex")))%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField HeaderText="预付款" DataField="dm_YuFuKuan" />
        <asp:BoundField HeaderText="余额" DataField="dm_YuE" />
        <asp:BoundField HeaderText="欠费" DataField="dm_QianFei" />
        <asp:TemplateField HeaderText="币种">
            <ItemTemplate>
            <%#GetBiZhong(Convert.ToInt32(Eval("i_GuoJiId")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="信用等级">
            <ItemTemplate>
            <%#GetXinYongDengJi(Convert.ToInt32(Eval("i_Grade")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="会员权限">
            <ItemTemplate>
            <%#GetVipPower(Eval("nvc_Power"), Convert.ToInt32(Eval("i_PowerDaZhe")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="是否接收邮件">
            <ItemTemplate>
            <%#GetDuanXinTiXing(Convert.ToInt32(Eval("i_ReceiveEmail")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="备注" DataField="nt_BeiZhu" />

        <asp:BoundField HeaderText="积分手机号" DataField="nvc_Mobile" />
        <asp:BoundField HeaderText="剩余积分" DataField="i_Integral" />

        <asp:TemplateField HeaderText="优惠券数">
            <ItemTemplate>
            <%#Set_Coupon(Eval("i_Id"))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="专利数">
            <ItemTemplate>
            <%#GetUserPatentCountByMemberId(Convert.ToInt32(Eval("i_Id")))%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="商标数">
            <ItemTemplate>
            <%#GetUserTrademarkCountByUserId(Convert.ToInt32(Eval("i_Id")))%>
            </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="申请案数">
            <ItemTemplate>
            <%#GetUserNewTrademarkCountByUserId(Convert.ToInt32(Eval("i_Id")),0)%>
            </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="续展案数">
            <ItemTemplate>
            <%#GetUserNewTrademarkCountByUserId(Convert.ToInt32(Eval("i_Id")),1)%>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>    
  </asp:GridView>
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDel_Click">确认</asp:LinkButton></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
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
  </form>
  <script type="text/javascript" src="js/ss.js"></script>
    <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
  //    window.onload=function()
  //    {
  if (isIE) {
    window.onscroll = divIE6;
  }
  //    }
  function divIE6() {
    var top1 = document.documentElement.scrollTop;
    document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
    document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
</script>
<script type="text/javascript" language="javascript">
  function SelAll(checkboxobj) {
    var inputs = document.getElementsByTagName("input");
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].type == "checkbox") {
        inputs[i].checked = checkboxobj.checked;
      }
    }
  }
  function Selbox(obj) {
    var inputs = document.getElementsByName("inputPageid");
    var checkall = document.getElementById("checkall");
    var checkall2 = document.getElementById("checkall2");
    if (obj.checked == false) {
      checkall.checked = false;
      checkall2.checked = false;
    }
    else {
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == false) {
          checkall.checked = false;
          checkall2.checked = false;
          return;
        }
        else {
          checkall.checked = true;
          checkall2.checked = true;
        }
      }
    }
  }
</script>
