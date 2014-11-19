<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_TrademarkInfo.aspx.cs" Inherits="Shop_Manage_shop_addhw" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>     
    <script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript">
          function IsDigit() {
              return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
          }     
  </script>
    <script src="../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/vcom.js"></script>

    <style type="text/css">
        .alertfont
        {
            border: solid 1px #fe8686;
            padding: 1px;
            background: #dfeef5;
            color: #fe4343;
        }
        .alertfont img
        {
            margin-bottom: -3px;
        }
    </style>
    <style type="text/css">
        .pager
        {
            margin: 10px auto 0px auto;
        }
        .pager td
        {
            font-size: 12px;
            padding: 2px;
        }
        .pager td a
        {
            border: solid 1px #578ece;
            padding: 1px 5px 1px 5px;
        }
        #aspPage_input
        {
            margin-bottom: 2px;
        }
    </style>
    <style type="text/css">
        .uploaddiv
        {
            float: left;
            width: 82px;
            position: relative;
            text-align: center;
            border: solid 1px green;
        }
        .uploaddiv:hover
        {
            color: green;
        }
        .upload
        {
            cursor: pointer;
            border: none;
            width: 70px;
            height: 22px;
            filter: alpha(opacity=0);
            opacity: 0.0;
            -moz-opacity: 0.0;
            position: absolute;
            left: 0;
            top: 0;
        }
    </style>
    <style type="text/css">
        .checkprodiv
        {
            position: fixed;
            _position: absolute;
            top: 40px;
            height: 600px;
            width: 100%;
            z-index:1000;
        }
         .inputs110text{width:110px;height:18px;line-height:18px;}
