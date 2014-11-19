using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Login : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_Adv DALA = new dal_Adv();
    public string flag = "zl";
    private string _typeid = "100";
    public string unvalue = "ユーザー名/メールボックス/携帯";
    public string pageflag = "";
    public string Login_Adv = "";
    public string _Adv = ""; 
    public string TitleOrKeyword = "";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //退出登录 清除cookies
        LoginOut();
        SetPage();
        Bind_Page_Title();
        Bind_Page_Adv();
        Bind_Page_Login();
    }
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
    }
    void Bind_Page_Adv()
    {
        t_Adv adv = DALA.Adv_Select_TypeId(int.Parse(_typeid)).FirstOrDefault();
        if (adv != null)
        {
            _Adv = adv.nvc_ImageAddress;
        }
        //var iquery = DALA.Adv_Select_TypeId(100);//登陆页面广告 449*291
        //foreach (var q in iquery.Take(1))
        //{
        //    string w = q.i_ImageWidth != 0 ? " width=\"" + q.i_ImageWidth + "\"" : " ";
        //    Login_Adv = "<a href=\"" + q.nvc_LinkAddress + "\" target=\"" + q.nvc_OpenWay + "\" title=\"" + q.nvc_LinkWord + "\"><img class=\"window_show\" alt=\"" + q.nvc_LinkWord + "\" src=\"" + q.nvc_ImageAddress + "\"" + w + " height=\"291\" /></a>";
        //}
    }
    void Bind_Page_Login()
    {
        if (Request.Cookies["hqhtshop"] != null)
        {
            #region 是否登录
            if (Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "" && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "0")
            {
                if (flag == "zl")
                {
                    Response.Redirect("User_PatentCount.aspx");
                }
            }
            if (Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "" && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "0")
            {
                if (flag == "sb")
                {
                    Response.Redirect("user_sbtj.aspx");
                }
            }

            #endregion

            #region 自动登录
            if (flag == "zl")
            {
                if (Request.Cookies["hqhtshop"]["hqht_zl_uname"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uname"] != "")
                {
                    var username = System.Web.HttpUtility.UrlDecode(Request.Cookies["hqhtshop"]["hqht_zl_uname"]);
                    unvalue = username;
                    if (Request.Cookies["hqhtshop"]["hqht_zl_ukey"] != null && Request.Cookies["hqhtshop"]["hqht_zl_ukey"] != "")
                    {
                        var password = System.Web.HttpUtility.UrlDecode(Request.Cookies["hqhtshop"]["hqht_zl_ukey"]);
                        t_Member model = DALM.Member_Select_Name(username);
                        if (model != null && model.nvc_PassWord == password && model.i_MemberType == 1)
                        {
                            Response.Cookies["hqhtshop"]["hqht_zl_uid"] = model.i_Id.ToString();
                            Response.Cookies["hqhtshop"]["hqht_zl_uname"] = System.Web.HttpUtility.UrlEncode(model.nvc_Name);
                            Response.Cookies["hqhtshop"]["hqht_zl_ukey"] = System.Web.HttpUtility.UrlEncode(password);
                            Response.Cookies["hqhtshop"]["hqht_user_type"] = "zl";
                            Response.Redirect("User_PatentCount.aspx");
                            UserLog.AddUserLog(model.i_Id, "专利系统", "登录专利系统");
                        }
                    }
                }
            }
            if (flag == "sb")
            {
                if (Request.Cookies["hqhtshop"]["hqht_sb_uname"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uname"] != "")
                {
                    var username = System.Web.HttpUtility.UrlDecode(Request.Cookies["hqhtshop"]["hqht_sb_uname"]);
                    unvalue = username;
                    if (Request.Cookies["hqhtshop"]["hqht_sb_ukey"] != null && Request.Cookies["hqhtshop"]["hqht_sb_ukey"] != "")
                    {
                        var password = System.Web.HttpUtility.UrlDecode(Request.Cookies["hqhtshop"]["hqht_sb_ukey"]);
                        t_Member model = DALM.Member_Select_Name(username);
                        if (model != null && model.nvc_PassWord == password && model.i_MemberType == 2)
                        {
                            Response.Cookies["hqhtshop"]["hqht_sb_uid"] = model.i_Id.ToString();
                            Response.Cookies["hqhtshop"]["hqht_sb_uname"] = System.Web.HttpUtility.UrlEncode(model.nvc_Name);
                            Response.Cookies["hqhtshop"]["hqht_sb_ukey"] = System.Web.HttpUtility.UrlEncode(password);
                            Response.Cookies["hqhtshop"]["hqht_user_type"] = "sb";
                            Response.Redirect("user_sbtj.aspx");
                            UserLog.AddUserLog(model.i_Id, "商标系统", "登录商标系统");
                        }
                    }
                }
            }
            #endregion
        }
    }
    void LoginOut()
    {
        if (Request["esc"] != null)
        {
            if (Request.Cookies["hqhtshop"] != null)
            {
                if (Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "" && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "0")
                {
                    HttpCookie cookie = Request.Cookies["hqhtshop"];
                    cookie.Values["hqht_zl_uid"] = null;
                    //cookie.Values["hqht_zl_ukey"] = null;
                    Response.Cookies.Set(cookie);
                    if (Response.Cookies["hqht_patentidstr"] != null)
                    {
                        Response.Cookies["hqht_patentidstr"].Value=""; //清空Cookies
                    }
                    UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString(), "专利系统", "登出专利系统");
                }
                if (Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "" && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "0")
                {

                    HttpCookie cookie = Request.Cookies["hqhtshop"];
                    cookie.Values["hqht_sb_uid"] = null;
                    //cookie.Values["hqht_sb_ukey"] = null;
                    Response.Cookies.Set(cookie);
                    UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString(), "商标系统", "退出商标系统");
                    Response.Cookies["hqht_Trademarktidstr"].Value = null;
                }
                if (Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "" && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "0")
                {

                    HttpCookie cookie = Request.Cookies["hqhtshop"];
                    cookie.Values["hqht_shop_uid"] = null;
                    Response.Cookies.Set(cookie);
                    UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString(), "商城系统", "退出系统");
                }

                Response.Redirect("index.aspx");
            }
        }
    }
    void SetPage()
    {
        if (Request["flag"] != null && Request["flag"].ToString() != "")
        {
            flag = Request["flag"].ToString();
        }
        if (flag == "sb")
        {
            _typeid = "110";
            Hf_Href.Value = "user_sbtj.aspx";
            Hf_Href2.Value = "user_sbzl.aspx";
            flag = "sb";
            pageflag = "images/sb_login2.gif";
            Hf_PageFlag.Value = "sb";
            TitleOrKeyword = "<title>" + "ユーザーログイン_" + "商標システム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
        }
        else
        {
            _typeid = "108";
            Hf_Href.Value = "user_patentcount.aspx";
            Hf_Href2.Value = "User_PatentUpdateData.aspx";
            pageflag = "images/login2.gif";
            Hf_PageFlag.Value = "zl";
            TitleOrKeyword = "<title>" + "ユーザーログイン_" + "特許システム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
        }
        if (Request["pageurl"] != null && Request["pageurl"].ToString() != "")
        {
            Hf_Href.Value = HttpUtility.UrlDecode(Request["pageurl"].ToString());
        }
    }
}