using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_Default : System.Web.UI.Page
{
    public string[] flag = null;
    public string aname = "";
    dal_Manager dal = new dal_Manager();

    protected void Page_Load(object sender, EventArgs e)
    {
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
                string userid = Request.Cookies["zscqmanage"]["userid"].ToString();
                vw_Manager model = dal.Manager_vw_Select_Id(int.Parse(userid));
                if (model != null)
                {
                    aname = model.nvc_Name;
                    if (flag[12][0] != '1')
                    {
                        zhuanli.Style["display"] = "none";

                    }
                    if (flag[22][0] != '1')
                    {
                        shangbiao.Style["display"] = "none";
                    }
                    if (flag[22][0] != '1' && flag[12][0] != '1')
                    {
                        table1.Style["display"] = "none";
                    }

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        catch
        {
            Response.Redirect("Login.aspx");
        }
    }
}
