using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class jifen_gz : System.Web.UI.Page
{

    public string _Name = "Rules of Reward Points";
    public string _Title = "Preferential Benefit Activity";

    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";

    public string TitleOrKeyword = "";

    public int sortId = 40;
    public int index = 1;
    public bool isLogin = false;

    public string sname, cname, content = "";

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
        if (!string.IsNullOrEmpty(Request.QueryString["index"]))
        {
            index = Convert.ToInt32(Request.QueryString["index"]);
        }
        var iquery = DALN.News_Select_Allshow(sortId,"en");
        var model = iquery.AsEnumerable().ElementAt(index -1);

        sname = "Reward Points Shop";

        cname = model.nvc_Title;
        content = model.nt_Content;

        _Name = string.IsNullOrEmpty(model.nvc_PageTitle) ? model.nvc_Title : model.nvc_PageTitle;
        ShopKeywords = string.IsNullOrEmpty(model.nvc_PageKeywords) ? ShopKeywords : model.nvc_PageKeywords;
        ShopDescription = string.IsNullOrEmpty(model.nvc_PageDescription) ? ShopDescription : model.nvc_PageDescription;

        TitleOrKeyword = "<title>" + _Name + "_" + sname + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }


    protected void Page_Load(object sender, EventArgs e)
    {
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

}