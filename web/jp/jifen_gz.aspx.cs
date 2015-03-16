using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class jifen_gz : System.Web.UI.Page
{

    public string _Name = "ポイント規則";
    public string _Title = "キャンペン";

    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";

    public string TitleOrKeyword = "";

    public int sortId = 52;
    public int index = 1;
    public bool isLogin = false;
    public int producttypeid = 0;
    public string sname, cname, content = "";
    public Dictionary<int, string> producttypes = new Dictionary<int, string>();
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
        if (!string.IsNullOrEmpty(Request.QueryString["index"]))
        {
            index = Convert.ToInt32(Request.QueryString["index"]);
        }
        var iquery = DALN.News_Select_Allshow(sortId, "jp");
        var model = iquery.AsEnumerable().ElementAt(index - 1);

        sname = "ポイントショッピングセンター";

        cname = model.nvc_Title;
        content = model.nt_Content;

        _Name = string.IsNullOrEmpty(model.nvc_PageTitle) ? model.nvc_Title : model.nvc_PageTitle;
        ShopKeywords = string.IsNullOrEmpty(model.nvc_PageKeywords) ? ShopKeywords : model.nvc_PageKeywords;
        ShopDescription = string.IsNullOrEmpty(model.nvc_PageDescription) ? ShopDescription : model.nvc_PageDescription;

        TitleOrKeyword = "<title>" + _Name + "_" + sname + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        GetProductTypes();
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
        {
            isLogin = true;
        }
        try
        {
            Bind_Page_Title();
            Bind_Page_Value();
        }
        catch
        {
            Response.Write("<script>history.go(-1);</Script>");
        }
    }
    private void GetProductTypes()
    {
        StringBuilder sb = new StringBuilder();
        producttype.Items.Add(new ListItem("  请选择商品分类", "0"));
        var iquery = from i in dpdc.t_IntegralProductType where i.i_ParentId == null && i.nvc_JapaneseName != "" && i.nvc_JapaneseName != null select i;
        foreach (var i in iquery)
        {
            producttype.Items.Add(new ListItem(i.nvc_JapaneseName, i.i_Id.ToString()));
            sb.Append("<ul style='margin:5px;'><a class='ac5'  style='padding-left:10px;background:url(./images/sanjiao.gif) no-repeat 0 2px'; runat='server' href='jifen.aspx?producttype=").Append(i.i_Id).Append("'>").Append(i.nvc_JapaneseName).Append("</a></ul>");
            var iquery2 = from i2 in dpdc.t_IntegralProductType where i2.i_ParentId == i.i_Id && i2.nvc_JapaneseName != "" && i2.nvc_JapaneseName != null select i2;
            foreach (var i2 in iquery2)
            {
                producttype.Items.Add(new ListItem("|--" + i2.nvc_JapaneseName, i2.i_Id.ToString()));
                sb.Append("<li><a runat='server'   font-size='9pt' href='jifen.aspx?producttype=").Append(i2.i_Id).Append("'>").Append(i2.nvc_JapaneseName).Append("</a></li>|");
            }

        }
        producttypelist.InnerHtml = sb.ToString();
    }
}