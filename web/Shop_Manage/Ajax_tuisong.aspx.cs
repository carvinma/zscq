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
using System.Xml.Linq;
using zscq.Model;
using zscq.DAL;

public partial class Shop_Manage_Ajax_tuisong : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataSystemDataContext dbhdc = new DataSystemDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
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
        //专利订单统计
        if (Request.QueryString["cc"] == "a")
        {
            var query = from q in dvdc.vw_PatentOrder where q.i_Status == 1 select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "b")
        {
            var query = from q in dvdc.vw_PatentOrder where q.i_Status == 7 select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "c")
        {
            var query = from q in dvdc.vw_PatentOrder where q.i_Status == 8 select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "d")
        {
            var query = from q in dvdc.vw_PatentOrder where q.i_Status == 9 select q;
            Response.Write(query.Count());
        }
        //商标订单统计

        if (Request.QueryString["cc"] == "11")
        {
            var query = from q in dzdc.t_TrademarkOrder where q.i_Status == 1 select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "12")
        {
            var query = from q in dzdc.t_TrademarkOrder where q.i_Status == 4 select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "13")
        {
            var query = from q in dzdc.t_TrademarkOrder where q.i_Status == 5 select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "15")
        {
            var query = from q in dzdc.t_TrademarkOrder where q.i_Status == 6 select q;
            Response.Write(query.Count());
        }

        if (Request.QueryString["cc"] == "4")
        {
            DateTime Now = DateTime.Now;
            DateTime Nows = Now.AddSeconds(-5);
            var query = from q in dzdc.t_PatentOrder where q.dt_AddTime > Nows && q.dt_AddTime < Now && (q.i_Status == 1) select q;
            Response.Write(query.Count());
        }
        if (Request.QueryString["cc"] == "exit")
        {
            if (Request.Cookies["zscqmanage"]["userid"] != null && Request.Cookies["zscqmanage"]["userid"].ToString() != "")
            {
                var iquery = from i in dbhdc.t_Manager where i.i_Id == int.Parse(Request.Cookies["zscqmanage"]["userid"].ToString()) select i;
                if (iquery.Count() > 0)
                {
                    foreach (var q in iquery)
                    {
                        Manager.AddLog(0, "退出系统", q.nvc_Name + "退出系统");
                    }
                }
            }
        }
    }
}
