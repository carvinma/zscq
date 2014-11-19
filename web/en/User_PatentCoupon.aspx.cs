using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;
using System.Text;

public partial class User_PatentCoupon : System.Web.UI.Page
{
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Member DALM = new dal_Member();
    dal_Coupon DALC = new dal_Coupon();
    bll_Coupon BLLC = new bll_Coupon();
    dal_Nationality DALN = new dal_Nationality();
    public dal_PatentOrder DALPO = new dal_PatentOrder();
    public StringBuilder div_Coupon1 = new StringBuilder();
    public StringBuilder div_Coupon2 = new StringBuilder();
    public string paybizhong = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Page_Member();
            Bind_Rpt_CouponUnUse();
            Bind_Rpt_CouponUsed();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null)
        {
            if (Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "")
            {
                Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString();
                t_Member model = DALM.Member_Select_Id(Convert.ToInt32(Hi_MemberId.Value));
                if (model != null)
                {
                    paybizhong = DALN.Nationality_Select_Id(model.i_GuoJiId).nvc_JFBizhong;
                }
                return;
            }
        }
        Response.Redirect("shoplogin.aspx?pageurl2=" + HttpUtility.UrlEncode(Request.Url.ToString()));
    }
    public void Bind_Rpt_CouponUnUse()//未使用
    {
        int count = 0;
        string fromss="";
        var IQuery = DALC.Coupon_Select_Page_MemberId(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, int.Parse(Hi_MemberId.Value), 1, ref count);
        AspNetPager1.RecordCount = count;
        foreach (var i in IQuery)
        {
            if (i.nvc_From == "注册赠送")
            {
                fromss = "Received from registration";
            }
            else if (i.nvc_From == "系统赠送")
            {
                fromss = "Received from system";
            }
            else if (i.nvc_From == "商城兑换")
            {
                fromss = "Exchange in shop";
            }
            div_Coupon1.Append("<tr><td height=\"25\" align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_Code + "</td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_ENName + "</td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\"><span style=\"color:#860242;\">" + paybizhong + ":" + DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(i.i_Money1), "USD", paybizhong).ToString("0.00") + "</span></td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + fromss + "</td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + DateTime.Parse(i.dt_AddTime.ToString()).ToString("yyyy-MM-dd") + "&nbsp;To&nbsp;" + DateTime.Parse(i.dt_ExpireTime.ToString()).ToString("yyyy-MM-dd") + "</td>");
        }
        if (div_Coupon1.Length < 1)
        {
            div_Coupon1.Append("<tr><td colspan=\"7\" height=\"25\" width=\"13%\" align=\"center\" bgcolor=\"#FFFFFF\">You have no unused coupon</td></tr>");
        }
    }
    public void Bind_Rpt_CouponUsed()//已使用
    {
        int count = 0;
        string fromss = "";
        var IQuery = DALC.Coupon_Select_Page_MemberId(AspNetPager2.CurrentPageIndex, AspNetPager2.PageSize, int.Parse(Hi_MemberId.Value), 2, ref count);
        AspNetPager2.RecordCount = count;
        foreach (var i in IQuery)
        {
            if (i.nvc_From == "注册赠送")
            {
                fromss = "Received from registration";
            }
            else if (i.nvc_From == "系统赠送")
            {
                fromss = "Received from system";
            }
            else if (i.nvc_From == "商城兑换")
            {
                fromss = "Exchange in shop";
            }
            div_Coupon2.Append("<tr><td height=\"25\" align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_Code + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_ENName + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\"><span style=\"color:#860242;\">" + paybizhong + ":" + DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(i.i_Money1), "USD", paybizhong).ToString("0.00") + "</span></td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + fromss + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + DateTime.Parse(i.dt_AddTime.ToString()).ToString("yyyy-MM-dd") + "&nbsp;To&nbsp;" + DateTime.Parse(i.dt_ExpireTime.ToString()).ToString("yyyy-MM-dd") + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + DateTime.Parse(i.dt_UpdateStateTime.ToString()).ToString("yyyy-MM-dd") + "</td></tr>");
        }
        if (div_Coupon2.Length < 1)
        {
            div_Coupon2.Append("<tr><td colspan=\"7\" height=\"25\" width=\"13%\" align=\"center\" bgcolor=\"#FFFFFF\">You have no used coupon</td></tr>");
        }
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_CouponUnUse();
        Bind_Rpt_CouponUsed();
    }
    protected void AspNetPager2_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_CouponUnUse();
        Bind_Rpt_CouponUsed();
    }
}