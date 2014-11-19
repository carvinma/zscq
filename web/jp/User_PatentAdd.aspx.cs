using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    dal_SystemSetup DALS = new dal_SystemSetup();
    public string filename = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Member();
        get();
    }
    protected void Bind_Page_Member()
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "")
        {

        }
        else
        {
            Response.Redirect("Login.aspx?flag=zl&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    public void get()
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        filename = model.nvc_ViewsBook_jp;
    }
}