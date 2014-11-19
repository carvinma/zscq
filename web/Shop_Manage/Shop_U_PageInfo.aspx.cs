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
using zscq.Model;
using zscq.DAL;

public partial class Shop_Manage_shop_PageManageUpdate : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(4, 0);
    public bool pageupdate = Manager.GetManagerQX(4, 2);
    dal_PageInfo dal_P = new dal_PageInfo();
    public string returnurl = "";

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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = "lang=" + Request.QueryString["lang"];
        }
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Input_PageInfo();
        }
    }
    public void Bind_Input_PageInfo()
    {
        if (Request.QueryString["Id"] != null && Request.QueryString["Id"].ToString() != "")
        {
            t_PageInfo PageInfo = dal_P.PageInfo_Select_Id(int.Parse(Request.QueryString["Id"].ToString()));
            if (PageInfo != null)
            {
                ddl_language.SelectedValue = PageInfo.nvc_Language;
                lb_PageName.InnerText = PageInfo.PageName;
                PageTitle.Value = PageInfo.PageTitle;
                PageKeywords.Value = PageInfo.PageKeywords;
                PageDescription.Value = PageInfo.PageDescription;
            }
        }
    }
    protected void Bt_SavePageInfo_Click(object sender, EventArgs e)
    {
        int PageId = int.Parse(Request.QueryString["Id"].ToString());
        t_PageInfo model = dal_P.PageInfo_Select_Id(PageId);
        model.PageTitle = PageTitle.Value;
        model.PageKeywords = PageKeywords.Value;
        model.PageDescription = PageDescription.Value;

        model.nvc_Language = ddl_language.SelectedValue;
        //  Response.Write(ddl_language.SelectedValue);
        int ret = dal_P.PageInfo_Update(model);
        if (ret == 1)
        {
            Manager.AddLog(0, "系统设置", "修改了页面优化设置[ <font color=\"red\">" + lb_PageName.InnerText + "</font> ]");//修改会员日志
            Response.Redirect("Shop_M_PageInfo.aspx?del=del&" + returnurl);
        }
        Response.Redirect("Shop_M_PageInfo.aspx?lang=" + returnurl);
    }
}
