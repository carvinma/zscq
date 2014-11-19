using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class Shop_Manage_shengmanage : System.Web.UI.Page
{
    public int ye = 1;
    public string Keyword = "";
    public bool ifhave = Manager.GetManagerQX(42,2);
    public dal_Nationality DALN = new dal_Nationality();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Page_value();
            BindBrand(ye, this.hoot.Value);
        }
        if (Manager.GetManagerQX(42,3) == false)
        {
            this.Button2.Visible = false;
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
        {
            this.hoot.Value = Request.QueryString["Keyword"].ToString();
        }
    }
    private void BindBrand(int pageCurrent, string name)
    {
        Keyword = name;
        int PageSize = 20;
        dal_Address area = new dal_Address();
        int count = 0;
        this.rep_brand.DataSource = area.Province_SelectPage(pageCurrent, PageSize, name,ref count);
        this.rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        BindBrand(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex, this.hoot.Value);
        ye = aspPage.CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BindBrand(1, this.hoot.Value);
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal_Address area = new dal_Address();
                area.Province_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "省市地区管理", "批量删除省份");
        }
        BindBrand(aspPage.CurrentPageIndex, "");
        HiddenDel.Value = "del";
    }
}