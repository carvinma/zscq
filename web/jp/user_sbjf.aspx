﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbjf.aspx.cs" Inherits="user_sbjf" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%= TitleOrKeyword %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body id="index">
    <form id="form1" runat="server" target="_blank">
    <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="82" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;
        background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
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
                                        <a href="index.aspx">フロントページ</a>&nbsp;>>&nbsp;商標システム&nbsp;>>&nbsp;サービスセンター&nbsp;>>&nbsp;私のポイント
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
                                                                        <td width="94" height="25" align="right" class="font14">
                                                                            携帯番号：
                                                                        </td>
                                                                        <td width="286" align="left">
                                                                            <input type="text" name="textfield" id="txt_Mobile" runat="server" class="checkval required"
                                                                                style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece;
                                                                                background-color: #cecece;" maxlength="50" value="" onblur="checkVal(this)" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="25" align="right" class="font14">
                                                                            パスワード ：
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="password" name="textfield" id="txt_Pwd" runat="server" class="checkval required"
                                                                                style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece;
                                                                                background-color: #cecece;" maxlength="50" onblur="checkVal(this)" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="radio" runat="server" name="type" id="rad_type1" value="1" checked="true" />&nbsp;既存するポイントアカウントを使用します
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">&nbsp;
                                                                            
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="radio" runat="server" name="type" id="rad_type2" value="2" />&nbsp;新しい口座を開設する
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
                                                                提示：<br />
                                                                1. パスワードをよく覚えておいてください、パスワード取り戻せません。<br />
                                                                2. あなたの損失を避けるために、携帯電話ポイントアカウントが変更された場合、新しい携帯電話アカウントにバインディングしてください。
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
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
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
                        ret = confirm("ご注意：新しくバインディングした携帯電話アカウントはゼロからポイントを積め、当初の携帯電話アカウントのポイントは依然としてポイント商店で使用することができます。");
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
                    data: "flag=sbjflogin&password=" + password.val() + "&mobile=" + mobile.val() + "&type=" + type.val() + "&r=" + rand,
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
