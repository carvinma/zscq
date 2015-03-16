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
    public string ShopName = "環球匯通";
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
        TitleOrKeyword = "<title>" + "ユーザー登録_" + "ショッピングセンターシステム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        t_Adv adv = DALADV.Adv_Select_TypeId(118).FirstOrDefault();
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
            div_a.InnerHtml = "<script>alert('検証番号エラー！');</script>";
            return;
        }
        var model = DALIM.IntegralMobile_SelectByMobile(txt_username.Value.Trim());
        if (model != null)
        {
            if (rad_type_sb.Checked && model.i_sbuid == 0)
            {
                div_a.InnerHtml = "<script>alert('あなたは任意の特許システム或は商標システムとバインディングしなかったため、携帯電話ポイントアカウントは一時的に使用することができません！');</script>";
                return;
            }
            if (rad_type_zl.Checked && model.i_zluid == 0)
            {
                div_a.InnerHtml = "<script>alert('あなたは任意の特許システム或は商標システムとバインディングしなかったため、携帯電話ポイントアカウントは一時的に使用することができません！');</script>";
                return;
            }
            if (txt_userpassword.Value.Md5Encrypt() != model.nvc_Password)
            {
                div_a.InnerHtml = "<script>alert('携帯番号或いはパスワードが正しくありません！');</script>";
                return;
            }
            //登录成功设cookie 并且登录专利或商標システム
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
                else if (rad_type_zl.Checked)
                {
                    //Response.Cookies["hqhtshop"]["hqht_zl_uid"] = model.i_zluid.ToString();
                    Response.Cookies["hqhtshop"]["hqht_shop_uid"] = model.i_zluid.ToString();
                    Response.Cookies["hqhtshop"]["hqht_user_type"] = "zl";
                    UserLog.AddUserLog(model.i_zluid, "商城系统", "登录商城系统");
                }
                else if (rad_type_normal.Checked)
                {
                    Response.Cookies["hqhtshop"]["hqht_shop_uid"] = model.i_Id.ToString();
                    Response.Cookies["hqhtshop"]["hqht_user_type"] = "normal";
                    UserLog.AddUserLog(model.i_Id, "商城系统", "登录商城系统");
                }
            }
            Response.Redirect(Hf_Href.Value);
        }
        else
        {
            div_a.InnerHtml = "<script>alert('この携帯番号がまだ開通されていません！');</script>";
        }
    }
}