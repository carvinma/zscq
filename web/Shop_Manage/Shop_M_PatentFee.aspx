<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_M_PatentFee.aspx.cs" Inherits="Shop_Manage_Shop_M_Patent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="js/fucties.js" type="text/javascript"></script>
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            <span class="action-span1">
                <a href="Shop_Index_Main.aspx">管理中心</a> 
            </span>
            <span id="search_id" class="action-span1"> - 专利费用列表 </span>
            <div style="clear: both">
            </div>
        </h1>
        <div class="form-div">
        选择国家：
        <asp:DropDownList ID="Drp_GuoJiaType" runat="server">
        </asp:DropDownList>&nbsp;
        缴费方式：
        <asp:DropDownList ID="Drp_PayFeeType" runat="server">
        <asp:ListItem Value="0">本国国内汇款</asp:ListItem>
        <asp:ListItem Value="1">中国境内汇款</asp:ListItem>
        <asp:ListItem Value="2">中国境外汇款</asp:ListItem>
        </asp:DropDownList>&nbsp;
        <asp:Button ID="Button1" runat="server" Text="搜索" class="button" OnClick="Button1_Click" />
        </div>
        <asp:Repeater ID="Rpt_PatentTypeList" runat="server" 
            onitemdatabound="Rpt_PatentTypeList_ItemDataBound" >
        <ItemTemplate>
            <h1>
            <span class="action-span1">
                <%#Eval("nvc_ChinaName")%>(<%#Eval("nvc_Name")%>)专利费用设置(币种<%#GetBiZhong(Convert.ToInt32(Eval("i_GuoJiaId")))%>)
                <asp:HiddenField ID="HF_ID" runat="server" Value='<%#Eval("i_Id")%>' />
                <asp:HiddenField ID="HF_GuoJiaId" runat="server" Value='<%#Eval("i_GuoJiaId")%>' />
            </span>
                <input id="Btn_Save" type="button" value="保存" class="button"  style="float:right" onclick='GetValue(<%#Eval("i_Id")%>)' />
            </h1>
            <div class="list-div" id="listDiv">
                <table cellspacing='1' cellpadding='3'>
                    <tr>
                        <th>年度</th>
                        <th>政府规定费用</th>
                        <th>汇款手续费</th>
                        <th>代理服务费</th>
                        <th>费用总计</th>
                        <th <%#Convert.ToInt32(Eval("i_ZhiNaJin"))==0?"style='display:none;'":""%>>滞纳金</th>
                        <th <%#Convert.ToInt32(Eval("i_ChaoXiang"))==0?"style='display:none;'":""%>>超项费</th>
                        <th>操作</th>
                    </tr>
                    <asp:Repeater ID="reptlist" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td height="26" align="center">
                                <%#Eval("nvc_Year")%>
                                </td>
                                <td align="center">
                                <input id="Hidden1" type="hidden" class="HFID_<%#Eval("i_PatentTypeId")%>" value='<%#Eval("i_Id")%>'/>
                                <input type="text" id='SetFee_<%#Eval("i_Id")%>' class="inputs60text SetFee_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("dm_SetFee")%>' onkeyup="GetTotalFee(<%#Eval("i_Id")%>)"/>
                                </td>
                                <td align="center">
                                <input type="text" id='ShouXuFee_<%#Eval("i_Id")%>' class="inputs60text ShouXuFee_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval(GetBindShouXuFeeFiled())%>' onkeyup="GetTotalFee(<%#Eval("i_Id")%>)"/>
                                </td>
                                <td align="center">
                                <input type="text" id='AgentServiceFee_<%#Eval("i_Id")%>' class="inputs60text AgentServiceFee_<%#Eval("i_PatentTypeId")%>" value='<%#Eval(GetBindAgentServiceFeeFiled())%>' MaxLength="9" onkeyup="GetTotalFee(<%#Eval("i_Id")%>)" />
                                </td>
                                <td align="center">
                                <input type="text" id='TotalFee_<%#Eval("i_Id")%>' class="inputs60text TotalFee_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval(GetBindTotalFeeFiled())%>'/>
                                </td>
                                <td align="center" <%#Convert.ToInt32(Eval("i_ZhiNaJin"))==0?"style='display:none;'":""%>>
                                    <input type="text" id='ZhiNaJin1_<%#Eval("i_Id")%>' class="inputs60text ZhiNaJin1_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("nvc_ZhiNaJin").ToString().Split('-')[0]%>' />
                                    <input type="text" id='ZhiNaJin2_<%#Eval("i_Id")%>' class="inputs60text ZhiNaJin2_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("nvc_ZhiNaJin").ToString().Split('-')[1]%>' />
                                    <input type="text" id='ZhiNaJin3_<%#Eval("i_Id")%>' class="inputs60text ZhiNaJin3_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("nvc_ZhiNaJin").ToString().Split('-')[2]%>' />
                                    <input type="text" id='ZhiNaJin4_<%#Eval("i_Id")%>' class="inputs60text ZhiNaJin4_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("nvc_ZhiNaJin").ToString().Split('-')[3]%>' />
                                    <input type="text" id='ZhiNaJin5_<%#Eval("i_Id")%>' class="inputs60text ZhiNaJin5_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("nvc_ZhiNaJin").ToString().Split('-')[4]%>' />
                                    <input type="text" id='ZhiNaJin6_<%#Eval("i_Id")%>' class="inputs60text ZhiNaJin6_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("nvc_ZhiNaJin").ToString().Split('-')[5]%>' />
                                </td>
                                <td align="center" <%#Convert.ToInt32(Eval("i_ChaoXiang"))==0?"style='display:none;'":""%>>
                                <input type="text" id='ChaoXiangFee_<%#Eval("i_Id")%>' class="inputs60text ChaoXiangFee_<%#Eval("i_PatentTypeId")%>" MaxLength="9" value='<%#Eval("dm_ChaoXiangFee")%>'/>
                                </td>
                                <td align="center">
                                    <asp:LinkButton ID="Btn_Del" runat="server" CommandArgument='<%#Eval("i_Id")+"-"+Eval("i_PatentTypeId")+"-"+Eval("nvc_Year")%>' OnClientClick='return confirm("是否真的删除")' OnCommand='Delete_Year'>删除</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </ItemTemplate>
        </asp:Repeater>
        <div style="text-align:center">
        </div>
    </div>
    <div id="div_a" runat="server">
    </div>
    </form>
            <!-- #include file="push.html" -->  
</body>
</html>
<script type="text/javascript">
    function GetValue(obj) {
        var feetype = $("#Drp_PayFeeType").val();
        var arr1 = $(".SetFee_" + obj);
        var arr2 = $(".ShouXuFee_" + obj);
        var arr3 = $(".AgentServiceFee_" + obj);
        var arr4 = $(".TotalFee_" + obj);
        var arr5 = $(".HFID_" + obj);
        var zhinajin1 = $(".ZhiNaJin1_" + obj);
        var zhinajin2 = $(".ZhiNaJin2_" + obj);
        var zhinajin3 = $(".ZhiNaJin3_" + obj);
        var zhinajin4 = $(".ZhiNaJin4_" + obj);
        var zhinajin5 = $(".ZhiNaJin5_" + obj);
        var zhinajin6 = $(".ZhiNaJin6_" + obj);
        var zhinajin = "";
        var arr6 = $(".ChaoXiangFee_" + obj);
        var SetFee = "", ShouXuFee = "", AgentServiceFee = "", TotalFee = "", HFID = "", ChaoXiangFee="";
        for (var i = 0; i < arr1.length; i++) {
            SetFee += $(arr1[i]).val() + "-";
            ShouXuFee += $(arr2[i]).val() + "-";
            AgentServiceFee += $(arr3[i]).val() + "-";
            TotalFee += $(arr4[i]).val() + "-";
            HFID += $(arr5[i]).val() + "-";
            zhinajin += $(zhinajin1[i]).val() + "-" + $(zhinajin2[i]).val() + "-" + $(zhinajin3[i]).val() + "-" + $(zhinajin4[i]).val() + "-" + $(zhinajin5[i]).val() + "-" + $(zhinajin6[i]).val() + "|";
            ChaoXiangFee += $(arr6[i]).val() + "-";
        }
        //alert(zhinajin);
        if (SetFee == "") {
            alert("修改失败");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "Shop_A_Patent.ashx",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: "flag=PatentFee&HFID=" + HFID + "&SetFee=" + SetFee + "&ShouXuFee=" + ShouXuFee + "&AgentServiceFee=" + AgentServiceFee + "&ZhiNaJin=" + zhinajin + "&ChaoXiangFee=" + ChaoXiangFee + "&TotalFee=" + TotalFee + "&FeeType=" + feetype,
            success: function (msg) {
                //alert(msg);
                if (msg == "ok") {
                    alert("修改成功");
                }
            }
        });
    }
    function GetTotalFee(k) {
        var b = $('#SetFee_' + k).val();
        var r = $('#ShouXuFee_' + k).val();
        var c = $('#AgentServiceFee_' + k).val();
        var t = parseFloat(b) + parseFloat(r) + parseFloat(c);
        $('#TotalFee_' + k).attr('value', t);
    }
</script>

