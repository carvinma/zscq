<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentList.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>모두 특허 정보_나의 특허_서비스 센터_회원센터_특허시스템_Global Patent</title>
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
  <uc2:zscqadv ID="zscqadv1" TypeId="97" runat="server" />
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
                  <td align="left">홈 >> 특허시스템 >> 회원센터 >> 서비스 센터 >> 나의 특허 >> 모두 특허 정보 </td>
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
                              <td width="114" height="29" align="center" style="background-color: #1e2b6c;"><a href="User_PatentList.aspx?ExpireType=1<%=requesthref %>" class="ac2">90날 이상</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #50245f;"><a href="User_PatentList.aspx?ExpireType=2<%=requesthref %>" class="ac2">61-90날</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #852349;"><a href="User_PatentList.aspx?ExpireType=3<%=requesthref %>" class="ac2">31-60날</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #b2333d;"><a href="User_PatentList.aspx?ExpireType=4<%=requesthref %>" class="ac2">16-30날</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #d14b1a;"><a href="User_PatentList.aspx?ExpireType=5<%=requesthref %>" class="ac2">0-15날</a> </td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #ebbf1c;"><a href="User_PatentList.aspx?ExpireType=6<%=requesthref %>" class="ac2">무효 특허</a> </td>
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
                                <asp:LinkButton ID="Lbtn_1" runat="server" class="font12b4e" OnCommand="OrderByDesc1">특허번호↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_11" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc11">특허번호↓</asp:LinkButton>
                              </td>
                              <td width="75" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_2" runat="server" class="font12b4e" OnCommand="OrderByDesc2">특허명칭↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_22" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc22">특허명칭↓</asp:LinkButton>
                              </td>
                              <td width="101" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:DropDownList ID="Drp_PatentNationality" runat="server" AutoPostBack="true" Style="border-right: #d7d7d7 1px solid; border-top: #d7d7d7 1px solid; color: #4e4e4e; font-size: 12px; font-weight: bold; border-left: #d7d7d7 1px solid; width: 92px; border-bottom: #d7d7d7 1px solid; height: 24px;" OnSelectedIndexChanged="Drp_PatentNationality_SelectedIndexChanged">
                                  <asp:ListItem Value="0">특허등록국</asp:ListItem>
                                </asp:DropDownList>
                              </td>
                              <td width="71" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_3" runat="server" class="font12b4e" OnCommand="OrderByDesc3">납부년도↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_33" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc33">납부년도↓</asp:LinkButton>
                              </td>
                              <td width="74" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_4" runat="server" class="font12b4e" OnCommand="OrderByDesc4">납부기한일↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_44" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc44">납부기한일↓</asp:LinkButton>
                              </td>
                              <%if(uType==3){ %>
                              <td width="88" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_5" runat="server" class="font12b4e" OnCommand="OrderByDesc5">제3방 안건번호↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_55" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc55">제3방 안건번호↓</asp:LinkButton>
                              </td>
                              <%} %>
                              <td width="50" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_6" runat="server" class="font12b4e" OnCommand="OrderByDesc6">합계↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_66" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc66">합계↓</asp:LinkButton>
                              </td>
                              <td width="43" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">
                                <asp:LinkButton ID="Lbtn_7" runat="server" class="font12b4e" OnCommand="OrderByDesc7">외화종류↑</asp:LinkButton>
                                <asp:LinkButton ID="Lbtn_77" runat="server" class="font12b4e" Visible="false" OnCommand="OrderByAsc77">외화종류↓</asp:LinkButton>
                              </td>
                              <td width="39" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">상세</td>
                              <td width="35" align="center" bgcolor="#FFFFFF" class="font12b4e" style="border-bottom: 1px solid #d0d0d0;">선택</td>
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
                                  <td width="39" align="center" bgcolor="#FFFFFF"><a href="User_PatentInfo.aspx?pId=<%#Eval("i_Id")%>&href=<%=href %>" class="ac5t">보기</a></td>
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
                          <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="images/user_zl_del.jpg" OnClientClick="javascript:return confirm('동작을 실행할 진행하시겠습니까?')" 
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
                              <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="홈" LastPageText="끝페지로" PrevPageText="전으로" NextPageText="다음으로" ShowInputBox="Always" PageSize="20" ShowCustomInfoSection="Right" CustomInfoHTML="총 %PageCount% 페지 " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="확정" SubmitButtonClass="submitbutton" OnPageChanging="AspNetPager1_PageChanging" TextAfterInputBox="페지" TextBeforeInputBox="건너 뛰기">
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
<asp:BoundField DataField="i_OrderBy" HeaderText="시스템번호" />
<asp:BoundField DataField="nvc_Number" HeaderText="특허번호" />
<asp:BoundField DataField="nvc_Name" HeaderText="특허명칭" />
<asp:TemplateField HeaderText="특허등록한 국가">
    <ItemTemplate>
     <%#GetGuoJiaName(Eval("i_AuthorizeNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
    <asp:BoundField DataField="nvc_koreanName" HeaderText="특허류형" />
