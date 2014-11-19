<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_sbck.aspx.cs" Inherits="user_sbck" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<%@ Register Src="ascx/zscq_sb_leftmenu.ascx" TagName="zscq_sb_leftmenu" TagPrefix="uc1" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>商標情報検索_私の商標_サービスセンター_商標システム_環球匯通</title>
  <meta name="Keywords" content="環球匯通" />
  <meta name="Description" content="環球匯通知的財産権年金納付代行電子商取引プラットフォーム" />
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
                  <td width="38" height="28">&nbsp; </td>
                  <td width="701">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">フロントページ</a>&nbsp;&gt;&gt;&nbsp;会員センター&nbsp;&gt;&gt;&nbsp;サービスセンター&nbsp;&gt;&gt;&nbsp;私の商標&nbsp;&gt;&gt;&nbsp;査看商標情報 </td>
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
                    <table width="651" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="right">
                          <%if (JiaoFeiType == "1")
                            { %>
                          <asp:Button ID="Button5" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world3.gif); width: 218px; height: 29px;" OnClick="Button1_Click" />
                          <%} %>
                          <%if (JiaoFeiType == "2")
                            { %>
                          <asp:Button ID="Button3" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world1.gif); width: 218px; height: 29px;" OnClick="Button2_Click" />
                          &nbsp;
                          <asp:Button ID="Button4" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_sb_world2.gif); width: 218px; height: 29px;" OnClick="Button3_Click" />
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
                              <td width="639" height="42" align="left" valign="bottom" style="border-bottom: 1px solid #d34245;">
                                <table width="114" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="10" height="20">&nbsp; </td>
                                    <td width="98" align="center" class="font12bt">基本情報 </td>
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
                                    <td width="260" height="32" align="right"><strong>商標登録コード：</strong> </td>
                                    <td align="left">
                                      <%=SBRegNum %>
                                    </td>
                                  </tr>
                                  
                                  <tr>
                                    <td height="32" align="right"><strong>类别：</strong> </td>
                                    <td align="left">
                                      <%= SBRegaType%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>登録者名称
                                        <%if (usertype == 3)
                                                                      { %>
                                    (中国語)<%} %>：</strong> </td>
                                    <td align="left"><%=SBRegName %>
                                    </td>
                                  </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>商標登録者名称(英語)：</strong> </td>
                                    <td align="left">
                                      <%=Sb_RegnameEn %>
                                    </td>
                                  </tr>
                                  <%} %>
                                  <tr>
                                    <td height="32" align="right"><strong>商標登録者詳細住所<%if (usertype == 3)
                                                                      { %>(中国語)<%} %>：</strong> </td>
                                    <td align="left">
                                      <%=SBRegAddress %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>登録者コード：</strong> </td>
                                    <td align="left">
                                      <%=SBRegYouBian%>
                                    </td>
                                  </tr>
                                  <%if (guoji == 0 && usertype == 3)
                                    { %>
                                  <tr>
                                    <td height="32" align="right"><strong>商標登録者詳細住所(英語)：</strong> </td>
                                    <td align="left">
                                      <%=SBRegEnAddress%>
                                    </td>
                                  </tr>
                                  <%} %>
                                  
                                  <tr>
                                    <td height="32" align="right"><strong>商標登録日：</strong> </td>
                                    <td align="left"><%=SBPssTime%>
                                    </td>
                                  </tr>
                                     <tr>
                                    <td height="32" align="right"><strong>商標の有効期限は日：</strong> </td>
                                    <td align="left">
                                      <%=daoqitime%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>距離締め切りの殘り日数：</strong> </td>
                                    <td align="left">
                                      <%=shengtime%> </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>商標記述タイプ：</strong> </td>
                                    <td align="left"><%=SBmiaoshutype%>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="32" align="right"><strong>商標記述：</strong> </td>
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
                                    <td width="98" align="center" class="font12bt">納付情報 </td>
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
                                    <td width="260" height="32" align="right" >公式サイトの商標の費用：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                      CNY&nbsp;<%=Str_Moneysb%>                                    
                                    </span></td>                                  
                                    </tr>
                                     <tr>
                                    <td width="260" height="32" align="right" >商標代理費：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=sbdailiweituo%>                                    
                                    </span></td>                                  
                                    </tr>
                                      <%if (iszhinajin == 1)
                                      { %>
                                      <tr>
                                    <td width="260" height="32" align="right" >商標滯納金費用：
                                    </td>  
                                    <td> <span class="font12b4e user_zlbottomline">
                                 CNY&nbsp;<%=Str_Zhinajin%>                                    
                                    </span></td>                                  
                                    </tr>
                                    <%} %> 
                                      <tr>
                                    <td width="260" align="right" height="32">総計：</td><td><span class="font12b4e user_zlbottomline">
                                  CNY&nbsp;<%=zongjiweituo%>                                    
                                    </span></td>                                    
                                    </tr>  
                                    <tr >
                                    <td height="5"></td><td></td>
                                    </tr>                                  
                                     <%if (guoji == 0)
                                       { %>                                     
                                      <tr>
                                    <td width="260" align="right" height="32">国外費用総計：</td><td><span class="font12b4e user_zlbottomline">
                                       <%=bizhong %>&nbsp;<%=zongjimeiweituo%>                                    
                                    </span></td>                                    
                                    </tr>                                     
                                    <%} %>     
                                    <%} %>
                                     <%-- <tr>
                                    <td height="32" align="right">貨幣：</td>
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
                                    <td width="98" align="center" class="font12bt">第三方情報</td>
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
                                    <td width="260" height="32" align="right" valign="middle"><strong>公文書番号</strong>：</td>
                                    <td width="429" valign="middle">
                                   <%=anjuanhao %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>連絡者</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linkman %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>住所</strong>：</td>
                                    <td width="429" valign="middle">
                                       <%=linkaddress %>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td width="260" height="32" align="right" valign="middle"><strong>電話</strong>：</td>
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
                                      <table width="210" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="10" height="20">&nbsp; </td>
                                          <td width="193" align="center" class="font12bt">ファイルをアップロードする </td>
                                          <td width="7"></td>
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
                                          <td width="260" height="32" align="right"><strong>主体資格証明書：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=zhutifileok%>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>商標登録証コピー：<br />
                                          </strong></td>
                                          <td width="429" align="left">
                                            <%=sbfileok%>
                                          </td>
                                        </tr>
                                       
                                        <tr>
                                          <td width="260" height="32" align="right"><strong>申請書：</strong> </td>
                                          <td align="left" width="429">
                                            <%=shenqingfile%>
                                          </td>
                                        </tr>
                                        
                                       <%if (int.Parse(JiaoFeiType) == 2 || usertype==3)
                                         {
                                             %>                                   
                                        <tr>
                                          <td height="32" align="right"><strong>依頼書：</strong> </td>
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
                                      <table width="489" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="161" height="35">
                                       
                                            <%--<asp:Button ID="Button1" runat="server" Text="" Style="border: 0; cursor: pointer; background: url(images/user_zl_upload.gif); width: 156px; height: 29px;" OnClick="Button1_Click1"  />--%>
                                             
                                       
                                          </td>
                                          <td width="88" align="right"></td>
                                          <td width="140" align="right">&nbsp;<%--<img src="images/user_js_b2.gif" width="86" height="27" />--%>
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
