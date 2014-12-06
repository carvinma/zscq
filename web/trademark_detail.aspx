<%@ Page Language="C#" AutoEventWireup="true" CodeFile="trademark_detail.aspx.cs" Inherits="trademark_detail" %>
<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <title></title>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/trademark.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
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
      <td align="left" valign="top">
       
        <div class="infoMain">
					<ul class="ui-tabs-nav clearfix">
						<li class="ui-tabs-selected"><a href="javascript:;">商标信息</a></li>
						<li><a href="javascript:;">商标状态</a></li>
						<li><a href="javascript:;">HQHT留言</a></li>
					</ul>
					<div class="ui-tabs-panel">
						<div class="content reset">
						1
						</div>
					</div>
					<div class="ui-tabs-panel ui-tabs-hide">
						<div class="content reset">
							2
						</div>
					</div>
					 
					<div class="ui-tabs-panel ui-tabs-hide" id="Div1">
                     3
				    </div>
				</div>
  
      </td>
    </tr>
  </table>
 
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  </form>
</body>
</html>
