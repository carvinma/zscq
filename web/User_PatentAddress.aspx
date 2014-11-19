<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_PatentAddress.aspx.cs" Inherits="User_PatentCount" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/patentleft.ascx" TagName="patentleft" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>票据邮寄地址_账户中心_会员中心_专利系统_环球汇通</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<meta http-equiv="x-ua-compatible" content="ie=7" />

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body id="index">
  <form id="form1" runat="server">
  <input type="hidden" runat="server" id="Hi_MemberId" value="0" />
  <input type="hidden" runat="server" id="Hi_AddressId" value="0" />
  <input type="hidden" runat="server" id="Hi_Mr" value="0" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="55" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3">
      </td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;
    background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-image: url(images/server2.gif);">
        <uc1:patentleft ID="patentleft1" runat="server" />
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="52" align="left" valign="top" style="background-image: url(images/zl_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="38" height="28">&nbsp;
                    
                  </td>
                  <td width="701">&nbsp;
                    
                  </td>
                </tr>
                <tr>
                  <td height="19">&nbsp;
                    
                  </td>
                  <td align="left">
                    <a href="index.aspx">首页</a> >> 专利系统 >> 会员中心 >> 账户中心 >> 票据邮寄地址 
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="639" valign="top">
              <table width="716" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="28">&nbsp;
                    
                  </td>
                  <td>&nbsp;
                    
                  </td>
                </tr>
                <tr>
                  <td width="25" height="28">&nbsp;
                    
                  </td>
                  <td width="691" align="right">
                    <a href="User_PatentAddressAdd.aspx">
                      <img src="images/dzadd.gif" width="86" height="27" border="0" /></a>
                  </td>
                </tr>
                <tr>
                  <td height="123">&nbsp;
                    
                  </td>
                  <td align="left" valign="top">
                    <table width="671" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="left" valign="top">
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="687" height="28" align="left" valign="bottom" style="border-bottom: 1px solid #d34245;">
                                <table width="132" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;
                                      
                                    </td>
                                    <td width="115" align="center" class="font12bt">
                                      地址列表
                                    </td>
                                    <td width="7">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="left">
                              </td>
                            </tr>
                          </table>
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="86" height="35" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                收件人
                              </td>
                              <td width="94" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                电话
                              </td>
                              <td width="140" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                  所在国家
                              </td>
                              <td width="210" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                详细地址
                              </td>
                              <td width="62" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                是否默认
                              </td>
                              <td width="78" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">
                                操作
                              </td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td width="86" height="32" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_Consignee") %>
                                  </td>
                                  <td width="94" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_TelPhone")%>
                                  </td>
                                  <td width="140" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("countryName")%></td>
                                  <td width="210" align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_StreetAddress")%>
                                  </td>
                                  <td width="62" align="center" bgcolor="#FFFFFF">
                                    <%# Hi_Mr.Value != Eval("i_Id").ToString() ? "<a href=\"?PageType=mr&mid=" + Eval("i_Id") + "\">[否]</a>" : "<span style=\"color:#e3441c;\">是</span>"%>&nbsp;&nbsp;
                                  </td>
                                  <td width="78" align="center" bgcolor="#FFFFFF">
                                    <a href="User_PatentAddressAdd.aspx?PageType=update&uid=<%# Eval("i_Id")%>" class="ac5t">[修改]</a>
                                    <a href="?PageType=del&did=<%# Eval("i_Id")%>" onclick="javascript:if(!window.confirm('确认删除？')){return false;}"
                                      class="ac5t">[删除]</a>
                                  </td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                          <table width="687" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="10" align="left">
                              </td>
                            </tr>
                            <tr>
                              <td align="right" class="font12b4e">
                                <table class="aspnetpager" cellspacing="5">
                                  <tr>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" 
                                    LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" 
                                    PageIndexBoxType="DropDownList" PageSize="20" 
                                    onpagechanging="AspNetPager1_PageChanging" ShowPageIndexBox="Always"  
                                    ShowPageIndex="False" TextAfterPageIndexBox=" 页" 
                                    TextBeforePageIndexBox="跳转到 " >
                                </webdiyer:AspNetPager>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td width="687" height="26" align="left">
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
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  <div id="div_a" runat="server">
  </div>
  </form>
</body>
</html>

