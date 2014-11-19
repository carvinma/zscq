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
    dal_CouponRebateRules DALCRR = new dal_CouponRebateRules();
    public int ye = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        div_a.InnerHtml = "";
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
    }
    private void Bind_Rpt_List(int PageIndex)
    {
        int count = 0;
        int PageSize = 20;
        Repeater1.DataSource = DALCRR.CouponRebateRules_Select_Where(PageIndex, PageSize, 0, 0, ref count);
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
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALCRR.CouponRebateRules_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "促销管理", "批量删除优惠券购返规则");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    public string Set_CouponType(object CouponType, object GiveNumber)
    {
        try
        {
            if (CouponType != null && GiveNumber != null)
            {
                string Ret = "";
                string[] Array_CouponType = CouponType.ToString().Split(',');
                string[] Array_GiveNumber = GiveNumber.ToString().Split(',');
                for (int i = 0; i < Array_CouponType.Length; i++)
                {
                    if (Array_CouponType[i] != "")
                    {
                        t_CouponType model = DALC.CouponType_Select_Id(int.Parse(Array_CouponType[i]));
                        Ret += model.nvc_Name + Array_GiveNumber[i] + "张;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                }
                return Ret;
            }
        }
        catch { }
        return "";
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            int TId = int.Parse(e.CommandArgument.ToString());
            t_CouponRebateRules model = DALCRR.CouponRebateRules_Select_Id(TId);
            if (model.i_State == 1)
            {
                model.i_State = 2;
            }
            else
            {
                model.i_State = 1;
            }
            DALCRR.CouponRebateRules_Update(model);
            Bind_Rpt_List(aspPage.CurrentPageIndex);
        }
        catch { }
    }
    public string Set_BrandOrCategory(object Id, object TType)
    {
        try
        {
            if (TType.ToString() == "3")
            {
                return "全场";
            }
            else
            {
            //    string Ret = "";
            //    string[] Array_Id = Id.ToString().Split(',');
            //    for (int i = 0; i < Array_Id.Length; i++)
            //    {
            //        if (Array_Id[i] != "")
            //        {
            //            if (TType.ToString() == "1")
            //            {
            //                t_Brand model = DALB.Brand_Select_Id(int.Parse(Array_Id[i]));
            //                if (model != null)
            //                {
            //                    Ret += model.nvc_Name + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            //                }
            //            }
            //            else if (TType.ToString() == "2")
            //            {
            //                t_ProductCategory model = DALPC.ProductCategory_Select_Id(int.Parse(Array_Id[i]));
            //                if (model != null)
            //                {
            //                    Ret += model.nvc_Name + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            //                }
            //            }
            //        }
            //    }
            //    return Ret;
            }
        }
        catch { }
        return "";
    }
}
