<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sblb.aspx.cs" Inherits="user_sblb" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>商標リスト_私の商標_サービスセンター_商標システム_環球匯通</title>
  <meta name="Keywords" content="環球匯通" />
  <meta name="Description" content="環球匯通知的財産権年金納付代行電子商取引プラットフォーム" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />
<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <%--  <link href="css/pager.css" rel="stylesheet" type="text/css" />--%>
  <script type="text/javascript">
    $(function () {
      var ody1 = $("#Hi_orderby1").val().split('_');
      var ody2 = $("#Hi_orderby2").val().split('_');
      var ody3 = $("#Hi_orderby3").val().split('_');
      var ody4 = $("#Hi_orderby4").val().split('_');
      var ody5 = $("#Hi_orderby5").val().split('_');
      var ody6 = $("#Hi_orderby6").val().split('_');
      var ody7 = $("#Hi_orderby7").val().split('_');
      var hitime = $("#hi_time").val();

      if (ody1[1] == "1") {
        orderby(ody1[0], 1);
      }
      if (ody2[1] == "2") {
        orderby(ody2[0], 2);
      }
      if (ody3[1] == "3") {
        orderby(ody3[0], 3);
      }
      if (ody4[1] == "4") {
        orderby(ody4[0], 4);
      }
      if (ody5[1] == "5") {
        orderby(ody5[0], 5);
      }
      if (ody6[1] == "6") {
        orderby(ody6[0], 6);
      }
      if (ody7[1] == "7") {
        orderby(ody7[0], 7);
      }
//      if (hitime == "0") {
//        $(".time1").attr("class", "time0");
//      }
//      if (hitime == "1") {
//        $(".time1").attr("class", "time1");
//      }
//      if (hitime == "2") {
//        $(".time1").attr("class", "time2");
//      }
//      if (hitime == "3") {
//        $(".time1").attr("class", "time3");
//      }
//      if (hitime == "4") {
//        $(".time1").attr("class", "time4");
//      }
//      if (hitime == "5") {
//        $(".time1").attr("class", "time5");
//      }
//      if (hitime == "6") {
//        $(".time1").attr("class", "time6");
//    }
//    if (hitime == "7") {
//        $(".time1").attr("class", "time7");
//    }

    });
    function orderby(ody, index) {

      if (ody == "desc") {
        $("#daoxu" + index).hide();
        $("#zhengxu" + index).show();
      }
      else {
        $("#zhengxu" + index).hide();
        $("#daoxu" + index).show();
      }
    }
  </script>
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
  <style type="text/css">
    .time0 { font-size: 12px; color: #1e2b6c; font-weight: bold; }
    .time1 { font-size: 12px; color: #1e2b6c; font-weight: bold; }
    .time2 { font-size: 12px; color: #50245f; font-weight: bold; }
    .time3 { font-size: 12px; color: #852349; font-weight: bold; }
    .time4 { font-size: 12px; color: #b2333d; font-weight: bold; }
    .time5 { font-size: 12px; color: #d14b1a; font-weight: bold; }
    .time6 { font-size: 12px; color: #ebbf1c; font-weight: bold; }
    
    .aspnetpager a { display: block; float: left; padding: 2px 10px; background: #fff; text-align: center; line-height: 20px; border: 1px solid #ccc; color: #0065DB; margin: 0 3px; }
    .aspnetpager a:hover { border: 1px solid #FF5500; color: #FF5500; background: #FFEEE6; text-decoration: none; }
    .aspnetpager td .pagetext { width: 35px; height: 23px; background: #fff; text-align: center; line-height: 23px; border: 1px solid #ccc; }
    .aspnetpager td .submitbutton { width: 39px; height: 23px; background: url(images/fenbar.jpg); color: #fff; line-height: 23px; text-align: center; border: none; margin-left: 5px; }
  </style>
  <style type="text/css">
    #bg { display: none; z-index: 1; background: #0b0b0b; left: 0px; width: 100%; height: 100%; position: absolute; top: 0px; filter: alpha(opacity=70); opacity: 0.7; }
    #show { display: none; z-index: 2; position: absolute; top: 0px; }
  </style>
</head>
<body id="index">
  <form id="form1" runat="server">
  <input type="hidden" id="Hi_orderby1" runat="server" value="0" />
  <input type="hidden" id="Hi_orderby2" runat="server" value="0" />
  <input type="hidden" id="Hi_orderby3" runat="server" value="0" />
  <input type="hidden" id="Hi_orderby4" runat="server" value="0" />
  <input type="hidden" id="Hi_orderby5" runat="server" value="0" />
  <input type="hidden" id="Hi_orderby6" runat="server" value="0" />
  <input type="hidden" id="Hi_orderby7" runat="server" value="0" />
  <input type="hidden" id="hi_time" runat="server" value="0" />
  <input type="hidden" id="hi_trademark" runat="server" value="" />
  <input type="hidden" id="HF_ORDERBY" runat="server" value="" />
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="82" runat="server" />
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
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;>>&nbsp;商標システム&nbsp;>>&nbsp;サービスセンター&nbsp;>>&nbsp;私の商標&nbsp;>>&nbsp;全部商標情報</td>
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
                        <td height="29" align="left" valign="top">
                          <table width="689" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="114" height="29" align="center" style="background-color: #1e2b6c;"><a href='user_sblb.aspx?stime=90_1&<%=Geturl("stime") %>' class="ac2">90日間以上</a></td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #50245f;"><a href='user_sblb.aspx?stime=61-90_2&<%=Geturl("stime") %>' class="ac2">61－90日間</a></td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #852349;"><a href='user_sblb.aspx?stime=31-60_3&<%=Geturl("stime") %>' class="ac2">31-60日間</a></td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #b2333d;"><a href='user_sblb.aspx?stime=16-30_4&<%=Geturl("stime") %>' class="ac2">16-30日間</a></td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #d14b1a;"><a href='user_sblb.aspx?stime=0-15_5&<%=Geturl("stime") %>' class="ac2">0-15日間</a></td>
                              <td width="1"></td>
                              <td width="114" align="center" style="background-color: #ebbf1c;"><a href='user_sblb.aspx?stime=chao_6&<%=Geturl("stime") %>' class="ac2">期限切れの商標</a></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="26" align="left"></td>
                      </tr>
                      <tr>
                        <td height="115" align="left" valign="top">
                          <table width="689" border="0" cellspacing="1" cellpadding="1" bgcolor="#d0d0d0">
                            <tr>
                              <td width="66" height="42" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><table width="66" height="42" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="12"></td>
    <td align="left"><span>商標登録コード</span><a href="user_sblb.aspx?sbnum=desc_4" title="カウントダウン" id="daoxu4">↑</a><a href="user_sblb.aspx?sbnum=asc_4" title="正序" id="zhengxu4" style="display: none;">↓</a></td>
  </tr>
</table>
</td>
                              <td width="88" height="42" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><table width="89" height="42" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2"></td>
    <td width="87" align="left"><span>商標申請書/商標代理委託書</span></td>
  </tr>
</table></td>
                              <td width="90" height="42" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><table width="99" height="42" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2"></td>
    <td width="97" align="left"><span>主体資格証明/商標登録証明書</span></td>
  </tr>
</table></td>
                              <td width="49" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><table width="49" height="42" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="6"></td>
    <td width="44" align="left"><span>商標タイプ</span><a href="user_sblb.aspx?sbtype=desc_1" title="カウントダウン" id="daoxu1">↑</a><a href='user_sblb.aspx?sbtype=asc_1' title="正序" id="zhengxu1" style="display: none;">↓</a></td>
  </tr>
</table></td>
                              <td width="120" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><table width="115" height="42" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="12"></td>
    <td width="103" align="left"><span>登録者名称</span><a href="user_sblb.aspx?sbreg=desc_3" title="カウントダウン" id="daoxu3">↑</a><a href="user_sblb.aspx?sbreg=asc_3" title="正序" id="zhengxu3" style="display: none;">↓</a></td>
  </tr>
</table></td>
                              <%if (usertype == 3)
                                { %>
                                 <td width="69" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><span>公文書番号</span><a href="user_sblb.aspx?xnum=desc_7" title="カウントダウン" id="daoxu7">↑</a><a href='user_sblb.aspx?xnum=asc_7' title="正序" id="zhengxu7" style="display: none;">↓</a></td>
                                 <%} %>
                              
                              <td width="46" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline"><table width="46" height="42" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5"></td>
    <td width="41" align="left"><span>残り天数</span><a href="user_sblb.aspx?sbtime=desc_6" title="カウントダウン" id="daoxu6">↑</a><a href="user_sblb.aspx?sbtime=asc_6" title="正序" id="zhengxu6" style="display: none;" >↓</a></td>
  </tr>
</table></td>
                              <td width="52" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">小計</td>
                              <td width="49" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">詳細</td>
                              <td width="26" align="center" bgcolor="#FFFFFF" class="font12b4e user_zlbottomline">選択</td>
                            </tr>
                            <asp:Repeater ID="Rp_sb_list" runat="server">
                              <ItemTemplate>
                                <tr>
                                  <td height="42" align="center" bgcolor="#FFFFFF"><span class="<%#GetCurrentClassName(Convert.ToInt32(Eval("i_ShengDays"))) %>">
                                    <%# Eval("nvc_SBRegNum") %></span></td>
                                  <td height="42" align="center" bgcolor="#FFFFFF" class="user_zlbottomline"><%#BoolFileImg(Eval("nvc_ShenQingShu")) ? "<a href='../" + Eval("nvc_ShenQingShu") + "' title='商標申請書'>商標申請書</a>" : "<a href='user_sbck.aspx?t_r_id="+Eval("i_Id")+"' >未アップロード</a>"%><br /><%# int.Parse(Eval("i_JiaoFeiType").ToString())==2?(BoolFileImg(Eval("nvc_WeituoFile")) ? "<a href='../" + Eval("nvc_WeituoFile") + "' title='商標代理委託書'>商標代理委託書</a>" : "<a href='user_sbck.aspx?t_r_id=" + Eval("i_Id") + "'>未アップロード</a>"):""%>
                                  </td>
                                  <td height="42" align="center" bgcolor="#FFFFFF"><%#ZTFileImg(Eval("nvc_ZhuTiFile"), Eval("i_Id"))%><br /><%#BoolFileImg(Eval("nvc_SBFile")) ? "<a href='../" + Eval("nvc_SBFile") + "'><img src='../" + Eval("nvc_SBFile") + "' width='20'  title='商標登録証コピー' border='0'/></a>" : "<a href='user_sbupdate.aspx?t_r_id=" + Eval("i_Id") + "' >未アップロード</a>"%>
                                  </td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_SBType") %></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("nvc_SBRegName") %></td> 
                                    
                                      <%if (usertype == 3)
                                        { %>
                                     <td align="center" bgcolor="#FFFFFF"  <%# int.Parse(Eval("i_UserTypeId").ToString())==3?"":"style='display:none;'" %>>
                                    <%# Eval("nvc_CFaxnumber")%></td>
                                    <%} %>

                                  
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Eval("i_ShengDays")%></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <%# Getxiaoji(Eval("i_Id").ToString()) %></td>
                                  <td align="center" bgcolor="#FFFFFF"><a href="user_sbck.aspx?t_r_id=<%# Eval("i_Id") %>" class="ac5t">チェック</a></td>
                                  <td align="center" bgcolor="#FFFFFF">
                                    <input name="inputPageid" onchange="Selbox(this)" type="checkbox" <%# SetChecked(Eval("i_State").ToString(),Eval("i_IsPayState").ToString(),Eval("i_XujiaoStates").ToString()) %> value="<%#Eval("i_Id")%>" id="cb_<%#Eval("i_Id")%>" /></td>
                                </tr>
                              </ItemTemplate>
                            </asp:Repeater>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <%if (Rp_sb_list.Items.Count > 0)
                        { %>
                      <tr>
                        <td align="center">
                        <table>
                        <tr>  <td>
                         <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/sbweituofee.jpg" OnClick="ImageButton1_Click" OnClientClick="return Maxjiaofei();" />
                        </td>
                        <td>
                         <asp:ImageButton ID="ImageButton4" runat="server" 
                                  ImageUrl="images/sbweizijiaofee.jpg" OnClientClick="" 
                                  onclick="ImageButton4_Click" Visible="false" />
                        </td>
                         
                         <td>
                         
                        <asp:ImageButton ID="ImageButton3" runat="server" 
                                  ImageUrl="images/sballdaochu.jpg" OnClientClick="" 
                                  onclick="ImageButton3_Click" /></td>
                                  <td>
                         
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="images/user_zl_del.jpg" OnClientClick="javascript:return confirm('この操作を実行するかをご確認?')" 
                                onclick="ImageButton5_Click"/></td>
                        </tr>                        
                        </table>                         
                        </td>
                      </tr>
                      <%} %>
                      <tr>
                        <td align="left">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="right" class="font12b4e">
                          <table class="aspnetpager" cellspacing="5">
                            <tr>
                              <webdiyer:AspNetPager NumericButtonCount="7" ID="AspNetPager1" ShowPageIndexBox="Always" runat="server" ShowFirstLast="False" FirstPageText="フロントページ" LastPageText="最後のページ" PrevPageText="前のページ" NextPageText="後のページ" ShowInputBox="Always" PageSize="12" ShowCustomInfoSection="Right" CustomInfoHTML="全部 %PageCount% ページ " InputBoxClass="pagetext" PageIndexBoxType="TextBox" SubmitButtonText="確定" SubmitButtonClass="submitbutton" OnPageChanged="AspNetPager1_PageChanged" TextAfterInputBox=" ページ" TextBeforeInputBox="へスキップ ">
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
  <div id="bg">
  </div>
  <div id="show">
    <table width="488" height="222" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto; background-image: url(images/bgkuang1.png)">
      <tr>
        <td height="222" align="left" valign="top">
          <table width="488" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="36" height="58">&nbsp; </td>
              <td width="397">&nbsp; </td>
              <td width="55" align="right" valign="top"><a href="javascript:void(0);" onclick="hidediv();" style="width: 38px; height: 38px; display: block;">
                <%--<img src="images/close.jpg"  border="0" onclick="hidediv();" />--%></a> </td>
            </tr>
            <tr>
              <td height="132">&nbsp; </td>
              <td align="left" valign="top">
                <table width="397" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2" align="center">情報提示！ </td>
                  </tr>
                  <tr>
                    <td height="30" colspan="2" align="center"><strong style="color: #d34245;"></strong></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center"><span id="maxdays"></span></td>
                  </tr>
                  <tr>
                    <td height="30" colspan="2" align="center"><strong style="color: #d34245;"></strong></td>
                  </tr>
                  <tr>
                    <td height="30" style="width: 200px;" align="center"><img src="images/shaohou.gif" width="85" height="29" onclick="hidediv();" /> </td>
                    <td height="30" align="center">
                      <asp:ImageButton runat="server" ID="ImageButton2" ImageUrl="images/jixujiaofei.gif" Width="85" Height="29" BorderWidth="0" OnClick="ImageButton1_Click" />
                    </td>
                  </tr>
                </table>
              </td>
              <td>&nbsp; </td>
            </tr>
            <tr>
              <td height="15">&nbsp; </td>
              <td>&nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px">
    <Columns>
      <asp:BoundField DataField="nvc_UserNum" HeaderText="お客様番号" />
      <asp:TemplateField HeaderText="ユーザータイプ">
        <ItemTemplate>
          <%# GetSBtypeAndName(Eval("i_GuoJiId").ToString(), Eval("i_UserTypeId").ToString())%>
        </ItemTemplate>
      </asp:TemplateField>
       <asp:TemplateField HeaderText="商標登録証明書">
        <ItemTemplate>
          <%# Eval("nvc_SBFile")!=null?"アップロード済":"まだアップロードしていない"  %>
        </ItemTemplate>
      </asp:TemplateField>
          <asp:TemplateField HeaderText="主体資格証明">
        <ItemTemplate>
          <%#SBZTFile(Eval("i_Id"))%>
        </ItemTemplate>
      </asp:TemplateField>
        <asp:TemplateField HeaderText="商標の更新申請書">
        <ItemTemplate>
          <%# Eval("nvc_ShenQingShu") != null ? "アップロード済" : "まだアップロードしていない"%>
        </ItemTemplate>
      </asp:TemplateField>
          <asp:TemplateField HeaderText="商標の更新を依頼書">
        <ItemTemplate>
          <%# Eval("nvc_WeituoFile")!=null?"アップロード済":"まだアップロードしていない"  %>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_SBRegNum" HeaderText="商標登録コード" />
      <asp:BoundField DataField="nvc_SBType" HeaderText="商標タイプ
" />
      <asp:BoundField DataField="nvc_SBRegName" HeaderText="商標登録者の名称" />
      <asp:BoundField DataField="nvc_SBRegEnName" HeaderText="登録英文名称" />     
      <asp:BoundField DataField="nvc_SBRegAddress" HeaderText="商標登録詳しい住所" />
      <asp:BoundField DataField="nvc_SBRegEnAddress" HeaderText="商標登録の英文アドレス" />
      <asp:TemplateField HeaderText="審査状態">
        <ItemTemplate>
          <%#Eval("i_State").ToString() == "1" ?"パス<font style='color:red;'>(有効期限"+Eval("nvc_SbDaoqiTime")+"</font>)" :(Eval("i_State").ToString() == "2"?"未を通じて":"まだチェックしていない")%>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="nvc_SBPostcode" HeaderText="郵便番号" />
      <asp:BoundField DataField="dt_AddTime" HeaderText="添加時間" />
        <asp:BoundField DataField="nvc_SbRegTime" HeaderText="商標登録日" />      
             <asp:BoundField DataField="nvc_SbDaoqiTime" HeaderText="満期時間" />   
      <asp:BoundField DataField="i_ShengDays" HeaderText="残り天数" />
      <asp:TemplateField HeaderText="商標記述タイプ">
        <ItemTemplate>
         <%#Eval("i_MiaoShuType").ToString() == "1" ? "文字商標" : Eval("i_MiaoShuType").ToString() == "2" ? "図形商標" : "文字と図形商標"%>
        </ItemTemplate>
      </asp:TemplateField>

      <asp:BoundField DataField="nvc_SBDescribe" HeaderText="商標記述" />
      <asp:TemplateField HeaderText="費用納付種類">
        <ItemTemplate>
          <%#Eval("i_JiaoFeiType").ToString() == "1" ?"自らの費用を納める" :"委託納付"%>
        </ItemTemplate>
      </asp:TemplateField>
      </Columns>
  </asp:GridView>

  </div>
  <script type="text/javascript">
    function openBg(state) { //遮照打开关闭控制
      if (state == 1) {
        document.getElementById("bg").style.display = "block";
        var h = document.body.offsetHeight > document.documentElement.offsetHeight ? document.body.offsetHeight : document.documentElement.offsetHeight;
        h = h > document.body.scrollHeight ? h : document.body.scrollHeight;
        //alert(document.body.clientHeight);
        //alert(document.body.scrollHeight);
        //alert(document.body.offsetHeight);
        //alert(document.documentElement.offsetHeight); 
        document.getElementById("bg").style.height = h + "px";
      }
      else {
        document.getElementById("bg").style.display = "none";
      }
    }
    function showdiv(id) {
      //var id=$("#Hidden1").val();
      //alert(id);
      // var showdiv = $("#show");

      $("#show").show();
      document.getElementById("show").style.left = (document.getElementById("bg").offsetWidth - document.getElementById("show").offsetWidth) / 2 + "px";
      document.getElementById("show").style.top = document.documentElement.scrollTop + 100 + "px";
      //$("#Label2").html(id);
      // $("#Text4").val(id);
    }

    function hidediv() {
      $("#show").hide();
      $("#bg").hide();
    }
    function checkshuzi(id) {
      //定义正则表达式部分
      var str = $("#" + id).val();
      var reg = /^\d+$/;
      if (str.constructor === String) {
        var re = value.match(reg);
        return true;
      }
      return false;
    }
  </script>
  <script type="text/javascript">
      function getCookie(name) {
          var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

          if (arr = document.cookie.match(reg))

              return arr[2];
          else
              return null;
      }
      $(document).ready(function () {
          var inputlist = document.getElementsByName("inputPageid");
          //var tid = document.getElementById("hi_trademark").value;
          var tid = getCookie("hqht_Trademarktidstr");
          if (tid != 0) {
              var listid = tid.split('|');
              for (var i = 1; i < listid.length; i++) {
                  for (var j = 0; j < inputlist.length; j++) {
                      if (inputlist[j].value == listid[i].split(',')[0]) {
                          inputlist[j].checked = true;
                      }
                  }
              }
          }
      });

      function Checknum() {
          var num = 0;
          var inputlist = document.getElementsByName("inputPageid");
          for (var j = 0; j < inputlist.length; j++) {
              if (inputlist[j].checked) {
                  num++;
              }
          }
      }
  </script>
  <script type="text/javascript">
      function Selbox(obj) {
          if ($(obj).attr("checked") != "checked") {
              SetSectet(obj.value, "nocheck");
          }
          else {
              SetSectet(obj.value, "check");
          }
      }
      function SetSectet(txtvalue, tyid) {
          var pids = "";
          if (tyid == "check") {

              if (getCookie("hqht_Trademarktidstr") == null) {
                  pids = "";
              }
              else {
                  pids = pids + getCookie("hqht_Trademarktidstr");
              }

              if (pids.indexOf("|" + txtvalue + ",1") < 0) {

                  pids = pids + "|" + txtvalue + ",1";
              }
          }
          else if (tyid == "nocheck") {
              var getpidstr = getCookie("hqht_Trademarktidstr");
              pids = pids + getpidstr.replace("|" + txtvalue + ",1", "");
          }

          writeCookie("hqht_Trademarktidstr", pids, 1);

      }
      //    function SetSectet(txtvalue, tyid) {
      //        var rand = Math.floor(Math.random() * 1000000);
      //        var cs = "flag=Sbjiaofei&CheckValue=" + txtvalue + "&SelectType=" + tyid + "&n=" + rand;
      //        //        $.post("Handler.ashx", cs, function (msg) {
      //        //            alert(msg);
      //        //        });
      //        $.ajax({
      //            type: "POST",
      //            url: "Handler.ashx",
      //            contentType: "application/x-www-form-urlencoded; charset=utf-8",
      //            data: cs,
      //            success: function (msg) {
      //                // alert(msg);
      //            }
      //        });
      //    }

    function Maxjiaofei() {
      var num = 0;
      var isok;
      var inputlist = document.getElementsByName("inputPageid");
      for (var j = 0; j < inputlist.length; j++) {
        if (inputlist[j].checked) {
            num++;
          
        }
      }
      if (num != 0) {
        var rand = Math.floor(Math.random() * 1000000);
        var cs = "flag=SbMaxDays&SelectType=maxjiaofei&n=" + rand;
        $.ajax({
          type: "POST",
          async: false,
          url: "Handler.ashx",
          contentType: "application/x-www-form-urlencoded; charset=utf-8",
          data: cs,
          success: function (msg) {
            if (msg != "1") {
              $("#maxdays").html(msg);
              openBg(1);
              showdiv('1');
              isok = false;
            }
            else {
              $("#hi_time").val("true");
              isok = true;
            }
          }
        });
      }
      else {
        alert("あなたは納付の商標を選択してください！");
        isok = false;
      }
      //alert(isok);
      return isok;
    } 
     
  </script>
  <div id="div_a" runat="server">
  </div>
  <uc2:zscqfoot ID="zscqfoot1" runat="server" />
  <div id="div_html" runat="server">
  </div>
  </form>
</body>
</html>