.inputs110text:hover{width:110px;height:18px;line-height:18px;border:solid 2px #eb10a3d;}

  
         .suojudiv{ width:210px; float:left; padding:5px; border:solid 1px #ffffff;} 
         .suojudiv:hover{ border:solid 1px #aaaaaa;}
         .suojudiv div{float:left; margin-left:5px;} 
         .suojudiv div.name{ width:110px; height:45px; overflow:hidden;} 
          #msg_win{background:#EAEAEA;width:450px;position:absolute;right:0;font-size:12px;font-family:Arial;margin:0px;display:none;overflow:hidden;z-index:99;}
    #msg_win .icos{position:absolute;top:2px;top:0px;right:2px;z-index:9;}
    .icos a{float:left;color:#833B02;margin:1px;text-align:center;font-weight:bold;width:14px;height:22px;line-height:22px;padding:1px;text-decoration:none;font-family:webdings;}
    .icos a:hover{color:#fff;}
    #msg_title{background:#D10003;border-bottom:1px solid #A67901;border-top:1px solid #FFF;border-left:1px solid #FFF;color:#000;height:25px;line-height:25px;text-indent:5px;}
    #msg_content{margin:5px;margin-right:0;width:440px;height:auto;overflow:hidden;border:1px solid #A67901;}
     </style>
    <script language="javascript" type="text/javascript">
        document.onkeydown = function(e)                //网页内按下回车触发
        {
            var theEvent = window.event || e;
            var code = theEvent.keyCode || theEvent.which;
            if (code == 13) {
                if (document.getElementById("checkproduct").style.display == '') {
                    document.getElementById("bt_search").click(); //服务器控件Submit1点击事件被触发
                    return false;
                }
            }
        }
    </script>

    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>

    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/ShowKeyword.js"></script>
</head>
<body>
    <form runat="server">
      <%-- 弹出框 START--%>
        <div id="msg_win" style="display:block;top:490px;visibility:visible;opacity:1;">
        <div class="icos">
        <a id="msg_min" title="最小化" href="javascript:void 0">_</a>
        <a id="msg_close" title="关闭" href="javascript:void 0">×</a>
        </div>
        <div id="msg_title">会员信息及费用情况</div>
	        <div id="msg_content">
                <div class="list-div">
		           <table cellspacing='1' cellpadding='3' >
                    <tr>
                        <td colspan="2" align="center"><strong>费用信息</strong></td>
                    </tr> 
                    <tr>
                        <td align="right">会员编号：</td>
                         <td align="left">
                             <asp:Label ID="lb_usernum" runat="server" Text=""></asp:Label></td>
                         
                    </tr> 
                      <tr>
                        <td align="right">会员名：</td>
                         <td align="left">
                             <asp:Label ID="lb_username" runat="server" Text=""></asp:Label></td>                         
                    </tr> 
                   <tr>
                <td align="right" style="width:200px;" >联系人姓名：</td>  
                <td><%= Name%></td>
            </tr><%if (IdCard != "")
                   { %>
                 <tr>
                <td align="right">身份证号码：</td>  
                <td><%= IdCard%></td>
            </tr><%} %>
            <tr>
                <td align="right">
                    联系人电话：
                </td>
                <td>
                   <%=Tel %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    联系人传真：
                </td>
                <td>
                   <%=ChuanZhen %>
                </td>
            </tr> 
            <tr>
                <td align="right">
                    联系人地址：
                </td>
                <td>
                     <%= Address%>
                </td>
            </tr> 
            <tr id="tr_jno" runat="server" visible="false">
                <td align="right">联系人邮编：</td>
                <td>  <%=YouBian %></td>
            </tr> 
            <tr>
                <td align="right">QQ：</td>
                <td>  <%=QQ %></td>
            </tr>


                    <tr>
                        <td width="20%" align="right" valign="top">预付款:</td>
                        <td width="30%" >     
                        <asp:Literal ID="Ltl_VipYuFuKuan" runat="server"></asp:Literal>
                        </td>
                        </tr><tr>
                        <td width="20%" align="right" valign="top">余额:</td>
                        <td width="30%" >     
                        <asp:Literal ID="Ltl_VipYuE" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right" valign="top">欠费:</td>
                        <td width="30%" >     
                        <asp:Literal ID="Ltl_VipQianFei" runat="server"></asp:Literal>
                        </td>
                      </tr>  <tr>
                        <td width="20%" align="right" valign="top">信用等级:</td>
                        <td width="30%" >   
                            <asp:Image ID="Ltl_VipXinYong" runat="server" Width="50" Height="50" />  
                       
                        </td>
                    </tr>
                   </table>
                </div>
	        </div>
        </div>
        <%-- 弹出框 END--%>
     <input type="hidden" runat="server" id="HI_ATT" value="" />
    <input type="hidden" id="Hi_TId" name="Hi_TId" runat="server" value="0" />
    <input type="hidden" id="Hi_Matching" runat="server" value="" />     
    <input type="hidden" id="Hi_Guige" runat="server" value="" /> 
    <input type="hidden" id="Hi_ffTId" name="Hi_ffTId" runat="server" value="0" />
    <h1>
        <span class="action-span"><a href="Shop_M_TradeMark.aspx?<%=returnurl%>">商标列表</a></span><span
            class="action-span1"><a href="Shop_Index_Main.aspx">管理中心-</a> </span><span id="Span1"
                class="action-span1" > 商标基本信息</span>
        <div style="clear: both; text-align: right;">
        </div>
        </h1>
    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>
    <div class="list-div" id="listDiv">
       
            <table>
               <tr>
                <th colspan="3">
              录入的商标信息
                </th>
            </tr> 
              <tr>
                <td align="right">
                商标注册号：
                </td>
                <td>
                    <%=SBRegNum %>
                </td>  <td rowspan="10" style="width:600px;">
             <table>
             <tr>
                <td align="center" style="width:200px;">主体资格证明</td>   <td align="center" style="width:200px;">商标注册证书</td> 
                </tr>
                <tr>
                <td align="center" >
                    <asp:Image ID="Image1" ImageUrl="images/zwtp.gif" runat="server" Width="100px" Height="80px"/> </td> 
                   <td align="center" >
                    <asp:Image ID="Image3" ImageUrl="images/zwtp.gif" runat="server" Width="100px" Height="80px"/> </td> <td align="center" >
                   </td>
            </tr>  
         
               <tr>
                <td align="center">商标申请书：</td><td align="center">商标委托书：</td>
                </tr> 
                  <tr>
                <td align="center" >
                    <asp:Image ID="Image2" ImageUrl="images/zwtp.gif" runat="server" Width="100px" Height="80px"/> </td> 
                   <td align="center" >
                    <asp:Image ID="Image4" ImageUrl="images/zwtp.gif" runat="server" Width="100px" Height="80px"/> </td> <td align="center" >
                   </td>
            </tr> 
          
             </table>             
             </td>
            </tr>    <tr>
                <td align="right" style="width:200px;">
                   商标类别：
                </td>
                <td >
                    <%= SBRegaType%>
                </td>
           
            </tr>
               <tr>
                <td align="right" >缴费类型：</td>  
                <td><%= JiaoFeiType%></td>
            </tr>           
                 <tr>
                <td align="right" >缴费状态：</td>  
                <td><%= isjiaofei%></td>
            </tr>  
            <tr>
                <td align="right">商标描述：</td>
                <td>  <%=SBRegMiaoshu %></td>
            </tr>  
            <tr>                                                                                         
                <td align="right">注册人姓名：</td>
                <td>  <%=SBRegName %></td>
            </tr>  
             <tr>
                <td align="right">注册人地址：</td>
                <td>  <%=SBRegAddress %></td>
            </tr> 
               
             <tr>
                <td align="right">邮政编码：</td>
                <td>  <%=SBRegYouBian %></td>
            </tr> 
             <tr>
                <td align="right">商标注册日：</td>
                <td>  <%=SBRegTime%></td>
            </tr>   
              <tr>
                <td align="right">商标有效期限截止日：</td>
                <td>  <%=daoqitime%></td>
            </tr>  
              <tr>
                <td align="right">距截止日的所剩天数：</td>
                <td>  <%=shengtime%>天</td>
            </tr>  

        </table>
         <%if (usertype == 3)
           { %>     
            <table>
               <tr>
                <th colspan="3">
              第三方信息
                </th>
            </tr>
                <tr>
                    <td style="width:200px;" align="right" valign="middle">
                      案卷号：
                    </td>
                    <td  >
                        <%=anjuanhao%>
                    </td>
                </tr>
                <tr>
                    <td width="200" align="right" >
                       联系人：
                    </td>
                    <td >
                        <%=linkman%>
                    </td>
                </tr>
                <tr>
                    <td  height="32" align="right" valign="middle">
                        地址：
                    </td>
                    <td >
                        <%=linkaddress%>
                    </td>
                </tr>
                <tr>
                    <td height="32" align="right" valign="middle">
                       电话：
                    </td>
                    <td >
                        <%=linktel%>
                    </td>
                </tr>
                <tr>
                    <td  height="32" align="right" valign="middle">
                        &nbsp;
                    </td>
                    <td align="left" valign="middle">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td  height="32" align="right" valign="middle">
                        &nbsp;
                    </td>
                    <td align="left" valign="middle">
                    </td>
                </tr>
            </table>
            <%} %>
    </div> 
  <div class="list-div" id="Div1">
          <table cellspacing='1' cellpadding='3' id="tblData">
                <tr>
                    <th width="2%"></th>
                    <th width="10%">账单号</th>
                    <th width="10%">添加时间</th>
                       <th width="10%">收款时间</th>
                          <th width="10%">缴费时间</th>
                             <th width="10%">发送时间</th>  
                              <th width="10%">收据时间</th>  
                               <th width="12%">备注1</th> 
                               <th width="12%">备注2</th>
                    <th width="5%">操作</th>
                </tr>
                <asp:Repeater ID="reptlist" runat="server" >
                    <ItemTemplate>
                        <tr>
                            <td height="26" align="center">
                            <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value='<%#Eval("i_Id") %>'  /></td>
                            <td align="center">
                              <input type="text"  id='txt_orderNum<%# Eval("i_Id")%>' class="inputs110text"  value='<%#Eval("nvc_OrderNum")%>'/>
                            </td>
                                
                            <td align="center">
                               <input type="text"  id='dt_addtime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_AddOrderTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center">
                              <input type="text"  id='dt_shoutime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_ShouKuanTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center">
                              <input type="text"  id='dt_jiaofeitime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_JiaoFeiTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center">
                              <input type="text"  id='dt_sendtime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_SendInfoTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center">
                             <input type="text"  id='dt_shoujutime<%# Eval("i_Id") %>' class="inputs110text" value='<%# Convert.ToDateTime(Eval("dt_KaiJuTime")).ToShortDateString() %>'   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center">
                             <input type="text"  id='t_info1<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info1") %>'/>
                            </td>
                               <td align="center">
                             <input type="text"  id='t_info2<%# Eval("i_Id") %>' class="inputs130text" value='<%#Eval("nvc_Info2") %>'/>
                            </td>
                            <td align="center">
                                <input id="Btn_Update" type="button" class="inputicoeditbutton" onclick="Edit(<%#Eval("i_Id") %>)" />

                           <%--     <input type="button" title="修改" class="inputicoeditbutton" />
--%>

                               <%-- <asp:Button ID="Btn_Update" runat="server" Text="修改" CssClass="button" CommandName='<%#Eval("i_Id") %>'  OnCommand='Edit'/>--%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
              
                <tr id="tRow0">
                            <td height="26" align="center" width="2%">
                           </td>
                            <td align="center" width="10%">
                              <input type="text" onblur="bb();"  name='txt_orderNum' class="inputs110text"  value=''/>
                            </td>
                                
                            <td align="center" width="10%">
                               <input type="text"  name='dt_addtime' class="inputs110text" value=''  readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
                            </td>
                               <td align="center" width="10%">
                              <input type="text"  name='dt_shoutime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center" width="10%">
                              <input type="text"  name='dt_jiaofeitime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center" width="10%">
                              <input type="text"  name='dt_sendtime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center" width="10%">
                             <input type="text"  name='dt_shoujutime' class="inputs110text" value=''   readonly="readonly"  style="background-image: url(../images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                            </td>
                               <td align="center" width="10%">
                             <input type="text"  name='t_info1' class="inputs130text" value='' />
                            </td>
                               <td align="center" width="10%">
                             <input type="text"  name='t_info2' class="inputs130text" value=''/>
                            </td>
                            <td align="center" width="5%">
                             
                            </td>
                        </tr>
            </table>
                    <table cellspacing='1' cellpadding='3'>
                <tr >
                    <td height="25" width="40%" align="right"> 
  <input type="hidden" id="hidNum" name="hidNum" value="0" /> 
 <input type="button" id="btnAdd" runat="server" class="button" style="display:none;" value="增加一条明细" />
    </td> <td align="left"><asp:Button
     ID="Button1" runat="server" Text="提交数据" onclick="Button1_Click" OnClientClick="return dalclick();" /></td>
                </tr>
            </table>
            <table cellspacing='1' cellpadding='3'>
                <tr align="left">
                    <td height="25"><input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value=''
                     />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
                  
                     </td> 
                </tr>
            </table>
        </div>
          <div style="text-align:center">
    </div>
    </div>
    <input type="hidden" id="HiddenDel" value="" runat="server" />
    <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="40%">
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 15%; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr><td width="40%" align="right"><img alt="" width="30" src="images/caozuo_2.jpg" /></td><td width="60%" align="left" style="font-size:14px;">&nbsp;删除成功</td></tr>
                    </table>
                </td>
                <td width="45%">
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px;

        height: 100px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>&nbsp;

                </td>

                <td width="230px">

                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                        <tr>

                            <td width="11" height="27" background="images/ts_bg.jpg"><img src="images/ts1.jpg" width="11" height="27" /></td>

                            <td align="left" background="images/ts_bg.jpg" style="color: #FFF; font-size: 14px;

                                line-height: 20px; font-weight: bold;">

                                温馨提示

                            </td>

                            <td width="34" background="images/ts_bg.jpg" ><img alt="取消" src="images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /></td>

                        </tr>

                    </table>

                </td>

                <td>&nbsp;

                </td>

            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece;
                    background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="images/caozuo_1.jpg" /></td>
                            <td width="80%" align="left" style="font-size:14px;">&nbsp;确认要进行删除操作吗？</td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece;

                    background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align:center;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td style=" font-size: 14px;"><a><asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnDel_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td></tr></table>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>&nbsp;

                </td>

                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;

                    padding: 5px; width: 200px; font-size: 16px;">

                    <table width="100%" cellpadding="0" cellspacing="0">

                        <tr>

                            <td width="25%" align="right"><img alt="" width="30" src="images/caozuo_3.jpg" /></td><td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录</td>

                        </tr>

                    </table>

                </td>

                <td width="40%">

                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" language="javascript">
        function divoperation(ctype, divid)//操作div
        {
            if (ctype == 2) {
                document.getElementById("divbox" + divid).style.display = "none";
            }
            else {
                for (var i = 1; i < 4; i++) {
                    if (i == divid) {
                        document.getElementById("divbox" + i).style.display = "";
                    }
                    else {
                        document.getElementById("divbox" + i).style.display = "none";
                    }
                }
            }
        }
        if (document.getElementById('HiddenDel').value == "del") {
            divoperation(1, '3');
            setTimeout("divoperation(2,'3')", 1500); //1.5秒
        }
        function xwshow() {
            var inputs = document.getElementsByName("inputPageid");
            var jb = 0;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == true) {
                    jb = 1;
                }
            }
            if (jb == 0) {
                divoperation(1, '2');
                setTimeout("divoperation(2,'2')", 1500); //1.5秒
            }
            else {
                divoperation(1, '1');
            }
        }
    </script>
    
    <img style="position: absolute; display: none; border: solid 2px #578ece;" id="xsimg"
        alt="" src="images/noimage.jpg" width="164" />

    <div id="div_a" runat="server">
    </div>
    </form>
      <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
    function bb() {
        var lname = document.getElementById('btnAdd');
        lname.style.display = "block";
    }
    function checknull() {
        var lname = document.getElementById('btnAdd');
        lname.style.display = "block";
    }
    var s = "";
    function dalclick() {
        var datanum = document.getElementsByName('txt_orderNum');        
        var addtime = document.getElementsByName('dt_addtime');
        var shoutime = document.getElementsByName('dt_shoutime');
        var jiaofeitime = document.getElementsByName('dt_jiaofeitime');
        var sendtime = document.getElementsByName('dt_sendtime');
        var shoujutime = document.getElementsByName('dt_shoujutime');
        var info1 = document.getElementsByName('t_info1');
        var info2 = document.getElementsByName('t_info2');
        var hi = document.getElementById('HI_ATT');
        for (var i = 0; i < datanum.length; i++) {
            if (datanum[i].value == "") {
                alert("请填写账单号");
                return false;
            }
            else {
               // alert(i);
                $.ajax({
                    type: "POST",
                    url: "Shop_A_DataOrder.ashx",
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: "flag=SbDataNum&data=" + datanum[i].value,
                    success: function (msg) {
                        if (msg == "0") {
                            alert("账单号重复！");
                            return false;
                        }
                    }
                });
            }
            if (addtime[i].value == "") {
                alert("请填写添加时间");
                return false;
            }
            if (shoutime[i].value == "") {
                alert("请填写收款时间");
                return false;
            }
            if (jiaofeitime[i].value == "") {
                alert("请填写缴费时间");
                return false;
            }
            if (sendtime[i].value == "") {
                alert("请填写发送时间");
                return false;
            }
            if (shoujutime[i].value == "") {
                alert("请填写收据时间");
                return false;
            }
            else {
                if (datanum[i].value != "") {
                    s += datanum[i].value + "_" + addtime[i].value + "_" + shoutime[i].value + "_" + jiaofeitime[i].value + "_" + sendtime[i].value + "_" + shoujutime[i].value + "_" + info1[i].value + "_" + info2[i].value + "|";
                }
            }
        }
        hi.value = s;
    }


</script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#btnAdd").click(function () {
            if (dalclick()) {
                var num = $("#hidNum").val(); //
                num = parseInt(num);
                num++; //点击自加
                $("#hidNum").val(num); //重新赋值          
                $("#tRow0").clone(true).attr("id", "tRow" + num).appendTo("#tblData"); //clone tr 并重新给定ID,装到table
                $("#tRow" + num + " td").each(function () {//循环克隆的新行里面的td
                    $(this).find("input[type='text']").val(""); //清空克隆行的数据
                });
            }            
        });

    });
