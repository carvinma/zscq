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
using zscq.DAL;

public partial class Shop_Manage_Shop_M_UserGrade : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(40, 0);
    public bool pageadd = Manager.GetManagerQX(40, 1);
    public bool pageupdate = Manager.GetManagerQX(40, 2);
    public bool pagedel = Manager.GetManagerQX(40, 3);
    dal_UserGrade DALG = new dal_UserGrade();
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
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Delete_Grade();
            Bind_Rpt_Grade();
        }
    }
    public void Delete_Grade()
    {
        if (Request.QueryString["Gid"] != null && Request.QueryString["Gid"] != "")
        {
            int ret = DALG.UserGrade_Del(int.Parse(Request.QueryString["Gid"].ToString()));
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
                return;
            }
            else
            {
                Manager.AddLog(0, "会员管理", "删除会员等级");
            }
            HiddenDel.Value = "del";
        }
    }
    public void Bind_Rpt_Grade()
    {
        Repeater1.DataSource = DALG.UserGrade_Select_All();
        Repeater1.DataBind();
    }
}
