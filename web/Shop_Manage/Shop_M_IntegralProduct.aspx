<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_IntegralProduct.aspx.cs" Inherits="Shop_Manage_Shop_M_IntegralProduct" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script language="javascript" src="images/hoot.js" type="text/javascript"></script>
  <style type="text/css">
    .pager { margin: 10px auto 0px auto; }
    .pager td { font-size: 12px; padding: 2px; }
    .pager td a { border: solid 1px #578ece; padding: 1px 5px 1px 5px; }
    #aspPage_input { margin-bottom: 2px; }
    .style1 { width: 10%; }
  </style>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <%if (pageadd)
      {%><span class="action-span"><a href="Shop_A_IntegralProduct.aspx">添加积分商品</a></span><%}%>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 积分商品列表 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <input type="text" title="商品名称关键词" id="hw_name" size="15" value="" runat="server" />&nbsp;<asp:DropDownList ID="DDL_Show" runat="server">
      <asp:ListItem Text="所有积分商品" Value="-1"></asp:ListItem>
      <asp:ListItem Text="显示" Value="1"></asp:ListItem>
      <asp:ListItem Text="未显示" Value="0"></asp:ListItem>
    </asp:DropDownList>
    &nbsp; 请选择语言版本：
    <asp:DropDownList ID="ddl_language" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_language_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:DropDownList ID="DDL_Recommend" runat="server" Visible="false">
      <asp:ListItem Text="所有积分商品" Value="-1"></asp:ListItem>
      <asp:ListItem Text="推荐" Value="1"></asp:ListItem>
      <asp:ListItem Text="不推荐" Value="0"></asp:ListItem>
    </asp:DropDownList>
    &nbsp;<asp:DropDownList ID="ddl_type" runat="server">
      <asp:ListItem Value="-1">所有商品</asp:ListItem>
      <asp:ListItem Value="1">积分商品</asp:ListItem>
      <asp:ListItem Value="2">优惠券商品</asp:ListItem>
      <asp:ListItem Value="3">会员等级商品</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="But_search" runat="server" Text="搜索" CssClass="button" OnClick="But_search_Click" />
  </div>
  <div class="list-div" id="listDiv">
    <table cellpadding='3' cellspacing='1'>
      <tr>
        <th width="2%">
        </th>
        <th width="10%">
          商品图片
        </th>
        <th class="style1">
          商品类别
        </th>
        <th width="15%">
          商品名称
        </th>
        <%-- <th width="15%">
          商品英国名称
        </th>
        <th width="15%">
          商品日语名称
        </th>
        <th width="15%">
          商品韩语名称
        </th>--%>
        <th width="10%">
          所需积分
        </th>
        <th width="10%">
          已兑换
        </th>
        <%--<th width="10%">
          库存
        </th>--%>
        <th width="8%">
          排序编号
        </th>
        <th width="5%">
          显示
        </th>
        <%--<th width="5%">
          推荐
        </th>--%>
      </tr>
      <asp:Repeater ID="rep_brand" runat="server" OnItemCommand="rep_brand_ItemCommand">
        <ItemTemplate>
          <tr>
            <td align="center">
              <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
            </td>
            <td align="center"><a href="../jifen_show.aspx?cid=<%# Eval("i_Id") %>&ptype=<%#Eval("i_Type") %>" target="_blank"><img src="../pic_Small/<%#Eval("nvc_Pic")%>" width="70" border="0" style="margin: 3px;"></a> </td>
            <td align="center" valign="middle">
              <%#Eval("i_Type").ToString() == "1" ? "积分商品" : Eval("i_Type").ToString() == "2" ? "优惠券商品" : Eval("i_Type").ToString() == "3" ? "会员等级商品" : ""%>
            </td>
            <td align="center">
              <%if (pageupdate)
                { %><a href="Shop_A_IntegralProduct.aspx?ipid=<%#Eval("i_Id")%>&ye=<%=ye %>&Keyword=<%=hw_name.Value %>&language=<%=ddl_language.SelectedValue %>&recommend=<%=DDL_Recommend.SelectedValue %>&show=<%=DDL_Show.SelectedValue%>"><%# Eval("nvc_Name")%></a><%}
                else
                { %><%#Eval("nvc_Name")  %><%} %>
            </td>
            <%--  <td align="center">
              <%# Eval("nvc_Name1")%>
            </td>
            <td align="center">
              <%# Eval("nvc_Name2")%>
            </td>
            <td align="center">
              <%# Eval("nvc_Name3")%>
            </td>--%>
            <td align="center">
              <%# Eval("i_NeedIntegral")%>
            </td>
            <td align="center">
              <%#Eval("i_Buys")%>
            </td>
            <%--<td align="center">
              <%# Eval("i_Stock")%>
            </td>--%>
            <td align="center">
              <%# Eval("i_Orderby")%>
            </td>
            <td align="center">
              <asp:Button ID="Button3" runat="server" CommandName='i_Show' CommandArgument='<%# Eval("i_Id") %>' CssClass='<%#Eval("i_Show").ToString() == "1" ? "inputicoyesbutton" : "inputiconobutton"%>' />
            </td>
            <td align="center" runat="server" visible="false">
              <asp:Button ID="Button7" runat="server" CommandName='i_Recommend' CommandArgument='<%# Eval("i_Id") %>' CssClass='<%#Eval("i_Recommend").ToString() == "1" ? "inputicoyesbutton" : "inputiconobutton"%>' />
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <table cellpadding='3' cellspacing='1'>
      <tr align="left">
        <td bgcolor="#FFFFFF" height="23" colspan="10">
          <input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" />&nbsp;全选&nbsp;
          <%if (pagedel)
            {%><input type="button" id="Button1" runat="server" value="删除" onclick="xwshow()" class="button" /><%} %>
          <%if (pagechu)
            {%><asp:Button ID="Button2" runat="server" class="button" Text="导出" OnClick="Button2_Click" /><%} %>
        </td>
      </tr>
    </table>
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
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
      <asp:BoundField DataField="nvc_Name" HeaderText="商品名称" />
      <asp:BoundField DataField="i_NeedIntegral" HeaderText="兑换所需积分" />
      <asp:BoundField DataField="i_Stock" HeaderText="库存" />
      <asp:BoundField DataField="i_Orderby" HeaderText="排序编号" />
      <asp:BoundField DataField="i_Buys" HeaderText="已兑换" />
      <asp:BoundField DataField="nt_ProductDetails" HeaderText="商品简介" />
      <asp:TemplateField HeaderText="是否显示">
        <ItemTemplate>
          <%# Eval("i_Show").ToString() == "1" ? "是" : "否"%>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="是否推荐">
        <ItemTemplate>
          <%# Eval("i_Recommend").ToString() == "1" ? "是" : "否"%>
        </ItemTemplate>
      </asp:TemplateField>
    </Columns>
  </asp:GridView>
  <input type="hidden" id="HiddenDel" value="" runat="server" />
  <div id="divbox" style="position: fixed; _position: absolute; left: 0; top: 250px; height: 40px; text-align: center; width: 100%; display: none;">
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
        <td width="230px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /> </td>
              <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px; line-height: 20px; font-weight: bold;">温馨提示 </td>
              <td width="34" background="images/ts_bg.jpg"><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="xwhidden()" /> </td>
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
        <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece; background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td style="font-size: 14px;"><a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="xwhidden()">取消</a> </td>
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
        <td>&nbsp; </td>
      </tr>
    </table>
  </div>
  <script type="text/javascript" language="javascript">
    if (document.getElementById('HiddenDel').value == "del") {
      document.getElementById("divbox").style.display = "";
      document.getElementById("divbox1").style.display = "none";
      document.getElementById("divbox2").style.display = "none";
      setTimeout("divhidden()", 1500); //1.5秒
    }
    function divhidden() {
      document.getElementById("divbox").style.display = "none";
    }
    function div2hidden() {
      document.getElementById("divbox2").style.display = "none";
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
        document.getElementById("divbox2").style.display = "";
        document.getElementById("divbox1").style.display = "none";
        document.getElementById("divbox").style.display = "none";
        setTimeout("div2hidden()", 1500); //1.5秒
      }
      else {
        document.getElementById("divbox1").style.display = "";
        document.getElementById("divbox").style.display = "none";
        document.getElementById("divbox2").style.display = "none";
      }
    }
    function xwhidden() {
      document.getElementById("divbox1").style.display = "none";
    }
  </script>
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
    document.getElementById("divbox").style.top = (top1 + 250) + 'px';
    document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
  }
</script>
<script type="text/javascript" src="js/ss.js"></script>
<script type="text/javascript" language="javascript">
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
