using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class user_shopddck : System.Web.UI.Page
{

    dal_Member DALM = new dal_Member();
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_IntegralOrderDetails DALIOD = new dal_IntegralOrderDetails();


    public string OrderStatus, OrderNumber, OrderDate, Address, MemberName = "";
    public int i_SumIntegral = 0;

    public string PageType = "兑换订单列表";
    public string TitleOrKeyword = "";
    public string ShopName = "环球汇通";
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
        TitleOrKeyword = "<title>订单详情_我的兑换订单_商城系统_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        Bind_Page_Member();
        Bind_Page_Value();
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
    public void Bind_Page_Value()//绑定所有地址
    {
        if (Request.QueryString["orderid"] != null && Request.QueryString["orderid"].ToString() != "")
        {
            Hi_OrderId.Value = Request.QueryString["orderid"].ToString();
            int orderid = Convert.ToInt32(Request.QueryString["orderid"].ToString());
            vw_IntegralOrder model = DALIO.IntegralOrder_vw_Select_Id(orderid);
            if (model != null && model.i_MemberId.ToString() == Hi_MemberId.Value)
            {
                MemberName = model.nvc_MemberName;
                Address += string.IsNullOrWhiteSpace(model.countryName) == true ? "" : model.countryName + "&nbsp;&nbsp;";
                Address += string.IsNullOrWhiteSpace(model.cityName) == true ? "" : model.cityName + "&nbsp;&nbsp;";
                Address += string.IsNullOrWhiteSpace(model.areaName) == true ? "" : model.areaName + "&nbsp;&nbsp;";
                Address += string.IsNullOrWhiteSpace(model.nvc_Address_StreetAddress) == true ? "" : model.nvc_Address_StreetAddress;
                //状态 
                OrderNumber = model.nvc_OrderNumber;
                OrderStatus = DALIO.Set_IntegralOrderState(model.i_State);
                OrderDate = model.dt_AddTime.ToString();
                i_SumIntegral = model.i_SumIntegral;
                #region 绑定商品信息
                repProduct.DataSource = new dal_IntegralOrderDetails().IntegralOrderDetails_vw_Select_OrderId(orderid);
                repProduct.DataBind();
                #endregion
            }
        }
        else
        {
            Response.Redirect("user_shopdd.aspx");
        }
    }
}