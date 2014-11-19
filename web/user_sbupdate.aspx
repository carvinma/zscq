<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbupdate.aspx.cs" Inherits="user_sbupdate" %>
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
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script src="js/tooltips.js" type="text/javascript"></script>
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
       <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
  <input id="hi_guoji" type="hidden" runat="server" value="0"/>
      <input id="hi_sbid" type="hidden" runat="server" value="0"/>
     <input id="hi_usertype" type="hidden" runat="server"/>
     <input id="hi_zhitifiles" type="hidden" runat="server" />
       <input type="hidden" id="Hi_MemberId" runat="server" value="" />
   <uc4:zscqtop2 ID="zscqtop21" runat="server" />

<uc3:zscqadv ID="zscqadv1" TypeId="54" runat="server" />

<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;background-color: #fff;">
  <tr>
    <td width="260" height="618" align="left" valign="top"style="background-image: url(images/server2.gif);">
    
       <uc1:zscq_sb_leftmenu ID="zscq_sb_leftmenu1" runat="server" /></td>
    <td align="left" valign="top"><table width="741" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);"><table width="739" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38" height="28">&nbsp;</td>
            <td width="701">&nbsp;</td>
          </tr>
          <tr>
            <td height="19">&nbsp;</td>
            <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;更新商标信息</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="639" valign="top"><table width="716" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="28">&nbsp;</td>
            <td width="691">&nbsp;</td>
          </tr>
          <tr>
            <td height="123">&nbsp;</td>
            <td width="691" align="left" valign="top"><table width="671" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="115" align="center" valign="top"><table width="689" border="0" cellspacing="0" cellpadding="0">
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
                    <td height="115" align="left" valign="top"><table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="260" height="32" align="right"><strong>商标注册号：</strong></td>
                        <td align="left">  <input type="text" name="s5" id="sb_num" class="font12000 tooltip" maxlength="20"  tips="只能输入字母和数字 例如：E35123535" onkeyup="value=value.replace(/[^\w]/ig,'')" runat="server" onblur="CheckUserSbregnum('1');"/><span id="sb_num1" style="color: Red;">*</span></td>
                        </tr>
                      <tr>
                        <td height="32" align="right"><strong>类型：</strong></td>
                       <td align="left">
                                      <input type="text" name="s5" id="Sb_type" class="font12000" maxlength="20" runat="server" onblur="checkOk('Sb_type');" /><span style="color: Red;" id="Sb_type1">*</span></td>
                        </tr>
                      <tr>
                        <td height="32" align="right"><strong>注册人名称：</strong></td>
                        <td align="left">
                                      <input type="text" name="s6" id="Sb_Regname" onblur="checkOk('Sb_Regname');Checksbzhenshu(1);" class="font12000" maxlength="50" runat="server" /><span style="color: Red;" id="Sb_Regname1">*</span></td>
                        </tr>
                        <%if (guoji == 0 && usertype == 3)
                          { %>
                         <tr>
                        <td height="32" align="right"><strong>注册人英文名称：</strong></td>
                       <td align="left">
                                      <input type="text" name="s6" id="Sb_RegnameEn" onblur="checkOk('Sb_RegnameEn');" class="font12000 tooltip" tips="只能输入英文" maxlength="20" runat="server" onkeyup="value=value.replace(/[^a-zA-Z ]/g,'')"  /><span style="color: Red;" id="Sb_RegnameEn1">*</span><span ></span></td>
                                  </tr>
                        <%} %>
                          <tr>
                        <td height="32" align="right"><strong>注册人邮编：</strong></td>
                         <td align="left">
                                      <input type="text" name="s6" id="Sb_Reg_youbian" onblur="checkOk('Sb_Reg_youbian');"  class="font12000 tooltip" maxlength="10" tips="只能输入数字" runat="server" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/><span style="color: Red;" id="Sb_Reg_youbian1">*</span><span ></span></td>
                                  </tr>

                          <%--<tr>
                    <td align="right"><strong>所在地区：</strong></td>
                    <td>
                 
                 
                            <asp:DropDownList ID="Drp_GuoJi" runat="server" >
                            </asp:DropDownList> <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                <asp:ListItem Value="0">请选择省</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                <asp:ListItem Value="0">请选择市/区</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList4" runat="server">
                                <asp:ListItem Value="0">请选择区/县</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </td>
                </tr>--%>


                         <tr>
                        <td height="32" align="right"><strong>注册人地址：</strong></td>
                          <td align="left">
                                      <textarea cols="20" rows="2" type="text" name="s6" id="Sb_Reg_Address" style="width: 300px;height:40px;"  onblur="checkOk('Sb_Reg_Address');" class="font12000" maxlength="250" runat="server" ></textarea><span style="color: Red;" id="Sb_Reg_Address1">*</span><span ></span></td>
                        </tr>
                         
                              <%if (guoji == 0 && usertype == 3)
                            { %>
 <tr>
                        <td height="32" align="right"><strong>注册人英文地址：</strong></td>
                      <td align="left">
                                      <textarea rows="2" name="s6" id="Sb_Reg_AddressEn"  onblur="checkOk('Sb_Reg_AddressEn');" onkeyup="value=value.replace(/[^a-zA-Z ]/g,'')" style="width: 300px;height:40px;" class="font12000" maxlength="150" runat="server"></textarea><span style="color: Red;" id="Sb_Reg_AddressEn1">*</span><span ></span></td>
                        </tr>
                <%} %>
                      <tr>
                        <td height="32" align="right"><strong>商标申请日：</strong></td>
                        <td align="left">        <input type="text" name="s6" runat="server" id="Sb_passTime" onblur="checkOk('Sb_passTime');"  class="font12000" maxlength="50" style="background-image:url(images/user_js_date.gif); background-repeat:no-repeat; background-position:right;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});daoqidate();"/><span style="color: Red;" id="Sb_passTime1">*</span><span ></span></td>
                        </tr>
                         <tr>
                        <td height="32" align="right"><strong>商标到期时间：</strong></td>
                        <td align="left">        <input id="t_daoqi" type="text" class="font12000"   runat="server" readonly="readonly"/></td>
                        </tr>   <tr>
                    <td height="32" align="right"><strong>商标描述类型：</strong></td>
                    <td>   
                      <asp:RadioButton ID="RadioButton1" runat="server" onclick="miaoshutype();" GroupName="aa"/>文字商标 &nbsp;<asp:RadioButton ID="RadioButton2"
                            runat="server" GroupName="aa" onclick="miaoshutype();" />图形商标&nbsp;<asp:RadioButton ID="RadioButton3" runat="server" GroupName="aa" onclick="miaoshutype();" />文字与图形商标                  
                    
                  <%--    <input name="radio" type="radio" id="radio1" value="1" checked="true" onclick="miaoshutype();" runat="server" /> 文字商标
                     <input name="radio" type="radio" id="radio2" value="2"  onclick="miaoshutype();" runat="server" /> 图形商标
                      <input name="radio" type="radio" id="radio3" value="3"  onclick="miaoshutype();" runat="server" /> 文字与图形商标    --%>                  
                    </td>
                </tr>
                    <tr id="sbmiaoshu">
                                    <td height="32" align="right"><strong>商标描述：</strong></td>
                                    <td align="left">

                                      <input type="text" name="s6" id="Sb_miaosu" class="font12000" maxlength="50" runat="server" onblur="checkOk('Sb_miaosu');"  style="width:300px;"/>
                                       </td>
                                  </tr>
                      </table></td>
                    </tr>
                   
                  <tr>
                    <td height="30" align="left">&nbsp;</td>
                    </tr>
                  </table>
          
                  <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">缴费信息</td>
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
                                  <% if (int.Parse(JiaoFeiType)== 2)
                                     { %>
                                     <tr id="dailifei">                                   
                                    <td width="260" height="32" align="right" >官网商标费用：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=Str_Moneysb%>                                    
                                    </span></td>                                  
                                    </tr>
                                     <tr>
                                    <td width="260" height="32" align="right" >商标代理费用：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=sbdailiweituo%>                                    
                                    </span></td>                                  
                                    </tr>
                                    <%if (iszhinajin == 1)
                                      { %>
                                      <tr>
                                    <td width="260" height="32" align="right" >商标滞纳金费用：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                 CNY&nbsp;<%=Str_Zhinajin%>                                    
                                    </span></td>                                  
                                    </tr>
                                    <%} %> 
                                    <tr >
                                    <td width="260" align="right" height="32">总计：</td><td><span class="font12b4e user_zlbottomline" style="color:Red;">
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
                                    <td width="260" align="right" height="32">国外费用总计：</td><td><span class="font12b4e user_zlbottomline" style="color:Red;">
                                     <%=bizhong %>&nbsp;<%=zongjimeiweituo%>                                    
                                    </span></td>                                    
                                    </tr>                                     
                                    <%} %>     
                                    <%} %> 
                                    
                                        <%-- <tr>
                                    <td height="32" align="right">币种：</td>
                                    <td width="429" align="left"><span class="font12b4e user_zlbottomline" style="color:Red;">
                                      <%=bizhong %>
                                    </span></td>
                                  </tr>               --%>            
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
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
                                    <td width="98" align="center" class="font12bt">第三方信息</td>
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
                                    <td width="260" height="32" align="right" valign="middle"><strong>案卷号</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="t_anjuanhao" class="font12000" maxlength="50"  onblur="checkanjuanhao();" onkeyup="value=value.replace(/[^\w]/ig,'')"/></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>联系人</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_linkman" class="font12000" maxlength="20" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>地址</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_address" class="font12000" maxlength="200" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>电话</strong>：</td>
                                    <td width="429" valign="middle">
                                      <input type="text" runat="server" id="txt_phone" class="font12000" maxlength="20" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">&nbsp;</td>
                                    <td align="left" valign="middle">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle">&nbsp;</td>
                                    <td align="left" valign="middle">
                                     
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
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="98" align="center" class="font12bt">文件上传</td>
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
                                    <%if (usertype==3)
                                         {
                                    %>
                                    <tr>
                                    <td style="height:70px;width:260px;line-height:20px;" align="right" valign="top">
                               <strong> 主体资格证明文件：</strong>
                              </td>
                               <td style="line-height:20px;" valign="top"><%if (zhitiOk == 1)
                                    { %><span style="color:Red;"><%=zhutiwenjian%></span><br><%}%><asp:FileUpload ID="FileUpload3" runat="server"  Width="200px"/><br><span style="color:Red;">格式为.jpg.gif.png.PDF,不大于500K</span></td>  
                                  </tr>
                                    <%}%>
                                 
                                   <tr id="sbfile">
                                    <td style="height:70px;line-height:20px;" align="right" valign="top">
                               <strong> 商标注册证书复印件：</strong>
                              </td>
                               <td style="line-height:20px;" valign="top"><%if (sbfileok == 1)
                                    { %><span style="color:Red;"><%=Sbfile%></span><br><%}%><asp:FileUpload ID="FileUpload4" runat="server"  Width="200px"/><br><span style="color:Red;">格式为.jpg.gif.png.PDF,不大于500K</span></td>   
                                  </tr>
                                  
                                 <tr>
                                                                                    <td style="height:70px;width:260px;line-height:20px;" align="right" valign="top">
                                                                                        <strong>申请书：</strong>
                                                                                    </td>
                                                                                     <td style="line-height:20px;" valign="top"><%if (shenqingshu == 1)
                                    { %><span style="color:Red;"><%=shenqingfile%></span><br><%}%><asp:FileUpload ID="FileUpload1" runat="server"  Width="200px"/><br><span style="color:Red;">格式为.jpg.gif.png.PDF,不大于500K</span>
                                                                                    </td>
                                                                                </tr>
                                      <%if (int.Parse(JiaoFeiType) == 2 || usertype==3)
                                         {
                                            %>                                   
                                       
                                                                                <tr>
                                                                                    <td style="height: 70px;width:260px;line-height:20px;" align="right" valign="top">
                                                                                        <strong>委托书：</strong>
                                                                                    </td>
                                                                                    <td style="line-height:20px;" valign="top"><%if (weituoshu == 1)
                                    { %><span style="color:Red;"><%=weituofile%></span><br><%}%><asp:FileUpload ID="FileUpload2" runat="server" Width="200px" /><br><span style="color:Red;">格式为.jpg.gif.png.PDF,不大于500K</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <%}%>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                    <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="35" align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">    
                                  <tr>
                                    <td height="32" align="right">&nbsp;</td>
                                    <td align="left" valign="top">
                                      <table width="389" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="100" height="35" ></td>
                                          <td width="95" align="right">
                                            </td>
                                          <td width="108" align="left">
                                            <asp:Button ID="Button1" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_zl_b5.gif); width: 85px; height: 29px;" OnClick="Button1_Click" OnClientClick="return Checkadd();" /></td>
                                        
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
              </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table> <script type="text/javascript">
