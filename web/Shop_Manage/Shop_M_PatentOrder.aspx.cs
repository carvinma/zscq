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
    public bool pageview = Manager.GetManagerQX(12, 0);
    public bool pageupdate = Manager.GetManagerQX(12, 2);
    public bool pagedel = Manager.GetManagerQX(12, 3);
    public bool pagechu = Manager.GetManagerQX(12, 4);

    dal_Manager DALM = new dal_Manager();
    public dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    public int syy = 0;
    public int xyy = 0;
    public int sumy = 0;
    public string ids = "";
    public int ye = 1;
    public int State = 0;
    public int orderby = 0;
    public int SType = 0;
    public int NType = 0;
    public int TimeType = 1;
    public string Keyword = "";
    public string returnurl = "";
    public string status = "";
    public string STime = "";
    public string ETime = "";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (Request["Status"] != null)
        {
            status = Request["Status"].ToString();
        }
        div_a.InnerHtml = "";
        daochu.InnerHtml = "";
        HiddenDel.Value = "";
        ids = "";
        if (!IsPostBack)
        {
            Bind_Drp_PatentSqg();
            Bind_Page_value();
            Bind_Rpt_Order(ye);
            SetTabStatus();

        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"] != "")
        {
            this.txtKeyword.Text = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["SType"] != null && Request.QueryString["SType"] != "")
        {
            this.ddlType.SelectedValue = Request.QueryString["SType"].ToString();
        }
        if (Request.QueryString["NType"] != null && Request.QueryString["NType"] != "")
        {
            Drp_PatentSqg.SelectedValue = Request.QueryString["NType"].ToString();
        }
        if (Request.QueryString["TimeType"] != null && Request.QueryString["TimeType"] != "")
        {
            this.ddlTimeType.SelectedValue = Request.QueryString["TimeType"].ToString();
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
                td0.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "1")
                td1.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "2")
                td2.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "3")
                td3.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "4")
                td4.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "5")
                td5.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "6")
                td6.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "7")
                td7.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "8")
                td8.Attributes.Add("style", "background-color:White");
            else if (Request.QueryString["status"] == "9")
                td9.Attributes.Add("style", "background-color:White");
        }
    }
    private void Bind_Rpt_Order(int pageCurrent)//绑定订单
    {
        if (Request["ob_Status"] != null)
        {
            if (Request["ob_Status"].ToString() == "0")
            {
                HF_StatusAsc.Value = "asc";
                orderby = 1;
            }
            else
            {
                HF_StatusAsc.Value = "desc";
                orderby = 2;
            }
        }
        if (Request["ob_AddTime"] != null)
        {
            if (Request["ob_AddTime"].ToString() == "0")
            {
                HF_AddTimeAsc.Value = "asc";
                orderby = 3;
            }
            else
            {
                HF_AddTimeAsc.Value = "desc";
                orderby = 4;
            }
        }
        if (Request["ob_PayTime"] != null)
        {
            if (Request["ob_PayTime"].ToString() == "0")
            {
                HF_PayTimeAsc.Value = "asc";
                orderby = 5;
            }
            else
            {
                HF_PayTimeAsc.Value = "desc";
                orderby = 6;
            }
        }
        int count = 0;
        //int PageSize = 20;
        State = Convert.ToInt32(Request["Status"]);
        Keyword = txtKeyword.Text;
        SType = int.Parse(this.ddlType.SelectedValue);
        NType = int.Parse(Drp_PatentSqg.SelectedValue);
        TimeType = int.Parse(this.ddlTimeType.SelectedValue);
        STime = this.txtStartDate.Value;
        ETime = this.txtEndDate.Value;
        IQueryable query = DALPO.PatentOrder_SelectPage(pageCurrent, aspPage.PageSize, State, orderby, Keyword, SType, NType, TimeType, STime, ETime, ref count);
        this.repOrder.DataSource = query;
        this.repOrder.DataBind();
        aspPage.RecordCount = count;
        //aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        //syy = pageCurrent - 1;
        //xyy = pageCurrent + 1;
        //sumy = aspPage.PageCount;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void repOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rep = e.Item.FindControl("Rpt_PatentNameList") as Repeater;
            HiddenField hid = e.Item.FindControl("hf_Id") as HiddenField;
            //if (ids.Contains(hid.Value))
            //{
            //    e.Item.Visible = false;
            //}
            //else
            //{
            //    ids += hid.Value;
            //}
            rep.DataSource = DALPOI.PatentOrderInfo_Select_OrderId(int.Parse(hid.Value));
            rep.DataBind();
        }
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_Order(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void btnDelete_Click(object sender, EventArgs e)//删除订单
    {
        for (int i = 0; i < repOrder.Items.Count; i++)
        {
            CheckBox cb = (CheckBox)repOrder.Items[i].FindControl("cbOrder");
            if (cb.Checked)
            {
                int orderID = Convert.ToInt32(cb.ToolTip);
                //t_PatentOrder tpo = DALPO.PatentOrder_Select_Id(orderID);
                //IQueryable<t_PatentOrderInfo> list = DALPOI.PatentOrderInfoList_Select_Number(tpo.i_Id);
                //foreach(var v in list)
                //{
                //    DALPOI.PatentOrderInfo_Del(v.i_Id);
                //}
                DALPO.PatentOrder_Del(orderID);
                Manager.AddLog(0, "专利订单管理", "删除专利订单");
            }
        }
        Bind_Rpt_Order(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Bind_Rpt_Order(1);
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        Manager.AddLog(0, "专利订单管理", "导出专利订单");
        int count = 0;
        //State = Convert.ToInt32(Request["Status"]);
        //Keyword = txtKeyword.Text;
        //SType = int.Parse(this.ddlType.SelectedValue);
        //TimeType = int.Parse(this.ddlTimeType.SelectedValue);
         State = Convert.ToInt32(Request["Status"]);
        Keyword = txtKeyword.Text;
        SType = int.Parse(this.ddlType.SelectedValue);
        NType = int.Parse(Drp_PatentSqg.SelectedValue);
        TimeType = int.Parse(this.ddlTimeType.SelectedValue);
        STime = this.txtStartDate.Value;
        ETime = this.txtEndDate.Value;
        GridView1.DataSource = DALPO.PatentOrder_SelectPage(1, 100000000, State, orderby, Keyword, SType, NType, TimeType, STime, ETime, ref count);
        GridView1.DataBind();
        toExecl(GridView1);
        GridView1.DataSource = null;
        GridView1.DataBind();
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

    void Bind_Drp_PatentSqg()
    {
        dal_Nationality DALN = new dal_Nationality();
        Drp_PatentSqg.Items.Clear();
        ListItem item = new ListItem("选择专利授权国", "0");
        Drp_PatentSqg.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_PatentSqg.Items.Add(li);
        }
    }
    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.DataItemIndex > 0)
    //    {
    //        vw_PatentOrder v = e.Row.DataItem as vw_PatentOrder;
          
    //        if (ids.Contains(v.i_Id.ToString()))
    //        {
    //            e.Row.Visible = false;
    //        }
    //        else
    //        {
    //            ids += v.i_Id.ToString();
    //        }
    //    }
    //}
}