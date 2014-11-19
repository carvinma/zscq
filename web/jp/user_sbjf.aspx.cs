using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;

public partial class user_sbjf : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
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
        TitleOrKeyword = "<title>私のポイント_ショッピングセンターシステム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            SetLogin();
            Bind_Page_Member();
            Bind_Page_Title();
        }
    }
    protected void Bind_Page_Member()
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    protected void SetLogin()
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
        {
            Response.Redirect("user_shopintegral.aspx");
        }
    }

}
//protected void Ibtn_OK_Click(object sender, ImageClickEventArgs e)
//{
//    int uid = Hi_MemberId.Value.GetInt();
//    string uPwd = txt_Pwd.Value.Trim().Md5Encrypt();
//    string mobile = txt_Mobile.Value.Trim();
//    var member = DALM.Member_Select_Id(uid);
//    if (member != null)
//    {
//        t_IntegralMobile m_im = DALIM.IntegralMobile_SelectByMobile(mobile);
//        if (m_im != null && m_im.i_sbuid == uid)
//        {
//            #region 积分账户登录
//            if (m_im.nvc_Password != uPwd || m_im.nvc_Mobile != txt_Mobile.Value)
//            {
//                div_a.InnerHtml = "<script>alert('携帯番号或いはパスワードが正しくありません！')</script>";
//                return;
//            }
//            //设cookie
//            HttpCookie cookie = Request.Cookies["hqhtshop"];
//            cookie.Values["hqht_shop_mid"] = m_im.i_Id.ToString();
//            cookie.Values["hqht_shop_uid"] = Hi_MemberId.Value;
//            cookie.Values["hqht_user_type"] = "sb";
//            Response.Cookies.Set(cookie);
//            UserLog.AddUserLog(Hi_MemberId.Value, "商城系统", "登录商城");
//            //页面跳转 
//            if (Request.QueryString["pageurl2"] != null && Request.QueryString["pageurl2"] != "")
//            {
//                Response.Redirect(HttpUtility.UrlDecode(Request.QueryString["pageurl2"]));
//            }
//            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg1", "<script>goto1('user_shopintegral.aspx');</script>", false);
//            //Response.Redirect("user_shopintegral.aspx");
//            #endregion

//        }
//        else
//        {
//            #region 积分账户绑定
//            t_IntegralMobile model = null;
//            model = DALIM.IntegralMobile_SelectByMobile(mobile);
//            if (model != null) //是否已经存在手机号
//            {
//                #region 绑定已有手机
//                if (model.i_sbuid == 0) //是否已经被使用
//                {
//                    if (model.nvc_Password == uPwd) // 用户密码是否一致
//                    {
//                        model.i_sbuid = uid;
//                        DALIM.IntegralMobile_Updata(model);
//                        member.i_IntegralMobileId = model.i_Id;
//                        DALM.Member_Update(member);
//                        UserLog.AddUserLog(uid, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志

//                        //设cookie
//                        HttpCookie cookie = Request.Cookies["hqhtshop"];
//                        cookie.Values["hqht_shop_mid"] = model.i_Id.ToString();
//                        cookie.Values["hqht_shop_uid"] = Hi_MemberId.Value;
//                        cookie.Values["hqht_user_type"] = "sb";
//                        Response.Cookies.Set(cookie);
//                        UserLog.AddUserLog(Hi_MemberId.Value, "商城系统", "登录商城");

//                        // Response.Redirect("user_shopintegral.aspx");
//                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg1", "<script>goto1('user_shopintegral.aspx');</script>", false);
//                        //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('绑定积分手机号成功，请重新登录！');</script>", false); return;
//                    }
//                    else
//                    {
//                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('パスワードと元のパスワードが一緻しない、失敗する！');</script>", false); return;
//                    }

//                }
//                else
//                {
//                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('すでに商標ユーザーの携帯電話号！');</script>", false); return;
//                }
//                #endregion
//            }
//            else
//            {
//                #region 开通信手机
//                model = new t_IntegralMobile();
//                model.i_sbuid = uid;
//                model.nvc_Mobile = txt_Mobile.Value;
//                model.nvc_Password = txt_Pwd.Value.Md5Encrypt();
//                DALIM.IntegralMobile_Add(model);
//                member.i_IntegralMobileId = model.i_Id;
//                DALM.Member_Update(member);
//                UserLog.AddUserLog(uid, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志

//                HttpCookie cookie = Request.Cookies["hqhtshop"];
//                cookie.Values["hqht_shop_mid"] = model.i_Id.ToString();
//                cookie.Values["hqht_shop_uid"] = Hi_MemberId.Value;
//                cookie.Values["hqht_user_type"] = "sb";
//                Response.Cookies.Set(cookie);
//                UserLog.AddUserLog(Hi_MemberId.Value, "商城系统", "登录商城");
//                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg1", "<script>goto1('user_shopintegral.aspx');</script>", false);
//                //Response.Redirect("user_shopintegral.aspx");
//                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('绑定积分手机号成功，请重新登录！');</script>", false); return;
//                #endregion
//            }
//            #endregion
//        }
//    }
//    else
//    {
//        Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
//    }
//}