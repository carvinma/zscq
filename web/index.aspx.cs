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
using System.Text;

public partial class index : System.Web.UI.Page
{
    dal_AdvIndex DALA = new dal_AdvIndex();
    dal_News DALN = new dal_News();

    //public StringBuilder _Adv = new StringBuilder();
    public string _Title = "首页";
    public string _Name = "";
    public string _Content = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public string url = "";
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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(7);

        _Title = string.IsNullOrWhiteSpace(model.PageTitle) ? _Title : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;

        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;

        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        Bind_Page_Value();
        Bind_Page_Adv();//绑定页面广告 
        if (!string.IsNullOrWhiteSpace(Request.QueryString["pageurl2"]))
        {
            url = HttpUtility.UrlEncode(Request.QueryString["pageurl2"]);
        }
    }
    void Bind_Page_Adv()//绑定页面广告
    {
        rpt_Adv.DataSource = DALA.AdvIndex_SelectAll("cn").Take(6);
        rpt_Adv.DataBind(); 
    }
}
