using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_dimanage : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(42, 0);
    public bool pageadd = Manager.GetManagerQX(42, 1);
    public bool pageupdate = Manager.GetManagerQX(42, 2);
    public bool pagedel = Manager.GetManagerQX(42, 3);
    dal_Address DALA = new dal_Address();
    public int ye = 1;
    public string Keyword = "";
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
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Page_value();
            Bind(ye, this.hoot.Value);
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind(1,this.hoot.Value);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal_Address area = new dal_Address();
                area.Area_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "省市地区管理", "删除地区");
        }
        Bind(aspPage.CurrentPageIndex, this.hoot.Value);
        HiddenDel.Value = "del";
    }
    public void Bind(int pageCurrent,string name)
    {
        Keyword = name;
        int PageSize = 20;
        int count = 0;
        this.rep_brand.DataSource = DALA.Area_SelectPage(pageCurrent, PageSize, name, ref count);
        this.rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        Bind(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex, this.hoot.Value);
        ye = aspPage.CurrentPageIndex;
    }
    protected void rep_brand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.ToString() != "")
        {
            t_Area model = DALA.Area_Select_Id(int.Parse(e.CommandName.ToString()));
            if (model != null)
            {
                if (model.i_Remote == 1)
                {
                    model.i_Remote = 0;
                }
                else
                {
                    model.i_Remote = 1;
                }
            }
            Manager.AddLog(0, "省市地区管理", "修改地区列表信息");
            DALA.Area_Update(model);
            Bind(aspPage.CurrentPageIndex, this.hoot.Value);
        }
    }
}