//        function ClientValidatePhone() {
//            var id = $("#Hi_MemberId").val();
//            var lname = $("#c_Phone").val();
//            var rand = Math.floor(Math.random() * 1000000);
//            //alert(lname);
//            $.ajax({
//                type: "post",
//                async: false,
//                url: "Handler.ashx",
//                contentType: "application/x-www-form-urlencoded; charset=utf-8",
//                data: "flag=phone&membertype=2&uName=" + lname + "&memberId=" + id + "&n=" + rand,
//                success: function (msg) {
//                    if (msg == "1") {
//                        alert("该手机号码已注册！");
//                        $("#c_Phone").focus();
//                    }
//                }
//            });
             //        }
             function daoqidate() {
                 var datedaoqi = document.getElementById("Sb_passTime").value;
                 if (datedaoqi != "") {
                     $.ajax({
                         type: "POST",
                         url: "Sb_Handler.ashx",
                         contentType: "application/x-www-form-urlencoded; charset=utf-8",
                         data: "sbdaoqi=" + datedaoqi,
                         success: function (msg) {
                             if (msg != "no") {
                                 document.getElementById("t_daoqi").value = msg;
                             }
                         }
                     });
                 }
             }
             function Jiaofei() {
                 if ($("#dd_jiaofeitype").val() == "1") {
                     $("#dailifei").hide();
                     $("#nodaili").show();
                 }
                 if ($("#dd_jiaofeitype").val() == "2") {
                     $("#dailifei").show();
                     $("#nodaili").hide();
                 }
             }

             function miaoshutype() {
                 var rb1 = document.getElementById("RadioButton1");
                 var rb2 = document.getElementById("RadioButton2");
                 var rb3 = document.getElementById("RadioButton3");
                 if (rb1.checked) {
                     $("#Sb_miaosu").val("请填写所申请的商标文字");
                     $("#Sb_miaosu").disabled = false;
                     $("#sbmiaoshu").show();
                 }
                 if (rb2.checked) {
                     $("#sbmiaoshu").hide();
                     $("#Sb_miaosu").val("");
                 }
                 if (rb3.checked) {
                     $("#Sb_miaosu").val("请填写所申请的商标文字");
                     $("#Sb_miaosu").disabled = false;
                     $("#sbmiaoshu").show();
                 }
             }
        function checkOk(obj) {
            if ($("#" + obj).val() != "") {
                $("#" + obj + "1").html("<img  src='images/tOk.gif' />");
            }
            else {
                $("#" + obj + "1").html("<img  src='images/tError.gif' />");
            }
        }
    </script>
  <script src="js/CheckTrademark.js" type="text/javascript"></script> 
<div id="div_a" runat="server"></div>
 <uc2:zscqfoot ID="zscqfoot1" runat="server" />
    </form>
   
</body>
</html>
