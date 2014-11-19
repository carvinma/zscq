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

public partial class user_shopcoupon : System.Web.UI.Page
{
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Member DALM = new dal_Member();
    dal_Coupon DALC = new dal_Coupon();
    bll_Coupon BLLC = new bll_Coupon();
    dal_Nationality DALN = new dal_Nationality();
    public StringBuilder div_Coupon1 = new StringBuilder();
    public StringBuilder div_Coupon2 = new StringBuilder();

    public string TitleOrKeyword = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string paybizhong = "";
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
        TitleOrKeyword = "<title>나의 할인권_상표시시템_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
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
            if (Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
            {
                Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
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
        string fromss = "";
        var IQuery = DALC.Coupon_Select_Page_MemberId(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, int.Parse(Hi_MemberId.Value), 1, ref count);
        AspNetPager1.RecordCount = count;
        foreach (var i in IQuery)
        {
            if (i.nvc_From == "注册赠送")
            {
                fromss = "등록 증정";
            }
            else if (i.nvc_From == "系统赠送")
            {
                fromss = "시스템 서비스";
            }
            else if (i.nvc_From == "商城兑换")
            {
                fromss = "상가 바꾸다";
            }
            div_Coupon1.Append("<tr><td height=\"25\" align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_Code + "</td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_KRName + "</td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\"><span style=\"color:#860242;\">" + paybizhong + ":" + i.i_Money + "</span></td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + fromss + "</td>");
            div_Coupon1.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + DateTime.Parse(i.dt_AddTime.ToString()).ToString("yyyy-MM-dd") + " 부터 " + DateTime.Parse(i.dt_ExpireTime.ToString()).ToString("yyyy-MM-dd") + "</td>");
        }
        if (div_Coupon1.Length < 1)
        {
            div_Coupon1.Append("<tr><td colspan=\"7\" height=\"25\" width=\"13%\" align=\"center\" bgcolor=\"#FFFFFF\">사용된 할인권이 없습니다</td></tr>");
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
                fromss = "등록 증정";
            }
            else if (i.nvc_From == "系统赠送")
            {
                fromss = "시스템 서비스";
            }
            else if (i.nvc_From == "商城兑换")
            {
                fromss = "상가 바꾸다";
            }
            div_Coupon2.Append("<tr><td height=\"25\" align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_Code + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + i.nvc_KRName + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\"><span style=\"color:#860242;\">" + paybizhong + ":" + i.i_Money + "</span></td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + fromss + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + DateTime.Parse(i.dt_AddTime.ToString()).ToString("yyyy-MM-dd") + " 부터 " + DateTime.Parse(i.dt_ExpireTime.ToString()).ToString("yyyy-MM-dd") + "</td>");
            div_Coupon2.Append("<td align=\"center\" bgcolor=\"#FFFFFF\">" + DateTime.Parse(i.dt_UpdateStateTime.ToString()).ToString("yyyy-MM-dd") + "</td></tr>");
        }
        if (div_Coupon2.Length < 1)
        {
            div_Coupon2.Append("<tr><td colspan=\"7\" height=\"25\" width=\"13%\" align=\"center\" bgcolor=\"#FFFFFF\">사용된 할인권이 없습니다</td></tr>");
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