<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nianfei.aspx.cs" Inherits="nianfei" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link href="css/pager.css" rel="stylesheet" type="text/css" />
</head>
<body id="nianfei">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="47" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td height="78" align="left" valign="top">
        <table width="1001" border="0" cellspacing="0" cellpadding="0">
          <tr valign="middle">
            <td width="536" align="left" valign="top"><img src="images/nianfei1.gif" width="278" height="90" /> </td>
            <td width="81" align="left" style="font-size: 14px; font-weight: bold;">请选择国家 </td>
            <td width="171" align="left">
              <select runat="server" id="selContry" name="selContry" onchange="changeOption()" style="border: #d45156 2px solid; color: #d45156; font-size: 14px; width: 169px; height: 30px; padding: 3px;">
              </select></td>
            <td width="77" align="center">
              <%--<asp:LinkButton ID="lbtn_search" runat="server" OnClick="lbtn_search_Click"></asp:LinkButton>--%>
              <img src="images/nianfei2.gif" width="68" height="30" onclick="search();" />
              <script type="text/javascript">
                function search() {
                  window.location = "nianfei.aspx?countryid=" + document.getElementById("selContry").value;
                }
              </script>
            </td>
            <td width="136" align="left" style="font-size: 14px;">货币代码：<span id="spcurrency" style="color: #d45156; font-size: 16px; font-weight: bold;"></span>
              <script><%= html_country %></script>
              <script type="text/javascript">
                //var country = new Array([1, '中国', 'RMB'], [1, '中国', 'RMB']); 
                //alert(scountry); 
                function createOption() {
                  var obj = document.getElementById("selContry");
                  for (var i = 0; i < scountry.length; i++) {
                    obj.options.add(new Option('  ' + scountry[i][1] + '      ', scountry[i][0]));
                  }
                  obj.onchange = changeOption;
                }
                function changeOption() {
                  var obj = document.getElementById("selContry");
                  //alert(scountry[obj.selectedIndex][2])
                  document.getElementById("spcurrency").innerHTML = scountry[obj.selectedIndex][2];
                }
                //createOption();
                changeOption();
              </script>
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
            <td width="42" height="72">&nbsp; </td>
            <td width="909" align="left" valign="top">
              <table width="909" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="42" align="left"><strong>此处提供的专利年费的费用标准,根据您的所在地及年费递交国的不同而有所不同.请您根据自己的所在地与年费递交国来进行查询</strong> </td>
                </tr>
                <tr>
                  <td height="36" align="left">
                    <table width="460" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="15" height="26">&nbsp; </td>
                        <td width="445" align="left" style="background-image: url(<%= feetypeId=="1"?"images/nianfei3.gif":"images/nianfei4.gif" %>); color: #fff; font-weight: bold; padding-left: 30px;"><a href="nianfei.aspx?feetype=1&countryid=<%=countryId %>" class="ac2">
                          <%=countryName %>国内客户向<%=countryName %>专利局递交年费的费用标准</a> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <% if (countryId != "1"){%>
                <tr>
                  <td height="36" align="left">
                    <table width="460" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="15" height="26">&nbsp; </td>
                        <td width="445" align="left" style="background-image: url(<%= feetypeId=="2"?"images/nianfei3.gif":"images/nianfei4.gif" %>); color: #fff; font-weight: bold; padding-left: 30px;"><a href="nianfei.aspx?feetype=2&countryid=<%=countryId %>" class="ac2">中国国内客戸向<%=countryName %>专利局递交年費的费用标准</a> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <%} %>
                <tr>
                  <td height="36" align="left">
                    <table width="460" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="15" height="26">&nbsp; </td>
                        <td width="445" align="left" style="background-image: url(<%= feetypeId=="0"?"images/nianfei3.gif":"images/nianfei4.gif" %>); color: #fff; font-weight: bold; padding-left: 30px;"><a href="nianfei.aspx?feetype=0&countryid=<%=countryId %>" class="ac2">中国以外客戸向<%=countryName %>专利局递交年費的费用标准</a> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="15" align="left" valign="top"></td>
                </tr>
                <tr>
                  <td height="30" align="left" valign="top" style="line-height: 24px;">
                    <%= countrydesc %>
                  </td>
                </tr>
                <tr>
                  <td height="15" align="left">&nbsp; </td>
                </tr>
                <tr>
                  <td height="30" align="left" valign="top">
                    <table width="909" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="156">&nbsp; </td>
                        <td width="753" align="center"><span style="font-size: 18px; font-weight: bold; color: #d45156; line-height: 21px;">
                          <%=feetypeId == "0" ? ("中国以外客戸向" + countryName) : feetypeId == "1" ? (countryName + "国内客户向" + countryName) : feetypeId == "2" ? ("中国以内客戸向" + countryName) : ""%>专利局递交年费的费用标准 </span>
                          <div id="div_title" runat="server">
                          </div>
                        </td>
                      </tr>
                      <asp:Repeater ID="Rpt_PatentTypeList" runat="server" OnItemDataBound="Rpt_PatentTypeList_ItemDataBound">
                        <ItemTemplate>
                          <tr>
                            <td>&nbsp; </td>
                            <td height="32" align="left" valign="top">
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="29" align="left" valign="top" style="background-image: url(images/nianfei5.jpg);">
                                    <table width="" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="120" height="4"></td>
                                      </tr>
                                      <tr>
                                        <td height="24" align="center" valign="top" style="color: #fff; font-weight: bold; font-size: 14px;">
                                          <%#Eval("nvc_Name")%>
                                          <asp:HiddenField ID="HF_ID" runat="server" Value='<%#Eval("i_Id")%>' />
                                          <asp:HiddenField ID="HF_GuoJiaId" runat="server" Value='<%#Eval("i_GuoJiaId")%>' />
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>&nbsp; </td>
                            <td height="29" align="left" valign="top">
                              <table width="700" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td colspan="6" height="8"></td>
                                </tr>
                              </table>
                              <table width="700" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="26" align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>年度</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>政府规定费用</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>汇款手续费</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>代理服务费</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>费用总计</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>费用总计</strong> </td>
                                </tr>
                                <tr>
                                  <td height="26" align="center" bgcolor="#eeeeee">币种 </td>
                                  <td align="center" bgcolor="#eeeeee">
                                    <%=currency %>
                                  </td>
                                  <td align="center" bgcolor="#eeeeee">
                                    <%=currency %>
                                  </td>
                                  <td align="center" bgcolor="#eeeeee">
                                    <%=currency %>
                                  </td>
                                  <td align="center" bgcolor="#eeeeee">
                                    <%=currency %>
                                  </td>
                                  <td align="center" bgcolor="#eeeeee">USD </td>
                                </tr>
                                <asp:Repeater ID="reptlist" runat="server">
                                  <ItemTemplate>
                                    <tr>
                                      <td height="26" align="center">
                                        <%#Eval("nvc_Year")%>
                                      </td>
                                      <td align="center">
                                        <%#Eval("dm_SetFee")%>
                                      </td>
                                      <td align="center">
                                        <%#Eval(GetBindShouXuFeeFiled())%>
                                      </td>
                                      <td align="center">
                                        <%#Eval(GetBindAgentServiceFeeFiled())%>
                                      </td>
                                      <td align="center">
                                        <%#Eval(GetBindTotalFeeFiled())%>
                                      </td>
                                      <td align="center">
                                        <%# FeeToUsd(Eval(GetBindTotalFeeFiled()))%>
                                      </td>
                                    </tr>
                                  </ItemTemplate>
                                </asp:Repeater>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td height="28" colspan="6" align="center"></td>
                          </tr>
                        </ItemTemplate>
                      </asp:Repeater>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td width="50">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="41" align="left" valign="top">&nbsp; </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  </form>
</body>
</html>
