<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shoporder1.aspx.cs" Inherits="user_shoporder1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>My order of gift exchange_Service Center_System of Reward Points Shop_Global Patent</title>
    <meta name="Keywords" content="Global Patent" />
    <meta name="Description" content="Global patent Intellectual property annuity fee e-commerce platform" />
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
                        alert("Error occurs！");
                    }
                }
            });
        }

    </script>
    <script type="text/javascript">
        function showaddr() {
            if (document.getElementById("div_address0").style.display == "") {
                document.getElementById("div_address0").style.display = "none";
                obj("title").innerHTML = "Add Address";
            } else {
                document.getElementById("div_address0").style.display = "";
                obj("title").innerHTML = "Cancel";
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
    <uc3:zscqadv ID="zscqadv1" TypeId="70" runat="server" />
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
                                        <a href="index.aspx">Front page</a>&nbsp;&gt;&gt;&nbsp;User Center&nbsp;&gt;&gt;&nbsp;Service Center&nbsp;&gt;&gt;&nbsp;My order of gift exchange&nbsp;&gt;&gt;&nbsp;Confirm order
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
                                                    <table width="148" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">&nbsp;
                                                                
                                                            </td>
                                                            <td width="130" align="center" class="font12bt">
                                                                Commodity list
                                                            </td>
                                                            <td width="8">
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
                                                                Commodity picture
                                                            </td>
                                                            <td width="191" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                Commodity name
                                                            </td>
                                                            <%--<td width="137" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品编号</td>--%>
                                                            <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                Required reward points
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                Quantity of exchange
                                                            </td>
                                                            <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                Subtotal of reward points
                                                            </td>
                                                            <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                                                Operation
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
                                                                <td width="8" height="20">&nbsp;
                                                                    
                                                                </td>
                                                                <td width="153" align="center" class="font12bt">
                                                                  Delivery Address
                                                            </td>
                                                                <td width="10" height="20">&nbsp;
                                                                    
                                                                </td>
                                                                <td width="516" align="right">
                                                                    <span id="title" style="cursor: pointer;" onclick="showaddr();">Add Address</span>
                                                                </td>
                                                                <td width="6" height="10">&nbsp;
                                                                    
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
                                                            <td align=left>
                                                                &nbsp;<%#Eval("nvc_EnName")%>&nbsp;<%# Eval("nvc_StreetAddress")%>&nbsp;&nbsp;（<%# Eval("nvc_Consignee")%>&nbsp;&nbsp;receipts）&nbsp;&nbsp;<%# Eval("nvc_TelPhone")%>&nbsp;&nbsp;<%# Hi_Mr.Value != Eval("i_Id").ToString() ? "<a href=\"?aid=" + Hi_AddressId.Value + "&PageType=mr&mid=" + Eval("i_Id") + "\">[Set Default]</a>" : "<span style=\"color:#e3441c;\">Default Address</span>"%>&nbsp;&nbsp;<a href="?aid=<%= Hi_AddressId.Value %>&PageType=del&did=<%# Eval("i_Id")%>" onclick="javascript:if(!window.confirm('Confirm that you want delete it？')){return false;}">[Delete]</a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                            <table id="div_address0" width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none;">
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>Recipient’s name：
                                                    </td>
                                                    <td width="49%" align="left">
                                                        <input type="text" runat="server" name="s5" id="text_shouhuoren" class="font12000" maxlength="50" />
                                                    </td>
                                                    <td width="29%" colspan="4" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                       E-mail：
                                                    </td>
                                                    <td width="49%" align="left">
                                                        <input type="text" runat="server" name="s" id="text_dianziyoujian" class="font12000" maxlength="50" />
                                                    </td>
                                                    <td colspan="4" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        Mobile phone：
                                                    </td>
                                                    <td width="49%" align="left">
                                                        <input type="text" runat="server" name="s2" id="text_shoujihaoma" class="font12000" maxlength="50" />
                                                    </td>
                                                    <td colspan="4" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>Fixed telephone：
                                                    </td>
                                                    <td width="49%" align="left">
                                                        <input type="text" runat="server" name="s3" id="text_gudingdianhua" class="font12000" maxlength="50" />
                                                        
                                                    </td>
                                                    <td colspan="4" align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>Country：
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddl_guojia" runat="server">
                                                                </asp:DropDownList>
                                                                <%--<asp:DropDownList ID="ddl_sheng" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsheng_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">Please select</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddl_shi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlshi_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">Please select</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddl_qu" runat="server">
                                                                    <asp:ListItem Value="0">Please select</asp:ListItem>
                                                                </asp:DropDownList>--%>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        <span style="color: #f00;">*</span>Detailed address：
                                                    </td>
                                                    <td colspan="5" align="left" class="huizi">
                                                        <input type="text" runat="server" name="s4" id="text_shouhuodizhi" class="font12000s" maxlength="50" />
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        Zip code：
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <input type="text" runat="server" name="s6" id="text_youzhengbianma" class="font12000" maxlength="50" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">
                                                        Default：
                                                    </td>
                                                    <td colspan="5" align="left">
                                                        <asp:CheckBox ID="CB_Mr" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="40" align="right">&nbsp;
                                                        
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
                                                    <table width="203" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10" height="20">&nbsp;
                                                                
                                                            </td>
                                                            <td width="187" align="center" class="font12bt">
                                                                Total of reward points
                                                            </td>
                                                            <td width="6">
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
                                                    Total of reward points：<span id="span_allintegral" class="font14ac5"><%= Hi_allintegral.Value %></span>
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
            alert("Please enter the Recipient!");
            obj("text_shouhuoren").focus();
            return false;
        }
        if (obj("text_gudingdianhua").value == "") {
            alert("Please enter the telephone number!");
            obj("text_gudingdianhua").focus();
            return false;
        }
//        if (obj("text_shoujihaoma").value == "") {
//            alert("请填写手机号!");
//            obj("text_shoujihaoma").focus();
//            return false;
//        }
//        if (reg2.test(obj("text_shoujihaoma").value) == false) {
//            alert('Mobile phone number格式有误!');
//            obj("text_shoujihaoma").focus();
//            return false;
//        }
        if (obj('ddl_guojia').value == "0") {
            obj("ddl_guojia").focus();
            alert("Please select a country!");
            return false;
        }
        //if (obj('ddl_guojia').value == "") {
//            if (obj('ddl_sheng').value == "0") {
//                obj("ddl_sheng").focus();
//                alert("Please select省份!");
//                return false;
//            }
//            if (obj('ddl_shi').value == "0") {
//                obj("ddl_shi").focus();
//                alert("Please select城市!");
//                return false;
//            }
//            if (obj('ddl_qu').value == "0") {
//                obj("ddl_qu").focus();
//                alert("Please select地区!");
//                return false;
//            }
//        }
        if (obj("text_shouhuodizhi").value == "") {
            alert("Please enter the detailed address!");
            obj("text_shouhuodizhi").focus();
            return false;
        }
    } 
</script>
