using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;
public partial class trademarkrenewalOrder_list : System.Web.UI.Page
{
    public int UserId = 0;
    dal_Member DALM = new dal_Member();
    dal_Trademark DALTK = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_NewTrademark mark = new dal_NewTrademark();
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
        if (!IsPostBack)
        {
            BindDDLOrderStatsus();
            BindOrderlist();
        }
    }
    void BindOrderlist()
    {
        if (UserId != 0)
        {
            int count = 0;
            int index = AspNetPager1.CurrentPageIndex;
            int pagesize = AspNetPager1.PageSize;
            int status = -1;
            if (!string.IsNullOrEmpty(this.ddlOrderStatus.SelectedValue))
            {
                status = int.Parse(this.ddlOrderStatus.SelectedValue);
            }
            rp_orderlist.DataSource = DALTO.TrademarkOrder_Web_New_SelectPage(index, pagesize, UserId, ref count, 1, this.txtOrder.Text.Trim(), this.txtApplyNo.Text.Trim(), this.txtApplyUser.Text.Trim(), this.txtOrderDate.Text.Trim(), status);
            rp_orderlist.DataBind();
            AspNetPager1.RecordCount = count;
            AspNetPager1.PageSize = pagesize;
            AspNetPager1.CurrentPageIndex = index;
        }

        #region 取消订单
       
        if (!string.IsNullOrEmpty(Request.QueryString["order"]) && !string.IsNullOrEmpty(Request.QueryString["tIds"]))
        { 
            int orderid = int.Parse(Request.QueryString["order"].ToString());
            t_NewTrademarkOrder order = DALTO.NewTrademarkOrder_Select_Id(orderid);
            if (order != null)
            {
                order.i_Status = 3;//已取消
                DALTO.TrademarkOrder_Update(order);
            }
            string[] tIds = Request.QueryString["tIds"].Split(',');
            var result = mark.Trademark_web_Excel(tIds);
            foreach (var r in result)
            {
                if (r.RestDays > 90)
                    r.Status = 2;
                else if (r.RestDays <= 90 && r.RestDays >= 61)
                    r.Status = 3;
                else if (r.RestDays <= 60 && r.RestDays >= 31)
                    r.Status = 4;
                else if (r.RestDays <= 30 && r.RestDays >= 16)
                    r.Status = 5;
                else if (r.RestDays <= 15 && r.RestDays >= 0)
                    r.Status = 6;
                else if (r.RestDays < 0)
                    r.Status = 7;
                else if (r.RestDays < 0 && r.RestDays >= -30)
                    r.Status = 8;
                else if (r.RestDays < -30 && r.RestDays >= -150)
                    r.Status = 8;
            }
            mark.Trademark_Submit();
            dal_Coupon DALCOU = new dal_Coupon(); //优惠券信息表
            var result2 = DALCOU.Coupon_Select_OrderIds(order.nvc_OrderNumber);

            foreach (var v in result2)
            {
                t_Coupon coupons = DALCOU.Coupon_Select_Id(v.i_Id);
                coupons.i_State = 1;
                coupons.dt_UpdateStateTime = null;
                DALCOU.Coupon_Update2(coupons);
            }
            Response.Redirect("trademarkrenewalOrder_list.aspx");
        }
        #endregion
    }


    private void BindDDLOrderStatsus()
    {
        List<t_NewTradeMarkStatus> tradeMarkStatuslist = BaseDataUtil.tradeMarkOrderStatuslist.ToList();
        tradeMarkStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = null });
        this.ddlOrderStatus.DataSource = tradeMarkStatuslist;
        this.ddlOrderStatus.DataTextField = "StatusName";
        this.ddlOrderStatus.DataValueField = "StatusValue";
        this.ddlOrderStatus.DataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindOrderlist();
    }
    public string ConvertStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkOrderStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
    }
    protected void rp_orderlist_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rep = e.Item.FindControl("repTrademark") as Repeater;
            HiddenField oid = (HiddenField)e.Item.FindControl("hf_oid");

            var iquery = mark.Trademark_web_Excel(oid.Value.Split(','));
            rep.DataSource = iquery;
            rep.DataBind();

            Repeater repApply = e.Item.FindControl("repApply") as Repeater;
            repApply.DataSource = iquery;
            repApply.DataBind();

            Repeater repPattern = e.Item.FindControl("repPattern") as Repeater;
            repPattern.DataSource = iquery;
            repPattern.DataBind();
        }
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindOrderlist();
    }
}