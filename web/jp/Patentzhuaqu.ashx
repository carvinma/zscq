<%@ WebHandler Language="C#" Class="Patentzhuaqu" %>

using System;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.Services;
public class Patentzhuaqu : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (context.Request["flag"] != null || context.Request["flag"] != "")
        {
            //if (context.Request["zlnumber"] != "" && context.Request["zltype"] != "")
            //{
                string pantnum = context.Request["zlnumber"].ToString();
                string zltype = context.Request["zltype"].ToString();
                
              var datastr= GetData(pantnum,zltype);
              if (datastr != "" && datastr != "chaoshi")
              {
                  context.Response.Write(datastr);
              }
              else if (datastr == "chaoshi") 
              {
                  context.Response.Write("chaoshi");
              }
              else
              {
                  context.Response.Write("no");
              }
          //  }
        }  
    }
    //根据Url地址得到网页的html源码 
    private string GetWebContent(string Url)
    {
        string strResult = "";
        try
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            //声明一个HttpWebRequest请求 
            request.Timeout = 30000;
            //设置连接超时时间 
            request.Headers.Set("Pragma", "no-cache");
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream streamReceive = response.GetResponseStream();
            Encoding encoding = Encoding.GetEncoding("GB2312");
            StreamReader streamReader = new StreamReader(streamReceive, encoding);
            strResult = streamReader.ReadToEnd();

        }
        catch
        {
            strResult = "chaoshi";
        }
        return strResult;
    }
    public string GetData(string patentnum, string typename)
    {
        string datastr = "";
        if (typename == "発明")//发明
        {
            ////要抓取的URL地址 
            string Url = "http://211.157.104.87:8080/sipo/zljs/hyjs-yx-new.jsp?recid=" + patentnum + "&leixin=fmzl&title=&ipc=";// TextBox1.Text;  
            datastr = NewMethod(datastr, Url,2);
        }
        if (typename == "実用新案")//实用新型
        {
            ////要抓取的URL地址 
            string Url = "http://211.157.104.87:8080/sipo/zljs/hyjs-yx-new.jsp?recid=" + patentnum + "&leixin=syxx&title=&ipc=";// TextBox1.Text;  
            datastr = NewMethod(datastr, Url,2);
        }
        if (typename == "意匠")//外观设计
        {
            string Url = "http://211.157.104.87:8080/sipo/zljs/hyjs-browsewg.jsp?recid=" + patentnum + "&leixin=wgzl&title=&ipc=";// TextBox1.Text; 
            datastr = NewMethod(datastr, Url,1);
        }
        if (typename == "")
        {
            //欧盟
            string Url = "https://register.epo.org/application?number=" + patentnum;// TextBox1.Text;            
            datastr = NewMethod(datastr, Url, 3);
        }
        return datastr;
    }

   private string NewMethod(string datastr, string Url, int type)
   {
       string strWebContent = GetWebContent(Url);
       if (strWebContent != "chaoshi")
       {
           if (type == 1)
           {
               //取出和数据有关的那段源码 
               //int iBodyStart = strWebContent.IndexOf("<table width=\"260\"", 0);
               //int iStart = strWebContent.IndexOf("<tbody>", iBodyStart);
               //int iTableStart = strWebContent.IndexOf("<tbody>", iStart);
               //int iTableEnd = strWebContent.IndexOf("</table>", iTableStart);
               //string strWeb = strWebContent.Substring(iTableStart, iTableEnd - iTableStart + 8);
               //datastr = "<table>" + strWeb;


               strWebContent = strWebContent.Replace("\r", "").Replace("\n", "");
               strWebContent = strWebContent.Replace("<tbody>", "").Replace("</tbody>", "");
               int iTableStart = strWebContent.IndexOf("<table width=\"260\"", 0);
               int iTableEnd = strWebContent.IndexOf("</table>", iTableStart);
               string strWeb = strWebContent.Substring(iTableStart, iTableEnd - iTableStart + 8);
               datastr = strWeb;
           }
           if (type == 2)
           {
               strWebContent = strWebContent.Replace("\r", "").Replace("\n", "");
               int iTableStart = strWebContent.IndexOf("<table width=\"772\"", 0);
               int iTableEnd = strWebContent.IndexOf("</table>", iTableStart);
               string strWeb = strWebContent.Substring(iTableStart, iTableEnd - iTableStart + 8);
               datastr = strWeb;
           }
           if (type == 3)
           {
               strWebContent = strWebContent.Replace("\r", "").Replace("\n", "");
               int iTableStart = strWebContent.IndexOf("<table class=\"tableType3", 0);
               int iTableEnd = strWebContent.IndexOf("</table>", iTableStart);
               string strWeb = strWebContent.Substring(iTableStart, iTableEnd - iTableStart + 8);
               datastr = strWeb;
           }
       }
       else
       {
           datastr = "chaoshi";
       }
       return datastr;
   }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}