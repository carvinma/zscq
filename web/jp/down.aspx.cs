using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class down : System.Web.UI.Page
{
    public string _Title = "常用ファイルダウンロード";
    public string _Name = "環球汇通下载";
    public string _Content = "";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    string language = "jp";
    public int TypeId = 1;
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_SystemKey DALSK = new dal_SystemKey();
    dal_Files DALF = new dal_Files();
    public StringBuilder html = new StringBuilder();

    void Bind_Page_Title()
    {
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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(54);
        _Title = string.IsNullOrWhiteSpace(model.PageTitle) ? _Title : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;
        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
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
        if (Request.QueryString["sid"] != null && Request.QueryString["sid"] != "")
        {
            TypeId = Request.QueryString["sid"].GetInt();
        }
        if (TypeId == 0)
        {
            TypeId = 1;
        }
        html.Clear();
        _Content = "";
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;

        var iquery = DALF.vwFiles_Select_All(pageindex, pagesize, TypeId, ref count, language);
        AspNetPager1.RecordCount = count;
        int rcount = iquery.Count();
        int number = 0;
        if (rcount == 0)
        {
            return;
        }
        if (rcount % 4 == 0)
        {
            number = rcount;
        }
        if (rcount % 4 == 1)
        {
            number = rcount + 3;
        }
        if (rcount % 4 == 2)
        {
            number = rcount + 2;
        }
        if (rcount % 4 == 3)
        {
            number = rcount + 1;
        }
        for (int i = 1; i <= number; i++)
        {
            if (i <= rcount)
            {
                var news = iquery.ToList()[i - 1];
                if (i % 4 == 0)
                {
                    html.Append(string.Format("<div class=\"index_main5prob index_main5pro1b  auto\"><div class=\"index_main5proimga auto\"><img src=\"../{0}\" /></div><div class=\"index_main5protita auto\"><a href=\"download.aspx?filename=../{1}&n={3}\" target=\"_blank\">{2}</a></div></div>", news.nvc_Pic, HttpUtility.UrlEncode(news.nvc_FilePath, Encoding.UTF8), news.nvc_FileName, DateTime.Now.ToString("yyyyMMdd")));
                }
                else
                {
                    html.Append(string.Format("<div class=\"index_main5prob auto\"><div class=\"index_main5proimgb auto\"><img src=\"../{0}\"  /></div><div class=\"index_main5protitb auto\"><a href=\"download.aspx?filename=../{1}&n={3}\" target=\"_blank\">{2}</a></div></div>", news.nvc_Pic, HttpUtility.UrlEncode(news.nvc_FilePath, Encoding.UTF8), news.nvc_FileName, DateTime.Now.ToString("yyyyMMdd")));
                }
            }
            else
            {
                if (i % 4 == 0)
                {
                    html.Append(string.Format("<div class=\"index_main5prob index_main5pro1b  auto\"><div class=\"index_main5proimga auto\"></div><div class=\"index_main5protita auto\"></div></div>"));
                }
                else
                {
                    html.Append("<div class=\"index_main5prob auto\"><div class=\"index_main5proimgb auto\"> </div><div class=\"index_main5protitb auto\"> </div></div>");
                }
            }
        }

    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }

}