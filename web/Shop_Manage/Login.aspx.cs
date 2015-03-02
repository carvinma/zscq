using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using zscq.DAL;
using System.Web.Security;

public partial class Shop_Manage_index : System.Web.UI.Page
{
    dal_Manager DALM = new dal_Manager();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        //if (!DALSS.CheckSystem())
        //{
        //    div_a.InnerHtml = "<script>alert('您使用的系统已过期，请联系软件商更新系统！');location.href='http://www.yghdnet.com/';</script>";
        //    return;
        //}
    }

    public bool check_wq(string sid)
    {
        bool num = true;
        if (sid.IndexOf("=") >= 0 || sid.IndexOf("select") >= 0 || sid.IndexOf("?") >= 0 || sid.IndexOf(">") >= 0 || sid.IndexOf("<") >= 0 || sid.IndexOf("*") >= 0 || sid.IndexOf("&") >= 0 || sid.IndexOf(";") >= 0 || sid.IndexOf("'") >= 0 || sid.IndexOf(",") >= 0 || sid.IndexOf("$") >= 0)
        {
            num = false;
        }
        return num;
    }
    protected void imgbtnSubmit_Click(object sender, EventArgs e)
    {
        if (check_wq(UserName.Text) == false || check_wq(Password.Text) == false)
        {
            Response.Write("<script>history.go(-1);</script>");
            Response.End();
        }
        if (!DALSS.CheckSystem())
        {
            div_a.InnerHtml = "<script>alert('您使用的系统已过期，请联系软件商更新系统！');location.href='http://www.yghdnet.com/';</script>";
            return;
        }
        if (UserName.Text == string.Empty)
        {
            div_a.InnerHtml = "<script>alert('请填写用户名！')</script>";
            return;
        }
        if (Password.Text == string.Empty)
        {
            div_a.InnerHtml = "<script>alert('请填写密码！')</script>";
            return;
        }
        if (txtyzm.Text == string.Empty)
        {
            div_a.InnerHtml = "<script>alert('请填写验证码！')</script>";
            return;
        }
        if (Session["Validate"] != null)
        {
            if (txtyzm.Text.ToLower() != Session["Validate"].ToString().ToLower())
            {
                div_a.InnerHtml = "<script>alert('验证码错误！')</script>";
                return;
            }
        }
        else
        {
            Response.Write("<script>alert('验证码已过期，请重新登录！');window.location='Login.aspx';</script>");
        }
        int id = 0;
        string flag = string.Empty;
        string realname = "";
        int type = 0;
        string Pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "MD5");
        if (DALM.Manager_Login(UserName.Text, Pwd, ref id, ref flag, ref type, ref realname))
        {
            Response.Cookies["zscqmanage"]["userid"] = id.ToString();
            Response.Cookies["zscqmanage"]["flag"] = flag;
            //Response.Cookies["zscqmanage"]["type"] = type.ToString();
            Response.Cookies["zscqmanage"]["realname"] = System.Web.HttpUtility.UrlEncode(realname, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Cookies["shop"]["keycodescc"] = "ok";
            Manager.AddLog(id, "登陆系统", UserName.Text + "登陆");
            Response.Redirect("Shop_Index.aspx");
        }
        else
        {
            div_a.InnerHtml = "<script>alert('用户名密码错误！')</script>";
        }
    }
}


