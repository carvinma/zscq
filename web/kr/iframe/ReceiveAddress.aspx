<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReceiveAddress.aspx.cs" Inherits="iframe_ReceiveAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link href="../css/processOld.css" rel="stylesheet" type="text/css" />
  <link href="../css/commonOld.css" rel="stylesheet" type="text/css" />
  <script src="../js/js.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <input type="hidden" runat="server" id="Hi_CType" value="1" />
  <script type="text/javascript">
    if (!window.parent.document.getElementById("if_address")) {
      window.location = '../user_shoporder1.aspx';
    }
  </script>
  <div id="buy_edit_persondata" class="buy_data" style="display: block;">
    <asp:Repeater ID="Rpt_Address" runat="server">
      <ItemTemplate>
        <dl>
          <dt style="text-align: center;">
            <input type="radio" name="address" onclick="changeaddress('<%# Eval("i_Id")%>','<%# Set_AddressName(Eval("i_PId"), Eval("i_CId"), Eval("i_AId"))%>&nbsp;&nbsp;<%# Eval("nvc_StreetAddress")%>&nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;받다）&nbsp;&nbsp;<%# Eval("nvc_MobilePhone")%>')" <%# Hi_AddressId.Value != Eval("i_Id").ToString() ? "" : " checked=\"checked\""%> /></dt>
          <dd>
            <%# Set_AddressName(Eval("i_PId"), Eval("i_CId"), Eval("i_AId"))%>&nbsp;&nbsp;<%# Eval("nvc_StreetAddress")%>&nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;받다）&nbsp;&nbsp;<%# Eval("nvc_TelPhone")%>&nbsp;&nbsp;<%# Hi_Mr.Value != Eval("i_Id").ToString() ? "<a href=\"?aid=" + Hi_AddressId.Value + "&PageType=mr&mid=" + Eval("i_Id") + "&ctype=" + Hi_CType.Value + "\">[기본값으로 설정]</a>" : "<span style=\"color:#e3441c;\">기본 위치</span>"%>&nbsp;&nbsp;<a href="?aid=<%= Hi_AddressId.Value %>&PageType=del&did=<%# Eval("i_Id")%>&ctype=<%= Hi_CType.Value %>" onclick="javascript:if(!window.confirm('삭제 확인？')){return false;}">[삭제]</a></dd>
        </dl>
      </ItemTemplate>
    </asp:Repeater>
    <dl>
      <dt><span class="red">*</span>받은 사람：</dt>
      <dd>
        <input class="buy_data_input" runat="server" id="text_shouhuoren" type="text" name="" value="" placeholder=""></dd>
    </dl>
    <dl>
      <dt><span class="red">&nbsp;</span>상용 이메일：</dt>
      <dd>
        <input class="buy_data_input" runat="server" id="text_dianziyoujian" type="text" name="" value="" placeholder="">
      </dd>
    </dl>
    <dl>
      <dt><span class="red">*</span>받는사람  핸드폰：</dt>
      <dd>
        <input runat="server" id="text_shoujihaoma" maxlength="11" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" class="buy_data_input" type="text" name="" value="" placeholder="">
        <div class="buy_data_txt">
          전화：</div>
        <input runat="server" id="text_gudingdianhua" class="buy_data_input" type="text" name="" value="" placeholder="">
        <div class="buy_data_txt">
          格式：区位-电话号码</div>
      </dd>
    </dl>
    <dl>
      <dt><span class="red">*</span>수신자 지역：</dt>
      <dd>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
          <ContentTemplate>
            <asp:DropDownList ID="ddlsheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsheng_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlshi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlshi_SelectedIndexChanged">
              <asp:ListItem Value="0">선택</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlqu" runat="server">
              <asp:ListItem Value="0">선택</asp:ListItem>
            </asp:DropDownList>
          </ContentTemplate>
        </asp:UpdatePanel>
      </dd>
    </dl>
    <dl>
      <dt><span class="red">*</span>상세한 주소
：</dt>
      <dd>
        <input runat="server" id="text_shouhuodizhi" class="buy_data_input" type="text" name="" value="" placeholder="">
        <div class="buy_data_txt">
          상세한 주소를 입력해주세요 최고로 50글자  입력할수있습니다</div>
      </dd>
    </dl>
    <dl>
      <dt><span class="red">&nbsp;</span>우편번호：</dt>
      <dd>
        <input class="buy_data_input" runat="server" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" id="text_youzhengbianma" maxlength="6" type="text" name="" value="" placeholder="">
      </dd>
    </dl>
    <dl>
      <dt>&nbsp;</dt>
      <dd>
        <asp:Button ID="Bt_Update" runat="server" Text="保存现有地址" OnClientClick="return CheckSubmit()" OnClick="Bt_Update_Click" CssClass="button108_28" />&nbsp;&nbsp;<asp:Button ID="Bt_Add" runat="server" Text="添加为新地址" OnClick="Bt_Add_Click" OnClientClick="return CheckSubmit()" CssClass="button108_28" />
      </dd>
    </dl>
  </div>
  <script type="text/javascript" language="javascript">
    window.parent.document.getElementById("if_address").style.height = document.body.scrollHeight + "px"; //+ 730
  </script>
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
  function changeaddress(v, v2) {
    window.parent.obj('Hi_AddressId').value = v;
    if (obj('Hi_CType').value == "1") {
      window.parent.obj('div_ReceiveAddress').innerHTML = v2;
      window.parent.checkaddress(1);
    }
  }
</script>
