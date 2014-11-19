<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_shopdzadd.aspx.cs" Inherits="user_shopdzadd" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sp_leftmenu.ascx" TagName="zscq_sp_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <%= TitleOrKeyword %>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 109px;
        }
    </style>
</head>
<body id="index">
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="98" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <uc1:zscq_sp_leftmenu ID="zscq_sp_leftmenu1" runat="server" />
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
                  <td align="left"><a href="index.aspx">홈</a>&nbsp;&gt;&gt;&nbsp;회원센터&nbsp;&gt;&gt;&nbsp;계정센터&nbsp;&gt;&gt;&nbsp;우편주소&nbsp;&gt;&gt;&nbsp;주소추가 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691">&nbsp; </td>
                </tr>
                <tr>
                  <td height="123">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="115" align="center" class="font12bt">
                                      <asp:Literal runat="server" ID="lit_type" Text="주소추가"></asp:Literal>
                                    </td>
                                    <td width="7"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left"></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="32" align="right" class="style1"><strong><span style="color: #f00;">*</span>받은 사람：</strong> </td>
                              <td width="433" align="left">
                                <input runat="server" id="text_shouhuoren" type="text" name="" value="" placeholder="" class="font12000" maxlength="50">
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>상용 이메일：</strong> </td>
                              <td align="left">
                                <input class="font12000" maxlength="50" runat="server" id="text_dianziyoujian" type="text" name="" value="" placeholder="" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>받는사람  핸드폰：</strong> </td>
                              <td align="left">
                                <input runat="server" id="text_shoujihaoma" maxlength="11" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" class="font12000" type="text" name="" value="" placeholder="" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong><span style="color: #f00;">*</span>주소 전화：</strong> </td>
                              <td align="left">
                                <input runat="server" id="text_gudingdianhua" class="font12000" type="text" name="" value="" placeholder="" />
                                <span></span> </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>우편번호：</strong> </td>
                              <td align="left">
                                <input class="font12000" runat="server" onkeypress="event.returnValue=IsDigit();" onkeydown="event.returnValue=IsDigit();" style="ime-mode: disabled;" id="text_youzhengbianma" maxlength="6" type="text" name="" value="" placeholder="">
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong><span style="color: #f00;">*</span>국가：</strong> </td>
                              <td align="left"><span class="font12b4e user_zlbottomline">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                  <ContentTemplate>
                                    <asp:DropDownList ID="ddl_guojia" runat="server">
                                    </asp:DropDownList>
                                   
                                  </ContentTemplate>
                                </asp:UpdatePanel>
                              </span></td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>상세한 주소
：</strong> </td>
                              <td align="left">
                                <input runat="server" id="text_shouhuodizhi" class="font12000" type="text" name="" value="" placeholder="" maxlength="250" style="width:300px;" /><span>전체 주소를 입력하십시오</span></td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1"><strong>무직적으로  설치：</strong> </td>
                              <td align="left">
                                <input type="checkbox" runat="server" id="ismr" />
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right" class="style1">&nbsp; </td>
                              <td align="left" valign="top">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                      <asp:ImageButton ID="Bt_AddAddress" CssClass="button52_28" runat="server" Text="添加" OnClick="Bt_AddAddress_Click" OnClientClick="return Check()" ImageUrl="images/user_zl_b5.gif" Width="88" Height="29" BorderWidth="0" />
                                    </td>
                                    <td width="108" align="left">&nbsp; </td>
                                    <td width="204" align="left">&nbsp; </td>
                                  </tr>
                                </table>
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
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
  function IsDigit() {
    return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) && (event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
  }
  var reg = /^([a-zA-Z0-9]+[-\_\_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  var reg2 = /^1((3[0-9])|(4[57])|(5([0-3]|[5-9]))|(8(0|[2-3]|[5-9])))[0-9]{8}$/;
  var reg3 = /^[a-zA-Z0-9_]{4,20}$/;
  var reg4 = /^(\d{3,4}-)?\d{7,8}$/;
  function Check() {

    if (document.getElementById("text_shouhuoren").value == "") {
      alert("수하인 작성해 주십시오!");
      document.getElementById("text_shouhuoren").focus();
      return false;
    }
//    if (document.getElementById("text_shoujihaoma").value == "" && document.getElementById("text_gudingdianhua").value == "") {
//      document.getElementById("text_shoujihaoma").focus();
//      alert("手机号和电话必须填写一项!");
//      return false;
//    }
if (document.getElementById("text_gudingdianhua").value == "") {
      alert("이 전화 주세요.!");
      document.getElementById("text_gudingdianhua").focus();
      return false;
    }
//    if (document.getElementById("text_shoujihaoma").value == "") {
//      alert("请填写手机号!");
//      document.getElementById("text_shoujihaoma").focus();
//      return false;
//    }
//    if (document.getElementById("text_shoujihaoma").value != "") {
//      if (reg2.test(document.getElementById("text_shoujihaoma").value) == false) {
//        alert('手机号码格式有误!');
//        document.getElementById("text_shoujihaoma").focus();
//        return false;
//      }
//    }
     if (document.getElementById('ddl_guojia').value == "0") {
      document.getElementById("ddl_guojia").focus();
      alert("국가!");
      return false;
    }
    //    if (document.getElementById('ddl_sheng').value == "0") {
    //      document.getElementById("ddl_sheng").focus();
    //      alert("성이 선택하십시오.!");
    //      return false;
    //    }
    //    if (document.getElementById('ddl_shi').value == "0") {
    //      document.getElementById("ddl_shi").focus();
    //      alert("도시 선택!");
    //      return false;
    //    }
    //    if (document.getElementById('ddl_qu').value == "0") {
    //      document.getElementById("ddl_qu").focus();
    //      alert("지역을 선택하십시오.");
    //      return false;
    //    }
    if (document.getElementById("text_shouhuodizhi").value == "") {
      alert("자세한 주소를 적어 주세요!");
      document.getElementById("text_shouhuodizhi").focus();
      return false;
    }
    if (document.getElementById("text_dianziyoujian").value != "") {
      if (reg.test(document.getElementById("text_dianziyoujian").value) == false) {
        alert('메일함 형태 잘못된!');
        document.getElementById("text_dianziyoujian").focus();
        return false;
      }
    }
  }


</script>
