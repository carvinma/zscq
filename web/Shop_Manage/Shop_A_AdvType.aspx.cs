using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;
public partial class Shop_Manage_shop_NewsClass : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(68, 0);
    public bool pageadd = Manager.GetManagerQX(68, 1);
    public bool pageupdate = Manager.GetManagerQX(68, 2);
    public string returnurl = "";
    dal_AdvType DAT = new dal_AdvType();
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
        } if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = "lang=" + Request.QueryString["lang"];
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            t_AdvType model = DAT.AdvType_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                ddl_language.SelectedValue = model.nvc_Language;
                Hi_TId.Value = Request.QueryString["id"].ToString();
                NewsClassName.Value = model.nvc_Name;
                NewsClassOrderby.Value = model.i_Max.ToString();
                if (model.i_Type == 1)
                {
                    Rb_Type1.Checked = true;
                }
                else
                {
                    Rb_Type2.Checked = true;
                }
                Txt_Remarks.Text = model.nvc_Remarks;
            }
        }
        else
        {
            Session["AdvType_Img"] = "";
        }
    }
    protected void BtAdd_Click(object sender, EventArgs e)//添加广告位
    {
        try
        { 
            t_AdvType model = new t_AdvType();
            if (Hi_TId.Value != "0")
            {
                model = DAT.AdvType_Select_Id(int.Parse(Hi_TId.Value));
            }
            model.nvc_Name = NewsClassName.Value;
            model.i_Max = NewsClassOrderby.Value.GetInt();
            model.nvc_Language = ddl_language.SelectedValue;
            //if (Session["AdvType_Img"] != null && Session["AdvType_Img"].ToString() != "")
            //{
            //    model.nvc_Images = Session["AdvType_Img"].ToString();
            //}
            if (Rb_Type2.Checked)
            {
                model.i_Type = 1;
            }
            if (Rb_Type2.Checked)
            {
                model.i_Type = 0;
            }
            if (Rb_Type3.Checked)
            {
                model.i_Type = 2;
            }
            model.nvc_Remarks = Txt_Remarks.Text;
            if (Hi_TId.Value != "0")
            {
                DAT.AdvType_Update(model);
                Manager.AddLog(0, "广告位管理", "修改了广告位[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_AdvType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=广告位&hreftype=2&href1=Shop_A_AdvType.aspx&href2=" + twourl);
            }
            else
            {
                DAT.AdvType_Add(model);
                Manager.AddLog(0, "广告位管理", "添加了广告位[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_AdvType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=广告位&hreftype=1&href1=Shop_A_AdvType.aspx&href2=" + twourl);
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据异常');</script>";
        }
    }

}
