<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademark_detail.aspx.cs" Inherits="trademark_detail" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <title></title>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/trademark.css" rel="stylesheet" type="text/css" />
    <script src="jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="js/jtrademark.js" type="text/javascript"></script>
    <link href="jBox/Skins/Red/jbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            if (getUrlParam('order') == "1") { //当为订单时的返回
                var ids = getUrlParam('ids');
                $("#hrefBack").attr("href", "Add_TrademarkOrder.aspx?ids=" + ids);
            }
            else if (getUrlParam('orderlist') == "1") {
                $("#hrefBack").attr("href", "trademarkOrder_list.aspx?");
            }
            else if (getUrlParam('orderinfo') == "1") {
                var orderid = getUrlParam('order');
                var tIds = getUrlParam('tIds');

                $("#hrefBack").attr("href", "trademarkOrder_info.aspx?order=" + orderid + "&tIds=" + tIds);
            }
            $('.ui-tabs-nav > li > a').click(function (e) { //Tab切换
                if (e.target == this) {
                    var tabs = $(this).parent().parent().children('li');
                    var panels = $(this).parent().parent().parent().children('.ui-tabs-panel');
                    var index = $.inArray(this, $(this).parent().parent().find('a'));
                    if (panels.eq(index)[0]) {
                        tabs.removeClass('ui-tabs-selected').eq(index).addClass('ui-tabs-selected');
                        panels.addClass('ui-tabs-hide').eq(index).removeClass('ui-tabs-hide');
                    }
                    if (index == 2) {
                        var ifpanel = panels.eq(index);
                        if (ifpanel.attr('url') != undefined && ifpanel.find('frame').length == 0) {
                            ifpanel.html('<iframe src="' + ifpanel.attr('url') + '" scrolling="no" frameborder="0" width="100%" onload="IFrameReSize(this);"></iframe>');
                            ifpanel.removeAttr('src');
                        }
                    }
                }
            });
        });
    </script>
    <style type="text/css">

 p.MsoNormal
	{margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        
        .table-b table td{border:1px solid #F00}
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="46" runat="server" />
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
        <div class="infoMain">
					<ul class="ui-tabs-nav clearfix">
						<li class="ui-tabs-selected"><a href="javascript:;">商标信息</a></li>
						<li><a href="javascript:;">商标状态</a></li>
						<li><a href="javascript:;">HQHT留言</a></li>
					</ul>
					<div class="ui-tabs-panel">
						<div class="content reset">
						 <table width="689" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="115" align="center" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                          <tr><td height="10">
                           </td></tr>
                           <tr><td height="28" align="right">
                            <table style="width:100px">
                            <tr><td>
                            <a href="javascript:void(0)"  onclick="printPage()" class="BtnShowhref" style="width:73px">打 印</a>
                             <script type="text/javascript">
                                 function printPage() {
                                     var newWin = window.open();
                                     $("#printGoods").show();
                                     var titleHTML = document.getElementById("printTbl").innerHTML;
                                     titleHTML = titleHTML.replace('商品详情', '');
                                     newWin.document.write(titleHTML);
                                     $("#printGoods").hide();
                                     newWin.document.location.reload();
                                     newWin.print();
                                 } 
                              </script>
                              </td>
                            <td><a href="edit_trademark.aspx?t_r_id=<%=trademarkId %>">
                             <img src="images/user_zl_b12.gif" width="85" height="29" border="0" runat="server" id="ImgShow" /></a></td>
                            <td> 
                            <a href="trademark_list.aspx" id="hrefBack">
                            <img src="images/user_zl_b13.gif" width="85" height="29" border="0" /></a></td>
                            </tr></table>
                           
                           </td></tr>
                          </table>
                          <table width="689" border="0" cellspacing="0" cellpadding="0" id="printTbl">
                            <tr>
                              <td>
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                    <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="98" align="center" class="font12bt">申请人信息</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                                    </td>
                                    </tr>
                                    </table>
                                  
                             </td>
                            </tr>
                             <tr>
                              <td height="18" align="left"></td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="260" height="32" align="right"><strong>申请人名称：</strong> </td>
                                    <td align="left">
                                      <%=model.ApplyName %>
                                    </td>
                                  </tr>
                                  <% if (model.ApplyType == 1)
                                     { %>
                                  <tr>
                                    <td height="32" align="right"><strong>身份证件名称：</strong> </td>
                                    <td align="left">
                                      身份证
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>身份证件号码：</strong> </td>
                                    <td align="left"><%=model.CardNo%>
                                    </td>
                                  </tr>
                                 
                                  <tr>
                                    <td height="32" align="right"><strong>身份证明文件（扫描件）：</strong> </td>
                                    <td align="left">
                                      <%=model.CardNoPDF%>
                                    </td>
                                  </tr>
                                  <%} %>
                                  <tr>
                                    <td height="32" align="right"><strong>营业执照副本（扫描件）：</strong> </td>
                                    <td align="left">
                                      <%=model.Businesslicense %>
                                    </td>
                                  </tr>
                                  
                                  <tr>
                                    <td height="32" align="right"><strong>申请人行政区划：</strong> </td>
                                    <td align="left">
                                      <%=division%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>申请人地址：</strong> </td>
                                    <td align="left">
                                      <%=model.Address%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>邮政编码：</strong> </td>
                                    <td align="left"><%=model.PostCode%>
                                    </td>
                                  </tr>
                                     <tr>
                                    <td height="32" align="right"><strong>联系人：</strong> </td>
                                    <td align="left">
                                      <%=model.ContactPerson%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>联系电话：</strong> </td>
                                    <td align="left">
                                      <%=model.Phone%> </td>
                                  </tr>
                                  <tr>
                                  <td height="18"></td><td></td></tr>
                                  </table>
                              </td>
                            </tr>
                            <tr>
                              <td>
                               <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="186" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="160" align="center" class="font12bt">商标信息（第一部分）</td>
                                    <td width="6"></td>
                                  </tr>
                                </table>
                                 </td>
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
                                
                                     <tr id="dailifei">                                   
                                    <td width="260" height="32" align="right" ><strong>商标类别：</strong>
                                    </td>  
                                     <td> 
                                        <%=model.TrademarkType %> 
                                        &nbsp;<a href="javascript:void(0)" onclick="editTradeMarkshowGoods();">商品详情</a>
                                        
                                    </td>
                                     </tr>
                                    <tr id="printGoods" style="display:none">
                                     <td width="260" height="32" align="right" ><strong>商品详情：</strong>
                                    </td>  
                                     <td>
                                      <table id="tbl_goods" width="429" border="0" cellspacing="0" cellpadding="0" bgcolor="#d0d0d0">
                                      <tr><td>
                                         <table width="429" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0" class="table-b" id="th_table">
                                                            <tr id="th_box">
                                                             <td width="50" height="20" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">序号</td>
                                                              <td width="50"  align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类别</td>
                                                              <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">类似群</td>
                                                              <td width="80" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品编码</td>
                                                              <td align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">商品名称</td>
                                                            </tr>
                                                              <asp:Repeater ID="Rpt_goods" runat="server">
                                                               <ItemTemplate>
                                                               <tr classname="arr_goods" name="arr_goods[]" val="<%# Eval("id")%>" id="arr_goods<%# goodsItemCount- Container.ItemIndex%>">
                                                               <td height="25" align="center" bgcolor="#FFFFFF" id="4<%# goodsItemCount- Container.ItemIndex%>"><%# goodsItemCount- Container.ItemIndex%></td>
                                                               <td align="center" bgcolor="#FFFFFF" id="3<%# goodsItemCount- Container.ItemIndex%>">
                                                                <input type="hidden" classname="hid_classsort" name="hid_sort[]" value='<%# Eval("MainCategoryCode")%>'><%# Eval("MainCategoryCode")%></td>
                                                               <td align="center" bgcolor="#FFFFFF" id="2<%# goodsItemCount- Container.ItemIndex%>">
                                                               <input type="hidden" name="hid_group[]" value='<%# Eval("DetailCategoryCode")%>'><%# Eval("DetailCategoryCode")%></td>
                                                               <td align="center" bgcolor="#FFFFFF" id="1<%# goodsItemCount- Container.ItemIndex%>">
                                                               <input type="hidden" name="hid_goods[]" value='<%# Eval("GoodsCode")%>'><%# Eval("GoodsCode")%></td>
                                                               <td align="center" bgcolor="#FFFFFF" id="0<%# goodsItemCount- Container.ItemIndex%>">
                                                               <input type="hidden" name="hid_goodsname[]" classname="<%#Eval("MainCategoryCode")%>" value='<%#Eval("GoodsRemark")%>'><%# Eval("GoodsRemark")%></td>
                                                               </tr>
                                                                </ItemTemplate>
                                                                </asp:Repeater>
                                                           </table>

                                        </td></tr>
                                       </table>
                                    </td>
                                    </tr>                                  
                                   
                                     <tr>
                                    <td width="260" height="32" align="right" ><strong>商标图样：</strong>
                                    </td>  
                                    <td> 
                                      <%=model.TrademarkPattern1%>
                                        &nbsp;&nbsp;&nbsp;
                                      <img alt="" height="150px" width="150px" src="<%=model.TrademarkPattern2%>" />
                                       </td>  
                                    </tr>
                                      
                                      <tr>
                                    <td width="260" height="32" align="right" ><strong>商标说明：</strong>
                                    </td>  
                                    <td> 
                                       <%=model.TrademarkRemark %>
                                    </td>                                  
                                    </tr>
                                    
                                      <tr>
                                    <td width="260" align="right" height="32"><strong>是否三维商标：</strong></td>
                                    <td>
                                        <%=model.Is3D==true ? "是":"否" %>
                                    </td>                                    
                                    </tr>   
                                      <tr>
                                    <td width="260" align="right" height="32">
                                      <strong> 是否颜色组合商标： </strong>
                                          </td><td> <%=model.IsColor==true ? "是":"否" %></td>                                    
                                    </tr>   
                                    
                                      <tr>
                                    <td width="260" align="right" height="32">
                                            <strong>是否声音商标：</strong> 
                                          </td><td><%=model.IsSound==true ? "是":"否" %></td>                                    
                                    </tr>   
                                       <% if (model.IsSound == true) { %>
                                      <tr>
                                    <td width="260" align="right" height="32"><strong>声音文件：</strong></td>
                                    <td><%=model.SoundFile%></td>                                    
                                    </tr>   
                                    <%} %>
                                  <tr>
                                    <td align="left">&nbsp; </td>
                                  </tr>
                                </table>
                                                      
                                <table width="689" border="0" cellspacing="0" cellpadding="0" id="disanfang" runat="server">
                            <tr>
                              <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                <table width="186" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp;</td>
                                    <td width="160" align="center" class="font12bt">商标信息（第二部分）</td>
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
                                    <td width="260" height="32" align="right" valign="middle"><strong>商标申请日：</strong></td>
                                    <td width="429" valign="middle">
                                    <%= string.Format("{0:yyyy-MM-dd}", model.ApplyDate)%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>初审公告日：</strong></td>
                                    <td width="429" valign="middle">
                                        <%= string.Format("{0:yyyy-MM-dd}", model.PublicPreliminaryDate)%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><b><span>最近状态：</span></b></td>
                                    <td width="429" valign="middle">
                                        <%=status%></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td align="left">&nbsp;</td>
                            </tr>
                          </table>
                          
                                <table width="689" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="639" height="20" align="left" valign="top" style="border-bottom: 1px solid #d34245;">
                                      <table width="114" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="10" height="20">&nbsp; </td>
                                          <td width="98" align="center" class="font12bt">其它信息 </td>
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
                                          <td width="260" height="32" align="right"><strong><span>商标注册申请书</span>：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=model.ApplyBook%>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>商标申请委托书：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=model.AgentBook%>
                                          </td>
                                        </tr>
                                       
                                        <tr>
                                          <td height="32" align="right"><strong>备注：</strong></td>
                                          <td align="left">
                                          <div id="test" style="width:300px;height:80px;border:#eee solid 1px;overflow:auto;">
                                             <%=model.Remark%>
                                          </div></td>
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
						</div>
					</div>
					<div class="ui-tabs-panel ui-tabs-hide">
                     <table cellspacing='1' cellpadding='3' id="Table1" width="669px">
                        <asp:Repeater ID="RptAdminStatus" runat="server" >
                            <ItemTemplate>
                                <tr>
                                <td width="260" align="right">
                                 <strong> <%# Container.ItemIndex + 1%>、<%# Eval("StatusName")%>：<strong>
                                </td>
                                    <td align="left">
                                      <%# string.Format("{0:yyyy-MM-dd}", Eval("TradeMarkDate"))%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
					</div>
					<div class="ui-tabs-panel ui-tabs-hide">
                    
                      <table cellspacing='1' cellpadding='3' id="Table2" width="669px">
                        <asp:Repeater ID="RptMessage" runat="server" >
                            <ItemTemplate>
                              <table width="689" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="21" align="center" valign="top" style="line-height: 21px;">
                                    <table width="630" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="15" height="15">&nbsp; </td>
                                        <td width="808" align="left" valign="top">
                                          <table width="630" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="807" height="28" align="left"><strong><%# string.Format("{0:yyyy-MM-dd}",Eval("AddTime"))%></strong></td>
                                            </tr>
                                            <tr>
                                              <td width="807" height="28" align="left" valign="top" style="line-height: 21px;"><strong></strong>
                                                <%#Eval("Message")%>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                        <td width="28">&nbsp; </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="26" align="left" style="background-image: url(images/faq2.gif);">&nbsp; </td>
                                </tr>
                              </table>
                            </ItemTemplate>
                        <%--    <tr>
                            <td width="100" align="center">
                           <div class="item">
                            <dl class="question clearfix">
                                <dt><b>留言内容</b></dt>
                                <dd><span><%# string.Format("{0:yyyy-MM-dd HH:mm}",Eval("AddTime"))%></span><%# Eval("Message")%></dd>
                            </dl>
                            </div>
                          </td></tr>--%>
                        </asp:Repeater>
                    </table>
				    </div>
				</div>
  
      </td>
    </tr>
  </table>
 
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  </form>
</body>
</html>
