<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TradeMarkWriteSample.aspx.cs" Inherits="Shop_Manage_NewManage_TradeMarkWriteSample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server"><title></title>
    <link href="../styles/general.css" rel="stylesheet" type="text/css" />
    <link href="../styles/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/vcom.js"></script>

    <style type="text/css">
        .pager
        {
        	margin:10px auto 0px auto;
        }
        .pager td
        {
            font-size: 12px;
            padding: 2px;
        }
        .pager td a
        {
        	border:solid 1px #578ece;
        	padding:1px 5px 1px 5px;
      	}
      	#aspPage_input
        {
            margin-bottom:2px;   
      	}
    </style>
    
    <script src="../js/jquery-1.4.4.js" type="text/javascript"></script>
      <script type="text/javascript">
          $(function () {
              $(".numberinput").bind("input propertychange", function () {
                  var obj = $(this).val();
                  obj = obj.replace(/[^\d.]/g, ""); //清除“数字”和“.”以外的字符
                  obj = obj.replace(/^\./g, ""); //验证第一个字符是数字而不是.
                  obj = obj.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的.
                  obj = obj.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
                  $(this).val(obj);
              }).bind("paste", function () { //CTR+V事件处理 
                  var obj = $(this).val();
                  obj = obj.replace(/[^\d.]/g, "").replace(/^\./g, "").replace(/\.{2,}/g, ".");
                  obj = obj.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
                  $(this).val(obj);
              }).css("ime-mode", "disabled");
          });
          function IsDigit() {
              return (((event.keyCode >= 48) && (event.keyCode <= 57)) || ((event.keyCode >= 96) &&
(event.keyCode <= 105)) || event.keyCode == 8 || event.keyCode == 46);
          }
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>
        <span class="action-span"></span> <span class="action-span1">
            <a href="../Shop_Index_Main.aspx">费用设置</a> </span><span id="search_id" class="action-span1">
                - 商标描述填写示例 </span>
        <div style="clear: both">
        </div>
    <asp:HiddenField ID="HiddenID" runat="server" /> 
    </h1>

    <script type="text/javascript" src="../js/fucties.js"></script>

    <script type="text/javascript" src="../js/listtb.js"></script>

    <div class="form-div">
       <table width="100%"><tr><td align="center">
                商标描述填写示例
                <input type="text" id="txtSample" maxlength="100" value="" runat="server" 
                    size="40" />
       </td></tr></table>
        </div>
    <input type="hidden" id="HiddenDel" value="" runat="server" />
     <div class="form-div" id="Div1">
     <table width="100%"><tr><td align="center">
        <asp:Button ID="btnOK" runat="server" Text="确定" CssClass="button" 
            onclick="btnOK_Click" />
            </td></tr></table>
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
    </div></form>
   <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
</body>
</html>
<script type="text/javascript" src="../js/ss.js"></script>