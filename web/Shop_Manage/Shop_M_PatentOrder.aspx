<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_PatentOrder.aspx.cs" Inherits="Shop_Manage_shop_sub" %>

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
    
    #listDiv a .sp1 { background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent; display: inline-block; height: 11px; margin-top: 3px; overflow: hidden; width: 10px; background-position: 0 0px; }
    #listDiv a .sp2 { background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent; display: inline-block; height: 11px; margin-top: 3px; overflow: hidden; width: 10px; background-position: 0 -11px; }
  </style>
  <script type="text/javascript">
    $(function () {
      var sa = $("#HF_StatusAsc");
      if (sa.val() == "asc") {
        $("#StausAsc").hide();
        $("#StausDesc").show();
      }
      else {
        $("#StausAsc").show();
        $("#StausDesc").hide();
      }
    });
    $(function () {
    var sa = $("#HF_AddTimeAsc");
    if (sa.val() == "asc") {
        $("#AddTimeAsc").hide();
        $("#AddTimeDesc").show();
    }
    else {
        $("#AddTimeAsc").show();
        $("#AddTimeDesc").hide();
    }
});
$(function () {
    var sa = $("#HF_PayTimeAsc");
    if (sa.val() == "asc") {
        $("#PayTimeAsc").hide();
        $("#PayTimeDesc").show();
    }
    else {
        $("#PayTimeAsc").show();
        $("#PayTimeDesc").hide();
    }
});
  </script>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" id="HF_StatusAsc" runat="server" value="0" />
  <input type="hidden" id="HF_AddTimeAsc" runat="server" value="0" />
  <input type="hidden" id="HF_PayTimeAsc" runat="server" value="0" />
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_NullGoods" value="0" />
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">-<asp:Label ID="labTitle" runat="server" Text="订单列表"></asp:Label>
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
              <td width="74" height="28" align="center" id="td0" runat="server"><a href="Shop_M_PatentOrder.aspx?status=0"><strong>全部订单</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="90" height="28" align="center" id="td1" runat="server"><a href="Shop_M_PatentOrder.aspx?status=1"><strong>尚未接收汇款</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td2" runat="server"><a href="Shop_M_PatentOrder.aspx?status=2"><strong>接收部分汇款,缴费中</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td3" runat="server"><a href="Shop_M_PatentOrder.aspx?status=3"><strong>接收部分汇款,未缴费</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td4" runat="server"><a href="Shop_M_PatentOrder.aspx?status=4"><strong>金额已付,缴费中</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td5" runat="server"><a href="Shop_M_PatentOrder.aspx?status=5"><strong>缴费成功,部分金额未付</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td6" runat="server"><a href="Shop_M_PatentOrder.aspx?status=6"><strong>缴费成功,发票已发出</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td7" runat="server"><a href="Shop_M_PatentOrder.aspx?status=7"><strong>缴费成功</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td8" runat="server"><a href="Shop_M_PatentOrder.aspx?status=8"><strong>取消缴费</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="74" height="28" align="center" id="td9" runat="server"><a href="Shop_M_PatentOrder.aspx?status=9"><strong>无效订单</strong></a> </td>
              <td width="5" align="center"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
  <div class="form-div">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>关键词：<asp:TextBox ID="txtKeyword" runat="server" Width="80px"></asp:TextBox>&nbsp;
          <asp:DropDownList ID="ddlType" runat="server">
            <asp:ListItem Value="0">所有字段</asp:ListItem>
            <asp:ListItem Value="1">订单号</asp:ListItem>
            <asp:ListItem Value="2">专利号</asp:ListItem>
            <asp:ListItem Value="3">专利名称</asp:ListItem>
            <asp:ListItem Value="4">支付方式</asp:ListItem>
            <asp:ListItem Value="5">用户名</asp:ListItem>
            <asp:ListItem Value="6">会员编号</asp:ListItem>
            <asp:ListItem Value="7">操作备注</asp:ListItem>
          </asp:DropDownList>
          &nbsp;
          <asp:DropDownList ID="Drp_PatentSqg" runat="server">
          </asp:DropDownList>
        </td>
        <td>&nbsp;<asp:DropDownList ID="ddlTimeType" runat="server">
          <asp:ListItem Value="1">下单时间</asp:ListItem>
          <asp:ListItem Value="2">支付时间</asp:ListItem>
        </asp:DropDownList>
          ：
          <input type="text" id="txtStartDate" readonly="readonly" runat="server" style="width: 80px;" />
          <input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.txtStartDate);" class="inputcalendarbutton" />&nbsp;至&nbsp;
          <input type="text" id="txtEndDate" readonly="readonly" runat="server" style="width: 80px" />
          <input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.txtEndDate);" class="inputcalendarbutton" /><asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="button" OnClick="btnSearch_Click" /><asp:Button ID="Button1" runat="server" Style="display: none;" /></td>
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
              会员编号
          </th>
          <th>
              用户名
          </th>
        <th width="15%">
          专利号
        </th>
        <th>
          订单状态 <a href="Shop_M_PatentOrder.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&ob_Status=0" id="StausAsc"><span class="sp1"></span></a><a href="Shop_M_PatentOrder.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&&ob_Status=1" id="StausDesc" style="display: none"><span class="sp2"></span></a>
        </th>
        <th>
          总金额
        </th>
        <th>
          已支付金额
        </th>
        <th>
          下单时间
          <a href="Shop_M_PatentOrder.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&ob_AddTime=0" id="AddTimeAsc"><span class="sp1"></span></a><a href="Shop_M_PatentOrder.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&&ob_AddTime=1" id="AddTimeDesc" style="display: none"><span class="sp2"></span></a>
        </th>
        <th>
          缴费时间
           <a href="Shop_M_PatentOrder.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&ob_PayTime=0" id="PayTimeAsc"><span class="sp1"></span></a><a href="Shop_M_PatentOrder.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&&ob_PayTime=1" id="PayTimeDesc" style="display: none"><span class="sp2"></span></a>
        </th>
      </tr>
      <asp:Repeater ID="repOrder" runat="server" OnItemDataBound="repOrder_ItemDataBound">
        <ItemTemplate>
          <tr align="center">
            <td height="28" align="center">
              <asp:CheckBox ID="cbOrder" runat="server" ToolTip='<%#Eval("i_Id")%>' />
            </td>
            <td align="center"><a href="Shop_M_PatentOrderInfo.aspx?Status=<%=status %>&ye=<%=ye %>&Keyword=<%=Keyword %>&SType=<%= ddlType.SelectedValue %>&NType=<%=Drp_PatentSqg.SelectedValue %>&TimeType=<%= ddlTimeType.SelectedValue %>&STime=<%=txtStartDate.Value %>&ETime=<%=txtEndDate.Value %>&orderid=<%#Eval("i_Id")%>">
              <%#Eval("nvc_OrderNumber")%></a> </td>
              <td align="center">
                  <%#Eval("nvc_UserNum")%>
              </td>
              <td align="center">
                  <%#Eval("nvc_MemberName")%>
              </td>
            <td align="center">
              <asp:HiddenField ID="Hf_Id" runat="server" Value='<%#Eval("i_Id")%>' />
              <asp:Repeater ID="Rpt_PatentNameList" runat="server">
                <ItemTemplate>
                  <a href="Shop_A_PatentInfo.aspx?id=<%#Eval("i_PatentId")%>">
                    <%#Eval("nvc_PatentNumber")%></a>
                  <br />
                </ItemTemplate>
              </asp:Repeater>
            </td>
            <td>
              <%#DALPO.GetStatus(Convert.ToInt32(Eval("i_Status")))%>
            </td>
            <td align="center">
              <%#Eval("dm_TotalMoney")%>
            </td>
            <td align="center">
              <%#Eval("dm_CouponMoney")%>
            </td>
            <td align="center">
              <%#Eval("dt_AddTime")%>
            </td>
            <td>
              <%#Eval("dt_PayMoneyTime") == null || Eval("dt_PayMoneyTime") == "" ? "" : Eval("dt_PayMoneyTime")%>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <table cellpadding="3" cellspacing="1">
      <tr align="left">
        <td bgcolor="#FFFFFF" height="28">
          <%if (pagedel)
            { %><input type="checkbox" name="AllDel" value="isOk" onclick="CbxAll(this);" />&nbsp;<input type="button" id="btnDelete" runat="server" value="删除" onclick="xwshow()" class="button" /><%} %>
          <% if (pagechu)
             { %><asp:Button ID="btnExport" runat="server" Text="导出订单列表" CssClass="button" OnClick="btnExport_Click" /><%} %>
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
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
      <Columns>
          <asp:BoundField DataField="nvc_OrderNumber" HeaderText="订单号" />
          <asp:TemplateField HeaderText="订单状态">
              <ItemTemplate>
                  <%#DALPO.GetStatus(Convert.ToInt32(Eval("i_Status")))%>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="dm_TotalMoney" HeaderText="总金额" />
          <asp:BoundField DataField="dm_CouponMoney" HeaderText="已支付金额" />
          <asp:BoundField DataField="dt_AddTime" HeaderText="下单时间" />
          <asp:BoundField DataField="dt_PayMoneyTime" HeaderText="支付时间" />
      </Columns>
  </asp:GridView>
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