</script>

<script type="text/javascript">
    if (isIE) {
        window.onscroll = divIE6;
    }
    function divIE6() {
        var top1 = document.documentElement.scrollTop;
        document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
        document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
        document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
    }
</script>
<script type="text/javascript">
    function SelAll() {
        var inputs = document.getElementsByTagName("input");
        var checkall = document.getElementById("checkall");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox") {
                inputs[i].checked = checkall.checked;
            }
        }
    }
    function Selbox(obj) {
        var inputs = document.getElementsByName("inputPageid");
        var checkall = document.getElementById("checkall");
        if (obj.checked == false) {
            checkall.checked = false;
        }
        else {
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == false) {
                    checkall.checked = false;
                    return;
                }
                else {
                    checkall.checked = true;
                }
            }
        }
    }

    function Edit(obj) {
        var data1 = $("#txt_orderNum" + obj).val();
        var data2 = $("#dt_addtime" + obj).val();
        var data3 = $("#dt_shoutime" + obj).val();
        var data4 = $("#dt_jiaofeitime" + obj).val();
        var data5 = $("#dt_sendtime" + obj).val();
        var data6 = $("#dt_shoujutime" + obj).val();
        var data7 = $("#t_info1" + obj).val();
        var data8 = $("#t_info2" + obj).val();
        var datastr = data1 + "|" + data2 + "|" + data3 + "|" + data4 + "|" + data5 + "|" + data6 + "|" + data7 + "|" + data8;
        $.ajax({
            type: "POST",
            url: "Shop_A_DataOrder.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=dataOrder&id=" + obj + "&data=" + datastr,
            success: function (msg) {
                //alert(msg);
                if (msg == "ok") {
                    alert("修改成功");
                }
                if (msg == "0") {
                    alert("账单号重复！");
                }
            }
        });
    }
