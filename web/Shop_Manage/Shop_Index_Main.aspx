<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_Index_Main.aspx.cs"
    Inherits="Shop_Manage_shop_index_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>

    <script type="text/javascript" src="js/vcom.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="ddslsc" value="0" />
    <h1>
        <span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span>
        <span id="search_id" class="action-span1"></span>
        <div style="clear: both">
        </div>
    </h1><%if (flag[12][0].ToString() == "1")
           { %>
    <div class="list-div">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="4" class="group-title">
                    专利订单统计信息
                </th>
            </tr>
            <tr>
                <td width="20%" >
                    <a href="Shop_M_PatentOrder.aspx?Status=0">全部订单：</a>
                </td>
                <td width="30%">
                    <asp:Label ID="Lb_PatentOrder0" runat="server"></asp:Label>
                </td>
                <td width="20%">
                    <a href="Shop_M_PatentOrder.aspx?Status=1">尚未接收汇款：</a>
                </td>
                <td width="30%">
                   <asp:Label ID="Lb_PatentOrder1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=2">接收部分汇款,缴费中：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_PatentOrder2" runat="server"></asp:Label>
                </td>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=3">接收部分汇款,未缴费：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_PatentOrder3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=4">金额已付,缴费中：</a>
                </td>
                <td>
                   <asp:Label ID="Lb_PatentOrder4" runat="server"></asp:Label>
                </td>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=5">缴费成功,部分金额未付：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_PatentOrder5" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=6">缴费成功,发票已发出：</a>
                </td>
                <td>
                   <asp:Label ID="Lb_PatentOrder6" runat="server"></asp:Label>
                </td>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=7">缴费成功订单：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_PatentOrder7" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=8">取消缴费订单：</a>
                </td>
                <td>
                   <asp:Label ID="Lb_PatentOrder8" runat="server"></asp:Label>
                </td>
                <td>
                    <a href="Shop_M_PatentOrder.aspx?Status=9">无效订单：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_PatentOrder9" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <br /><%} %>
    <%if (flag[22][0].ToString() == "1"){ %>
    <div class="list-div">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="4" class="group-title">
                    商标订单统计信息
                </th>
            </tr>
            <tr>
                <td width="20%" >
                    <a href="Shop_M_TrademarkOrder.aspx?Status=0">全部订单：</a>
                </td>
                <td width="30%">
                    <asp:Label ID="Lb_TrademarkOrder0" runat="server"></asp:Label>
                </td>
                <td width="20%">
                    <a href="Shop_M_TrademarkOrder.aspx?Status=1">待付款订单：</a>
                </td>
                <td width="30%">
                   <asp:Label ID="Lb_TrademarkOrder1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Shop_M_TrademarkOrder.aspx?Status=2">待缴费订单：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_TrademarkOrder2" runat="server"></asp:Label>
                </td>
                <td>
                    <a href="Shop_M_TrademarkOrder.aspx?Status=3">已待出发票订单：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_TrademarkOrder3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Shop_M_TrademarkOrder.aspx?Status=4">已完成订单：</a>
                </td>
                <td>
                   <asp:Label ID="Lb_TrademarkOrder4" runat="server"></asp:Label>
                </td>
                <td>
                    <a href="Shop_M_TrademarkOrder.aspx?Status=5">无效订单：</a>
                </td>
                <td>
                    <asp:Label ID="Lb_TrademarkOrder5" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div><br /><%} %>
   <%if (flag[12][0].ToString() == "1" || flag[22][0].ToString() == "1")
     { %>
    <div class="list-div">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="4" class="group-title">
                    其它统计信息
                </th>
            </tr>
            <tr>
                <td width="20%" >
                   <%if (flag[12][0].ToString() == "1") {%> 
                     <a href="Shop_M_Patent.aspx">专利个数：</a><%} %>
                </td>
                <td width="30%">
                  <%if (flag[12][0].ToString() == "1") {%> 
                    <asp:Label ID="Lb_PatentCount" runat="server"></asp:Label>
                </td><%} %>
               <td width="20%">                 
                     <%if (flag[22][0].ToString() == "1" )    {%> 
                     <a href="Shop_M_Trademark.aspx">商标个数：</a><%} %>
                </td>
                <td width="30%">
                  <%if (flag[22][0].ToString() == "1")    {%>
                   <asp:Label ID="Lb_TrademarkCount" runat="server"></asp:Label>
                </td><%} %>
            </tr>
        </table>
    </div><br /><%} %>
    <div class="list-div">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="4" class="group-title">
                    服务器参数信息
                </th>
            </tr>
            <tr>
                <td width="20%">
                    服务器操作系统：
                </td>
                <td width="30%">
                    Windows 2003
                </td>
                <td width="20%">
                    服务器IP：
                </td>
                <td width="30%">
                    122.115.63.123
                </td>
            </tr>
            <tr>
                <td>
                    服务器端口：
                </td>
                <td>
                    80
                </td>
                <td>
                    MsSQL 版本：
                </td>
                <td>
                    SQL2005
                </td>
            </tr>
            <tr>
                <td>
                    IIS版本：
                </td>
                <td>
                    Microsoft-IIS/6.0
                </td>
                <td>
                    服务器时间：
                </td>
                <td>
                    2011-12-27 19:40:09
                </td>
            </tr>
            <tr>
                <td>
                    脚本超时时间：
                </td>
                <td>
                    90 秒
                </td>
                <td>
                    解译引擎：
                </td>
                <td>
                    VBScript/5.6.8850
                </td>
            </tr>
            <tr>
                <td>
                    编码：
                </td>
                <td>
                    GBK
                </td>
                <td>
                    文件上传的最大大小：
                </td>
                <td>
                    2M
                </td>
            </tr>
            <tr>
                <td valign="top">
                    组件支持：
                </td>
                <td colspan="3">
                    Scripting.FileSystemObject<font color="#888888">&nbsp;(FSO 文本文件读写)</font> &nbsp;<font
                        class="fonts"><b>√</b></font> <a title=''></a>
                    <br>
                    Adodb.connection<font color="#888888">&nbsp;(ADO 数据对象)</font> &nbsp;<font class="fonts"><b>√</b></font>
                    <a title='2.8'>2.8</a><br>
                    SoftArtisans.FileUp<font color="#888888">&nbsp;(SA-FileUp 文件上传)</font> &nbsp;<font
                        color="red"><b>×</b></font><br>
                    JMail.SmtpMail<font color="#888888">&nbsp;(Dimac JMail 邮件收发)</font> &nbsp;<font color="red"><b>×</b></font><br>
                </td>
            </tr>
        </table>
    </div>

    <div id="footer">
        版权所有 &copy; 2013-2016 北京宇光宏达，并保留所有权利。</div>
    <div id="ddtx" style="position:fixed;_position:absolute; right:0; bottom:-80px; z-index:9999; display:none;">
<table width="251" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="79" align="left" valign="top">
    <table width="251" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="27" align="left" valign="top">
        <table width="251" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="217" height="27" align="left"><img src="images/dingdan1.gif" width="217" height="27" /></td>
            <td width="34" align="left"><img onclick="txyc()" style="cursor:pointer;" src="images/dingdan2.gif" width="34" height="27" /></td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td height="52" background="images/dingdan4.gif">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="85"></td>
            <td width="73" height="34" id="ddsl"></td>
            <td width="93" align="left" style="font-size:12px;"><a onmouseover="gb(1)" onmouseout="gb(0)" href="Shop_M_Order.aspx?status=0">点击查看</a></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>
    <div id="div_a" runat="server">
    </div>
    </form>
        <!-- #include file="push.html" -->  
</body>
</html>

