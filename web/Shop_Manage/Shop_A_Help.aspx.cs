using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_helpAdd : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(70, 0);
    public bool pageadd = Manager.GetManagerQX(70, 1);
    public bool pageupdate = Manager.GetManagerQX(70, 2);
    dal_Help DALH = new dal_Help();
    dal_HelpType DALHT = new dal_HelpType();
    public string lbTitle = "添加帮助";
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
            Bind_DDL_Type();
            Bind_Page_Value();
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Value()
    {
        if (Request.QueryString["htid"] != null && Request.QueryString["htid"].ToString() != "")
        {
            ddlType.SelectedValue = Request.QueryString["htid"].ToString();
        }
    }
    void Bind_DDL_Type()// 绑定帮助分类 Darren
    {
        ddlType.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        ddlType.Items.Add(item);
        var iquery = DALHT.HelpType_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            this.ddlType.Items.Add(li);
        }
    }
    void Bind_Page_Info()// 详细帮助 Darren
    {
        if (Request.QueryString["hid"] != null && Request.QueryString["hid"].ToString() != "")
        {
            Hi_TId.Value = Request.QueryString["hid"].ToString();
            lbTitle = "修改帮助";
            t_Help model = DALH.Help_Select_Id(int.Parse(Hi_TId.Value));
            if (model != null)
            {
                this.txtTitle.Text = model.nvc_Title;
                content = model.nvc_Content;
                this.tborderby.Text = model.i_Orderby.ToString();
                this.ddlType.SelectedValue = model.i_HelpTypeId.ToString();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)// 提交帮助中心内容 Darren
    {

    //    if (string.IsNullOrEmpty(this.txtTitle.Text.Trim()))
    //    {
    //        div_a.InnerHtml = "<script>alert('标题不能为空');</script>";
    //    }
    //    else if (string.IsNullOrEmpty(this.txtContents.Value.Trim()))
    //    {
    //        div_a.InnerHtml = "<script>alert('内容不能为空');</script>";
    //    }
        t_Help model = new t_Help();
        if (Hi_TId.Value != "0")
        {
            model = DALH.Help_Select_Id(Convert.ToInt32(Hi_TId.Value));
        }

        try
        {
            model.i_HelpTypeId = int.Parse(this.ddlType.SelectedValue);
        }
        catch { }

        model.nvc_Content = Request.Form["myContent"];
        model.nvc_Title = this.txtTitle.Text.Trim();
        try
        {
            model.i_Orderby = int.Parse(tborderby.Text);
        }
        catch { }
        if (Hi_TId.Value != "0")
        {
            if (DALH.Help_Update(model) == 1)
            {
                Manager.AddLog(0, "帮助管理", "修改了帮助[ <font color=\"red\">" + this.txtTitle.Text.Trim() + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Help.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=帮助&hreftype=2&href1=shop_helpadd.aspx&href2=" + twourl);
            }
            else
            {
                Response.Write("<script>alert('修改失败');window.location.href='Shop_M_Help.aspx?" + returnurl + "';</script>");
            }
        }
        else
        {
            if (DALH.Help_Add(model) == 1)
            {
                Manager.AddLog(0, "帮助管理", "添加帮助[ <font color=\"red\">" + this.txtTitle.Text.Trim() + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Help.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=帮助&hreftype=1&href1=Shop_A_Help.aspx&href2=" + twourl);
            }
            else
            {
                Response.Write("<script>alert('添加失败');window.location.href='Shop_M_Help.aspx';</script>");
            }
        }
    }
}
