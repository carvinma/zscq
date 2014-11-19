using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class ihome_manage_shop_yhjclass : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(38, 0);
    public bool pageadd = Manager.GetManagerQX(38, 1);
    public bool pageupdate = Manager.GetManagerQX(38, 2);
    dal_Coupon DALC = new dal_Coupon();
    //dal_Brand DALB = new dal_Brand();
    //dal_ProductCategory DALPC = new dal_ProductCategory();
    dal_CouponRebateRules DALCRR = new dal_CouponRebateRules();
    public string returnurl = "";
    public StringBuilder div_CouponType = new StringBuilder(); 
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Bind_Page_CouponType();
            Bind_Page_Info();
        }
    }
    public void Bind_Page_CouponType()
    {
        int shu = 0;
        IQueryable<t_CouponType> IQuery = DALC.CouponType_Select_All();
        foreach (var q in IQuery)
        {
            shu++;
            div_CouponType.Append("<div class=\"divitem\"><input type=\"checkbox\" name=\"cb\" id=\"cb" + shu + "\" value=\"" + q.i_Id + "\" />" + q.nvc_Name + "&nbsp;");
            div_CouponType.Append("<input type=\"text\" id=\"text_zs" + shu + "\" value=\"1\" class=\"inputs60text\" onblur=\"if(this.value=='')this.value='1';\"");
            div_CouponType.Append(" onkeypress=\"event.returnValue=IsDigit();\" />&nbsp;张</div>");
        }
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["tid"] != null && Request.QueryString["tid"].ToString() != "")
        {
            Hi_Id.Value = Request.QueryString["tid"].ToString();
            int CTId = int.Parse(Request.QueryString["tid"].ToString());
            t_CouponRebateRules model = DALCRR.CouponRebateRules_Select_Id(CTId);
            if (model != null)
            {
                cb_State.Checked = model.i_State == 1 ? true : false;
                text_where.Value = model.i_Where.ToString();
                Hi_cb.Value = model.nvc_CouponType;
                Hi_text.Value = model.nvc_GiveNumber;

                DDL_Type.SelectedValue = model.i_Type.ToString();
                //if (model.i_Type == 1)
                //{
                //    DDL_BrandOrCategory.Visible = true;
                //    Bind_DDL_Brand();
                //    string Scope = model.nvc_SId + ",";
                //    for (int i = 0; i < DDL_BrandOrCategory.Items.Count; i++)
                //    {
                //        if (Scope.IndexOf("," + DDL_BrandOrCategory.Items[i].Value + ",") > -1)
                //        {
                //            DDL_BrandOrCategory.Items[i].Selected = true;
                //        }
                //    }
                //}
                //else if (model.i_Type == 2)
                //{
                //    DDL_BrandOrCategory.Visible = true;
                //    Bind_DDL_Category();
                //    string Scope = model.nvc_SId + ",";
                //    for (int i = 0; i < DDL_BrandOrCategory.Items.Count; i++)
                //    {
                //        if (Scope.IndexOf("," + DDL_BrandOrCategory.Items[i].Value + ",") > -1)
                //        {
                //            DDL_BrandOrCategory.Items[i].Selected = true;
                //        }
                //    }
                //}
            }
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        t_CouponRebateRules newmodel = new t_CouponRebateRules();
        try
        {
            newmodel.i_Where = int.Parse(text_where.Value);
        }
        catch { }
        try
        {
            newmodel.i_State = cb_State.Checked ? 1 : 2;
        }
        catch{ }
        try
        {
            newmodel.i_Type = int.Parse(DDL_Type.SelectedValue);
        }
        catch { }

        
       
        if (DDL_BrandOrCategory.Visible != false)
        {
            string Scope = "";
            for (int i = 0; i < DDL_BrandOrCategory.Items.Count; i++)
            {
                if (DDL_BrandOrCategory.Items[i].Selected)
                {
                    Scope += "," + DDL_BrandOrCategory.Items[i].Value;
                }
            }
            newmodel.nvc_SId = Scope;
        }
        newmodel.nvc_CouponType = Hi_cb.Value;
        newmodel.nvc_GiveNumber = Hi_text.Value;
        if (Hi_Id.Value != "0")
        {
            newmodel.i_Id = int.Parse(Hi_Id.Value);
            DALCRR.CouponRebateRules_Update(newmodel);
            Manager.AddLog(0, "促销管理", "修改了优惠券购返规则[ <font color=\"red\">购物满" + newmodel.i_Where + "元</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_CouponRebateRules.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=优惠券购返规则&hreftype=2&href1=Shop_A_CouponRebateRules.aspx&href2=" + twourl);
        }
        else
        {
            DALCRR.CouponRebateRules_Add(newmodel);
            Manager.AddLog(0, "促销管理", "添加优惠券购返规则[ <font color=\"red\">购物满" + newmodel.i_Where + "元</font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_CouponRebateRules.aspx", System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=优惠券购返规则&hreftype=1&href1=Shop_A_CouponRebateRules.aspx&href2=" + twourl);
        }
    }
    //public void Bind_DDL_Brand()
    //{
    //    DDL_BrandOrCategory.DataSource = DALB.Brand_SelectAll();
    //    DDL_BrandOrCategory.DataTextField = "nvc_Name";
    //    DDL_BrandOrCategory.DataValueField = "i_Id";
    //    DDL_BrandOrCategory.DataBind();
    //}
    //public void Bind_DDL_Category()
    //{
    //    DDL_BrandOrCategory.DataSource = DALPC.ProductCategory_Select_PId(0);
    //    DDL_BrandOrCategory.DataTextField = "nvc_Name";
    //    DDL_BrandOrCategory.DataValueField = "i_Id";
    //    DDL_BrandOrCategory.DataBind();
    //}
    protected void DDL_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDL_BrandOrCategory.Visible = true;
        DDL_BrandOrCategory.Items.Clear();
        string ItemValue = DDL_Type.SelectedValue;
        switch (ItemValue)
        {
            case "0":
                DDL_BrandOrCategory.Visible = false;
                break;
            //case "1":
            //    Bind_DDL_Brand();
            //    break;
            //case "2":
            //    Bind_DDL_Category();
            //    break;
            case "3":
                DDL_BrandOrCategory.Visible = false;
                break;
        }
    }
}
