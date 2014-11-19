using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
public partial class user_sbdd : System.Web.UI.Page
{
    public int UserId = 0;  
    dal_Member DALM=new dal_Member ();
    dal_Trademark DALTK = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            UserId = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString().GetInt();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        BindOrderlist();
    }
    void BindOrderlist()
    {
        if (UserId != 0)
        {
            int count = 0;
            int index = AspNetPager1.CurrentPageIndex;
            int pagesize = AspNetPager1.PageSize;
            rp_orderlist.DataSource = DALTO.TrademarkOrder_Web_SelectPage(index, pagesize, UserId, ref count);
            rp_orderlist.DataBind();
            AspNetPager1.RecordCount = count;
            AspNetPager1.PageSize = pagesize;
            AspNetPager1.CurrentPageIndex = index;
        }
        if (Request.QueryString["order"] != null)
        {
            if ( Request.QueryString["order"].ToString() != "")
            {
                int orderid = int.Parse(Request.QueryString["order"].ToString());
                t_TrademarkOrder order = DALTO.TrademarkOrder_Select_Id(orderid);
                if (order != null)
                {
                    order.i_Status = 5;
                    DALTO.TrademarkOrder_Update(order);
                }
                var result = DALTOD.OrderDetails_vw_Select_OrderId(orderid);
                foreach (var r in result)
                {
                    t_Trademark sb_model = DALTK.Trademark_Select_Id(r.i_TrademarkId);
                    sb_model.i_IsPayState = 4;
                    DALTK.Trademark_Update(sb_model);
                }
                dal_Coupon DALCOU = new dal_Coupon();
                var result2 = DALCOU.Coupon_Select_OrderIds(order.nvc_OrderNumber);

                foreach (var v in result2)
                {
                    t_Coupon coupons = DALCOU.Coupon_Select_Id(v.i_Id);
                    coupons.i_State = 1;
                    coupons.dt_UpdateStateTime = null;
                    DALCOU.Coupon_Update2(coupons);
                }
                Response.Redirect("user_sbdd.aspx");
            }
        }
    }

    public string GetBizhong()
    {       
        string bizhong = "";
        t_Member m = DALM.Member_Select_Id(UserId);
        if (m != null)
        {
            t_Nationality na = DALN.Nationality_Select_Id(m.i_GuoJiId);
            if (na != null)
            {
                bizhong = na.nvc_JFBizhong+":";
            }
        }
        return bizhong;
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindOrderlist();
    }
    public string GetGuojiName(int id)// 获得国籍
    {
        string guojiname = "";
        t_Nationality nn = DALN.Nationality_Select_Id(id);
        if (nn != null)
        {
            guojiname = nn.nvc_Name;
        }
        return guojiname;
    }
    public string ConvertStatus(object obj)
    {
        return DALTO.Set_TrademarkOrderState(obj);
    }
    protected void rp_orderlist_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rep = e.Item.FindControl("repTrademark") as Repeater;
            HiddenField oid = (HiddenField)e.Item.FindControl("hf_oid");
            int orderID = Convert.ToInt32(oid.Value);
            rep.DataSource = new dal_TrademarkOrderDetails().OrderDetails_vw_Select_OrderId(orderID);
            rep.DataBind();
        }
    }

}