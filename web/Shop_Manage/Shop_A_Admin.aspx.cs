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

public partial class Shop_Manage_Shop_A_Admin : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(80, 0);
    public bool pageadd = Manager.GetManagerQX(80, 1);
    dal_ManagerGroup DALMG = new dal_ManagerGroup();
    dal_Manager DALM = new dal_Manager();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
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
            Bind_DDL_Group();
            Bind_Page_Value();
        }
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            DDL_Group.SelectedValue = Request.QueryString["id"].ToString();
        }
    }
    public void Bind_DDL_Group()
    {
        //DDL_Group.Items.Add(new ListItem("请选择", "-1"));
        int count = 0;
        DDL_Group.DataSource = DALMG.ManagerGroup_SelectPage(1, 100000000, ref count);
        DDL_Group.DataTextField = "nvc_Name";
        DDL_Group.DataValueField = "i_Id";
        DDL_Group.DataBind();
        DDL_Group.Items.Add(new ListItem("独立管理员", "0"));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            t_Manager Admin = new t_Manager();
            if (string.IsNullOrWhiteSpace(Request.Form["admin_name1"]))
            {
                div_a.InnerHtml = "<script>alert('管理员账号不能为空！');</script>"; return;
            }
            if (string.IsNullOrWhiteSpace(Request.Form["admin_pass1"]))
            {
                div_a.InnerHtml = "<script>alert('密码不能为空！');</script>"; return;
            }
            Admin.nvc_Name = Request.Form["admin_name1"];
            Admin.nvc_PassWord = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["admin_pass1"], "MD5");
            Admin.nvc_RealName = Request.Form["admin_realname1"];
            if (DDL_Group.SelectedValue == "0")
            {
                string flag = "";
                for (int i = 0; i <= 95; i++)
                {
                    flag = flag + "|";
                    for (int j = 0; j <= 4; j++)
                    {
                        if (Request.Form["Yidflag" + i + j] == "1")
                        {
                            flag = flag + "1";
                        }
                        else
                        {
                            flag = flag + "0";
                        }
                    }
                }
                Admin.nvc_Power = flag.Length > 1 ? flag.Substring(1, flag.Length - 1) : "";
            }
            Admin.i_GroupId = int.Parse(DDL_Group.SelectedValue);

            int ret = DALM.Manager_Add(Admin);
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('管理员账号重复!')</script>";
            }
            else
            {
                Manager.AddLog(0, "权限管理", "添加了管理员[ <font color=\"red\">" + Request.Form["admin_name1"] + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Admin.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=管理员&hreftype=1&href1=Shop_A_Admin.aspx&href2=" + twourl);
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据异常');</script>";
        }
    }
}
