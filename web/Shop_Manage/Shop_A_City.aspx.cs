using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shi_add : System.Web.UI.Page
{
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
            this.Button1.Visible = false;
        }
        if (!IsPostBack)
        {
            BindP();
            if (Request.QueryString["id"] != null)
            {
                ViewState["id"] = Request.QueryString["id"];
                BindCity(int.Parse(Request.QueryString["id"].ToString()));
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
    private void BindP()
    {
        dal_Address area = new dal_Address();
        this.DropDownList1.DataSource = area.Province_SelectAll();
        this.DropDownList1.DataTextField = "provinceName";
        this.DropDownList1.DataValueField = "i_ID";
        this.DropDownList1.DataBind();
    }
    private void BindCity(int id)
    {
        dal_Address area = new dal_Address();
        t_City model = area.City_Select_Id(id);
        this.DropDownList1.SelectedValue = model.provinceID.ToString();
        this.city.Value = model.cityName.Trim();
        this.cityID.Value = model.cityID.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        dal_Address area = new dal_Address();
        t_City city = new t_City();
        try
        {
            city.cityID = int.Parse(this.cityID.Value);
        }
        catch{}
        try
        {
            city.provinceID = int.Parse(this.DropDownList1.SelectedValue);
        }
        catch { }
        city.cityName = this.city.Value.Trim();
        
        if (ViewState["id"] != null)
        {
            city.i_ID = int.Parse(ViewState["id"].ToString());
            area.City_Update(city);
            Manager.AddLog(0, "省市地区管理", "修改城市" + city.cityName);
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_City.aspx?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=城市&hreftype=2&href1=Shop_A_City.aspx&href2=" + twourl);
        }
        else
       {
           area.City_Add(city);
           Manager.AddLog(0, "省市地区管理", "添加城市" + city.cityName);
           string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_City.aspx", System.Text.Encoding.GetEncoding("gb2312"));
           Response.Redirect("shop_manageok.aspx?hrefname=城市&hreftype=1&href1=Shop_A_City.aspx&href2=" + twourl);
       }
    }
}