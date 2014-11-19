using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class Shop_Manage_shop_user1 : System.Web.UI.Page
{
    public bool pageupdate = Manager.GetManagerQX(82, 2);
    dal_Manager DALM = new dal_Manager();
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
        div_a.InnerHtml = "";
        if (!pageupdate)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        admin_name1.Text = DALM.Manager_vw_Select_Id(int.Parse(Request.Cookies["zscqmanage"]["userid"].ToString())).nvc_Name;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.admin_pass1.Text != "")
        {
            t_Manager model = DALM.Manager_Select_Id(int.Parse(Request.Cookies["zscqmanage"]["userid"].ToString()));
            model.nvc_PassWord = FormsAuthentication.HashPasswordForStoringInConfigFile(this.admin_pass1.Text, "MD5");
            if (DALM.Manager_UpdatePwd(model) == 1)
            {
                div_a.InnerHtml = "<script>alert('修改成功，下次登录时生效!')</script>";
                Manager.AddLog(0, "权限管理", model.nvc_Name + "修改密码");
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('请填写密码')</script>";
        }
    }
}
