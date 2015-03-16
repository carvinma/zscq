using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    public string cname, snnumber, jifen, follow, contents, cpic = "", ctip;
    public string key, sel, ye = "";
    public string name = "ポイント両替";
    public string _Name = "";
    public string _Title = "ポイントショッピングセンター_キャンペン";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public int producttypeid = 0;
    public Dictionary<int, string> producttypes = new Dictionary<int, string>();
    DataZscqDataContext dpdc = new DataZscqDataContext();
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
            GetProductTypes();
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
    void Bind_Page_Value()//绑定页額面
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
                        name = "ポイント両替";
                        break;
                    case 2:
                        name = "クーポンの両替";
                        break;
                    case 3:
                        name = "会員クラス両替";
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

    private void GetProductTypes()
    {
        StringBuilder sb = new StringBuilder();
        producttype.Items.Add(new ListItem("  请选择商品分类", "0"));
        var iquery = from i in dpdc.t_IntegralProductType where i.i_ParentId == null && i.nvc_JapaneseName != "" && i.nvc_JapaneseName != null select i;
        foreach (var i in iquery)
        {
            producttype.Items.Add(new ListItem(i.nvc_JapaneseName, i.i_Id.ToString()));
            sb.Append("<ul style='margin:5px;'><a class='ac5'  style='padding-left:10px;background:url(./images/sanjiao.gif) no-repeat 0 2px'; runat='server' href='jifen.aspx?producttype=").Append(i.i_Id).Append("'>").Append(i.nvc_JapaneseName).Append("</a></ul>");
            var iquery2 = from i2 in dpdc.t_IntegralProductType where i2.i_ParentId == i.i_Id && i2.nvc_JapaneseName != "" && i2.nvc_JapaneseName != null select i2;
            foreach (var i2 in iquery2)
            {
                producttype.Items.Add(new ListItem("|--" + i2.nvc_JapaneseName, i2.i_Id.ToString()));
                sb.Append("<li><a runat='server'   font-size='9pt' href='jifen.aspx?producttype=").Append(i2.i_Id).Append("'>").Append(i2.nvc_JapaneseName).Append("</a></li>|");
            }

        }
        producttypelist.InnerHtml = sb.ToString();
    }
}