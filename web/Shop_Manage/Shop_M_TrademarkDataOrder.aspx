<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_TrademarkDataOrder.aspx.cs" Inherits="Shop_Manage_Shop_M_Patent" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <style type="text/css">
    .pager
    {
	    margin:10px auto 0px auto;
    }
    .pager td
    {
        font-size: 12px;
        padding: 2px;
    }
    .pager td a
    {
	    border:solid 1px #578ece;
	    padding:1px 5px 1px 5px;
    }
    #aspPage_input
    {
        margin-bottom:2px;   
    }
 .inputs110text{width:110px;height:18px;line-height:18px;}
.inputs110text:hover{width:110px;height:18px;line-height:18px;border:solid 2px #eb10a3d;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1><span class="action-span"><a href="Shop_A_TrademarkDataOrder.aspx">添加商标数据账单</a></span>
            <span class="action-span1">
                <a href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">
                    - 数据订单列表 </span>
            <div style="clear: both">
            </div>
        </h1>
  
        <div class="list-div" id="listDiv">
            <table cellspacing='1' cellpadding='3'>
                <tr>
                    <th width="2%"></th>
                    <th width="10%">订单号</th>
                    <th width="10%">添加时间</th>
                       <th width="10%">收款时间</th>
                          <th width="10%">交费时间</th>
                             <th width="10%">发送时间</th>  
                              <th width="10%">收据时间</th>  
                               <th width="10%">备注1</th> 
                               <th width="10%">备注2</th>
                    <th width="10%">操作</th>
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
                               <input type="text"  id='dt_addtime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_AddOrderTime") %>'/>
                            </td>
                               <td align="center">
                              <input type="text"  id='dt_shoutime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_ShouKuanTime") %>'/>
                            </td>
                               <td align="center">
                              <input type="text"  id='dt_jiaofeitime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_JiaoFeiTime") %>'/>
                            </td>
                               <td align="center">
                              <input type="text"  id='dt_sendtime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_SendInfoTime") %>'/>
                            </td>
                               <td align="center">
                             <input type="text"  id='dt_shoujutime<%# Eval("i_Id") %>' class="inputs110text" value='<%#Eval("dt_KaiJuTime") %>'/>
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
            </table>
            <table cellspacing='1' cellpadding='3'>
                <tr align="left">
                    <td height="25"><%if (pagedel){ %><input name="checkall" id="checkall" type="checkbox" onclick="SelAll()" value=''
                     />&nbsp;<input type="button" id="btnDel" runat="server" value="删除" onclick="xwshow()" class="button" />
                     <%} %>
                     </td> 
                </tr>
            </table>
        </div>


        <table class="pager" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;</td><webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never" runat="server" ShowFirstLast="true"
                    FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页"
                    ShowInputBox="Always" OnPageChanged="aspPage_PageChanged" PageSize="20" SubmitButtonText="GO"
                    TextAfterInputBox=" " SubmitButtonClass="button" ShowDisabledButtons="False"></webdiyer:AspNetPager>
        </tr>
    </table>
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
    <div id="div_a" runat="server">
    </div>
    </form>
      <!-- #include file="push.html" -->  
</body>
</html>
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
            }
        });
    }
</script>
