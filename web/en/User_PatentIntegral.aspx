<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentIntegral.aspx.cs" Inherits="User_PatentIntegral" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My reward points_Service Center_User Center_System of Patent Annuity Fee_Global Patent</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server" target="_blank">
    <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <!--专利左侧START-->
                <uc3:patentleft ID="patentleft1" runat="server" />
                <!--专利左侧END-->
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
                                        Front page >> System of Patent Annuity Fee >> User Center >> Service Center >> My reward points
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">&nbsp;
                                        
                                    </td>
                                    <td width="691">&nbsp;
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">&nbsp;
                                        
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="466" height="252" border="0" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
                                            <tr>
                                                <td width="260" height="308" align="left" valign="top" style="background-image: url(images/shop_login2.gif);">
                                                    <table width="464" height="304" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td colspan="2" height="40">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="54" height="33">&nbsp;
                                                                
                                                            </td>
                                                            <td width="410" align="left" valign="top">
                                                                <table width="380" height="180" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="72" height="28" align="right" class="font14">
                                                                            Mobile：
                                                                        </td>
                                                                        <td width="306" align="left">
                                                                            <input type="text" name="textfield" id="txt_Mobile" runat="server" class="checkval required" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" value="" onblur="checkVal(this)" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="28" align="right" class="font14">
                                                                            Password：
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="password" name="textfield" id="txt_Pwd" runat="server" class="checkval required" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" onblur="checkVal(this)" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="radio" runat="server" name="type" id="rad_type1" value="1" checked="true" />&nbsp;Log as the user with reward points
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="radio" runat="server" name="type" id="rad_type2" value="2" />&nbsp;Binding a new account
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="25">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td align="left">
                                                                            <a id='goTo' href='user_shopintegral.aspx' onclick="return integrallogin();" target='_blank'>
                                                                                <img id="Ibtn_OK" src="images/user_zl_b5.gif" width="85" height="29" borderwidth="0" />
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td align="left" valign="top" style="line-height: 20px;">
                                                                Note：<br />
                                                                1. Please remember the password,password cannot be retrieved.
                                                          <br />
                                                                2. If there are some changes on the mobile phone user of reward points, please re-bind a new mobile phone user to avoid unexpected loss.
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
            </td>
        </tr>
    </table>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div id="div_a" runat="server">
    </div>
    </form>
</body>
</html>
<script type="text/javascript">

    $(function () {
        $(".checkval").blur(function () {
            FieldValidation.validate($(this))
        })
    })

    function integrallogin() {
        var tag = false;
        var ret = true;
        var mobile = $("#txt_Mobile");
        var password = $("#txt_Pwd");
        var type = $("input[type=radio]:checked");
        var rand = Math.floor(Math.random() * 1000000);

        //验证手机号
        if (type.val() == "2") {
            $.ajax({
                type: "POST",
                url: "Handler.ashx",
                async: false,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: "flag=checkjfphone&mobile=" + mobile.val() + "&r=" + rand,
                success: function (msg) {
                    if (msg == "0") {
                        ret = confirm("Note: Once re-binding a new mobile phone user, reward points will be refreshed to be 0, and the reward points of original mobile phone user can also be used in the reward points shop.");
                    }
                }
            });
        }
        if (ret) {
            if (FieldValidation.validate(mobile, password)) {
                $.ajax({
                    type: "POST",
                    url: "Handler.ashx",
                    async: false,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=zljflogin&password=" + password.val() + "&mobile=" + mobile.val() + "&type=" + type.val() + "&r=" + rand,
                    success: function (msg) {
                        if (msg == "1") {
                            tag = true;
                        }
                        else {
                            alert(msg);
                            tag = false;
                        }
                    }
                });
            }
        }
        return tag;
    }
</script>
