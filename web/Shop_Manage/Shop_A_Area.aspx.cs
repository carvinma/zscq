using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_di_add : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(42, 0);
    public bool pageadd = Manager.GetManagerQX(42, 1);
    public bool pageupdate = Manager.GetManagerQX(42, 2);
    dal_Address DALA = new dal_Address();   
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
            BindP();
            Bind_Page_Value();
            Bind_Page_Info();
        }
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
        {
            Hidden1.Value = Request.QueryString["ye"].ToString();
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
        {
            Hidden2.Value = Request.QueryString["Keyword"].ToString();
        }
    }
    private void BindP()
    {
        this.DropDownList1.DataSource = DALA.Province_SelectAll();
        this.DropDownList1.DataTextField = "provinceName";
        this.DropDownList1.DataValueField = "i_ID";
        this.DropDownList1.DataBind();
        BindDrop2(int.Parse(this.DropDownList1.SelectedValue));
    }
    public void BindDrop2(int id)
    {
        this.DropDownList2.DataSource = DALA.City_Select_ProvinceId(id);
        this.DropDownList2.DataTextField = "cityName";
        this.DropDownList2.DataValueField = "i_ID";
        this.DropDownList2.DataBind();
    }
    void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null)
        {
            Hi_Id.Value = Request.QueryString["id"].ToString();
            t_Area model = DALA.Area_Select_Id(int.Parse(Hi_Id.Value));
            if (model != null)
            {
                t_City city = DALA.City_Select_Id(model.cityID);
                if (city != null)
                {
                    this.DropDownList1.SelectedValue = city.provinceID.ToString();
                    BindDrop2(city.provinceID);
                    this.DropDownList2.SelectedValue = city.i_ID.ToString();
                }
                this.area.Value = model.areaName.Trim();
                this.txtServiceQuhao.Value = model.nvc_Quhao;
                this.areaID.Value = model.areaID.ToString();
                //this.txtServiceAmount.Value = model.i_Remote.ToString();
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDrop2(int.Parse(this.DropDownList1.SelectedValue));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {        
        t_Area model = new t_Area();
        try
        {
            model.areaID = int.Parse(this.areaID.Value);
        }
        catch { }
        try
        {
            model.cityID = int.Parse(this.DropDownList2.SelectedValue);
        }
        catch { }
        try
        {
            model.nvc_Quhao = this.txtServiceQuhao.Value;
        }
        catch { }
        try
        {
            model.areaName = this.area.Value.Trim();
        }
        catch { }
        try
        {
            //model.i_Remote = Convert.ToInt32(txtServiceAmount.Value);
        }
        catch { }
        
        if (Hi_Id.Value != "0")
        {
            model.i_ID = int.Parse(Hi_Id.Value);
            DALA.Area_Update(model);
            Manager.AddLog(0, "省市地区管理", "修改了地区[ <font color=\"red\">" + model.areaName + "</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Area.aspx?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=地区&hreftype=2&href1=Shop_A_Area.aspx&href2=" + twourl);
        }
        else
        {
            DALA.Area_Add(model);
            Manager.AddLog(0, "省市地区管理", "增加地区[ <font color=\"red\">" + model.areaName + "</font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Area.aspx", System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=地区&hreftype=1&href1=Shop_A_Area.aspx&href2=" + twourl);
        }
    }
}