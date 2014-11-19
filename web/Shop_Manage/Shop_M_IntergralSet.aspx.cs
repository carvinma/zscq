using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;

public partial class Shop_Manage_shop_upsystem : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(1, 0);
    public bool pageupdate = Manager.GetManagerQX(1, 2);
    dal_SystemSetup DALS = new dal_SystemSetup();
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
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Info()
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        Txt_PatentIntergral.Text = model.i_ZlIntergral.ToString();
        Txt_SbIntergral.Text = model.i_SbIntergral.ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        model.i_ZlIntergral = Convert.ToInt32(Txt_PatentIntergral.Text);
        model.i_SbIntergral = Convert.ToInt32(Txt_SbIntergral.Text);
        DALS.SystemSetup_Submit();
        Manager.AddLog(0, "系统管理", "修改积分设置");
        div_a.InnerHtml = "<script>alert('修改成功')</script>";
    }
}