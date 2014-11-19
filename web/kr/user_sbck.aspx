<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbck.aspx.cs" Inherits="user_sbck" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>상표정보 검색_나의 상표_서비스 센터_상표시시템_Global Patent</title>
  <meta name="Keywords" content="Global Patent" />
  <meta name="Description" content="HQHT 연차료관리 전자상거래 플랫폼" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script language="javascript">
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
                  <td width="38" height="28">&nbsp; </td>
                  <td width="701">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;&gt;&gt;&nbsp;회원센터&nbsp;&gt;&gt;&nbsp;서비스 센터&nbsp;&gt;&gt;&nbsp;나의 상표&nbsp;&gt;&gt;&nbsp;상표 정보 보기 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="28">&nbsp; </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691" align="right">
                     <table width="491" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="right">
                          <%if (JiaoFeiType == "1")
                            { %>
                          <asp:Button ID="Button5" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world3.gif); width: 129px; height: 29px;" OnClick="Button1_Click" />
                          <%} %>
                          <%if (JiaoFeiType == "2")
                            { %>
                          <asp:Button ID="Button3" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world1.gif); width: 129px; height: 29px;" OnClick="Button2_Click" />
                          &nbsp;
                          <asp:Button ID="Button4" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world2.gif); width: 149px; height: 29px;" OnClick="Button3_Click" />
                          <%} %>
                        </td>
                        <td align="right"><a href="user_sbupdate.aspx?t_r_id=<%=trademarkId %>"><img src="images/user_zl_b12.gif" width="85" height="29" border="0" runat=server id="ImgShow" />&nbsp;<a href="user_sblb.aspx"><img src="images/user_zl_b13.gif" width="85" height="29" border="0" /></a> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td width="691" align="left" valign="top">
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="center" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="28" align="left" valign="bottom" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="98" align="center" class="font12bt">기본 정보 </td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right"><strong>상표 출원번호：</strong> </td>
                                    <td align="left">
                                      <%=SBRegNum %>
                                    </td>
                                  </tr>
                                  <%--  <tr>
                        <td height="32" align="right"><strong>商标名称：</strong></td>
                        <td align="left">&nbsp;</td>
                        </tr>--%>
                                  <tr>
                                    <td height="32" align="right"><strong>상표 류형：</strong> </td>
                                    <td align="left">
                                      <%= SBRegaType%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>출원인<%if (usertype == 3)
                                                                      { %>(중국어)<%} %>：</strong> </td>
                                    <td align="left"><%=SBRegName %>
                                    </td>
                                  </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>출원인(영어)：</strong> </td>
                                    <td align="left">
                                      <%=Sb_RegnameEn %>
                                    </td>
                                  </tr>
                                  <%} %>
                                  <tr>
                                    <td height="32" align="right"><strong>출원인 주소 <%if (usertype == 3)
                                                                      { %>(중국어)<%} %>：</strong> </td>
                                    <td align="left">
                                      <%=SBRegAddress %>
                                    </td>
                                  </tr>
                                   <tr>
                                    <td height="32" align="right"><strong>등록자 코드：</strong> </td>
                                    <td align="left">
                                      <%=SBRegYouBian%>
                                    </td>
                                  </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>출원인 주소(영어)：</strong> </td>
                                    <td align="left">
                                      <%=SBRegEnAddress%>
                                    </td>
                                  </tr>
                                  <%} %>
                                 
                                  <tr>
                                    <td height="32" align="right"><strong>상표 등록의 날：</strong> </td>
                                    <td align="left"><%=SBPssTime%>
                                    </td>
                                  </tr>
                                     <tr>
                                    <td height="32" align="right"><strong>상표의 유효 기한：</strong> </td>
                                    <td align="left">
                                      <%=daoqitime%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>멀리 기한에서 나머지 일 수：</strong> </td>
                                    <td align="left">
                                      <%=shengtime%></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>상표표시 류형：</strong> </td>
                                    <td align="left"><%=SBmiaoshutype%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>상표표시：</strong> </td>
                                    <td align="left"><%=SBRegMiaoshu%>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="30" align="left">&nbsp; </td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="98" align="center" class="font12bt">납부정보 </td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                <%--  <tr>
                                    <td width="260" height="32" align="right"><strong>납부 류형：</strong> </td>
                                    <td><span class="font12b4e user_zlbottomline">
                                      <%=JiaoFeiType=="1"?"스스로 비용을 납부하다":"위탁 납부" %>
                                    </span></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right"><strong>缴费状态：</strong> </td>
                                    <td align="left"><%=isjiaofei%>
                                    </td>
                                  </tr>--%>
                               
                                
                                <% if (int.Parse(JiaoFeiType)== 2)
                                     { %>
                                     <tr id="dailifei">                                   
                                    <td width="260" height="32" align="right" >상표 수수료의 공식 웹 사이트：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                      CNY&nbsp;<%=Str_Moneysb%>                                    
                                    </span></td>                                  
                                    </tr>
                                     <tr>
                                    <td width="260" height="32" align="right" >상표 에이전트 수수료：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=sbdailiweituo%>                                    
                                    </span></td>                                  
                                    </tr>
                                      
                                      <%if (iszhinajin == 1)
                                                                      { %>
                                                                    <tr>
                                                                        <td width="260" height="32" align="right">
                                                                            연체 요금을 상표：
                                                                        </td>
                                                                        <td>
                                                                            <span class="font12b4e user_zlbottomline">
                                                                                CNY&nbsp;<%=Str_Zhinajin%>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <%} %>
                                    <tr>
                                    <td width="260" align="right" height="32">합계：</td><td><span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=zongjiweituo%>                                    
                                    </span></td>                                    
                                    </tr>     
                                    <tr >
                                    <td height="5"></td><td></td>
                                    </tr>
                                      <tr>                               
                                     <%if (guoji == 0)
                                       { %>                                     
                                      <tr>
                                    <td width="260" align="right" height="32">외국 비용 합계：</td><td><span class="font12b4e user_zlbottomline">
                                       <%=bizhong %>&nbsp;<%=zongjimeiweituo%>                                    
                                    </span></td>                                    
                                    </tr>                                     
                                    <%} %>     
                                    <%} %>
                                      <%--<tr>
                                    <td height="32" align="right">외화종류：</td>
                                    <td width="429" align="left"><span class="font12b4e user_zlbottomline">
                                      <%=bizhong %>
                                    </span></td>
                                  </tr>--%>
                                  <tr>
                                    <td align="left">&nbsp; </td>
                                  </tr>
                                </table>
                                     <%if (usertype == 3)
                            { %>                          
                          <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">제삼방 정보</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>안건번호</strong>：</td>
                                    <td width="429" valign="middle">
                                   <%=anjuanhao %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>련락처</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linkman %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>주소</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linkaddress %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>전화</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linktel %>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <%} %>
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                      <table width="114" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="10" height="20">&nbsp; </td>
                                          <td width="98" align="center" class="font12bt">파일 업로드 </td>
                                          <td width="6"></td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="18" align="left"></td>
                                  </tr>
                                  <tr>
                                    <td height="115" align="left" valign="top">
                                      <table width="689" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>자격 증명서：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=zhutifileok%>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>상표증서 복사건：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=sbfileok%>
                                          </td>
                                        </tr>
                                       
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>신청：</strong> </td>
                                          <td align="left" width="429">
                                            <%=shenqingfile%>
                                          </td>
                                        </tr>
                                        
                                       <%if (int.Parse(JiaoFeiType) == 2 || usertype==3)
                                         {
                                             %>                                   
                                        <tr>
                                          <td height="32" align="right"><strong>위임장：</strong> </td>
                                          <td align="left">
                                            <%=weituofile%>
                                          </td>
                                        </tr>
                                        <%}%>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td style="height: 50px;" align="right">
                                      <table width="389" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="100" height="35">
                                       
                                            <%--<asp:Button ID="Button1" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_zl_upload.gif); width: 85px; height: 29px;" OnClick="Button1_Click1"  />--%>
                                             
                                       
                                          </td>
                                          <td width="95" align="right"></td>
                                          <td width="108" align="right">&nbsp;<%--<img src="images/user_js_b2.gif" width="86" height="27" />--%>
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="left">&nbsp; </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp; </td>
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
  <div id="div_a" runat="server">
  </div>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
