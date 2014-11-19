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
            <input type="radio" name="address" onclick="changeaddress('<%# Eval("i_Id")%>','<%# Set_AddressName(Eval("i_PId"), Eval("i_CId"), Eval("i_AId"))%>&nbsp;&nbsp;<%# Eval("nvc_StreetAddress")%>&nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;収）&nbsp;&nbsp;<%# Eval("nvc_MobilePhone")%>')" <%# Hi_AddressId.Value != Eval("i_Id").ToString() ? "" : " checked=\"checked\""%> /></dt>
          <dd>
            <%# Set_AddressName(Eval("i_PId"), Eval("i_CId"), Eval("i_AId"))%>&nbsp;&nbsp;<%# Eval("nvc_StreetAddress")%>&nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;収）&nbsp;&nbsp;<%# Eval("nvc_TelPhone")%>&nbsp;&nbsp;<%# Hi_Mr.Value != Eval("i_Id").ToString() ? "<a href=\"?aid=" + Hi_AddressId.Value + "&PageType=mr&mid=" + Eval("i_Id") + "&ctype=" + Hi_CType.Value + "\">[デフォルト設定]</a>" : "<span style=\"color:#e3441c;\">デフォルトのアドレス</span>"%>&nbsp;&nbsp;<a href="?aid=<%= Hi_AddressId.Value %>&PageType=del&did=<%# Eval("i_Id")%>&ctype=<%= Hi_CType.Value %>" onclick="javascript:if(!window.confirm('削除の確認？')){return false;}">[削除]</a></dd>
        </dl>
      </ItemTemplate>
    </asp:Repeater>
    <dl>
      <dt><span class="red">*</span>受取人名前：</dt>
      <dd>
        <input class="buy_data_input" runat="server" id="text_shouhuoren" type="text" name="" value="" placeholder=""></dd>
    </dl>
    <dl>
      <dt><span class="red">&nbsp;</span>よく使うメールボックス：</dt>
      <dd>
        <input class="buy_data_input" runat="server" id="text_dianziyoujian" type="text" name="" value="" placeholder="">
      </dd>
    </dl>
    <dl>
      <dt><span class="red">*</span>受取人携帯：</dt>
      <dd>
        <input runat="server" id="text_shoujihaoma" maxlength="11" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" class="buy_data_input" type="text" name="" value="" placeholder="">
        <div class="buy_data_txt">
          或固定電話：</div>
        <input runat="server" id="text_gudingdianhua" class="buy_data_input" type="text" name="" value="" placeholder="">
        <div class="buy_data_txt">
          </div>
      </dd>
    </dl>
    <dl>
      <dt><span class="red">*</span>受取人地域：</dt>
      <dd>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
          <ContentTemplate>
            <asp:DropDownList ID="ddlsheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsheng_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlshi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlshi_SelectedIndexChanged">
              <asp:ListItem Value="0">選択して下さい</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlqu" runat="server">
              <asp:ListItem Value="0">選択して下さい</asp:ListItem>
            </asp:DropDownList>
          </ContentTemplate>
        </asp:UpdatePanel>
      </dd>
    </dl>
    <dl>
      <dt><span class="red">*</span>詳細アドレス：</dt>
      <dd>
        <input runat="server" id="text_shouhuodizhi" class="buy_data_input" type="text" name="" value="" placeholder="">
        <div class="buy_data_txt">
          詳細住所を記入して下さい（50文字以内）</div>
      </dd>
    </dl>
    <dl>
      <dt><span class="red">&nbsp;</span>郵便番号：</dt>
      <dd>
        <input class="buy_data_input" runat="server" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" id="text_youzhengbianma" maxlength="6" type="text" name="" value="" placeholder="">
      </dd>
    </dl>
    <dl>
      <dt>&nbsp;</dt>
      <dd>
        <asp:Button ID="Bt_Update" runat="server" Text="保存の既存のアドレス" OnClientClick="return CheckSubmit()" OnClick="Bt_Update_Click" CssClass="button108_28" />&nbsp;&nbsp;<asp:Button ID="Bt_Add" runat="server" Text="新しい住所添加" OnClick="Bt_Add_Click" OnClientClick="return CheckSubmit()" CssClass="button108_28" />
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
