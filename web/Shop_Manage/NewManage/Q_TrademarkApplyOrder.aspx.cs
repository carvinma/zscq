﻿using System;
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

public partial class Q_TrademarkApplyOrder : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(22, 0);
    public bool pageupdate = Manager.GetManagerQX(22, 2);
    public bool pagedel = Manager.GetManagerQX(22, 3);
    public bool pagechu = Manager.GetManagerQX(22, 4);
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_NewTrademark mark = new dal_NewTrademark();
    public int syy = 0;
    public int xyy = 0;
    public int sumy = 0;

    public int ye = 1;
    public int State = 0;
    public int SType = 0;
    public int TimeType = 1;
    public string Keyword = "";
    public string ordernum = "";
    public string username = "", cname="",cbianhao="";
    public string orderstate = "";
    public string totalmoney = "";
    public string addtime = "";
    public string paytime = "";
    public DateTime STime = DateTime.Now.AddMonths(-1);
    public DateTime ETime = DateTime.Now.AddDays(1);
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
        div_a.InnerHtml = "";
        daochu.InnerHtml = "";
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            BindDDLOrderStatsus();
            Bind_Page_value();
            Bind_Rpt_Order(ye);
            SetTabStatus();
        }
    }
    private void BindDDLOrderStatsus()
    {
        Dictionary<string, int?> dic = new Dictionary<string, int?>();
        dic.Add("全部", -1);
        for (int i = 0; i <= 1; i++)
        {
            string key = EnumManager.GetDescription(typeof(ApplyUserTypeEnum), i);
            if (!string.IsNullOrEmpty(key))
                dic.Add(key, i);
        }

        this.ddl_SbType.DataSource = dic;
        this.ddl_SbType.DataTextField = "Key";
        this.ddl_SbType.DataValueField = "Value";
        this.ddl_SbType.DataBind();

        List<t_NewTradeMarkStatus> tradeMarkStatuslist = BaseDataUtil.tradeMarkOrderStatuslist.ToList();
        tradeMarkStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = -1 });
        this.ddlStatus.DataSource = tradeMarkStatuslist;
        this.ddlStatus.DataTextField = "StatusName";
        this.ddlStatus.DataValueField = "StatusValue";
        this.ddlStatus.DataBind();
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
        
        if (Request.QueryString["SbType"] != null && Request.QueryString["SbType"] != "" && Request.QueryString["SbType"] != "-1")
        {
            ddl_SbType.SelectedValue = Request.QueryString["SbType"].ToString();
        }

        if (Request.QueryString["ordernum"] != null && Request.QueryString["ordernum"] != "")
        {
            ordernum = Request.QueryString["ordernum"].ToString();
            ordernum1.Value = ordernum;
        }

        if (Request.QueryString["username"] != null && Request.QueryString["username"] != "")
        {
            this.username = Request.QueryString["username"].ToString();
            username1.Value = username;
        }
        if (Request.QueryString["cname"] != null && Request.QueryString["cname"] != "")
        {
            this.cname = Request.QueryString["cname"].ToString();
            cname1.Value = cname;
        }
        if (Request.QueryString["cbianhao"] != null && Request.QueryString["cbianhao"] != "")
        {
            this.cbianhao = Request.QueryString["cbianhao"].ToString();
            cbianhao1.Value = cbianhao;
        }
        if (Request.QueryString["orderstate"] != null && Request.QueryString["orderstate"] != "")
        {
            this.orderstate = Request.QueryString["orderstate"].ToString();
            orderstate1.Value = orderstate;
        }
        if (Request.QueryString["totalmoney"] != null && Request.QueryString["totalmoney"] != "")
        {
            this.totalmoney = Request.QueryString["totalmoney"].ToString();
            totalmoney1.Value = totalmoney;
        }
        if (Request.QueryString["addtime"] != null && Request.QueryString["addtime"] != "")
        {
            this.addtime = Request.QueryString["addtime"].ToString();
            addtime1.Value = addtime;
        }
        if (Request.QueryString["paytime"] != null && Request.QueryString["paytime"] != "")
        {
            this.paytime = Request.QueryString["paytime"].ToString();
            paytime1.Value = paytime;
        }
    }
    private void SetTabStatus()
    {
        if (Request.QueryString["status"] != null)
        {
            if (Request.QueryString["status"] == "-1")
                td0.Attributes.Add("background", "../images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "0")
                td1.Attributes.Add("background", "../images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "1")
                td2.Attributes.Add("background", "../images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "2")
                td3.Attributes.Add("background", "../images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "3")
                td5.Attributes.Add("background", "../images/ddbgs.jpg");
            else if (Request.QueryString["status"] == "4")
                td6.Attributes.Add("background", "../images/ddbgs.jpg");
        }
    }

    private void Bind_Rpt_Order(int pageCurrent)//绑定订单
    {
        int count = 0;
        int PageSize = 20;
        State = Convert.ToInt32(this.ddlStatus.SelectedValue);
        Keyword = txtKeyword.Text; 
        SType = int.Parse(this.ddlType.SelectedValue);    
        TimeType = int.Parse(this.ddlTimeType.SelectedValue);
        IQueryable query = DALTO.TrademarkOrder_New_SelectPage(pageCurrent, PageSize,0, Keyword, SType, State, int.Parse(ddl_SbType.SelectedValue), TimeType, txtStartDate.Value, txtEndDate.Value, ordernum, username, cname, cbianhao, orderstate, totalmoney, addtime, paytime, ref count);
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
           
            //CheckBox cbid = (CheckBox)e.Item.FindControl("cbOrder");
            //int orderID = Convert.ToInt32(cbid.ToolTip);

            Repeater repCaseNo = e.Item.FindControl("repTrademark") as Repeater;//案件号
            HiddenField oid = (HiddenField)e.Item.FindControl("hf_oid");
            Repeater rep = e.Item.FindControl("repProduct") as Repeater; //商标注册号

            var iquery = mark.Trademark_web_Excel(oid.Value.Split(','));
            repCaseNo.DataSource = iquery;
            repCaseNo.DataBind();

            rep.DataSource = iquery;
            rep.DataBind();
        }
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_Order(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    public string ConvertStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkOrderStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
    }

    protected void btnDelete_Click(object sender, EventArgs e)//删除订单
    {
        for (int i = 0; i < repOrder.Items.Count; i++)
        {
            CheckBox cb = (CheckBox)repOrder.Items[i].FindControl("cbOrder");
            if (cb.Checked)
            {
                int orderID = Convert.ToInt32(cb.ToolTip);
                DALTO.NewTrademarkOrder_Del(orderID);
                Manager.AddLog(0, "商标订单管理", "删除商标订单");
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

    protected void btnExport_Click(object sender, EventArgs e)
    {
        Manager.AddLog(0, "订单管理", "导出商标订单列表");
        int count = 0;
        State = Convert.ToInt32(this.ddlStatus.SelectedValue);
        Keyword = txtKeyword.Text;
        SType = int.Parse(this.ddlType.SelectedValue);
        TimeType = int.Parse(this.ddlTimeType.SelectedValue);
                             //  DALTO.TrademarkOrder_New_SelectPage(pageCurrent, PageSize, 0, Keyword, SType, State, int.Parse(ddl_SbType.SelectedValue), TimeType, txtStartDate.Value, txtEndDate.Value, ordernum, username, cname, cbianhao, orderstate, totalmoney, addtime, paytime, ref count);
        GridView1.DataSource = DALTO.TrademarkOrder_New_SelectPage(1, 100000000,0, Keyword, SType, State, int.Parse(ddl_SbType.SelectedValue), TimeType, txtStartDate.Value, txtEndDate.Value, ordernum, username, cname, cbianhao, orderstate, totalmoney, addtime, paytime, ref count);
        GridView1.DataBind();
        toExecl(GridView1);
        GridView1.DataSource = null;
        GridView1.DataBind();

    }

}