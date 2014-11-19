using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.ComponentModel;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_dl : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(51, 0);
    public bool pageadd = Manager.GetManagerQX(51, 1);
    public bool pageupdate = Manager.GetManagerQX(51, 2);
    public bool pagedel = Manager.GetManagerQX(51, 3);
    dal_EmailModel dal = new dal_EmailModel();
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
            LanguageConfig.BindLanguage(Drp_LanguageList);
            Bind_Page_value();
            Bind_Rpt_List(ye);
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
            this.user_namee.Value = Request.QueryString["Keyword"].ToString();
        }
    }
    private void Bind_Rpt_List(int pageCurrent)
    {
        int PageSize = 20;
        int count = 0;
        Keyword = this.user_namee.Value;
        IQueryable iquery = dal.EmailModel_SelectPage(pageCurrent, PageSize, Keyword, Drp_LanguageList.SelectedValue, ref count);
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
        Bind_Rpt_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);//翻页
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal.EmailModel_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "邮件管理", "批量删除邮件模板" + IDList.Length + "条");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
}


