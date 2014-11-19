using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.Model;
using zscq.DAL;


public partial class jifen : System.Web.UI.Page
{
    public string _Title = "优惠活动";
    public string _Name = "积分商城";
    public string _Content = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    string language = "cn";
    public int SortId = 0;
    public string key, sel = "";
    public string ptype = "1", name = "积分兑换";
    public bool isLogin = false;
    dal_SystemKey DALSK = new dal_SystemKey();
    dal_NewsType DALNTP = new dal_NewsType();
    dal_News DALN = new dal_News();
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    DataZscqDataContext dpdc = new DataZscqDataContext();

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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(14);
        _Name = string.IsNullOrWhiteSpace(model.PageTitle) ? _Name : model.PageTitle;

        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;
        TitleOrKeyword = "<title>" + name + "_" + _Name + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
        {
            isLogin = true;
        }
        if (!string.IsNullOrWhiteSpace(Request.QueryString["ptype"]))
        {
            ptype = Request.QueryString["ptype"];
        }
        switch (ptype)
        {
            case "1":
                name = "积分兑换";
                break;
            case "2":
                name = "优惠券兑换";
                break;
            case "3":
                name = "会员等级兑换";
                break;
            default:
                ptype = "1";
                name = "积分兑换";
                break;
        }
        hi_type.Value = ptype;
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
        int min = 0;
        int max = 0;
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = from i in dpdc.t_IntegralProduct where i.i_Type == int.Parse(ptype) && i.nvc_Language == language select i;

        if (!string.IsNullOrWhiteSpace(Request.QueryString["sel"]) && Request.QueryString["sel"].IndexOf(',') > 0)
        {
            sel = Request.QueryString["sel"];
            Jifen.Value = sel;
            int.TryParse(sel.Split(',')[0], out min);
            int.TryParse(sel.Split(',')[1], out max);
        }
        if (!string.IsNullOrWhiteSpace(Request.QueryString["keyword"]))
        {
            key = Server.UrlDecode(Request.QueryString["keyword"]).RemoveUnSafe();
            hi_key.Value = key;
            iquery = from i in iquery where i.nvc_Name.Contains(key) || i.nt_ProductDetails.Contains(key) select i;
        }
        if (min > -1 && min < max)
        {
            iquery = from i in iquery where i.i_NeedIntegral >= min && i.i_NeedIntegral <= max select i;
        }
        if (min > -1 && min > max)
        {
            iquery = from i in iquery where i.i_NeedIntegral >= min select i;
        }

        iquery = from i in iquery where i.i_Show == 1 orderby i.i_Id descending select i;

        count = iquery.Count();
        iquery = iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);

        AspNetPager1.RecordCount = count;
        Rpt_List.DataSource = iquery;
        Rpt_List.DataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
}