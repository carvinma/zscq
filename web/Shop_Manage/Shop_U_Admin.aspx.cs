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

public partial class Shop_Manage_Shop_U_Admin : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(80, 0);
    public bool pageupdate = Manager.GetManagerQX(80, 2);
    dal_Manager DALM = new dal_Manager();
    dal_ManagerGroup DALMG = new dal_ManagerGroup();
    public string AdminName = "";
    public string AdminReal = "";
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
            Bind_Page_Info();
        }
    }
    public void Bind_DDL_Group()
    {
        int count = 0;
        DDL_Group.DataSource = DALMG.ManagerGroup_SelectPage(1, 100000000, ref count);
        DDL_Group.DataTextField = "nvc_Name";
        DDL_Group.DataValueField = "i_Id";
        DDL_Group.DataBind();
        DDL_Group.Items.Add(new ListItem("单独添加", "0"));
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
        {
            vw_Manager Admin = DALM.Manager_vw_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (Admin != null)
            {
                AdminName = Admin.nvc_Name;
                Hipwd.Value = Admin.nvc_PassWord;
                AdminReal = Admin.nvc_RealName;
                DDL_Group.SelectedValue = Admin.i_GroupId.ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            t_Manager Admin = DALM.Manager_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            Admin.nvc_RealName = Request.Form["admin_realname1"];
            if (Request.Form["admin_pass1"] != null && Request.Form["admin_pass1"] != "")
            {
                Admin.nvc_PassWord = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["admin_pass1"], "MD5");
            }
            else
            {
                Admin.nvc_PassWord = Hipwd.Value;
            }
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

            Admin.i_Id = int.Parse(Request.QueryString["id"].ToString());
            int ret = DALM.Manager_Update(Admin);
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
            }
            else
            {
                Manager.AddLog(0, "权限管理", "修改了管理员[ <font color=\"red\">" + AdminName + "</font> ]的信息");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Admin.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=管理员&hreftype=2&href1=Shop_A_Admin.aspx&href2=" + twourl);
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据异常');</script>";
        }
    }
}
