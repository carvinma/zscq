using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;

public partial class trademark_count : System.Web.UI.Page
{
    public string stime90 = "0", stime_90 = "0", stime_60 = "0", stime_30 = "0", stime_15 = "0", stime_0 = "0";
    public string nojiaofei = "0", jiaofei = "0", wuyingda = "0", yitijiao = "0", SbTotal = "0";
    dal_Trademark DALT = new dal_Trademark();
    dal_NewTrademark mark = new dal_NewTrademark();
    private int memberid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString() == "")
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            int UserId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            BindApplyCaseAdminStatus(UserId);
            var sbzong = DALT.Trademark_web_SelectCount(UserId, 0, -1, "").Count();
            if (sbzong > 0)
            {
                SbTotal = sbzong.ToString();
            }
            var iquery90 = DALT.Trademark_web_SelectCount(UserId, 0, -1, "90").Count();
            if (iquery90 > 0)
            {
                stime90 = iquery90.ToString();
            }
            var iquery61_90 = DALT.Trademark_web_SelectCount(UserId, 0, -1, "61-90").Count();
            if (iquery61_90 > 0)
            {
                stime_90 = iquery61_90.ToString();
            }
            var iquery31_60 = DALT.Trademark_web_SelectCount(UserId, 0, -1, "31-60").Count();
            if (iquery31_60 > 0)
            {
                stime_60 = iquery31_60.ToString();
            }
            var iquery16_30 = DALT.Trademark_web_SelectCount(UserId, 0, -1, "16-30").Count();
            if (iquery16_30 > 0)
            {
                stime_30 = iquery16_30.ToString();
            }
            var iquery0_15 = DALT.Trademark_web_SelectCount(UserId, 0, -1, "0-15").Count();
            if (iquery0_15 > 0)
            {
                stime_15 = iquery0_15.ToString();
            }
            var iquery_0 = DALT.Trademark_web_SelectCount(UserId, 0, -1, "chao").Count();
            if (iquery_0 > 0)
            {
                stime_0 = iquery_0.ToString();
            }
            var yitijiaoorder = DALT.Trademark_web_SelectCount(UserId, 0, 1, "").Count();
            if (yitijiaoorder > 0)
            {
                yitijiao = yitijiaoorder.ToString();
            }
        }
    }


    private void BindApplyCaseAdminStatus(int userid)
    {
        DataProcDataContext proc = new DataProcDataContext();
        this.rptApplyStatus.DataSource = proc.pro_Count_Case_AdminStatus(0, userid);//申请
        this.rptApplyStatus.DataBind();
        this.rptApplyOrderStatus.DataSource = proc.pro_Count_OrderStatus(0, userid); //申请订单
        this.rptApplyOrderStatus.DataBind();

        this.rptRenewalStatus.DataSource = proc.pro_Count_Case_AdminStatus(1, userid);//续展
        this.rptRenewalStatus.DataBind();
        this.rptRenewalOrderStatus.DataSource = proc.pro_Count_OrderStatus(1, userid); //续展订单
        this.rptRenewalOrderStatus.DataBind();
    }
}