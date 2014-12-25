using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;
public partial class trademarkOrder_list : System.Web.UI.Page
{
    public int UserId = 0;  
    dal_Member DALM=new dal_Member ();
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
            int status=-1;
            if(!string.IsNullOrEmpty(this.ddlOrderStatus.SelectedValue))
            {
                status=int.Parse(this.ddlOrderStatus.SelectedValue);
            }
            rp_orderlist.DataSource = DALTO.TrademarkOrder_Web_New_SelectPage(index, pagesize, UserId, ref count, 0, this.txtOrder.Text.Trim(), this.txtCaseNo.Text.Trim(),this.txtApplyUser.Text.Trim(), this.txtOrderDate.Text.Trim(), status);
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

            var iquery= mark.Trademark_web_Excel(oid.Value.Split(','));
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

    }
}