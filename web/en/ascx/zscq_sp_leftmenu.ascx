<%@ Control Language="C#" AutoEventWireup="true" CodeFile="zscq_sp_leftmenu.ascx.cs" Inherits="zscq_sp_leftmenu" %>
<table width="260" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td colspan="3" height="73" align="left" valign="top" style="background-image: url(images/user_shop.gif);">&nbsp;
            
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <table>
                <tr>
                    <td width="10">&nbsp;
                        
                    </td>
                    <td width="221" height="22" bgcolor="#d34245" id="faq1_td">
            <table width="221" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25" height="22">&nbsp; </td>
                <td width="13"><img id="faq1_img" src="images/server5.gif" width="7" height="22" /> </td>
                <td width="183" align="left" class="font12b" style="cursor: pointer;" onclick="txt_roll('faq1');">Service Center </td>
              </tr>
            </table>
          </td>
          <td width="29">&nbsp; </td>
        </tr>
         <tr id="faq1" style="display:;">
          <td align="left" valign="top">&nbsp; </td>
                    <td align="left" valign="top" style="background-color: #f4f4f4;">
                        <table width="221" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="8" colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td width="46" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td width="158" height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_shoptj.aspx" <% if ( myurl == "user_shoptj"){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·My order statistics</a>
                                </td>
                                <td width="17" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_shopdd.aspx" <% if ( myurl == "user_shopdd"||myurl == "user_shoporder1"||myurl == "user_shopddck"||  myurl == "user_shoporder2"){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·My order of gift </a>
                              </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_shopcoupon.aspx" <% if ( myurl == "user_shopcoupon"){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·My coupon</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
                                </td>
                                <td height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_shopintegral.aspx" <% if ( myurl == "user_shopintegral" ){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·My reward points</a>
                                </td>
                                <td style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
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
                <td width="183" align="left" class="font12b" style="cursor: pointer;" onclick="txt_roll('faq2');">My information center </td>
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
                                <td width="165" height="30" align="left" style="border-bottom: 1px solid #d3d3d3;">
                                    <a href="user_shopdz.aspx" <% if (myurl == "user_shopdzadd"||myurl == "user_shopdz"){ %>class="font12bd44147" <%}else{%>class="" <%} %>>·My Address book</a>
                                </td>
                                <td width="20" style="border-bottom: 1px solid #d3d3d3;">&nbsp;
                                    
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
                                <td width="183" align="left" class="font12b"><a href="Login.aspx?flag=sb&esc=true" class="ac2">Log out</a></td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;
                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" height="33">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <table>
                <tr>
                    <td height="37" width="10">
                    </td>
                    <td width="221" align="left">
                        <a href="jifen_gz.aspx?index=1">
                            <img src="images/jifen7.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen7s.gif';" onmouseout="this.src='images/jifen7.gif';" /></a>
                    </td>
                    <td width="29">&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td height="37">
                    </td>
                    <td align="left">
                        <a href="jifen_gz.aspx?index=2">
                            <img src="images/jifen8.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen8s.gif';" onmouseout="this.src='images/jifen8.gif';" /></a>
                    </td>
                    <td>&nbsp;
                        
                    </td>
                </tr>
                <tr>
                    <td height="37">
                    </td>
                    <td align="left">
                        <a href="jifen_gz.aspx?index=3">
                            <img src="images/jifen9.gif" width="217" height="31" border="0" onmouseover="this.src='images/jifen9s.gif';" onmouseout="this.src='images/jifen9.gif';" /></a>
                    </td>
                    <td>&nbsp;
                        
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" height="3">
        </td>
    </tr>
</table>
<script type="text/javascript">
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
            document.getElementById(str + "_img").setAttribute("src", "images/server6.gif");
        }
        else {
            document.getElementById(str).style.display = "";
            document.getElementById(str + "_td").setAttribute("bgColor", "#d34245");
            document.getElementById(str + "_img").setAttribute("src", "images/server5.gif");
        }
    } 
</script>
