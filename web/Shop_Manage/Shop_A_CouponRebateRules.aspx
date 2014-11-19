<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_A_CouponRebateRules.aspx.cs" Inherits="ihome_manage_shop_yhjclass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    
    
    
    <title></title>
    <link href="styles/general.css" rel="stylesheet" type="text/css" />
    <link href="styles/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .alertfont
    {
	    border: solid 1px #fe8686;
	    padding: 1px;
	    background: #dfeef5;
	    color: #fe4343;
    }
    .alertfont img
    {
	    margin-bottom:-3px;
    }
    </style>
    <style type="text/css">
    .divitem
    {
    	 height:30px; line-height:30px;
    }
    .brands label
    {
    	  margin-right:5px;
    }
    </style>
    <script type="text/javascript" src="js/vcom.js"></script>
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
    <script type="text/javascript">
    function IsDigit()
    {
          return ((event.keyCode >= 48) && (event.keyCode <= 57));
    }
    </script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <input type="hidden" runat="server" id="Hi_Id" value="0" />
    <input type="hidden" runat="server" id="Hi_cb" value="" />
    <input type="hidden" runat="server" id="Hi_text" value="" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>
        <span class="action-span"><a href="Shop_M_CouponRebateRules.aspx?<%=returnurl %>">优惠券购返规则列表</a></span><span class="action-span1"><a href="Shop_Index_Main.aspx">管理中心</a> </span><span
            id="search_id" class="action-span1">- 优惠券购返规则添加 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>
    
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加优惠券购返规则
                </th>
            </tr>
            <tr>
                <td width="15%" height="25" align="right" valign="top">计算范围：</td>
                <td width="85%"><asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DDL_Type" runat="server" AutoPostBack="True"
                            onselectedindexchanged="DDL_Type_SelectedIndexChanged">
                            <asp:ListItem Value="0">请选择</asp:ListItem>
                            <%--<asp:ListItem Value="1">品牌</asp:ListItem>--%>
                            <asp:ListItem Value="3">全场</asp:ListItem>
                        </asp:DropDownList>&nbsp;<font color="#FF0000">*</font
                >&nbsp;<font id="fDDL_Type" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择使用范围</font><br />
                        <asp:CheckBoxList ID="DDL_BrandOrCategory" runat="server" 
                            AppendDataBoundItems="True" Visible="false" RepeatDirection="Horizontal" 
                            RepeatLayout="Flow" CssClass="brands divitem">
                        </asp:CheckBoxList>
                    </ContentTemplate>
                    </asp:UpdatePanel></td>
            </tr>
            <tr>
                <td height="25" align="right">购物满：</td>
                <td><input type="text" runat="server" id="text_where" class="inputs60text" onkeypress="event.returnValue=IsDigit();" onblur="checknull('text_where','ftext_where')"/>&nbsp;元赠送&nbsp;<font color="#FF0000">*</font>&nbsp;<font id="ftext_where"
                  class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请填写购物满金额</font><font id="fHi_cb"
                  class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg" width="15" />请选择优惠券种类</font></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><div class="coupontypelist"><%= div_CouponType %></div></td>
            </tr>
            <tr>
                <td height="25" align="right">启用：</td>
                <td><input type="checkbox" runat="server" id="cb_State" checked /></td>
            </tr>
            <tr>
                <td height="25" align="center">&nbsp;</td>
                <td height="22" align="left">
                    <%if ((pageadd && Hi_Id.Value == "0") || (pageupdate && Hi_Id.Value != "0"))

          {%><asp:Button ID="btnadd" runat="server" Text="提交" CssClass="button"
                        OnClick="btnadd_Click" OnClientClick="return checkaddtotime()" /><%}%><% if (Hi_Id.Value != "0")
                                                                                                 { %><input type="button" class="button" value="返回"
                                                                                                  onclick="javascript:window.location='Shop_M_CouponRebateRules.aspx?<%=returnurl %>'" /><%} %>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="js/ss.js"></script>
    <div id="div_a" runat="server"></div>
    </form><div id="ddtx" style="position:fixed;_position:absolute; right:0; bottom:-80px; z-index:9999; display:none;">
