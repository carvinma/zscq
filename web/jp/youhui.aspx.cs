using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class youhui : System.Web.UI.Page
{
    public string _Name = "最新キャンペン";
    public string _Title = "キャンペン";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public int sortId = 26;
    string key = "yhhd", language = "jp";
    public string cname, content = "";
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
        var model = new vw_News();
        int cid = 0;
        if (!string.IsNullOrWhiteSpace(Request.QueryString["cid"]))
        {
            cid = int.Parse(Request.QueryString["cid"]);
            model = DALN.News_vw_Select_Id(cid);
        }
        else
        {
            model = DALN.News_vw_Select_First(key, language);
            cid = model.i_Id;
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_TitleLink))
        {
            Response.Redirect(model.nvc_TitleLink);
        }
        if (model.i_Show == 0)
        {
            Response.Redirect("index.aspx");
        }
        cname = model.nvc_Title;
        content = model.nt_Content;

        var iquery = DALN.vwNews_Select_ShowNewsAll(key, language).Where(i => i.i_Id != cid);
        Rpt_history.DataSource = iquery;
        Rpt_history.DataBind();

        _Name = string.IsNullOrEmpty(model.nvc_PageTitle) ? model.nvc_Title : model.nvc_PageTitle;
        ShopKeywords = string.IsNullOrEmpty(model.nvc_PageKeywords) ? ShopKeywords : model.nvc_PageKeywords;
        ShopDescription = string.IsNullOrEmpty(model.nvc_PageDescription) ? ShopDescription : model.nvc_PageDescription;
        TitleOrKeyword = "<title>" + _Name + "_最新キャンペン_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Bind_Page_Title();
            Bind_Page_Value();
        }
        catch { }
    }
}