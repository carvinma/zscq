using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_shezhi : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(2, 0);
    public bool pageupdate = Manager.GetManagerQX(2, 2);
    dal_SinglePage DALSP = new dal_SinglePage();

    public string content = "";
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
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_Value();
            Bind_Page_Control();
            Bind_Page_Info();
        }
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["pagetype"] != null && Request.QueryString["pagetype"].ToString() != "")
        {
            Hi_Key.Value = Request.QueryString["pagetype"].ToString();
        }
    }
    void Bind_Page_Control()
    {
        switch (Hi_Key.Value.ToLower())
        {
            case "about":
                td1.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "contact":
                td2.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "tiaokuan":
                td3.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "yinsi":
                td4.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "regxy":
                td5.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "ndap":
                td6.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "bottom":
                td7.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "zlpay":
                td8.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "sbpay":
                td9.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "regxyz":
                td10.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "sblogin":
                td11.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "sbquery":
                td12.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
            case "sbhelpdoc":
                td13.Attributes.Add("background", "images/ddbgs2.jpg");
                break;
        }
    }
    void Bind_Page_Info()
    {
        t_SinglePage model = DALSP.SinglePage_Select_Key(Hi_Key.Value, ddl_language.SelectedValue);
        if (model != null)
        {
            content = model.nt_Value;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        t_SinglePage model = DALSP.SinglePage_Select_Key(Hi_Key.Value, ddl_language.SelectedValue);
        model.nt_Value = Request.Form["myContent"];
        DALSP.SinglePage_Submit();
        Manager.AddLog(0, "系统管理", "修改单页");
        Response.Redirect("Shop_M_SinglePage.aspx?pagetype=" + Hi_Key.Value + "&lang=" + ddl_language.SelectedValue);
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Page_Info();
    }
}
