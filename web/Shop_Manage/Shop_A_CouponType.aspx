<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_A_CouponType.aspx.cs" Inherits="ihome_manage_shop_yhjclass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .alertfont { border: solid 1px #fe8686; padding: 1px; background: #dfeef5; color: #fe4343; }
        .alertfont img { margin-bottom: -3px; }
    </style>
    <script type="text/javascript" src="js/vcom.js"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript">
        function IsDigit() {
            return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
        }   
    </script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <input type="hidden" runat="server" id="Hi_Id" value="0" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h1>
        <span class="action-span"><a id="aa" href="Shop_M_CouponType.aspx?<%=returnurl %>">优惠券种类列表</a></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span>
        <span id="search_id" class="action-span1">- 优惠券种类添加 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加优惠券种类
                </th>
            </tr>
            <%--<tr>
        <td width="45%" height="25" align="right">
          使用范围：
        </td>
        <td width="55%">
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              <asp:DropDownList ID="DDL_Type" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_Type_SelectedIndexChanged"
                Visible="false">
                <asp:ListItem Value="0">请选择</asp:ListItem>
                <asp:ListItem Value="1">品牌券</asp:ListItem>
                <asp:ListItem Value="3">全场券</asp:ListItem>
              </asp:DropDownList>
              <asp:DropDownList ID="DDL_BrandOrCategory" runat="server" AppendDataBoundItems="True" Visible="false">
              </asp:DropDownList>
              &nbsp;<font color="#FF0000">*</font>&nbsp;<font id="fDDL_Type" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg"
                width="15" />请选择使用范围</font>
            </ContentTemplate>
          </asp:UpdatePanel>
        </td>
      </tr>--%>
            <tr>
                <td height="25" align="right" valign="middle">
                    优惠券种类名称：
                </td>
                <td>
                    <div style="line-height: 28px;">
                        中文名称：<input type="text" runat="server" id="text_name" maxlength="150" class="inputs200text" onblur="checknull('text_name','ftext_name')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_name" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写优惠券种类名称</font>
                    </div>
                    <div style="line-height: 28px;">
                        英文名称：<input type="text" runat="server" id="text_enname" maxlength="150" class="inputs200text" onblur="checknull('text_enname','ftext_enname')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_enname" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写优惠券种类名称</font>
                    </div>
                    <div style="line-height: 28px;">
                        日文名称：<input type="text" runat="server" id="text_jpname" maxlength="150" class="inputs200text" onblur="checknull('text_jpname','ftext_jpname')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_jpname" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写优惠券种类名称</font>
                    </div>
                    <div style="line-height: 28px;">
                        韩文名称：<input type="text" runat="server" id="text_krname" maxlength="150" class="inputs200text" onblur="checknull('text_krname','ftext_krname')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_krname" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写优惠券种类名称</font>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    有效时长：
                </td>
                <td height="25">
                    <asp:DropDownList ID="ddl_TimeLength" runat="server" onblur="checknull('ddl_TimeLength','fddl_TimeLength')">
                    </asp:DropDownList>
                    <font color="#FF0000">*</font>&nbsp;<font id="fddl_TimeLength" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择有效时长</font>
                </td>
            </tr>
            <%--<tr>
        <td height="25" align="right">代购金额(中RMB)： </td>
        <td>
          <%--<input type="text" visible="false" maxlength="9" runat="server" id="text_where0" style="ime-mode: disabled;" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_where0','ftext_where0')" />--%>
            <%--&nbsp;抵兑&nbsp;--%>
            <%--<input type="text" runat="server" maxlength="9" id="text_money0" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_money0','ftext_money0')" />(其他币种自动换算)&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_where0" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写购物满金额</font>&nbsp;<font id="ftext_money0" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写抵兑金额</font> </td>
      </tr>--%>
            <tr>
                <td height="25" align="right">
                    代购金额(美USD)：
                </td>
                <td>
                    <input type="text" visible="false" maxlength="9" runat="server" id="text_where1" style="ime-mode: disabled;" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_where1','ftext_where1')" />
                    &nbsp;抵兑&nbsp;
                    <input type="text" runat="server" maxlength="9" id="text_money1" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_money1','ftext_money1')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_where1" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写购物满金额</font>&nbsp;<font id="ftext_money1" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写抵兑金额</font>
                </td>
            </tr>
            <%-- <tr style="display: none;">
        <td height="25" align="right">代购金额(日JPY)： </td>
        <td>
          <input type="text" visible="false" maxlength="9" runat="server" id="text_where2" style="ime-mode: disabled;" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_where2','ftext_where2')" />
           &nbsp;抵兑&nbsp;
          <input type="text" runat="server" maxlength="9" id="text_money2" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_money2','ftext_money2')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_where2" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写购物满金额</font>&nbsp;<font id="ftext_money2" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写抵兑金额</font> </td>
      </tr>
      <tr style="display: none;">
        <td height="25" align="right">代购金额(韩KRW)： </td>
        <td>
          <input type="text" visible="false" maxlength="9" runat="server" id="text_where3" style="ime-mode: disabled;" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_where3','ftext_where3')" />
          &nbsp;抵兑&nbsp;
          <input type="text" runat="server" maxlength="9" id="text_money3" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_money3','ftext_money3')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_where3" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写购物满金额</font>&nbsp;<font id="ftext_money3" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写抵兑金额</font> </td>
      </tr>
      <tr style="display: none;">
        <td height="25" align="right">代购金额(欧EUR)： </td>
        <td>
          <input type="text" visible="false" maxlength="9" runat="server" id="text_where4" style="ime-mode: disabled;" class="inputs60text" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_where4','ftext_where4')" />
          &nbsp;抵兑&nbsp;
          <input type="text" runat="server" maxlength="9" id="text_money4" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_money4','ftext_money4')" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_where4" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写购物满金额</font>&nbsp;<font id="ftext_money4" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写抵兑金额</font> </td>
      </tr>--%>
            <tr id="Tr_NeedIntegral" runat="server" visible="false">
                <td align="right">
                    兑换所需积分：
                </td>
                <td>
                    <input type="text" runat="server" maxlength="9" id="text_NeedJifen" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_NeedJifen','ftext_NeedJifen')" value="0" />&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_NeedJifen" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写兑换所需积分</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    注册赠送张数：
                </td>
                <td>
                    <input type="text" runat="server" maxlength="9" id="text_RegGiveNumber" class="inputs60text" style="ime-mode: disabled;" onkeydown="event.returnValue=IsDigit()" onkeyup="this.value = this.value.replace(/\D/g, '')" onblur="checknull('text_RegGiveNumber','ftext_RegGiveNumber')" value="0" />&nbsp;<font color="#FF0000">注：0为不赠送</font> <font color="#FF0000">*</font>&nbsp;<font id="ftext_RegGiveNumber" class="alertfont" style="display: none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写兑换所需积分</font>
                </td>
            </tr>
            <tr>
                <td height="25" align="center">
                    &nbsp;
                </td>
                <td height="22" align="left">
                    <%if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))
                      {%><asp:Button ID="btnadd" runat="server" Text="提交" CssClass="button" OnClick="btnadd_Click" OnClientClick="return checkaddtotime()" /><%}%>
                    <% if (Hi_Id.Value != "0")
                       { %><input type="button" class="button" value="返回" onclick="javascript:window.location='Shop_M_CouponType.aspx?<%=returnurl %>'" /><%} %>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server">
    </div>
    </form>
         <!-- #include file="push.html" -->
