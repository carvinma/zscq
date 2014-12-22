<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademark_query.aspx.cs" Inherits="trademark_query" %>

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
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
   <script src="js/tooltips.js" type="text/javascript"></script>
   <script src="js/jtrademark.js" type="text/javascript"></script>
   <script type="text/javascript">
       $(function () {
           InitProCityArea();
       $('input[type=radio][name="Quick0"]').change(function () {
           var applyType = $('input:radio[name="Quick0"]:checked').val();
           $("#hi_CaseType").val(applyType);
           $.ajax({
               type: "POST",
               url: "Handler.ashx",
               contentType: "application/x-www-form-urlencoded; charset=utf-8",
               data: "flag=trademarkstatusddl&casetype="+applyType,
               success: function (data) {
                   $("#ddlStatus0").html(data);
               }
           });
       });

       $('input[type=radio][name="Quick"]').change(function () {
           var applyType = $('input:radio[name="Quick"]:checked').val();
           $("#hi_CaseType").val(applyType);
           $.ajax({
               type: "POST",
               url: "Handler.ashx",
               contentType: "application/x-www-form-urlencoded; charset=utf-8",
               data: "flag=trademarkstatusddl&casetype="+applyType,
               success: function (data) {
                   $("#ddlStatus").html(data);
               }
           });
       });
    });
       function checkCaseType() {
           if ($("#hi_CaseType").val() == null || $("#hi_CaseType").val() == "") {
               alert('请选择案件分类');
               return false;
           }
           return true;
       }
   </script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <input id="hi_CaseType" runat="server" type="hidden" />
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
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;商标信息检索</td>
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
                              <td width="642" align="left" class="font14d4">快速检索</td>
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
                              <td width="238" height="32" align="right"><strong>案件分类：</strong></td>
                              <td width="433" align="left">
                                <input id="RdoPeople" type="radio" name="Quick0" value="0" runat="server" />申请
                                   <input id="Radio1" type="radio" name="Quick0" value="1" runat="server" />续展
                                </td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>案件号：</strong></td>
                              <td align="left">
                                <input type="text" name="s5" id="txt_CaseNo0" class="font12000" maxlength="50" 
                                      runat="server" /></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>商品大类别：</strong></td>
                              <td align="left">
                                <input type="text" name="s3" id="txt_TrademarkType0" class="font12000" 
                                      maxlength="50" runat="server" /></td>
                            </tr>
                            <tr>
                              <td height="32" align="right">
                                  <strong>申请人名称：</strong></td>
                              <td align="left">
                                      <input type="text" name="s19" id="txt_applyName0" class="font12000" maxlength="50" 
                                            runat="server" size="20" /></td>
                            </tr>
                            <tr>
                              <td height="32" align="right"><strong>最近状态：</strong></td>
                              <td align="left">
                                  <asp:DropDownList ID="ddlStatus0" runat="server">
                                  </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                              <td height="32" align="right">&nbsp;</td>
                              <td align="left" valign="top">
                                <table width="415" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="8" height="35"></td>
                                    <td width="95" align="left">
                                      <asp:Button ID="bt_kuaijiansuo" OnClientClick="return checkCaseType();" runat="server" Text="" Style="background: url(images/user_js_b1.gif); width: 85px; height: 29px; border: 0" OnClick="bt_kuaijiansuo_Click" />
                                    </td>
                                    <td width="108" align="left">
                                        <%--<input id="Reset2" type="reset" value="" style="border: 0; cursor: pointer; background: url(images/user_js_b2.gif); width: 86px; height: 27px;" />--%>
                                    </td>
                                    <td width="204" align="left"><img src="images/user_js_b3.gif" width="91" height="27" border="0" style="cursor: hand" onclick="onclickt1();" /></td>
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
                    <table width="671" border="0" cellspacing="0" cellpadding="0" id="table_search2">
                      <tr>
                        <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);">
                          <table width="671" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="6" colspan="2"></td>
                            </tr>
                            <tr>
                              <td width="29" height="20">&nbsp;</td>
                              <td width="642" align="left" class="font14d4">高级检索</td>
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
                                    <td width="98" align="center" class="font12bt">基本信息</td>
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
                                    <td width="225" height="32" align="right"><strong>案件分类：<br />
                                    </strong></td>
                                    <td width="415" align="left">
                                           <input id="Radio2" type="radio" name="Quick" value="0" runat="server" />申请
                                   <input id="Radio3" type="radio" name="Quick" value="1" runat="server" />续展
                                      </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>案件号：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s5" id="txt_CaseNo" class="font12000" maxlength="50" 
                                            runat="server" /></td>
                                  </tr>
                                  <tr>
                                    <td align="right" class="style1"><strong>商品大类别：</strong></td>
                                    <td align="left" class="style1">
                                      <input type="text" name="s5" id="txt_TrademarkType" class="font12000" 
                                            maxlength="50" runat="server" /></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>申请人名称：</strong></td>
                                    <td align="left">
                                      <input type="text" name="s11" id="txt_applyName" class="font12000" maxlength="50" 
                                            runat="server" size="20" /></td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>最近状态：</strong></td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlStatus" runat="server">
                                        </asp:DropDownList>
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
                                    <td width="98" align="center" class="font12bt">其它信息</td>
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
                                    <td width="260" height="32" align="right" valign="middle"><strong>会员编号：</strong></td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_memberNo" class="font12000" 
                                            maxlength="50"   onkeyup="value=value.replace(/[^\w]/ig,'')" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>会员名称：</strong></td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_memberName" class="font12000" 
                                            maxlength="20" />
                                    </td>
                                  </tr>
                                
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>行政区划：</strong></td>
                                    <td width="429" valign="middle">
                                       <select id="live_prov" name="live_prov" onchange="SelCity(this.value);">
                                  <option value="">请选择：</option></select>
                                  <select id="live_city" name="live_city" onchange="SelArea(this.value);">
                                  <option value="">请选择：</option></select>
                                  <select id="live_country" name="live_country" onchange="SetAddress(this.value)">
                                  <option value="">请选择：</option></select>&nbsp;
                                   <span class="status error" id="area_div_error"></span>
                                    <input type="hidden" runat="server" id="Hi_prov" clientidmode="Static"  />
                                    <input type="hidden" runat="server" id="Hi_city" clientidmode="Static" />
                                    <input type="hidden" runat="server" id="Hi_country" clientidmode="Static" /></td>
                                  </tr>
                                    <tr>
                                    <td width="260" align="right" valign="middle" class="style1"><strong>地址：</strong></td>
                                    <td width="429" valign="middle" class="style1">                                
                                        <textarea cols="20" rows="2" type="text" name="s6" id="txt_address" style="width: 300px;height:40px;"  class="font12000" maxlength="250" runat="server" ></textarea>
                                    </td>
                                  </tr>
                                    <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>联系人：</strong></td>
                                    <td width="429" valign="middle">                                
                                      <input type="text" runat="server" id="txt_contactPerson" class="font12000" 
                                            maxlength="50"   onkeyup="value=value.replace(/[^\w]/ig,'')" /></td>
                                  </tr>
                                    <tr>
                                    <td width="260" align="right" valign="middle" class="style1">
                                      <strong>联系电话：</strong></td>
                                    <td width="429" valign="middle" class="style1">                                
                                      <input type="text" runat="server" id="txt_phone" class="font12000" 
                                            maxlength="50"   onkeyup="value=value.replace(/[^\w]/ig,'')" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>申请号：</strong></td>
                                    <td align="left" valign="middle">
                                      <input type="text" runat="server" id="txt_regNo" class="font12000" 
                                            maxlength="50"   onkeyup="value=value.replace(/[^\w]/ig,'')" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>商标说明：</strong></td>
                                    <td align="left" valign="middle">                                
                                        <textarea cols="20" rows="2" type="text" name="s18" id="txt_remark" 
                                            style="width: 300px;height:40px;"  class="font12000" maxlength="250" 
                                            runat="server" ></textarea></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>是否三维商标：</strong></td>
                                    <td align="left" valign="middle">
                                        <asp:DropDownList ID="ddl3D" runat="server">
                                            <asp:ListItem Value="-1">全部</asp:ListItem>
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                        </asp:DropDownList>
                                      </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                        <strong>是否颜色组合商标：</strong></td>
                                    <td align="left" valign="middle">
                                        <asp:DropDownList ID="ddlColor" runat="server">
                                            <asp:ListItem Value="-1">全部</asp:ListItem>
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                        </asp:DropDownList>
                                      </td>
                                  </tr>
                                  <tr>
                                    <td width="260" align="right" valign="middle" class="style1">
                                       <strong>是否声音商标：</strong></td>
                                    <td align="left" valign="middle" class="style1">
                                        <asp:DropDownList ID="ddlSound" runat="server">
                                            <asp:ListItem Value="-1">全部</asp:ListItem>
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                        </asp:DropDownList>
                                      </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>商标申请日：</strong></td>
                                    <td align="left" valign="middle">
                                      <input type="text" name="s10" runat="server" id="txt_applydate" class="font12000" maxlength="30" 
                                      
                                            style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" 
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                        <strong>初审公告日：</strong></td>
                                    <td align="left" valign="middle">
                                      <input type="text" name="s12" runat="server" id="txt_publicdate" 
                                            class="font12000" maxlength="30" 
                                      
                                            style="background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" 
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>注册公告日：</strong></td>
                                    <td align="left" valign="middle">
                                        &nbsp; 从<input type="text" name="s13" runat="server" id="txt_regDateBegin" 
                                            class="font12000" maxlength="30" 
                                      
                                            style="width:130px; background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" 
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />到<input type="text" 
                                            name="s15" runat="server" id="txt_regDateEnd" 
                                            class="font12000" maxlength="30" 
                                      
                                            style="width:130px; background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" 
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                        <strong>续展期限日：</strong></td>
                                    <td align="left" valign="middle">
                                        &nbsp; 从<input type="text" name="s17" runat="server" id="txt_renewalDateBegin" 
                                            class="font12000" maxlength="30" 
                                      
                                            style="width:130px; background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" 
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />到<input type="text" 
                                            name="s16" runat="server" id="txt_renewalDateEnd" 
                                            class="font12000" maxlength="30" 
                                      
                                            style="width:130px; background-image: url(images/user_js_date.gif); background-repeat: no-repeat; background-position: right;" 
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                        <strong>所剩天数：</strong></td>
                                    <td align="left" valign="middle">
                                      <input type="text" runat="server" id="txt_restDays" class="font12000" 
                                            maxlength="50"   onkeyup="value=value.replace(/[^\w]/ig,'')" /></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">
                                       <strong>商标状态：</strong></td>
                                    <td align="left" valign="middle">
                                        <asp:DropDownList ID="ddlAdminStatus" runat="server">
                                        </asp:DropDownList>
                                      </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                         
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
                                      <asp:Button ID="Button2" OnClientClick="return checkCaseType();" runat="server" Text="" Style="background: url(images/user_js_b1.gif); width: 85px; height: 29px; border: 0" OnClick="bt_jiansuoAll_Click" />
                                    </td>
                                    <td width="108" align="left">
                                    </td>
                                    <td width="204" align="left"><img src="images/user_js_b4.gif" width="91" height="27" border="0" style="cursor: hand" onclick="onclickt2()"/></td>
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
