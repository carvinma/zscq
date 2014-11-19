using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class ihome_manage_shop_yhjclass : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(39, 0);
    public bool pageadd = Manager.GetManagerQX(39, 1);
    public bool pageupdate = Manager.GetManagerQX(39, 2);
    public bool pagedel = Manager.GetManagerQX(39, 3);
    dal_Coupon DALC = new dal_Coupon();
    //dal_Brand DALB = new dal_Brand();
    //dal_ProductCategory DALPC = new dal_ProductCategory();
    public int ye = 1;
    public int TType = 1;
    public string Keyword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        if (pageupdate) { hi_true.Value = "1"; }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Page_value();
            Bind_Rpt_List(ye);
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["TType"] != null && Request.QueryString["TType"].ToString() != "")
        {
            //this.Select_Type.Value = Request.QueryString["TType"].ToString();
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
        {
            this.hoot.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["Give"] != null && Request.QueryString["Give"].ToString() != "")
        {
            this.Select_Give.Value = Request.QueryString["Give"].ToString();
        }
    }
    private void Bind_Rpt_List(int PageIndex)
    {
        Keyword = this.hoot.Value;
        //TType = int.Parse(Select_Type.Value);
        int count = 0;
        int PageSize = 20;
        Repeater1.DataSource = DALC.CouponType_Select_Page(PageIndex, PageSize, Keyword, int.Parse(Select_Give.Value), ref count);
        Repeater1.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = PageIndex;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        Bind_Rpt_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = aspPage.CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALC.CouponType_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "优惠券管理", "批量删除优惠券种类");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    public string Set_BrandOrCategory(object Id, object TType)
    {
        if (Id != null && TType != null)
        {
            int TId = int.Parse(Id.ToString());
            //if (TType.ToString() == "1")
            //{
            //    t_Brand model = DALB.Brand_Select_Id(TId);
            //    if (model != null)
            //    {
            //        return model.nvc_Name;
            //    }
            //}
            //else if (TType.ToString() == "2")
            //{
            //    t_ProductCategory model = DALPC.ProductCategory_Select_Id(TId);
            //    if (model != null)
            //    {
            //        return model.nvc_Name;
            //    }
            //}
        }
        return "全场";
    }
    public string Set_GiveNumber(object Number)
    {
        try
        {
            if (Number.ToString() == "0")
            {
                return "不赠送";
            }
            else
            {
                return Number.ToString() + "张";
            }
        }
        catch { }

        return "";
    }
}
