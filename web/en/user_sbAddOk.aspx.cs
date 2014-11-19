using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
public partial class user_sbupdate : System.Web.UI.Page
{
    public string sbshu = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        if (Request.QueryString["ok"] != null)
        {
            sbshu = "1";
            if (Request.QueryString["shu"] != null)
            {
                sbshu = Request.QueryString["shu"].ToString();
            }
        }
    }

}