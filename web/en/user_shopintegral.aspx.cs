﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;

public partial class user_shopintegral : System.Web.UI.Page
{
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_Member DALM = new dal_Member();
    dal_Coupon DALC = new dal_Coupon();
    bll_Coupon BLLC = new bll_Coupon();

    public int Integral = 0;
    public string TitleOrKeyword = "";

    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
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
        TitleOrKeyword = "<title>My reward points_System of Reward Points Shop_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Bind_Page_Member();
            Bind_Rpt_IntegraNote(1);
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null)
        {
            if (Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
            {
                Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString();
                return;
            }
        }
        Response.Redirect("shoplogin.aspx?pageurl2=" + HttpUtility.UrlEncode(Request.Url.ToString()));
    }
    public void Bind_Rpt_IntegraNote(int PageIndex)
    {
        var member = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
        if (member != null)
        {
            int wcount = 0;
            Repeater1.DataSource = DALUIN.vwIntegralNote_Select_MobileId(PageIndex, AspNetPager1.PageSize, member.i_IntegralMobileId, ref wcount);
            Repeater1.DataBind();
            AspNetPager1.RecordCount = wcount;
            AspNetPager1.CurrentPageIndex = PageIndex;
        }
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_IntegraNote(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
    public string GetStr(string str)
    {
        string s = "";
        if (str == "系统赠送")
        {
            s = "Received from system";
        }
        else if (str == "商城兑换")
        {
            s = "Exchange in shop";
        }
        else if (str == "付款成功")
        {
            s = "Pay success";
        }
        else if (str == "专利下单")
        {
            s = "Received from Patent system";
        }
        else if (str == "商标下单")
        {
            s = "Received from Trademark system";
        }
        else if (str == "系统生成")
        {
            s = "System Generate";
        }
        else if (str == "注册赠送")
        {
            s = "Received from registration";
        }
        else if (str == "取消订单")
        {
            s = "Order cancelled";
        }
        else
        {
            s = "System";
        }
        return s;
    }
}