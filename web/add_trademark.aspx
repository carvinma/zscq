﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_trademark.aspx.cs" Inherits="aBrand_add_trademark" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商标信息检索_我的商标_服务中心_商标系统_环球汇通</title>
    <meta name="Keywords" content="环球汇通" />
    <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="js/jtrademark.js" type="text/javascript"></script>
    <script src="js/j.suggest.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/trademark.css" />
    <script src="js/tooltips.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tmptoCity, tmptoCityCode;
        $(function () {
            $("#txt_applyname").focus(function () {
                tmptoCity = $("#txt_applyname").val();
                $("#txt_applyname").val('');
                tmptoCityCode = $('#applyname_3word').val();
                $('#txt_applyname').val('');
            });
            $("#txt_applyname").blur(function () {
                if ($("#txt_applyname").val() == '') {
                    $("#txt_applyname").val(tmptoCity);
                }
                if ($('#applyname_3word').val() == '') {
                    $('#applyname_3word').val(tmptoCityCode);
                }
            });
            $("#txt_applyname").keypress(function () {
                if (window.event.keyCode == 13) {
                    event.returnValue = false;
                    event.cancel = true;
                } 
            });
           
            $("#txt_applyname").suggest(citys, { hot_list: commoncitys, dataContainer: '#applyname_3word', attachObject: "#suggest" });
        });
    </script>
    <style type="text/css">
        p.MsoNormal
        {
            margin-bottom: .0001pt;
            text-align: justify;
            text-justify: inter-ideograph;
            font-size: 10.5pt;
            font-family: "Times New Roman" , "serif";
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
    </style>
</head>
<body id="index">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <input type="hidden" id="Hi_MemberId" runat="server" value="" />
    <input id="hi_guoji" type="hidden" runat="server" value="0" />
    <input id="hi_usertype" type="hidden" runat="server" />
    <input id="hi_zhitifiles" type="hidden" runat="server" />
    <input id="hi_sbid" type="hidden" runat="server" value="0" />
    <uc4:zscqtop2 ID="zscqtop21" runat="server" />
    <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
                                    <td width="38" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="701">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="19">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;添加商标信息&nbsp;
                                        &gt;&gt; 添加商标申请案
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="20">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" class="font12bd44147" style="border-bottom: 1px solid #d34245;">
                                        <table width="114" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="10" height="28">
                                                    &nbsp;
                                                </td>
                                                <td width="98" align="center">
                                                    &nbsp;
                                                </td>
                                                <td width="6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10" height="20">
                                                    &nbsp;
                                                </td>
                                                <td width="98" align="center" class="font12bt">
                                                    注意事项
                                                </td>
                                                <td width="6">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" class="font12bd44147">
                                        <br />
                                        <br />
                                        *如果申请人为自然人，则必需是具有营业执照的自然人（例：个体工商业），其他中国大陆自然人暂不能申请<br />
                                        &nbsp;如有以下情况，请直接联系我们，本系统暂不支持。<br />
                                        <br />
                                        （1） 如您申请集体商标或证明商标<br />
                                        （2） 如您使用肖像作为商标<br />
                                        （3） 如您的商标想享有优先权<br />
                                        （4） 如您的商标申请人有两个或两个以上<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="right" class="font12bd44147">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="" class="font12bd44147">【商标近似查询】</a>【填写说明】
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="671" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="115" align="center" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            申请人信息
                                                                        </td>
                                                                        <td width="6">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td height="18" align="center">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="115" align="left" valign="top">
                                                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="right">
                                                                            <strong>选择申请人类别</strong>：
                                                                        </td>
                                                                        <td>
                                                                            <input id="Radio5" type="radio" name="person" />自然人&nbsp;&nbsp;&nbsp;&nbsp;<input
                                                                                id="Radio6" type="radio" name="person" />企业单位
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="180" height="32" align="right">
                                                                            <strong>申请人名称：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="text" id="txt_applyname" class="font12000" maxlength="50" runat="server"
                                                                                clientidmode="Static" />
                                                                            <span style="color: Red;" id="sb_num1">*</span>
                                                                            <input type="hidden" name="applyname_3word" runat="server" clientidmode="Static"
                                                                                id="applyname_3word" value="CAN" />
                                                                            <div id="suggest" class="ac_results" style="width: 173px;">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong><span>营业执照副本（中文）</span>：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:FileUpload ID="FileUpload5" runat="server" Width="200px" />
                                                                            &nbsp;
                                                                            <div>
                                                                                <span style="color: Red;">请将营业执照副本盖公章后扫描为彩色上传，格式为pdf，大小不超过2M</span></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>申请人行政区划：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="text" name="s6" runat="server" id="Sb_Regname" onblur="checkOk('Sb_Regname');Checksbzhenshu(0);"
                                                                                class="font12000 tooltip" tips="请与商标注册证书内容一致" maxlength="50" /><span style="color: Red;"
                                                                                    id="Sb_Regname1">*</span><span></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="46" align="right">
                                                                            <strong>申请人地址：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <textarea cols="20" rows="2" type="text" name="s6" id="Sb_Reg_Address" style="width: 295px;
                                                                                height: 40px;" onblur="checkOk('Sb_Reg_Address');" class="font12000 tooltip"
                                                                                maxlength="250" runat="server"></textarea><span style="color: Red;" id="Sb_Reg_Address1">*</span><span></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>联系人：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="text" name="s6" id="Sb_Reg_youbian" onblur="checkOk('Sb_Reg_youbian');"
                                                                                class="font12000 tooltip" maxlength="10" tips="只能输入数字" runat="server" onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                                                onafterpaste="this.value=this.value.replace(/\D/g,'')" /><span style="color: Red;"
                                                                                    id="Sb_Reg_youbian1">*</span><span></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>联系电话：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input type="text" name="s6" runat="server" id="Sb_passTime" onblur="checkOk('Sb_passTime');" /><span
                                                                                style="color: Red;" id="Sb_passTime1">*</span><span></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right">
                                                                            <strong>传真（含地区号）：</strong>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input id="t_daoqi" type="text" runat="server" class="font12000" readonly="readonly" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="sbmiaoshu">
                                                                        <td height="32" align="right">
                                                                            <strong>邮政编码：</strong>
                                                                        </td>
                                                                        <td align="left" style="text-li: left;">
                                                                            <input type="text" name="s6" id="Sb_miaosu" class="font12000" maxlength="50" runat="server"
                                                                                onblur="checkOk('Sb_miaosu');" onclick="value='';focus()" style="width: 300px;" /><span
                                                                                    style="color: Red;" id="Sb_miaosu1">*</span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            商标信息
                                                                        </td>
                                                                        <td width="6">
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
                                                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td height="32" width="360" align="right" valign="middle">
                                                                            <strong><span>我公司案件号</span></strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="200" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right" valign="middle">
                                                                            <strong><span>是否三维标志</span></strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input id="Radio1" name="rdo3D" checked="checked" type="radio" />
                                                                            否&nbsp;&nbsp;
                                                                            <input id="Radio3" name="rdo3D" type="radio" />
                                                                            是
                                                                        </td>
                                                                        <td valign="middle">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right" valign="middle">
                                                                            <strong><span>是否颜色组合</span></strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input id="Radio2" name="rdoColor" checked="checked" type="radio" />
                                                                            否&nbsp;&nbsp;
                                                                            <input id="Radio4" name="rdoColor" type="radio" />
                                                                            是
                                                                        </td>
                                                                        <td valign="middle">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right" valign="middle">
                                                                            <strong><span>声音商标</span></strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input id="Checkbox1" type="checkbox" />
                                                                        </td>
                                                                        <td valign="middle">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="32" align="right" valign="middle">
                                                                            <strong>声音文件</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <asp:FileUpload ID="FileUpload6" runat="server" Width="200px" />
                                                                            <div>
                                                                                <span style="color: Red;">样本格式为mp3或wav，大小不超过5M</span></div>
                                                                        </td>
                                                                        <td width="429" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" valign="middle">
                                                                            <strong>商标说明</strong>：
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <textarea cols="20" rows="2" type="text" name="s6" id="txt_address" style="width: 300px;
                                                                                height: 180px;" class="font12000" maxlength="250" runat="server"></textarea>
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <div>
                                                                                <p>
                                                                                    (1)长度在1-180个字符之间</p>
                                                                                <br />
                                                                                <p>
                                                                                    (2)只能使用中文、英文或阿拉伯数字</p>
                                                                                <br />
                                                                                <p>
                                                                                    (3)以三维标志、颜色组合、声音标志<br />
                                                                                    申请商标注册的，应说明商标使用方式</p>
                                                                                <br />
                                                                                (4)商标为外文或者包含外文的，应当说明含义
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <a href="">【更多说明】</a>
                                                                        </td>
                                                                        <td valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" valign="middle">
                                                                            <strong>商标类别</strong>:
                                                                        </td>
                                                                        <td valign="middle">
                                                                            <input id="t_daoqi0" type="text" runat="server" class="font12000" readonly="readonly" />
                                                                        </td>
                                                                        <td valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10" height="20">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="98" align="center" class="font12bt">
                                                                            商标图样上传
                                                                        </td>
                                                                        <td width="6">
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
                                                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr id="zhutifile" runat="server">
                                                                        <td style="height: 50px; width: 260px;" align="center">
                                                                            <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" />
                                                                            <br />
                                                                            图样1
                                                                        </td>
                                                                        <td>
                                                                            <asp:FileUpload ID="FileUpload3" runat="server" Width="200px" /><div id="sb_namenum1">
                                                                                <span style="color: Red;">格式为.jpg.gif.png,不大于500K</span></div>
                                                                        </td>
                                                                        <td>
                                                                            请按照下的面的图样说明选择图样
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="8">
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 50px; width: 260px;" align="center">
                                                                <asp:Image ID="Image2" runat="server" Width="150px" Height="150px" />
                                                                <br />
                                                                图样2
                                                            </td>
                                                            <td>
                                                                <asp:FileUpload ID="FileUpload4" runat="server" Width="200px" /><span style="color: Red;">
                                                                    <br />
                                                                    格式为.jpg.gif.png,不大于500K</span>
                                                            </td>
                                                            <td>
                                                                以颜色组合或者着色图样申请商标注册<br />
                                                                的，应分别上传着色图样及黑白稿，黑<br />
                                                                白稿在图样2中上传
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="32" align="right">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="32" align="right">
                                                                &nbsp;
                                                            </td>
                                                            <td align="center" valign="top">
                                                                <table width="400" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="100">
                                                                            <asp:Button ID="Button2" CssClass="BtnShow" runat="server" Text="预  览" />
                                                                        </td>
                                                                        <td width="100">
                                                                            <asp:Button ID="Button5" CssClass="BtnShow" runat="server" Text="保  存" />
                                                                        </td>
                                                                        <td width="100">
                                                                            <asp:Button ID="Button3" UseSubmitBehavior="false" CssClass="BtnShow" runat="server"
                                                                                Text="确认提交" />
                                                                        </td>
                                                                        <td width="100">
                                                                            <asp:Button ID="Button4" CssClass="BtnShow" runat="server" Text="放弃提交" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id="div_a" runat="server">
    </div>
    <script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
    <script src="js/CheckTrademark.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ClientValidatePhone() {
            var id = $("#Hi_MemberId").val();
            var lname = $("#c_Phone").val();
            var rand = Math.floor(Math.random() * 1000000);
            if (lname != "") {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "Handler.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
                    success: function (msg) {
                        if (msg == "1") {
                            alert("该手机号码已注册！");
                            $("#c_Phone").focus();
                        }
                        else {
                            $("#c_Phone1").html("<img  src='images/tOk.gif' />");
                        }
                    }
                });
            }
            else {
                $("#c_Phone1").html("<img  src='images/tError.gif' />");
            }
        }


        function Jiaofei() {
            if ($("#dd_jiaofeitype").val() == "1") {
                $("#dailifei").hide();
                $("#nodaili").show();
                $("#weituo").hide();
            }
            if ($("#dd_jiaofeitype").val() == "2") {
                $("#dailifei").show();
                $("#nodaili").hide();
                $("#weituo").show();
            }
        }
        function checkOk(obj) {
            if ($("#" + obj).val() != "") {
                $("#" + obj + "1").html("<img  src='images/tOk.gif' />");
            }
            else {
                $("#" + obj + "1").html("<img  src='images/tError.gif' />");
            }
        }
        function Usercheck() {
            if ($("#cb_user").attr("checked") == "checked") {
                var u_mid = $("#Hi_MemberId").val();
                $.ajax({
                    type: "POST",
                    url: "Shop_Manage/Shop_A_Trademark.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "memberId=" + u_mid,
                    success: function (msg) {
                        if (msg == "no") {
                            alert("该会员信息不完整！");
                        }
                        else {
                            $("#Sb_Regname ").val(msg.split('_')[0]);
                            $("#Sb_Reg_Address").val(msg.split('_')[1]);
                            $("#Sb_Reg_youbian").val(msg.split('_')[2]);
                        }
                    }
                });
            }
            else {
                $("#Sb_Regname ").val("");
                $("#Sb_Reg_youbian").val("");
                $("#Sb_Reg_Address").val("");
            }
        }
    </script>
    <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>