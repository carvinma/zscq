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
    public string href = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request["href"] != null && Request["href"].ToString() != "")
        //{
        //    href = Request["href"].ToString();
        //}
        //else
        //{
        //    href = "index.aspx";
        //}
        Response.Write("<script>alert('对不起，您没有这个操作权限，请与管理员联系');history.go(-1);</script>");
    }
}

