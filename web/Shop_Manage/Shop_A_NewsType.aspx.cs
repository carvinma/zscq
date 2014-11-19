using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;
public partial class Shop_Manage_shop_NewsClass : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(61, 0);
    public bool pageadd = Manager.GetManagerQX(61, 1);
    public bool pageupdate = Manager.GetManagerQX(61, 2);
    dal_NewsType DALNT = new dal_NewsType();
    dal_News DALN = new dal_News();
    public string contents = "";
    public string returnurl = "";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = "lang=" + Request.QueryString["lang"];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Info()
    {
        try
        {
            LanguageConfig.BindLanguage(ddl_language);
            if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
            {
                t_NewsType model = DALNT.NewsType_Select_Id(int.Parse(Request.QueryString["id"]));
                if (model != null)
                {
                    ddl_language.SelectedValue = model.nvc_Language;
                    DDL_category.Items.Clear();
                    Bind_DDL_Category(0, 0, ddl_language.SelectedValue);
                    if (Request.QueryString["type"] == "updata")
                    {
                        DDL_category.SelectedValue = model.i_Pid.ToString();
                        Hi_TId.Value = Request.QueryString["id"].ToString();
                        NewsClassName.Value = model.nvc_Name;
                        NewsClassOrderby.Value = model.i_Orderby.ToString();
                        TB_WebTitle.Text = model.nvc_PageTitle;
                        Icon.Value = model.nvc_PageKeywords;
                        Icon1.Value = model.nvc_PageDescription;
                        chk_IsLock.Checked = model.i_IsAllow == 1 ? true : false;
                        contents = model.nt_Content;
                        NewsClassKEY.Value = model.nvc_key;
                    }
                    if (Request.QueryString["type"] == "add")
                    {
                        DDL_category.SelectedValue = model.i_Id.ToString();
                    }
                }
            }
            else
            {
                DDL_category.Items.Clear();
                Bind_DDL_Category(0, 0, ddl_language.SelectedValue);
            }
        }
        catch { }
    }
    private void Bind_DDL_Category(int parentid, int count, string lang)
    {
        if (count == 0)
        {
            this.DDL_category.Items.Add(new ListItem("作为一级分类", "0"));
        }
        var iquery = DALNT.NewsType_SelectAll(parentid, lang);
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(HttpUtility.HtmlDecode(MakeFelgefu(count)) + q.nvc_Name, q.i_Id.ToString());
            if (Request.QueryString["type"] == "updata" && Request.QueryString["id"] == q.i_Id.ToString())
            { continue; }
            this.DDL_category.Items.Add(li);
            Bind_DDL_Category(q.i_Id, count + 1, lang);
        }
    }
    private string MakeFelgefu(int count)//绑定分类样式
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
    protected void BtAdd_Click(object sender, EventArgs e)//添加新闻分类
    {
        t_NewsType model = new t_NewsType();
        if (Hi_TId.Value != "0")
        {
            model = DALNT.NewsType_Select_Id(int.Parse(Hi_TId.Value));
        }
        try
        {
            model.i_Orderby = int.Parse(NewsClassOrderby.Value);
        }
        catch { }
        model.i_IsAllow = chk_IsLock.Checked ? 1 : 0;
        model.nvc_Name = NewsClassName.Value;
        model.nt_Content = Request.Form["myContent"];
        model.nvc_PageType = "列表";// DDL_PageType.SelectedValue;
        model.i_Pid = int.Parse(DDL_category.SelectedValue);
        model.nvc_PageTitle = TB_WebTitle.Text;
        model.nvc_PageKeywords = Icon.Value;
        model.nvc_PageDescription = Icon1.Value;
        model.nvc_key = NewsClassKEY.Value;
        model.nvc_Language = ddl_language.SelectedValue;

        if (Hi_TId.Value != "0")
        {
            DALNT.NewsType_Update(model);
            Manager.AddLog(0, "新闻管理", "修改了新闻分类[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_NewsType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=新闻分类&hreftype=2&href1=Shop_A_NewsType.aspx&href2=" + twourl);
        }
        else
        {
            DALNT.NewsType_Add(model);
            Manager.AddLog(0, "新闻管理", "添加了新闻分类[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_NewsType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=新闻分类&hreftype=1&href1=Shop_A_NewsType.aspx&href2=" + twourl);
        }
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDL_category.Items.Clear();
        Bind_DDL_Category(0, 0, ddl_language.SelectedValue);
    }
}
