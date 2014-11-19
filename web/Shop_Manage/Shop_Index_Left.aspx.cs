using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_Index_Left : System.Web.UI.Page
{
    public string[] flag = null;
    public string guanliyuan = "1";
    public string type = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }

        try
        {
            if (System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["flag"] != null)
            {
                flag = System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["flag"].Split('|');
                string a = Request.Cookies["zscqmanage"]["userid"].ToString();
            }
        }
        catch
        {
            Response.Redirect("Login.aspx");
        }
    }
}
