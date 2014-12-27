<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_M_System.aspx.cs"
    Inherits="Shop_Manage_shop_upsystem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/vcom.js"></script>
    <script src="js/Calendar.js" type="text/javascript"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>
</head>
<body>
    <h1>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
            class="action-span1">- 公司基本信息设置 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="js/fucties.js"></script>
    <script type="text/javascript" src="js/listtb.js"></script>
    <form id="form1" runat="server">
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    系统代理组织基本信息
                </th>
            </tr>
            <tr>
                <td width="200" align="right">
                    联系人：
                </td>
                <td>
                    <asp:TextBox ID="dlname" class="inputs200text" runat="server" MaxLength="150"></asp:TextBox><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="联系人" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话：
                </td>
                <td>
                    <asp:TextBox ID="dltel" class="inputs200text" runat="server" MaxLength="150"></asp:TextBox><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="电话号码之间用'-'隔开" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    传真：
                </td>
                <td>
                    <asp:TextBox ID="dlchuanzhen" class="inputs200text" runat="server" MaxLength="150"></asp:TextBox><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="区号之间用'-'隔开" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    邮编：</td>
                <td>
                     <asp:TextBox ID="txtPostCode" class="inputs200text" runat="server" MaxLength="150"></asp:TextBox><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="邮编" />
                        </td>
            </tr>
            <tr>
                <td align="right">
                    地址:</td>
                <td>
                     <asp:TextBox ID="txtAddress" class="inputs200text" runat="server" MaxLength="150"></asp:TextBox><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="地址" />
                        </td>
            </tr>
            <tr>
                <td align="right">
                    代理组织名称(中文)：
                </td>
                <td>
                    <input type="text" id="text_cnname" class="inputs200text" runat="server" maxlength="150" /><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="代理组织名称中文名字" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    代理组织名称(英文)：
                </td>
                <td>
                    <input type="text" id="text_enname" class="inputs200text" runat="server" maxlength="150" /><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="代理组织英文名字" />
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    文件说明书及浏览器操作说明(中文版)
                </th>
            </tr>
            <tr>
                <td align="right">
                    专利说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_zl" runat="server" />
                            </td>
                            <td>
                                <%=zlbook %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_zl" runat="server" Text="立即上传" OnClick="btn_zl_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商标说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_sb" runat="server" />
                            </td>
                            <td>
                                <%=sbbook %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_sb" runat="server" Text="立即上传" OnClick="btn_sb_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    浏览器操作说明：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_views" runat="server" />
                            </td>
                            <td>
                                <%=viewsbook %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_views" runat="server" Text="立即上传" OnClick="btn_views_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    文件说明书及浏览器操作说明(英文版)
                </th>
            </tr>
            <tr>
                <td align="right">
                    专利说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_zl_en" runat="server" />
                            </td>
                            <td>
                                <%=zlbook_en %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_zl_en" runat="server" Text="立即上传" OnClick="btn_zl_en_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商标说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_sb_en" runat="server" />
                            </td>
                            <td>
                                <%=sbbook_en %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_sb_en" runat="server" Text="立即上传" OnClick="btn_sb_en_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    浏览器操作说明：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_views_en" runat="server" />
                            </td>
                            <td>
                                <%=viewsbook_en %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_views_en" runat="server" Text="立即上传" OnClick="btn_views_en_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    文件说明书及浏览器操作说明(韩文版)
                </th>
            </tr>
            <tr>
                <td align="right">
                    专利说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_zl_kr" runat="server" />
                            </td>
                            <td>
                                <%=zlbook_kr %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_zl_kr" runat="server" Text="立即上传" OnClick="btn_zl_kr_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商标说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_sb_kr" runat="server" />
                            </td>
                            <td>
                                <%=sbbook_kr %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_sb_kr" runat="server" Text="立即上传" OnClick="btn_sb_kr_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    浏览器操作说明：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_views_kr" runat="server" />
                            </td>
                            <td>
                                <%=viewsbook_kr %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_views_kr" runat="server" Text="立即上传" OnClick="btn_views_kr_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    文件说明书及浏览器操作说明(日文版)
                </th>
            </tr>
            <tr>
                <td align="right">
                    专利说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_zl_jp" runat="server" />
                            </td>
                            <td>
                                <%=zlbook_jp %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_zl_jp" runat="server" Text="立即上传" OnClick="btn_zl_jp_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商标说明书：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_sb_jp" runat="server" />
                            </td>
                            <td>
                                <%=sbbook_jp %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_sb_jp" runat="server" Text="立即上传" OnClick="btn_sb_jp_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    浏览器操作说明：
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fup_views_jp" runat="server" />
                            </td>
                            <td>
                                <%=viewsbook_jp %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span>
                            </td>
                            <td>
                                <asp:Button ID="btn_views_jp" runat="server" Text="立即上传" OnClick="btn_views_jp_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%--<tr>
        <td align="right">商城说明书： </td>
        <td>
          <table>
            <tr>
              <td>
                <asp:FileUpload ID="FileUpload3" runat="server" /></td>
              <td>
                <%=shopbook %>&nbsp;<span style="color: Red;">文件格式为.doc .pdf</span> </td>
              <td>
                <asp:Button ID="Button3" runat="server" Text="立即上传" OnClick="Button3_Click" /></td>
            </tr>
          </table>
        </td>
      </tr>--%>
            <tr>
                <th colspan="2">
                    国外邮寄费用设置
                </th>
            </tr>
            <tr>
                <td align="right">
                    国外邮寄费(RMB)：
                </td>
                <td>
                    <asp:TextBox ID="t_youjifee" class="inputs200text" runat="server" MaxLength="150"></asp:TextBox><img
                        src="images/ico_notice.gif" style="vertical-align: middle; margin-left: 5px;"
                        title="填写正确的金额！" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ValidationGroup="a" ControlToValidate="t_youjifee" Display="Dynamic" SetFocusOnError="true"
                        Text="不能为空！"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator"
                        ValidationGroup="a" ControlToValidate="t_youjifee" Text="格式不合法！" Display="Dynamic"
                        SetFocusOnError="true" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <%--<div class="list-div" id="Div2">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    积分设置
                </th>
            </tr>
            <tr>
                <td align="right">
                    积分兑换比率：
                </td>
                <td>
                    <input type="text" id="text_bilv" class="inputs60text" onkeypress="event.returnValue=IsDigit();"
                     style="ime-mode: disabled;" runat="server" />&nbsp;积分=1元
                </td>
            </tr>
            <tr>
                <td width="200" align="right">
                    完成订单赠送商品相应积分：
                </td>
                <td>
                    <input type="checkbox" runat="server" id="cb_Jifen" /><img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="如果选中，在订单完成时，系统将自动返给会员积分（前提是该订单有返积分）" />
                </td>
            </tr>
            <tr>
                <td align="right" width="200">成功邀请好友赠送积分：</td>  
                <td><input type="checkbox" runat="server" id="cb_please" /><img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="如果选中，那么会员A成功邀请会员B，会员A则得到下行所填积分" /></td>
            </tr>
            <tr>
                <td align="right">成功邀请好友赠送积分数：</td>  
                <td><input type="text" runat="server" id="text_pleasejifen" class="inputs60text" onkeypress="event.returnValue=IsDigit();"
                     style="ime-mode: disabled;" maxlength="10" /><img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="填写数字" /></td>
            </tr>
            <tr>
                <td align="right">注册赠送积分：</td>  
                <td><input type="text" runat="server" id="text_regjifen" class="inputs60text" onkeypress="event.returnValue=IsDigit();"
                     style="ime-mode: disabled;" maxlength="10" /><img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="0为不赠送" /></td>
            </tr>
            <tr>
                <td align="right">评价赠送积分：</td>  
                <td><input type="text" runat="server" id="text_commentjifen" class="inputs60text" onkeypress="event.returnValue=IsDigit();"
                     style="ime-mode: disabled;" maxlength="10" /><img src="images/ico_notice.gif"
                     style="vertical-align:middle; margin-left:5px;" title="0为不赠送" /></td>
            </tr> 
        </table>
    </div>--%>
        <br />
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <td width="200">
                </td>
                <td>
                    <% if (pageupdate)
                       { %><asp:Button ID="btnUpdate" runat="server" Text="修改" class="button" OnClick="btnUpdate_Click"
                           ValidationGroup="a" /><%} %>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div id="div_a" runat="server">
    </div>
    </form>
    <script type="text/javascript" src="js/ss.js"></script>
    <!-- #include file="push.html" -->
</body>
</html>
