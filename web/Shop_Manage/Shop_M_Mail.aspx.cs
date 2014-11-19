using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_mailcount : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(52, 0);
    public bool pageadd = Manager.GetManagerQX(52, 1);//没有发送权限设置，默认修改既可操作
    public bool pagedel = Manager.GetManagerQX(52, 3);
    dal_Email dal = new dal_Email();
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
            Bind_Rpt_List(0);
        }
    }
    public void Bind_Rpt_List(int pageCurrent)
    {
        int count = 0;
        string language = Drp_LanguageList.SelectedValue;
        this.rpList.DataSource = dal.EmailNote_SelectPage(aspPage.PageSize * (aspPage.CurrentPageIndex - 1), aspPage.PageSize, this.txtKeyword.Text.Trim(), this.ddlType.SelectedItem.Text, language, ref count);
        this.rpList.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = aspPage.PageSize;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)// 分页
    {
        Bind_Rpt_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(0);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal.EmailNote_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "邮件管理", "删除邮件发送记录");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
}
