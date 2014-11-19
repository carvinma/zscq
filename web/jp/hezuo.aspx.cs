using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class HeZuo : System.Web.UI.Page
{
    public string _Name = "提携パートナー";
    public string _Title = "私達について";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public int SortId = 13;
    dal_NewsType DALNTP = new dal_NewsType();
    dal_News DALN = new dal_News();
    public StringBuilder html = new StringBuilder();
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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(55);
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
        html.Clear();
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = DALN.vwNews_Select_ShowNews(pageindex, pagesize, "hzhb", "jp", ref count);
        AspNetPager1.RecordCount = count;
        int rcount = iquery.Count();
        int number = 0;
        if (rcount == 0)
        {
            return;
        }
        if (rcount % 3 == 0)
        {
            number = rcount;
        }
        if (rcount % 3 == 1)
        {
            number = rcount + 2;
        }
        if (rcount % 3 == 2)
        {
            number = rcount + 1;
        }
        for (int i = 1; i <= number; i++)
        {
            if (i <= rcount)
            {
                var news = iquery.ToList()[i - 1];
                if (i % 3 == 0)
                {
                    html.Append(string.Format("<div class=\"index_main5prot index_main5pro1t  auto\"><div class=\"index_main5proimg auto\"><img src=\"../{0}\" /></div><div class=\"index_main5protit auto\">{1}</div></div>", news.nvc_TitlePhoto, news.nvc_Title));
                }
                else
                {
                    html.Append(string.Format("<div class=\"index_main5prot auto\"><div class=\"index_main5proimgt auto\"><img src=\"../{0}\" /></div><div class=\"index_main5protitt auto\">{1}</div></div>", news.nvc_TitlePhoto, news.nvc_Title));
                }
            }
            else
            {
                if (i % 3 == 0)
                {
                    html.Append(string.Format("<div class=\"index_main5prot index_main5pro1t  auto\"><div class=\"index_main5proimg auto\"></div><div class=\"index_main5protit auto\"></div></div>"));
                }
                else
                {
                    html.Append("<div class=\"index_main5prot auto\"><div class=\"index_main5proimgt auto\"> </div><div class=\"index_main5protitt auto\"> </div></div>");
                }
            }
        }

    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
}