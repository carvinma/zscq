using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_smscount : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(79, 0);
    public bool pagedel = Manager.GetManagerQX(79, 3);
    public bool pagechu = Manager.GetManagerQX(79, 4);

    dal_UserIntegralNote DALIN = new dal_UserIntegralNote();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        if (!IsPostBack)
        {
            hot_start_date.Value = DateTime.Now.AddMonths(-6).ToString("yyyy-MM-dd");
            hot_end_date.Value = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            Bind_Rpt_RebateNote(1);
        }
    }
    public void Bind_Rpt_RebateNote(int PageIndex)
    {
        int count = 0;
        int PageSize = 20;
        string STime = hot_start_date.Value;
        string ETime = hot_end_date.Value;
        rep_brand.DataSource = DALIN.IntegralNote_Select_Page(PageIndex, PageSize, text_Keyword.Value, "", STime, ETime, ref count);
        rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = PageIndex;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_RebateNote(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
    protected void btnGet_Click(object sender, EventArgs e)
    {
        Bind_Rpt_RebateNote(1);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                int ret = DALIN.IntegralNote_Del(int.Parse(IDList[i]));
                if (ret == 1)
                {
                    Manager.AddLog(0, "用户积分管理", "删除积分流水");
                }
                else
                {
                    div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
                    return;
                }
            }
        }
        Bind_Rpt_RebateNote(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int count = 0;
        string STime = hot_start_date.Value;
        string ETime = hot_end_date.Value;
        GridView1.DataSource = DALIN.IntegralNote_Select_Page(1, 10000000, text_Keyword.Value, "", STime, ETime, ref count);
        GridView1.DataBind();
        toExecl();
        GridView1.DataSource = null;
        GridView1.DataBind();
        Manager.AddLog(0, "返利管理系统", "导出返利流水");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl()
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        // 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        this.GridView1.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
}
