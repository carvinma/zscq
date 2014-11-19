using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;
using System.IO;

public partial class Shop_Manage_Advert_ModifAdvert : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(67, 0);
    public bool pageadd = Manager.GetManagerQX(67, 1);
    public bool pageupdate = Manager.GetManagerQX(67, 2);
    dal_Adv DALA = new dal_Adv();
    dal_AdvType DALAT = new dal_AdvType();
    bll_AdvType BLLAT = new bll_AdvType();
    public string dess = "";
    public string returnurl = "";
    public string beizhu = "注：0为不限制";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_Info();
        }
    }
    void Bind_Page_Info()
    {
        if (Request.QueryString["tid"] != null && Request.QueryString["tid"].ToString() != "")
        {
            Hi_Id.Value = Request.QueryString["tid"].ToString();
            t_Adv model = DALA.Adv_Select_Id(Convert.ToInt32(Hi_Id.Value));
            ddl_language.SelectedValue = model.nvc_Language;
            BLLAT.AdvType_Bind_DDL(DDL_Type, ddl_language.SelectedValue);
            DDL_Type.SelectedValue = model.i_TypeId.ToString();
            Bind_Page_Control();
            OrderNoTxt.Value = model.i_Orderby.ToString();
            RBL_Type.SelectedValue = model.i_ImageType.ToString();
            ImageHightTxt.Value = model.i_ImageHight.ToString();
            ImageWidthTxt.Value = model.i_ImageWidth.ToString();
            LinkWordTxt.Value = model.nvc_LinkWord;
            LinkAddressTxt.Value = model.nvc_LinkAddress;
            RBL_OpenWay.SelectedValue = model.nvc_OpenWay;
            text_top.Value = model.i_Top.ToString();
            text_left.Value = model.i_Left.ToString();
            content = model.nt_Content;
        }
        else
        {
            BLLAT.AdvType_Bind_DDL(DDL_Type, ddl_language.SelectedValue);
            if (Request.QueryString["i_TypeId"] != null && Request.QueryString["i_TypeId"].ToString() != "")
            {
                try
                {
                    DDL_Type.SelectedValue = Request.QueryString["i_TypeId"].ToString();
                    Bind_Page_Control();
                }
                catch { }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        t_Adv model = new t_Adv();
        if (Hi_Id.Value != "0")
        {
            model = DALA.Adv_Select_Id(Convert.ToInt32(Hi_Id.Value));
        }
        if (DDL_Type.SelectedValue != "0")
        {
            model.i_TypeId = Convert.ToInt32(DDL_Type.SelectedValue);
        }
        else
        {
            div_a.InnerHtml = "<script>alert('请选择分类！')</script>";
            return;
        }
        try
        {
            model.i_Orderby = Convert.ToInt32(OrderNoTxt.Value);
        }
        catch { }
        model.i_ImageType = Convert.ToInt32(RBL_Type.SelectedValue);
        try
        {
            model.i_ImageHight = Convert.ToInt32(ImageHightTxt.Value);
        }
        catch { }
        try
        {
            model.i_ImageWidth = Convert.ToInt32(ImageWidthTxt.Value);
        }
        catch { }
        try
        {
            model.i_Top = Convert.ToInt32(text_top.Value);
        }
        catch { }
        try
        {
            model.i_Left = Convert.ToInt32(text_left.Value);
        }
        catch { }
        model.nvc_Language = ddl_language.SelectedValue;
        //高度不可为0
        t_AdvType model_at = DALAT.AdvType_Select_Id(model.i_TypeId);
        if (model_at.i_Position == 1 && model.i_ImageHight == 0 && model.i_ImageWidth == 0)
        {
            div_a.InnerHtml = "<script>alert('宽度和高度不可为0！')</script>";
            beizhu = "注：必填，不可为0";
            return;
        }
        //
        model.nvc_LinkAddress = LinkAddressTxt.Value;
        model.nvc_LinkWord = LinkWordTxt.Value;
        model.nvc_OpenWay = RBL_OpenWay.SelectedValue;
        model.nt_Content = Request.Form["myContent"];

        if (FileUpload1.HasFile)
        {
            string fileext = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
            if (fileext == ".jpg" || fileext == ".png" || fileext == ".gif" || fileext == ".swf" || fileext == ".flv")
            {
                string filename = "../pic_Adv/" + DateTime.Now.ToString("yyyymmddhhMMssff");
                FileUpload1.PostedFile.SaveAs(Request.MapPath(filename + fileext));
                model.nvc_ImageAddress = filename.Replace("../", "") + fileext;
            }
            else
            {
                div_a.InnerHtml = "<script>alert('文件格式不正确！')</script>";
                return;
            }
        }

        if (Hi_Id.Value != "0")//判断是否为修改操作
        {
            DALA.Adv_Update(model);
            Manager.AddLog(0, "广告管理", "修改了广告" + DDL_Type.SelectedItem.Text);
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Adv.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=广告&hreftype=2&href1=Shop_A_Adv.aspx&href2=" + twourl);
        }
        else
        {
            DALA.Adv_Add(model);
            Manager.AddLog(0, "广告管理", "添加了广告" + DDL_Type.SelectedItem.Text);
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Adv.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=广告&hreftype=1&href1=Shop_A_Adv.aspx&href2=" + twourl);
        }
    }
    protected void DDL_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Page_Control();
    }
    void Bind_Page_Control()
    {
        if (DDL_Type.SelectedValue != "0")
        {
            t_AdvType model = DALAT.AdvType_Select_Id(Convert.ToInt32(DDL_Type.SelectedValue));
            dess = model.nvc_Remarks;
            if (model.i_Type == 0)
            {
                PicDiv4.Visible = true;
                PicDiv.Visible = true;
                PicDiv2.Visible = true;
                PicDiv3.Visible = true;
                tr_Content.Visible = false;
            }
            if (model.i_Type == 1)
            {
                PicDiv4.Visible = false;
                PicDiv.Visible = false;
                PicDiv2.Visible = false;
                PicDiv3.Visible = false;
                tr_Content.Visible = false;
            }
            if (model.i_Type == 2)
            {
                tr_Content.Visible = true;
                PicDiv4.Visible = true;
                PicDiv.Visible = true;
                PicDiv2.Visible = true;
                PicDiv3.Visible = true;
            }
            if (model.i_Position == 1)
            {
                beizhu = "注：必填，不可为0";
                tr_Left.Visible = true;
                tr_Top.Visible = true;
            }
            else
            {
                tr_Left.Visible = false;
                tr_Top.Visible = false;
            }
        }
        else
        {
            dess = "请选择广告位置";
            PicDiv4.Visible = false;
            PicDiv.Visible = false;
            PicDiv2.Visible = false;
            PicDiv3.Visible = false;
            tr_Content.Visible = false;
            tr_Left.Visible = false;
            tr_Top.Visible = false;
        }
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        BLLAT.AdvType_Bind_DDL(DDL_Type, ddl_language.SelectedValue);
        Bind_Page_Control();
    }
}