</body>
</html>
<script language="JavaScript" type="text/JavaScript">
    var dianji = 0;
    function checkaddtotime() {
        if (dianji == 0) {
            dianji = 1;
        }
        var ret = true;
        //    document.getElementById('fDDL_Type').style.display = "none";
        //    document.getElementById('ftext_where').style.display = "none";

        document.getElementById('ftext_name').style.display = "none";
        document.getElementById('ftext_enname').style.display = "none";
        document.getElementById('ftext_jpname').style.display = "none";
        document.getElementById('ftext_krname').style.display = "none";
        document.getElementById('fddl_TimeLength').style.display = "none";

        if (document.getElementById('text_name').value == "") {
            document.getElementById('ftext_name').style.display = "";
            document.getElementById('text_name').focus();
            ret = false;
        }
        if (document.getElementById('text_enname').value == "") {
            document.getElementById('ftext_enname').style.display = "";
            document.getElementById('text_enname').focus();
            ret = false;
        }
        if (document.getElementById('text_jpname').value == "") {
            document.getElementById('ftext_jpname').style.display = "";
            document.getElementById('text_jpname').focus();
            ret = false;
        }
        if (document.getElementById('text_krname').value == "") {
            document.getElementById('ftext_krname').style.display = "";
            document.getElementById('text_krname').focus();
            ret = false;
        }
        if (document.getElementById('ddl_TimeLength').value == "" || document.getElementById('ddl_TimeLength').value == "0") {
            document.getElementById('fddl_TimeLength').style.display = "";
            document.getElementById('ddl_TimeLength').focus();
            ret = false;
        }
        for (var i = 0; i < 5; i++) {
            document.getElementById("ftext_money" + i).style.display = "none";
            if (document.getElementById("text_money" + i).value == "") {
                document.getElementById("ftext_money" + i).style.display = "";
                document.getElementById("text_money" + i).focus();
                ret = false;
            }
            //      if (document.getElementById("text_where" + i).value == "") {
            //        document.getElementById("ftext_where" + i).style.display = "";
            //        document.getElementById("text_where" + i).focus();
            //        ret = false;
            //      }
        }
        //    if (document.getElementById("text_NeedJifen").value == "") {
        //      document.getElementById("ftext_NeedJifen").style.display = "";
        //      document.getElementById("text_NeedJifen").focus();
        //      ret = false;
        //    }
        document.getElementById("ftext_RegGiveNumber").style.display = "none";
        if (document.getElementById("text_RegGiveNumber").value == "") {
            document.getElementById("ftext_RegGiveNumber").style.display = "";
            document.getElementById("text_RegGiveNumber").focus();
            ret = false;
        }
        //    if (document.getElementById('DDL_Type').value == "0" || (document.getElementById('DDL_BrandOrCategory') && document.getElementById('DDL_BrandOrCategory').value == "0")) {
        //      document.getElementById('fDDL_Type').style.display = "";
        //      document.getElementById('DDL_Type').focus();
        //      ret = false;
        //    }
        return ret;
    }
    function checknull(inputid, fontid) {

        if (inputid == "ddl_TimeLength") {
            if (document.getElementById('ddl_TimeLength').value == "" || document.getElementById('ddl_TimeLength').value == "0") {
                document.getElementById('fddl_TimeLength').style.display = "";
            }
            else {
                document.getElementById('fddl_TimeLength').style.display = "none";
            }
        }
        else {
            if (document.getElementById(inputid).value != "") {
                document.getElementById(fontid).style.display = "none";
            }
            else {
                document.getElementById(fontid).style.display = "";
            }
        }

    }
</script>
