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
    public string _Title = "할인 활동";
    public string _Name = "적분상점";
    public string _Content = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    string language = "kr";
    public int SortId = 0;
    public string key, sel = "";
    public int producttypeid = 0;
    public string ptype = "1", name = "태환태환";
    public bool isLogin = false;
    public Dictionary<int, string> producttypes = new Dictionary<int, string>();
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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(42);
        _Name = string.IsNullOrWhiteSpace(model.PageTitle) ? _Name : model.PageTitle;

        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;
        TitleOrKeyword = "<title>" + name + "_" + _Name + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        GetProductTypes();
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
                name = "태환태환";
                break;
            case "2":
                name = "할인권 바꿈";
                break;
            case "3":
                name = "회원등급 바꿈";
                break;
            default:
                ptype = "1";
                name = "태환태환";
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
        if (!string.IsNullOrWhiteSpace(Request.QueryString["producttype"]) && int.Parse(Request.QueryString["producttype"].ToString()) > 0)
        {
            producttypeid = int.Parse(Request.QueryString["producttype"].ToString());
            var s = from i in dpdc.t_IntegralProductType where i.i_ParentId == producttypeid select (i.i_Id);
            iquery = from i in iquery where i.i_ProductType == producttypeid || s.Contains(i.i_ProductType ?? 0) select i;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["myself"]))
        {
            if (!isLogin)
            {
                Response.Redirect("ShopLogin.aspx");//如果没登陆，直接退出
            }
            if (Request.Cookies["hqhtshop"] != null)
            {
                if (Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
                {
                    int myselfjifen = 0;
                    if (Request.Cookies["hqhtshop"]["hqht_user_type"] != null && Request.Cookies["hqhtshop"]["hqht_user_type"].ToString() == "sb")
                    {
                        var q = from i in dpdc.t_IntegralMobile where i.i_sbuid == int.Parse(Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString()) select i;
                        myselfjifen = q.ToList()[0].i_Integral;
                    }
                    if (Request.Cookies["hqhtshop"]["hqht_user_type"] != null && Request.Cookies["hqhtshop"]["hqht_user_type"].ToString() == "zl")
                    {
                        var q = from i in dpdc.t_IntegralMobile where i.i_zluid == int.Parse(Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString()) select i;
                        myselfjifen = q.ToList()[0].i_Integral;
                    }
                    else if (Request.Cookies["hqhtshop"]["hqht_user_type"] != null && Request.Cookies["hqhtshop"]["hqht_user_type"].ToString() == "normal")
                    {
                        var q = from i in dpdc.t_IntegralMobile where i.i_Id == int.Parse(Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString()) select i;
                        myselfjifen = q.ToList()[0].i_Integral;
                    }

                    iquery = from i in iquery where i.i_NeedIntegral <= myselfjifen select i;
                }
            }

        }
        iquery = from i in iquery where i.i_Show == 1 orderby i.i_Orderby descending select i;

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
    private void GetProductTypes()
    {
        StringBuilder sb = new StringBuilder();
        producttype.Items.Add(new ListItem("  상품종류를  선택해주세요 ", "0"));
        var iquery = from i in dpdc.t_IntegralProductType where i.i_ParentId == null && i.nvc_koreanName != "" && i.nvc_koreanName != null select i;
        foreach (var i in iquery)
        {
            producttype.Items.Add(new ListItem(i.nvc_koreanName, i.i_Id.ToString()));
            sb.Append("<ul style='margin:5px;'><a class='ac5'  style='padding-left:10px;background:url(./images/sanjiao.gif) no-repeat 0 2px'; runat='server' href='jifen.aspx?producttype=").Append(i.i_Id).Append("'>").Append(i.nvc_koreanName).Append("</a></ul>");
            var iquery2 = from i2 in dpdc.t_IntegralProductType where i2.i_ParentId == i.i_Id && i2.nvc_koreanName != "" && i2.nvc_koreanName != null select i2;
            foreach (var i2 in iquery2)
            {
                producttype.Items.Add(new ListItem("|--" + i2.nvc_koreanName, i2.i_Id.ToString()));
                sb.Append("<li><a runat='server'   font-size='9pt' href='jifen.aspx?producttype=").Append(i2.i_Id).Append("'>").Append(i2.nvc_koreanName).Append("</a></li>|");
            }

        }
        producttypelist.InnerHtml = sb.ToString();
    }
}