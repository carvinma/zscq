<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_TradeMark.aspx.cs" ValidateRequest="false" Inherits="Shop_Manage_Shop_A_Patent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <style type="text/css">
    .alertfont
    {
	    border: solid 1px #fe8686;
	    padding: 1px;
	    background: #dfeef5;
	    color: #fe4343;
    }
    .alertfont img
    {
	    margin-bottom:-3px;
    }
    </style>
    <style type="text/css">
    .colordiv
    {
    	border:solid 1px #8dcff4;
    	width:16px;
    	height:16px;
    	padding:1px;
    	float:left;
    	margin-right:5px;
    	cursor:pointer;
    }
    .colordiv:hover
    {
    	border:solid 1px #e8641b;
    }
    .colordiv img
    {
    	width:16px;
    	height:16px;
    }
    .colordivselect
    {
    	padding:1px;
    	float:left;
    	margin-right:5px;
    	cursor:pointer;
    	width:32px;
    	height:32px;
    	border:solid 1px #e8641b;
    }
    .colordivselect img
    {
    	width:32px;
    	height:32px;
    }
    </style>
      <script type="text/javascript">
          function IsDigit() {
              return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
          }

          function IsDigit1() {
              return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46 || ((event.keyCode >= 65) && (event.keyCode <= 90)));
          }      
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
            <input type="hidden" id="hd_id" runat="server" value="0" />
            <input type="hidden" id="hd_userId" runat="server" value="0" />
             <input type="hidden" id="hi_n_a" runat="server" value="" />
        <h1>
            <span class="action-span"><a href="Shop_M_Trademark.aspx?<%=returnurl %>">商标列表</a></span> <span class="action-span1"><a
                    href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1"> - <%=PageType%></span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="list-div" id="Div2">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th colspan="2">
                         <%=PageType%>信息
                    </th>
                </tr>
                 <tr>
                    <td width="276" height="26" align="right">会员编号：</td>
                    <td  height="26">
                    <input type="text" runat="server" id="txt_MemberId" class="inputs200text" maxlength="11" onblur="checknull('txt_MemberId','txt_MemberIdFont');CheckUserMember();" />
                    &nbsp;<font color="#FF0000">*</font>
                    <font id="txt_MemberIdFont" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>    
                    </td>
                </tr>
                   <%-- <tr>
                    <td height="26" align="right">国籍：</td>
                    <td height="26">
                        <asp:DropDownList ID="dd_guoji" runat="server" onchange="checkguoji();">
                        </asp:DropDownList>
                    &nbsp;<font color="#FF0000">*</font>
                    <font id="Font1" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>    
                    </td>
                </tr>
                     <tr>
                    <td width="200" height="26" align="right">选择类型：</td>
                    <td height="26">
                        <asp:DropDownList ID="dd_type" runat="server" onchange="checkguoji();">
                            <asp:ListItem Value="1">个人</asp:ListItem>
                            <asp:ListItem Value="2">企业</asp:ListItem>
                            <asp:ListItem Value="3">代理组织机构</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr> 
                <tr id="idcard">
                    <td width="200" height="26" align="right">身份证号码：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_IdCard" class="inputs200text"/>
                    </td>
                </tr>
                 <tr id="idcardEn" style="display:none;">
                    <td width="200" height="26" align="right">有效证件：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_Idyouxiao" class="inputs200text"/>
                    </td>
                </tr>
                 <tr id="company" style="display:none;">
                    <td width="200" height="26" align="right">公司名称：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_companyname" class="inputs200text" />
                    </td>
                </tr>
                   <tr id="companyEn" style="display:none;">
                    <td width="200" height="26" align="right">公司名称英文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_companynameEn" class="inputs200text"/>
                    </td>
                </tr>
                 <tr id="addressEn" style="display:none;">
                    <td width="200" height="26" align="right">联系人地址英文：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_addressEn" class="inputs400text"/>
                    </td>
                </tr>
                <tr id="dailiname" style="display:none;">
                    <td height="26" align="right">代理机构名称：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_dailiname" class="inputs200text" maxlength="50" onblur="checknull('t_dailiname','t_dailinameFont')" />
                    &nbsp;<font color="#FF0000">*</font>
                    <font id="t_dailinameFont" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>
                    </td>
                </tr>--%>
                <tr>
                    <td height="26" align="right">商标注册号：</td>
                    <td height="26">
                    <input type="text" runat="server" id="txt_sbnum" class="inputs200text"  maxlength="100" onblur="checknull('txt_sbnum','Ftxt_sbnum');CheckUserSbregnum();" />
                    &nbsp;<font color="#FF0000">*</font>   <font id="Ftxt_sbnum" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15"  onkeydown="event.returnValue=IsDigit1();" />商标注册号不能为空
                    </font>   
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">商标类别：</td>
                    <td>     
                    <input type="text" runat="server" id="t_SBType" 
                             class="inputs200text"  onblur="checknull('t_SBType','Ft_SBType')" maxlength="100"/>
                     
                        &nbsp;<font color="#FF0000">*</font>
                    <font id="Ft_SBType" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>                        
                    </td>
                </tr>
              <tr>
                    <td height="26" align="right">客户选择：</td>
                    <td height="26">
                   <asp:CheckBox ID="CheckBox1" runat="server" onclick="Usercheck();"/> 是否使用会员用户名或地址                  
                    </td>
                </tr>
                <tr>
                    <td width="276" height="26" align="right">注册人名称：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_sbregname" class="inputs60text" onblur="checknull('t_sbregname','Ft_sbregname')" maxlength="100"/>
                    &nbsp;<font color="#FF0000">*</font>
                    <font id="Ft_sbregname" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>  
                        </td>
                </tr>
                  <tr id="sbregnameEn" style="display:none;">
                    <td width="276" height="26" align="right">注册人英文名称：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_sbregnameEN" class="inputs60text" />
                    </td>
                </tr>  
                  <tr>
                    <td width="276" height="26" align="right">地区：</td>
                    <td height="26">
                 
                                          <asp:DropDownList ID="Drp_GuoJi" runat="server">
                                          </asp:DropDownList>  
                                 <%--       <asp:UpdatePanel ID="UpdatePanel1" runat="server"> <ContentTemplate>
                                          <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                            <asp:ListItem Value="0">请选择省</asp:ListItem>
                                          </asp:DropDownList>
                                          <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                            <asp:ListItem Value="0">请选择市/区</asp:ListItem>
                                          </asp:DropDownList>
                                          <asp:DropDownList ID="DropDownList4" runat="server">
                                            <asp:ListItem Value="0">请选择区/县</asp:ListItem>
                                          </asp:DropDownList> &nbsp;<font color="#FF0000">*</font>
                    <font id="FFDrp_GuoJi" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />请选择地区
                    </font> 
                                        </ContentTemplate>
                                      </asp:UpdatePanel>--%>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">注册人详细地址：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_sbregaddress" class="inputs400text" maxlength="300" onblur="checknull('t_sbregaddress','Ft_sbregaddress')"/>
                    &nbsp;<font color="#FF0000">*</font>
                    <font id="Ft_sbregaddress" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>  
                    </td>
                </tr>
                 <tr id="sbregaddressEn" style="display:none;">
                    <td height="26" align="right">注册人英文地址：</td>
                    <td height="26">
                    <input type="text" runat="server" id="t_sbregaddressEN" class="inputs400text" maxlength="300" onblur="checknull('t_sbregaddressEN','Ft_sbregaddressEN')"/>
                    &nbsp;<font color="#FF0000">*</font>
                    <font id="Ft_sbregaddressEN" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />不能为空
                    </font>  
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">邮政编码：</td>
                    <td height="26">
                        <input type="text" runat="server" id="t_sbregyouzheng" class="inputs200text" maxlength="10" onblur="checknull('t_sbregyouzheng','Ft_sbregyouzheng')"  onkeydown="event.returnValue=IsDigit();" />
                        &nbsp;<font color="#FF0000">*</font>
                    <font id="Ft_sbregyouzheng" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />请输入邮政编码
                    </font> 
                    </td>
                </tr>
                   <tr>
                    <td height="26" align="right">商标注册日：</td>
                    <td height="26">
                     <input type="text" name="s6" runat="server" id="txt_AuthorizeIsNationalityDate"  class="font12000" maxlength="50" style="background-image:url(../images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});daoqidate();"/>   &nbsp;<font color="#FF0000">*</font>
                    <font id="ftxt_AuthorizeIsNationalityDate" class="alertfont" style="display:none;">
                        <img alt="警告" src="images/caozuo_3.jpg"width="15" />请输入商标注册日
                    </font> 
                    </td>
                </tr>
                    <tr>
                    <td height="26" align="right">注册商标有效期限：</td>
                    <td height="26">
                      <input id="t_daoqi" type="text"  runat="server" disabled="disabled"/>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="right">距截止日的所剩天数：</td>
                    <td height="26">
                     <span id="shengtime" runat="server"></span>
                    </td>
                </tr>
               <tr>
                    <td height="26" align="right">缴费选择：</td>
                    <td height="26">
                        <asp:DropDownList ID="dd_jiaofeitype" runat="server"> 
                           <asp:ListItem Value="2">委托缴费</asp:ListItem>
                            <asp:ListItem Value="1">自行缴费</asp:ListItem>
                          
                        </asp:DropDownList>
                    </td>
                </tr>

                     <tr>
                    <td align="right" valign="top">商标描述类型：</td>
                    <td>     
                        <asp:RadioButton ID="RadioButton1" runat="server" onclick="miaoshutype();" GroupName="aa"/>文字商标<asp:RadioButton ID="RadioButton2"
                            runat="server" GroupName="aa" onclick="miaoshutype();" />图形商标<asp:RadioButton ID="RadioButton3" runat="server" GroupName="aa" onclick="miaoshutype();" />文字与图形商标
                    </td>
                </tr>
                   <tr>
                    <td align="right"  colspan="2"><table border="0" cellspacing="0" cellpadding="0" id="sbmiaosu">
