using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class user_shopdd : System.Web.UI.Page
{

    dal_Member DALM = new dal_Member();
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_IntegralOrderDetails DALIOD = new dal_IntegralOrderDetails();
    public string PageType = "List of exchange order";
    public string TitleOrKeyword = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public int state = 0;
    public string ordertype = "4";
    public bool desc = true;
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
        TitleOrKeyword = "<title>My order of gift exchange_System of Reward Points Shop_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["state"] != null && Request.QueryString["state"] != "")
        {
            state = Request.QueryString["state"].GetInt();
        }
        Bind_Page_Title();
        Bind_Page_Member();
        if (!IsPostBack)
        {
            Bind_Page_List();
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
    public void Bind_Page_List()//绑定所有Address
    {
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = DALIO.IntegralOrder_vw_SelectPage(pageindex, pagesize, Hi_MemberId.Value.GetInt(), state, getorder(ordertype), desc, ref count);
        AspNetPager1.RecordCount = count;
        Repeater1.DataSource = iquery;
        Repeater1.DataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Page_List();
    }
    public string getorder(object o)
    {
        string order = o.ToString();
        switch (order)
        {
            case "1":
                order = "nvc_OrderNumber";
                break;
            case "2":
                order = "i_SumIntegral";
                break;
            case "3":
                order = "i_State";
                break;
            case "4":
                order = "dt_AddTime";
                break;
            default:
                order = "dt_AddTime";
                break;
        }
        return order;
    }
    public string getstate(object state,string gj)
    {
        return DALIO.Set_IntegralOrderState_Show(state,gj);
    }
    public string getorderpname(object oid)
    {
        var iquery = DALIOD.IntegralOrderDetails_vw_Select_OrderId(Convert.ToInt32(oid));
        string rel = "";
        int number = 1;
        foreach (var v in iquery)
        {
            rel += number + "." + v.nvc_ProductName + "<br/>";
            number++;
        }
        rel += "|";
        return rel.Replace("<br/>|", "").TrimEnd('|');
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ordertype = "1";
        AspNetPager1.CurrentPageIndex = 1;
        if (LinkButton1.Text == "Order number↓")
        {
            LinkButton1.Text = "Order number↑";
            desc = false;
        }
        else
        {
            LinkButton1.Text = "Order number↓";
            desc = true;
        }
        Bind_Page_List();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        ordertype = "2";
        AspNetPager1.CurrentPageIndex = 1;
        if (LinkButton2.Text == "Total of reward points↓")
        {
            LinkButton2.Text = "Total of reward points↑";
            desc = false;
        }
        else
        {
            LinkButton2.Text = "Total of reward points↓";
            desc = true;
        }
        Bind_Page_List();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        ordertype = "3";
        AspNetPager1.CurrentPageIndex = 1;
        if (LinkButton3.Text == "Order status↓")
        {
            LinkButton3.Text = "Order status↑";
            desc = false;
        }
        else
        {
            LinkButton3.Text = "Order status↓";
            desc = true;
        }
        Bind_Page_List();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        ordertype = "4";
        AspNetPager1.CurrentPageIndex = 1;
        if (LinkButton4.Text == "Order time↓")
        {
            LinkButton4.Text = "Order time↑";
            desc = false;
        }
        else
        {
            LinkButton4.Text = "Order time↓";
            desc = true;
        }
        Bind_Page_List();
    }
}