<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_Patent.aspx.cs" Inherits="Shop_Manage_Shop_M_Patent" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
    #listDiv a { text-decoration: none; }
    #xuanzhong { color: Red; }
    #listDiv a .sp1 { background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent; display: inline-block; height: 11px; margin-top: 3px; overflow: hidden; width: 10px; background-position: 0 0px; }
    #listDiv a .sp2 { background: url("images/shengjiang.png") no-repeat scroll 0 0 transparent; display: inline-block; height: 11px; margin-top: 3px; overflow: hidden; width: 10px; background-position: 0 -11px; }
  </style>
  <script type="text/javascript">
    $(function () {
      var huserNumAsc = $("#HF_userNumAsc");
      if (huserNumAsc.val() == "asc") {
        $("#userNumAsc").hide();
        $("#userNumDesc").show();
      }
      else {
        $("#userNumAsc").show();
        $("#userNumDesc").hide();
      }
      var hAnnualFeeRestDayAsc = $("#HF_AnnualFeeRestDayAsc");
      if (hAnnualFeeRestDayAsc.val() == "asc") {
        $("#AnnualFeeRestDayAsc").hide();
        $("#AnnualFeeRestDayDesc").show();
      }
      else {
        $("#AnnualFeeRestDayAsc").show();
        $("#AnnualFeeRestDayDesc").hide();
      }
      var hEditTimeAsc = $("#HF_EditTimeAsc");
      if (hEditTimeAsc.val() == "asc") {
        $("#EditTimeAsc").hide();
        $("#EditTimeDesc").show();
      }
      else {
        $("#EditTimeAsc").show();
        $("#EditTimeDesc").hide();
      }

      var huserNameAsc = $("#HF_userNameAsc");
      if (huserNameAsc.val() == "asc") {
        $("#userNameAsc").hide();
        $("#userNameDesc").show();
      }
      else {
        $("#userNameAsc").show();
        $("#userNameDesc").hide();
      }

      var hNameAsc = $("#HF_NameAsc");
      if (hNameAsc.val() == "asc") {
        $("#NameAsc").hide();
        $("#NameDesc").show();
      }
      else {
        $("#NameAsc").show();
        $("#NameDesc").hide();
      }

      var hNumberAsc = $("#HF_NumberAsc");
      if (hNumberAsc.val() == "asc") {
        $("#NumberAsc").hide();
        $("#NumberDesc").show();
      }
      else {
        $("#NumberAsc").show();
        $("#NumberDesc").hide();
      }

      var hShouQuanGuoAsc = $("#HF_ShouQuanGuoAsc");
      if (hShouQuanGuoAsc.val() == "asc") {
        $("#ShouQuanGuoAsc").hide();
        $("#ShouQuanGuoDesc").show();
      }
      else {
        $("#ShouQuanGuoAsc").show();
        $("#ShouQuanGuoDesc").hide();
      }

      var hAnnualFeeStatusAsc = $("#HF_AnnualFeeStatusAsc");
      if (hAnnualFeeStatusAsc.val() == "asc") {
        $("#AnnualFeeStatusAsc").hide();
        $("#AnnualFeeStatusDesc").show();
      }
      else {
        $("#AnnualFeeStatusAsc").show();
        $("#AnnualFeeStatusDesc").hide();
      }

      var hAnnualFeeNotPaymentYearAsc = $("#HF_AnnualFeeNotPaymentYearAsc");
      if (hAnnualFeeNotPaymentYearAsc.val() == "asc") {
        $("#AnnualFeeNotPaymentYearAsc").hide();
        $("#AnnualFeeNotPaymentYearDesc").show();
      }
      else {
        $("#AnnualFeeNotPaymentYearAsc").show();
        $("#AnnualFeeNotPaymentYearDesc").hide();
      }
    });
  </script>
