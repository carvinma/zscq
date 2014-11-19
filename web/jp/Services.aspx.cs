using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;
using System.Data;

public partial class Services : System.Web.UI.Page
{
    public string _Title = "サービス内容";
    public string _Name = "专利年费";
    public string _Content = "";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";

    public string sortid = "";
    public string cid = "";
    public string sortName, cname = "";
    string key = "service", language = "jp";
    dal_NewsType DALNT = new dal_NewsType();
    dal_News DALN = new dal_News();
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
    void Bind_Page_Value()
    {
        TitleOrKeyword = "<title>" + _Name + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["cid"]))
            {
                cid = Request.QueryString["cid"];
            }
            Bind_Rpt_Sort();
            Bind_Content();
            Bind_Page_Title();
            Bind_Page_Value();
        }
        catch
        {
            //Response.Write("<script>history.go(-1);</Script>");
        }
    }
    void Bind_Rpt_Sort()
    {
        var service = DALNT.NewsType_SelectAll(key, language).FirstOrDefault();
        var iquery = DALNT.NewsType_SelectAll(service.i_Id);
        if (Request.QueryString["sid"] != null && Request.QueryString["sid"] != "")
        {
            sortid = Request.QueryString["sid"];
        }
        else
        {
            sortid = iquery.FirstOrDefault().i_Id.ToString();
        }
        var model = iquery.SingleOrDefault(i => i.i_Id.ToString() == sortid);
        _Name = model.nvc_PageTitle == "" ? model.nvc_Name : model.nvc_PageTitle;
        sortName = model.nvc_Name;
        Rpt_Sort.DataSource = iquery;
        Rpt_Sort.DataBind();
    }
    protected void Rpt_Sort_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            t_NewsType nt = e.Item.DataItem as t_NewsType;
            var iquery = DALN.News_Select_All(Convert.ToInt32(nt.i_Id));
            Repeater rpt = (e.Item.FindControl("Rpt_Content") as Repeater);
            if (rpt != null)
            {
                if (e.Item.ItemIndex == 0 && string.IsNullOrWhiteSpace(cid))
                {
                    cid = iquery.SingleOrDefault(i => i.nvc_TitleLink == null || i.nvc_TitleLink == "").i_Id.ToString();
                }
            }
            rpt.DataSource = iquery;
            rpt.DataBind();
        }
    }
    void Bind_Content()
    {
        if (Request.QueryString["flag"] != null && Request.QueryString["flag"] == "1")
        {
            var model = DALNT.NewsType_Select_Id(Convert.ToInt32(sortid));
            _Name = model.nvc_PageTitle == "" ? (model.nvc_Name + "_" + _Name) : (model.nvc_PageTitle + "_" + _Name);
            ShopKeywords = model.nvc_PageKeywords == "" ? _Title : model.nvc_PageKeywords;
            ShopDescription = model.nvc_PageDescription == "" ? _Title : model.nvc_PageDescription;
            cname = model.nvc_Name;
            _Content = model.nt_Content;
        }
        else
        {
            var model = DALN.News_Select_Id(int.Parse(cid));
            _Name = model.nvc_PageTitle == "" ? (model.nvc_Title + "_" + _Name) : (model.nvc_PageTitle + "_" + _Name);
            ShopKeywords = model.nvc_PageKeywords == "" ? _Title : model.nvc_PageKeywords;
            ShopDescription = model.nvc_PageDescription == "" ? _Title : model.nvc_PageDescription;
            cname = model.nvc_Title;
            _Content = model.nt_Content;
        }
    }
    public bool IsSort(object oid)
    {
        if (sortid == oid.ToString())
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public bool IsCon(object oid)
    {
        if (cid == oid.ToString())
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public int GetCount(object oid)
    {
        return DALN.News_Select_Count(Convert.ToInt32(oid));
    }

}