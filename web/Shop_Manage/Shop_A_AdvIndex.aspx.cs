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

public partial class Shop_Manage_Shop_A_AdvIndex : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(67, 0);
    public bool pageadd = Manager.GetManagerQX(67, 1);
    public bool pageupdate = Manager.GetManagerQX(67, 2);
    dal_AdvIndex DALA = new dal_AdvIndex();
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
            returnurl = "lang=" + Request.QueryString["lang"];
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
            t_AdvIndex model = DALA.AdvIndex_Select_Id(Convert.ToInt32(Hi_Id.Value));
            ddl_language.SelectedValue = ddl_language.SelectedValue;
            txt_cntitle.Value = model.nvc_Title;
            txt_entitle.Value = model.nvc_EnTitle.Replace("</br>", Environment.NewLine);
            if (!string.IsNullOrWhiteSpace(model.nvc_TopImage))
            {
                img1.Src = "../" + model.nvc_TopImage;
            }
            if (!string.IsNullOrWhiteSpace(model.nvc_BottomImage))
            {
                img2.Src = "../" + model.nvc_BottomImage;
            }
            OrderNoTxt.Value = model.i_Order.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            t_AdvIndex model = new t_AdvIndex();
            if (Hi_Id.Value != "0")
            {
                model = DALA.AdvIndex_Select_Id(Convert.ToInt32(Hi_Id.Value));
            }

            model.i_Order = string.IsNullOrEmpty(OrderNoTxt.Value) ? 0 : int.Parse(OrderNoTxt.Value);
            model.nvc_Language = ddl_language.SelectedValue;

            model.nvc_Title = txt_cntitle.Value;
            model.nvc_EnTitle = txt_entitle.Value.Replace(Environment.NewLine, "</br>");
            if (FileUpload1.HasFile)
            {
                string fileext = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
                if (fileext == ".jpg" || fileext == ".jpeg" || fileext == ".png" || fileext == ".gif")
                {
                    string filename = "../pic_Adv/tt" + DateTime.Now.ToString("yyyymmddhhMMssff");
                    FileUpload1.PostedFile.SaveAs(Request.MapPath(filename + fileext));
                    model.nvc_TopImage = filename.Replace("../", "") + fileext;
                }
                else
                {
                    div_a.InnerHtml = "<script>alert('文件格式不正确！')</script>";
                    return;
                }
            }
            if (FileUpload2.HasFile)
            {
                string fileext = Path.GetExtension(FileUpload2.PostedFile.FileName).ToLower();
                if (fileext == ".jpg" || fileext == ".jpeg" || fileext == ".png" || fileext == ".gif")
                {
                    string filename = "../pic_Adv/bg" + DateTime.Now.ToString("yyyymmddhhMMssff");
                    FileUpload2.PostedFile.SaveAs(Request.MapPath(filename + fileext));
                    model.nvc_BottomImage = filename.Replace("../", "") + fileext;
                }
                else
                {
                    div_a.InnerHtml = "<script>alert('文件格式不正确！')</script>";
                    return;
                }
            }

            if (Hi_Id.Value != "0")//判断是否为修改操作
            {
                DALA.AdvIndex_Update(model);
                Manager.AddLog(0, "广告管理", "修改了广告首页广告");
                Response.Redirect("shop_manageok.aspx?hrefname=首页广告&hreftype=2&href1=Shop_A_AdvIndex.aspx&href2=Shop_M_AdvIndex.aspx");
            }
            else
            {
                DALA.AdvIndex_Add(model);
                Manager.AddLog(0, "广告管理", "添加了首页广告");
                Response.Redirect("shop_manageok.aspx?hrefname=首页广告&hreftype=1&href1=Shop_A_AdvIndex.aspx&href2=Shop_M_AdvIndex.aspx");
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据异常');</script>";
        }
    }
}
