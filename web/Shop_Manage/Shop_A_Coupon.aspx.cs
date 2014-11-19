using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;

public partial class Shop_Manage_shop_yhjadd : System.Web.UI.Page
{
    public bool add = Manager.GetManagerQX(38, 1);
    bll_Coupon BLLC = new bll_Coupon();
	dal_Coupon DALC = new dal_Coupon();
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
        if (!add)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Bind_DDL_Type();
        }
    }
    public void Bind_DDL_Type()
    {
        DDL_CouponType.Items.Add(new ListItem("请选择", "0"));
        DDL_CouponType.DataSource = DALC.CouponType_Select_All();
        DDL_CouponType.DataTextField = "nvc_Name";
        DDL_CouponType.DataValueField = "i_Id";
        DDL_CouponType.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Manager.AddLog(0, "管理系统", "生成优惠券" + TextBox1.Text.Trim() + "张");
        DateTime ExpireTime = Convert.ToDateTime(text_CouponName.Value);
        if (ExpireTime <= DateTime.Now)
        {
            div_a.InnerHtml = "<script>alert('过期时间选择错误！')</script>";
            return;
        }
        BLLC.Coupon_ForAdd(Convert.ToInt32(TextBox1.Text.Trim()), ExpireTime.ToString(), DDL_CouponType.SelectedValue, 0, "后台生成");
        string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Coupon.aspx", System.Text.Encoding.GetEncoding("gb2312"));
        Response.Redirect("shop_manageok.aspx?hrefname=优惠券&hreftype=1&href1=Shop_A_Coupon.aspx&href2=" + twourl);
    }
}
