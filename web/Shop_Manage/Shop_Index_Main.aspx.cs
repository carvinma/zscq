using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_index_main : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
    public string[] flag = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
      
        if (System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["flag"] != null)
        {
            flag = System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["flag"].Split('|');
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            GetPatentOrderCountBySatatus();
            GetTrademarkOrderCountBySatatus();
            GetThenCount();
        }
    }

    /// <summary>
    /// 专利订单统计信息
    /// </summary>
    private void GetPatentOrderCountBySatatus()
    {
        var PatentOrder = from o in dvdc.vw_PatentOrder select o.i_Id;
        Lb_PatentOrder0.Text = PatentOrder.Count().ToString();

        var PatentOrder1 = from o in dvdc.vw_PatentOrder where o.i_Status == 1 select o.i_Id;
        Lb_PatentOrder1.Text = PatentOrder1.Count().ToString();

        var PatentOrder2 = from o in dvdc.vw_PatentOrder where o.i_Status == 2 select o.i_Id;
        Lb_PatentOrder2.Text = PatentOrder2.Count().ToString();

        var PatentOrder3 = from o in dvdc.vw_PatentOrder where o.i_Status == 3 select o.i_Id;
        Lb_PatentOrder3.Text = PatentOrder3.Count().ToString();

        var PatentOrder4 = from o in dvdc.vw_PatentOrder where o.i_Status == 4 select o.i_Id;
        Lb_PatentOrder4.Text = PatentOrder4.Count().ToString();

        var PatentOrder5 = from o in dvdc.vw_PatentOrder where o.i_Status == 5 select o.i_Id;
        Lb_PatentOrder5.Text = PatentOrder5.Count().ToString();

        var PatentOrder6 = from o in dvdc.vw_PatentOrder where o.i_Status == 6 select o.i_Id;
        Lb_PatentOrder6.Text = PatentOrder6.Count().ToString();

        var PatentOrder7 = from o in dvdc.vw_PatentOrder where o.i_Status == 7 select o.i_Id;
        Lb_PatentOrder7.Text = PatentOrder7.Count().ToString();

        var PatentOrder8 = from o in dvdc.vw_PatentOrder where o.i_Status == 8 select o.i_Id;
        Lb_PatentOrder8.Text = PatentOrder8.Count().ToString();

        var PatentOrder9 = from o in dvdc.vw_PatentOrder where o.i_Status == 9 select o.i_Id;
        Lb_PatentOrder9.Text = PatentOrder9.Count().ToString();

    }
    /// <summary>
    /// 商标订单统计信息
    /// </summary>
    private void GetTrademarkOrderCountBySatatus()
    {
        var TrademarkOrder = from o in dzdc.t_TrademarkOrder select o.i_Id;
        Lb_TrademarkOrder0.Text = TrademarkOrder.Count().ToString();

        var TrademarkOrder1 = from o in dzdc.t_TrademarkOrder where o.i_Status == 1 select o.i_Id;
        Lb_TrademarkOrder1.Text = TrademarkOrder1.Count().ToString();

        var TrademarkOrder2 = from o in dzdc.t_TrademarkOrder where o.i_Status == 2 select o.i_Id;
        Lb_TrademarkOrder2.Text = TrademarkOrder2.Count().ToString();

        var TrademarkOrder3 = from o in dzdc.t_TrademarkOrder where o.i_Status == 3 select o.i_Id;
        Lb_TrademarkOrder3.Text = TrademarkOrder3.Count().ToString();

        var TrademarkOrder4 = from o in dzdc.t_TrademarkOrder where o.i_Status == 4 select o.i_Id;
        Lb_TrademarkOrder4.Text = TrademarkOrder4.Count().ToString();

        var TrademarkOrder5 = from o in dzdc.t_TrademarkOrder where o.i_Status == 5 select o.i_Id;
        Lb_TrademarkOrder5.Text = TrademarkOrder5.Count().ToString();
    }
    /// <summary>
    /// 其它统计信息
    /// </summary>
    private void GetThenCount()
    {
        var PatentList = from o in dzdc.t_Patent select o.i_Id;
        Lb_PatentCount.Text = PatentList.Count().ToString();

        var TrademarkList = from o in dzdc.t_Trademark select o.i_Id;
        Lb_TrademarkCount.Text = TrademarkList.Count().ToString();
    }
}
