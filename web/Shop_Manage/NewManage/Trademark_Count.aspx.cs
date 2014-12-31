using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Trademark_Count : System.Web.UI.Page
{
    DataProcDataContext proc = new DataProcDataContext();
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
        if (!IsPostBack)
        {
            Bind_Rpt_List();
        }
    }
    private void Bind_Rpt_List()//绑定
    {
        this.rptApply.DataSource= proc.pro_Count_Case_AdminStatus(0, 0);
        this.rptApply.DataBind();

        this.rptRenewal.DataSource= proc.pro_Count_Case_AdminStatus(1, 0);
        this.rptRenewal.DataBind();

        this.rptOrder.DataSource = proc.pro_Count_OrderStatus(0);
        this.rptOrder.DataBind();

        this.rptType.DataSource = proc.pro_Count_TrademarkType(0);
        this.rptType.DataBind();

        this.rptArea.DataSource = proc.pro_Count_TrademarkArea();
        this.rptArea.DataBind();
    }
}