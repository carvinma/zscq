using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class user_shoptj : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    public dal_IntegralOrder DALIO = new dal_IntegralOrder();
    public string PageType = "주소 추가"; 
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
        TitleOrKeyword = "<title>订单统计_계정센터_상가 시스템_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        Bind_Page_Member();
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString();
        }
        else
        {
            Response.Redirect("shoplogin.aspx?pageurl2=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    public int GetOrderCount(int state)
    {
        try
        {
            return DALIO.IntegralOrder_Count(int.Parse(Hi_MemberId.Value), state);
        }
        catch
        {
            return 0;
        }
    }

}