using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class jifen_show : System.Web.UI.Page
{

    dal_Member DALM = new dal_Member();
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    CookiesShopCart shopcart = new CookiesShopCart();
    public int id = 0, isshow = 1, ptype = 1;
    public bool isLogin = false;
    public string cname, snnumber, jifen, follow, contents, cpic = "";
    public string key, sel, ye = "";
    public string name = "Reward points exchange";
    public string _Name = "";
    public string _Title = "Reward Points Shop_Preferential Benefit Activity";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";

    void Bind_Page_Title()
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
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
            {
                isLogin = true;
            }
            if (!string.IsNullOrWhiteSpace(Request.QueryString["sel"]) && Request.QueryString["sel"].IndexOf(',') > 0)
            {
                sel = Request.QueryString["sel"];
                Jifen.Value = sel;
            }
            if (!string.IsNullOrWhiteSpace(Request.QueryString["keyword"]))
            {
                key = Server.UrlDecode(Request.QueryString["keyword"]).RemoveUnSafe();
                pagekey.Value = key;
            }
            if (!string.IsNullOrWhiteSpace(Request.QueryString["ye"]))
            {
                pageindex.Value = Server.UrlDecode(Request.QueryString["ye"]).RemoveUnSafe();
            }
            Bind_Page_Title();
            Bind_Page_Value();
            Bind_Page_Member();
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            Response.Write("<script>history.go(-1);</Script>");
        }
    }
    void Bind_Page_Value()//绑定page面值
    {
        if (Request.QueryString["cid"] != null && Request.QueryString["cid"] != "")
        {
            var model = DALIP.IntegralProduct_vw_Select_Id(Request.QueryString["cid"].GetInt());
            if (model != null)
            {
                DALIP.IntegralProduct_UpdateView(model.i_Id);
                Hi_PId.Value = model.i_Id.ToString();
                Hi_Jifen.Value = model.i_NeedIntegral.ToString();
                Hi_PType.Value = model.i_Type.ToString();
                model.i_Show = model.i_Show;
                ptype = model.i_Type;
                switch (ptype)
                {
                    case 1:
                        name = "Reward points exchange";
                        break;
                    case 2:
                        name = "Coupon Exchange";
                        break;
                    case 3:
                        name = "User Level Exchange";
                        break;
                }
                cname = model.nvc_Name;
                snnumber = model.nvc_Number;
                //string p = shopcart.Get_Info(model.i_Id.ToString());
                //if (p != "")
                //{
                //    Hi_Number.Value = p.Split(',')[1];
                //    ibuycount.Value = p.Split(',')[1];
                //    jifen = (model.i_NeedIntegral * int.Parse(p.Split(',')[1])).ToString();
                //}
                //else
                //{
                Hi_Number.Value = "1";
                ibuycount.Value = "1";
                jifen = model.i_NeedIntegral.ToString();
                //}
                follow = model.i_Follow.ToString();
                contents = model.nt_ProductDetails;
                cpic = model.nvc_Pic;
                TitleOrKeyword = "<title>" + cname + "_" + name + "_" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
            }
            else
            {
                Response.Redirect("jifen.aspx");
            }
        }
        else
        {
            Response.Redirect("jifen.aspx");
        }

    }
    void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null)
        {
            if (Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
            {
                Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString();
                return;
            }
        }
        Hi_Herf.Value = HttpUtility.UrlEncode(Request.Url.ToString());
    }
}