<tr>
                    <td align="right" valign="top" width="276">商标描述：</td>
                    <td align="left">
                        &nbsp;<input type="text" runat="server" id="t_SBmiaosu" class="inputs400text" maxlength="100" />
                        </td>
                </tr>
</table>
</td>
                   
                </tr>
                
                <tr>
                    <th colspan="2">
                        第三方信息
                    </th>
                </tr>
                <tr>
                    <td width="276" align="right" valign="top">
                        案卷号：
                    </td>
                    <td>
                        <input type="text" runat="server" id="txt_anjuanhao" class="inputs200text" maxlength="100" />
                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="您输入的信息格式有误，请核实！"
                        Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w\.]{6,18}">
                    </asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td width="276" align="right" valign="top">
                        联系人：
                    </td>
                    <td>
                        <input type="text" runat="server" id="txt_linkman" class="inputs200text" maxlength="20" />
                    </td>
                </tr>
                <tr>
                    <td width="276" align="right" valign="top">
                        地址：
                    </td>
                    <td>
                        <input type="text" runat="server" id="txt_address" class="inputs200text" maxlength="200" />
                    </td>
                </tr>
                <tr>
                    <td width="276" align="right" valign="top">
                        电话：
                    </td>
                    <td>
                        <input type="text" runat="server" id="txt_phone" class="inputs200text" maxlength="20" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <%--<div class="list-div" id="Div5">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                  <td>
                      <asp:Button ID="Button1" class="button" runat="server" Text="生成申请书及委托书" /></td> <td>
                          <asp:Button ID="Button2" class="button" runat="server" Text="生成商标续展注册申请书" /></td> <td>
                              <asp:Button ID="Button4" class="button" runat="server" Text="生成商标代理委托书" /></td> 
                </tr>
            </table>
        </div>--%>
        <br />
        <br />
        <div style="width: 100%; position: fixed; left: 0; bottom: 0px; height: 30px;background: #dfeef5;"><%if ((pageadd && hd_id.Value == "0") || (pageupdate && hd_id.Value != "0"))
                                                                                                                                 { %><asp:Button ID="btOK" runat="server" Text="提交" class="button" OnClick="btOK_Click"
                            OnClientClick="return checkaddnews();" style="margin-left:350px;" /><%} %><% if (hd_id.Value != "0")
                                                                              { %><input type="button" id="Button3" value="返回" class="button"
                              onclick="javascript:window.location='Shop_M_Trademark.aspx?<%=returnurl %>';" /><%} %>
        </div>    
    <div id="div_a" runat="server"></div>
    </form>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript">

    function daoqidate() {
        var datedaoqi = document.getElementById("txt_AuthorizeIsNationalityDate");
        if (datedaoqi.value != "") {
            var now = datedaoqi.value.split('-');
            var y = parseInt(now[0]) + 10;
            document.getElementById("t_daoqi").value = y + "-" + now[1] + "-" + now[2];             
        }
    }
    function miaoshutype() {
        var rb1 = document.getElementById("RadioButton1");
        var rb2 = document.getElementById("RadioButton2");
        var rb3 = document.getElementById("RadioButton3");
        if (rb1.checked) {
            document.getElementById("t_SBmiaosu").value = "请填写所申请的商标文字";
            document.getElementById("t_SBmiaosu").disabled = false;
            document.getElementById("sbmiaosu").style.display = "block";
        }
        if (rb2.checked) {
            document.getElementById("t_SBmiaosu").value = "";
            document.getElementById("sbmiaosu").style.display = "none";
        }
        if (rb3.checked) {
            document.getElementById("t_SBmiaosu").value = "请填写所申请的商标文字";
            document.getElementById("t_SBmiaosu").disabled = false;
            document.getElementById("sbmiaosu").style.display = "block";
        }
    }
       function Usercheck() {
           var cb1 = document.getElementById("CheckBox1");
           if (cb1.checked) {
               var na = document.getElementById("hi_n_a").value;
               if (na != "") {
                   document.getElementById("t_sbregname").value = na.split('_')[0];
                   document.getElementById("t_sbregaddress").value = na.split('_')[1];
                   document.getElementById("t_sbregyouzheng").value = na.split('_')[2];
               }
               else {
                   alert("该客户信息填写不完整！");cb1.checked = false;
               }
           } else {
               document.getElementById("t_sbregname").value ="";
               document.getElementById("t_sbregaddress").value ="";
               document.getElementById("t_sbregyouzheng").value ="";
           }
      
    }
