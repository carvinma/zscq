<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbck.aspx.cs" Inherits="user_sbck" %>

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
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;&gt;&gt;&nbsp;会员中心&nbsp;&gt;&gt;&nbsp;服务中心&nbsp;&gt;&gt;&nbsp;我的商标&nbsp;&gt;&gt;&nbsp;查看商标信息 </td>
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
                <tr>
                  <td width="25" height="28">&nbsp; </td>
                  <td width="691" align="right">
                    <table>
                      <tr>
                        <td align="right">
                          <%if (JiaoFeiType == "1")
                            { %>
                          <asp:Button ID="Button5" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world3.gif); width: 180px; height: 29px;" OnClick="Button1_Click" />
                          <%} %>
                          <%if (JiaoFeiType == "2")
                            { %>
                          <asp:Button ID="Button3" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world1.gif); width: 180px; height: 29px;" OnClick="Button2_Click" />
                          &nbsp;
                          <asp:Button ID="Button4" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world2.gif); width: 150px; height: 29px;" OnClick="Button3_Click" />
                          <%} %>
                        </td>
                        <td align="right"><a href="user_sbupdate.aspx?t_r_id=<%=trademarkId %>"><img src="images/user_zl_b12.gif" width="85" height="29" border="0" runat=server id="ImgShow" />&nbsp;<a href="user_sblb.aspx"><img src="images/user_zl_b13.gif" width="85" height="29" border="0" /></a> </td>
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
                                    <td width="98" align="center" class="font12bt">基本信息 </td>
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
                                    <td width="260" height="32" align="right"><strong>商标注册号：</strong> </td>
                                    <td align="left">
                                      <%=SBRegNum %>
                                    </td>
                                  </tr>
                                  <%--  <tr>
                        <td height="32" align="right"><strong>商标名称：</strong></td>
                        <td align="left">&nbsp;</td>
                        </tr>--%>
                                  <tr>
                                    <td height="32" align="right"><strong>类别：</strong> </td>
                                    <td align="left">
                                      <%= SBRegaType%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>注册人名称：</strong> </td>
                                    <td align="left"><%=SBRegName %>
                                    </td>
                                  </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>注册人英文名称：</strong> </td>
                                    <td align="left">
                                      <%=Sb_RegnameEn %>
                                    </td>
                                  </tr>
                                  <%} %>
                                  <tr>
                                    <td height="32" align="right"><strong>注册人地址：</strong> </td>
                                    <td align="left">
                                      <%=SBRegAddress %>
                                    </td>
                                  </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>注册人英文地址：</strong> </td>
                                    <td align="left">
                                      <%=SBRegEnAddress%>
                                    </td>
                                  </tr>
                                  <%} %>
                                  <tr>
                                    <td height="32" align="right"><strong>注册人邮编：</strong> </td>
                                    <td align="left">
                                      <%=SBRegYouBian%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>商标注册日：</strong> </td>
                                    <td align="left"><%=SBPssTime%>
                                    </td>
                                  </tr>
                                     <tr>
                                    <td height="32" align="right"><strong>商标有效期限截止日：</strong> </td>
                                    <td align="left">
                                      <%=daoqitime%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>距截止日的所剩天数：</strong> </td>
                                    <td align="left">
                                      <%=shengtime%>天 </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>商标描述类型：</strong> </td>
                                    <td align="left"><%=SBmiaoshutype%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>商标描述：</strong> </td>
                                    <td align="left"><%=SBRegMiaoshu%>
                                    </td>
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
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="98" align="center" class="font12bt">缴费信息 </td>
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
                                <%--  <tr>
                                    <td width="260" height="32" align="right"><strong>缴费类型：</strong> </td>
                                    <td><span class="font12b4e user_zlbottomline">
                                      <%=JiaoFeiType=="1"?"自行缴费":"委托缴费" %>
                                    </span></td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right"><strong>缴费状态：</strong> </td>
                                    <td align="left"><%=isjiaofei%>
                                    </td>
                                  </tr>--%>
                               
                                
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
                                      <tr>
                                    <td width="260" align="right" height="32">总计：</td><td><span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=zongjiweituo%>                                    
                                    </span></td>                                    
                                    </tr>   
                                    <tr >
                                    <td height="5"></td><td></td>
                                    </tr>                                 
                                     <%if (guoji == 0)
                                       { %>                                     
                                      <tr>
                                    <td width="260" align="right" height="32">国外费用总计：</td><td><span class="font12b4e user_zlbottomline">
                                       <%=bizhong %>&nbsp;<%=zongjimeiweituo%>                                    
                                    </span></td>                                    
                                    </tr>                                     
                                    <%} %>     
                                    <%} %>
                                     <%-- <tr>
                                    <td height="32" align="right">币种：</td>
                                    <td width="429" align="left"><span class="font12b4e user_zlbottomline">
                                      <%=bizhong %>
                                    </span></td>
                                  </tr>--%>
                                  <tr>
                                    <td align="left">&nbsp; </td>
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
                                   <%=anjuanhao %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>联系人</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linkman %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>地址</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linkaddress %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>电话</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linktel %>
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
                                          <td width="10" height="20">&nbsp; </td>
                                          <td width="98" align="center" class="font12bt">文件上传 </td>
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
                                          <td width="260" height="32" align="right"><strong>主体资格证书：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=zhutifileok%>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>商标注册证书复印件：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=sbfileok%>
                                          </td>
                                        </tr>
                                       
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>申请书：</strong> </td>
                                          <td align="left" width="429">
                                            <%=shenqingfile%>
                                          </td>
                                        </tr>
                                        
                                       <%if (int.Parse(JiaoFeiType) == 2 || usertype==3)
                                         {
                                             %>                                   
                                        <tr>
                                          <td height="32" align="right"><strong>委托书：</strong> </td>
                                          <td align="left">
                                            <%=weituofile%>
                                          </td>
                                        </tr>
                                        <%}%>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td style="height: 50px;" align="right">
                                      <table width="389" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="100" height="35">
                                       
                                            <%--<asp:Button ID="Button1" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_zl_upload.gif); width: 85px; height: 29px;" OnClick="Button1_Click1"  />--%>
                                             
                                       
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
