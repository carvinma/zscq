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
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_Shop_A_Dealer : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(51, 0);
    public bool pageadd = Manager.GetManagerQX(51, 1);
    public bool pageupdate = Manager.GetManagerQX(51, 2);
    dal_EmailModel DALE = new dal_EmailModel();
    public string content = "";
    public string returnurl = "";
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
        Bind_Page_value();
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(Drp_LanguageList);
            Bind_Page_Info();
        }
    }
    public void Bind_Page_value()
    {
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
    }
    private void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "0")
        {
            hd1.Value = Request.QueryString["id"].ToString();
            t_EmailModel EmailModel = DALE.EmailModel_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (EmailModel != null)
            {
                admin_realname.Value = EmailModel.nvc_Name.Trim();
                sub_frommobi.Value = EmailModel.i_OrderbyNo.ToString().Trim();
                text_title.Value = EmailModel.nvc_Title.Trim();
                content = EmailModel.nt_Content.Trim();
                Drp_LanguageList.SelectedValue = EmailModel.nvc_Language;
            }
        }
    }
    protected void but_add_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(admin_realname.Value))
        {
            div_a.InnerHtml = "<script>alert('模板名称不能为空');</script>"; return;
        }
        else
        {
            t_EmailModel model = new t_EmailModel();
            model.nvc_Name = this.admin_realname.Value;

            try
            {
                model.i_OrderbyNo = int.Parse(sub_frommobi.Value.Trim());
            }
            catch { }
            model.nvc_Language = Drp_LanguageList.SelectedValue;
            model.nvc_Title = text_title.Value.Trim();
            model.nt_Content = Request.Form["myContent"];
            if (Request.QueryString["id"] != null)
            {
                model.i_Id = int.Parse(Request.QueryString["id"].ToString());
                DALE.EmailModel_Update(model);
                Manager.AddLog(0, "邮件管理", "修改邮件模板[ <font color=\"red\">" + model.nvc_Name + "</font> ]的信息");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_EmailModel.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=邮件模板&hreftype=2&href1=Shop_A_EmailModel.aspx&href2=" + twourl);
            }
            else
            {
                model.dt_AddTime = DateTime.Now;
                DALE.EmailModel_Add(model);
                Manager.AddLog(0, "邮件管理", "添加邮件模板[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_EmailModel.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=邮件模板&hreftype=1&href1=Shop_A_EmailModel.aspx&href2=" + twourl);
            }
        }
    }
}
