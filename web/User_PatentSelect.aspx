<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentSelect.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc2" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>专利信息检索_我的专利_服务中心_会员中心_专利系统_环球汇通</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
</head>
<body id="index">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <uc1:zscqtop2 ID="zscqtop21" runat="server" />
    <uc2:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
      <tr>
        <td height="3"></td>
      </tr>
    </table>
    <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;background-color: #fff;">
      <tr>
        <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <!--专利左侧START-->
         <uc3:patentleft ID="patentleft1" runat="server" />
        <!--专利左侧END-->
        </td>
        <td align="left" valign="top"><table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);"><table width="739" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="38" height="28">&nbsp;</td>
                <td width="701">&nbsp;</td>
              </tr>
              <tr>
                <td height="19">&nbsp;</td>
                <td align="left">
                首页 >> 专利系统 >> 会员中心 >> 服务中心 >> 我的专利 >> 专利信息检索
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="639" valign="top"><table width="716" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="28">&nbsp;</td>
            <td width="691">&nbsp;</td>
          </tr>
          <tr id="table_search1">
            <td height="123">&nbsp;</td>
            <td align="left" valign="top">
            <table width="671" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);"><table width="671" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="6" colspan="2"></td>
                  </tr>
                  <tr>
                    <td width="29" height="20">&nbsp;</td>
                    <td width="642" align="left" class="font14d4">快速检索</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26" align="left"></td>
              </tr>
              <tr>
                <td height="115" align="left" valign="top"><table width="671" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="238" height="32" align="right"><strong>专利号：</strong></td>
                    <td width="433" align="left">
                    <input type="text" name="s1" id="txt_zlh" runat="server" class="font12000 tooltip" tips="<p>中国专利号格式：9-13位数字（例：200812345678.9）</p><p>其他国家格式不限</p>" maxlength="20"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_zlh" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>专利名称：</strong></td>
                    <td align="left">
                    <input type="text" name="s2" id="txt_zlmc" runat="server" class="font12000 tooltip" tips="200个字符以内" maxlength="200" />
                    </td>
                  </tr>
                  <tr>
                    <td height="32" align="right"><strong>专利权人：</strong></td>
                    <td align="left">
                    <input type="text" name="s3" id="txt_zlqr" runat="server" class="font12000 tooltip" tips="100个字符以内" maxlength="100" />
                    </td>
                  </tr>