</script>
<script language="JavaScript" type="text/JavaScript">
    var dianji = 0;
    function checkaddnews() {
        if (dianji == 0) {
            dianji = 1;
        }
       
        document.getElementById('txt_MemberIdFont').style.display = "none"; document.getElementById('Ftxt_sbnum').style.display = "none";
        document.getElementById('Ft_SBType').style.display = "none";
        document.getElementById('Ft_sbregname').style.display = "none";
        document.getElementById('Ft_sbregaddress').style.display = "none";
        document.getElementById('Ft_sbregyouzheng').style.display = "none";
        if (document.getElementById("txt_MemberId").value == "") {
            document.getElementById('txt_MemberIdFont').style.display = "";
            document.getElementById("txt_MemberId").focus();
            return false;
        }
        else {
            CheckUserMember();
        }
        if (document.getElementById("txt_sbnum").value == "") {
            document.getElementById('Ftxt_sbnum').style.display = "";
            document.getElementById("txt_sbnum").focus();
            return false;
        }
        else {
            CheckUserSbregnum();
        }
         if (document.getElementById("t_SBType").value == "") {
            document.getElementById('Ft_SBType').style.display = "";
            document.getElementById("t_SBType").focus();
            return false;
        }
        if (document.getElementById("t_sbregname").value == "") {
            document.getElementById('Ft_sbregname').style.display = "";
            document.getElementById("t_sbregname").focus();
            return false;
        } if (document.getElementById("Drp_GuoJi").value == "0" || document.getElementById("DropDownList2").value == "0") {
            document.getElementById('FFDrp_GuoJi').style.display = "";
            document.getElementById("Drp_GuoJi").focus();
            return false;
        }
        if (document.getElementById("t_sbregaddress").value == "") {
            document.getElementById('Ft_sbregaddress').style.display = "";
            document.getElementById("t_sbregaddress").focus();
            return false;
        }
        if (document.getElementById("t_sbregyouzheng").value == "") {
            document.getElementById('Ft_sbregyouzheng').style.display = "";
            document.getElementById("t_sbregyouzheng").focus();
            return false;
        }
        else {
            if (!document.getElementById("t_sbregyouzheng").value.match("^[0-9]*$")) {               
                alert('邮政编码有误!');               
                document.getElementById("t_sbregyouzheng").focus(); return false;
            }
        }
        
         if (document.getElementById("txt_AuthorizeIsNationalityDate").value == "") {
            document.getElementById('ftxt_AuthorizeIsNationalityDate').style.display = "";
            document.getElementById("txt_AuthorizeIsNationalityDate").focus();
            return false;
        }
        var rb1 = document.getElementById("RadioButton1");
        var rb2 = document.getElementById("RadioButton2");
        var rb3 = document.getElementById("RadioButton3");
        if (document.getElementById("dd_jiaofeitype").value == "2") {
            if (rb1.checked == false) {
               // alert("请选择商标描述类型！");
              //  return false;
                if (rb2.checked == false) {
                   // alert("请选择商标描述类型！");
                  //  return false;
                    if (rb3.checked == false) {
                        alert("请选择商标描述类型！");
                        return false;
                    }
                }
            }
            
           
        }
        return true;
    }
    function checknull(inputid, fontid) {
        if (dianji == 0) {
            if (document.getElementById(inputid).value != "") {
                document.getElementById(fontid).style.display = "none";
            }
            else {
                document.getElementById(fontid).style.display = "";
            }
        }
    }
    function CheckUserMember() {
        var member = document.getElementById("txt_MemberId").value;
        $.ajax({
            type: "POST",
            url: "Shop_A_Trademark.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "member=" + member,
            success: function (msg) {

                if (msg == "no") {
                    alert("请输入正确的用户编号");
                    document.getElementById("txt_MemberId").value = "";
                    document.getElementById("txt_MemberId").focus();
                }
                else {
                    document.getElementById("hi_n_a").value = msg;
                }
            }
        });
    }
    function CheckUserSbregnum() {
        var txt_sbnum = document.getElementById("txt_sbnum").value;
        var t_id = document.getElementById("hd_id").value;
       
        if (t_id != "0") { 
            $.ajax({
                type: "POST",
                url: "Shop_A_Trademark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "sbregnum=" + txt_sbnum + "&sbid=" + t_id,
                success: function (msg) {
                    if (msg == "ok") {
                        alert("该商标注册号已存在！");
                        document.getElementById("txt_sbnum").value = "";
                    }
                }
            });
        }
        else {
            $.ajax({
                type: "POST",
                url: "Shop_A_Trademark.ashx",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "sbregnum=" + txt_sbnum,
                success: function (msg) {
                    if (msg == "ok") {
                        alert("该商标注册号已存在！");
                        document.getElementById("txt_sbnum").value = "";
                    }
                }
            });
        }
    }
  
