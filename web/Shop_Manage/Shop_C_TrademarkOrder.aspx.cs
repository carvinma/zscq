using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Data;
using System.Data.SqlClient;
public partial class Shop_Manage_Shop_A_GroupBuy : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(78, 0);
    public bool pageadd = Manager.GetManagerQX(78, 1);
    public bool pageupdate = Manager.GetManagerQX(78, 2);
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Trademark DALT = new dal_Trademark();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    public string spicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Product\\";
    public string smallpicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Small\\";
    public string content = "";
    public string returnurl = "";
    public int usercount = 0;
    public int dengjicount = 0;
    public int zhuanliType = 0;
    public int okcount = 0;
    public int nocount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        div_a.InnerHtml = "";
        if (Request.QueryString["STime"] != null && Request.QueryString["STime"] != "")
        {
            this.txtStartDate.Value = Convert.ToDateTime(Request.QueryString["STime"]).ToString("yyyy-MM-dd");
        }
        if (Request.QueryString["ETime"] != null && Request.QueryString["ETime"] != "")
        {
            this.txtEndDate.Value = Convert.ToDateTime(Request.QueryString["ETime"]).ToString("yyyy-MM-dd");
        }

        if (!IsPostBack)
        {
            if (txtStartDate.Value != "" && txtEndDate.Value != "")
            {
                GetTrademarkOrderCountBySatatus(Convert.ToDateTime(txtStartDate.Value), Convert.ToDateTime(txtEndDate.Value));
            }
            else
            {
                GetTrademarkOrderCountBySatatus();
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtStartDate.Value != "" && txtEndDate.Value != "")
        {
            GetTrademarkOrderCountBySatatus(Convert.ToDateTime(txtStartDate.Value), Convert.ToDateTime(txtEndDate.Value));
        }
        else
        {
            GetTrademarkOrderCountBySatatus();
        }
    }
    private void GetTrademarkOrderCountBySatatus()
    {
        var TrademarkOrder = from o in dzdc.t_TrademarkOrder select o.i_Id;
        Ltl_TrademarkOrderCount_1.Text = TrademarkOrder.Count().ToString();

        var TrademarkOrder1 = from o in dzdc.t_TrademarkOrder where o.i_Status == 1 select o.i_Id;
        Ltl_TrademarkOrderCount_2.Text = TrademarkOrder1.Count().ToString();

        var TrademarkOrder2 = from o in dzdc.t_TrademarkOrder where o.i_Status == 2 select o.i_Id;
        Ltl_TrademarkOrderCount_3.Text = TrademarkOrder2.Count().ToString();

        var TrademarkOrder3 = from o in dzdc.t_TrademarkOrder where o.i_Status == 3 select o.i_Id;
        Ltl_TrademarkOrderCount_4.Text = TrademarkOrder3.Count().ToString();

        var TrademarkOrder4 = from o in dzdc.t_TrademarkOrder where o.i_Status == 4 select o.i_Id;
        Ltl_TrademarkOrderCount_5.Text = TrademarkOrder4.Count().ToString();

        var TrademarkOrder5 = from o in dzdc.t_TrademarkOrder where o.i_Status == 5 select o.i_Id;
        Ltl_TrademarkOrderCount_6.Text = TrademarkOrder5.Count().ToString();

    }
    private void GetTrademarkOrderCountBySatatus(DateTime stime, DateTime etime)
    {
        var TrademarkOrder = from o in dzdc.t_TrademarkOrder where o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_TrademarkOrderCount_1.Text = TrademarkOrder.Count().ToString();

        var TrademarkOrder1 = from o in dzdc.t_TrademarkOrder where o.i_Status == 1 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_TrademarkOrderCount_2.Text = TrademarkOrder1.Count().ToString();

        var TrademarkOrder2 = from o in dzdc.t_TrademarkOrder where o.i_Status == 2 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_TrademarkOrderCount_3.Text = TrademarkOrder2.Count().ToString();

        var TrademarkOrder3 = from o in dzdc.t_TrademarkOrder where o.i_Status == 3 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_TrademarkOrderCount_4.Text = TrademarkOrder3.Count().ToString();

        var TrademarkOrder4 = from o in dzdc.t_TrademarkOrder where o.i_Status == 4 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_TrademarkOrderCount_5.Text = TrademarkOrder4.Count().ToString();

        var TrademarkOrder5 = from o in dzdc.t_TrademarkOrder where o.i_Status == 5 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_TrademarkOrderCount_6.Text = TrademarkOrder5.Count().ToString();

        var TrademarkOrder6 = from o in dzdc.t_TrademarkOrder where o.i_Status == 6 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;

    }
}
