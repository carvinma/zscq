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
    public string ApplyTotal, RenewalTotal, OrderTotal, TypeTotal, ApplyUserTotal;
    dal_Trademark DALT = new dal_Trademark();
    DataProcDataContext proc = new DataProcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString() == "")
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            int UserId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            BindCaseStatusCount(UserId);
            BindTrademarkType(UserId);
            BindApplyUser(UserId);
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

    public string RenewalStyle(object StatusValue)
    {
        if (StatusValue != null)
        {
            string value = StatusValue.ToString();
            switch (value)
            {
                case "5":
                    return "font-weight: bold;color: #b2333d;";
                case "6":
                    return "font-weight: bold;color: #d14b1a;";
                case "7":
                    return "font-weight: bold;color: #ebbf1c;";
                case "8":
                    return "font-weight: bold;color: #ef5b9c;";
                case "9":
                    return "font-weight: bold;color: #ef4136;";
                case "10":
                    return "font-weight: bold;color: #ff0510;";
            }
        }
        return string.Empty;
    }
    private void BindCaseStatusCount(int userid)
    {
        var applyDs = proc.pro_Count_Case_AdminStatus(0, userid).ToList();//申请
        ApplyTotal = applyDs.Sum(p=>p.counts).ToString();
        this.rptApplyStatus.DataSource = applyDs;
        this.rptApplyStatus.DataBind();

        var renewalDs = proc.pro_Count_Case_AdminStatus(1, userid).ToList();//续展
        RenewalTotal = renewalDs.Sum(p => p.counts).ToString();
        this.rptRenewalStatus.DataSource = renewalDs;
        this.rptRenewalStatus.DataBind();

        var orderDs = proc.pro_Count_OrderStatus(userid).ToList(); //订单
        OrderTotal = orderDs.Sum(p => p.countsApply + p.countsRenewal).ToString();
        this.rptOrder.DataSource = orderDs;
        this.rptOrder.DataBind();
    }
    private void BindTrademarkType(int userid)
    {
        var typeDs = proc.pro_Count_TrademarkType(userid).ToList();
        TypeTotal = typeDs.Sum(p => p.countsApply + p.countsRenewal).ToString();
        this.rptTrademarkType.DataSource = typeDs;
        this.rptTrademarkType.DataBind();
    }
    private void BindApplyUser(int userid)
    {
        var applyUserDs = proc.pro_Count_ApplyUser(userid).ToList();
        ApplyUserTotal = applyUserDs.Sum(p => p.countsApply + p.countsRenewal).ToString();
        this.rptApplyUser.DataSource = applyUserDs;
        this.rptApplyUser.DataBind();
    }
}