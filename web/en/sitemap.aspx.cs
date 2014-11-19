using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Data.Common;
using System.Data.SqlClient;

public partial class sitemap : System.Web.UI.Page
{

    public string _Title = "Site Map";
    public string _Name = "";
    public string _Content = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";


    dal_SystemKey DALSK = new dal_SystemKey();


    public void Bind_Page_Title()
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

    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        Bind_Page_Value();
    }
    void Bind_Page_Value()
    {
        t_SystemKey about = DALSK.SystemKey_Select_Key("sitemap");
        _Content = about.nt_Value;

        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(31);

        _Title = string.IsNullOrWhiteSpace(model.PageTitle) ? _Title : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;

        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;

        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
}
