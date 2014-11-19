<%@ Page Language="C#" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.8.0.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 525px;
        }
        .style2
        {
            width: 147px;
        }
    </style>
</head>
<body id="faq">
  <form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <div id="bg" class="divbg">
      </div>
      <div id="show" class="divshow">
        <table width="571" height="299" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto; background-image: url(images/faq_bg.png);">
          <tr>
            <td height="299" align="left" valign="top">
              <table width="571" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="36" height="58">&nbsp; </td>
                  <td width="480">&nbsp; </td>
                  <td width="55" align="right" valign="top"><a href="javascript:void(0)"><img src="images/faq_close.gif" width="38" height="38" border="0" onclick="hidediv();" /> </a></td>
                </tr>
                <tr>
                  <td height="205">&nbsp; </td>
                  <td align="left" valign="top">
                    <table width="480" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="41" height="32" align="left"><strong>Subject：</strong> </td>
                        <td width="432" valign="middle">
                          <input type="text" name="ipt_subtitle" id="ipt_subtitle" onblur="checkVal()" class="required" style="height: 23px; line-height: 23px; width: 346px; font-size: 12px; border: 1px solid #bebebe;" maxlength="100" />
                        </td>
                      </tr>
                      <tr>
                        <td height="32" align="left"><strong>E-mail：</strong> </td>
                        <td valign="middle">
                          <input type="text" name="ipt_email" id="ipt_email" runat="server" onblur="checkVal()" class="required email" style="height: 23px; line-height: 23px; width: 346px; font-size: 12px; border: 1px solid #bebebe;" maxlength="50" />
                        </td>
                      </tr>
                      <tr>
                        <td height="88" align="left"><strong>Content：</strong> </td>
                        <td valign="middle">
                          <textarea name="txt_content" id="txt_content" onblur="checkVal()" class="required" cols="45" rows="5" style="height: 80px; width: 346px; font-size: 12px; border: 1px solid #bebebe;"></textarea>
                        </td>
                      </tr>
                      <tr>
                        <td height="30" colspan="2" align="center"><strong style="color: #d34245;">Please contact us for more detailed assistance</strong> </td>
                      </tr>
                      <tr>
                        <td height="30" colspan="2" align="center">
                          <asp:ImageButton ID="ibtn_Add" ImageUrl="images/faq3.gif" Width="118" Height="29" BorderWidth="0" runat="server" OnClick="ibtn_Add_Click" OnClientClick="return checkVal();" />
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td height="15">&nbsp; </td>
                  <td>&nbsp; </td>
                  <td>&nbsp; </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>
    </ContentTemplate>
  </asp:UpdatePanel>
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="63" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td height="78" align="left" valign="top">
        <table width="1001" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left" valign="top" class="style1"><img src="images/faq.gif" width="212" height="78" /> </td>
            <td width="91" align="left"><a href="javascript:void(0)"><img src="images/faq1.gif" width="86" height="27" border="0" id="img_faq" onclick="openBg(1);showdiv('1');" /></a></td>
            <td align="left" class="style2">Search in current page： </td>
            <td width="226" align="left">
              <table width="184" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="184" height="19" align="left" valign="top" style="background-image: url(images/search.gif);">
                    <table width="183" border="0" align="right" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="152" height="19">
                          <input runat="server" id="pagekeyword" type="text" name="pagekeyword" value="" style="height: 12px; width: 152px; font-size: 12px; border: 0; outline: 0 none;" maxlength="30" onkeyup="if(event.keyCode==13){s(); }" /></td>
                        <td width="24" align="left"><img alt="Search" src="images/search1.gif" width="23" height="17" onclick="s();" style="cursor: pointer;" /></td>
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
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td height="99" align="left" valign="top">
        <table width="1001" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100" height="72">&nbsp; </td>
            <td width="851" align="left" valign="top">
              <%if (AspNetPager1.RecordCount > 0)
                { %>
              <asp:Repeater ID="Rpt_List" runat="server">
                <ItemTemplate>
                  <table width="851" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="21" align="center" valign="top" style="line-height: 21px;">
                        <table width="851" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15" height="15">&nbsp; </td>
                            <td width="808" align="left" valign="top">
                              <table width="807" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="807" height="40" align="left" style="line-height: 40px; vertical-align: middle; font-weight: bold;">Q：<%#Eval("nvc_SubTitle").ToString().TrimEnd('?').TrimEnd('？') %>？ &nbsp;<%#Eval("i_IsTop").ToString() == "1" ? "<img src=\"images/faq_top.gif\" style=\"width:20px;height:18px;\">" : ""%></td>
                                </tr>
                                <tr>
                                  <td width="807" height="28" align="left" valign="top" style="line-height: 21px;"><strong>A：</strong>
                                    <%#Eval("nvc_ReplayContent")%>
                                  </td>
                                </tr>
                              </table>
                            </td>
                            <td width="28">&nbsp; </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="26" align="left" style="background-image: url(images/faq2.gif);">&nbsp; </td>
                    </tr>
                  </table>
                </ItemTemplate>
              </asp:Repeater>
              <%}
                else
                { %>
              <asp:Label ID="lb_msg" runat="server" Text="No related contents can be found!"></asp:Label>
              <%} %>
            </td>
            <td width="50">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="center" valign="top">
        <table class="aspnetpager" cellspacing="3" cellpadding="0">
          <tr>
            <webdiyer:AspNetPager NumericButtonCount="5" ID="AspNetPager1" OnPageChanged="AspNetPager1_PageChanged" AlwaysShow="true" ShowPageIndex="true" runat="server" ShowFirstLast="true" FirstPageText="Front page" LastPageText="Last page" PrevPageText="Previous page" NextPageText="Next page" ShowInputBox="Never" PageSize="6" SubmitButtonText="GO" TextAfterInputBox="page" CustomInfoHTML="Total %PageCount% page " CustomInfoTextAlign="Right" ShowCustomInfoSection="Right" SubmitButtonClass="button" ShowDisabledButtons="true">
            </webdiyer:AspNetPager>
            <td>Total<%= AspNetPager1.PageCount%>page </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">&nbsp; </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  <div runat="server" id="div_a">
  </div>
  </form>
