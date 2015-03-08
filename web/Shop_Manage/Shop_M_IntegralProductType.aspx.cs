using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_Shop_M_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(44, 0);
    public bool pageadd = Manager.GetManagerQX(44, 1);
    public bool pageupdate = Manager.GetManagerQX(44, 2);
    public bool pagedel = Manager.GetManagerQX(44, 3);
    public bool pagechu = Manager.GetManagerQX(44, 4);
    public dal_IntegralProductType DALPT = new dal_IntegralProductType();
    
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
            
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        
    }
   public void Bind_Rpt_ProductType(int index)
    {
        int pageindex = index;
        int pagesiz = 20;
        int count = 0;
        reptlist.DataSource = DALPT.MainIntegralProductType_SelectAll(pageindex, pagesiz,  ref count);
        reptlist.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pagesiz;
        aspPage.CurrentPageIndex = index;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_ProductType(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_ProductType(1);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALPT.IntegralProductType_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "专利类型管理", "删除专利类型");
        }
        Bind_Rpt_ProductType(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }

}