</head>
<body>
  <form id="form1" runat="server">
  <input type="hidden" id="HF_userNumAsc" runat="server" value="0" />
  <input type="hidden" id="HF_userNameAsc" runat="server" value="0" />
  <input type="hidden" id="HF_NameAsc" runat="server" value="0" />
  <input type="hidden" id="HF_NumberAsc" runat="server" value="0" />
  <input type="hidden" id="HF_ShouQuanGuoAsc" runat="server" value="0" />
  <input type="hidden" id="HF_AnnualFeeStatusAsc" runat="server" value="0" />
  <input type="hidden" id="HF_AnnualFeeNotPaymentYearAsc" runat="server" value="0" />
  <input type="hidden" id="HF_AnnualFeeRestDayAsc" runat="server" value="0" />
  <input type="hidden" id="HF_EditTimeAsc" runat="server" value="0" />
  <div>
    <h1>
      <%if (pageadd)
        { %><span class="action-span"><a href="Shop_A_Patent.aspx">添加专利</a></span><%} %>
      <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 专利列表 </span>
      <div style="clear: both">
      </div>
    </h1>
    <div class="list-div" id="listDiv">
      <table cellspacing='1' cellpadding='3'>
        <tr>
          <th width="2%">
          </th>
          <th width="9%">
            会员编号 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_UserNum=0" id="userNumAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_UserNum=1" id="userNumDesc" style="display: none"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            会员名称 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_UserName=0" id="userNameAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_UserName=1" id="userNameDesc"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            专利号 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_Number=0" id="NumberAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_Number=1" id="NumberDesc"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            专利名称 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_Name=0" id="NameAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_Name=1" id="NameDesc"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            专利授权国 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_ShouQuanGuo=0" id="ShouQuanGuoAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_ShouQuanGuo=1" id="ShouQuanGuoDesc"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            年费缴费状态 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_AnnualFeeStatus=0" id="AnnualFeeStatusAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_AnnualFeeStatus=1" id="AnnualFeeStatusDesc"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            年费待缴年度 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_AnnualFeeNotPaymentYear=0" id="AnnualFeeNotPaymentYearAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_AnnualFeeNotPaymentYear=1" id="AnnualFeeNotPaymentYearDesc"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            到期剩余天数 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_AnnualFeeRestDay=0" id="AnnualFeeRestDayAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_AnnualFeeRestDay=1" id="AnnualFeeRestDayDesc" style="display: none"><span class="sp2"></span></a>
          </th>
          <th width="9%">
            更新时间 <a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_EditTime=0" id="EditTimeAsc"><span class="sp1"></span></a><a href="Shop_M_Patent.aspx?<%=returnurl %>&flag=ob&ob_EditTime=1" id="EditTimeDesc" style="display: none"><span class="sp2"></span></a>
          </th>
          <th width="5%">是否显示</th>
          <th width="5%">是否接收邮件</th>
          <th width="7%">操作</th>
        </tr>
        <asp:Repeater ID="reptlist" runat="server" onitemcommand="reptlist_ItemCommand">
          <ItemTemplate>
            <tr>
              <td height="26" align="center">
                <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>' /></td>
              <td height="26" align="center">
                <%#Eval("nvc_UserNum")%></td>
              <td align="center">
                <%#Eval("nvc_UserName")%></td>
              <td align="center">
                <%if (pageupdate)
                  { %><a <%# Eval("nvc_Number") != null ? " style=\"color:" + Eval("nvc_Number").ToString() + "\"" : ""%> href="Shop_A_Patent.aspx?id=<%#Eval("i_Id") %>&ye=<%=ye %>&<%=returnurl %>">
                    <%#Eval("nvc_Number")%>
                  </a>
                <%}
                  else
                  { %><%#Eval("nvc_Number")%><%} %>
              </td>
              <td align="center">
                <%if (pageupdate)
                  { %><a <%# Eval("nvc_Name") != null ? " style=\"color:" + Eval("nvc_Name").ToString() + "\"" : ""%> href="Shop_A_Patent.aspx?id=<%#Eval("i_Id") %>&ye=<%=ye %>&<%=returnurl %>" title='<%#Eval("nvc_Name")%>'>
                    <%#StringHelper.CutString(Eval("nvc_Name").ToString(),20,true)%>
                  </a>
                <%}
                  else
                  { %><a href='javascript:void(0)' title='<%#Eval("nvc_Name")%>'><%#StringHelper.CutString(Eval("nvc_Name").ToString(),20,true)%></a><%} %>
              </td>
              <td align="center"><%#GetGuoJiaName(Convert.ToInt32(Eval("i_AuthorizeNationalityId")))%></td>
              <td align="center"><%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")))%></td>
              <td align="center"><%#Eval("nvc_AnnualFeeNotPaymentYear")%></td>
              <td align="center">
               <%#Eval("nvc_AnnualFeeNotPaymentYear").ToString() == "" ? "" : Eval("i_AnnualFeeRestDay")%>
              </td>
              <td align="center"><%#Eval("dt_EditTime")%></td>
              <td align="center">
              <asp:Button ID="Btn_Show" runat="server" CommandName='IsShow' CommandArgument='<%# Eval("i_Id") %>' CssClass='<%#Eval("i_Show").ToString() == "1" ? "inputicoyesbutton" : "inputiconobutton"%>' />
              </td>
              <td align="center">
              <asp:Button ID="Btn_ReceiveEmail" runat="server" CommandName='IsReceiveEmail' CommandArgument='<%# Eval("i_Id") %>' CssClass='<%#Eval("i_ReceiveEmail").ToString() == "1" ? "inputicoyesbutton" : "inputiconobutton"%>' />
              </td>
              <td align="center"><a href="Shop_A_PatentInfo.aspx?id=<%#Eval("i_Id") %>">详情</a></td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
      </table>
      <table cellspacing='1' cellpadding='3'>
        <tr align="left">
          <td height="25">
            <%if (pagedel)
              { %><input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value='' />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
            <%} %>
            <% if (pagechu)
               { %><asp:Button ID="btnExport" runat="server" Text="导出专利列表" CssClass="button" OnClick="btnExport_Click" /><%} %>
          </td>
        </tr>
      </table>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
      <Columns>
<asp:BoundField DataField="i_OrderBy" HeaderText="系统序号" />
<asp:BoundField DataField="nvc_UserNum" HeaderText="客户编号" />
<asp:BoundField DataField="nvc_Number" HeaderText="专利号" />
<asp:BoundField DataField="nvc_Name" HeaderText="专利名称" />
<asp:TemplateField HeaderText="专利授权国">
    <ItemTemplate>
     <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PatentTypeName" HeaderText="专利类型" />
<asp:TemplateField HeaderText="专利申请日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="专利授权日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_YaoQiuXiang" HeaderText="权利要求项" />
<asp:BoundField DataField="nvc_PatentHolder" HeaderText="专利权人" />
<asp:TemplateField HeaderText="专利权人国籍">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PatentInventor" HeaderText="发明人" />
<asp:TemplateField HeaderText="专利有效维持期限起始日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="专利有效维持期限终止日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeYear" HeaderText="专利有效维持年限" />
<asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="专利剩余有效维持年限" />
<asp:TemplateField HeaderText="专利于该授权国的年费缴费状态">
    <ItemTemplate>
    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="专利已缴纳年度" />
<asp:TemplateField HeaderText="上一次年费缴纳期限日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PriorityNumber" HeaderText="优先权申请号" />
<asp:TemplateField HeaderText="优先权国">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="优先权申请日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PriorityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT申请号" />
<asp:TemplateField HeaderText="PCT申请日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PtcDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="缴费期限日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="距缴费期限所剩天数">
    <ItemTemplate>
   <%#Eval("nvc_AnnualFeeNotPaymentYear").ToString() == "" ? "" : Eval("i_AnnualFeeRestDay")%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="代缴年度" />
<asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="官费" />
<asp:BoundField DataField="dm_AgentServiceFee" HeaderText="代理费" />
<asp:BoundField DataField="dm_RemittanceFee" HeaderText="汇款手续费" />
<asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="超项费" />
<asp:BoundField DataField="i_JianMian1" HeaderText="减免" />
<asp:TemplateField HeaderText="滞纳金">
    <ItemTemplate>
    <%#GetZhiNaJin(Convert.ToInt32(Eval("i_Id")))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_CurrencyType" HeaderText="货币种类" />
<asp:BoundField DataField="dm_FeeSubtotal" HeaderText="费用小计" />
<asp:BoundField DataField="nt_Remarks" HeaderText="备注" />
</Columns>
    </asp:GridView>
    <div style="text-align: center">
      <table class="pager" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;</td>
          <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False">
          </webdiyer:AspNetPager>
        </tr>
      </table>
    </div>
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
  <div id="div_a" runat="server">
  </div>
  </form>
          <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
  if (isIE) {
    window.onscroll = divIE6;
  }
  function divIE6() {
    var top1 = document.documentElement.scrollTop;
    document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
    document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
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
       
</script>
