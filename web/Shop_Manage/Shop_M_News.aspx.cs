using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_shop_delnews : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(60, 0);
    public bool pageadd = Manager.GetManagerQX(60, 1);
    public bool pageupdate = Manager.GetManagerQX(60, 2);
    public bool pagedel = Manager.GetManagerQX(60, 3);
    dal_News DALN = new dal_News();
    dal_NewsType DALNT = new dal_NewsType();
    public string cs = "";
    public int ye = 1;
    public string Keyword = "";
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
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_DDL_Category(0, 0, ddl_language.SelectedValue);
            Bind_Page_value();
            Bind_Rpt_News(ye);
        }
    }
    void Bind_DDL_Category(int parentid, int count, string lang)
    {
        if (count == 0)
        {
            this.DDL_TType.Items.Add(new ListItem("所有分类", "-1"));
        }
        var queryable = DALNT.NewsType_SelectAll(parentid, lang);
        foreach (var q in queryable)
        {
            ListItem li = new ListItem(HttpUtility.HtmlDecode(MakeFelgefu(count)) + q.nvc_Name, q.i_Id.ToString());
            this.DDL_TType.Items.Add(li);
            Bind_DDL_Category(q.i_Id, count + 1, lang);
        }
    }
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "|—";
        }
        else
        {
            for (int i = 0; i < count; i++)
            {
                Returnwords += "&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            Returnwords += "|—";
        }
        return Returnwords;
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"] != "")
        {
            hoot.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["SType"] != null && Request.QueryString["SType"] != "")
        {
            DDL_SType.SelectedValue = Request.QueryString["SType"].ToString();
        }
        if (Request.QueryString["TType"] != null && Request.QueryString["TType"] != "")
        {
            DDL_TType.SelectedValue = Request.QueryString["TType"].ToString();
        }
        if (Request.QueryString["AType"] != null && Request.QueryString["AType"] != "")
        {
            DDL_AType.SelectedValue = Request.QueryString["AType"].ToString();
        }
    }
    public void Bind_Rpt_News(int index)
    {
        int pageindex = index;
        int pagesiz = 20;
        int count = 0;
        Keyword = hoot.Value;
        reptlist.DataSource = DALN.News_SelectPage(pageindex, pagesiz, int.Parse(DDL_TType.SelectedValue), Keyword, int.Parse(DDL_SType.SelectedValue), int.Parse(DDL_AType.SelectedValue), ddl_language.SelectedValue, ref count);
        reptlist.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pagesiz;
        aspPage.CurrentPageIndex = index;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
        cs = string.Format("&ye={0}&Keyword={1}&SType={2}&TType={3}&AType={4}&lang={5}",
            aspPage.CurrentPageIndex,
            hoot.Value,
            DDL_SType.SelectedValue,
            DDL_TType.SelectedValue,
            DDL_AType.SelectedValue,
            ddl_language.SelectedValue);
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_News(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_News(1);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALN.News_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "新闻管理", "删除新闻");
        }
        Bind_Rpt_News(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void reptlist_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataSystemDataContext dncdc = new DataSystemDataContext();
        string id = e.CommandArgument.ToString();
        var query = from q in dncdc.t_News where q.i_Id == int.Parse(id) select q;
        foreach (var q in query)
        {
            if (e.CommandName.ToString() == "state")
            {
                if (q.i_Show == 1) { q.i_Show = 0; } else { q.i_Show = 1; }
            }
        }
        Manager.AddLog(0, "新闻管理", "修改新闻列表信息");
        dncdc.SubmitChanges();
        Bind_Rpt_News(aspPage.CurrentPageIndex);
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDL_TType.Items.Clear();
        Bind_DDL_Category(0, 0, ddl_language.SelectedValue);
        Bind_Rpt_News(1);
    }
}
