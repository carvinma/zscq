<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shoporder1.aspx.cs" Inherits="user_shoporder1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我的兑换订单_服务中心_商城系统_环球汇通</title>
    <meta name="Keywords" content="环球汇通" />
    <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/shopcart.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            //pro_buynum_del,pro_buynum_add,ibuycount,
            $("#pro_buynum_del").click(function () {
                var Count = $("#ibuycount").val();
                if (parseInt(Count) <= 1) {
                    $("#ibuycount").val(1);
                } else {
                    $("#ibuycount").val(parseInt(Count) - 1);
                }
                GetPrices();
            });
            $("#pro_buynum_add").click(function () {
                var Count = $("#ibuycount").val();
                $("#ibuycount").val(parseInt(Count) + 1);
                GetPrices();
            });
            $("#ibuycount").blur(function () {
                var Count = $("#ibuycount").val();
                if (parseInt(Count) < 1) {
                    $("#ibuycount").val(1);
                }
                GetPrices();
            });
            function GetPrices() {
                var Price = $("#Hi_Price").val();
                var Count = $("#ibuycount").val();
                $("#lblSumPrice").html((Price * Count).toFixed(2));
            }

        });
        //addcart(obj('Hi_PId').value,obj('ibuycount').value,obj('Hi_XId').value)
        function infoaddcart() {
            var rand = Math.floor(Math.random() * 1000000);
            var cs = "PageType=addcart&PId=" + obj('Hi_PId').value + "&Number=" + obj('ibuycount').value + "&pcolor=" + obj('Hi_XId').value + "&n=" + rand;
            $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
                success: function (data) {
                    if (data == "1") {
                        window.location = 'ShopCart.html';
                    }
                    else {
                        alert("发生意外！");
                    }
                }
            });
        }

    </script>
    <script type="text/javascript">
        function showaddr() {
            if (document.getElementById("div_address0").style.display == "") {
                document.getElementById("div_address0").style.display = "none";
                obj("title").innerHTML = "添加地址";
            } else {
                document.getElementById("div_address0").style.display = "";
                obj("title").innerHTML = "取消";
            }

        }
        function changeaddress(v) {
            window.parent.obj('Hi_AddressId').value = v;
        }
    </script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
    <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
    <input type="hidden" runat="server" id="Hi_Mr" value="0" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="56" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <uc1:zscq_sp_leftmenu ID="zscq_sp_leftmenu1" runat="server" />
            </td>
            <td align="left" valign="top">
                <table width="741" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
                            <table width="739" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="38" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="701">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">&nbsp;
                                        
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的兑换订单&nbsp;&gt;&gt;&nbsp;确认订单
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="715" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="690">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">&nbsp;
                                        
                                    </td>
                                    <td align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="654" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">&nbsp;
                                                                
                                                            </td>
                                                            <td width="115" align="center" class="font12bt">
                                                                商品清单
                                                            </td>
                                                            <td width="7">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="18" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                                        <tr>
                                                            <td width="88" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                商品图片
                                                            </td>
                                                            <td width="191" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                商品名称
                                                            </td>
                                                            <%--<td width="137" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品编号</td>--%>
                                                            <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                所需积分
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                兑换数量
                                                            </td>
                                                            <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                积分小计
                                                            </td>
                                                            <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                操作
                                                            </td>
                                                        </tr>
                                                        <%=td_ShopCart.ToString() %>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="22" align="left">&nbsp;
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                        <div id="div_addr" runat="server">
                                            <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                        <table width="687" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10" height="20">&nbsp;
                                                                    
                                                                </td>
                                                                <td width="115" align="center" class="font12bt">
                                                                    收货地址
                                                                </td>
                                                                <td height="20">&nbsp;
                                                                    
                                                                </td>
                                                                <td width="600" align="right">
                                                                    <span id="title" style="cursor: pointer;" onclick="showaddr();">添加新地址</span>
                                                                </td>
                                                                <td height="10">&nbsp;
                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="22" align="left">&nbsp;
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="div_address1" width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <asp:Repeater ID="Rpt_Address" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td width="13%" height="45" align="right">
                                                                <input type="radio" name="address" onclick="changeaddress('<%# Eval("i_Id")%>')" <%# Hi_AddressId.Value != Eval("i_Id").ToString() ? "" : " checked=\"checked\""%> />
                                                            </td>
                                                            <td>
                                                                <%#Eval("countryName")%>&nbsp;<%# Eval("nvc_StreetAddress")%>&nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;收）&nbsp;&nbsp;<%# Eval("nvc_TelPhone")%>&nbsp;&nbsp;<%# Hi_Mr.Value != Eval("i_Id").ToString() ? "<a href=\"?aid=" + Hi_AddressId.Value + "&PageType=mr&mid=" + Eval("i_Id") + "\">[设为默认]</a>" : "<span style=\"color:#e3441c;\">默认地址</span>"%>&nbsp;&nbsp;<a href="?aid=<%= Hi_AddressId.Value %>&PageType=del&did=<%# Eval("i_Id")%>" onclick="javascript:if(!window.confirm('确认删除？')){return false;}">[删除]</a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                            <table id="div_address0" width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none;">
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>收货人姓名：
                                                    </td>
                                                    <td width="28%" align="left">
                                                        <input type="text" runat="server" name="s5" id="text_shouhuoren" class="font12000" maxlength="50" />
                                                    </td>
                                                    <td colspan="4" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        常用邮箱：
                                                    </td>
                                                    <td width="28%" align="left">
                                                        <input type="text" runat="server" name="s" id="text_dianziyoujian" class="font12000" maxlength="50" />
                                                    </td>
                                                    <td colspan="4" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        收货人手机：
                                                    </td>
                                                    <td width="28%" align="left">
                                                        <input type="text" runat="server" name="s2" id="text_shoujihaoma" class="font12000" maxlength="50" />
                                                    </td>
                                                    <td colspan="4" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>固定电话：
                                                    </td>
                                                    <td width="58%" align="left">
                                                        <input type="text" runat="server" name="s3" id="text_gudingdianhua" class="font12000" maxlength="50" />
                                                        格式：区号-电话号码
                                                    </td>
                                                    <td colspan="4" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>所属国家：
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddl_guojia" runat="server">
                                                                </asp:DropDownList>
                                                                <%--<asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsheng_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">请选择</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddl_shi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlshi_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">请选择</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddl_qu" runat="server">
                                                                    <asp:ListItem Value="0">请选择</asp:ListItem>
                                                                </asp:DropDownList>--%>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>详细地址：
                                                    </td>
                                                    <td colspan="5" align="left" class="huizi">
                                                        <input type="text" runat="server" name="s4" id="text_shouhuodizhi" class="font12000s" maxlength="50" />
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        邮政编码：
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <input type="text" runat="server" name="s6" id="text_youzhengbianma" class="font12000" maxlength="50" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">
                                                        是否默认：
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <asp:CheckBox ID="CB_Mr" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="13%" height="40" align="right">&nbsp;
                                                        
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='images/user_zl_b5.gif' Width="85" Height="29" OnClick="Bt_Add_Click" OnClientClick="return CheckUserAddress()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table width="687" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="687" height="26" align="left">
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="687" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                    <table width="132" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">&nbsp;
                                                                
                                                            </td>
                                                            <td width="115" align="center" class="font12bt">
                                                                积分合计
                                                            </td>
                                                            <td width="7">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="26" align="left">
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="59" align="right" valign="top" style="line-height: 22px;">
                                                    <input type="hidden" value="0" runat="server" id="Hi_allintegral" />
                                                    积分总计：<span id="span_allintegral" class="font14ac5"><%= Hi_allintegral.Value %></span>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="687" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="41" align="right">
                                                    <asp:ImageButton ID="Bt_SubmitOrder" runat="server" ImageUrl="images/user_zl_b5.gif" Width="85" Height="29" BorderWidth="0" OnClick="Bt_SubmitOrder_Click" OnClientClick="return okaddress();" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="687" height="26" align="left">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    <div id="div_a" runat="server">
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    var reg = /^([a-zA-Z0-9]+[-\_\_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
    var reg3 = /^[a-zA-Z0-9_]{4,20}$/;
    var reg4 = /^(\d{3,4}-)?\d{7,8}$/;
    function CheckUserAddress() {
        if (obj("text_shouhuoren").value == "") {
            alert("请填写收货人!");
            obj("text_shouhuoren").focus();
            return false;
        }
        if (obj("text_gudingdianhua").value == "") {
            alert("请填写电话!");
            obj("text_gudingdianhua").focus();
            return false;
        }
//        if (obj("text_shoujihaoma").value == "") {
//            alert("请填写手机号!");
//            obj("text_shoujihaoma").focus();
//            return false;
//        }
//        if (reg2.test(obj("text_shoujihaoma").value) == false) {
//            alert('手机号码格式有误!');
//            obj("text_shoujihaoma").focus();
//            return false;
//        }
        if (obj('ddl_guojia').value == "0") {
            obj("ddl_guojia").focus();
            alert("请选择国家!");
            return false;
        }
        if (obj('ddl_guojia').value == "") {
            if (obj('ddl_sheng').value == "0") {
                obj("ddl_sheng").focus();
                alert("请选择省份!");
                return false;
            }
            if (obj('ddl_shi').value == "0") {
                obj("ddl_shi").focus();
                alert("请选择城市!");
                return false;
            }
            if (obj('ddl_qu').value == "0") {
                obj("ddl_qu").focus();
                alert("请选择地区!");
                return false;
            }
        }
        if (obj("text_shouhuodizhi").value == "") {
            alert("请填写详细地址!");
            obj("text_shouhuodizhi").focus();
            return false;
        }
    } 
</script>
