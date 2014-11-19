<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_IntegralOrder.aspx.cs" Inherits="Shop_Manage_shop_sub" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" src="js/jquery-1.4.4.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
  <script language="javascript" type="text/javascript">
    document.onkeydown = function (e)                //网页内按下回车触发
    {
      var theEvent = window.event || e;
      var code = theEvent.keyCode || theEvent.which;
      if (code == 37) {                      //不知道是什么意思,不加这行就不触发后台事件.参见【注】
        if ('<%=ye %>' != '1') {
          document.getElementById("syy").click();   //服务器控件Submit1点击事件被触发
          return false;
        }
      }
      if (code == 39) {                      //不知道是什么意思,不加这行就不触发后台事件.参见【注】
        if ('<%=ye %>' != '<%=sumy %>') {
          document.getElementById("xyy").click();   //服务器控件Submit1点击事件被触发
          return false;
        }
      }
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-<asp:Label ID="labTitle" runat="server" Text="积分订单列表"></asp:Label>
    </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <table width="100%" height="28" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#BBDDE5">
      <tr>
        <td width="1%" height="28">&nbsp; </td>
        <td height="29">
          <table border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <%if (pageview8)
                {%><td width="74" height="28" align="center" id="td0" runat="server"><a href="Shop_M_IntegralOrder.aspx?status=0"><strong>全部订单</strong></a> </td>
              <td width="5" align="center"></td>
              <%--<td width="74" height="28" align="center" id="td1" runat="server"><a href="Shop_M_IntegralOrder.aspx?status=1"><strong>待处理</strong></a> </td>
              <td width="5" align="center"></td>--%>
              <td width="74" height="28" align="center" id="td2" runat="server"><a href="Shop_M_IntegralOrder.aspx?status=2"><strong>待发货</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td3" runat="server"><a href="Shop_M_IntegralOrder.aspx?status=3"><strong>待收货</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td4" runat="server"><a href="Shop_M_IntegralOrder.aspx?status=4"><strong>已完成</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td5" runat="server"><a href="Shop_M_IntegralOrder.aspx?status=5"><strong>无效订单</strong></a> </td>
              <td width="5" align="center"></td>
              <%} %>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
  <div class="form-div">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <asp:TextBox ID="txtKeyword" ToolTip="关键词" runat="server" Width="80px"></asp:TextBox>&nbsp;<asp:DropDownList ID="ddlType" runat="server">
            <asp:ListItem Value="1">订单号</asp:ListItem>
            <asp:ListItem Value="2">用户名</asp:ListItem>
          </asp:DropDownList>
          &nbsp;<asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">全部订单</asp:ListItem>
            <%--<asp:ListItem Value="1">待处理</asp:ListItem>--%>
            <asp:ListItem Value="2">待发货</asp:ListItem>
            <asp:ListItem Value="3">待收货</asp:ListItem>
            <asp:ListItem Value="4">已完成</asp:ListItem>
            <asp:ListItem Value="5">已取消</asp:ListItem>
          </asp:DropDownList>
          &nbsp;</td>
        <td>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              省：<asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
              </asp:DropDownList>
              市：<asp:DropDownList ID="ddl_city" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged">
                <asp:ListItem Value="0">请选择</asp:ListItem>
              </asp:DropDownList>
              区：<asp:DropDownList ID="ddl_diqu" runat="server">
                <asp:ListItem Value="0">请选择</asp:ListItem>
              </asp:DropDownList>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
        <td>&nbsp;下单时间：
          <input id="txtStartDate" readonly="true" runat="server" width="80px" />
          <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.txtStartDate);" class="inputcalendarbutton" />
          &nbsp;至&nbsp;
          <input id="txtEndDate" readonly="true" runat="server" width="80px" />
          <input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.txtEndDate);" class="inputcalendarbutton" />
          <asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="button" OnClick="btnSearch_Click" />
          <asp:Button ID="Button1" runat="server" Style="display: none;" /></td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th width="2%">
          &nbsp;
        </th>
        <th>
          订单号
        </th>
        <th>
          兑换商品
        </th>
        <th>
          订单状态
        </th>
        <th>
          订单所耗积分
        </th>
        <th>
          配送方式
        </th>
        <th>
          会员/收货人/地址
        </th>
        <th width="13%">
          下单时间
        </th>
        <%--<th>
                    客服名称
                </th>--%>
      </tr>
      <asp:Repeater ID="repOrder" runat="server" OnItemDataBound="repOrder_ItemDataBound">
        <ItemTemplate>
          <tr align="center">
            <td height="28" align="center">
              <asp:CheckBox ID="cbOrder" runat="server" ToolTip='<%#Eval("i_Id")%>' />
            </td>
            <td align="center"><a href="Shop_M_IntegralOrderInfo.aspx?orderid=<%#Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%=SType %>&status=<%=State %>&PId=<%= ddl_sheng.SelectedValue %>&CId=<%= ddl_city.SelectedValue %>&AId=<%= ddl_diqu.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>">
              <%# Eval("nvc_OrderNumber")%></a> </td>
            <td align="left" valign="top">
              <asp:Repeater runat="server" ID="repProduct">
                <ItemTemplate>
                  <a title="<%#Eval("nvc_ProductName")%>" href="../jifen_show.aspx?cid=<%#Eval("i_IntegralProductId")%>" target="_blank"><img src="../pic_Small/<%#Eval("nvc_Pic")%>" width="60" border="0"> </a>
                </ItemTemplate>
              </asp:Repeater>
            </td>
            <td><font style="color: <%# Eval("i_State").ToString()=="2"?"red":""%>">
              <%#ConvertStatus(Eval("i_State"))%></font> </td>
            <td align="center"><span style="color: #F00; font-weight: bold;">
              <%#Eval("i_SumIntegral")%></span> </td>
            <td align="center">
              <%#Eval("nvc_PSWay")%>
            </td>
            <td align="center"><a href="Shop_M_IntegralOrder.aspx?Keyword=<%#Eval("nvc_MemberName")%>&SType=2" title="查看该会员所有积分订单">
              <%#Eval("nvc_MemberName")%></a>/<a href="Shop_U_User.aspx?id=<%# Eval("i_MemberId") %>"><%# Eval("nvc_Address_Consignee")%></a><br />
              <%#Eval("provinceName")%>&nbsp;<%#Eval("cityName")%>&nbsp;<%#Eval("areaName")%>
            </td>
            <td>
              <%# Eval("dt_AddTime")%>
            </td>
            <%--<td>
                            <input type="hidden" id="hi_orderid<%# Container.ItemIndex %>" value="<%#Eval("i_Id")%>" />
                            <asp:DropDownList ID="DDL_AdminServer" runat="server" onchange="changeserver(this.value,this.id)"></asp:DropDownList>
                            <asp:Label ID="Lb_AdminServer" runat="server" Text="未绑定"></asp:Label>
                        </td>--%>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <%--<script type="text/javascript">
        function changeserver(ddlvalue,orderid)
        {
            var shu=parseFloat(orderid.toString().split('_')[1].replace("ctl",""));
            var hidd=document.getElementById('hi_orderid'+shu.toString());
            var rand = Math.floor(Math.random() * 1000000);
            var cs = "PageType=UpdateOrderAdminServer&SId="+ddlvalue+"&OId="+hidd.value+"&n=" + rand;
            $.ajax({type:"get",url:"Ajax_Handler.aspx",data:cs,
                    success:function(data)
                    {
                        if(data.toString()=="1")
                        {
                            document.getElementById('Button1').click();                        
                        }
                        else
                        {
                            alert('发生意外');
                        }
                    }
                    });
        }
        </script>--%>
    <table cellpadding="3" cellspacing="1">
      <tr align="left">
        <td bgcolor="#FFFFFF" height="28">
          <%if (pagedel8)
            { %><input type="checkbox" name="AllDel" value="isOk" onclick="CbxAll(this);" />&nbsp;<input type="button" id="btnDelete" runat="server" value="删除" onclick="xwshow()" class="button" /><%} if (pagechu8)
            { %><asp:Button ID="btnExport" runat="server" Text="导出" CssClass="button" OnClick="btnExport_Click" /><%} %>
        </td>
      </tr>
    </table>
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
  <a id="syy" href="javascript:__doPostBack('aspPage','<%= syy %>')" target="_self"></a><a id="xyy" href="javascript:__doPostBack('aspPage','<%= xyy %>')" target="_self"></a>
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
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDelete_Click">确认</asp:LinkButton></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td>
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
      var selectNum = 0;
      $("input:checkbox").each(function (index, dom) {
        if ($(this).attr("checked") == true) {
          selectNum++;
        }
      });
      if (selectNum == 0) {
        divoperation(1, '2');
        setTimeout("divoperation(2,'2')", 1500); //1.5秒            
      }
      else {
        divoperation(1, '1');
      }
    }
  </script>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
      <asp:TemplateField HeaderText="订单号">
        <ItemTemplate>
          <%# Eval("nvc_OrderNumber").ToString() + ";"%></ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_MemberName" HeaderText="会员用户名" />
      <asp:TemplateField HeaderText="订单状态">
        <ItemTemplate>
          <%# ConvertStatus(Eval("i_State"))%></ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="dt_AddTime" HeaderText="下单时间" />
      <asp:BoundField DataField="i_SumIntegral" HeaderText="订单所耗积分" />
      <asp:BoundField DataField="nvc_Address_Consignee" HeaderText="收货人" />
      <asp:TemplateField HeaderText="收货地址">
        <ItemTemplate>
          <%# Eval("provinceName")%>&nbsp;<%# Eval("cityName")%>&nbsp;<%# Eval("areaName")%>&nbsp;<%# Eval("nvc_Address_StreetAddress")%></ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_Address_ZipCode" HeaderText="邮编" />
      <asp:BoundField DataField="nvc_Address_MobilePhone" HeaderText="手机号" />
      <asp:BoundField DataField="nvc_Address_TelPhone" HeaderText="电话" />
      <asp:BoundField DataField="nvc_Address_Email" HeaderText="邮箱" />
    </Columns>
  </asp:GridView>
  <script src="js/hoot.js" type="text/javascript"></script>
  <div id="daochu" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  <div id="div_a" runat="server">
  </div>
  </form>
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
    //        var kj=document.documentElement.clientHeight;
    //        document.getElementById("divbom").style.top=(top1+kj-45)+'px';
  }
</script>
<script type="text/javascript">
  function CbxAll(obj) {
    $("input:checkbox").each(function (index, dom) {
      if (obj.checked)
        $(this).attr("checked", true); //checkbox全选反选：
      else
        $(this).attr("checked", false);
    });
  }
  function DeleteCheck() {
    if (confirm('您确定要删除所选择的记录吗？')) {
      var selectNum = 0;
      $("input:checkbox").each(function (index, dom) {
        if ($(this).attr("checked") == true) {
          selectNum++;
        }
      });
      if (selectNum > 0)
        return true;
      else {
        alert("请选择您要删除的记录。");
        return false;
      }
    }
    else
      return false;
  }
  function load(sel) {
    var url = sel.options[sel.selectedIndex].value;
    if (url != "") {
      if (typeof (sel.options[sel.selectedIndex].target) != "undefined") {
        open(url, sel.options[sel.selectedIndex].target);
      } else {
        eval(sel.options[sel.selectedIndex].value)
      }
      sel.selectedIndex = 0
    }
    else
    { }
    return false;
  }
</script>
