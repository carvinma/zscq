using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class links : System.Web.UI.Page
{
    string language = "jp";
    public string _Title = "Links";
    public string _Name = "";
    public string _Content = "";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public int SortId = 13;
    public string ftype = "1";// 1 专利局   2 商标局   3 其他  

    public string qypid = "0";//区域父ID
    public string qyid = "0";//区域ID 
    //public string lid = "0";//link ID

    dal_SystemKey DALSK = new dal_SystemKey();
    dal_NewsType DALNTP = new dal_NewsType();
    dal_News DALN = new dal_News();
    dal_QuYu DALQY = new dal_QuYu();
    dal_FriendLink DALF = new dal_FriendLink();
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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(57);

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
        html.Clear();
        _Content = "";
        int count = 0;
        int rcount = 0;//实际内容数量
        int number = 0;//产生单元格数量
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        DataSystemDataContext dsdc = new DataSystemDataContext();
        var iquery = from i in dsdc.t_FriendLink select i;
        if (!string.IsNullOrWhiteSpace(Request.QueryString["ftype"]))
        {
            ftype = Request.QueryString["ftype"];
            iquery = from i in iquery where i.nvc_TypePath.Contains(ftype) select i;
        }
        if (Request.QueryString["qypid"] != null && Request.QueryString["qypid"] != "" && Request.QueryString["qypid"] != "0")
        {
            qypid = Request.QueryString["qypid"];
            iquery = from i in iquery where i.nvc_QuYuPath.Contains("," + qypid + ",") select i;
        }
        //else
        //{
        //    qypid = DALQY.QuYu_Select_Pid(0, language).FirstOrDefault().i_Id.ToString();
        //}
        if (!string.IsNullOrWhiteSpace(Request.QueryString["qyid"]))
        {
            qyid = Request.QueryString["qyid"];
            iquery = from i in iquery where i.nvc_QuYuPath.Contains("," + qyid + ",") select i;
        }
        iquery = from i in iquery orderby i.i_Orderby ascending, i.i_Id descending select i;
        count = iquery.Count();
        iquery = iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        rcount = iquery.Count();
        Bind_Rpt_zhou();
        AspNetPager1.RecordCount = count;

        #region 写数据

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
                    html.Append(string.Format("<div class=\"index_main5prot index_main5pro1t  auto\"><div class=\"index_main5proimg auto\"><a href=\"{1}\" target=\"_blank\"><img src=\"../{0}\" /></a></div><div class=\"index_main5protit auto\"><a href=\"{1}\" target=\"_blank\">{2}</a></div></div>", news.nvc_Pic, news.nvc_Link, news.nvc_jpLinkName));
                }
                else
                {
                    html.Append(string.Format("<div class=\"index_main5prot auto\"><div class=\"index_main5proimgt auto\"><a href=\"{1}\" target=\"_blank\"><img src=\"../{0}\" /></a></div><div class=\"index_main5protitt auto\"><a href=\"{1}\" target=\"_blank\">{2}</a></div></div>", news.nvc_Pic, news.nvc_Link, news.nvc_jpLinkName));
                }
            }
            else
            {
                if (i % 4 == 0)
                {
                    html.Append(string.Format("<div class=\"index_main5prot index_main5pro1t  auto\"><div class=\"index_main5proimg auto\"></div><div class=\"index_main5protit auto\"></div></div>"));
                }
                else
                {
                    html.Append("<div class=\"index_main5prot auto\"><div class=\"index_main5proimgt auto\"> </div><div class=\"index_main5protitt auto\"> </div></div>");
                }
            }
        }

        #endregion

    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
    void Bind_Rpt_zhou()
    {
        var iquery = DALQY.QuYu_Select_Pid(0);
        Rpt_zhou.DataSource = iquery;
        Rpt_zhou.DataBind();
    }
    protected void Rpt_zhou_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rpt = e.Item.FindControl("Rpt_Country") as Repeater;
            if (rpt != null)
            {
                var modle = e.Item.DataItem as t_QuYu;
                if (modle != null)
                {
                    var iquery = DALQY.QuYu_Select_Pid(modle.i_Id);
                    rpt.DataSource = iquery;
                    rpt.DataBind();
                }
            }
        }
    }
}