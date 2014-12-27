<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appUserInfo.aspx.cs" Inherits="appUserInfo" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>我的商标订单_服务中心_商标系统_环球汇通</title>
  <meta name="Keywords" content="环球汇通" />
  <meta name="Description" content="环球汇通知识产权代缴年费电子商务平台" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script src="js/jtrademark.js" type="text/javascript"></script>
  <script src="jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <link href="jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <style type="text/css">
    .aspnetpager a { display: block; float: left; padding: 2px 10px; background: #fff; text-align: center; line-height: 20px; border: 1px solid #ccc; color: #0065DB; margin: 0 3px; }
    .aspnetpager a:hover { border: 1px solid #FF5500; color: #FF5500; background: #FFEEE6; text-decoration: none; }
    .aspnetpager td .pagetext { width: 35px; height: 23px; background: #fff; text-align: center; line-height: 23px; border: 1px solid #ccc; }
    .aspnetpager td .submitbutton { width: 39px; height: 23px; background: url(images/fenbar.jpg); color: #fff; line-height: 23px; text-align: center; border: none; margin-left: 5px; }
  </style>
  <link href="css/trademark.css" rel="stylesheet" type="text/css" />
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
                  <td width="38" height="28">&nbsp;</td>
                  <td width="701">&nbsp;</td>
                </tr>
                <tr>
                  <td height="19">&nbsp;</td>
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;商标系统&nbsp;>>&nbsp;帐户中心&nbsp;&gt;&gt;&nbsp;常用申请人</td>
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
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">常用申请人</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left">
                              <table><tr><td width="100">
                               <div class="carLeft">
                                          <script type="text/javascript">
                                              $(function () {
                                                  makeInit();
                                                  makeIndex();
                                                  dropDown();
                                                  $('.dropDown dd').hover( //下拉框操作
				                            function () { $(this).addClass('on'); },
				                            function () { $(this).removeClass('on'); }
			                            ).click(function () {
			                                var text = $(this).html();
			                                var val = $(this).attr('val');
			                                $(this).parent().hide();
			                                $(this).parent().parent().find('.drop').val(text);
			                                // $(this).parent().parent().find("input[type='hidden']").val(val);
			                                $("#HiddenApplyType").val(val);
			                                $("#btnQuery").click();
			                            });
                                                  $(document).click(function (event) { $('.dropDown dl').hide(); });  //点击空白处或者自身隐藏下拉层
                                              });
                                              function makeInit() {
                                                      $("#applytypeName").val($("#applytypedl dd[val='" + $("#HiddenApplyType").val() + "']").html());
                                              }
                                              function makeIndex() { //JQUERY修复IE的z-index样式(重要)
                                                  var zIndexNumber = 200;
                                                  $('.carLeft .sFrom li').each(function () {
                                                      $(this).css('zIndex', zIndexNumber);
                                                      zIndexNumber -= 5;
                                                  });
                                              }
                                              function dropDown() { //下拉
                                                  $('.dropDown .drop').click(function (event) { //下拉框下拉
                                                      event.stopPropagation(); //取消事件冒泡
                                                      $('.dropDown dl').hide();
                                                      $(this).next('dl').show();
                                                  });
                                              }
                            </script>
                            <div class="box search">
	                            <div class="content">
		                            <ul class="sFrom clearfix">
				                            <li style="z-index: 200;">
					                            <label><strong>申请人类别：</strong> </label>
					                            <div class="dropDown">
						                            <input type="hidden" name="ct_1" value="0" id="ct_1">
						                            <input type="text" id="applytypeName" class="inputText drop" readonly="readonly" value="不限">
						                            <dl class="clearfix" id="applytypedl" style="display: none;">
							                            <dd val="-1">不限</dd>
							                            <dd val="0">企业单位</dd>
							                            <dd val="1">自然人</dd>
						                            </dl>
					                            </div>
				                            </li>
                                            <asp:Button ID="btnQuery" runat="server" Text="查询"  ClientIDMode="Static" style="display:none"  onclick="btnQuery_Click"/>
			                                <asp:TextBox ID="HiddenApplyType" runat="server" ClientIDMode="Static" style="display:none">-1</asp:TextBox>
			                            </ul>
	                            </div>
                            </div>
                     
 
			                 </div>
                             </td><td><a href="appUserInfoAdd.aspx?flag=0" class="BtnShowhref">添加企业单位联系人</a> 
                           </td>
                             <td> <a href="appUserInfoAdd.aspx?flag=1" class="BtnShowhref">添加自然人联系人  </a></td></tr></table>
                            
                         </td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                             <td width="58" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">序号</td>
                              <td width="78" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">申请人类型</td>
                              <td width="108" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">申请人名称</td>
                              <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">电话</td>
                              <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">邮箱</td>
                              <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                  地区</td>
                               <td width="60" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">操作</td>
                            </tr>
                            <asp:Repeater ID="rp_orderlist" runat="server" >
                              <ItemTemplate>
                                <asp:HiddenField ID="hf_oid" runat="server" Value='<%# Eval("i_Id") %>' />
                                <tr>
                                  <td height="32" align="center" bgcolor="#FFFFFF">
                                     <%# Container.ItemIndex + 1%></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                       <%# Eval("ApplyType").ToString()=="0" ? "企业单位":"自然人" %>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                     <a href="appUserInfoDetail.aspx?u_a_id=<%# Eval("i_Id") %>&ApplyType=<%# Eval("ApplyType")%>" class="ac5t"> <%# Eval("ApplyName")%></a>
                                   </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("PhoneNo")%> </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("Email")%></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%#GetProvinceName(Eval("provinceID"))%></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                  <a  href="javascript:void(0)" id="linkDel<%# Eval("i_Id")%>" class="ac5t"  onclick="showDelDailog(<%# Eval("i_Id")%>)">删除</a>
                                  </td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="right" class="font12b4e">
                          <table class="aspnetpager" cellspacing="5">
                            <tr>
                              <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页" NextPageText="下一页" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="共 %PageCount% 页 " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="确定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" 页" TextBeforeInputBox="跳转到 ">
                              </webdiyer:AspNetPager>
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
