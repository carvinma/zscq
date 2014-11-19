using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class Shop_Manage_shop_webcount : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(6, 0);
    public bool pagedel = Manager.GetManagerQX(6, 3);
    public bool pagechu = Manager.GetManagerQX(6, 4);
    dal_Manager dal = new dal_Manager();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_ddl_admin();
            BindFenlei();
            BindBrand(1); 
        }
    }
    public void BindFenlei()
    {
        ListItem item = new ListItem("全部频道", "0");
        this.ddl_pindao.Items.Add(item);
        dal_Manager dal = new dal_Manager();
        this.ddl_pindao.DataSource = dal.Set_SystemType();
        this.ddl_pindao.DataTextField = "leibie";
        this.ddl_pindao.DataValueField = "leibie";
        this.ddl_pindao.DataBind();
    }
    public void Bind_ddl_admin()
    {
        this.ddl_admin.Items.Add(new ListItem("请选择管理员", ""));
        dal_Manager dal = new dal_Manager();
        this.ddl_admin.DataSource = dal.Manager_SelectAll();
        this.ddl_admin.DataTextField = "nvc_Name";
        this.ddl_admin.DataValueField = "i_Id";
        this.ddl_admin.DataBind();
    }
    private void BindBrand(int pageCurrent)
    {
        int PageSize = 20;
        int count = 0;
        string name = this.ddl_admin.SelectedValue;
        string yemian = this.ddl_pindao.SelectedValue;
        DateTime begin = DateTime.MinValue;
        DateTime end = DateTime.MaxValue;
        if (hot_start_date.Value != "") { begin = DateTime.Parse(hot_start_date.Value); }
        if (hot_end_date.Value != "") { end = DateTime.Parse(hot_end_date.Value).AddDays(1); }
        this.rep_brand.DataSource = dal.SystemLog_SelectPage(pageCurrent, PageSize, name, yemian, begin, end, ref count);
        this.rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        BindBrand(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        BindBrand(1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal_Manager dal = new dal_Manager();
                dal.SystemLog_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "权限管理", "删除系统日志[ <font color=\"red\">" + IDList.Length + "</font> ]条");
        }
        BindBrand(this.aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int count = 0;
        string name = this.ddl_admin.SelectedValue;
        string yemian = this.ddl_pindao.SelectedValue;
        DateTime begin = DateTime.MinValue;
        DateTime end = DateTime.MaxValue;
        if (hot_start_date.Value != "") { begin = DateTime.Parse(hot_start_date.Value); }
        if (hot_end_date.Value != "") { begin = DateTime.Parse(hot_end_date.Value); }
        GridView1.DataSource = dal.SystemLog_SelectPage(1, 100000000, name, yemian, begin, end, ref count);
        GridView1.DataBind();
        toExecl();
        GridView1.DataSource = null;
        GridView1.DataBind();
        Manager.AddLog(0, "权限管理", "导出系统日志列表");
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
        //如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GridView1.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
}
