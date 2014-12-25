<%@ Control Language="C#" AutoEventWireup="true" CodeFile="zscq_sb_leftmenu.ascx.cs" Inherits="zscq_sb_leftmenu" %>
<table width="260" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="73" align="left" valign="top" style="background-image: url(images/user_sb.gif);">&nbsp;
            
        </td>
    </tr>
    <tr>
        <td width="260" height="609" align="left" valign="top">
            <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="10">&nbsp;
                        
                    </td>
                    <td width="221" height="22" bgcolor="#d34245">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="25" height="22">&nbsp;
                                    
                                </td>
                                <td width="13">&nbsp;
                                    
                                </td>
                                <td width="183" align="left" class="font12b">
                                    个人资料
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="29">&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">&nbsp;
                        
                    </td>
                    <td align="left" valign="top" style="background-color: #f4f4f4;">
                        <table>
                            <tr>
                                <td width="23" height="22">&nbsp;
                                    
                                </td>
                                <td>
                                    用户编号：
                                </td>
                                <td align="left">
                                    <%= unumber%>
                                </td>
                                <td rowspan="2">
                                    <img src="~/<%= grageImg%>" width="45" height="45" />
                                </td>
                            </tr>
                            <tr>
                                <td width="23" height="22">&nbsp;
                                    
                                </td>
                                <td>
                                    用户等级：
                                </td>
                                <td align="left">
                                    <%= grade %>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" valign="top">&nbsp;
                        
                    </td>
                </tr>
            </table>
            <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="10">&nbsp;
                        
                    </td>
                    <td width="221" height="22" bgcolor="#d34245" id="faq1_td">
            <table width="221" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25" height="22">&nbsp; </td>
                <td width="13"><img id="faq1_img" src='<%= ResolveUrl("~/images/server5.gif")%>' width="7" height="22" /> </td>
                <td width="183" align="left" class="font12b" style="cursor: pointer;" onclick="txt_roll('faq1');">服务中心 </td>
              </tr>
            </table>
                    </td>
                    <td width="29">&nbsp;
                        
                    </td>
                </tr>
                <tr id="faq1" <% if (myurl == "trademarkOrder_list" ||  myurl == "trademarkrenewalOrder_list"||myurl == "trademark_query"||myurl == "edit_trademark_renewal"||myurl == "trademarkrenewal_detail"|| myurl == "trademark_detail" || myurl == "add_trademark" || myurl == "edit_trademark" || myurl == "add_trademark_renewal" ||myurl == "trademark_list"||myurl == "trademarkrenewal_list" ||myurl == "user_sblb" || myurl == "user_trademarkorderok" || myurl == "user_sbck" || myurl == "user_sbupdate" || myurl == "user_sbjs" || myurl == "user_sbadd" || myurl == "user_sbadd1" || myurl == "user_sbadd2" || myurl == "user_sbaddok" || myurl == "user_sbtj" || myurl == "user_sbdd" || myurl == "user_sbddck" || myurl == "user_sbly" || myurl == "user_trademarkorderadd" || myurl == "user_sbjf"||myurl == "user_sbsetintegral"|| myurl == "user_sbcoupon"|| myurl == "user_trademarkzixing" ) {  %>style="display:;" <%}else{%>style="display:none;" <%} %>>
                    <td align="left" valign="top">&nbsp;
                        
                    </td>
                    <td align="left" valign="top" style="background-color: #f4f4f4;">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="8" colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_sblb.aspx" <% if ( myurl == "user_sblb"  ||  myurl == "user_sbck" || myurl == "user_sbupdate" || myurl == "user_sbjs" || myurl == "user_sbadd" || myurl == "user_sbadd1" || myurl == "user_sbadd2" || myurl == "user_sbaddok" || myurl == "user_sbtj" || myurl == "user_trademarkzixing"){ %> class="font12bd44147" <%}else{%> class="" <%} %>>·我的商标</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td height="6" colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td width="57">&nbsp;
                                    
                                </td>
                                <td width="171" height="18" align="left" valign="top">
                                    <table width="150" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="23" align="left">&nbsp;
                                                
                                            </td>
                                            <td width="127" height="22" align="left">
                                               <%-- <a href="user_sblb.aspx" <% if (myurl == "user_sblb" || myurl == "user_sbck"|| myurl == "user_sbupdate"|| myurl == "user_trademarkzixing" ){ %>class="ac7" <%}else{%>class="" <%} %>>·全部商标信息</a>--%>
                                                   <a href="javascript:void(0)" class="menuchild">·全部商标信息</a> 
                                                     <table  <% if (myurl == "trademark_list" ||myurl == "trademarkrenewal_list" || myurl == "trademark_detail"|| myurl == "edit_trademark" || myurl == "trademarkrenewal_detail"|| myurl == "edit_trademark_renewal" ) {  %>style="display:;" <%}else{%>style="display:none;" <%} %>>
                                                      <tr><td width="10" height="22"></td>
                                                      <td> <a href="trademark_list.aspx" <% if (myurl == "trademark_list" || myurl == "trademark_detail"|| myurl == "edit_trademark" ){ %>class="ac7" <%}else{%>class="" <%} %>>·商标申请案</a></td></tr>
                                                      <tr><td width="10" height="22"></td><td>
                                                       <a href="trademarkrenewal_list.aspx"  <% if (myurl == "trademarkrenewal_list" || myurl == "trademarkrenewal_detail"|| myurl == "edit_trademark_renewal" ){ %>class="ac7" <%}else{%>class="" <%} %>>·商标续展案</a></td></tr>
                                                     </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="23" align="left">&nbsp;
                                                
                                            </td>
                                            <td width="127" height="22" align="left">
                                                <a href="trademark_query.aspx" <% if (myurl == "trademark_query" ){ %>class="ac7" <%}else{%>class="" <%} %>>·商标信息检索</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="23" align="left">&nbsp;
                                                
                                            </td>
                                            <td width="127" height="22" align="left">
                                               <a href="javascript:void(0)" class="menuchild">·添加商标信息</a> 
                                               <table <% if (myurl == "add_trademark" ||myurl == "add_trademark_renewal" ) {  %>style="display:;" <%}else{%>style="display:none;" <%} %>>
                                               <tr><td width="10" height="22"></td><td>
                                                 <a href="add_trademark.aspx" <% if (myurl == "add_trademark" ){ %>class="ac7" <%}else{%>class="" <%} %>>·添加商标申请案</a></td></tr>
                                               <tr><td width="10" height="22" ></td><td>
                                                <a href="add_trademark_renewal.aspx" <% if (myurl == "add_trademark_renewal" ){ %>class="ac7" <%}else{%>class="" <%} %>>·添加商标续展案</a></td></tr>
                                               </table>
                                              <%--  <a href="user_sbadd1.aspx" <% if (myurl == "user_sbadd" ||myurl == "user_sbadd1"||myurl == "user_sbadd2"||myurl == "user_sbaddok"){ %>class="ac7" <%}else{%>class="" <%} %>>·添加商标信息</a>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="23" align="left">&nbsp;
                                                
                                            </td>
                                            <td width="127" height="22" align="left">
                                                <a href="user_sbtj.aspx" <% if (myurl == "user_sbtj" ){ %>class="ac7" <%}else{%>class="" <%} %>>·商标案件统计</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="32">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td height="6" colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <%--<a href="user_sbdd.aspx" <% if (myurl == "user_sbdd" ||  myurl == "user_sbddck"||  myurl == "user_trademarkorderok" ||myurl == "user_trademarkorderadd"){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·我的商标订单</a>--%>
                                    <a href="javascript:void(0)" <% if (myurl == "trademarkOrder_list" ||  myurl == "trademarkrenewalOrder_list"||  myurl == "user_trademarkorderok" ||myurl == "user_trademarkorderadd"){ %>class="font12bd44147 menuchild" <%}else{%>class="menuchild" <%} %> >·我的商标订单</a>
                                    <table style="display:none">
                                    <tr><td width="10" height="30"></td><td>  <a href="trademarkOrder_list.aspx">·商标申请案订单</a></td></tr>
                                     <tr><td width="10" height="30"></td><td> <a href="trademarkrenewalOrder_list.aspx">·商标续展案订单</a></td></tr>
                                    </table>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_sbjf.aspx" <% if (myurl == "user_sbjf"||myurl == "user_sbsetintegral" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·我的积分</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_sbcoupon.aspx" <% if (myurl == "user_sbcoupon" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·我的优惠券</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                    
                                </td>
                                <td height="30" align="left">
                                    <a href="user_sbly.aspx" <% if (myurl == "user_sbly" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·留言反馈</a>
                                </td>
                                <td>&nbsp;
                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" valign="top">&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                        
                    </td>
                    <td height="22" bgcolor="#d34245" id="faq2_td">
            <table width="221" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25" height="22">&nbsp; </td>
                <td width="13"><img id="faq2_img" src="images/server5.gif" width="7" height="22" /> </td>
                <td width="183" align="left" class="font12b" style="cursor: pointer;" onclick="txt_roll('faq2');">账户中心 </td>
              </tr>
            </table>
          </td>
          <td>&nbsp; </td>
        </tr>
        <tr id="faq2" style="display:;">
          <td align="left" valign="top">&nbsp; </td>
                    <td align="left" valign="top" style="background-color: #f4f4f4;">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="8" colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td width="36" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td width="157" height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_sbzl.aspx" <% if (myurl == "user_sbzl" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·我的资料</a>
                                </td>
                                <td width="28" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <%--<tr>
                <td width="36" style="border-bottom: 1px solid #d3d3d3;">&nbsp; </td>
                <td width="157" height="30" align="left" style="border-bottom: 1px solid #d3d3d3;"><a href="user_sbupload.aspx" <% if (myurl == "user_sbupload"){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·上传商标文件</a> </td>
                <td width="28" style="border-bottom: 1px solid #d3d3d3;">&nbsp; </td>
              </tr>--%>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_sbmm.aspx" <% if (myurl == "user_sbmm" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·修改密码</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                             <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="appUserInfo.aspx" <% if (myurl == "appUserInfo" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·常用申请人</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>

                            <tr>
                                <td width="36" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td width="157" height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_sbdz.aspx" <% if (myurl == "user_sbdz"||myurl == "user_sbdzadd" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·票据邮寄地址</a>
                                </td>
                                <td width="28" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                    <td align="left" valign="top">&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                        
                    </td>
                    <td bgcolor="#d34245">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="25" height="22">&nbsp;
                                    
                                </td>
                                <td width="13">
                                    <img  src="images/server5.gif" width="7" height="22" />
                                </td>
                                <td width="183" align="left" class="font12b"><a href="Login.aspx?flag=sb&esc=true" class="ac2">退出系统</a></td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="3" height="3">
                    </td>
                </tr>
                
            </table>
            <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="10" height="56">&nbsp;
                        
                    </td>
                    <td width="222">&nbsp;
                        
                    </td>
                    <td width="28">&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                        
                    </td>
                    <td align="left" valign="top">
                        <a href="download.aspx?filename=<%=filename %>" target="_blank">
                            <img src="images/user2s.gif" /></a>
                        <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/user2s.gif" Width="221" Height="50" OnClick="ImageButton1_Click" />--%>
                    </td>
                    <td>&nbsp;
                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">
    $(document).ready(function () {
        //        $(".menuchild").live("click", function () {
        //            $(this).next().toggle();
        //        });
        $(".menuchild").click(function () {
            $(this).next().toggle();
        });
    });

    function switchTag1(tag, content, k) {
        for (i = 1; i < 3; i++) {
            if (i == k)
            { document.getElementById(tag + i).className = "font12bt"; document.getElementById(content + i).className = ""; }
            else
            { document.getElementById(tag + i).className = "font12bs"; document.getElementById(content + i).className = "h_lsit_none"; }
        }
    }
    function txt_roll(str) {
        if (document.getElementById(str).style.display == "") {
            document.getElementById(str).style.display = "none";
            document.getElementById(str + "_td").setAttribute("bgColor", "#949293");
            document.getElementById(str + "_img").setAttribute("src", '<%= ResolveUrl("~/images/server6.gif")%>');
        }
        else {
            document.getElementById(str).style.display = "";
            document.getElementById(str + "_td").setAttribute("bgColor", "#d34245");
            document.getElementById(str + "_img").setAttribute("src",'<%= ResolveUrl("~/images/server5.gif")%>');
        }
    } 
</script>