</script>

<script language="javascript">
    var Message = {
        set: function () {//最小化与恢复状态切换
            var set = this.minbtn.status == 1 ? [0, 1, 'block', this.char[0], '最小化'] : [1, 0, 'none', this.char[1], '展开'];
            this.minbtn.status = set[0];
            this.win.style.borderBottomWidth = set[1];
            this.content.style.display = set[2];
            this.minbtn.innerHTML = set[3]
            this.minbtn.title = set[4];
            this.win.style.top = this.getY().top;
        },
        close: function () {//关闭
            this.win.style.display = 'none';
            window.onscroll = null;
        },
        setOpacity: function (x) {//设置透明度
            var v = x >= 100 ? '' : 'Alpha(opacity=' + x + ')';
            this.win.style.visibility = x <= 0 ? 'hidden' : 'visible'; //IE有绝对或相对定位内容不随父透明度变化的bug
            this.win.style.filter = v;
            this.win.style.opacity = x / 100;
        },
        show: function () {//渐显
            clearInterval(this.timer2);
            var me = this, fx = this.fx(0, 100, 0.1), t = 0;
            this.timer2 = setInterval(function () {
                t = fx();
                me.setOpacity(t[0]);
                if (t[1] == 0) { clearInterval(me.timer2) }
            }, 10);
        },
        fx: function (a, b, c) {//缓冲计算
            var cMath = Math[(a - b) > 0 ? "floor" : "ceil"], c = c || 0.1;
            return function () { return [a += cMath((b - a) * c), a - b] }
        },
        getY: function () {//计算移动坐标
            var d = document, b = document.body, e = document.documentElement;
            var s = Math.max(b.scrollTop, e.scrollTop);
            var h = /BackCompat/i.test(document.compatMode) ? b.clientHeight : e.clientHeight;
            var h2 = this.win.offsetHeight;
            //alert(s + "--" + h + "--" + h2);

            //return { foot: s + h + h2 + 2 + 'px', top: s + h - h2 - 2 + 'px' }
            return { foot: s + h2 + 'px', top: s + 'px' }

        },
        moveTo: function (y) {//移动动画
            clearInterval(this.timer);
            var me = this, a = parseInt(this.win.style.top) || 0;
            var fx = this.fx(a, parseInt(y));
            var t = 0;
            this.timer = setInterval(function () {
                t = fx();
                me.win.style.top = t[0] + 'px';
                if (t[1] == 0) {
                    clearInterval(me.timer);
                    me.bind();
                }
            }, 10);
        },
        bind: function () {//绑定窗口滚动条与大小变化事件
            var me = this, st, rt;
            window.onscroll = function () {
                clearTimeout(st);
                clearTimeout(me.timer2);
                me.setOpacity(0);
                st = setTimeout(function () {
                    me.win.style.top = me.getY().top;
                    me.show();
                }, 600);
            };
            window.onresize = function () {
                clearTimeout(rt);
                rt = setTimeout(function () { me.win.style.top = me.getY().top }, 100);
            }
        },
        init: function () {//创建HTML
            function $(id) { return document.getElementById(id) };
            this.win = $('msg_win');
            var set = { minbtn: 'msg_min', closebtn: 'msg_close', title: 'msg_title', content: 'msg_content' };
            for (var Id in set) { this[Id] = $(set[Id]) };
            var me = this;
            this.minbtn.onclick = function () { me.set(); this.blur() };
            this.closebtn.onclick = function () { me.close() };
            this.char = navigator.userAgent.toLowerCase().indexOf('firefox') + 1 ? ['_', '::', '×'] : ['0', '2', 'r']; //FF不支持webdings字体
            this.minbtn.innerHTML = this.char[0];
            this.closebtn.innerHTML = this.char[2];
            setTimeout(function () {//初始化最先位置
                me.win.style.display = 'block';
                me.win.style.top = me.getY().foot;
                me.moveTo(me.getY().top);
            }, 0);
            return this;
        }
    };
    Message.init();
</script>




