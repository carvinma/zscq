using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class ShopReg : System.Web.UI.Page
{
    dal_Adv DALADV = new dal_Adv();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    public string _Adv = "";
    public string TitleOrKeyword = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public void Bind_Page_Title()
    {
        dal_SystemSetup DALSS = new dal_SystemSetup();
        t_SystemSetup t = DALSS.SystemSetup_Select();
        if (t.nvc_ShopName != null && t.nvc_ShopName != "")
        {
            ShopName = t.nvc_ShopName;
        }
        if (t.nvc_ShopKeywords != null && t.nvc_ShopKeywords != "")
        {
            ShopKeywords = t.nvc_ShopKeywords;
        }
        if (t.nvc_ShopDescription != null && t.nvc_ShopDescription != "")
        {
            ShopDescription = t.nvc_ShopDescription;
        }
        TitleOrKeyword = "<title>" + "用户登录_" + "商城系统_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        t_Adv adv = DALADV.Adv_Select_TypeId(116).FirstOrDefault();
        if (adv != null)
        {
            _Adv = adv.nvc_ImageAddress;
        }
        Hf_Href.Value = "user_shopintegral.aspx";
        if (Request["pageurl2"] != null && Request["pageurl2"].ToString() != "")
        {
            Hf_Href2.Value = Request.QueryString["pageurl2"];
        }
        Bind_Page_Title();
        
    }

    protected void Ibtn_Reg_Click(object sender, EventArgs e)
    {
        string l_code = txt_code.Value.ToString();
        string l_codes = Session["Validate"].ToString();
        if (l_code.Trim() != l_codes.Trim())
        {
            div_a.InnerHtml = "<script>alert('验证码错误！');</script>";
            return;
        }
        if (txt_userpassword.Value != txt_userpassword2.Value)
        {
            div_a.InnerHtml = "<script>alert('密码与确认密码不一致！');</script>";
            return;
        }
        var model = DALIM.IntegralMobile_SelectByMobile(txt_username.Value.Trim());
        if (model == null)
        {
            model = new t_IntegralMobile();
            model.nvc_Mobile = txt_username.Value;
            model.nvc_Password = txt_userpassword.Value.Trim().Md5Encrypt();
            model.dt_AddTime = DateTime.Now;
            DALIM.IntegralMobile_Add(model);
            div_a.InnerHtml = "<script>alert('注册成功！');</script>";
        }
        else
        {
            div_a.InnerHtml = "<script>alert('该手机号已经被注册！');</script>";
            return;
        }
    }
}