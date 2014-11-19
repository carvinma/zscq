<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaySuccess.aspx.cs" Inherits="PaySuccess" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%= TitleOrKeyword %>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <style type="text/css">
        .ac
        {
            color: #b14962;
        }
    </style>
    <link rel="stylesheet" href="css/process.css">
    <link rel="stylesheet" href="css/processOld.css">
    <style type="text/css">
        #bg
        {
            display: none;
            z-index: 1;
            background: #0b0b0b;
            left: 0px;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0px;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
        #show
        {
            display: none;
            margin-top: 10px;
            z-index: 2;
            position: absolute;
            top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;"
        height="112">
        <tr>
            <td height="127" valign="top" align="center">
                <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
                    <tr>
                        <td height="127" align="left" valign="top">
                            <table width="915" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="667" height="52" align="left" valign="top">
                                        <table width="200" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="103">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;<a href="index.aspx">返回首页&gt;&gt;</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="248" align="left" valign="top">
                                        <table width="248" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="248" height="65" colspan="7">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="62" colspan="7" align="right" valign="top">
                                                    <a href="index.aspx">
                                                        <img src="images/logo1.gif" width="236" height="62" border="0" /></a>
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
    <%if (Ishave == false)
      { %>
    <div id="bg">
    </div>
    <div id="show">
        <table width="571" height="299" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;
            background-image: url(images/faq_bg.png);">
            <tr>
                <td height="299" align="left" valign="top">
                    <table width="571" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="36" height="58">
                                &nbsp;
                            </td>
                            <td width="480">
                                &nbsp;
                            </td>
                            <td width="55" align="right" valign="top">
                                <a href="javascript:void(0)">
                                    <img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidediv();" />
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td height="205">
                                &nbsp;
                            </td>
                            <td align="left" valign="top">
                                <table width="480" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="40%" height="32" align="right">
                                            <strong>手机号码：</strong>
                                        </td>
                                        <td width="60%">
                                            <input type="text" runat="server" id="txt_moblie" style="height: 23px; width: 250px;
                                                font-size: 12px; border: 1px solid #bebebe;" maxlength="100" />
                                            <asp:RequiredFieldValidator ID="V1" ControlToValidate="txt_moblie" Display="Dynamic"
                                                SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="32" align="right">
                                            <strong>密码：</strong>
                                        </td>
                                        <td>
                                            <input type="password" runat="server" id="txt_pwd" style="height: 23px; width: 250px;
                                                font-size: 12px; border: 1px solid #bebebe;" maxlength="50" />
                                            <asp:RequiredFieldValidator ID="V2" ControlToValidate="txt_pwd" Display="Dynamic"
                                                SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="32" align="right">
                                            <strong>确认密码：</strong>
                                        </td>
                                        <td>
                                            <input type="password" runat="server" id="txt_pwd2" style="height: 23px; width: 250px;
                                                font-size: 12px; border: 1px solid #bebebe;" maxlength="50" />
                                            <asp:CompareValidator ID="V3" ControlToValidate="txt_pwd2" ControlToCompare="txt_pwd"
                                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="*"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <strong style="color: #d34245;"></strong>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="2" align="center">
                                            <asp:ImageButton ID="ibtn_Add" ImageUrl="images/faq3.gif" Width="118" Height="29"
                                                BorderWidth="0" runat="server" OnClick="ibtn_Add_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td height="15">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <%} %>
    <div class="wrapbox">
        <div class="content">
            <div style="height: 300px; width: 960px; margin: 0 auto; background-color: #ffffff;
                padding: 20px;">
                <div class="buyprocess_tit">
                    <span>订单支付成功</span>
                </div>
                <div class="buy_success">
                    <div class="buy_success_tip">
                        <%= OrderNumer %>支付成功！</div>
                    <div style="margin-left: 50px; margin-top: 20px; font-size: 14px;">
                        您共支付了<%=AllPrice %><br />
                        <br />
                        您还可以进行以下操作：<br />
                        <br />
                        <a class="ac" href="index.aspx" style="font-size: 14px;">返回首页</a><br />
                        <br />
                        <a class="ac" href="<%= leapurl %>" style="font-size: 14px;">查看我的订单</a>&nbsp;&nbsp;
                        <%if (Ishave == false)
                          { %>
                        <a class="ac" href="#" onclick="openBg(1);showdiv();" style="font-size: 14px;">参与积分活动</a>
                        <%} %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    <script type="text/javascript" src="js/jquery-1.7.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <input type="hidden" value="1" id="Hi_Flag" />
    <%if (Ishave == false)
      { %>
    <script type="text/javascript">
        function openBg(state) { //遮照打开关闭控制
            if (state == 1) {
                document.getElementById('bg').style.display = "block";
                var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
                h = h > document.body.scrollHeight ? h : document.body.scrollHeight;
                document.getElementById('bg').style.height = h + "px";
            }
            else {
                document.getElementById('bg').style.display = "none";
            }
        }
        function showdiv() {
            var top1 = document.documentElement.scrollTop + document.body.scrollTop;
            document.getElementById('show').style.display = "block";
            document.getElementById('show').style.left = (document.getElementById('bg').offsetWidth - document.getElementById('show').offsetWidth) / 2 + "px";
            document.getElementById('show').style.top = top1 + 20 + "px"; //document.documentElement.scrollTop + 100 + "px";  
        }
        function hidediv() {
            document.getElementById('bg').style.display = "none";
            document.getElementById('show').style.display = "none";
        } 
    </script>
    <%} %><%--<script type="text/javascript">
    $(document).ready(function () {
        var flag = document.getElementById("Hi_Flag").value;
        if (flag == 1) {
            openBg(1);
            showdiv();
        }
    });
</script>--%>
    </form>
</body>
</html>
