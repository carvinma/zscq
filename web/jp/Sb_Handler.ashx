<%@ WebHandler Language="C#" Class="Sb_Handler" %>

using System;
using System.Web;

public class Sb_Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (context.Request["sbdaoqi"] != null && context.Request["sbdaoqi"] != "")
        {
            string dt = context.Request["sbdaoqi"]+" 00:00:00";
            string daoqitime = Convert.ToDateTime(dt).AddYears(10).AddDays(-1).ToShortDateString();
            context.Response.Write(daoqitime);
        }
        else
        {
            context.Response.Write("no");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}