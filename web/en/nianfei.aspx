﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nianfei.aspx.cs" Inherits="nianfei" %>

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
  <uc3:zscqadv ID="zscqadv1" TypeId="61" runat="server" />
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
            <td width="406" align="left" valign="top"><img src="images/nianfei1.gif" width="278" height="90" /> </td>
            <td width="179" align="left" style="font-size: 14px; font-weight: bold;">Please select a country </td>
            <td width="169" align="left">
              <select runat="server" id="selContry" name="selContry" onchange="changeOption()" style="border: #d45156 2px solid; color: #d45156; font-size: 14px; width: 169px; height: 30px; padding: 3px;">
              </select></td>
            <td width="88" align="center">
              <%--<asp:LinkButton ID="lbtn_search" runat="server" OnClick="lbtn_search_Click"></asp:LinkButton>--%>
              <img src="images/nianfei2.gif" width="68" height="30" onclick="search();" />
              <script type="text/javascript">
                function search() {
                  window.location = "nianfei.aspx?countryid=" + document.getElementById("selContry").value;
                }
              </script>
            </td>
            <td width="159" align="left" style="font-size: 14px;">Currency Code：<span id="spcurrency" style="color: #d45156; font-size: 16px; font-weight: bold;"></span>
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
                  <td height="42" align="left"><strong>Standard charges of patent annuity fee are provided hereby, variable at your location and Granted Country. Please search for standard charges based on your location and Granted Country.</strong> </td>
                </tr>
                <tr>
                  <td height="36" align="left">
                    <table width="580" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="15" height="26">&nbsp; </td>
                        <td width="565" align="left" style="background-image: url(<%= feetypeId=="1"?"images/nianfei3.gif":"images/nianfei4.gif" %>); color: #fff; font-weight: bold; padding-left: 30px;"><a href="nianfei.aspx?feetype=1&countryid=<%=countryId %>" class="ac2">
                          Standard charges of <%=countryName %> patent annuity fee By <%=countryName %> local people</a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <% if (countryId != "1"){%>
                <tr>
                  <td height="36" align="left">
                    <table width="580" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="15" height="26">&nbsp; </td>
                        <td width="565" align="left" style="background-image: url(<%= feetypeId=="2"?"images/nianfei3.gif":"images/nianfei4.gif" %>); color: #fff; font-weight: bold; padding-left: 30px;"><a href="nianfei.aspx?feetype=2&countryid=<%=countryId %>" class="ac2">Standard charges of <%=countryName %> patent annuity fee By Chinese local people</a> </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <%} %>
                <tr>
                  <td height="36" align="left">
                    <table width="580" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="15" height="26">&nbsp; </td>
                        <td width="565" align="left" style="background-image: url(<%= feetypeId=="0"?"images/nianfei3.gif":"images/nianfei4.gif" %>); color: #fff; font-weight: bold; padding-left: 30px;"><a href="nianfei.aspx?feetype=0&countryid=<%=countryId %>" class="ac2">Standard charges of <%=countryName %> patent annuity fee By People holding other nationality</a> </td>
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
                        <td width="16">&nbsp; </td>
                        <td width="893" align="center"><span style="font-size: 18px; font-weight: bold; color: #d45156; line-height: 21px;">
                          <%=feetypeId == "0" ? ("Standard charges of " + countryName + " patent annuity fee By People holding other nationality") : feetypeId == "1" ? ("Standard charges of " + countryName + " patent annuity fee By " + countryName + " local people") : feetypeId == "2" ? ("Standard charges of " + countryName + " patent annuity fee By Chinese local people") : ""%></span>
                          <div id="div_title" runat="server">
                          </div>
                        </td>
                      </tr>
                      </table>
                      <table width="909" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="76">&nbsp; </td>
                        <td width="833" align="center"></td>
                      </tr>
                      <asp:Repeater ID="Rpt_PatentTypeList" runat="server" OnItemDataBound="Rpt_PatentTypeList_ItemDataBound">
                        <ItemTemplate>
                        <tr>
                            <td>&nbsp; </td>
                            <td height="12" align="left" valign="top"></td>
                          </tr>
                          <tr>
                            <td>&nbsp; </td>
                            <td height="32" align="left" valign="top">
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="29" align="left" valign="top" style="background-image: url(images/nianfei5.jpg);">
                                    <table width="" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="150" height="4"></td>
                                      </tr>
                                      <tr>
                                        <td height="24" align="center" valign="top" style="color: #fff; font-weight: bold; font-size: 14px;padding-left:5px;padding-right:5px;">
                                          <%#Eval("nvc_EnglishName")%>
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
                                  <td height="26" align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>Annuity year</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>Official fee</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>Bank charges</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>Service fee</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>Total fee</strong> </td>
                                  <td align="center" style="border-bottom: 2px solid #a1a1a1;"><strong>Total fee</strong> </td>
                                </tr>
                                <tr>
                                  <td height="26" align="center" bgcolor="#eeeeee">Currency </td>
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
