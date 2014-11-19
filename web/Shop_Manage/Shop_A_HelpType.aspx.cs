using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_bookclass : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(71, 0);
    public bool pageadd = Manager.GetManagerQX(71, 1);
    public bool pageupdate = Manager.GetManagerQX(71, 2);
    dal_HelpType DALHC = new dal_HelpType();
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
            Response.Write("无权限访问");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["tid"] != null && Request.QueryString["tid"].ToString() != "")
        {
            Hi_TId.Value = Request.QueryString["tid"].ToString();
            int TId = Convert.ToInt32(Request.QueryString["tid"].ToString());
            t_HelpType model = DALHC.HelpType_Select_Id(TId);
            if (model != null)
            {
                txtNmae.Text = model.nvc_Name;
                txtOrderID.Text = model.i_Orderby.ToString();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //if (string.IsNullOrEmpty(this.txtNmae.Text.Trim()))
        //{
        //    div_a.InnerHtml = "<script>alert('类别名称不能为空');</script>";
        //    return;
        //}
        //else
        //{
            t_HelpType model = new t_HelpType();
            if (Hi_TId.Value != "0")
            {
                model = DALHC.HelpType_Select_Id(Convert.ToInt32(Hi_TId.Value));
            }
            model.nvc_Name = this.txtNmae.Text.Trim();
            try
            {
                model.i_Orderby = int.Parse(this.txtOrderID.Text.Trim());
            }
            catch { }
            if (Hi_TId.Value != "0")
            {
                if (DALHC.HelpType_Submit() != 1)
                {
                    div_a.InnerHtml = "<script>alert('操作失败！');</script>";
                    return;
                }
                Manager.AddLog(0, "帮助管理", "修改了类别[ <font color=\"red\">" + this.txtNmae.Text.Trim() + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Help.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=帮助&hreftype=2&href1=Shop_A_HelpType.aspx&href2=" + twourl);
            }
            else
            {
                if (DALHC.HelpType_Add(model) != 1)
                {
                    div_a.InnerHtml = "<script>alert('操作失败！');</script>";
                    return;
                }
                Manager.AddLog(0, "帮助管理", "添加了类别[ <font color=\"red\">" + this.txtNmae.Text.Trim() + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Help.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=帮助&hreftype=1&href1=Shop_A_HelpType.aspx&href2=" + twourl);
            }
        //}
    }
}