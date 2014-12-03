﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TradeMarkStatus.aspx.cs" Inherits="Shop_Manage_NewManage_TradeMarkStatus" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server"><title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/vcom.js"></script>

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
    </style>
    
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <span class="action-span1">
            <a href="javascript:void(0)">商标状态管理中心</a> </span><span id="search_id" class="action-span1">
                &nbsp;</span><div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="../js/fucties.js"></script>

    <script type="text/javascript" src="../js/listtb.js"></script>

    <div class="form-div">
    <table width="100%"><tr><td align="center">
        状态名称：<input type="text" id="txtName" size="15" value="" runat="server" />&nbsp;&nbsp; 
        状态值：&nbsp;<input type="text" id="txtValue" size="15" value="" runat="server" />
        <asp:Button ID="btnAdd" runat="server" Text="添加" CssClass="button" 
            onclick="btnAdd_Click" Width="45px" /></td></tr></table>
    </div>
    <div class="list-div" id="listDiv">
    <table width="100%"><tr><td align="center">
       <asp:DataGrid id="dgEdit" runat="server" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px"
				BackColor="White" CellPadding="4" AutoGenerateColumns="False" 
            DataKeyField="i_Id" Width="600px" oncancelcommand="dgEdit_CancelCommand" 
            oneditcommand="dgEdit_EditCommand" onupdatecommand="dgEdit_UpdateCommand" 
            ondeletecommand="dgEdit_DeleteCommand" onitemcreated="dgEdit_ItemCreated">
				<SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
				<ItemStyle ForeColor="#003399" BackColor="White"></ItemStyle>
				<%--<HeaderStyle Font-Bold="True" ForeColor="#CCCCFF" BackColor="#003399"></HeaderStyle>--%>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="状态名称">
						<ItemTemplate>
							<asp:Label runat="server" Text=' <%# Eval("StatusName")%>' ID="Label2" NAME="Label2">
							</asp:Label>
						</ItemTemplate>
                        <EditItemTemplate>
							<asp:TextBox runat="server" MaxLength="50" ID="txtStatusName" Text=' <%# Eval("StatusName")%>' Width="300px">
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="状态值">
						<ItemTemplate>
							<asp:Label runat="server" Text=' <%# Eval("StatusValue")%>' ID="Label3" NAME="Label3">
							</asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox runat="server" MaxLength="3" Width="60px" ID="txtStatusValue" Text='<%# Eval("StatusValue")%>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="&lt;img src=../images/save.gif border=0 alt='保存'/&gt;"
						CancelText="&lt;img src=../images/cancel.gif border=0 alt='取消'/&gt;" 
                        EditText="&lt;img src=../images/edit.gif border=0 alt='编辑'/&gt;" 
                        HeaderText="编辑"></asp:EditCommandColumn>
				    <asp:ButtonColumn CommandName="Delete" 
                        Text="&lt;img src=../images/del.gif border=0 alt='删除'/&gt;">
                    </asp:ButtonColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
			</asp:DataGrid>
      </td></tr></table>
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
                        <tr><td width="40%" align="right"><img alt="" width="30" src="../images/caozuo_2.jpg" /></td>
                            <td width="60%" align="left" style="font-size:14px;">&nbsp;删除成功</td></tr>
                    </table>
                </td>
                <td width="45%">
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px;
        height: 100px; text-align: center; width: 100%; display:none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>

                <td>&nbsp;

                </td>

                <td width="230">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="11" height="27" background="../images/ts_bg.jpg"><img src="../images/ts1.jpg" width="11" height="27" /></td>
<td align="left" background="../images/ts_bg.jpg" style="color: #FFF; font-size: 14px;line-height: 20px; font-weight: bold;">温馨提示</td>
<td width="34" background="../images/ts_bg.jpg" ><img alt="取消" src="../images/dingdan2.gif" width="34" height="27" style="cursor: hand;" onclick="divoperation(2,'1')" /></td>

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
                            <td width="20%" align="right" style="text-align: right"><img alt="" width="30" src="../images/caozuo_1.jpg" /></td>
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

                    background: #dfeef5; padding: 5px; font-size: 14px; text-align:center;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center" style=" font-size: 14px;"><a><asp:LinkButton ID="lbtnDel" runat="server" OnClick="btnDel_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a></td></tr></table>
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

                            <td width="25%" align="right"><img alt="" width="30" src="../images/caozuo_3.jpg" /></td>

                            <td width="75%" align="left" style="font-size: 14px;">&nbsp;请选中您要删除的记录</td>

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
    </div></form>
</body>
</html>
<script type="text/javascript">
    //    window.onload=function()
    //    {
    if (isIE) {
        window.onscroll = divIE6;
    }
    //    }
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
</script><script type="text/javascript" src="../js/ss.js"></script>