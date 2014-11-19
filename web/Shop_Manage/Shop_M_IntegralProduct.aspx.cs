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
using zscq.DAL;
using zscq.Model;
using System.Collections.Generic;

public partial class Shop_Manage_Shop_M_IntegralProduct : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(30, 0);
    public bool pageadd = Manager.GetManagerQX(30, 1);
    public bool pageupdate = Manager.GetManagerQX(30, 2);
    public bool pagedel = Manager.GetManagerQX(30, 3);
    public bool pagechu = Manager.GetManagerQX(30, 4);
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    public int ye = 1;
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
        HiddenDel.Value = "";
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_value();
            Bind_Rpt_IntegralProduct(ye);
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
            this.hw_name.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["language"] != null && Request.QueryString["language"] != "")
        {
            ddl_language.SelectedValue = Request.QueryString["language"].ToString();
        }
        if (Request.QueryString["show"] != null && Request.QueryString["show"] != "" && Request.QueryString["show"].ToString() != "-1")
        {
            this.DDL_Show.SelectedValue = Request.QueryString["show"].ToString();
        }
        if (Request.QueryString["recommend"] != null && Request.QueryString["recommend"] != "" && Request.QueryString["recommend"].ToString() != "-1")
        {
            this.DDL_Recommend.SelectedValue = Request.QueryString["recommend"].ToString();
        }
    }
    private void Bind_Rpt_IntegralProduct(int pageCurrent)
    {
        int count = 0;
        int PageSize = 20;
        var iquery = DALIP.IntegralProduct_SelectPage(pageCurrent, PageSize, int.Parse(this.ddl_type.SelectedValue), ddl_language.SelectedValue, int.Parse(this.DDL_Recommend.SelectedValue), int.Parse(this.DDL_Show.SelectedValue), this.hw_name.Value, ref count);
        this.rep_brand.DataSource = iquery;
        this.rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_IntegralProduct(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALIP.IntegralProduct_Del(int.Parse(IDList[i]));
                Manager.AddLog(0, "积分商品管理", "删除积分商品");
            }
        }
        Bind_Rpt_IntegralProduct(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void But_search_Click(object sender, EventArgs e)
    {
        Bind_Rpt_IntegralProduct(1);
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_IntegralProduct(1);
    }
    protected void rep_brand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataZscqDataContext dpdc = new DataZscqDataContext();
        string id = e.CommandArgument.ToString();
        var query = from q in dpdc.t_IntegralProduct where q.i_Id == int.Parse(id) select q;
        foreach (var q in query)
        {
            if (e.CommandName.ToString() == "i_Show")
            {
                if (q.i_Show == 0) { q.i_Show = 1; } else { q.i_Show = 0; }
            }
            else if (e.CommandName.ToString() == "i_Recommend")
            {
                if (q.i_Recommend == 0) { q.i_Recommend = 1; } else { q.i_Recommend = 0; }
            }
            Manager.AddLog(0, "积分商品管理", "修改积分商品列表信息");
            dpdc.SubmitChanges();
        }
        Bind_Rpt_IntegralProduct(aspPage.CurrentPageIndex);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Manager.AddLog(0, "积分商品管理", "导出积分商品列表");
        int count = 0;
        GridView1.DataSource = DALIP.IntegralProduct_SelectPage(1, 100000000, int.Parse(this.ddl_type.SelectedValue), ddl_language.SelectedValue, int.Parse(this.DDL_Recommend.SelectedValue), int.Parse(this.DDL_Show.SelectedValue), this.hw_name.Value, ref count);
        GridView1.DataBind();
        toExecl();
        GridView1.DataSource = null;
        GridView1.DataBind();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl()
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "UTF-8";
        Response.Write("<meta http-equiv=Content-Type content=text/html;charset=UTF-8>");
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        // 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！ 
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        //this.Page.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        this.GridView1.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();

    }
}
