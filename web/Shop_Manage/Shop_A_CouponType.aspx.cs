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
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_Coupon DALC = new dal_Coupon();
    dal_Nationality DALN = new dal_Nationality();
    public string returnurl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
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
        if (!IsPostBack)
        {
            bind_ddl_TimeLength();
            Bind_Page_Info();
        }
    }
    void bind_ddl_TimeLength()
    {
        ddl_TimeLength.Items.Clear();
        ddl_TimeLength.DataSource = new dal_CouponTimeLength().CouponTimeLength_Select_All();
        ddl_TimeLength.DataTextField = "nvc_Text";
        ddl_TimeLength.DataValueField = "i_Value";
        ddl_TimeLength.DataBind();
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["ctid"] != null && Request.QueryString["ctid"].ToString() != "")
        {
            Hi_Id.Value = Request.QueryString["ctid"].ToString();
            int CTId = int.Parse(Request.QueryString["ctid"].ToString());
            t_CouponType model = DALC.CouponType_Select_Id(CTId);
            if (model != null)
            {
                text_name.Value = model.nvc_Name;
                text_enname.Value = model.nvc_ENName;
                text_jpname.Value = model.nvc_JPName;
                text_krname.Value = model.nvc_KRName;
                //text_where0.Value = model.i_Where.ToString();
                //text_money0.Value = model.i_Money.ToString();
                //text_where1.Value = model.i_Where1.ToString();
                text_money1.Value = model.i_Money1.ToString();
                //text_where2.Value = model.i_Where2.ToString();
                //text_money2.Value = model.i_Money2.ToString();
                //text_where3.Value = model.i_Where3.ToString();
                //text_money3.Value = model.i_Money3.ToString();
                //text_where4.Value = model.i_Where4.ToString();
                //text_money4.Value = model.i_Money4.ToString();
                text_NeedJifen.Value = model.i_NeedJifen.ToString();
                text_RegGiveNumber.Value = model.i_RegGiveNumber.ToString();
                ddl_TimeLength.SelectedValue = model.i_TimeLength.ToString();
            }
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        t_CouponType model = new t_CouponType();
        try
        {
            if (Hi_Id.Value != "0")
            {
                model = DALC.CouponType_Select_Id(Convert.ToInt32(Hi_Id.Value));
            }
            if (ddl_TimeLength.SelectedValue == "0")
            {
                return;
            }
            model.i_TimeLength = int.Parse(ddl_TimeLength.SelectedValue);

           
            #region 根据客户国籍得到的费用
            model.i_Money = Convert.ToInt32(DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(text_money1.Value), "USD", "CNY"));
            model.i_Money1 = int.Parse(text_money1.Value);
            #endregion
            //model.i_Money2 = int.Parse(text_money2.Value);
            //model.i_Money3 = int.Parse(text_money3.Value);
            //model.i_Money4 = int.Parse(text_money4.Value);

            //model.i_Where = int.Parse(text_where0.Value);
            //model.i_Where1 = int.Parse(text_where1.Value);
            //model.i_Where2 = int.Parse(text_where2.Value);
            //model.i_Where3 = int.Parse(text_where3.Value);
            //model.i_Where4 = int.Parse(text_where4.Value);

            model.i_NeedJifen = int.Parse(text_NeedJifen.Value);
            model.i_RegGiveNumber = int.Parse(text_RegGiveNumber.Value);

            model.nvc_Name = text_name.Value;
            model.nvc_ENName = text_enname.Value;
            model.nvc_JPName = text_jpname.Value;
            model.nvc_KRName = text_krname.Value;

            if (Hi_Id.Value != "0")
            {
                model.i_Id = int.Parse(Hi_Id.Value);
                DALC.CouponType_Update(model);
                Manager.AddLog(0, "优惠券管理", "修改了优惠券种类[ <font color=\"red\">" + model.nvc_Name + "</font> ]的信息");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_CouponType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=优惠券种类&hreftype=2&href1=Shop_a_CouponType.aspx&href2=" + twourl);
            }
            else
            {
                DALC.CouponType_Add(model);

                Manager.AddLog(0, "优惠券管理", "添加优惠券种类[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_CouponType.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=优惠券种类&hreftype=1&href1=Shop_a_CouponType.aspx&href2=" + twourl);
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据异常！');</script>";
        }
    }
}