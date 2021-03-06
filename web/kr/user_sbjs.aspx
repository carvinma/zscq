﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbjs.aspx.cs" Inherits="user_sbjs" %>

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
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
   <script src="js/tooltips.js" type="text/javascript"></script>
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
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;&gt;&gt;&nbsp;회원센터&nbsp;&gt;&gt;&nbsp;서비스 센터&nbsp;&gt;&gt;&nbsp;나의 상표&nbsp;&gt;&gt;&nbsp;상표정보 검색</td>
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
                  <td height="0">&nbsp;</td>
                  <td align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0" id="table_search1">
                      <tr>
                        <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);">
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="6" colspan="2"></td>
                            </tr>
                            <tr>
                              <td width="29" height="20">&nbsp;</td>
                              <td width="642" align="left" class="font14d4">간단검색</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="26" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="238" height="32" align="right"><strong>상표 출원번호：</strong></td>
                              <td width="433" align="left">
                                <input type="text" name="s1" id="sb_num" class="font12000 tooltip" maxlength="50" runat="server"  tips="수자와 영어문자만 입력해주세요"/></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>상표 범주：</strong></td>
                              <td align="left">
                                <input type="text" name="s5" id="sb_type" class="font12000" maxlength="50" runat="server" /></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>출원인：</strong></td>
                              <td align="left">
                                <input type="text" name="s3" id="Sb_regName" class="font12000" maxlength="50" runat="server" /></td>
                            </tr>
                            <tr>
                              <td height="32" align="right">&nbsp;</td>
                              <td align="left" valign="top">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                      <asp:Button ID="bt_kuaijiansuo" runat="server" Text="" Style="background: url(images/user_js_b1.gif); width: 85px; height: 29px; border: 0" OnClick="bt_kuaijiansuo_Click" />
                                    </td>
                                    <td width="108" align="left">
                                      <%--<input id="Reset2" type="reset" value="" style="border: 0; cursor: pointer; background: url(images/user_js_b2.gif); width: 86px; height: 27px;" />--%>
                                    </td>
                                    <td width="204" align="left"><img src="images/user_js_b3.gif" width="125" height="27" border="0" style="cursor: hand" onclick="onclickt1();" /></td>
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
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="123">&nbsp;</td>
                  <td width="691" align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0" id="table_search2" style="display:none ;">
                      <tr>
                        <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);">
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="6" colspan="2"></td>
                            </tr>
                            <tr>
                              <td width="29" height="20">&nbsp;</td>
                              <td width="642" align="left" class="font14d4">상세검색</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="26" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="center" valign="top">
                          <table width="630" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">기본정보</td>
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
                                <table width="630" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="225" height="32" align="right"><strong>상표 출원번호：<br />
                                    </strong></td>
                                    <td width="415" align="left">
                                      <input type="text" name="s5" id="Sb_Num1" class="font12000 tooltip" maxlength="50" runat="server"  tips="수자와 영어문자만 입력해주세요"/></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>상표 범주：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s5" id="Sb_Type1" class="font12000" maxlength="50" runat="server" /></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>상표 홀더：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s5" id="Sb_regName1" class="font12000" maxlength="50" runat="server" /></td>
                                  </tr>
                                  <%--<tr>
                                    <td height="32" align="right"><strong>출원인 국적：</strong></td>
                                    <td align="left"><span class="font12b4e user_zlbottomline">
                                      <asp:DropDownList ID="Drp_GuoJi" runat="server" style="width:185px;">
                                      </asp:DropDownList>
                                    </span></td>
                                  </tr>--%>
                                  <tr>
                                    <td height="32" align="right"><strong>출원일：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s10" runat="server" id="hot_pass_date" class="font12000" maxlength="30" style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="30" align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <table width="630" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">납부정보</td>
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
                                <table width="630" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="32" align="right"><strong>상표 납부상태 ：</strong></td>
                                    <td align="left">
                                      <asp:DropDownList ID="ddl_jiaofei" runat="server" style="width:185px;">
                                        <asp:ListItem Value="-1">선택</asp:ListItem>
                                         <asp:ListItem Value="1">주문 재출되였습니다</asp:ListItem>
                                        <asp:ListItem Value="2">납부되였습니다</asp:ListItem>
                                        <asp:ListItem Value="0">미 납부</asp:ListItem>
                                      </asp:DropDownList>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="221" height="32" align="right"><strong>기한일：</strong></td>
                                    <td width="409" align="left"><span class="font12b4e user_zlbottomline">
                                      <asp:DropDownList ID="ddl_day" runat="server" style="width:185px;">
                                        <asp:ListItem Value="0">선택</asp:ListItem>
                                        <asp:ListItem Value="1">>90</asp:ListItem>
                                        <asp:ListItem Value="2">61-90</asp:ListItem>
                                        <asp:ListItem Value="3">31-60</asp:ListItem>
                                        <asp:ListItem Value="4">16-30</asp:ListItem>
                                        <asp:ListItem Value="5">0-15</asp:ListItem>
                                        <asp:ListItem Value="chao">만료</asp:ListItem>
                                      </asp:DropDownList>
                                    </span></td>
                                  </tr>
                                  <%-- <tr>
                            <td height="32" align="right"><strong>납부년도：</strong></td>
                            <td align="left"><span class="font12b4e user_zlbottomline">
                              <select name="t6" class="font12000_t">
                                <option value="" selected="selected">所有年度</option>
                                <option value="1">日本</option>
                                <option value="2">中国</option>
                              </select>
                            </span></td>
                          </tr>--%>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <%if(userType==3){ %>
                          <table width="630" border="0" cellspacing="0" cellpadding="0">
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
                                <table width="630" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>안건번호</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="t_anjuanhao" class="font12000" maxlength="50"   onkeyup="value=value.replace(/[^\w]/ig,'')" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>련락처</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_linkman" class="font12000" maxlength="20" />
                                    </td>
                                  </tr>
                                
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>전화</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                                    </td>
                                  </tr>
                                    <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>주소</strong>：</td>
                                    <td width="429" valign="middle">                                
                                        <textarea cols="20" rows="2" type="text" name="s6" id="txt_address" style="width: 300px;height:40px;"  class="font12000" maxlength="250" runat="server" ></textarea>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">&nbsp;</td>
                                    <td align="left" valign="middle">&nbsp;</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          <%} %>
                          <table width="630" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td height="115" align="left" valign="top">
                                <table width="630" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">&nbsp;</td>
                                    <td align="left" valign="middle">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">&nbsp;
                                    
                                    </td>
                                    <td align="left" valign="middle">
                                     <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                      <asp:Button ID="Button2" runat="server" Text="" Style="background: url(images/user_js_b1.gif); width: 85px; height: 29px; border: 0" OnClick="bt_jiansuoAll_Click" />
                                    </td>
                                    <td width="108" align="left">
                                      <%--<input id="Reset3" type="reset" value="" style="border: 0; cursor: pointer; background: url(images/user_js_b2.gif); width: 86px; height: 27px;" />--%>
                                    </td>
                                    <td width="204" align="left"><img src="images/user_js_b4.gif" width="125" height="27" border="0" style="cursor: hand" onclick="onclickt2()"/></td>
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
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
<script type="text/javascript">
  function onclickt1() {
    document.getElementById("table_search1").style.display = "none";
    document.getElementById("table_search2").style.display = "";
  }
  function onclickt2() {
    document.getElementById("table_search1").style.display = "";
    document.getElementById("table_search2").style.display = "none";
  }
</script>