</body>
</html>
<script type="text/javascript">
  function openBg(state) { //遮照打开关闭控制
    if (state == 1) {
      document.getElementById("bg").style.display = "block";
      var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
      h = h > document.body.scrollHeight ? h : document.body.scrollHeight;
      document.getElementById("bg").style.height = h + "px";
    }
    else {
      document.getElementById("bg").style.display = "none";
    }
  }
  function showdiv(id) {
    $("#show").show();
    document.getElementById("show").style.left = (document.getElementById("bg").offsetWidth - document.getElementById("show").offsetWidth) / 2 + "px";
    document.getElementById("show").style.top = 150 + "px";
  }
  function hidediv() {
    $("#show").hide();
    $("#bg").hide();
  }
  function checkshuzi(id) {
    //定义正则表达式部分
    var str = $("#" + id).val();
    var reg = /^\d+$/;
    if (str.constructor === String) {
      var re = value.match(reg);
      return true;
    }
    return false;
  }
</script>
<script src="js/validate.js" type="text/javascript"></script>
<script type="text/javascript">
  function checkVal() {
    var titleField = $("#ipt_subtitle");
    var emailField = $("#ipt_email");
    var textField = $("#txt_content");
    if (FieldValidation.validate(titleField, emailField, textField)) {
      return true;
    }
    else {
      return false;
    }
  }
</script>
<script type="text/javascript">
  function s() {
    window.location = "faq.aspx?type=search&pagekey=" + escape(document.getElementById("pagekeyword").value)
  }                                               
</script>