<asp:TemplateField HeaderText="특허출원일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsNationalityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="특허 공고일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AuthorizeIsAuthorizeDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_YaoQiuXiang" HeaderText="청구항" />
<asp:BoundField DataField="nvc_PatentHolder" HeaderText="특허권자 " />
<asp:TemplateField HeaderText="특허권자 국적">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PatentHolderNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PatentInventor" HeaderText="발명인" />
<asp:TemplateField HeaderText="특허등록국에서의 특허권 효력발생일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateStart"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="특허등록국에서의 특허권 만료일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeDateEnd"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeYear" HeaderText="특허건 유지기한(년)" />
<asp:BoundField DataField="i_AnnualFeeRestYear" HeaderText="특허권 유효기간" />
<asp:TemplateField HeaderText="특허등로국에서의 연차료 납부 상태">
    <ItemTemplate>
    <%#DALP.GetStatus(Convert.ToInt32(Eval("i_AnnualFeeStatus")), "kr")%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_AnnualFeePaymentYear" HeaderText="연차료 납부된 년도" />
<asp:TemplateField HeaderText="마지막으로 연회비 납부 마감일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeePrevYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PriorityNumber" HeaderText="우선권 신청버호" />
<asp:TemplateField HeaderText="우선권 나라">
    <ItemTemplate>
    <%#GetGuoJiaName(Eval("i_PriorityNationalityId"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="우선권 신청일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PriorityDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_PtcNumber" HeaderText="PCT신청번호" />
<asp:TemplateField HeaderText="PCT신청일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_PtcDate"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="납부기한일">
    <ItemTemplate>
    <%#GetDate(Eval("dt_AnnualFeeNextYear"))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="i_AnnualFeeRestDay" HeaderText="기한일" />
<asp:BoundField DataField="nvc_AnnualFeeNotPaymentYear" HeaderText="납부년도" />
<asp:BoundField DataField="dm_AnnualFeeNextPaymentMoney" HeaderText="관비" />
<asp:BoundField DataField="dm_AgentServiceFee" HeaderText="대리비용" />
<asp:BoundField DataField="dm_RemittanceFee" HeaderText="송금수수료" />
<asp:BoundField DataField="dm_ChaoXiangFee" HeaderText="가산료" />
<asp:BoundField DataField="i_JianMian1" HeaderText="감면" />
    <asp:TemplateField HeaderText="추가 지체료">
    <ItemTemplate>
    <%#GetZhiNaJin(Convert.ToInt32(Eval("i_Id")))%>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="nvc_CurrencyType" HeaderText="외화종류" />
<asp:BoundField DataField="dm_FeeSubtotal" HeaderText="합계" />
<asp:BoundField DataField="nt_Remarks" HeaderText="비고" />
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
