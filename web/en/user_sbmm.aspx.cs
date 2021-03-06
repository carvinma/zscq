﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class user_sbmm : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();

    public string TitleOrKeyword = "";
    public string ShopName = "Global Patent";
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
        TitleOrKeyword = "<title>Modify password_My information center_System of Trademark Maintenance_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        Bind_Page_Title();
        if (!IsPostBack)
        {
            Bind_Page_Member();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=user_sbmm.aspx");
        }
    }
    protected void Bt_Submit_Click(object sender, EventArgs e)//Modify password
    {
        t_Member User_Model = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
        if (User_Model.nvc_PassWord != FormsAuthentication.HashPasswordForStoringInConfigFile(iptOldpwd.Value, "MD5"))
        {
            div_a.InnerHtml = "<script>alert('Old password is incorrect！')</script>";
            return;
        }
        User_Model.nvc_PassWord = FormsAuthentication.HashPasswordForStoringInConfigFile(iptNewpwd2.Value, "MD5");
        DALM.Member_Update(User_Model);
        UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "修改密码");
        
        div_a.InnerHtml = "<script>alert('Modify successfully！It will be validated at next login！');</script>";
    }
}