<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_World_sbweituo.aspx.cs" Inherits="Shop_Manage_shop_addhw" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
      <asp:Repeater ID="Repeater1" runat="server">
<%-- <asp:DataList ID="DataList1" runat="server" Width="710" height="0" RepeatLayout="Flow">--%>
        <ItemTemplate>
      
          
     <table width="710" cellspacing="0" cellpadding="0" style="border:none">
  <tr>
    <td height="63" align="center" valign="top" style="line-height:20.0pt;"><b style="font-size:18.0pt">商标代理委托书</b><br><b style="mso-bidi-font-weight:normal"><span style="font-size:18.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
KO" lang="EN-US" xml:lang="EN-US">Trademark </span><span style="font-size:18.0pt" lang="EN-US" xml:lang="EN-US">Power of Attorney</span></b></td>
  </tr>
  <tr>
    <td align="left" valign="top"><table align="left" border="1" cellpadding="0" cellspacing="0" 
        class="MsoNormalTable" 
        style="width:457.5pt;border-collapse:collapse;border:none;
 mso-border-alt:solid windowtext .5pt;mso-yfti-tbllook:480;mso-table-lspace:
 9.0pt;margin-left:6.75pt;mso-table-rspace:9.0pt;margin-right:6.75pt;
 mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;
 mso-table-left:11.2pt;mso-table-top:7.9pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
 mso-border-insideh:.5pt solid windowtext;mso-border-insidev:.5pt solid windowtext" 
        width="610">
        <tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:19.35pt">
            <td rowspan="4" style="width:64.2pt;border:solid windowtext 1.0pt;
  border-bottom:none;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:19.35pt" width="86">
                <p align="left" class="MsoNormal" style="text-align:left;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:11.25pt;
  mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;
  font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:
  &quot;Times New Roman&quot;">委托人信息</span><span lang="EN-US" style="font-size:9.0pt;
  mso-fareast-font-family:Batang;mso-fareast-language:KO"><o:p></o:p></span></p>
                <p align="left" class="MsoNormal" style="text-align:left;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:11.25pt;
  mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Information of Applicant</span><span 
                        lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td rowspan="2" style="width:62.15pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.35pt" width="83">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">委托人</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Applicant</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
            </td>
            <td colspan="5" style="width:331.15pt;border-top:solid windowtext 1.0pt;
  border-left:none;border-bottom:none;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.35pt" valign="bottom" width="442">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="mso-bidi-font-size:10.5pt"><o:p>&nbsp;<%#Eval("nvc_SBRegName") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:1;height:19.35pt">
            <td colspan="5" style="width:331.15pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.35pt" valign="top" width="442">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="mso-bidi-font-size:10.5pt"><o:p>&nbsp;<%#Eval("nvc_SBRegEnName") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:2;height:19.0pt">
            <td rowspan="2" style="width:62.15pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:19.0pt" 
                width="83">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">Address</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Address<o:p></o:p></span></p>
            </td>
            <td colspan="5" style="width:331.15pt;border:none;
  border-right:solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.0pt" valign="bottom" width="442">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="mso-bidi-font-size:10.5pt;font-family:宋体"><o:p>&nbsp;
                    <%#Eval("nvc_SBRegAddress") %>
                    
                    
                    </o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:3;height:41.05pt">
            <td colspan="5" style="width:331.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:41.05pt" width="442">
                <p class="a" 
                    style="margin-bottom:5.65pt;line-height:normal;tab-stops:40.0pt 80.0pt 120.0pt 160.0pt 200.0pt 240.0pt 280.0pt 320.0pt 360.0pt 400.0pt 440.0pt 480.0pt 520.0pt 560.0pt 600.0pt 640.0pt 680.0pt 720.0pt 760.0pt 800.0pt 840.0pt 880.0pt 920.0pt 960.0pt 1000.0pt 1040.0pt 1080.0pt 1120.0pt 1160.0pt 1200.0pt 1240.0pt 1280.0pt 1320.0pt 1360.0pt 1400.0pt 1440.0pt 1480.0pt 1520.0pt 1560.0pt">
                    <span lang="EN-US" style="font-size:10.5pt;font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:
  宋体;mso-fareast-language:ZH-CN"><o:p>&nbsp;<%#Eval("nvc_SBRegEnAddress") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:4;height:15.5pt">
            <td rowspan="2" style="width:64.2pt;border-top:none;border-left:solid windowtext 1.0pt;
  border-bottom:none;border-right:solid windowtext 1.0pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:15.5pt" width="86">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td rowspan="2" style="width:62.15pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.5pt" 
                width="83">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">国籍</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Nationality<o:p></o:p></span></p>
            </td>
            <td colspan="3" style="width:152.55pt;border:none;
  border-right:solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.5pt" valign="bottom" width="203">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="mso-bidi-font-size:10.5pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td rowspan="2" style="width:76.3pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.5pt" 
                width="102">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">Contact person</span><span lang="EN-US" 
                        style="font-size:9.0pt;mso-fareast-font-family:Batang"><o:p></o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Contact person<o:p></o:p></span></p>
            </td>
            <td style="width:102.3pt;border:none;border-right:
  solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:15.5pt" valign="bottom" width="136">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;<%#Eval("nvc_Name")%></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:5;height:15.45pt">
            <td width="203" height="30" colspan="3" valign="top" style="width:152.55pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.45pt">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="mso-bidi-font-size:10.5pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td style="width:102.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.45pt" valign="top" width="136">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;<%#Eval("nvc_EnName")%></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:6;height:15.5pt">
            <td rowspan="2" style="width:64.2pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:15.5pt" width="86">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td rowspan="2" style="width:62.15pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.5pt" 
                width="83">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">Tel</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Tel. No.<o:p></o:p></span></p>
            </td>
            <td colspan="3" style="width:152.55pt;border:none;
  border-right:solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.5pt" valign="bottom" width="203">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp; <%#Eval("nvc_TelPhone")%></o:p></span></p>
            </td>
            <td rowspan="2" style="width:76.3pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:15.5pt" 
                width="102">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">邮编</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p> </o:p></span></p>
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">ZIP Code<o:p> </o:p></span></p>
            </td>
            <td style="width:102.3pt;border:none;border-right:
  solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:15.5pt" valign="bottom" width="136">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;<%#Eval("nvc_ZipCode") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:7;height:15.45pt">
            <td colspan="3" style="width:152.55pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.45pt" valign="top" width="203">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp; <%#Eval("nvc_TelPhone")%></o:p></span></p>
            </td>
            <td style="width:102.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:15.45pt" valign="top" width="136">
                <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;<%#Eval("nvc_ZipCode") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:8;height:31.2pt">
            <td style="width:64.2pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" width="86">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">受托人</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Agent<o:p></o:p></span></p>
            </td>
            <td colspan="6" style="width:393.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:31.2pt" 
                width="524">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">Global Patent Annuity Fees Payment Agency, Co., Ltd.</span><span lang="EN-US" 
                        style="font-size:9.0pt"><o:p></o:p></span></p>
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Global Patent Annuity Fees Payment 
                    Agency Co.,Ltd<b style="mso-bidi-font-weight:normal"><o:p></o:p></b></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:9;height:27.45pt">
            <td rowspan="2" style="width:64.2pt;border-top:none;border-left:solid windowtext 1.0pt;
  border-bottom:none;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:27.45pt" width="86">
                <p align="left" class="MsoNormal" style="text-align:left;line-height:12.0pt;
  mso-line-height-rule:exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">商标信息</span><span lang="EN-US" 
                        style="font-size:9.0pt"><o:p></o:p></span></p>
                <p align="left" class="MsoNormal" style="text-align:left;line-height:12.0pt;
  mso-line-height-rule:exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">Information of Trademark<o:p></o:p></span></p>
                <p align="left" class="MsoNormal" style="text-align:left;line-height:12.0pt;
  mso-line-height-rule:exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td 
                width="223" height="51" colspan="2" style="width:166.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">商标</span><span lang="EN-US" 
                        style="font-size:9.0pt">/Trademark<o:p></o:p></span></p>
            </td>
            <td colspan="4" style="width:226.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt" 
                width="302">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                  <span lang="EN-US" style="mso-bidi-font-size:10.5pt;font-family:&quot;MS Mincho&quot;;
  mso-fareast-font-family:宋体"><o:p>&nbsp;</o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:10;height:21.8pt">
            <td colspan="2" style="width:166.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.8pt" 
                width="223">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">申请号</span><span lang="EN-US" 
                        style="font-size:9.0pt">/</span><span 
                        style="font-size:9.0pt;font-family:
  宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">注册号</span><span 
                        lang="EN-US" style="font-size:9.0pt">/Appln. /Reg. No.<o:p></o:p></span></p>
            </td>
            <td colspan="4" style="width:226.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.8pt" 
                width="302">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;<%#Eval("nvc_SBRegNum") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:11;height:21.75pt">
            <td style="width:64.2pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
  mso-border-right-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:21.75pt" width="86">
                <p align="left" class="MsoNormal" style="text-align:left;line-height:12.0pt;
  mso-line-height-rule:exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td colspan="2" style="width:166.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.75pt" 
                width="223">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">商品</span><span lang="EN-US" 
                        style="font-size:9.0pt">/</span><span 
                        style="font-size:9.0pt;font-family:
  宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">服务类别</span><span 
                        lang="EN-US" style="font-size:9.0pt">/Class of Goods/Services <o:p> </o:p>
                    </span>
                </p>
            </td>
            <td colspan="4" style="width:226.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:21.75pt" 
                width="302">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="mso-bidi-font-size:10.5pt"><o:p>&nbsp;<%#Eval("nvc_SBType") %></o:p></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:12;height:32.1pt">
            <td style="width:64.2pt;border-top:none;border-left:solid windowtext 1.0pt;
  border-bottom:none;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:32.1pt" width="86">
                <p align="left" class="MsoNormal" style="margin-bottom:6.2pt;mso-para-margin-bottom:
  .4gd;text-align:left;line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">委托事项<span 
                        lang="EN-US">Purpose of Attorney<o:p></o:p></span></span></p>
            </td>
            <td colspan="6" style="width:393.3pt;border:none;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-right-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:32.1pt" width="524">
                <p class="MsoNormal" style="line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">兹委托 
                    Global Patent Annuity Fees Payment Agency, Co., Ltd. 代为办理上述商标之如下"√"事宜：<span lang="EN-US"><o:p></o:p></span></span></p>
                <p class="MsoNormal" style="margin-bottom:6.2pt;mso-para-margin-bottom:.4gd;
  line-height:11.0pt;mso-line-height-rule:exactly;mso-element:frame;mso-element-frame-hspace:
  9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;
  mso-element-anchor-horizontal:margin;mso-element-left:11.25pt;mso-element-top:
  7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">Hereby entrust </span><span lang="EN-US" 
                        style="font-size:9.0pt"><span style="mso-spacerun:yes">&nbsp;</span>Global Patent 
                    Annuity Fees Payment Agency Co.,Ltd</span><b 
                        style="mso-bidi-font-weight:normal"><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体"> .</span></b><span 
                        lang="EN-US" style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体"> 
                    to act as my /our agent for the following "</span><span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:宋体;
  mso-hansi-font-family:宋体;mso-bidi-font-family:宋体;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings"><span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">ü</span></span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">" matter</span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">：<span 
                        lang="EN-US"><o:p></o:p></span></span></p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:13;height:260.95pt">
            <td style="width:64.2pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:260.95pt" valign="top" width="86">
                <p class="MsoNormal" style="line-height:12.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt"><o:p>&nbsp;</o:p></span></p>
            </td>
            <td colspan="3" style="width:193.2pt;border:none;
  border-bottom:solid windowtext 1.0pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:260.95pt" valign="top" width="258">
                <p align="left" class="MsoNormal" style="margin-bottom:4.65pt;mso-para-margin-bottom:
  .3gd;text-align:left;line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:column;
  mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">商标注册申请</span><span 
                        lang="EN-US" style="font-size:9.0pt">/application for registration</span><span 
                        lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang"> <o:p></o:p>
                    </span>
                </p>
                <p align="left" class="MsoNormal" style="margin-bottom:4.65pt;mso-para-margin-bottom:
  .3gd;text-align:left;line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">商标异议申请</span><span lang="EN-US" style="font-size:9.0pt">/opposition</span><span 
                        lang="EN-US" style="font-size:
  9.0pt;mso-fareast-font-family:Batang"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">变更商标申请人</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">注册人名义</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">Address申请<span lang="EN-US">/</span></span><span lang="EN-US" 
                        style="font-size:9.0pt">modification of applicant's/registrant's 
                    name/address<o:p></o:p></span></p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">删减商品</span><span 
                        lang="EN-US" style="font-size:9.0pt;font-family:宋体">/</span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">Our Service申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">deletion 
                    of goods/service items</span><span lang="EN-US" style="font-size:9.0pt;
  font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-bottom:4.65pt;mso-para-margin-bottom:
  .3gd;text-align:left;line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">变更商标代理人申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">modification of agency <o:p></o:p>
                    </span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">更正商标申请</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">注册事项申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">correction of application/registration 
                    matters <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">转让申请</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">注册商标申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">assignment of applied/registered 
                    trademark
  <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-bottom:4.65pt;mso-para-margin-bottom:
  .3gd;text-align:left;line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">þ</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">商标续展注册申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">renewal of registration <o:p></o:p>
                    </span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">撤销连续三年停止使用注册商标申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">cancellation of registered trademark 
                    for non-use for 3 years <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">商标注销申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">removal of registration</span><span 
                        lang="EN-US" style="font-size:9.0pt;font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">注册人死亡</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">终止注销商标申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">removal of registered trademark based 
                    of death/termination of registrant <o:p></o:p></span>
                </p>
            </td>
            <td colspan="3" style="width:200.1pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:260.95pt" valign="top" width="267">
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">补发变更</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">转让</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体">/</span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">续展证明申请<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">re-issuance of certificate of approval 
                    for modification/assignment/ renewal <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">补发商标注册证申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">re-issuance 
                    of registration certificate</span><span lang="EN-US" style="font-size:9.0pt;
  font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">提供商标注册证明申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">provision 
                    of proof for registration</span><span lang="EN-US" style="font-size:9.0pt;
  font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">提供优先权证明文件申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">provision 
                    of priority document</span><span lang="EN-US" style="font-size:9.0pt;
  font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">商标使用许可合同备案申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">recordal 
                    of license contract</span><span lang="EN-US" style="font-size:9.0pt;font-family:
  宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">商标使用许可合同备案变更</span><span 
                        lang="EN-US" style="font-size:9.0pt;font-family:宋体">/</span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">提前终止申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">modification/early 
                    termination for recordal of license contract</span><span lang="EN-US" 
                        style="font-size:9.0pt;font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">商标专用权质押登记申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">registration 
                    of hypothecation of exclusive right to use a registered trademark</span><span 
                        lang="EN-US" style="font-size:9.0pt;font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:
  column;mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">撤回商标注册申请申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">withdrawal 
                    of application for registration</span><span lang="EN-US" style="font-size:9.0pt;
  font-family:宋体"> <o:p></o:p></span>
                </p>
                <p align="left" class="MsoNormal" style="margin-bottom:4.65pt;mso-para-margin-bottom:
  .3gd;text-align:left;line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-wrap:auto;mso-element-anchor-horizontal:column;
  mso-element-left:11.25pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;mso-symbol-font-family:
  Wingdings"><span style="mso-char-type:symbol;mso-symbol-font-family:Wingdings">¨</span></span><span 
                        style="font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体">撤回商标异议申请<span 
                        lang="EN-US">/</span></span><span lang="EN-US" style="font-size:9.0pt">withdrawal 
                    of opposition</span><span lang="EN-US" style="font-size:9.0pt;font-family:宋体"> <o:p></o:p>
                    </span>
                </p>
                <p align="left" class="MsoNormal" style="margin-top:0cm;margin-right:0cm;
  margin-bottom:4.65pt;margin-left:9.0pt;mso-para-margin-top:0cm;mso-para-margin-right:
  0cm;mso-para-margin-bottom:.3gd;mso-para-margin-left:9.0pt;text-align:left;
  text-indent:-9.0pt;mso-char-indent-count:-1.0;line-height:11.0pt;mso-line-height-rule:
  exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:Wingdings;mso-ascii-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;;mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">
                    <span style="mso-char-type:symbol;
  mso-symbol-font-family:Wingdings">¨</span></span><span style="font-size:9.0pt;
  font-family:宋体;mso-bidi-font-family:宋体">商标评审事宜<span lang="EN-US">/</span></span><span 
                        lang="EN-US" style="font-size:9.0pt">review and adjudication matters</span><span 
                        lang="EN-US" style="font-size:9.0pt;font-family:宋体"> <o:p></o:p></span>
                </p>
            </td>
        </tr>
        <tr style="mso-yfti-irow:14;mso-yfti-lastrow:yes;height:27.45pt">
            <td style="width:64.2pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt" width="86">
                <p align="left" class="MsoNormal" style="text-align:left;line-height:11.0pt;
  mso-line-height-rule:exactly;mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">委托权限</span><span lang="EN-US" 
                        style="font-size:9.0pt">Scope of Attorney<o:p></o:p></span></p>
            </td>
            <td colspan="6" style="width:393.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:27.45pt" 
                width="524">
                <p class="MsoNormal" style="line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span style="font-size:9.0pt;font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;
  mso-hansi-font-family:&quot;Times New Roman&quot;">一般代理</span><span lang="EN-US" style="font-size:9.0pt;mso-fareast-font-family:Batang;mso-fareast-language:
  KO"><o:p></o:p></span></p>
                <p class="MsoNormal" style="line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt">General agency<o:p></o:p></span></p>
                <p class="MsoNormal" style="line-height:11.0pt;mso-line-height-rule:exactly;
  mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:around;
  mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:margin;
  mso-element-left:11.25pt;mso-element-top:7.9pt;mso-height-rule:exactly">
                    <span lang="EN-US" style="font-size:9.0pt;font-family:宋体"><o:p>&nbsp;</o:p></span></p>
            </td>
        </tr>
        <tr height="0">
            <td style="border:none" width="86">
            </td>
            <td style="border:none" width="83">
            </td>
            <td style="border:none" width="140">
            </td>
            <td style="border:none" width="35">
            </td>
            <td style="border:none" width="29">
            </td>
            <td style="border:none" width="102">
            </td>
            <td style="border:none" width="136">
            </td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top"><table width="710" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="112">&nbsp;</td>
    <td width="598" align="left" valign="top" style="line-height:10.0pt;font-size:9pt;"><p>委托人章戳（签字） </p>
      <p><b>Signature of Applicant:</b><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span 
            style="mso-spacerun:yes">&nbsp;</span></p>
      <p>日期 </p>
      <p><b>Date: </b><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></u><span 
            style="mso-spacerun:yes">&nbsp;</span></p></td>
  </tr>
</table></td>
  </tr>
</table></ItemTemplate>
   </asp:Repeater>
       <%-- </asp:DataList>--%>
</form>
    
</body>
</html>




