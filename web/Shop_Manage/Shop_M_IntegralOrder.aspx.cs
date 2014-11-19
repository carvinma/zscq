using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using System.Data;
using zscq.DAL;
using System.Text;
using System.IO;

public partial class Shop_Manage_shop_sub : System.Web.UI.Page
{
    public bool pageview8 = Manager.GetManagerQX(30, 0);
    public bool pageupdate8 = Manager.GetManagerQX(30, 2);
    public bool pagedel8 = Manager.GetManagerQX(30, 3);
    public bool pagechu8 = Manager.GetManagerQX(30, 4);

    public bool pageupdateserver = Manager.GetManagerQX(30, 2);//修改客服

    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_IntegralOrderDetails DALIOD = new dal_IntegralOrderDetails();
    //dal_Manager DALM = new dal_Manager();
    dal_Address DALA = new dal_Address();

    public int syy = 0;
    public int xyy = 0;
    public int sumy = 0;

    public int ye = 1;
    public int State = 0;
    public int SType = 0;
    public int TimeType = 1;
    public string Keyword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        div_a.InnerHtml = "";
        daochu.InnerHtml = "";
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            DALA.Provice_Bind_DDL(ddl_sheng);
            Bind_Page_value();
            Bind_Rpt_IntegralOrder(ye);
            SetTabStatus();
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["status"] != null && Request.QueryString["status"] != "")
        {
            this.ddlStatus.SelectedValue = Request.QueryString["status"].ToString();
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"] != "")
        {
            this.txtKeyword.Text = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["SType"] != null && Request.QueryString["SType"] != "")
        {
            this.ddlType.SelectedValue = Request.QueryString["SType"].ToString();
            if (this.ddlType.SelectedValue == "2")
            {
                this.labTitle.Text = Request.QueryString["Keyword"] + "的积分订单";
            }
        }
        if (Request.QueryString["PId"] != null && Request.QueryString["PId"] != "" && Request.QueryString["PId"] != "0")
        {
            ddl_sheng.SelectedValue = Request.QueryString["PId"].ToString();
            DALA.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
        }
        if (Request.QueryString["CId"] != null && Request.QueryString["CId"] != "" && Request.QueryString["CId"] != "0")
        {
            ddl_city.SelectedValue = Request.QueryString["CId"].ToString();
            DALA.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
        }
        if (Request.QueryString["AId"] != null && Request.QueryString["AId"] != "" && Request.QueryString["AId"] != "0")
        {
            ddl_diqu.SelectedValue = Request.QueryString["AId"].ToString();
        }
        if (Request.QueryString["STime"] != null && Request.QueryString["STime"] != "")
        {
            this.txtStartDate.Value = Convert.ToDateTime(Request.QueryString["STime"]).ToString("yyyy-MM-dd");
        }
        if (Request.QueryString["ETime"] != null && Request.QueryString["ETime"] != "")
        {
            this.txtEndDate.Value = Convert.ToDateTime(Request.QueryString["ETime"]).ToString("yyyy-MM-dd");
        }
    }
    private void SetTabStatus()
    {
        if (Request.QueryString["status"] != null)
        {
            if (Request.QueryString["status"] == "0")
                td0.Attributes.Add("background", "images/ddbgs.jpg");
            //else if (Request.QueryString["status"] == "1")
            //  td1.Attributes.Add("background", "images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "2")
                td2.Attributes.Add("background", "images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "3")
                td3.Attributes.Add("background", "images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "4")
                td4.Attributes.Add("background", "images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "5")
                td5.Attributes.Add("background", "images/ddbgs.jpg");
            //else if (Request.QueryString["status"] == "6")
            //    td6.Attributes.Add("background", "images/ddbgs.jpg");
        }
    }
    protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)
    {
        DALA.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
        DALA.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    }
    protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
    {
        DALA.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    }
    private void Bind_Rpt_IntegralOrder(int pageCurrent)//绑定积分订单
    {
        int count = 0;
        int PageSize = 20;
        State = Convert.ToInt32(this.ddlStatus.SelectedValue);
        Keyword = txtKeyword.Text;
        SType = int.Parse(this.ddlType.SelectedValue);
        var query = DALIO.IntegralOrder_vw_SelectPage(pageCurrent, PageSize, Keyword, SType, State, int.Parse(ddl_sheng.SelectedValue), int.Parse(ddl_city.SelectedValue), int.Parse(ddl_diqu.SelectedValue), txtStartDate.Value, txtEndDate.Value, ref count);
        this.repOrder.DataSource = query;
        this.repOrder.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        syy = pageCurrent - 1;
        xyy = pageCurrent + 1;
        sumy = aspPage.PageCount;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void repOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rep = e.Item.FindControl("repProduct") as Repeater;
            CheckBox cbid = (CheckBox)e.Item.FindControl("cbOrder");
            int orderID = Convert.ToInt32(cbid.ToolTip);
            rep.DataSource = new dal_IntegralOrderDetails().IntegralOrderDetails_vw_Select_OrderId(orderID);
            rep.DataBind();
        }
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_IntegralOrder(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    public string ConvertStatus(object obj)
    {
        return DALIO.Set_IntegralOrderState(obj);
    }
    protected void btnDelete_Click(object sender, EventArgs e)//删除积分订单
    {
        for (int i = 0; i < repOrder.Items.Count; i++)
        {
            CheckBox cb = (CheckBox)repOrder.Items[i].FindControl("cbOrder");
            if (cb.Checked)
            {
                int orderID = Convert.ToInt32(cb.ToolTip);
                DALIO.IntegralOrder_Del_ByProc(orderID);
                Manager.AddLog(0, "积分订单管理", "删除积分订单");
            }
        }
        Bind_Rpt_IntegralOrder(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Bind_Rpt_IntegralOrder(1);
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        int count = 0;
        State = Convert.ToInt32(this.ddlStatus.SelectedValue);
        Keyword = txtKeyword.Text;
        SType = int.Parse(this.ddlType.SelectedValue);
        GridView1.DataSource = DALIO.IntegralOrder_vw_SelectPage(1, 100000000, Keyword, SType, State, int.Parse(ddl_sheng.SelectedValue), int.Parse(ddl_city.SelectedValue), int.Parse(ddl_diqu.SelectedValue), txtStartDate.Value, txtEndDate.Value, ref count);
        GridView1.DataBind();
        toExecl(GridView1);
        GridView1.DataSource = null;
        GridView1.DataBind();
        Manager.AddLog(0, "积分订单管理", "导出商品积分订单列表");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl(GridView GV)
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        //如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GV.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
}