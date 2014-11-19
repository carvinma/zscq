<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbddck.aspx.cs" Inherits="user_sbddck" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>상표 주문_서비스 센터_상표시시템_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="HQHT 연차료관리 전자상거래 플랫폼" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script language="javascript">
    function switchTag1(tag, content, k) {
      for (i = 1; i < 3; i++) {
        if (i == k)
        { document.getElementById(tag + i).className = "font12bt"; document.getElementById(content + i).className = ""; }
        else
        { document.getElementById(tag + i).className = "font12bs"; document.getElementById(content + i).className = "h_lsit_none"; }
      }
    }
    var rollFlag = 0;

    function txt_roll(str) {
      sub_num = str.substring(str.length - 2);
      sub_str = str.substring(0, str.length - 2);

      if (document.all[str].style.display == "") {
        document.all[str].style.display = "none";
        rollFlag = 0;
        return;
      }
      else {
        if (rollFlag != 0) {
          //document.all[sub_str+rollFlag].style.display="none";
          document.all[str].style.display = "";
        }

        document.all[str].style.display = "";
        rollFlag = sub_num;
      }

    }
  </script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <asp:HiddenField ID="HF_oId" runat="server" Value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="96" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" />
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
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;>>&nbsp;상표시시템&nbsp;>>&nbsp;서비스 센터&nbsp;>>&nbsp;상표 주문&nbsp;&gt;&gt;&nbsp;주문 정보</td>
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
                    <table id="pr_table" width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="147" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="130" align="center" class="font12bt">주문 기본 정보</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0">
                            <tr class="orderxx">
                              <td height="30" width="5%" align="right" valign="middle"> </td>
                              <td align="left" width="35%" valign="middle">
                               <span class="ordertext">발주서 번호：</span> <%=OrderNum %></td>
                              <td align="right" width="3%" valign="middle"></td>
                              <td align="left" width="17%" valign="middle">
                               회원아이디： <%=UserNum %></td>
                              <td align="right" width="3%" valign="middle"></td>
                              <td align="left" width="20%" valign="middle">
                                주문 상태：<%=OrderState %>  </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="30" align="right" valign="middle"></td>
                              <td align="left" valign="middle">
                               제출시간： <%=dt_addtime %></td>
                              <td align="right" valign="middle"></td>
                              <td align="left" valign="middle">
                             제출인： <%=UserName%></td>
                              <td align="right" valign="middle"></td>
                              <td align="left" valign="middle"></td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="147" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="130" align="center" class="font12bt">상표 납부 주문</td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                                  <tr>
                                    <td width="106" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상표 출원번호</td>
                                    <td width="75" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상표 분류</td>
                                    <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">납부유형</td>
                                    <td width="141" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">로그인 성명</td>
                                 <%--   <td width="77" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">심사상태</td>--%>
                                    <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">납부 상태</td>
                                    <td width="67" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">기한일</td>
                                    <td width="48" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">상세</td>
                                                <td width="78" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"> 다운로드 </td>
                                  </tr>
                                  <asp:Repeater ID="rp_trademark" runat="server">
                                    <ItemTemplate>
                                      <tr>
                                        <td width="106" height="32" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBRegNum") %></td>
                                        <td width="75" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("nvc_SBType")%></td>
                                        <td width="80" align="center" bgcolor="#FFFFFF">
                                          <%#Eval("i_JiaoFeiType").ToString() == "1" ?"스스로 비용을 납부하다" :"위탁 납부"%></td>
                                        <td width="141" align="center" bgcolor="#FFFFFF" style="line-height:20px;">
                                          <%if (usertype == 3)
                                          { %>
                                          <%# Eval("i_GuoJiId").ToString() != "1" ? Eval("nvc_SBRegName") + "<br>" + Eval("nvc_SBRegEnName") : Eval("nvc_SBRegName")%>
                                          <%} %>
                                          <%else 
                                          { %>
                                          <%# Eval("nvc_SBRegName")%>
                                          <%} %>
                                        </td>
                                     <%--   <td width="77" align="center" bgcolor="#FFFFFF">
                                          <%#Eval("i_State").ToString() == "1" ? "이미 심사" :(Eval("i_State").ToString() == "2"?"아직 통해":"미심사")%>
                                        </td>--%>
                                        <td width="69" align="center" bgcolor="#FFFFFF">
                                          <%# Eval("i_IsPayState").ToString()=="1"?"대신 납부":(Eval("i_IsPayState").ToString()=="2"?"납부되였습니다":"미 납부")%></td>
                                        <td width="67" align="center" bgcolor="#FFFFFF">
         <%# Eval("nvc_SbDaoqiTime")%></td>
                                        <td width="48" align="center" bgcolor="#FFFFFF"><a href="user_sbck.aspx?t_r_id=<%#Eval("i_TrademarkId")%>" target="_blank" class="ac5t">보기</a></td>
                                         <td width="78" align="center" bgcolor="#FFFFFF"><a href="user_World_sbweituo.aspx?id=<%#Eval("i_TrademarkId")%>&type=2" target="_blank" class="ac5t">위임장</a> <br /><a href="user_World_sb.aspx?id=<%#Eval("i_TrademarkId")%>&type=3" target="_blank" class="ac5t">신청서</a></td>
                                      </tr>
                                    </ItemTemplate>
                                  </asp:Repeater>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="24" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <%if (isfapiao == 1)
                            { %>
                          <table width="687" border="0" cellspacing="0" cellpadding="0" style="display:none">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">发票相关</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="display:none">
                            <tr>
                              <td width="15%" height="32" align="right" style="line-height: 21px;">发票抬头：</td>
                              <td width="85%" colspan="5" align="left" style="line-height: 21px;">
                                <%=fapiaotaitou%></td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">우편방식：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjitype%>&nbsp;&nbsp; </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">우편주소：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhi%>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">받는 이：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhia%>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" style="line-height: 21px;">전화：</td>
                              <td colspan="5" style="line-height: 21px;">
                                <%=youjidizhib%>
                              </td>
                            </tr>
                          </table>
                          <%} %>
                          <table width="687" border="0" cellspacing="0" cellpadding="0" runat="server" id="Table_YouHuiQuan1">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt"> 쿠폰 </td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto" runat="server" id="Table_YouHuiQuan2">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">
                                <table width="599" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="202" align="right"><span left-pos="12|9" right-pos="12|9" space="">쿠폰</span><span left-pos="0|12" right-pos="0|12" space=""> 사용할 지 여부입니다</span> ：</td>
                                    <td width="397" align="left">
                                      <%=isuseyouhui %>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr class="orderxx" id="youhuiquan1" runat="server">
                              <td height="30" align="left" valign="middle">
                                <table width="599" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="202" align="right"> 사용 불가 ：</td>
                                    <td width="397" align="left">
                                      <%=youhuiquan %>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr class="orderxx">
                              <td height="15" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">금액연관</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="59" align="right" valign="top" style="line-height: 22px;">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="59" align="right" valign="top" style="line-height: 22px;">
                               
                                <table>
                                <tr>
                                <td height="59" align="right"> 
                                <table width="440" border="0" cellspacing="0" cellpadding="0">
                                   <%=Str_Money %>
                                </table>
                                     <table width="440" border="0" cellspacing="0" cellpadding="0">
                                     <%if (isyouhuiquan == 1)
                                       { %>
                                <tr align="left" >  
                                <td width="200" align="right">할인권 사용：</td><td width="110" id="youhuiquan"><%=youhuifee %></td><td width="30"></td><td width="100"></td>
                                </tr>
                                <%} %>
                                <%if(isfapiao==1){ %> 
                                 <tr align="left" >  
                                <td width="200" align="right">邮寄费用：</td><td width="110" id="youji"><%=youjifee %></td><td width="30"></td><td width="100"></td>
                                </tr> 
                                 <tr align="left" >  
                                <td width="200" align="right">增值税金额：</td><td width="110" id="suidian"><%=fapiaosui%></td><td width="30"></td><td width="100"></td>
                                </tr>
                                   
                                 <%} %>
                                </table>
                                <table width="440" border="0" cellspacing="0" cellpadding="0">
                               <%=Str_AllMoney%>
                                </table>
                               </td>
                                <td width="30"></td>
                                </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="left">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">지불 방식</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                          <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
                            <tr class="orderxx">
                              <td height="30" align="left" valign="middle">
                                <%=payway%></td>
                            </tr>
                            <tr class="orderxx">
                              <td height="15" align="left">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="41" align="right">
                        <%if (xianxiafukuan == 0)
                          {%>
                          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/user_zl_b10.gif" OnClick="ImageButton1_Click" />
                          <%} %>
                          &nbsp;&nbsp;<a href="user_sbdd.aspx"><img src="images/user_zl_b11.gif" width="85" height="29" border="0" /></a>  &nbsp;&nbsp;  <a href="javascript:void(0)"> <img src="images/user_zl_pr.jpg" onclick="printPage()" /></a>
                                                    <script type="text/javascript">
                                                        function printPage() {
                                                            var newWin = window.open();
                                                            var titleHTML = document.getElementById("pr_table").innerHTML;
                                                            newWin.document.write(titleHTML);
                                                            newWin.document.location.reload();
                                                            newWin.print();
                                                        }
                                                    </script></td>
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
  </td>
  </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
  <script type="text/javascript">
    function Checkshow() {
      var youhui = document.getElementById("cb_youhui");
      if (youhui.checked) {
        document.getElementById("youhuiquan").style.display = "";
      }
      else {
        document.getElementById("youhuiquan").style.display = "none";
      }
    }
    
    
    
    
  </script>
</body>
</html>
