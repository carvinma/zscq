<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_World_sb.aspx.cs" Inherits="Shop_Manage_shop_addhw" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>  
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <script src="js/jquery-1.4.4.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/ShowKeyword.js"></script>
        <style type="text/css">

 p.MsoNormal
	{margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
 .shape {behavior:url(#default#VML);}
    </style>
</head>
<body>
    <form id="form1" runat="server">
  
    <input type="hidden" id="Hi_TId" name="Hi_TId" runat="server" value="0" />
    <input type="hidden" id="Hi_Matching" runat="server" value="" />     
    <input type="hidden" id="Hi_Guige" runat="server" value="" /> 
    <input type="hidden" id="Hi_ffTId" name="Hi_ffTId" runat="server" value="0" />  

      <div style="width:796px; text-align:center;">
      <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatLayout="Table">
        <ItemTemplate>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<table border="0" cellspacing="1" cellpadding="1" style="background-color:#C5C5C5;">
  <tr>
    <td height="88" colspan="5" align="center" bgcolor="#FFFFFF"><span style="font-size:22.0pt;mso-bidi-font-size:
12.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:
&quot;Times New Roman&quot;"><strong>商 标 续 展 注 册 申 请 书</strong></span> </td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">申请人名称： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_SBRegName") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">申请人Address： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_SBRegAddress") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">Zip code： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_SBPostcode") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">Contact person： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_DLName") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">Tel(含地区号)： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_DLTel") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">Fax： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_DLFaxnumber") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">代理组织名称： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_DLZuzhiName") %></span></td>
  </tr>
  <tr>
    <td height="30" colspan="5" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">Trademark Registration number： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_SBRegNum") %></span></td>
  </tr>
  <tr>
    <td width="162" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">class： </span></td>
    <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体"><%#Eval("nvc_SBType") %></span></td>
  </tr>
  <tr>
    <td height="105" colspan="5" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">申请人章戳（签字）：</span></td>
    <td width="117" height="30" align="left" bgcolor="#FFFFFF"></td>
    <td width="141" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">代理组织章戳：</span></td>
    <td width="140" height="30" align="left" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td height="30" colspan="2" bgcolor="#FFFFFF"></td>
    <td width="117" height="30" align="left" bgcolor="#FFFFFF"></td>
    <td width="141" height="30" align="right" bgcolor="#FFFFFF"><span style="font-size:14.0pt;
mso-bidi-font-size:12.0pt;font-family:楷体_GB2312;mso-hansi-font-family:宋体">代理人签字：</span></td>
    <td width="140" height="30" align="left" bgcolor="#FFFFFF"></td>
  </tr>
</table>
</body>
</html>

    </ItemTemplate>
        </asp:DataList> 
         </div>
       <table style="width:400px;">  <tr>
                <td align="right" style="width:300px;"></td>
                <td>  
                   <%if (jiaofeitype != 0)
                     {
                         if (jiaofeitype == 1)
                         { %> <asp:Button ID="Button1" runat="server" Text=" 商标续展注册申请书" CommandName="1" OnCommand="Button_Click"/>
                      <%} if (jiaofeitype == 2)
                         {%>
                            <asp:Button ID="Button2" runat="server" Text="生成商标代理委托书"  CommandName="2" OnCommand="Button_Click" />   
                    <%}
                     }%>
                       </td>
            </tr> </table>
   
  
    
    
    <img style="position: absolute; display: none; border: solid 2px #578ece;" id="xsimg"
        alt="" src="images/noimage.jpg" width="164" />

    <script type="text/javascript" language="JavaScript" src="../js/moverobj.js"></script>
    <script type="text/javascript" src="js/ss.js"></script>

    <div id="div_a" runat="server">
    </div>
    </form>
    
</body>
</html>




