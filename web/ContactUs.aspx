<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<%@ Register Src="ascx/zscqfoot.ascx" TagName="zscqfoot" TagPrefix="uc2" %>
<%@ Register Src="ascx/zscqadv.ascx" TagName="zscqadv" TagPrefix="uc3" %>
<%@ Register Src="ascx/zscqtop2.ascx" TagName="zscqtop2" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%= TitleOrKeyword %>
  <meta http-equiv="x-ua-compatible" content="ie=7" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
  <link href="css/member.css" rel="stylesheet" type="text/css" />
</head>
<body id="about">
  <form id="form1" runat="server">
  <uc4:zscqtop2 ID="zscqtop21" runat="server" />
  <uc3:zscqadv ID="zscqadv1" TypeId="45" runat="server" />
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
    <tr>
      <td height="3"></td>
    </tr>
  </table>
  <table width="1001" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 0 auto; background-color: #fff;">
    <tr>
      <td width="260" height="618" align="left" valign="top" style="background-color: #f5f5f5;">
        <table width="260" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="69" align="left" valign="top" style="background-image: url(images/aboutus1s.gif);">&nbsp; </td>
          </tr>
          <tr>
            <td width="260" height="334" align="left" valign="top" style="background-image: url(images/aboutus_left2.gif);">
              <table width="260" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="10">&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="AboutUs.aspx" class="ac2">公司历史</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td width="29">&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="Team.aspx" class="ac2">精英团队</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td height="22" bgcolor="#949293">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="hezuo.aspx" class="ac2">合作伙伴</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
                <tr>
                  <td>&nbsp; </td>
                  <td width="221" height="22" bgcolor="#d34245">
                    <table width="221" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38" height="22">&nbsp; </td>
                        <td width="183" align="left"><a href="###" class="ac2">联系我们</a> </td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td colspan="3" height="3"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td align="left" valign="top"><img src="images/aboutus_p1.gif" width="260" height="199" /> </td>
          </tr>
        </table>
      </td>
      <td align="left" valign="top">
        <table width="741" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="left" valign="top" style="background-image: url(images/aboutus_right1.gif);">
              <table width="739" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="36">&nbsp; </td>
                  <td width="678">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left"><a href="index.aspx">首页</a>&nbsp;>>&nbsp;<a href="AboutUs.aspx">关于我们</a>&nbsp;>>&nbsp;联系我们 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="296" valign="top">
              <table width="691" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="61" height="15">&nbsp; </td>
                  <td width="630">&nbsp; </td>
                </tr>
                <tr>
                  <td height="15">&nbsp; </td>
                  <td align="left" valign="top">
                    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
                    <div id="container" style="width: 630px; height: 373px;">
                    </div>
                    <script type="text/javascript">
                      var map = new BMap.Map("container");          // 创建地图实例


                      //通过经纬度坐标来初始化地图
                      var point = new BMap.Point(116.48571, 39.983173);  // 创建点坐标  

                      map.centerAndZoom(point, 14);                 // 初始化地图，设置中心点坐标和地图级别  

                      //通过城市名称来初始化地图
                      //map.centerAndZoom("长春");

                      var marker = new BMap.Marker(point);        // 创建标注  
                      map.addOverlay(marker);

                      map.enableScrollWheelZoom();  // 开启鼠标滚轮缩放  
                      map.enableKeyboard();         // 开启键盘控制  
                      map.enableContinuousZoom();   // 开启连续缩放效果  
                      map.enableInertialDragging(); // 开启惯性拖拽效果 

                      map.addControl(new BMap.NavigationControl()); //添加标准地图控件(左上角的放大缩小左右拖拽控件)
                      map.addControl(new BMap.ScaleControl());      //添加比例尺控件(左下角显示的比例尺控件)
                      map.addControl(new BMap.OverviewMapControl()); // 缩略图控件
                      map.addControl(new BMap.MapTypeControl());     //// 仅当设置城市信息时，MapTypeControl的切换功能才能可用map.setCurrentCity("北京");  
                      map.setCurrentCity("北京市");

                      //添加自定义控件

                      // 定义一个控件类，即function  
                      function ZoomControl() {
                        // 设置默认停靠位置和偏移量  
                        this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
                        this.defaultOffset = new BMap.Size(10, 30);
                      }

                      // 通过JavaScript的prototype属性继承于BMap.Control  
                      ZoomControl.prototype = new BMap.Control();

                      // 自定义控件必须实现initialize方法，并且将控件的DOM元素返回  
                      // 在本方法中创建个div元素作为控件的容器，并将其添加到地图容器中  
                      //                        ZoomControl.prototype.initialize = function (map) {
                      //                            // 创建一个DOM元素  
                      //                            var div = document.createElement("div");
                      //                            // 添加文字说明
                      //                            div.appendChild(document.createTextNode("北京环球汇通咨询服务有限公司"));
                      //                            // 设置样式  
                      //                            div.style.cursor = "pointer";
                      //                            div.style.border = "1px solid gray";
                      //                            div.style.backgroundColor = "white";
                      //                            // 绑定事件，点击一次放大两级  
                      ////                            div.onclick = function (e) {
                      ////                                alert("北京环球汇通咨询服务有限公司");
                      ////                            }
                      //                            // 添加DOM元素到地图中  
                      //                            map.getContainer().appendChild(div);
                      //                            // 将DOM元素返回  
                      //                            return div;
                      //                        }

                      //                        // 创建控件实例  
                      //                        var myZoomCtrl = new ZoomControl();
                      //                        // 添加到地图当中  
                      //                        map.addControl(myZoomCtrl);



                      //                        //添加信息窗口
                      //                        var opts = {
                      //                            width: 360,     // 信息窗口宽度  
                      //                            height: 80,     // 信息窗口高度
                      //                            title: "北京环球汇通咨询服务有限公司"  // 信息窗口标题  
                      //                        }
                      //                        var infoWindow = new BMap.InfoWindow("环球汇通专利年费代理有限公司作为中国国内第一家专门从事专利年费管理的公司,创新地实现了面向世界各国的专利年费网上缴纳模式.", opts);  // 创建信息窗口对象  
                      //                        map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口 

                    </script>
                  </td>
                </tr>
                <tr>
                  <td height="15">&nbsp; </td>
                  <td align="left">&nbsp; </td>
                </tr>
                <tr>
                  <td height="19">&nbsp; </td>
                  <td align="left" valign="top" style="line-height: 21px; word-break: break-all; word-wrap: break-word;">
                    <%=_Content %>
                  </td>
                </tr>
                <tr>
                  <td width="61" height="15">&nbsp; </td>
                  <td width="630" align="left">&nbsp; </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <uc2:zscqfoot ID="zscqfoot2" runat="server" />
  </form>
</body>
</html>
