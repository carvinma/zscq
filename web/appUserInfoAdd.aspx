<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appUserInfoAdd.aspx.cs" Inherits="appUserInfoAdd" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%= TitleOrKeyword %>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <script src="js/js.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
    <script src="js/jtrademark.js" type="text/javascript"></script>
  <script type="text/javascript">

      $(function () {
          var appUserType = getUrlParam('flag');
          if (appUserType == "1") {
              $("#Hi_ApplyType").val(1);
              $(".appusertype").show();
          }
          else {
              $("#Hi_ApplyType").val(0);
          }
          InitProCityArea();
      });
      $(document).ready(function () {
          var accordion_head = $('.accordion > li > a'),
				accordion_body = $('.accordion li > .sub-menu');
          accordion_head.eq($("#state").text()).addClass('active').next().slideDown('normal');
          accordion_head.on('click', function (event) {
              event.preventDefault();
              if ($(this).attr('class') != 'active') {
                  accordion_body.slideUp('normal');
                  $(this).next().stop(true, true).slideToggle('normal');
                  accordion_head.removeClass('active');
                  $(this).addClass('active');
              }
          });
      });
  </script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <input type="hidden" runat="server" id="Hi_ApplyType" clientidmode="Static" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />
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
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;账户中心&nbsp;&gt;&gt;&nbsp;常用申请人&nbsp;&gt;&gt;&nbsp;新增申请人 </td>
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
                                      <asp:Literal runat="server" ID="lit_type" Text="新增申请人"></asp:Literal>
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
                              <td width="129" height="32" align="right"><strong><span style="color: #f00;">*</span>申请人名称：</strong> </td>
                              <td width="542" align="left">
                                <input runat="server" id="txt_applyname" type="text" onblur="check_ApplyUser('name_div')" name="" value="" placeholder="" class="font12000" maxlength="50"/>
                                <span class="status error" id="name_div_error"></span>
                              </td>
                            </tr>
                            <tr style="display:none" class="appusertype">
                              <td width="129" height="32" align="right"><strong><span style="color: #f00;">*</span>身份证号码：</strong></td>
                              <td width="542" align="left">
                                <input runat="server" id="txt_applyCardNo" onblur="check_ApplyUser('cardno_div')" type="text" name="" value="" 
                                      placeholder="" class="font12000" maxlength="18"/>
                                     <span class="status error" id="cardno_div_error"></span></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong><span style="color: #f00;">*</span>固定电话：</strong> </td>
                              <td align="left">
                              <input runat="server" id="txt_phone" onblur="check_ApplyUser('phone_div')" class="font12000" type="text" name="" value="" placeholder="" maxlength="20" />
                                 <span class="status error" id="phone_div_error"></span>
                              </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>传真(含地区号)： </strong></td>
                              <td align="left">
                                 <input runat="server" id="txt_fax" onblur="check_ApplyUser('fax_div')" class="font12000" type="text" name="" value="" placeholder="" maxlength="20" />
                                 <span class="status error" id="fax_div_error"></span>
                                 </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong><span style="color: #f00;">*</span>行政区划：</strong></td>
                              <td align="left">
                                  <select id="live_prov" name="live_prov" onchange="SelCity(this.value);">
                                  <option value="">请选择：</option></select>
                                  <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                                  <option value="">请选择：</option></select>
                                  <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                                  <option value="">请选择：</option></select>
                                   <span class="status error" id="area_div_error"></span>
                                    <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static"  />
                                    <input type="hidden" runat="server" id="Hi_city" clientidmode="Static" />
                                    <input type="hidden" runat="server" id="Hi_country" clientidmode="Static" />
                                  </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong><span style="color: #f00;">*</span>详细地址：</strong></td>
                              <td align="left">
                              <span class="fl selected-address" id="areaNameTxt"></span>
                                <input class="font12000" onblur="check_ApplyUser('address_div')" runat="server" style="ime-mode: disabled;" id="txt_address" maxlength="50" type="text" 
                                      name="" value=""/>
                                 <span class="status error" id="address_div_error"></span></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong><span style="color: #f00;">*</span>邮政编码：</strong></td>
                              <td align="left">
                                <input class="font12000"  onblur="check_ApplyUser('postcode_div')" runat="server" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" id="txt_postcode" maxlength="6" type="text" name="" value="" placeholder=""/>
                                <span class="status error" id="postcode_div_error"></span>
                                </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>手机： </strong></td>
                              <td align="left">
                                <input runat="server" id="txt_mobile" onblur="check_ApplyUser('mobile_div')" maxlength="11" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;" class="font12000" type="text" name="" value="" placeholder="" />
                                 <span class="status error" id="mobile_div_error"></span>
                                 </td>
                            </tr>
                            <tr>
                              <td align="right" class="style1"><strong><span style="color: #f00;">*</span>电子邮箱：</strong></td>
                              <td align="left" class="style1">
                                  <input class="font12000" onblur="check_ApplyUser('email_div')" maxlength="50" runat="server" id="txt_email" type="text" name="" value="" placeholder="" />
                                  <span class="status error" id="email_div_error"></span>
                                  </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>QQ：</strong></td>
                              <td align="left">
                                  <input class="font12000" maxlength="20" runat="server" id="txt_qq" 
                                      type="text" name="" value="" placeholder="" onkeypress="event.returnValue=IsDigit();" style="ime-mode: disabled;"  /></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>主体资格证明：</strong> </td>
                              <td align="left">
                                  <asp:FileUpload ID="FileUpload1" runat="server" Width="200px"/>
                                  <div id="sb_namenum1"><span style="color:Red;">格式为.jpg.gif.png.PDF,不大于500K</span></div> </td>
                            </tr>
                            <tr style="display:none" class="appusertype">
                              <td height="32" align="right"><strong>身份证证件证明：</strong></td>
                              <td align="left">
                                  <asp:FileUpload ID="FileUpload2" runat="server" Width="200px" />
                                  <div id="Div1"><span style="color:Red;">格式为.jpg.gif.png.PDF,不大于500K</span></div> </td>
                            </tr>
                            <tr>
                              <td height="32" align="right">&nbsp; </td>
                              <td align="left" valign="top">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                        &nbsp;</td>
                                    <td width="108" align="left">&nbsp; 
                                      <asp:ImageButton ID="Bt_AddAddress" CssClass="button52_28" runat="server" Text="添加" OnClick="Bt_AddAddress_Click" OnClientClick="return submitCheck_ApplyUser()" 
                                      ImageUrl="images/user_zl_b5.gif" Width="88" Height="29" BorderWidth="0" />
                                      </td>
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
