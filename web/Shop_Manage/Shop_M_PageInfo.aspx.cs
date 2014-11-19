using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using zscq.Model;
using zscq.DAL;
using System.Text;

public partial class Shop_Manage_shop_PageManage : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(64, 0);
    public bool pageupdate = Manager.GetManagerQX(64, 2);
    dal_PageInfo dal_P = new dal_PageInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            HiddenDel.Value = "del";
        }
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
        }
        Bind_Rpt_PageInfo();
    }
    public void Bind_Rpt_PageInfo()
    {
        Rpt_PageInfo.DataSource = new dal_PageInfo().PageInfo_SelectAll(ddl_language.SelectedValue);
        Rpt_PageInfo.DataBind();
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_PageInfo();
    }
}
