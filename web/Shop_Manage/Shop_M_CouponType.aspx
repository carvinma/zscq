<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_M_CouponType.aspx.cs" Inherits="ihome_manage_shop_yhjclass" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
  </style>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server" method="post">
  <input type="hidden" runat="server" id="hi_true" value="0" />
  <h1>
    <%if (pageadd)
      { %><span class="action-span"><a href="Shop_A_CouponType.aspx">添加优惠券种类</a></span><%} %><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 优惠券种类列表 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <input type="text" id="hoot" title="优惠券种类名称" size="15" value="" runat="server" maxlength="30" />&nbsp;
    <%--<select id="Select_Type" runat="server">
      <option value="0">所有种类</option>
      <option value="1">品牌券</option>
      <option value="3">全场券</option>
    </select>--%>&nbsp;<select id="Select_Give" runat="server">
      <option value="0">所有代金券</option>
      <option value="1">注册赠送</option>
      <option value="2">注册不赠送</option>
    </select><asp:Button ID="Button1" runat="server" Text="搜索" OnClick="Button1_Click" CssClass="button" />
  </div>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th width="2%">&nbsp;
          
        </th>
        <th width="25%">
          优惠券种类名称
        </th>
        <%--<th width="10%">
          优惠券种类
        </th>--%>
        <%--<th width="6%">
          使用范围
        </th>--%>
        <th width="27%">
          面值
        </th>
        <%--<th width="27%">
          购物满金额
        </th>--%>
        <%--<th width="10%">
                    兑换所需积分
                </th>
        <th width="5%">
          注册赠送
        </th>--%>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr>
            <td height="26" align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
            </td>
            <td height="25" align="center">
              <%if (pageupdate)
                {%><a href="Shop_A_CouponType.aspx?ctid=<%# Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=Keyword %>&TType=<%=TType %>&Give=<%=Select_Give.Value %>"><%# Eval("nvc_Name")%></a><%}
                else
                {%><%# Eval("nvc_Name")%><%} %>
            </td>
            <%--<td height="25" align="center">
              <%# Eval("i_Type").ToString() == "1" ? "品牌券" : Eval("i_Type").ToString() == "2" ? "分类券" : Eval("i_Type").ToString() == "3" ? "全场券" : ""%>
            </td>--%>
            <%--<td height="25" align="center">
              <%# Set_BrandOrCategory(Eval("i_SId"), Eval("i_Type"))%>
            </td>--%>
            <td height="25" align="center" style="color: Red;">(美USD):<%# Eval("i_Money1")%>
              <%--&nbsp;&nbsp;(英GBP):<%# Eval("i_Money1")%>&nbsp;&nbsp;(日JPY):<%# Eval("i_Money2")%>&nbsp;&nbsp;(韩USD):<%# Eval("i_Money3")%>--%>
            </td>
            <%--<td height="25" align="left" style="color: Red;">(中RMB):<%# Eval("i_Where")%>&nbsp;&nbsp;(英GBP):<%# Eval("i_Where1")%>&nbsp;&nbsp;(日JPY):<%# Eval("i_Where2")%>&nbsp;&nbsp;(韩USD):<%# Eval("i_Where3")%>
            </td>--%>
            <%--<td height="25" align="center"><%# Eval("i_NeedJifen")%></td>
            <td height="25" align="center"><font id="font_number<%# Container.ItemIndex %>" onmouseover="strnull('number','<%# Container.ItemIndex %>')">
              <%# Set_GiveNumber(Eval("i_RegGiveNumber"))%></font><input type="text" id="text_number<%# Container.ItemIndex %>" onmouseout="textnull('number','<%# Container.ItemIndex %>')" onblur="textok(<%# Eval("i_Id")%>,'number','<%# Container.ItemIndex %>',this.value)" value="<%# Eval("i_RegGiveNumber")%>" class="inputs60text" style="display: none;" />
            </td>--%>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <%if (pagedel)
      {%><table cellspacing='1' cellpadding='3'>
        <tr align="left">
          <td height="25" colspan="4">
            <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" /><input type="button" id="Button2" runat="server" value="删除" onclick="xwshow()" class="button" />
          </td>
        </tr>
      </table>
    <%}%>
  </div>
  <div style="text-align: center">
    <table class="pager" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp; </td>
        <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False">
        </webdiyer:AspNetPager>
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
              <td width="40%" align="right"><img alt="" width="30" src="images/caozuo_2.jpg" /> </td>
              <td width="60%" align="left" style="font-size: 14px;">&nbsp;删除成功 </td>
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
        <td width="230">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /> </td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /> </td>
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
              <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /> </td>
              <td width="80%" align="left" style="font-size: 14px;">&nbsp;确认要进行删除操作吗？ </td>
            </tr>
          </table>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; padding: 5px; font-size: 14px; text-align: center;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" style="font-size: 14px;"><a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button2_Click1">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a> </td>
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
              <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /> </td>
              <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录 </td>
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
  <script type="text/javascript" src="js/ss.js"></script>
  <div id="div_a" runat="server">
  </div>
  </form>
      <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
  var isIE = window.XMLHttpRequest ? false : true;
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
<script type="text/javascript">
  function strnull(ftype, shu) {
    var isok = document.getElementById('hi_true');
    if (isok.value == "1") {
      var str_ps = document.getElementById('font_' + ftype + shu);
      var text_ps = document.getElementById('text_' + ftype + shu);
      str_ps.style.display = "none";
      text_ps.style.display = "";
    }
  }
  function textnull(ftype, shu) {
    var str_ps = document.getElementById('font_' + ftype + shu);
    var text_ps = document.getElementById('text_' + ftype + shu);
    if (!(document.activeElement.id == ('text_' + ftype + shu))) {
      str_ps.style.display = "";
      text_ps.style.display = "none";
    }
  }
  function textok(pid, ftype, shu, tvalue) {
    var str_ps = document.getElementById('font_' + ftype + shu);
    var text_ps = document.getElementById('text_' + ftype + shu);
    if (parseFloat(str_ps.innerHTML) != parseFloat(text_ps.value)) {
      var rand = Math.floor(Math.random() * 1000000);
      var cs = "PageType=UpdateCouponTypeInfo&PId=" + pid + "&UType=" + ftype + "&PValue=" + tvalue + "&n=" + rand;
      $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
        success: function (data) {
          if (data != "NO") {
            if (tvalue == "0") {
              str_ps.innerHTML = "不赠送";
            }
            else {
              str_ps.innerHTML = tvalue + "张";
            }
          }
          else {
            alert('发生意外!');
          }
        }
      });
    }
    else {

    }
    str_ps.style.display = "";
    text_ps.style.display = "none";
  }
</script>
<script type="text/javascript">
  function SelAll() {
    var inputs = document.getElementsByName("inputPageid");
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
