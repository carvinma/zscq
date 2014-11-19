using System;
using System.Collections;
using System.Collections.Generic;
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
using zscq.Model;
using System.Text;

public partial class Shop_Manage_shop_NewsClassAdd : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(68, 0);
    public bool pageadd = Manager.GetManagerQX(68, 1);
    public bool pageupdate = Manager.GetManagerQX(68, 2);
    public bool pagedel = Manager.GetManagerQX(68, 3);
    dal_AdvType DAT = new dal_AdvType();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                Delate_NewsType();
            }
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Rpt_List();
        }
    }
    public void Delate_NewsType()// 删除
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        DAT.AdvType_Del(id);
        Manager.AddLog(0, "广告位管理", "删除广告位");
    }
    public void Bind_Rpt_List()//绑定列表
    {
        reptlist.DataSource = DAT.AdvType_SelectAll(ddl_language.SelectedValue);
        reptlist.DataBind();
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
}
