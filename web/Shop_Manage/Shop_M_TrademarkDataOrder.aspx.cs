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
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    public bool pagedel = Manager.GetManagerQX(21, 3);
    public bool pagechu = Manager.GetManagerQX(21, 4);
    public dal_DataOrder DALDO = new dal_DataOrder();
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
            Bind_Rpt_Patent(ye);
        }
    }

    public void Bind_Rpt_Patent(int pageCurrent)
    {
        ye = pageCurrent;
        int Ccount = 0;
        int PageSize = 20;
        reptlist.DataSource = DALDO.DataOrder_SelectPage(pageCurrent, PageSize, 1, "", "", ref Ccount);
        reptlist.DataBind();
        aspPage.RecordCount = Ccount;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + Ccount + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";

    }

    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_Patent(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
     
    }
   
  
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALDO.DataOrder_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "专利年份管理", "删除专利年份");
        }
        Bind_Rpt_Patent(ye);
        HiddenDel.Value = "del";
    }

}