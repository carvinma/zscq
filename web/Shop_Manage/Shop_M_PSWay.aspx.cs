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

public partial class Shop_Manage_Shop_M_PSWay : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(3, 0);
    public bool add = Manager.GetManagerQX(3, 1);
    public bool update = Manager.GetManagerQX(3, 2);
    public bool del = Manager.GetManagerQX(3, 3);
    dal_PSWay DALP = new dal_PSWay();
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
            Delect_PSWay();
            Bind_Rpt_PSWay();
        }
    }
    public void Delect_PSWay()
    {
        if (Request.QueryString["Pid"] != null && Request.QueryString["Pid"] != "")
        {
            int ret = DALP.PSWay_Del(int.Parse(Request.QueryString["Pid"].ToString()));
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('删除失败！')</script>";
                return;
            }
            else
            {
                Manager.AddLog(0, "系统管理", "删除配送方式");
            }
        }
    }
    public void Bind_Rpt_PSWay()
    {
        Repeater1.DataSource = DALP.PSWay_Select_All();
        Repeater1.DataBind();
    }
    protected void Bt_Add_Click(object sender, EventArgs e)
    {
        t_PSWay model = new t_PSWay();
        model.nvc_Name = text_PName.Value;
        try
        {
            model.i_Cost = int.Parse(text_PCost.Value);
        }
        catch { }
        model.nt_Explain = text_PSM.Value;
        int ret = DALP.PSWay_Add(model);
        if (ret != 1)
        {
            div_a.InnerHtml = "<script>alert('添加失败，请检查是否存在相同配送方式！')</script>";
            return;
        }
        else
        {
            Manager.AddLog(0, "系统管理", "添加配送方式");
            Bind_Rpt_PSWay();
        }
    }
    protected void Bt_SaveAll_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < Repeater1.Items.Count; i++)//假定datalist的id是DataList1
        {
            TextBox PName = (TextBox)Repeater1.Items[i].FindControl("TB_PName");
            TextBox PCost = (TextBox)Repeater1.Items[i].FindControl("TB_PCost");
            TextBox PSM = (TextBox)Repeater1.Items[i].FindControl("TB_PSM");
            HiddenField Hi_Id = (HiddenField)(Repeater1.Items[i].FindControl("Hi_Id"));
            if (PName.Text.Trim() == "")
            {
                div_a.InnerHtml = "<script>alert('配送方式不能为空！');</script>";
                break;
            }
            t_PSWay model = DALP.PSWay_Select_Id(int.Parse(Hi_Id.Value));
            model.nvc_Name = PName.Text;
            try
            {
                model.i_Cost = int.Parse(PCost.Text);
            }
            catch { }
            model.nt_Explain = PSM.Text;
            if (DALP.PSWay_Update(model) != 1)
            {
                div_a.InnerHtml = "<script>alert('操作失败，请检查是否存在相同配送方式！');</script>";
                break;
            }
        }
        Manager.AddLog(0, "系统管理", "修改配送方式");
        Bind_Rpt_PSWay();
    }
}
