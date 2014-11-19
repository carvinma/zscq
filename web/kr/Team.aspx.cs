using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
public partial class Team : System.Web.UI.Page
{
    public string _Name = "조직도";
    public string _Title = "회사소개";
    public string _Content = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";

    public int SortId = 12;
    string key = "team", language = "kr";
    dal_SystemKey DALSK = new dal_SystemKey();
    dal_NewsType DALNTP = new dal_NewsType();
    dal_News DALN = new dal_News();

    void Bind_Page_Title()
    {
        dal_SystemSetup DALSS = new dal_SystemSetup();
        t_SystemSetup t = DALSS.SystemSetup_Select();
        if (t.nvc_ShopName != null && t.nvc_ShopName != "")
        {
            ShopName = t.nvc_ShopName;
        }
        if (t.nvc_ShopKeywords != null && t.nvc_ShopKeywords != "")
        {
            ShopKeywords = t.nvc_ShopKeywords;
        }
        if (t.nvc_ShopDescription != null && t.nvc_ShopDescription != "")
        {
            ShopDescription = t.nvc_ShopDescription;
        }
    }
    void Bind_Page_Value()
    {
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(44);
        _Name = string.IsNullOrWhiteSpace(model.PageTitle) ? _Name : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;
        TitleOrKeyword = "<title>" + _Name + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Bind_Page_Title();
            Bind_Page_Value();
            Bind_Rpt_List();
        }
        catch
        {
            //Response.Write("<script>history.go(-1);</Script>");
        }
    }
    void Bind_Rpt_List()
    {
        if (!string.IsNullOrWhiteSpace(Request.QueryString["cid"]))
        {
            int count = 0;
            int pagesize = AspNetPager1.PageSize;
            int pageindex = AspNetPager1.CurrentPageIndex;
            var iquery = DALN.vwNews_Select_ShowNews(Request.QueryString["cid"].GetInt(), language, ref count);
            AspNetPager1.RecordCount = count;
            Rpt_List.DataSource = iquery;
            Rpt_List.DataBind();
        }
        else
        {
            int count = 0;
            int pagesize = AspNetPager1.PageSize;
            int pageindex = AspNetPager1.CurrentPageIndex;
            var iquery = DALN.vwNews_Select_ShowNews(pageindex, pagesize, key, language, ref count);
            AspNetPager1.RecordCount = count;
            Rpt_List.DataSource = iquery;
            Rpt_List.DataBind();
        }
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
}