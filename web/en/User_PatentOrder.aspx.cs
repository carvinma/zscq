using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    int uId = 0;
    public string href = "";
    public dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_Patent DALP = new dal_Patent();
    dal_Coupon DALC = new dal_Coupon();
    protected void Page_Load(object sender, EventArgs e)
    {
        href = Request.Url.ToString();
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            Bind_Rtp_PatentOrderList(1);
        }
        div_a.InnerHtml = "";
    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        Bind_Rtp_PatentOrderList(e.NewPageIndex);
    }
    protected void Rtp_PatentOrderList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rep = e.Item.FindControl("Rpt_PatentNameList") as Repeater;
            HiddenField hid = e.Item.FindControl("hf_Id") as HiddenField;
            rep.DataSource = DALPOI.PatentOrderInfo_Select_OrderId(int.Parse(hid.Value));
            rep.DataBind();

            HiddenField status = e.Item.FindControl("Hf_Status") as HiddenField;
            LinkButton lb = e.Item.FindControl("Lbtn_EscOrder") as LinkButton;
            if (int.Parse(status.Value) >= 2)
            {
                lb.Visible = false;
            }
        }
    }
    protected void EscOrder(object sender, CommandEventArgs e)
    {
        int id = int.Parse(e.CommandName);
        string number = e.CommandArgument.ToString();
        t_PatentOrder model = DALPO.PatentOrder_Select_Id(id);
        model.i_Status = 8;
        if (DALPO.PatentOrder_Update(model)==1)
        {
            IQueryable<t_PatentOrderInfo> info = DALP.GetPatentIdByOrderNumber(id);
            foreach(var v in info)
            {
                t_Patent t = DALP.Patent_Select_Id(v.i_PatentId);
                t.i_AnnualFeeStatus = 1;//还原Patent Status
                DALP.Patent_Update(t);
            }
            #region 取消订单的时候 把他所用到的优惠券状态还原
            if (model.nvc_YouHuiId != null && model.nvc_YouHuiId!="")
            {
                string youhui = model.nvc_YouHuiId;
                if (youhui.IndexOf(',') > -1)
                {
                    string[] arr = youhui.Split(',');
                    for (int i = 0; i < arr.Length;i++ )
                    {
                        t_Coupon tc = DALC.Coupon_Select_Id(Convert.ToInt32(arr[i]));
                        tc.i_State = 1;
                        DALC.Coupon_Update(tc);
                    }
                }
                else
                {
                    t_Coupon tc = DALC.Coupon_Select_Id(Convert.ToInt32(youhui));
                    tc.i_State = 1;
                    DALC.Coupon_Update(tc);
                }
            }
            #endregion

            Bind_Rtp_PatentOrderList(AspNetPager1.CurrentPageIndex);
            UserLog.AddUserLog(uId, "专利系统", "取消订单");
            div_a.InnerHtml = "<script>alert('The order was cancelled successfully！')</script>";
        }
    }
    void Bind_Rtp_PatentOrderList(int currentPage)
    {
        int count = 0;
        Rtp_PatentOrderList.DataSource = DALPO.PatentOrder_SelectPage(currentPage, AspNetPager1.PageSize, uId, ref count);
        Rtp_PatentOrderList.DataBind();
        AspNetPager1.RecordCount = count;
    }
}