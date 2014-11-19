<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <%= TitleOrKeyword %>
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <style type="text/css">
    #bg { display: none; z-index: 1; background: #0b0b0b; left: 0px; width: 100%; height: 100%; position: absolute; top: 0px; filter: alpha(opacity=70); opacity: 0.7; }
    #show { display: none; margin-top: 10px; z-index: 2; position: absolute; top: 0px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
  <asp:HiddenField ID="Hf_Href" runat="server" />
  <asp:HiddenField ID="Hf_PageFlag" runat="server" />
  <div id="bg">
  </div>
  <div id="show">
    <table width="571" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38" align="left" valign="top" style="background-image: url(images/faq_bg1.gif);">
          <table width="700" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="662" height="38">&nbsp;</td>
              <td width="38"><a href="#"><img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidediv();" /></a></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="150" align="left" valign="top" style="background-image: url(images/faq_bg2.gif);">
          <table width="700" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="36">&nbsp;</td>
              <td align="center" style="line-height: 21px; font-size: 14px; font-weight: bold;">环球汇通用户注册协议</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="40" height="150">&nbsp;</td>
              <td width="615" align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                <div style="width: 611px; min-height: 570px; max-height: 480px; overflow-y: auto;">
                  <%= contents%>
                </div>
              </td>
              <td width="45">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="15"><img src="images/faq_bg3.gif" width="700" height="20" /></td>
      </tr>
    </table>
  </div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;" height="112">
    <tr>
      <td height="127" valign="top" align="center">
        <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
          <tr>
            <td height="127" align="left" valign="top">
              <table width="915" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="667" height="52" align="left" valign="top"><table width="200" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="103">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="left">&nbsp;<a href="index.aspx">返回首页&gt;&gt;</a></td>
                    </tr>
                  </table></td>
                  <td width="248" align="left" valign="top">
                    <table width="248" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="248" height="65" colspan="7"></td>
                      </tr>
                      <tr>
                        <td height="62" colspan="7" align="right" valign="top"><a href="index.aspx"><img src="images/logo1.gif" width="236" height="62" border="0" /></a> </td>
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
  <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="915" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="466" height="308" align="left" valign="top">
        <table width="466" height="252" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="260" height="308" align="left" valign="top" style="background-image: url(<%=pageflag%>);">
              <table width="464" height="285" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="53"></td>
                </tr>
                <tr>
                  <td width="60" height="33">&nbsp; </td>
                  <td width="404" align="left" valign="top">
                    <table width="398" height="207" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="72" height="32" class="font14">用户昵称： </td>
                        <td width="200" align="left">
                          <input type="text" name="textfield" id="txt_username" style="width: 187px; line-height: 20px; height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" onblur="validateName()" />
                        </td>
                        <td width="126" align="left" class="font12ac5" id="td_username"></td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">会员类型： </td>
                        <td colspan="2" align="left"><span style="line-height: 21px;">
                          <input type="radio" name="radio" id="rd_type1" value="radio" checked="checked" /><%=radioinfo1 %>&nbsp;
                          <input type="radio" name="radio" id="rd_type2" value="radio" /><%=radioinfo2 %>&nbsp;
                          <input type="radio" name="radio" id="rd_type3" value="radio" /><%=radioinfo3 %> </span></td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">所属国籍： </td>
                        <td colspan="2" align="left">
                          <asp:DropDownList ID="Drp_GuoJi" runat="server" Style="border: 1px solid #ebebeb; font-size: 12px; font-weight: bold; width: 189px; height: 24px; background-color: #dedede;">
                            <asp:ListItem Value="0">选择国籍</asp:ListItem>
                          </asp:DropDownList>
                        </td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">电子邮箱： </td>
                        <td colspan="2" align="left">
                          <input type="text" name="textfield2" id="txt_email" style="width: 187px; height: 20px; line-height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" />
                        </td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">用户密码： </td>
                        <td align="left">
                          <input type="password" name="textfield" id="txt_pwd" style="width: 187px; height: 20px; line-height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" />
                        </td>
                        <td align="left" class="font12ac5"></td>
                      </tr>
                      <tr>
                        <td height="32" class="font14">确认密码： </td>
                        <td align="left">
                          <input type="password" name="textfield" id="txt_okpwd" style="width: 187px; height: 20px; line-height: 20px; border: 1px solid #cecece; background-color: #cecece;" maxlength="50" />
                        </td>
                        <td align="left"></td>
                      </tr>
                      <tr>
                        <td height="8" colspan="3"></td>
                      </tr>
                      <tr>
                        <td height="32">&nbsp; </td>
                        <td colspan="2" align="left">
                          <table width="315" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="160" height="30" align="left"><img src="images/reg.gif" width="147" height="24" border="0" onclick="user_register()" style="cursor: pointer" /> </td>
                              <td width="155" align="left"><a href="javascript:openBg(1);showdiv('1');" class="ac5">《环球汇通用户注册协议》</a> </td>
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
      <td width="449" align="left" valign="top">
        <table width="449" height="308" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10" align="left" valign="top"><img src="images/login3.gif" width="449" height="9" /></td>
          </tr>
          <tr>
            <td height="291" align="left" valign="top" style="background-image: url('<%=_Adv %>');">
              <table width="449" height="66" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="16"></td>
                </tr>
                <tr>
                  <td height="21">&nbsp; </td>
                  <td align="left" valign="top" style="line-height: 21px;">
                    <p>
                      <strong style="color: #fff;">已经是环球汇通用户？</strong>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td width="29" height="26">&nbsp; </td>
                  <td width="420" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Login.aspx?flag=<%=Hf_PageFlag.Value %>" class="ac4">立即去登录&gt;&gt;</a> </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="7" align="left" valign="top"><img src="images/login5.gif" width="449" height="7" /></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  </form>
</body>
</html>
<script src="js/chy.js" type="text/javascript"></script>
<script>
  function openBg(state) { //遮照打开关闭控制
    if (state == 1) {
      document.getElementById("bg").style.display = "block";
      var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
      h = h > document.body.scrollHeight ? h : document.body.scrollHeight;
      //alert(document.body.clientHeight);
      //alert(document.body.scrollHeight);
      //alert(document.body.offsetHeight);
      //alert(document.documentElement.offsetHeight); 
      document.getElementById("bg").style.height = h + "px";
    }
    else {
      document.getElementById("bg").style.display = "none";
    }
  }
  function showdiv(id) {
    //var id=$("#Hidden1").val();
    //alert(id);
    // var showdiv = $("#show");

    $("#show").show();
    document.getElementById("show").style.left = (document.getElementById("bg").offsetWidth - document.getElementById("show").offsetWidth) / 2 + "px";
    document.getElementById("show").style.top = document.documentElement.scrollTop + 20 + "px";
    //$("#Label2").html(id);
    // $("#Text4").val(id);
  }

  function hidediv() {
    $("#show").hide();
    $("#bg").hide();
  }
</script>
