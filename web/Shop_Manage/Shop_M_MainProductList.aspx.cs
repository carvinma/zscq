using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class Shop_Manage_NewManage_Goods_MainCategoryList : System.Web.UI.Page
{
    public int PageNo = 1;//页码
    public string Keyword = "";
    public bool ifhave = Manager.GetManagerQX(42, 2);
    dal_Goods goods = new dal_Goods();
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
            BindMainCategory(PageNo, this.hoot.Value.Trim());
        }
        if (Manager.GetManagerQX(42, 3) == false)
        {
            this.Button2.Visible = false;
        }
    }

    public void Bind_Page_value()
    {
        if (Request.QueryString["PageNo"] != null && Request.QueryString["PageNo"].ToString() != "")
        {
            PageNo = int.Parse(Request.QueryString["PageNo"].ToString());
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
        {
            this.hoot.Value = Request.QueryString["Keyword"].ToString();
        }
    }
    private void BindMainCategory(int pageCurrent, string name)
    {
        Keyword = name;
        int PageSize = 20;
      
        int count = 0;
        this.rep_brand.DataSource = goods.MainCategory_SelectPage(pageCurrent, PageSize, name, ref count);
        this.rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        BindMainCategory(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex, this.hoot.Value);
        PageNo = aspPage.CurrentPageIndex;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindMainCategory(1, this.hoot.Value.Trim());
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                goods.MainCategory_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "商品大类管理", "批量删除商品大类");
        }
        BindMainCategory(aspPage.CurrentPageIndex, "");
        HiddenDel.Value = "del";
    }
}