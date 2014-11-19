using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shop_Manage_shop_quit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        Response.Cookies["zscqmanage"]["flag"] = null;
        Response.Cookies["zscqmanage"]["type"] = null;
        Response.Cookies["zscqmanage"]["userid"] = null;
        if (Request.QueryString["name"] != null && Request.QueryString["name"] != "")
        {
            Manager.AddLog(0, "退出系统", Request.QueryString["name"].ToString() + "退出系统");
        }
        div_a.InnerHtml = "<script>window.location.href='Login.aspx';</script>";
    }
}