<table width="251" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="79" align="left" valign="top">
    <table width="251" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="27" align="left" valign="top">
        <table width="251" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="217" height="27" align="left"><img src="images/dingdan1.gif" width="217" height="27" /></td>
            <td width="34" align="left"><img onclick="txyc()" style="cursor:pointer;" src="images/dingdan2.gif" width="34" height="27" /></td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td height="52" background="images/dingdan4.gif">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="85"></td>
            <td width="73" height="34" id="ddsl"></td>
            <td width="93" align="left" style="font-size:12px;"><a onmousemove="gb(1)" onmouseout="gb(0)" href="Shop_M_Order.aspx?status=0">点击查看</a></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div></body>
</html><script src="js/OrderRemind.js" type="text/javascript"></script>
<script type="text/javascript">
var indx=1;
$(function(){});
function aaa()
{
    var rand = Math.floor(Math.random() * 1000000);
    var kkk = "cc=4&n=" + rand;
    $.ajax({
        type: "GET",
        url: "Ajax_tuisong.aspx",
        data: kkk,
        success: function(data) 
        {
            if(parseInt(data)>0)
            {
                juli=-80;
                juli2=0;
                document.getElementById("ddtx").style.display="";
                $("#ddsl").html(""+data+"");
                if(isIE)
                {
                    divshow();
                }
                else
                {
                    txxs();
                }
            }
        }
    });
}
</script>
<script type="text/javascript">
var gxvalue=document.getElementById('Hi_cb');
var rqvalue=document.getElementById('Hi_text');
if(gxvalue.value!="")
{
    var texts1=rqvalue.value.split(',');
    var checkboxs1=document.getElementsByName('cb');
    var j=0;
    for(i=0;i<checkboxs1.length;i++)
    {
        if((gxvalue.value+",").indexOf(","+checkboxs1[i].value+",")>-1)
        {
            checkboxs1[i].checked=true;
            document.getElementById('text_zs'+checkboxs1[i].id.replace('cb','')).value=texts1[j+1];
            j++;
        }
    }
}
function clickcheckbox()
{
    var s="";
    var t="";
    var cbs=document.getElementsByName('cb');
    for(var i=0;i<cbs.length;i++)
    {
        if(cbs[i].checked)
        {
            s+=","+cbs[i].value;
            t+=","+document.getElementById('text_zs'+cbs[i].id.replace('cb','')).value
        }
    }
    gxvalue.value=s;
    rqvalue.value=t;
}
</script>
<script language="JavaScript" type="text/JavaScript">
var dianji=0;
function checkaddtotime()
{
    if(dianji==0)
    {
        dianji=1;
    }
    var ret=true;
    clickcheckbox();
    document.getElementById('fDDL_Type').style.display="none";
    document.getElementById('ftext_where').style.display="none";
    document.getElementById('fHi_cb').style.display="none";
    if (document.getElementById('Hi_cb').value=="")
    {
        document.getElementById('fHi_cb').style.display="";
        ret= false;
    }
    if (document.getElementById('text_where').value=="")
    {
        document.getElementById('ftext_where').style.display="";
        document.getElementById('text_where').focus();
        ret= false;
    }
    if (document.getElementById('DDL_Type').value=="0")
    {
        document.getElementById('fDDL_Type').style.display="";
        document.getElementById('DDL_Type').focus();
        ret= false;
    }
    else if(document.getElementById('DDL_Type').value=="1")
    {
        var shifouxuanze=false;
        var inputs = document.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) 
        {
            if (inputs[i].type == "checkbox") 
            {
                if(inputs[i].id.indexOf('DDL_BrandOrCategory_')>-1)
                {
                    if(inputs[i].checked)
                    {
                        shifouxuanze=true;
                        break;
                    }
                }
            }
        }
        if(!shifouxuanze)
        {
            document.getElementById('fDDL_Type').style.display="";
            document.getElementById('DDL_Type').focus();
            ret= false;
        }
    }
    return ret;
}
function checknull(inputid,fontid)
{
    if(dianji==1)
    {
        if(document.getElementById(inputid).value!="")
        {
            document.getElementById(fontid).style.display="none";
        }
        else
        {
            document.getElementById(fontid).style.display="";
        }
    }
}
</script>
