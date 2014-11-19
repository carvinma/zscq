using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_sheng_add : System.Web.UI.Page
{
    dal_Nationality DALN = new dal_Nationality();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (Manager.GetManagerQX(42, 1) == false || Manager.GetManagerQX(42, 2) == false)
        {
            this.But_Add.Visible = false;
        }
        if (!IsPostBack)
        {
            Bind_Drp_PGuoJiaType();
            
            if (Request.QueryString["id"] != null)
            {
                HF_ID.Value = Request.QueryString["id"];
                dal_Address area = new dal_Address();
                t_Province t = area.Province_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
                this.provinceID.Value = t.provinceID.ToString();
                this.province.Value = t.provinceName.Trim();
                DropDownList1.SelectedValue = t.guojiaID.ToString();
            }
            if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
            {
                Hidden1.Value = Request.QueryString["ye"].ToString();
            }
            if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
            {
                Hidden2.Value = Request.QueryString["Keyword"].ToString();
            }
        }
    }
    protected void But_Add_Click(object sender, EventArgs e)
    {
        dal_Address area = new dal_Address();
        t_Province model = new t_Province();
        try
        {
            model.guojiaID = int.Parse(this.DropDownList1.SelectedValue);
        }
        catch { }
        try
        {
            model.provinceID = int.Parse(this.provinceID.Value);
        }
        catch { }
        
        model.provinceName = this.province.Value.Trim();
        if (HF_ID.Value!="0")
        {
            model.i_ID = int.Parse(HF_ID.Value);
            area.Province_Update(model);
            Manager.AddLog(0, "省市地区管理", "修改了省份[ <font color=\"red\">" + model.provinceName + "</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Province.aspx?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=省份&hreftype=2&href1=Shop_A_Province.aspx&href2=" + twourl);
        }
        else
        {
            if (area.Province_Add(model) > 0)
            {
                Manager.AddLog(0, "省市地区管理", "添加省份[ <font color=\"red\">" + model.provinceName + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Province.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=省份&hreftype=1&href1=Shop_A_Province.aspx&href2=" + twourl);
            }
        }        
    }
    void Bind_Drp_PGuoJiaType()// 绑定国籍
    {
        this.DropDownList1.Items.Clear();
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            this.DropDownList1.Items.Add(li);
        }
    }
}