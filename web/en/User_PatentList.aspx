<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentList.aspx.cs" Inherits="User_PatentList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All patent information_My patent_Service Center_User Center_System of Patent Annuity Fee_Global Patent</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <style type="text/css">
    .aspnetpager a { display: block; float: left; padding: 2px 10px; background: #fff; text-align: center; line-height: 20px; border: 1px solid #ccc; color: #0065DB; margin: 0 3px; }
    .aspnetpager a:hover { border: 1px solid #FF5500; color: #FF5500; background: #FFEEE6; text-decoration: none; }
    .aspnetpager td .pagetext { width: 35px; height: 23px; background: #fff; text-align: center; line-height: 23px; border: 1px solid #ccc; }
    .aspnetpager td .submitbutton { width: 39px; height: 23px; background: url(images/fenbar.jpg); color: #fff; line-height: 23px; text-align: center; border: none; margin-left: 5px; }
  </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="Hf_PatentId" runat="server" Value="0" />
    <asp:HiddenField ID="Hf_OrderByFile" runat="server" Value="dt_AddTime" />
    <asp:HiddenField ID="Hf_OrderByType" runat="server" Value="desc" />
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="69" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td height="3">
            </td>
        </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
        <tr>
            <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
                <!--专利左侧START-->
                <uc3:patentleft ID="patentleft1" runat="server" />
                <!--专利左侧END-->
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
                                        Front page >> System of Patent Annuity Fee >> User Center >> Service Center >> My patent >> All patent information
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="639" valign="top">
                            <table width="716" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25" height="28">
                                        &nbsp;
                                    </td>
                                    <td width="691">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="123">
                                        &nbsp;
                                    </td>
                                    <td width="691" align="left" valign="top">
                                        <table width="689" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="29" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="124" height="29" align="center" style="background-color: #1e2b6c;">
                                                                <a href="User_PatentList.aspx?ExpireType=1<%=requesthref %>" class="ac2">More than 90 days</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="112" align="center" style="background-color: #50245f;">
                                                                <a href="User_PatentList.aspx?ExpireType=2<%=requesthref %>" class="ac2">61-90 days</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="112" align="center" style="background-color: #852349;">
                                                                <a href="User_PatentList.aspx?ExpireType=3<%=requesthref %>" class="ac2">31-60 days</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="112" align="center" style="background-color: #b2333d;">
                                                                <a href="User_PatentList.aspx?ExpireType=4<%=requesthref %>" class="ac2">16-30 days</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="112" align="center" style="background-color: #d14b1a;">
                                                                <a href="User_PatentList.aspx?ExpireType=5<%=requesthref %>" class="ac2">0-15 days</a>
                                                            </td>
                                                            <td width="1">
                                                            </td>
                                                            <td width="112" align="center" style="background-color: #ebbf1c;">
                                                                <a href="User_PatentList.aspx?ExpireType=6<%=requesthref %>" class="ac2">Overdue patent</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="26" align="left">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="115" align="left" valign="top">
                                                    <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                                        <tr>
                                                            <td width="72" height="42" align="center" bgcolor="#FFFFFF" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_1" runat="server" class="font12b4e" OnCommand="OrderByDesc1">Patent number↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_11" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc11">Patent number↓</asp:LinkButton>
                                                            </td>
                                                            <td width="105" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_2" runat="server" class="font12b4e" OnCommand="OrderByDesc2">Title of patent↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_22" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc22">Title of patent↓</asp:LinkButton>
                                                            </td>
                                                            <td width="101" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:DropDownList ID="Drp_PatentNationality" runat="server" AutoPostBack="true" Style="border-right: #d7d7d7 1px solid; border-top: #d7d7d7 1px solid; color: #4e4e4e; font-size: 12px; font-weight: bold; border-left: #d7d7d7 1px solid; width: 92px; border-bottom: #d7d7d7 1px solid; height: 24px;" OnSelectedIndexChanged="Drp_PatentNationality_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">Granted Country</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="51" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_3" runat="server" class="font12b4e" OnCommand="OrderByDesc3">Annuity year↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_33" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc33">Annuity year↓</asp:LinkButton>
                                                            </td>
                                                            <td width="74" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_4" runat="server" class="font12b4e" OnCommand="OrderByDesc4">Deadline to pay↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_44" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc44">Deadline of payment↓</asp:LinkButton>
                                                            </td>
                                                            <%if(uType==3){ %>
                                                            <td width="88" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_5" runat="server" class="font12b4e" OnCommand="OrderByDesc5">Reference number of the third party↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_55" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc55">Reference number of the third party↓</asp:LinkButton>
                                                            </td>
                                                            <%} %>
                                                            <td width="50" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_6" runat="server" class="font12b4e" OnCommand="OrderByDesc6">Subtotal↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_66" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc66">Subtotal↓</asp:LinkButton>
                                                            </td>
                                                            <td width="43" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                <asp:LinkButton ID="Lbtn_7" runat="server" class="font12b4e" OnCommand="OrderByDesc7">Currency↑</asp:LinkButton>
                                                                <asp:LinkButton ID="Lbtn_77" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc77">Currency↓</asp:LinkButton>
                                                            </td>
                                                            <td width="39" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                Detailed information
                                                            </td>
                                                            <td width="35" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                                                Select
                                                            </td>
                                                        </tr>
                                                        <asp:Repeater ID="Rpt_UserPatentList" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td width="72" height="42" align="center" bgcolor="#FFFFFF" <%#GetPatentNameBgColor(Convert.ToInt32(Eval("i_AnnualFeeRestDay"))) %>>
                                                                        <%#Eval("nvc_Number")%>
                                                                    </td>
                                                                    <td width="105" align="center" bgcolor="#FFFFFF">
                                                                        <a href="User_PatentInfo.aspx?pId=<%#Eval("i_Id")%>&href=<%=href %>" title='<%#Eval("nvc_Name")%>'>
                                                                            <%#StringHelper.CutString(Eval("nvc_Name").ToString(),10,true)%></a>
                                                                    </td>
                                                                    <td width="101" align="center" bgcolor="#FFFFFF">
                                                                        <%#GetGuoJiaName(Convert.ToInt32(Eval("i_AuthorizeNationalityId")))%>
                                                                    </td>
                                                                    <td width="51" align="center" bgcolor="#FFFFFF">
                                                                        <%#Eval("nvc_AnnualFeeNotPaymentYear")%>
                                                                    </td>
                                                                    <td width="74" align="center" bgcolor="#FFFFFF">
                                                                        <%#Eval("nvc_AnnualFeeNotPaymentYear").ToString() == "" ? "" : Eval("dt_AnnualFeeNextYear") != null ? Convert.ToDateTime(Eval("dt_AnnualFeeNextYear")).ToShortDateString() : ""%>
                                                                    </td>
                                                                    <%if(uType==3){ %>
                                                                    <td width="88" align="center" bgcolor="#FFFFFF">
                                                                        <%#Eval("nvc_AnJuanNum")%>
                                                                    </td>
                                                                    <%} %>
                                                                    <td width="50" align="center" bgcolor="#FFFFFF">
                                                                        <%#Eval("nvc_AnnualFeeNotPaymentYear").ToString() == "" ? "" : Eval("dm_FeeSubtotal")%>
                                                                    </td>
                                                                    <td width="43" align="center" bgcolor="#FFFFFF">
                                                                        <%#Eval("nvc_CurrencyType")%>
                                                                    </td>
                                                                    <td width="39" align="center" bgcolor="#FFFFFF">
                                                                        <a href="User_PatentInfo.aspx?pId=<%#Eval("i_Id")%>&href=<%=href %>" class="ac5t">Check</a>
                                                                    </td>
                                                                    <td width="35" align="center" bgcolor="#FFFFFF">
                                                                        <input name="inputPageid" onclick="Selbox(this)" type="checkbox" <%#CheckTrue(Eval("i_Id"))?"disabled":""%> value="<%#Eval("i_Id")%>" id="cb_<%#Eval("i_Id")%>" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/zl_button.gif" OnClick="ImageButton1_Click" />
                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/user_daochu.gif" OnClick="ImageButton2_Click" />
                                                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="images/user_zl_del.jpg" OnClientClick="javascript:return confirm('Are you sure to perform this operation?')" OnClick="ImageButton3_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="font12b4e">
                                                    <table class="aspnetpager" cellspacing="5">
                                                        <tr>
                                                            <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="Front page" LastPageText="Last page" PrevPageText="Previous page" NextPageText="Next page" ShowInputBox="Always" PageSize="20" ShowCustomInfoSection="Right" CustomInfoHTML="Total %PageCount% page " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="confirm" SubmitButtonClass="submitbutton" OnPageChanging="AspNetPager1_PageChanging" TextAfterInputBox=" page" TextBeforeInputBox="Skip to ">
                                                            </webdiyer:AspNetPager>
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
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="i_OrderBy" HeaderText="System serial number" />
            <asp:BoundField DataField="nvc_Number" HeaderText="Patent number" />
            <asp:BoundField DataField="nvc_Name" HeaderText="Title of patent" />
            <asp:TemplateField HeaderText="Granted Country">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_EnglishName" HeaderText="Type of patent" />
            <asp:TemplateField HeaderText="Filing date of patent">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Grant date of patent ">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_YaoQiuXiang" HeaderText="Number of claims" />
            <asp:BoundField DataField="nvc_PatentHolder" HeaderText="Patentee" />
            <asp:TemplateField HeaderText="Nationality of patentee">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PatentInventor" HeaderText="Inventor" />
            <asp:TemplateField HeaderText="Start date of patent right">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Expire date of patent right">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_AnnualFeeYear" HeaderText="Protection term" />
            <asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="Remained protection years" />
            <asp:TemplateField HeaderText="Status of payment">
                <ItemTemplate>
                    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")),"en")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="Paid annuity year" />
            <asp:TemplateField HeaderText="Last deadline">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PriorityNumber" HeaderText="Priority application number" />
            <asp:TemplateField HeaderText="Priority country">
                <ItemTemplate>
                    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Priority filing date">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_PriorityDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT application number" />
            <asp:TemplateField HeaderText="PCT filing date">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_PtcDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deadline of payment">
                <ItemTemplate>
                    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="i_AnnualFeeRestDay" HeaderText="Days before the deadline" />
            <asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="Annuity year" />
            <asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="Official fee" />
            <asp:BoundField DataField="dm_AgentServiceFee" HeaderText="Service fee" />
            <asp:BoundField DataField="dm_RemittanceFee" HeaderText="Bank charges" />
            <asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="Excess fee of claims" />
            <asp:BoundField DataField="i_JianMian1" HeaderText="Reduction" />
            <asp:TemplateField HeaderText="Surcharge">
                <ItemTemplate>
                    <%#GetZhiNaJin(Convert.ToInt32(Eval("i_Id")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nvc_CurrencyType" HeaderText="Currency" />
            <asp:BoundField DataField="dm_FeeSubtotal" HeaderText="Total fee" />
            <asp:BoundField DataField="nt_Remarks" HeaderText="Note" />
        </Columns>
    </asp:GridView>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    <div id="div_html" runat="server">
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

        if (arr = document.cookie.match(reg))

            return arr[2];
        else
            return null;
    }
    $(document).ready(function () {
        var inputlist = null;
        if (document.getElementsByName("inputPageid") != null) {
            inputlist = document.getElementsByName("inputPageid");
            //var pid = document.getElementById("Hf_PatentId").value;
            var pid = getCookie("hqht_patentidstr");
            if (pid != 0) {
                var listid = pid.split('|');
                for (var i = 1; i < listid.length; i++) {
                    for (var j = 0; j < inputlist.length; j++) {
                        if (inputlist[j].value == listid[i].split(',')[0]) {
                            inputlist[j].checked = true;
                        }
                    }
                }
            }
        }
    });

    function writeCookie(name, value, day) {
        expire = "";
        expire = new Date();
        expire.setTime(expire.getTime() + day * 24 * 3600 * 1000);
        expire = expire.toGMTString();
        document.cookie = name + "=" + value + ";expires=" + expire;
    }
</script>
<script type="text/javascript">
    function Selbox(obj) {
        if ($(obj).attr("checked") == false) {
            SetSectet(obj.value, "nocheck");
        }
        else {
            SetSectet(obj.value, "check");
        }
    }
    function SetSectet(txtvalue, tyid) {
        var pids = "";
        if (tyid == "check") {

            if (getCookie("hqht_patentidstr") == null) {
                pids = "";
            }
            else {
                pids = pids + getCookie("hqht_patentidstr");
            }

            if (pids.indexOf("|" + txtvalue + ",1") < 0) {

                pids = pids + "|" + txtvalue + ",1";
            }
        }
        else if (tyid == "nocheck") {
            var getpidstr = getCookie("hqht_patentidstr");
            pids = pids + getpidstr.replace("|" + txtvalue + ",1", "");
        }

        writeCookie("hqht_patentidstr", pids, 1);

    }

    //    function SetSectet(txtvalue, tyid) {
    //        var rand = Math.floor(Math.random() * 1000000);
    //        var cs = "flag=jiaofei&CheckValue=" + txtvalue + "&SelectType=" + tyid + "&n=" + rand;
    //        $.ajax({
    //            type: "POST",
    //            url: "Handler.ashx",
    //            contentType: "application/x-www-form-urlencoded; charset=utf-8",
    //            data: cs,
    //            success: function (msg) {
    //                if (msg == "no") {
    //                    SetSectet(txtvalue, tyid);
    //                }
    //                else {
    //                    writeCookie("hqht_patentidstr", msg, 1);
    //                }
    //            }
    //        });
    //    }   
</script>
