<%@ WebHandler Language="C#" Class="Shop_A_Files" %>

using System;
using System.Web;
using System.IO;
public class Shop_A_Files : IHttpHandler
{

  public void ProcessRequest(HttpContext context)
  {
    //  context.Response.ContentType = "text/plain";
    //  context.Response.Write("Hello World");
    if (context.Request.Cookies["zscqmanage"] == null || context.Request.Cookies["zscqmanage"]["flag"] == null || context.Request.Cookies["zscqmanage"]["flag"] == "")
    {
      context.Response.Write("没有访问权限！");
    }
    if (context.Request["type"] == "IsHave")
    {
      if (!string.IsNullOrWhiteSpace(context.Request["fname"]))
      {
        string fname = Path.GetFileName(context.Request["fname"]).ToLower();
        if (File.Exists(context.Request.MapPath("../Upload_Files/") + fname))
        {
          context.Response.Write("1");
        }
        else
        {
          context.Response.Write("0");
        }
      }
      else
      {
        context.Response.Write("缺少参数");
      }
    }
  }

  public bool IsReusable
  {
    get
    {
      return false;
    }
  }

}