<%--                  <tr>
                    <td height="32" align="right"><strong>案卷号：</strong></td>
                    <td align="left">
                    <input type="text" name="s4" id="txt_ajh" runat="server" class="font12000" maxlength="20" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="b" ControlToValidate="txt_ajh" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                    </td>
                  </tr>--%>
                  <tr>
                    <td height="32" align="right">&nbsp;</td>
                    <td align="left" valign="top"><table width="415" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8" height="35"></td>
                        <td width="95" align="left">
                            <asp:ImageButton ID="ImgBtn_Search1" runat="server" ValidationGroup="b"
                                ImageUrl="~/images/user_js_b1.gif" onclick="ImgBtn_Search1_Click" />
                        </td>
                        <td width="108" align="left">
                            <input id="Reset1" type="reset" value="" style=" width:86px; height:27px; background-image:url(images/user_js_b2.gif); border:0px;" />
                        </td>
                        <td width="204" align="left">
                        <img src="images/user_js_b3.gif" onclick="onclickt2()" width="91" height="27" border="0" style="cursor:hand"/>
                        </td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
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
            <table width="671" border="0" cellspacing="0" cellpadding="0" id="table_search2" style="display:none">
              <tr>
                  <td height="26" align="left" valign="top" style="background-image: url(images/user_js_bg.gif);"><table width="671" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="6" colspan="2"></td>
                    </tr>
                    <tr>
                      <td width="29" height="20">&nbsp;</td>
                      <td width="642" align="left" class="font14d4">高级检索</td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="26" align="left"></td>
                </tr>
                <tr>
                  <td height="115" align="center" valign="top">
                  <table width="630" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10" height="20">&nbsp;</td>
                          <td width="98" align="center" class="font12bt">基本信息</td>
                          <td width="6"></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="18" align="left"></td>
                    </tr>
                    <tr>
                      <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="221" height="32" align="right"><strong>系统序号：<br />
                          </strong></td>
                          <td width="415" align="left">
                          <input type="text" name="s6" runat="server" id="txt_XiTongNum" class="font12000 tooltip" tips="只能输入数字" maxlength="6" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_XiTongNum" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,6}">
                </asp:RegularExpressionValidator>    
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>专利号：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Number" class="font12000 tooltip" tips="<p>中国专利号格式：9-13位数字（例：200812345678.9）</p><p>其他国家格式不限</p>" maxlength="20" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_Number" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\s\S]{1,18}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>专利名称：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_Name" class="font12000 tooltip" tips="200个字符以内" maxlength="200" />
                          </td>
                        </tr>

                        <tr>
                          <td height="32" align="right"><strong>专利授权国：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always"> 
                            <ContentTemplate>
                                <asp:DropDownList ID="Drp_AuthorizeNationalityId" runat="server" class="font12000_t" onselectedindexchanged="Drp_AuthorizeNationalityId_SelectedIndexChanged" AutoPostBack="true" >
                                </asp:DropDownList>  
                            </ContentTemplate>
                            </asp:UpdatePanel>
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>专利类型：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always"> 
                                <ContentTemplate>
                                <asp:DropDownList ID="Drp_PatentType" runat="server" class="font12000_t">
                                </asp:DropDownList>  
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>权利要求项：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_yaoqiuxiang" class="font12000 tooltip" tips="只能输入数字" maxlength="4" />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_yaoqiuxiang" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-5]{1,5}">
                </asp:RegularExpressionValidator>     
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>专利权人：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentHolder" class="font12000 tooltip" tips="100个字符以内" maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>专利权人国籍：</strong></td>
                          <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PatentHolderNationalityId" runat="server" class="font12000_t">
                                </asp:DropDownList>  
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>发明人：</strong></td>
                          <td align="left">
                          <input type="text" name="s6" runat="server" id="txt_PatentInventor" class="font12000 tooltip" tips="100个字符以内"  maxlength="100" />
                          </td>
                        </tr>
                        <tr>
                        <td width="221" height="32" align="right"><strong>专利申请日：</strong></td>
                        <td width="409" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsNationalityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                        <td width="221" height="32" align="right"><strong>专利授权日：</strong></td>
                        <td width="409" align="left">
                        <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AuthorizeIsAuthorizeDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                        </tr>
                        <tr>
                          <td height="32" align="right"><strong>专利于该授权国的年费缴纳状态：</strong></td>
                          <td align="left">
                              <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_AnnualFeeStatus" runat="server" class="font_auto">
                                <asp:ListItem Value="0">请选择</asp:ListItem>
                                <asp:ListItem Value="1">已完成缴费，等待下次缴费（>90天)</asp:ListItem>
                                <asp:ListItem Value="2">距缴费日期<90天，尚未提交订单</asp:ListItem>
                                <asp:ListItem Value="3">距缴费日期<60天，尚未提交订单</asp:ListItem>
                                <asp:ListItem Value="4">距缴费日期<30天，尚未提交订单</asp:ListItem>
                                <asp:ListItem Value="5">距缴费日期<15天，尚未提交订单 </asp:ListItem>
                                <asp:ListItem Value="6">距缴费日期<0天，尚未提交订单</asp:ListItem>
                                <asp:ListItem Value="7">已提交委托订单，尚未接收汇款</asp:ListItem>
                                <asp:ListItem Value="8">已提交委托订单，缴费中</asp:ListItem>
                                <asp:ListItem Value="9">经确认，放弃续费</asp:ListItem>
                                <asp:ListItem Value="10">联系不到缴费人，视为放弃缴费</asp:ListItem>
                                <asp:ListItem Value="11">缴费人无答复，视为放弃缴费</asp:ListItem>
                                <asp:ListItem Value="12">同日申请专利，自动失效</asp:ListItem>
                                <asp:ListItem Value="13">已完成所有年度缴费</asp:ListItem>
                                </asp:DropDownList>
                              </span>
                          </td>
                        </tr>
                        
                        </table></td>
                    </tr>
                    <tr>
                      <td height="30" align="left">&nbsp;</td>
                    </tr>
                  </table>
                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">优先权信息</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="221" height="32" align="right"><strong>优先权申请号：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s7" runat="server" id="txt_PriorityNumber" class="font12000 tooltip" tips="只能输入数字或字母" maxlength="50" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PriorityNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>优先权国：</strong></td>
                            <td align="left">
                            <span class="font12b4e user_zlbottomline">
                                <asp:DropDownList ID="Drp_PriorityNationalityId" runat="server" class="font12000_t">
                                <asp:ListItem Value="0">选择国家</asp:ListItem>
                                </asp:DropDownList>  
                            </span>
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>优先权申请日：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_PriorityDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_PriorityDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">PCT信息</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="64" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="32" align="right"><strong>PCT申请号：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcNumber" class="font12000 tooltip" tips="只能输入数字或字母"  maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_PtcNumber" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>PCT申请日：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_PtcDate" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_PtcDate2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">缴费信息</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="221" height="32" align="right"><strong>缴费期限日：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/> -- <input type="text" name="s10" runat="server" id="txt_AnnualFeeNextYear2" class="font12000" maxlength="30" style="width:79px; background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            </td>
                          </tr>
                          <tr>
                            <td width="221" height="32" align="right"><strong>距缴费期限所剩天数：</strong></td>
                            <td width="409" align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeRestDay" class="font12000" maxlength="5" /><%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_AnnualFeeRestDay" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[0-9]{1,5}">
                </asp:RegularExpressionValidator> --%>   
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>待缴年度：</strong></td>
                            <td align="left">
                            <input type="text" name="s10" runat="server" id="txt_AnnualFeeNotPaymentYear" class="font12000 tooltip" tips="10个字符以内" maxlength="10" />
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                  </table>
                  <table width="630" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server" visible="false">
                      <tr>
                        <td width="639" height="20" align="left" valign="top" style="border-bottom:1px solid #d34245;"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="10" height="20">&nbsp;</td>
                            <td width="98" align="center" class="font12bt">第三方信息</td>
                            <td width="6"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="18" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top"><table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="256" height="32" align="right"><strong>案卷号：<br />
                            </strong></td>
                            <td width="415" align="left">
                            <input type="text" name="s10" runat="server" id="txt_anjuanhao" class="font12000 tooltip" tips="只能输入数字或字母" maxlength="20" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="RegularExpressionValidator" ValidationGroup="a" ControlToValidate="txt_anjuanhao" Text="您输入的信息格式有误，请核实！" Display="Dynamic" SetFocusOnError="true" ValidationExpression="[\d\w]{1,18}">
                </asp:RegularExpressionValidator>    
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>联系人：</strong></td>
                            <td align="left">
                            <input type="text" name="s8" runat="server" id="txt_linkman" class="font12000 tooltip" tips="20个字符以内" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>地址：</strong></td>
                            <td align="left">
                            <textarea id="txt_address" runat="server" class="font12000" style="height:50px"></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right"><strong>电话：</strong></td>
                            <td align="left">
                            <input type="text" name="s11" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                            </td>
                          </tr>
                          <tr>
                            <td align="right">&nbsp;</td>
                            <td align="left" valign="top">
                            <table width="389" border="0" cellspacing="0" cellpadding="0"></table>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                  </table>
                  <table width="630" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
                        <table width="630" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="256" height="9" align="right"></td>
                            <td width="415" align="left"> 
                            </td>
                          </tr>
                          <tr>
                            <td height="32" align="right">&nbsp;</td>
                            <td align="left" valign="top">
                             <table width="389" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="8" height="35"></td>
                                <td width="95" align="left">
                                <asp:ImageButton ID="ImgBtn_Search2" runat="server"  ValidationGroup="a"
                                ImageUrl="~/images/user_js_b1.gif" onclick="ImgBtn_Search2_Click" />
                                </td>
                                <td width="108" align="left">
                                <input id="Reset2" type="reset" value="" style=" width:86px; height:27px; background-image:url(images/user_js_b2.gif); border:0px;" />
                                </td>
                                <td width="178" align="left">
                                <img src="images/user_js_b4.gif" width="91" height="27" border="0" onclick="onclickt1()"/>
                                </td>
                              </tr>
                            </table>
                            </td>
                          </tr>
                        </table></td>
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
        </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    <uc4:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
</body>
</html>
<script type="text/javascript">
    function onclickt1() {
        document.getElementById("table_search1").style.display = "";
        document.getElementById("table_search2").style.display = "none";
    }
    function onclickt2() {
        document.getElementById("table_search1").style.display = "none";
        document.getElementById("table_search2").style.display = "";
    }
</script>