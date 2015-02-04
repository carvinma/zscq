<%@ Page Language="C#" AutoEventWireup="true" CodeFile="L_M_Trademark.aspx.cs"
    Inherits="L_M_Trademark" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/Calendar.js"></script>
    <script type="text/javascript" src="../js/vcom.js"></script>
    <style type="text/css">
        .pager
        {
            margin: 10px auto 0px auto;
        }
        .pager td
        {
            font-size: 12px;
            padding: 2px;
        }
        .pager td a
        {
            border: solid 1px #578ece;
            padding: 1px 5px 1px 5px;
        }
        #aspPage_input
        {
            margin-bottom: 2px;
        }
    </style>
    <style type="text/css">
        #listDiv a
        {
        }
        #xuanzhong
        {
            color: Red;
        }
        #listDiv a .sp1
        {
            background: url("../images/shengjiang.png") no-repeat scroll 0 0 transparent;
            display: inline-block;
            height: 11px;
            margin-top: 3px;
            overflow: hidden;
            width: 10px;
            background-position: 0 0px;
        }
        #listDiv a .sp2
        {
            background: url("../images/shengjiang.png") no-repeat scroll 0 0 transparent;
            display: inline-block;
            height: 11px;
            margin-top: 3px;
            overflow: hidden;
            width: 10px;
            background-position: 0 -11px;
        }
    </style>
    <script type="text/javascript">
        function IsDigit() {
            return ((event.keyCode >= 48) && (event.keyCode <= 57));
        }
    </script>
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/ShowKeyword.js"></script>
    <script type="text/javascript">
        $(function () {
            var caseNo = $("#hi_CaseNo");
            var applyno = $("#hi_applyno");
            var applyuser = $("#hi_applyuser");
            var memberno = $("#hi_memberno");
            var membername = $("#hi_membername");
            var trademarktype = $("#hi_trademarktype");
            var timelimit = $("#hi_timelimit");
            var casetype = $("#hi_casetype");
            var timeadd = $("#hi_timeadd");
            var status = $("#hi_status");

            if (caseNo.val() == "desc") {
                $("#casenoAsc").hide();
                $("#casenoDesc").show();
            }
            else {
                $("#casenoAsc").show();
                $("#casenoDesc").hide();
            }
            if (applyno.val() == "desc") {
                $("#applynoAsc").hide();
                $("#applynoDesc").show();
            }
            else {
                $("#applynoAsc").show();
                $("#applynoDesc").hide();
            }

            if (applyuser.val() == "desc") {
                $("#applyuserAsc").hide();
                $("#applyuserDesc").show();
            }
            else {
                $("#applyuserAsc").show();
                $("#applyuserDesc").hide();
            }

            if (memberno.val() == "desc") {
                $("#membernoAsc").hide();
                $("#membernoDesc").show();
            }
            else {
                $("#membernoAsc").show();
                $("#membernoDesc").hide();
            }
            if (membername.val() == "desc") {
                $("#membernameAsc").hide();
                $("#membernameDesc").show();
            }
            else {
                $("#membernameAsc").show();
                $("#membernameDesc").hide();
            }
            if (trademarktype.val() == "desc") {
                $("#trademarktypeAsc").hide();
                $("#trademarktypeDesc").show();
            }
            else {
                $("#trademarktypeAsc").show();
                $("#trademarktypeDesc").hide();
            }

            if (timelimit.val() == "desc") {
                $("#timelimitAsc").hide();
                $("#timelimitDesc").show();
            }
            else {
                $("#timelimitAsc").show();
                $("#timelimitDesc").hide();
            }
            if (casetype.val() == "desc") {
                $("#casetypeAsc").hide();
                $("#casetypeDesc").show();
            }
            else {
                $("#casetypeAsc").show();
                $("#casetypeDesc").hide();
            }

            if (timeadd.val() == "desc") {
                $("#timeaddAsc").hide();
                $("#timeaddDesc").show();
            }
            else {
                $("#timeaddAsc").show();
                $("#timeaddDesc").hide();
            }

            if (status.val() == "desc") {
                $("#statusAsc").hide();
                $("#statusDesc").show();
            }
            else {
                $("#statusAsc").show();
                $("#statusDesc").hide();
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
    <input type="hidden" runat="server" id="hi_true" value="0" />
    <input type="hidden" runat="server" id="Hi_Orderby" value="i_Id" />
    <input type="hidden" runat="server" id="Hi_Orderby2" value="desc" />

    <input type="hidden" id="hi_CaseNo" runat="server" value="0" />
    <input type="hidden" id="hi_applyno" runat="server" value="0" />
    <input type="hidden" id="hi_applyuser" runat="server" value="0" />
    <input type="hidden" id="hi_memberno" runat="server" value="0" />
    <input type="hidden" id="hi_membername" runat="server" value="0" />
    <input type="hidden" id="hi_trademarktype" runat="server" value="0" />
    <input type="hidden" id="hi_timelimit" runat="server" value="0" />
    <input type="hidden" id="hi_casetype" runat="server" value="0" />
    <input type="hidden" id="hi_timeadd" runat="server" value="0" />
    <input type="hidden" id="hi_status" runat="server" value="0" />
  
    <input type="hidden" id="ubianhao1" runat="server" value="0" />
    <h1>
        <%if (pageadd)
          {%><span class="action-span"><%--<a href="Shop_A_Product.aspx">添加商标</a>--%></span><%}%>
        <span class="action-span1"><a href="../Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id"
            class="action-span1">- 商标列表 </span>
        <div style="clear: both">
        </div>
    </h1>
    <script type="text/javascript" src="../js/fucties.js"></script>
    <script type="text/javascript" src="../js/listtb.js"></script>
    <div class="form-div">
    </div>
    <div class="list-div" id="listDiv">
        <table width="100%" cellpadding='3' cellspacing='1'>
            <tr>
                <th width="2%">
                 <input name="checkall" id="checkall2" type="checkbox" onclick="SelAll(this)" /> 
                </th>
                <th width="7%">
                商标申请书<br />委托书
                </th>
                <th width="7%" align="center">
                    案件号 <a href="L_M_Trademark.aspx?<%=returnurl %>&caseno=desc"
                        title="倒序" id="casenoAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&caseno=asc"
                            title="正序" id="casenoDesc" style="display: none;"><span class="sp2"></span></a>
                </th>
                <th width="9%">
                    申请号<a href="L_M_Trademark.aspx?<%=returnurl %>&applyno=desc"
                        title="倒序" id="applynoAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&applyno=asc"
                            title="正序" id="applynoDesc"><span class="sp2"></span></a>
                </th>
                <th width="8%">
                    申请人<a href="L_M_Trademark.aspx?<%=returnurl %>&applyuser=desc"
                        title="倒序" id="applyuserAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&applyuser=asc"
                            title="正序" id="applyuserDesc"><span class="sp2"></span></a>
                </th>
                <th width="7%">
                    会员编号<a href="L_M_Trademark.aspx?<%=returnurl %>&memberno=desc"
                        title="倒序" id="membernoAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&memberno=asc"
                            title="正序" id="membernoDesc"><span class="sp2"></span></a>
                </th>
                <th width="7%">
                    会员名称<a href="L_M_Trademark.aspx?<%=returnurl %>&membername=desc"
                        title="倒序" id="membernameAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&membername=asc"
                            title="正序" id="membernameDesc"><span class="sp2"></span></a>
                </th>
                <th width="5%">
                    图样
                </th>
                <th width="5%">
                    类别<a href="L_M_Trademark.aspx?<%=returnurl %>&trademarktype=desc"
                        title="倒序" id="trademarktypeAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&trademarktype=asc"
                            title="正序" id="trademarktypeDesc"><span class="sp2"></span></a>
                </th>
                <th width="7%">
                    期限日
                    <a href="L_M_Trademark.aspx?<%=returnurl %>&timelimit=desc"
                        title="倒序" id="timelimitAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&timelimit=asc"
                            title="正序" id="timelimitDesc"><span class="sp2"></span></a>
                </th>
                <th width="5%">
                    分类<a href="L_M_Trademark.aspx?<%=returnurl %>&lcasetype=desc"
                        title="倒序" id="casetypeAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&lcasetype=asc"
                            title="正序"  id="casetypeDesc"><span class="sp2"></span></a>
                </th>
                <th width="5%">
                    商标<br />详情
                </th>
                <th width="8%">
                    文件操作
                </th>
                 <th width="7%">
                    状态
                    <a href="L_M_Trademark.aspx?<%=returnurl %>&status=desc"
                        title="倒序" id="statusAsc"><span class="sp1"></span></a>
                        <a href="L_M_Trademark.aspx?<%=returnurl %>&status=asc"
                            title="正序"><span class="sp2" id="statusDesc"></span></a>
                </th>
            </tr>
            <asp:Repeater ID="rep_brand" runat="server" OnItemCommand="rep_brand_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td align="center">
                            <input name="inputPageid" onclick="Selbox(this)" type="checkbox" value="<%# Eval("i_Id")%>">
                        </td>
                        
                        <td align="center">
                          <%#upFileInfo(Eval("i_Type"), Eval("ApplyUpBook"), Eval("RenewalApplyUpBook"),0)%><br />
                          <%#upFileInfo(Eval("i_Type"),Eval("AgentUpBook"),Eval("RenewalAgentUpBook"),1)%>
                        </td>
                        <td align="center"> 
                          <a href='<%# Eval("i_Type").ToString()=="0"? "M_E_TradeMark.aspx?id="+ Eval("i_Id"):"M_E_TradeMarkRenewal.aspx?id="+Eval("i_Id")%>'>
                          <%# Eval("CaseNo")%></a>  
                        </td>
                        <td align="center">
                            <%#Eval("RegisteredNo")%>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <%# Eval("ApplyName")%>
                            <br />
                               <a href="../../<%# Eval("Businesslicense") %>" target="_blank">下载1</a>
                               <%# Eval("CardNoPDF") == null ? "<a href='javascript:void(0)'>下载2</a>" : "<a href='../../" + Eval("CardNoPDF") + "' target='_blank'>下载2</a>"%>
                              
                        </td>
                        <td align="center" style="color: #FF0000">
                            <%# Eval("nvc_UserNum")%>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <%# Eval("nvc_Name")%>
                        </td>
                        <td align="center">
                             <a href="../../<%# Eval("TrademarkPattern1") %>" target="_blank">
                             <img alt="" src="../../<%# Eval("TrademarkPattern1") %>" width="50" height="30" /></a>
                        </td>
                        <td align="center">
                            <%# Eval("TrademarkType")%>
                        </td>
                        <td align="center">
                            <%#string.Format("{0:yyyy-MM-dd}",Eval("RenewalDate"))%>
                        </td>
                        <td align="center">
                          <%# Eval("i_Type").ToString() == "0" ? "申请":"续展"%>
                        </td>
                        <td align="center">
                              <a href="M_TrademarkInfo.aspx?id=<%#Eval("i_Id")%>">详情 </a>
                        </td>
                        <td align="center" style="color: #FF0000">
                            <a href='../../<%# Eval("i_Type").ToString()=="0"?  Eval("ApplyBook"):Eval("RenewalApplyBook")%>' title='点击下载' target='_blank'>申请书下载</a>  
                             <br />
                            <a href='../../<%#  Eval("i_Type").ToString()=="0"? Eval("AgentBook"):Eval("RenewalAgentBook")%>' title='点击下载' target='_blank'>委托书下载</a> 
                        </td>
                        <td>
                           <%# GetApplyStatus(Eval("i_Type"),Eval("Status"))%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table cellpadding='3' cellspacing='1'>
            <tr align="left">
                <td bgcolor="#FFFFFF" height="23">
                    <input name="checkall" id="checkall" type="checkbox" onclick="SelAll(this)" />&nbsp;<%if (pagedel)
                    {%><input type="button" id="Button1" runat="server" value="删除" onclick="xwshow()"
                        class="button" /><%} if (pagechu)
                    {%> <%} %>
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: center">
        <table class="pager" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Label ID="Lb_sum" runat="server"></asp:Label>&nbsp;<b style="color: Red;">20</b><asp:Label
                        ID="Label1" runat="server" Text="条/页"></asp:Label>&nbsp;<asp:Label ID="Lb_ye" runat="server"></asp:Label>&nbsp;
                </td>
                <webdiyer:AspNetPager NumericButtonCount="7" ID="aspPage" ShowPageIndexBox="Never"
                    runat="server" ShowFirstLast="true" FirstPageText="首页" LastPageText="末页" PrevPageText="上一页"
                    NextPageText="下一页" ShowInputBox="Always" OnPageChanged="aspPage_PageChanged"
                    PageSize="20" SubmitButtonText="GO" TextAfterInputBox=" " SubmitButtonClass="button"
                    ShowDisabledButtons="False">
                </webdiyer:AspNetPager>
            </tr>
        </table>
    </div>
    <br />
    <%if (reptlist.Items.Count > 0)
      { %><div class="form-div">
          <table cellspacing='1' cellpadding='3'>
              <tr>
                  <th width="2%">
                  </th>
                  <th width="10%">
                      账单号
                  </th>
                  <th width="10%">
                      添加时间
                  </th>
                  <th width="10%">
                      收款时间
                  </th>
                  <th width="10%">
                      交费时间
                  </th>
                  <th width="10%">
                      发送时间
                  </th>
                  <th width="10%">
                      收据时间
                  </th>
                  <th width="10%">
                      备注1
                  </th>
                  <th width="10%">
                      备注2
                  </th>
              </tr>
              <asp:Repeater ID="reptlist" runat="server">
                  <ItemTemplate>
                      <tr>
                          <td height="26" align="center">
                          </td>
                          <td align="center">
                              <%#Eval("nvc_OrderNum")%>
                          </td>
                          <td align="center">
                              <%#Eval("dt_AddOrderTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_ShouKuanTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_JiaoFeiTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_SendInfoTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("dt_KaiJuTime") %>
                          </td>
                          <td align="center">
                              <%#Eval("nvc_Info1") %>
                          </td>
                          <td align="center">
                              <%#Eval("nvc_Info2") %>
                          </td>
                      </tr>
                  </ItemTemplate>
              </asp:Repeater>
          </table>
      </div>
    <%}%>
    <input type="hidden" id="HiddenDel" value="" runat="server" />
    <div id="divbox3" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="40%">
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 15%; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="40%" align="right">
                                <img alt="" width="30" src="../images/caozuo_2.jpg" />
                            </td>
                            <td width="60%" align="left" style="font-size: 14px;">
                                &nbsp;删除成功
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="45%">
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox1" style="position: fixed; _position: absolute; left: 0; top: 223px;
        height: 100px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td width="230px">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="11" height="27" background="../images/ts_bg.jpg">
                                <img src="../images/ts1.jpg" width="11" height="27" />
                            </td>
                            <td align="left" background="../images/ts_bg.jpg" style="color: #FFF; font-size: 14px;
                                line-height: 20px; font-weight: bold;">
                                温馨提示
                            </td>
                            <td width="34" background="../images/ts_bg.jpg">
                                <img alt="取消" src="../images/dingdan2.gif" width="34" height="27" style="cursor: hand;"
                                    onclick="divoperation(2,'1')" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 1px 1px 0px 1px; border-color: #578ece;
                    background: #dfeef5; height: 30px; padding: 5px; font-size: 14px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="20%" align="right" style="text-align: right">
                                <img alt="" width="30" src="../images/caozuo_1.jpg" />
                            </td>
                            <td width="80%" align="left" style="font-size: 14px;">
                                &nbsp;确认要进行删除操作吗？
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="border-style: solid; border-width: 0px 1px 1px 1px; border-color: #578ece;
                    background: #dfeef5; color: Red; padding: 5px; font-size: 14px; text-align: center;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="font-size: 14px;">
                                <a>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click">确认</asp:LinkButton></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="###" style="cursor: hand;" onclick="divoperation(2,'1')">取消</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div id="divbox2" style="position: fixed; _position: absolute; left: 0; top: 250px;
        height: 40px; text-align: center; width: 100%; display: none;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="border: 1px solid #578ece; height: 30px; background: #dfeef5; color: Red;
                    padding: 5px; width: 200px; font-size: 16px;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="25%" align="right">
                                <img alt="" width="30" src="../images/caozuo_3.jpg" />
                            </td>
                            <td width="75%" align="left" style="font-size: 14px;">
                                &nbsp;请选中您要删除的记录
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" language="javascript">
        function divoperation(ctype, divid)//操作div
        {
            if (ctype == 2) {
                document.getElementById("divbox" + divid).style.display = "none";
            }
            else {
                for (var i = 1; i < 4; i++) {
                    if (i == divid) {
                        document.getElementById("divbox" + i).style.display = "";
                    }
                    else {
                        document.getElementById("divbox" + i).style.display = "none";
                    }
                }
            }
        }
        if (document.getElementById('HiddenDel').value == "del") {
            divoperation(1, '3');
            setTimeout("divoperation(2,'3')", 1500); //1.5秒
        }
        function xwshow() {
            var inputs = document.getElementsByName("inputPageid");
            var jb = 0;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == true) {
                    jb = 1;
                }
            }
            if (jb == 0) {
                divoperation(1, '2');
                setTimeout("divoperation(2,'2')", 1500); //1.5秒
            }
            else {
                divoperation(1, '1');
            }
        }
    </script>
    <div id="div_a" runat="server">
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    //    window.onload=function()
    //    {
    if (isIE) {
        window.onscroll = divIE6;
    }
    //    }
    function divIE6() {
        var top1 = document.documentElement.scrollTop;
        document.getElementById("divbox1").style.top = (top1 + 223) + 'px';
        document.getElementById("divbox3").style.top = (top1 + 250) + 'px';
        document.getElementById("divbox2").style.top = (top1 + 250) + 'px';
    }
</script>
<script type="text/javascript" src="js/ss.js"></script>
<script type="text/javascript">
    function strnull(ftype, shu) {
        var isok = document.getElementById('hi_true');
        if (isok.value == "1") {
            var str_ps = document.getElementById('font_' + ftype + shu);
            var text_ps = document.getElementById('text_' + ftype + shu);
            str_ps.style.display = "none";
            text_ps.style.display = "";
        }
    }
    function textnull(ftype, shu) {
        var str_ps = document.getElementById('font_' + ftype + shu);
        var text_ps = document.getElementById('text_' + ftype + shu);
        if (!(document.activeElement.id == ('text_' + ftype + shu))) {
            str_ps.style.display = "";
            text_ps.style.display = "none";
        }
    }
    function textok(pid, ftype, shu, tvalue) {
        var str_ps = document.getElementById('font_' + ftype + shu);
        var text_ps = document.getElementById('text_' + ftype + shu);
        if (parseFloat(str_ps.innerHTML) != parseFloat(text_ps.value)) {
            var rand = Math.floor(Math.random() * 1000000);
            var cs = "PageType=UpdateProductInfo&PId=" + pid + "&UType=" + ftype + "&PValue=" + tvalue + "&n=" + rand;
            $.ajax({ type: "get", url: "Ajax_Handler.aspx", data: cs,
                success: function (data) {
                    if (data != "NO") {
                        str_ps.innerHTML = tvalue;
                    }
                    else {
                        alert('发生意外!');
                    }
                }
            });
        }
        else {

        }
        str_ps.style.display = "";
        text_ps.style.display = "none";
    }
</script>
<script type="text/javascript" language="javascript">
    function SelAll(checkboxobj) {
        var inputs = document.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox") {
                inputs[i].checked = checkboxobj.checked;
            }
        }
    }
    function Selbox(obj) {
        var inputs = document.getElementsByName("inputPageid");
        var checkall = document.getElementById("checkall");
        var checkall2 = document.getElementById("checkall2");
        if (obj.checked == false) {
            checkall.checked = false;
            checkall2.checked = false;
        }
        else {
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked == false) {
                    checkall.checked = false;
                    checkall2.checked = false;
                    return;
                }
                else {
                    checkall.checked = true;
                    checkall2.checked = true;
                }
            }
        }
    }
</script>
<script type="text/javascript">
    document.getElementById('text_pageindex').onkeydown = function (e) {
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
            document.getElementById('Button3').click();
        }
    }
</script>
