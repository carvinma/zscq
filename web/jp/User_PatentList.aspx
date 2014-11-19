<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentList.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>全ての特許情報_私の特許_サービスセンター_会員センター_特許システム_環球匯通</title>
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
<body id="index">
  <form id="form1" runat="server">
  <asp:HiddenField ID="Hf_PatentId" runat="server" Value="0" />
   <asp:HiddenField ID="Hf_OrderByFile" runat="server" Value="dt_AddTime" />
   <asp:HiddenField ID="Hf_OrderByType" runat="server" Value="desc" />
  <uc1:zscqtop2 ID="zscqtop21" runat="server" />
  <uc2:zscqadv ID="zscqadv1" TypeId="83" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
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
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left">フロントページ >> 特許システム >> 会員センター >> サービスセンター >> 私の特許 >> <span left-pos="0|12" right-pos="0|12" space="">全ての特許</span><span left-pos="12|6" right-pos="12|6" space="">情報</span></td>
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
                        <td height="29" align="left" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="114" height="29" align="center" style="background-color: #1e2b6c;"><a href="User_PatentList.aspx?ExpireType=1<%=requesthref %>" class="ac2">90日間以上</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #50245f;"><a href="User_PatentList.aspx?ExpireType=2<%=requesthref %>" class="ac2">661－90日間</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #852349;"><a href="User_PatentList.aspx?ExpireType=3<%=requesthref %>" class="ac2">31-60日間</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #b2333d;"><a href="User_PatentList.aspx?ExpireType=4<%=requesthref %>" class="ac2">16-30日間</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #d14b1a;"><a href="User_PatentList.aspx?ExpireType=5<%=requesthref %>" class="ac2">0-15日間</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #ebbf1c;"><a href="User_PatentList.aspx?ExpireType=6<%=requesthref %>" class="ac2">期限切れ特許</a> </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="26" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="82" height="42" align="center" bgcolor="#FFFFFF" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_1" runat="server" class="font12b4e" OnCommand="OrderByDesc1">特許番号↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_11" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc11">特許番号↓</asp:LinkButton>
                              </td>
                              <td width="75" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_2" runat="server" class="font12b4e" OnCommand="OrderByDesc2">特許名称↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_22" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc22">特許名称↓</asp:LinkButton>
                              </td>
                              <td width="91" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:DropDownList ID="Drp_PatentNationality" runat="server" AutoPostBack="true" Style="border-right: #d7d7d7 1px solid; border-top: #d7d7d7 1px solid; color: #4e4e4e; font-size: 12px; font-weight: bold; border-left: #d7d7d7 1px solid; width: 92px; border-bottom: #d7d7d7 1px solid; height: 24px;" OnSelectedIndexChanged="Drp_PatentNationality_SelectedIndexChanged">
                                  <asp:ListItem Value="0">特許授権国</asp:ListItem>
                                </asp:DropDownList>
                              </td>
                              <td width="81" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_3" runat="server" class="font12b4e" OnCommand="OrderByDesc3">納付待ち年度↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_33" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc33">納付待ち年度↓</asp:LinkButton>
                              </td>
                              <td width="74" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_4" runat="server" class="font12b4e" OnCommand="OrderByDesc4">年金納付期限日↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_44" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc44">年金納付期限日↓</asp:LinkButton>
                              </td>
                              <%if(uType==3){ %>
                              <td width="88" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_5" runat="server" class="font12b4e" OnCommand="OrderByDesc5">第三方案件番号↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_55" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc55">第三方案件番号↓</asp:LinkButton>
                              </td>
                              <%} %>
                              <td width="50" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_6" runat="server" class="font12b4e" OnCommand="OrderByDesc6">小計↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_66" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc66">小計↓</asp:LinkButton>
                              </td>
                              <td width="43" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_7" runat="server" class="font12b4e" OnCommand="OrderByDesc7">貨幣↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_77" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc77">貨幣↓</asp:LinkButton>
                              </td>
                              <td width="44" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">詳細</td>
                              <td width="30" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">選択</td>
                            </tr>
                            <asp:Repeater ID="Rpt_UserPatentList" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td width="82" height="42" align="center" bgcolor="#FFFFFF" <%#GetPatentNameBgColor(Convert.ToInt32(Eval("i_AnnualFeeRestDay"))) %>>
                                    <%#Eval("nvc_Number")%></td>
                                  <td width="75" align="center" bgcolor="#FFFFFF">
                                    <a href="User_PatentInfo.aspx?pId=<%#Eval("i_Id")%>&href=<%=href %>" title='<%#Eval("nvc_Name")%>'><%#StringHelper.CutString(Eval("nvc_Name").ToString(),10,true)%></a>
                                  </td>
                                  <td width="101" align="center" bgcolor="#FFFFFF">
                                    <%#GetGuoJiaName(Convert.ToInt32(Eval("i_AuthorizeNationalityId")))%></td>
                                  <td width="71" align="center" bgcolor="#FFFFFF">
                                    <%#Eval("nvc_AnnualFeeNotPaymentYear")%></td>
                                  <td width="74" align="center" bgcolor="#FFFFFF">
                                     <%#Eval("nvc_AnnualFeeNotPaymentYear").ToString() == "" ? "" : Eval("dt_AnnualFeeNextYear") != null ? Convert.ToDateTime(Eval("dt_AnnualFeeNextYear")).ToShortDateString() : ""%>
                                  </td>
                                    <%if(uType==3){ %>
                                  <td width="88" align="center" bgcolor="#FFFFFF">
                                    <%#Eval("nvc_AnJuanNum")%></td>  <%} %>
                                  <td width="50" align="center" bgcolor="#FFFFFF">
                                    <%#Eval("nvc_AnnualFeeNotPaymentYear").ToString() == "" ? "" : Eval("dm_FeeSubtotal")%></td>
                                  <td width="43" align="center" bgcolor="#FFFFFF">
                                    <%#Eval("nvc_CurrencyType")%></td>
                                  <td width="39" align="center" bgcolor="#FFFFFF"><a href="User_PatentInfo.aspx?pId=<%#Eval("i_Id")%>&href=<%=href %>" class="ac5t">チェック</a></td>
                                  <td width="35" align="center" bgcolor="#FFFFFF">
                                    <input name="inputPageid" onclick="Selbox(this)" type="checkbox" <%#CheckTrue(Eval("i_Id"))?"disabled":""%> value="<%#Eval("i_Id")%>" id="cb_<%#Eval("i_Id")%>"/>
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
                        <td align="center">
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/zl_button.gif" OnClick="ImageButton1_Click" />
                          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/daochuall.jpg" 
                                onclick="ImageButton2_Click" />
                          <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="images/user_zl_del.jpg" OnClientClick="javascript:return confirm('この操作を実行するかをご確認?')" 
                                onclick="ImageButton3_Click"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="right" class="font12b4e">
                          <table class="aspnetpager" cellspacing="5">
                            <tr>
                              <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="フロントページ" LastPageText="最後のページ" PrevPageText="前のページ" NextPageText="後のページ" ShowInputBox="Always" PageSize="20" ShowCustomInfoSection="Right" CustomInfoHTML="全部 %PageCount% ページ " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="確定" SubmitButtonClass="submitbutton" OnPageChanging="AspNetPager1_PageChanging" TextAfterInputBox=" ページ" TextBeforeInputBox="へスキップ ">
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
  <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="false">
<Columns>
<asp:BoundField DataField="i_OrderBy" HeaderText="システム番号" />
<asp:BoundField DataField="nvc_Number" HeaderText="特許番号" />
<asp:BoundField DataField="nvc_Name" HeaderText="特許名称" />
<asp:TemplateField HeaderText="特許授権国">
    <ItemTemplate>
     <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
    <asp:BoundField DataField="nvc_JapaneseName" HeaderText="特許種類" />
<asp:TemplateField HeaderText="特許申請日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="特許授権日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_YaoQiuXiang" HeaderText="権利要求項目" />
<asp:BoundField DataField="nvc_PatentHolder" HeaderText="特許権利人" />
<asp:TemplateField HeaderText="特許権利人国籍">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PatentInventor" HeaderText="発明者" />
<asp:TemplateField HeaderText="特許有効維持期限起算日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="特許有効維持期限終止日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeYear" HeaderText="特許有効維持年限" />
<asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="特許有効維持残り年限" />
<asp:TemplateField HeaderText="授権国での特許年金納付状態">
    <ItemTemplate>
    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")),"jp")%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="特許納付済年度" />
<asp:TemplateField HeaderText="上一次年费缴纳期限日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PriorityNumber" HeaderText="優先権申請番号" />
<asp:TemplateField HeaderText="優先権国">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="優先権申請日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PriorityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT申請番号" />
<asp:TemplateField HeaderText="PCT申請日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PtcDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="納付期限日">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeRestDay" HeaderText="納付期限までの残り天数" />
<asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="納付待ち年度" />
<asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="政府規定費用" />
<asp:BoundField DataField="dm_AgentServiceFee" HeaderText="代理費" />
<asp:BoundField DataField="dm_RemittanceFee" HeaderText="振込手数料" />
<asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="項目超過費用" />
<asp:BoundField DataField="i_JianMian1" HeaderText="減免" />
    <asp:TemplateField HeaderText="延長金">
    <ItemTemplate>
    <%#GetZhiNaJin(Convert.ToInt32(Eval("i_Id")))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_CurrencyType" HeaderText="貨幣" />
<asp:BoundField DataField="dm_FeeSubtotal" HeaderText="小計" />
<asp:BoundField DataField="nt_Remarks" HeaderText="備考" />
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
