<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_World_Trademark.aspx.cs" Inherits="Shop_Manage_shop_addhw" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>     
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
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
            height: 450px;
            width: 100%;
            z-index:1000;
        }
    </style>
    <style type="text/css">
         .suojudiv{ width:210px; float:left; padding:5px; border:solid 1px #ffffff;} 
         .suojudiv:hover{ border:solid 1px #aaaaaa;}
         .suojudiv div{float:left; margin-left:5px;} 
         .suojudiv div.name{ width:110px; height:45px; overflow:hidden;}
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
    <form id="form1" runat="server">
  
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
       
        <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatLayout="Table">
        <ItemTemplate>
        <table border="0"; cellspacing='1' cellpadding='3' style="width:100%;height:100%;border-width:0px">
          <tr align="center">
                <th colspan="2" align="center" style="font-size:20px;">
                 商标信息注册
                </th>
            </tr>         
          
            <tr>
                <th colspan="2" align="center">
                 联系人信息
                </th>
            </tr> 
              <tr>
                <td align="right" style="width:200px;border-width:0px">交费类型：</td>  
                <td><%# Eval("i_JiaoFeiType").ToString() == "0" ? "数据异常" : Eval("i_JiaoFeiType").ToString() == "1"?"自行缴费":"委托交费"%></td>
            </tr>
            <tr>
                <td align="right" style="width:200px;border-width:0px">联系人姓名：</td>  
                <td><%# Eval("nvc_RealName")%></td>
            </tr>
                 <tr>
                <td align="right">身份证号码：</td>  
                <td><%# Eval("i_UserTypeId").ToString()=="1"? Eval("nvc_IDCard"):""%>(<font style="color:Red;">只有个人注册才有身份证号码</font>)</td>
            </tr>
            <tr>
                <td align="right">
                    联系人电话：
                </td>
                <td>
                  <%# Eval("nvc_TelPhone")%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    联系人传真：
                </td>
                <td>
                <%# Eval("nvc_Faxnumber")%>
                </td>
            </tr> 
            <tr>
                <td align="right">
                 联系人地址：
                </td>
                <td>
                    <%# Eval("nvc_Address")%>
                </td>
            </tr> 
            <tr id="tr_jno" runat="server" visible="false">
                <td align="right">联系人邮编：</td>
                <td> <%# Eval("Nvc_ZipCode")%></td>
            </tr> 
         <%--   <tr>
                <td align="right">QQ：</td>
                <td> <%# Eval("nvc_LinkManCQQ")%></td>
            </tr>--%>
            
            <tr align="center">
                <th colspan="2">
                  本代理组织信息
                </th>
            </tr> 
            <tr>
                <td align="right">联系人：</td>
                <td>&nbsp;  <%#Eval("nvc_DLName")%></td>
            </tr>
            <tr>
                <td align="right">
                    电话：
                </td>
                <td>
                   <%#Eval("nvc_DLTel") %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    传真：
                </td>
                <td>
                    <%#Eval("nvc_DLFaxnumber") %>
                </td>
            </tr>
            <tr>
                <td align="right">
                    代理组织名称(中文)：
                </td>
                <td>
                     <%#Eval("nvc_DLZuzhiName") %>
                </td>
            </tr>
            <tr>
                <td align="right">
                   代理组织名称(英文)：
                </td>
                <td>
                   <%#Eval("nvc_DLZuzhiEnName") %>
                </td>
            </tr>
               <tr align="center">
                <th colspan="2">
              录入的商标信息
                </th>
            </tr> 
       
            <tr>
                <td align="right">
                商标注册号：
                </td>
                <td>
                   <%#Eval("nvc_SBRegNum") %>
                </td>
            </tr>
            <tr>
                <td align="right">
                   类别：
                </td>
                <td>
                  <%#GetTypeGuo(Eval("i_GuoJiId").ToString(),Eval("i_UserTypeId").ToString())%>
                </td>
            </tr>
               <tr>
                <td align="right">商标描述类型：</td>
                <td> <%# Eval("i_MiaoShuType").ToString() == "1" ? "文字商标" : Eval("i_MiaoShuType").ToString() == "2" ? "图形商标" : "文字与图形商标"%></td>
            </tr>  
            <tr>
                <td align="right">商标描述：</td>
                <td> <%# Eval("nvc_SBDescribe")%></td>
            </tr> 
         
              <tr style='<%# (Eval("i_MiaoShuType")=="2"||Eval("i_MiaoShuType")=="3")?"display:block;":"display:none;" %>'>
                <td align="right">请在此处上传图例：</td>
                <td> 
                <img src="" width="200px" height="180px" />
                </td>
            </tr>  
            <tr>                                                                                         
                <td align="right">注册人姓名：</td>
                <td> <%#Eval("nvc_SBRegName") %></td>
            </tr>  
             <tr>
                <td align="right">注册人地址：</td>
                <td>  <%#Eval("nvc_SBRegAddress") %></td>
            </tr> 
               
             <tr>
                <td align="right">邮政编码：</td>
                <td>  <%#Eval("nvc_SBPostcode") %></td>
            </tr> 
               
             <tr>
                <td align="right">注册商标有效期限：</td>
                <td><%#Eval("nvc_SBDaoqiTime") %></td>
            </tr>     <tr>
                <td align="right">交费类型：</td>
                <td><%#Eval("i_JiaoFeiType").ToString()=="1"?"自行缴费" : "代理缴费"%></td>
            </tr> 
              <tr align="center">
                <th colspan="2" style="font-size:20px;">
            商标续展注册申请书和生成商标代理委托书
                </th>
            </tr> 
            
                  <tr style="height:50px;">
                <td align="right">客户签字：</td>
                <td>  </td>
            </tr>   
                    <tr style="height:100px;">
                <td align="right">客户盖章：</td>
                <td>  </td>
            </tr>   
        </table>
        </ItemTemplate>
        </asp:DataList>
       <table style="width:400px;">  <tr>
                <td align="right" style="width:300px;"></td>
                <td>  
                   <%if (jiaofeitype != 0)
                     {
                         if (jiaofeitype == 1)
                         { %> <asp:Button ID="Button1" runat="server" Text=" 商标续展注册申请书" CommandName="1" OnCommand="Button_Click"/>
                      <%} if (jiaofeitype == 2)
                         {%>
                            <asp:Button ID="Button2" runat="server" Text="生成商标代理委托书"  CommandName="2" OnCommand="Button_Click" />   
                    <%}
                     }%>
                       </td>
            </tr> </table>
    </div>  
  
    <img style="position: absolute; display: none; border: solid 2px #578ece;" id="xsimg"
        alt="" src="images/noimage.jpg" width="164" />

    <script type="text/javascript" language="JavaScript" src="../js/moverobj.js"></script>
    <script type="text/javascript" src="js/ss.js"></script>

    <div id="div_a" runat="server">
    </div>
    </form>
    
</body>
</html>




