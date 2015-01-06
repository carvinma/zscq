<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BrandHelpDoc.aspx.cs" Inherits="BrandHelpDoc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .mainbody
        {
            display: block;
            font-size: 14px;
            color: #000;
            margin-bottom: 30px;
            margin-top: 30px;
            width: 860px;
            margin: 0 auto;
            padding: 30px 30px 40px;
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
        }
        .mainbody .top {
	margin-bottom:40px;
	padding-bottom:12px;
	border-bottom:1px dashed #dadada;
}
.topword{
	font-size:22px;
	line-height:22px;
	text-align:left;
}
.topbtn{
	text-align:right;
}
.topbtn input{
	
	border:0px none;
	width:85px;
	height:23px;
}
.content{
	padding-bottom:20px;
}
    </style>
    <script type="text/javascript">
        function close_this() {
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mainbody">
        <div class="top">
            <p class="topbtn">
                <a href="javascript:void(0)" class="BtnShowhref" style="width:85px;display: inline-block;" onclick="close_this()">关 闭</a>
                <input type="button" class="BtnShowhref" value="关闭" onclick="close_this()" style="display:none"/>
            </p>
        </div>
        <div class="top">
            <p class="topword">
                商标注册网上申请填写要求</p>
        </div>
        <div class="content">
        </div>
        <div class="foot">
         <div style="min-height: 355px;*+height:100%;_height:355px;">
           <asp:Literal ID="Ltl_LoginInfo" runat="server" ></asp:Literal>
           </div>
        </div>
        <div class="top">
        <p class="topbtn">
         <a href="javascript:void(0)" class="BtnShowhref" style="width:85px;display: inline-block;" onclick="close_this()">关 闭</a>
          <input type="button" class="BtnShowhref" style="display:none" value="关闭" onclick="close_this()"/>
        </p>
      </div>
    </div>
    </form>
</body>
</html>
