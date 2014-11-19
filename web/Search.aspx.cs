using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
public partial class Search : System.Web.UI.Page
{
    public string _Title = "站内搜索";
    public string _Name = "";
    public string _Content = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public string keyword = "";

    dal_SystemKey DALSK = new dal_SystemKey();
    dal_NewsType DALNTP = new dal_NewsType();
    dal_News DALN = new dal_News();
    DataSystemDataContext dsdc = new DataSystemDataContext();

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
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(16);

        _Title = string.IsNullOrWhiteSpace(model.PageTitle) ? _Title : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;

        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;

        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
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
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;

        var arr = (from t in dsdc.t_NewsType where t.i_Pid == 14 || t.i_Id == 26 || t.i_Id == 12 select t.i_Id).ToArray();
        var iquery = from i in dsdc.t_News
                     where i.i_Show == 1 &&
                     arr.Contains(i.i_NewsTypeId)
                     select i;

        if (!string.IsNullOrWhiteSpace(Request.QueryString["keywords"]))
        {
            keyword = Server.UrlDecode(Request.QueryString["keywords"]);

            if (StringHelper.CheckSqlKeyWord(keyword) || StringHelper.CheckSqlKeyWord(keyword))
            {
                lb_msg.Text = "您输入的字符不符合规范,请核对后重新输入！";
                return;
            }
            iquery = from i in iquery where i.nvc_Title.Contains(keyword) || i.nt_Content.Contains(keyword) || i.nvc_PageKeywords.Contains(keyword) || i.nvc_PageDescription.Contains(keyword) select i;
        }
        //else
        //{
        //    div_a.InnerHtml = "<script>alert('请输入关键词!');</script>";
        //}

        iquery = from i in iquery orderby i.dt_AddTime descending, i.i_Id descending select i;
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

    public string getUrl(object oid, object osid)
    {
        if (Convert.ToString(osid) == "26")
        {
            return "youhui.aspx?cid=" + oid.ToString();
        }
        else if (Convert.ToString(osid) == "12")
        {
            return "Team.aspx?cid=" + oid.ToString();
        }
        return "Services.aspx?cid=" + oid + "&sid=" + osid;
        //string id = oid.ToString();

        //string rel = "";
        //switch (id)
        //{
        //    case "12":
        //        rel = "Team.aspx";
        //        break;
        //    case "13":
        //        rel = "hezuo.aspx";
        //        break;
        //    case "26":
        //        rel = "youhui.aspx";
        //        break;
        //    default:
        //        rel = "Services.aspx?cid=" + oid + "&sid=" +    (Convert.ToInt32(oid));
        //        break;
        //}
        //return rel;
    }

}