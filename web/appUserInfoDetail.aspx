<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appUserInfoDetail.aspx.cs" Inherits="appUserInfoDetail" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>商标信息检索_我的商标_服务中心_商标系统_环球汇通</title>
  <meta name="Keywords" content="环球汇通" />
  <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/jtrademark.js" type="text/javascript"></script>
  <script language="javascript" type="text/javascript">
      $(function () {
          var appUserType = getUrlParam('ApplyType');
          if (appUserType == "1") {
             // $("#Hi_ApplyType").val(1);
              $(".appusertype").show();
          }
          else {
             // $("#Hi_ApplyType").val(0);
          }
      });
  </script>
</head>
<body id="index">
  <form id="form1" runat="server">
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
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;常用申请人&nbsp;&gt;&gt;&nbsp;查看申请人信息 </td>
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
                <tr style="display:none">
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691" align="right">
                    <table>
                      <tr>
                        <td align="right">
                        </td>
                        <td align="right"><a href="#"><img src="images/user_zl_b12.gif" width="85" height="29" border="0" runat=server id="ImgShow" />&nbsp;<a href="user_sblb.aspx"><img src="images/user_zl_b13.gif" width="85" height="29" border="0" /></a> </td>
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
                                    <td width="98" align="center" class="font12bt">申请人信息 </td>
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
                                    <td width="260" height="32" align="right"><strong>申请人名称：</strong> </td>
                                    <td align="left">
                                      <%=model.ApplyName %>
                                    </td>
                                  </tr>
                                  <tr style="display:none" class="appusertype">
                                    <td height="32" align="right"><strong>身份证号码：</strong> </td>
                                    <td align="left">
                                      <%= model.ApplyCardNo%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>固定电话：</strong> </td>
                                    <td align="left"><%=model.PhoneNo %>
                                    </td>
                                  </tr>
                                  
                                  <tr>
                                    <td height="32" align="right"><strong>常用联系人：</strong></td>
                                    <td align="left"> <%=model.ContactPerson %></td>
                                  </tr>
                                  
                                  <tr>
                                    <td height="32" align="right"><strong>传真(含地区号)：</strong> </td>
                                    <td align="left">
                                      <%=model.FaxNo %>
                                    </td>
                                  </tr>
                                   
                                  <tr>
                                    <td height="32" align="right"><strong>详细地址：</strong> </td>
                                    <td align="left">
                                      <%=model.Address%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>邮政编码：</strong> </td>
                                    <td align="left"><%=model.PostCode%>
                                    </td>
                                  </tr>
                                     <tr>
                                    <td height="32" align="right"><strong>手机：</strong> </td>
                                    <td align="left">
                                      <%=model.MobilePhone%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>电子邮箱：</strong> </td>
                                    <td align="left">
                                      <%=model.Email%> </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>QQ：</strong> </td>
                                    <td align="left"><%=model.QQ%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>主体资格证明：</strong> </td>
                                    <td align="left"><%=model.MainQualificationPath%>
                                    </td>
                                  </tr>
                                  <tr style="display:none" class="appusertype">
                                    <td height="32" align="right"><strong>身份证证件证明：</strong></td>
                                    <td align="left"><%=model.CardNoPath%></td>
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
                              <td height="115" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td style="height: 50px;" align="right">
                                      <table width="389" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="100" height="35">
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
