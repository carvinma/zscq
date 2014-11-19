<%@ Control Language="C#" AutoEventWireup="true" CodeFile="zscqAddress.ascx.cs" Inherits="ascx_zscqAddress" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
    <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
    <input type="hidden" runat="server" id="Hi_Mr" value="0" />
    <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
    <table id="div_address1" width="100%" border="0" cellspacing="0" cellpadding="0">
      <asp:Repeater ID="Rpt_Address" runat="server" OnItemCommand="Rpt_Address_ItemCommand" OnItemDataBound="Rpt_Address_ItemDataBound">
        <ItemTemplate>
          <tr>
            <td height="45" align="right">
              <input type="radio" name="address" onclick="changeaddress('<%# Eval("i_Id")%>')" <%# Hi_AddressId.Value != Eval("i_Id").ToString() ? "" : " checked=\"true\""%> />
            </td>
            <td>
              <%#Eval("countryName")%>
              <%#Eval("provinceName")%>
              <%#Eval("cityName")%>
              <%#Eval("areaName")%>
              <%#Eval("nvc_StreetAddress")%>
               &nbsp;&nbsp;（邮编:<%# Eval("nvc_ZipCode")%>）
              &nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;收）&nbsp;&nbsp;<%# Eval("nvc_TelPhone")%>&nbsp;&nbsp;
              <asp:LinkButton ID="lbtn_SetMr" runat="server" CommandName="SETMR" CommandArgument='<%# Eval("i_Id")%>'>[删除]</asp:LinkButton>
              &nbsp;&nbsp;
              <asp:LinkButton ID="lbtn_Delete" runat="server" CommandName="DELETE" CommandArgument='<%# Eval("i_Id")%>' OnClientClick="javascript:if(!window.confirm('确认删除？')){return false;}">[删除]</asp:LinkButton>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="40" align="right" width="100">&nbsp; </td>
        <td align="left"><img src="images/dzadd.jpg" onclick="showaddr(this)" /> </td>
      </tr>
    </table>
    <table id="div_address0" width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none;">
      <tr>
        <td height="40" align="right" width="100"><span style="color: Red;">*</span>收件人姓名： </td>
        <td align="left">
          <input type="text" runat="server" name="s5" id="text_shouhuoren" class="font12000" maxlength="30" />
        </td>
      </tr>
      <tr>
        <td height="40" align="right" width="100">收件人手机： </td>
        <td align="left">
          <input type="text" runat="server" name="s2" id="text_shoujihaoma" class="font12000" maxlength="11" />
        </td>
      </tr>
      <tr>
        <td height="40" align="right" width="100"><span style="color: Red;">*</span>固定电话： </td>
        <td align="left">
          <input type="text" runat="server" name="s3" id="text_gudingdianhua" class="font12000" maxlength="50" />
          格式：区号-电话号码 </td>
      </tr>
      <tr>
        <td height="40" align="right" width="100"><span style="color: Red;">*</span>所属国家： </td>
        <td align="left">
          <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
              <asp:DropDownList ID="ddl_guojia" runat="server">
              </asp:DropDownList>
             <%-- <asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
                <asp:ListItem Value=" ">请选择省</asp:ListItem>
              </asp:DropDownList>
              <asp:DropDownList ID="ddl_shi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_shi_SelectedIndexChanged">
                <asp:ListItem Value=" ">请选择市/区</asp:ListItem>
              </asp:DropDownList>
              <asp:DropDownList ID="ddl_qu" runat="server">
                <asp:ListItem Value=" ">请选择区/县</asp:ListItem>
              </asp:DropDownList>--%>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
      </tr>
      <tr>
        <td height="40" align="right" width="100"><span style="color: Red;">*</span>详细地址： </td>
        <td align="left" class="huizi">
          <input type="text" runat="server" name="s4" id="text_shouhuodizhi" class="font12000s" maxlength="50" />
          &nbsp;&nbsp; </td>
      </tr>
      <tr>
        <td height="40" align="right" width="100"><span style="color: Red;">*</span>邮政编码： </td>
        <td align="left">
          <input type="text" runat="server" name="s6" id="text_youzhengbianma" class="font12000" maxlength="6" />
        </td>
      </tr>
      <tr>
        <td height="40" align="right" width="100">是否默认： </td>
        <td align="left">
          <asp:CheckBox ID="CB_Mr" runat="server" />
        </td>
      </tr>
      <tr>
        <td height="40" align="right">&nbsp; </td>
        <td align="left">
          <asp:ImageButton ID="ibtn_Add" runat="server" ImageUrl="../images/user_zl_b5.gif" Width="85" Height="29" OnClientClick="return CheckAddress()" OnClick="ibtn_Add_Click" />
        </td>
      </tr>
    </table>
  </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">
  function showaddr(o) {
    if (document.getElementById("div_address0").style.display == "") {
      o.src = "images/dzadd.jpg";
      document.getElementById("div_address0").style.display = "none";
    } else {
      document.getElementById("div_address0").style.display = "";
      o.src = "images/dzqx.jpg";
    }
  }
  function changeaddress(v) {
    document.getElementById('<%= Hi_AddressId.ClientID %>').value = v;
  }
  function CheckAddress() {
    if (document.getElementById('<%=text_shouhuoren.ClientID %>').value == "") {
      alert("请填写收件人!");
      document.getElementById('<%=text_shouhuoren.ClientID %>').focus();
      return false;
  }
  if (document.getElementById('<%=text_gudingdianhua.ClientID %>').value == "") {
      alert("请填写电话!");
      document.getElementById('<%=text_gudingdianhua.ClientID %>').focus();
      return false;
  }
//    if (document.getElementById('<%=text_shoujihaoma.ClientID %>').value == "") {
//      alert("请填写手机号!");
//      document.getElementById('<%=text_shoujihaoma.ClientID %>').focus();
//      return false;
//    }
//    if (/^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/.test(document.getElementById('<%=text_shoujihaoma.ClientID %>').value) == false) {
//      alert('手机号码格式有误!');
//      document.getElementById('<%=text_shoujihaoma.ClientID %>').focus();
//      return false;
//    }
    if (document.getElementById('<%=ddl_guojia.ClientID %>').value == "0") {
      document.getElementById('<%=ddl_guojia.ClientID %>').focus();
      alert("请选择国家!");
      return false;
    }
    
    if (document.getElementById('<%=text_shouhuodizhi.ClientID %>').value == "") {
      alert("请填写详细地址!");
      document.getElementById('<%=text_shouhuodizhi.ClientID %>').focus();
      return false;
    }
    if (document.getElementById('<%=text_youzhengbianma.ClientID %>').value == "") {
      alert("请填写邮编!");
      document.getElementById('<%=text_youzhengbianma.ClientID %>').focus();
      return false;
    }
    if (/[0-9]{1,6}/.test(document.getElementById('<%=text_youzhengbianma.ClientID %>').value) == false) {
      alert("只能填写数字!");
      document.getElementById('<%=text_youzhengbianma.ClientID %>').focus();
      return false;
    }
  }
</script>