//    function checkguoji() {
//        var guoji = document.getElementById("dd_guoji");
//        var type = document.getElementById("dd_type");
//        var comen = document.getElementById("companyEn");
//        var regaddressEn = document.getElementById("sbregaddressEn");
//        var sbregnameEn = document.getElementById("sbregnameEn");
//        var nametext = guoji.options[guoji.selectedIndex].text; 
//         var typetext = type.options[type.selectedIndex].text;
//         if (nametext == "中国") {
//             comen.style.display = "none;"
//             regaddressEn.style.display = "none;"
//             regaddressEn.style.display = "none;" 
//               document.getElementById("idcardEn").style.display = "none";
//             if (typetext == "个人") {
//                 document.getElementById("idcard").style.display = "";
//              
//                 document.getElementById("company").style.display = "none";
//                 document.getElementById("companyEn").style.display = "none";
//                 document.getElementById("addressEn").style.display = "none";
//                 document.getElementById("dailiname").style.display = "none";
//                
//             }

//             if (typetext == "企业") {
//                 document.getElementById("idcard").style.display = "none";
//                 document.getElementById("company").style.display = "";              
//                 document.getElementById("companyEn").style.display = "none";
//                 document.getElementById("addressEn").style.display = "none";
//                 document.getElementById("dailiname").style.display = "none";
//             }

