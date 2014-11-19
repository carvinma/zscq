<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_MailSystem.aspx.cs" Inherits="Shop_Manage_shop_shezhi" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <title></title>
  <link href="styles/general.css" rel="stylesheet" type="text/css" />
  <link href="styles/main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="js/vcom.js"></script>
  <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
  <form id="form1" runat="server">
  <h1>
    <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">- 邮件设置 </span>
    <div style="clear: both">
    </div>
  </h1>
  <script type="text/javascript" src="js/fucties.js"></script>
  <script type="text/javascript" src="js/listtb.js"></script>
  <div class="form-div">
    <table width="100%" height="28" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#BBDDE5">
      <tr>
        <td width="1%" height="28">&nbsp; </td>
        <td height="29">
          <table border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td width="150" height="28" align="center" id="td0" runat="server"><a href="Shop_M_MailSystem.aspx?status=0"><strong>基本邮件发送设置</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td1" runat="server"><a href="Shop_M_MailSystem.aspx?status=1"><strong>专利邮件发送设置</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td3" runat="server"><a href="Shop_M_MailSystem.aspx?status=3"><strong>专利期限邮件提醒设置</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td2" runat="server"><a href="Shop_M_MailSystem.aspx?status=2"><strong>商标邮件发送设置</strong></a> </td>
              <td width="5" align="center"></td>
              <td width="150" height="28" align="center" id="td4" runat="server"><a href="Shop_M_MailSystem.aspx?status=4"><strong>商标期限邮件提醒设置</strong></a> </td>
              <td width="5" align="center"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
  <div class="list-div">
    &nbsp;语言版本：
    <asp:DropDownList ID="Drp_LanguageList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Drp_LanguageList_SelectedIndexChanged">
    </asp:DropDownList>
  </div>
  <div class="list-div" id="listDiv" runat="server">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          邮件发送设置
        </th>
      </tr>
      <tr>
        <td align="right" width="26%">服务器： </td>
        <td>
          <asp:TextBox ID="smtp" class="inputs200text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right">用户名： </td>
        <td>
          <asp:TextBox ID="smtp_username" class="inputs200text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right">密码： </td>
        <td>
          <asp:TextBox ID="smtp_password" class="inputs200text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right">发件人邮箱： </td>
        <td>
          <asp:TextBox ID="smtp_email" class="inputs200text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right">发件人姓名： </td>
        <td>
          <asp:TextBox ID="smtp_name" class="inputs200text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right">专利会员注册： </td>
        <td>
          <input type="checkbox" runat="server" id="cb_register" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right">标题： </td>
        <td>
          <asp:TextBox ID="register_title" class="inputs400text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right" valign="top">正文： </td>
        <td>
          <asp:TextBox ID="register_body" runat="server" CssClass="input" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
           &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">商标会员注册： </td>
        <td>
          <input type="checkbox" runat="server" id="sb_cb_register" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right">标题： </td>
        <td>
          <asp:TextBox ID="sb_register_title" class="inputs400text" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right" valign="top">正文： </td>
        <td>
          <asp:TextBox ID="sb_register_body" runat="server" CssClass="input" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
            &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="Div_zl" runat="server">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          专利订单邮件发送设置
        </th>
      </tr>
      <tr>
        <td align="right" width="26%">已提交订单,尚未接收汇款： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s1" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content1" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号</td>
      </tr>
      <tr>
        <td align="right">已提交订单,接收部分汇款,缴费中： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s2" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content2" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">已提交订单,接收部分汇款,未缴费： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s3" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content3" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">已提交订单,金额已付,缴费中： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s4" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content4" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">缴费成功,部分金额未付： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s5" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content5" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">缴费成功,发票已发出,请注意查收： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s6" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content6" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">缴费成功： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s7" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content7" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">取消缴费： </td>
        <td>
          <asp:CheckBox ID="cb_zl_s8" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_content8" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="Div_qx" runat="server">
    <table>
      <tr>
        <th colspan="2">
          专利期限邮件提醒设置
        </th>
      </tr>
      <tr>
        <td align="right" width="26%">已完成缴费，等待下次缴费（>90天）： </td>
        <td>
          <asp:CheckBox ID="zl_status" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_con" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<90天： </td>
        <td>
          <asp:CheckBox ID="zl_status90" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_con90" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<60天： </td>
        <td>
          <asp:CheckBox ID="zl_status60" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_con60" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<30天： </td>
        <td>
          <asp:CheckBox ID="zl_status30" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_con30" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<15天： </td>
        <td>
          <asp:CheckBox ID="zl_status15" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_con15" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<0天： </td>
        <td>
          <asp:CheckBox ID="zl_status0" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_zl_con0" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="Div_sb" runat="server">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <th colspan="2">
          商标订单邮件发送设置
        </th>
      </tr>
      <tr>
        <td align="right" width="26%">待付款： </td>
        <td>
          <asp:CheckBox ID="cb_sb_s1" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_content1" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">已付款： </td>
        <td>
          <asp:CheckBox ID="cb_sb_s2" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_content2" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">待审核： </td>
        <td>
          <asp:CheckBox ID="cb_sb_s3" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_content3" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
      <tr>
        <td align="right">已完成： </td>
        <td>
          <asp:CheckBox ID="cb_sb_s4" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_content4" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“Order”代替订单号;“UserName”代替用户昵称;“UserNumber”代替用户编号 </td>
      </tr>
    </table>
  </div>
  <div class="list-div" id="Div_sb_tq" runat="server">
    <table>
      <tr>
        <th colspan="2">
          商标期限邮件提醒设置
        </th>
      </tr>
      <tr>
        <td align="right" width="26%">已完成缴费，等待下次缴费（>90天）： </td>
        <td>
          <asp:CheckBox ID="cb_sb_tq1" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_tq1" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<90天： </td>
        <td>
          <asp:CheckBox ID="cb_sb_tq2" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_tq2" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<60天： </td>
        <td>
          <asp:CheckBox ID="cb_sb_tq3" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_tq3" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<30天： </td>
        <td>
          <asp:CheckBox ID="cb_sb_tq4" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_tq4" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<15天： </td>
        <td>
          <asp:CheckBox ID="cb_sb_tq5" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_tq5" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
      <tr>
        <td align="right">距缴费日期<0天： </td>
        <td>
          <asp:CheckBox ID="cb_sb_tq6" runat="server" />&nbsp;发送邮件</td>
      </tr>
      <tr>
        <td align="right" valign="top">邮件内容： </td>
        <td>
          <asp:TextBox ID="txt_sb_tq6" runat="server" Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
          &nbsp;“UserName”代替用户昵称;“UserNumber”代替用户编号
        </td>
      </tr>
    </table>
  </div>
  <br />
  <br />
  <div class="list-div" style="width: 100%; z-index: 9999; position: fixed; left: 0; bottom: 0px; height: 30px;">
    <table cellspacing='1' cellpadding='3'>
      <tr>
        <td width="100" align="center">&nbsp; </td>
        <td align="left">
          <% if (pageupdate)
             { %>
          <asp:Button ID="btnUpdate" runat="server" Text="修改" class="button" OnClick="btnSubmit_Click" />
          <%} %>
        </td>
      </tr>
    </table>
  </div>
  <div id="div_a" runat="server">
  </div>
  <script type="text/javascript" src="js/ss.js"></script>
  </form>
          <!-- #include file="push.html" -->  
</body>
</html>

