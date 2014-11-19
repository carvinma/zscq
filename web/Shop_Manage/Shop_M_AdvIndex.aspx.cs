using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.BLL;
using zscq.DAL;
using System.Data;

public partial class Shop_Manage_Shop_M_AdvIndex : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(67, 0);
    public bool pageadd = Manager.GetManagerQX(67, 1);
    public bool pageupdate = Manager.GetManagerQX(67, 2);
    public bool pagedel = Manager.GetManagerQX(67, 3);
    dal_AdvIndex DALA = new dal_AdvIndex();
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
        HiddenDel.Value = "";
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_Value();
            Bind_Rpt_List();
        }
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["pagetype2"] != null && Request.QueryString["pagetype2"].ToString() != "")
        {
            string PageType2 = Request.QueryString["pagetype2"].ToString();
            if (PageType2 == "del")
            {
                HiddenDel.Value = "del";
            }
        }
    }
    public void Bind_Rpt_List()
    {
        advList.DataSource = DALA.AdvIndex_SelectAll(ddl_language.SelectedValue);
        advList.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["selectid"] != null)
        {
            string[] IDList = Request.Form["selectid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALA.AdvIndex_Del(Convert.ToInt32(IDList[i]));
            }
            Manager.AddLog(0, "广告管理", "删除了广告");
        }
        Response.Redirect("Shop_M_AdvIndex.aspx?lang=" + ddl_language.SelectedValue);
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
}