//             if (typetext == "代理组织机构") {
//                 document.getElementById("company").style.display = "none";
//                 document.getElementById("idcard").style.display = "none";
//                 document.getElementById("dailiname").style.display = "";
//                 document.getElementById("company").style.display = "none";
//                 document.getElementById("companyEn").style.display = "none";
//                 document.getElementById("addressEn").style.display = "none";
//             }
//         }
//         else {
//          
//             regaddressEn.style.display = "none";
//             regaddressEn.style.display = "none";
//             document.getElementById("addressEn").style.display = "";
//             document.getElementById("idcard").style.display = "none";
//             if (typetext == "个人") {               
//                 document.getElementById("idcardEn").style.display = "";
//                 document.getElementById("addressEn").style.display = "";
//                 document.getElementById("company").style.display = "none";
//                 document.getElementById("companyEn").style.display = "none";
//                 document.getElementById("addressEn").style.display = "none";
//                 document.getElementById("dailiname").style.display = "none";
//                 document.getElementById("sbregnameEn").style.display = "none";
//                 document.getElementById("sbregaddressEn").style.display = "none";
//             }
//             if (typetext == "企业") {  
//                 comen.style.display = ""
//                 document.getElementById("idcardEn").style.display = "none";
//                 document.getElementById("company").style.display = "";              
//                 document.getElementById("addressEn").style.display = "";              
//                 document.getElementById("companyEn").style.display = "";
//                 document.getElementById("addressEn").style.display = "none";
//                 document.getElementById("dailiname").style.display = "none";
//                 document.getElementById("sbregnameEn").style.display = "none";
//                 document.getElementById("sbregaddressEn").style.display = "none";

//             }
//             if (typetext == "代理组织机构") {
//                 document.getElementById("addressEn").style.display = "none";
//                 document.getElementById("dailiname").style.display = "";
//                 document.getElementById("sbregnameEn").style.display = "";
//                 document.getElementById("sbregaddressEn").style.display = "";
//                 document.getElementById("idcardEn").style.display = "";
//                 document.getElementById("addressEn").style.display = "";
//                 document.getElementById("company").style.display = "none";
//                 document.getElementById("companyEn").style.display = "none";
//                 document.getElementById("addressEn").style.display = "none";    
//             }
//         }
   // }
</script>