<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademarkOrder_list.aspx.cs" Inherits="trademarkOrder_list" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>我的商标订单_服务中心_商标系统_环球汇通</title>
  <meta name="Keywords" content="环球汇通" />
  <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <style type="text/css">
    .aspnetpager a { display: block; float: left; padding: 2px 10px; background: #fff; text-align: center; line-height: 20px; border: 1px solid #ccc; color: #0065DB; margin: 0 3px; }
    .aspnetpager a:hover { border: 1px solid #FF5500; color: #FF5500; background: #FFEEE6; text-decoration: none; }
    .aspnetpager td .pagetext { width: 35px; height: 23px; background: #fff; text-align: center; line-height: 23px; border: 1px solid #ccc; }
    .aspnetpager td .submitbutton { width: 39px; height: 23px; background: url(images/fenbar.jpg); color: #fff; line-height: 23px; text-align: center; border: none; margin-left: 5px; }
  </style>
  <script language="javascript">
    function switchTag1(tag, content, k) {
      for (i = 1; i < 3; i++) {
        if (i == k)
        { document.getElementById(tag + i).className = "font12bt"; document.getElementById(content + i).className = ""; }
        else
        { document.getElementById(tag + i).className = "font12bs"; document.getElementById(content + i).className = "h_lsit_none"; }
      }
    }
    var rollFlag = 0;

    function txt_roll(str) {
      sub_num = str.substring(str.length - 2);
      sub_str = str.substring(0, str.length - 2);

      if (document.all[str].style.display == "") {
        document.all[str].style.display = "none";
        rollFlag = 0;
        return;
      }
      else {
        if (rollFlag != 0) {
          //document.all[sub_str+rollFlag].style.display="none";
          document.all[str].style.display = "";
        }

        document.all[str].style.display = "";
        rollFlag = sub_num;
      }

    }
  </script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
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
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;商标系统&nbsp;>>&nbsp;服务中心&nbsp;>>&nbsp;我的商标订单</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp;</td>
                  <td width="691">&nbsp;</td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td width="691" align="left" valign="top">
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">商标申请案订单</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                            <tr>
                              <td height="26" align="left"> 
                                  <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                         <td height="29" align="right" nowrap="nowrap">
                                                                <strong>订单号</strong>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtOrder" runat="server" Width="70px"></asp:TextBox>
                                                            </td>
                                                            <td width="40" height="29" align="right" nowrap="nowrap">
                                                                <strong>案件号</strong>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtCaseNo" runat="server" Width="70px"></asp:TextBox>
                                                            </td>
                                                            <td width="40" align="center" nowrap="nowrap">
                                                                <strong>申请人</strong>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtApplyUser" runat="server" Width="70px"></asp:TextBox>
                                                            </td>
                                                            <td width="52" align="center" nowrap="nowrap">
                                                                <strong>下单日期</strong>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtOrderDate" runat="server" Width="85px"
                                                                 ReadOnly="true" style="background-image:url(images/user_js_date.gif); 
                                                                                background-repeat:no-repeat; background-position:right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});">
                                                                                </asp:TextBox>
                                                                
                                                            </td>
                                                            <td width="30" align="center" nowrap="nowrap">
                                                                <strong>状态</strong>
                                                            </td>
                                                            <td width="114">
                                                                <asp:DropDownList ID="ddlOrderStatus" runat="server">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td width="110" align="center">
                                                                <asp:Button ID="btnQuery" CssClass="BtnShow" runat="server" Text="查 询" 
                                                                    onclick="btnQuery_Click" />
                                                            </td>
                                                        </tr>
                                                    </table></td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="108" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">订单号</td>
                              <td width="108" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">案件号</td>
                              <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">申请人</td>
                              <td width="78" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">图样</td>
                              <td width="78" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">金额</td>
                              <td width="88" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">下单日期</td>
                              <td width="88" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">订单状态</td>
                               <td width="100" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">操作</td>
                            </tr>
                            <asp:Repeater ID="rp_orderlist" runat="server" OnItemDataBound="rp_orderlist_ItemDataBound">
                              <ItemTemplate>
                                <asp:HiddenField ID="hf_oid" runat="server" Value='<%# Eval("i_Id") %>' />
                                <tr>
                                  <td height="32" align="center" bgcolor="#FFFFFF">
                                    <a href="user_sbddck.aspx?order=<%# Eval("i_Id") %>" class="ac5t">  <%# Eval("nvc_OrderNumber") %></a> 
                                    </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <asp:Repeater runat="server" ID="repTrademark">
                                      <ItemTemplate>
                                        <div style="text-align: center; width: 100%;">
                                           <a title="商标编号：<%#Eval("nvc_SBRegNum")%>" href="user_sbck.aspx?t_r_id=<%#Eval("i_TrademarkId")%>">
                                            <%#Eval("nvc_SBRegNum")%></a>
                                        </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                   <asp:Repeater runat="server" ID="repApply">
                                      <ItemTemplate>
                                        <div style="text-align: center; width: 100%;">
                                           <a title="商标编号：<%#Eval("nvc_SBRegNum")%>" href="user_sbck.aspx?t_r_id=<%#Eval("i_TrademarkId")%>">
                                            <%#Eval("nvc_SBRegNum")%></a>
                                        </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                 </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                   <asp:Repeater runat="server" ID="repPattern">
                                      <ItemTemplate>
                                        <div style="text-align: center; width: 100%;">
                                           <a title="商标编号：<%#Eval("nvc_SBRegNum")%>" href="user_sbck.aspx?t_r_id=<%#Eval("i_TrademarkId")%>">
                                            <%#Eval("nvc_SBRegNum")%></a>
                                        </div>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                 </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("dm_TotalMoney")%>
                                    </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                   <%# Eval("dt_AddTime") %></td>
                                   </td>
                                  <td align="center" bgcolor="#FFFFFF"> <%#ConvertStatus(Eval("i_Status"))%></td>
                                    <td align="center" bgcolor="#FFFFFF">
                                    <%# (Eval("i_Status").ToString() == "0" || Eval("i_Status").ToString() == "1") ? "<a href='user_sbdd.aspx?order=" + Eval("i_Id") + "' class='ac5t'>取消订单</a>" :(Eval("i_Status").ToString() == "5"?"已取消订单":"")%>
                                     </td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="right" class="font12b4e">
                          <table class="aspnetpager" cellspacing="5">
                            <tr>
                              <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="共 %PageCount% 页 " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="确定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" 页" TextBeforeInputBox="跳转到 ">
                              </webdiyer:AspNetPager>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
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
  </form>
</body>
</html>
