<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop_A_EmailModel.aspx.cs" Inherits="Shop_Manage_Shop_A_Dealer" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>                     
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
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
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server"> 
                    <input type="hidden" id="hd1" runat="server" value="" />
    <h1>
        <span class="action-span"><% if (pageview){ %><a href="Shop_M_EmailModel.aspx?<%=returnurl %>">邮件模板列表</a><%} %></span> <span class="action-span1"><a
                href="Shop_Index_Main.aspx">管理中心</a> </span><span id="search_id" class="action-span1">
                    - 添加邮件模板 </span>
        <div style="clear: both">
        </div>
    </h1>

    <script type="text/javascript" src="js/fucties.js"></script>

    <script type="text/javascript" src="js/listtb.js"></script>

    <input type="hidden" name="types" value="addname"/>
    <div class="list-div" id="listDiv">
        <table cellspacing='1' cellpadding='3'>
            <tr>
                <th colspan="2">
                    添加邮件模板
                </th>
            </tr>
            <tr>
                <td style="width:10%;" align="right">语言版本：</td>
                <td>
                    <asp:DropDownList ID="Drp_LanguageList" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">模板名称：</td>
                <td>
                <input id="admin_realname" type="text" class="input" style=" width:210px; height: 18px; line-height: 18px;"
                 size="20" runat="server" onblur="checknull('admin_realname','fadmin_realname')" />&nbsp;<font color="red">*</font>&nbsp;<font
                  id="fadmin_realname" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写名称</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    排序编号：
                </td>
                <td align="left">
                    <input id="sub_frommobi" type="text" class="input" style=" height: 18px; line-height: 18px;" onblur="checknull('sub_frommobi','f_sub_frommobi')"
                     onkeyup="value=value.replace(/[^\d]/g, '')" onbeforepaste="clipboardData.setData( 'text',clipboardData.getData( 'text').replace(/[^\d]/g, ''))"
                    value="" size="10" maxlength="60" oncopy="return false" onpaste="return false" runat="server"/>&nbsp;<font color="red">*</font>&nbsp;<font
                  id="f_sub_frommobi" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写排序编号</font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    模板标题：
                </td>
                <td align="left">
                    <input id="text_title" type="text" class="input" style="width: 80%; height: 18px;
                        line-height: 18px;" value="" runat="server" onblur="checknull('text_title','ftext_title')"/>&nbsp;<font color="red">*</font>&nbsp;<font
                  id="ftext_title" class="alertfont" style="display:none;"><img alt="警告" src="images/caozuo_3.jpg"
                                    width="15" />请填写模板标题</font>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    模板内容：
                </td>
                <td style="width:90%;" >
                    <script id="uecontent" type="text/plain" name="myContent">
                        <%=content%>
                    </script>
                    <script type="text/javascript">
                        var editor = new baidu.editor.ui.Editor();
                        editor.render('uecontent');
                    </script>
                </td>
            </tr>
            <tr>
                <td height="25" align="center">&nbsp;</td>
                <td height="22" align="left"><% if ((pageadd && hd1.Value == "0") || (pageupdate && hd1.Value != "0"))
                                                { %><asp:Button ID="but_add" runat="server" Text="提交" CssClass="button" OnClick="but_add_Click"
                        OnClientClick="return check()" /><%} %><% if (hd1.Value != "0")
                                                                  { %><input
                        type="button" class="button" id="back" value="返回" onclick="javascript:window.location='Shop_M_EmailModel.aspx?<%=returnurl %>';" /><%} %>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="js/ss.js"></script>
    </form>
    <div id="div_a" runat="server">
    </div>
    <!-- #include file="push.html" -->
</body>
</html>
<script type="text/javascript">
    if(document.getElementById("hd1").value!="")
    {
        document.getElementById("back").style.display="";
    }
    else
    { 
        document.getElementById("back").style.display="none";
    }
</script>
<script type="text/javascript">
var dianji=0;
function check() 
{
    if(dianji==0)
    {
        dianji=1;
    }
    var flag = true;
    document.getElementById("fadmin_realname").style.display="none";
    document.getElementById("ftext_title").style.display = "none";
    document.getElementById("f_sub_frommobi").style.display = "none";
    if (document.getElementById("text_title").value == "") 
    {
        document.getElementById("ftext_title").style.display="";
        document.getElementById("text_title").focus();
        flag= false;
    }
    //f_sub_frommobi
    if (document.getElementById("sub_frommobi").value == "") {
        document.getElementById("f_sub_frommobi").style.display = "";
        document.getElementById("sub_frommobi").focus();
        flag = false;
    }
    if (document.getElementById("admin_realname").value == "") 
    {
        document.getElementById("fadmin_realname").style.display="";
        document.getElementById("admin_realname").focus();
        flag= false;
    }
    return flag;
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