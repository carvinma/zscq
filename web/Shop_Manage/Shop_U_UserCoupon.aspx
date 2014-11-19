<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_U_UserCoupon.aspx.cs" Inherits="Shop_Manage_shop_orderadd1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script type="text/javascript" src="js/Calendar.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <style type="text/css">
    .divitem { height: 30px; line-height: 30px; }
  </style>
  <script type="text/javascript">
    function IsDigit() {
      return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" id="hi_users" runat="server" value="" />
  <input type="hidden" runat="server" id="Hi_cb" value="" />
  <input type="hidden" runat="server" id="Hi_text" value="" />
  <input type="hidden" runat="server" id="Hi_search" value="0" />
  <h1>
    <span class="action-span"></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">--赠送优惠券→<asp:Label ID="Label1" runat="server" Text="选择会员" Style="color: Red;"></asp:Label>→<asp:Label ID="Label2" runat="server" Text="选择优惠券类型与张数"></asp:Label>→赠送成功 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div id="formDiv" runat="server" class="form-div">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30">
          <select id="select1" name="selectt" runat="server">
            <option value="0">全部客户</option>
            <option value="1">专利客户</option>
            <option value="2">商标客户</option>
          </select>
          <select id="select2" name="selectt" runat="server">
            <option value="0">全部客户</option>
            <option value="1">个人客户</option>
            <option value="2">企业客户</option>
            <option value="3">代理机构</option>
          </select>&nbsp;<asp:DropDownList ID="DDL_Grade" runat="server" AppendDataBoundItems="True">
          </asp:DropDownList>
          <input type="text" title="关键词" name="user_namee" size="12" class="input" value="" runat="server" id="user_namee" />&nbsp;<select id="selectt" name="selectt" runat="server">
            <option value="1">用户名</option>
            <option value="2">真实姓名</option>
            <option value="3">邮箱</option>
            <option value="4">手机</option>
            <option value="5">电话</option>
          </select>
        </td>
      </tr>
      
      <tr>
        <td height="30">&nbsp;注册时间：<input name="hot_start_date" type="text" id="hot_start_date" size="10" value='' runat="server" readonly="readonly" /><input name="selbtn1" type="button" id="selbtn1" onclick="new Calendar().show(form.hot_start_date);" value="选择" class="button" />&nbsp;至&nbsp;<input name="hot_end_date" type="text" id="hot_end_date" size="10" value='' runat="server" readonly="readonly" /><input name="selbtn2" type="button" id="selbtn2" onclick="new Calendar().show(form.hot_end_date);" value="选择" class="button" />
        </td>
      </tr>
      <tr>
        <td height="30">
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              国家：<asp:DropDownList ID="ddl_country" runat="server">
              </asp:DropDownList>
              <%--省：<asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
              </asp:DropDownList>
              市：<asp:DropDownList ID="ddl_city" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged">
              </asp:DropDownList>
              区：<asp:DropDownList ID="ddl_diqu" runat="server">
              </asp:DropDownList>--%>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <asp:Button ID="btnSearchUser" ToolTip="显示会员列表，从列表中选择会员" runat="server" Text="显示会员列表" CssClass="button" OnClick="btnSearchUser_Click" />
          <asp:Button ID="Button1" runat="server" Text="选择优惠券" ToolTip="不显示会员列表，直接查询所有符合搜索条件的会员（推荐）" CssClass="button" OnClientClick="return checksubmit();" OnClick="Button1_Click" /><img src="images/notice.gif" style="cursor: pointer; vertical-align: middle; margin-left: 5px;" title="选择搜索条件后可直接点击“选择优惠券”按钮，也可点击“显示会员列表”按钮在搜索结果中选择" /> </td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="listDiv" runat="server" style="display: none;">
    <table cellspacing='1' cellpadding='3'>
      <tr align="left">
        <td height="25">
          <input type="checkbox" id="checkall" onclick="SelAll()" />&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Lb_Count" runat="server" Text=""></asp:Label></td>
      </tr>
      <tr>
        <td>
          <div id="memberlist" style="height: 450px; overflow: auto;">
            <asp:Repeater ID="rept_list" runat="server">
              <ItemTemplate>
                <div style="float: left; width: 250px; height: auto; line-height: 30px;">
                  <input type="checkbox" name="user_namess" id="cb<%# Container.ItemIndex %>" value='<%#Eval("i_Id") %>' onclick="Selbox(this)">
                  <font style="color: red">用&nbsp;户&nbsp;名：</font><a href="Shop_U_User.aspx?id=<%#Eval("i_Id") %>"><%#Eval("nvc_Name")%></a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户编号：<%#Eval("nvc_UserNum")%></div>
              </ItemTemplate>
            </asp:Repeater>
          </div>
        </td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="Div1" runat="server" style="display: none;">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="15%" align="right">会员数量：</td>
        <td height="25">
          <asp:Label ID="Lb_MemberNumber" runat="server" Text="0"></asp:Label></td>
      </tr><input type="text" id="text_je" runat="server" class="input" visible="false" />
      <%--<tr>
        <td width="15%" align="right">优惠券来源：</td>
        <td height="25">
          <img src="images/notice.gif" style="cursor: pointer; vertical-align: middle; margin-left: 5px;" title="活动促销主题，若不填则为系统赠送" /></td>
      </tr>--%>
      <tr>
        <td valign="top" align="right"><font id="fHi_cb" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择优惠券种类</font></td>
        <td>
          <div class="coupontypelist">
            <%= div_CouponType %></div>
        </td>
      </tr>
      <tr style="display: none;">
        <td width="15%" align="right">发送短信通知：</td>
        <td height="25">
          <input type="checkbox" runat="server" id="cb_message" /></td>
      </tr>
      <tr style="display: none;">
        <td align="right" valign="top">短信内容：</td>
        <td>
          <textarea id="area_content" runat="server" style="width: 400px; height: 50px;"></textarea></td>
      </tr>
      <tr>
        <td width="15%">&nbsp;</td>
        <td height="25">
          <%if (pageadd)
            { %><asp:Button ID="Bt_Submit" runat="server" Text="确定" OnClientClick="return checkinput()" CssClass="button" OnClick="Bt_Submit_Click" /><%} %><input type="button" name="Submit4" value="返回继续选择" class="button" onclick="back();" /></td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  </form>
  <script type="text/javascript" src="js/ss.js"></script>
  <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript" language="javascript">
  var gxvalue = document.getElementById('Hi_cb');
  var rqvalue = document.getElementById('Hi_text');
  function clickcheckbox() {
    var s = "";
    var t = "";
    var cbs = document.getElementsByName('cb');
    for (var i = 0; i < cbs.length; i++) {
      if (cbs[i].checked) {
        s += "," + cbs[i].value;
        t += "," + document.getElementById('text_zs' + cbs[i].id.replace('cb', '')).value
      }
    }
    gxvalue.value = s;
    rqvalue.value = t;
  }
  function SelAll() {
    var inputs = document.getElementsByName("user_namess");
    var checkall = document.getElementById("checkall");
    for (var i = 0; i < inputs.length; i++) {
      inputs[i].checked = checkall.checked;
    }
  }
  function Selbox(obj) {
    var inputs = document.getElementsByName("user_namess");
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
  function checksubmit() {
    if (document.getElementById('Hi_search').value == "1") {
      var s = "";
      var shu = 0;
      var inputs = document.getElementsByName("user_namess");
      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked == true) {
          s += "," + inputs[i].value;
          shu++;
        }
      }
      if (s != "") {
        document.getElementById('formDiv').style.display = "none";
        document.getElementById('listDiv').style.display = "none";
        document.getElementById('Div1').style.display = "";
        document.getElementById('hi_users').value = s;
        document.getElementById('Lb_MemberNumber').innerHTML = shu;
        document.getElementById('Label1').style.color = "";
        document.getElementById('Label2').style.color = "red";
      }
      else {
        alert('请选择会员!');
      }
      return false;
    }
    else {
      return true;
    }
  }
  function back() {
    document.getElementById('formDiv').style.display = '';
    if (document.getElementById('Hi_search').value == "1") {
      document.getElementById('listDiv').style.display = '';
    }
    document.getElementById('Div1').style.display = 'none';
    document.getElementById('Label1').style.color = "red";
    document.getElementById('Label2').style.color = "";
  }
  function checkinput() {
    var ret = true;
    clickcheckbox();
    document.getElementById('fHi_cb').style.display = "none";
    if (document.getElementById('Hi_cb').value == "") {
      document.getElementById('fHi_cb').style.display = "";
      ret = false;
    }
    return ret;
  }
  function checknull(inputid, fontid) {

    if (document.getElementById(inputid).value != "") {
      document.getElementById(fontid).style.display = "none";
    }
    else {
      document.getElementById(fontid).style.display = "";
    }

  }
  //function checkkeynull()
  //{
  //    if(document.getElementById('user_namee').value=="")
  //    {
  //        alert('请输入关键字!');
  //        document.getElementById('user_namee').focus();
  //        return false;
  //    }
  //    return true;
  //}
</script>
