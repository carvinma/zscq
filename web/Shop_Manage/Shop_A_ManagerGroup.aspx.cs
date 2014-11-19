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
using zscq.BLL;

public partial class Shop_Manage_Shop_A_Admin : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(81, 0);
    public bool pageadd = Manager.GetManagerQX(81, 1);
    dal_ManagerGroup DALMG = new dal_ManagerGroup();
    bll_ManagerGroup BLLMG = new bll_ManagerGroup();
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        t_ManagerGroup Admin = new t_ManagerGroup();
        Admin.nvc_Name = admin_name1.Value;
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
        int ret = BLLMG.ManagerGroup_Add(Admin);
        if (ret == 2)
        {
            div_a.InnerHtml = "<script>alert('管理组名称重复!')</script>";
        }
        else
        {
            Manager.AddLog(0, "权限管理", "添加了管理组[ <font color=\"red\">" + admin_name1.Value + "</font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Admin.aspx", System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=管理组&hreftype=1&href1=Shop_A_ManagerGroup.aspx&href2=" + twourl);
        }
    }
}
