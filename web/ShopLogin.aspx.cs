using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class ShopLogin : System.Web.UI.Page
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
        Bind_Page_Login();
    }
    void Bind_Page_Login()
    { 
        //是否进行了一次登录
        if (Request.Cookies["hqhtshop"] != null)
        {
            if (Request.Cookies["hqhtshop"]["hqht_user_type"] != null && Request.Cookies["hqhtshop"]["hqht_user_type"] != "")
            {
                if (Request.Cookies["hqhtshop"]["hqht_user_type"] == "zl" && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "")
                {
                    Response.Redirect("User_PatentIntegral.aspx?pageurl2=" + HttpUtility.UrlEncode(Hf_Href2.Value));
                }
                if (Request.Cookies["hqhtshop"]["hqht_user_type"] == "sb" && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
                {
                    Response.Redirect("user_sbjf.aspx?pageurl2=" + HttpUtility.UrlEncode(Hf_Href2.Value));
                }
            }
        }
    }
    protected void Ibtn_Login_Click(object sender, ImageClickEventArgs e)
    {
        string l_code = txt_code.Value.ToString();
        string l_codes = Session["Validate"].ToString();
        if (l_code.Trim() != l_codes.Trim())
        {
            div_a.InnerHtml = "<script>alert('验证码错误！');</script>";
            return;
        }
        var model = DALIM.IntegralMobile_SelectByMobile(txt_username.Value.Trim());
        if (model != null)
        {
            if (rad_type_sb.Checked && model.i_sbuid == 0)
            {
                div_a.InnerHtml = "<script>alert('该手机号尚未开通或您的手机积分账户暂不能使用，因为您未绑定任何专利系统或商标系统，请注册新的专利系统或商标系统用户并绑定此手机积分账户！');</script>";
                return;
            }
            if (rad_type_zl.Checked && model.i_zluid == 0)
            {
                div_a.InnerHtml = "<script>alert('该手机号尚未开通或您的手机积分账户暂不能使用，因为您未绑定任何专利系统或商标系统，请注册新的专利系统或商标系统用户并绑定此手机积分账户！');</script>";
                return;
            }
            if (txt_userpassword.Value.Md5Encrypt() != model.nvc_Password)
            {
                div_a.InnerHtml = "<script>alert('手机号或密码错误！');</script>";
                return;
            }
            //登录成功设cookie 并且登录专利或商标系统
            if (Request.Cookies["hqhtshop"] != null)
            {
                HttpCookie cookie = Request.Cookies["hqhtshop"];
                if (rad_type_sb.Checked)
                {
                    //cookie.Values["hqht_sb_uid"] = model.i_sbuid.ToString();
                    cookie.Values["hqht_shop_uid"] = model.i_sbuid.ToString();
                    cookie.Values["hqht_user_type"] = "sb";
                    UserLog.AddUserLog(model.i_sbuid, "商城系统", "登录商城系统");
                }
                else
                {
                    //cookie.Values["hqht_zl_uid"] = model.i_zluid.ToString();
                    cookie.Values["hqht_shop_uid"] = model.i_zluid.ToString();
                    cookie.Values["hqht_user_type"] = "zl";
                    UserLog.AddUserLog(model.i_zluid, "商城系统", "登录商城系统");
                }
                Response.Cookies.Set(cookie);
            }
            else
            {
                if (rad_type_sb.Checked)
                {
                    //Response.Cookies["hqhtshop"]["hqht_sb_uid"] = model.i_sbuid.ToString();
                    Response.Cookies["hqhtshop"]["hqht_shop_uid"] = model.i_sbuid.ToString();
                    Response.Cookies["hqhtshop"]["hqht_user_type"] = "sb";
                    UserLog.AddUserLog(model.i_sbuid, "商城系统", "登录商城系统");
                }
                else
                {
                    //Response.Cookies["hqhtshop"]["hqht_zl_uid"] = model.i_zluid.ToString();
                    Response.Cookies["hqhtshop"]["hqht_shop_uid"] = model.i_zluid.ToString();
                    Response.Cookies["hqhtshop"]["hqht_user_type"] = "zl";
                    UserLog.AddUserLog(model.i_zluid, "商城系统", "登录商城系统");
                }
            }
            Response.Redirect(Hf_Href.Value);
        }
        else
        {
            div_a.InnerHtml = "<script>alert('该手机号尚未开通！');</script>";
        }
    }
}