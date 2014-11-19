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
    public bool pageview = Manager.GetManagerQX(81, 0);
    public bool pageupdate = Manager.GetManagerQX(81, 2);
    dal_ManagerGroup DALMG = new dal_ManagerGroup();
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
            if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
            {
                t_ManagerGroup Admin = DALMG.ManagerGroup_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
                if (Admin != null)
                {
                    if (Admin.i_Id == 1)
                    {
                        admin_name1.Disabled = true;
                    }
                    admin_name1.Value = Admin.nvc_Name;
                    admin_realname1.Value = Admin.nvc_Remarks;
                }
                else
                {
                    Response.Redirect("Shop_M_Admin.aspx");
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        t_ManagerGroup Admin = DALMG.ManagerGroup_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
        if (Admin.i_Id != 1)
        {
            Admin.nvc_Name = admin_name1.Value;
        }
        Admin.nvc_Remarks = admin_realname1.Value;
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
        int ret = DALMG.ManagerGroup_Update(Admin);
        if (ret == 2)
        {
            Response.Write("<script>alert('对不起,发生意外!');window.location='" + Request.Url.ToString() + "'</script>");
        }
        else
        {
            Manager.AddLog(0, "权限管理", "修改了管理组[ <font color=\"red\">" + Admin.nvc_Name + "</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Admin.aspx", System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=管理组&hreftype=2&href1=Shop_A_ManagerGroup.aspx&href2=" + twourl);
        }
    }
}
