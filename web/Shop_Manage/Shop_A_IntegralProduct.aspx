<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_IntegralProduct.aspx.cs" Inherits="Shop_Manage_Shop_A_IntegralProduct" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
  <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" language="javascript" src="js/Calendar.js"></script>
  <script type="text/javascript" src="js/vcom.js"></script>
  <style type="text/css">
    .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
    .alertfont img { margin-bottom: -3px; }
  </style>
  <style type="text/css">
    .uploaddiv2 { float: left; width: 220px; position: relative; text-align: center; border: solid 1px green; }
    .uploaddiv2:hover { color: green; }
    .upload2 { cursor: pointer; border: none; width: 140px; height: 22px; filter: alpha(opacity=0); opacity: 0.0; -moz-opacity: 0.0; position: absolute; left: 0; top: 0; }
  </style>
  <script type="text/javascript">
    function IsDigit() {
      return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
    }  
  </script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" name="form" runat="server" method="post">
  <asp:ScriptManager runat="server">
  </asp:ScriptManager>
  <input type="hidden" id="Hi_Id" runat="server" value="0" />
  <h1>
    <span class="action-span"><a href="Shop_M_IntegralProduct.aspx?<%=returnurl %>">积分商品列表</a></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 添加积分商品</span>
    <div style="clear: both; text-align: right;">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="list-div" id="listDiv">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="3">
          基本信息
        </th>
      </tr>
      <tr>
        <td width="12%" align="right"><b>语言版本：</b> </td>
        <td>
          <asp:DropDownList ID="ddl_language" runat="server">
          </asp:DropDownList>
          <font color="#FF0000">(注：若不填则系统默认为中国设置)</font> </td>
        <td>&nbsp;</td>
      </tr>
      <tr id="tr_Type">
        <td align="right">类别： </td>
        <td>
          <asp:DropDownList ID="ddl_type" runat="server" onchange="changetrshow();">
            <asp:ListItem Value="1">积分商品</asp:ListItem>
            <asp:ListItem Value="2">优惠券商品</asp:ListItem>
            <asp:ListItem Value="3">会员等级商品</asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
      </tr>
        <tr id="tr_ProductType">
        <td align="right">商品分类： </td>
        <td>
          <asp:DropDownList ID="ddl_ProductType" runat="server" onblur="checknull('ddl_ProductType','fddl_ProductType')">
          </asp:DropDownList>
          &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fddl_ProductType" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择商品分类</font> </td>
        <td>&nbsp;</td>
      </tr>
      <tr id="tr_MGrade">
        <td align="right">会员等级： </td>
        <td>
          <asp:DropDownList ID="ddl_MGrade" runat="server" onblur="checknull('ddl_MGrade','fddl_MGrade')">
          </asp:DropDownList>
          &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fddl_MGrade" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择会员等级</font> </td>
        <td>&nbsp;</td>
      </tr>
      <tr id="tr_Coupont">
        <td align="right">优惠券种类： </td>
        <td>
          <asp:DropDownList ID="ddl_Coupontype" runat="server" onblur="checknull('ddl_Coupontype','fddl_Coupontype')">
          </asp:DropDownList>
          &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fddl_Coupontype" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择优惠券种类</font> </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">商品名称： </td>
        <td>
          <input type="text" runat="server" maxlength="50" id="text_head0" class="inputs200text" onblur="checknull('text_head0','ftext_head0')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_head0" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写商品名称</font> </td>
        <td rowspan="7" valign="top">
          <input runat="server" type="hidden" id="ifrimg" />
          <iframe src="Shop_A_IntegralProduct_Img.aspx" height="180" width="240" frameborder="0" scrolling="no"></iframe>
        </td>
      </tr>
        <tr>
        <td align="right">商品类型： </td>
        <td>
          <input type="text" runat="server" maxlength="50" id="text1" class="inputs200text" onblur="checknull('text_head0','ftext_head0')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="Font1" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择商品类型</font> </td>
        <td rowspan="7" valign="top">
           <asp:DropDownList ID="DropDownList1" runat="server">
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td align="right">排序编号： </td>
        <td>
          <input type="text" id="hw_xu" class="inputs60text" value="0" runat="server" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled" maxlength="9" />&nbsp;<img src="images/ico_notice.gif" title="注：输入数字" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="hw_xu" runat="server" SetFocusOnError="true" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align="right">浏览量： </td>
        <td>
          <input id="hw_views" type="text" class="inputs60text" value="0" maxlength="9" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" runat="server" />&nbsp;<img src="images/ico_notice.gif" title="注：输入数字" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="hw_views" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align="right">已兑换： </td>
        <td>
          <input id="hw_buys" type="text" class="inputs60text" maxlength="9" value="0" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" runat="server" />&nbsp;<img src="images/ico_notice.gif" title="注：输入数字，已有多少人兑换，只用于前台显示" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="hw_buys" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align="right">兑换所需积分： </td>
        <td>
          <input id="hw_price2" type="text" class="inputs60text" maxlength="9" value="" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" style="ime-mode: disabled;" runat="server" />&nbsp;<img src="images/ico_notice.gif" title="注：输入数字" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="hw_price2" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align="right">
          <label for="is_shangjia">
            是否显示：</label></td>
        <td>
          <input type="checkbox" id="is_shangjia" name="is_shangjia" value="checkbox" checked="checked" runat="server" />
        </td>
      </tr>
      <tr style="display: none;">
        <td align="right">
          <label for="cb_tj">
            是否推荐：</label></td>
        <td>
          <input type="checkbox" id="cb_tj" name="cb_tj" value="" runat="server" /></td>
      </tr>
         <tr>
        <td align="right" valign="top">商品提示： </td>
        <td colspan="2" style="width:88%;">
          <script id="uetip" type="text/plain" name="myTip">
          <%=content%>
          </script>
          <script type="text/javascript">
              var editor = new baidu.editor.ui.Editor();
              editor.render('uetip');
          </script>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">商品简介： </td>
        <td colspan="2" style="width:88%;">
          <script id="uecontent" type="text/plain" name="myContent">
          <%=content%>
          </script>
          <script type="text/javascript">
            var editor = new baidu.editor.ui.Editor();
            editor.render('uecontent');
          </script>
        </td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <div class="list-div" style="width: 100%; z-index: 9999; position: fixed; left: 0; bottom: 0px; height: 30px;">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="100" align="center">&nbsp; </td>
        <td align="left">
          <% if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))
             { %><asp:Button ID="Bt_submit" runat="server" Text="提交" OnClick="Bt_submit_Click" OnClientClick="return checkinput()" CssClass="button" /><%} %>
          <%if (Hi_Id.Value != "0")
            { %><input type="button" onclick="javascript:window.location='Shop_M_IntegralProduct.aspx?<%=returnurl %>';" value="返回" class="button" /><%} %>
        </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
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
    document.getElementById("checkproduct").style.top = (top1 + 40) + 'px';
  }
</script>
<script type="text/javascript" language="javascript">
  var tupian = "<IMG alt=警告 src=\"images/caozuo_3.jpg\" width=15 >";
  var dianji = 0;
  var pnumber = 0;
  function checkinput() {
    if (dianji == 0) {
      dianji = 1;
    }
    var flag = true;

    $("#fddl_MGrade").attr("style", "display: none;");
    $("#fddl_Coupontype").attr("style", "display: none;");

    if ($("#ddl_type").val() == "1") {
        if ($("#ddl_ProductType").val() == "") {
            $("#fddl_ProductType").attr("style", "display: ;");
            flag = false;
        }
        else {
            $("#ddl_ProductType").attr("style", "display: none;");
        }
    }
    if ($("#ddl_type").val() == "2") {
      if ($("#ddl_Coupontype").val() == "") {
        $("#fddl_Coupontype").attr("style", "display: ;");
        flag = false;
      }
      else {
        $("#fddl_Coupontype").attr("style", "display: none;");
      }
    }
    if ($("#ddl_type").val() == "3") {
      if ($("#ddl_MGrade").val() == "") {
        $("#fddl_MGrade").attr("style", "display: ;");
        flag = false;
      }
      else {
        $("#fddl_MGrade").attr("style", "display: none;");
      }
    }
    $("#ftext_head").attr("style", "display: none;"); //block
    $("#fhw_sn").attr("style", "display: none;"); //
    $("#font_Times").attr("style", "display: none;"); //
    for (var i = 0; i < 4; i++) {
      var thead = $("#text_head" + i).val();
      if (thead == "") {
        $("#ftext_head" + i).attr("style", "display: ;");
        flag = false;
      } else {
        $("#ftext_head" + i).attr("style", "display: none;");
      }
    }



    if (pnumber != 1) {
    } else {
      flag = false;
    }
    //tuan_start_date,tuan_end_date
    var stime = $("#tuan_start_date").val();
    var etime = $("#tuan_end_date").val();
    if (stime == "" || etime == "") {
      $("#font_Times").attr("style", "display: ;");
      flag = false;
    } else {
      $("#font_Times").attr("style", "display: none;");
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
</script>
<script type="text/javascript">
  function changetrshow() {
    var type = $("#ddl_type").val();
    if (type == "1") {
      $("#tr_MGrade").hide();
      $("#tr_Coupont").hide();
      $("#tr_ProductType").show();
    }
    if (type == "2") {
        $("#tr_MGrade").hide();
        $("#tr_Coupont").show();
        $("#tr_ProductType").hide();
    }
    if (type == "3") {
      $("#tr_MGrade").show();
      $("#tr_Coupont").hide();
      $("#tr_ProductType").hide();

    }
  }
  changetrshow();
</script>
