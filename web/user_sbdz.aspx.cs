using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class user_sbdz : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    public string PageType = "添加地址";
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
        TitleOrKeyword = "<title>票据邮寄地址_账户中心_商标系统_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        Bind_Page_Member();
        if (!IsPostBack)
        {
            if (Request.QueryString["PageType"] != null && Request.QueryString["PageType"] != "")
            {
                Delete_Address();
                Update_TopAddress();
            }
            Bind_Page_Address();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
            t_Member m = DALM.Member_Select_Id(int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString()));
            if (m != null)
            {
                Hi_Mr.Value = m.i_DefaultAddress.ToString();
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    public void Delete_Address()//删除地址
    {
        if (Request.QueryString["PageType"].ToString() == "del")
        {
            int Id = Convert.ToInt32(Request.QueryString["did"].ToString());
            var member = DALM.Member_Select_Id(Convert.ToInt32(Hi_MemberId.Value));
            if (member.i_DefaultAddress == Id)
            {
                member.i_DefaultAddress = 0;
                DALM.Member_Update(member);
                UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "删除地址");
            }
            if (DALRA.ReceiveAddress_Del(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('发生意外，该地址无法删除！')</script>";
            }
        }
    }
    public void Update_TopAddress()//设为默认
    {
        if (Request.QueryString["PageType"].ToString() == "mr")
        {
            int Id = Convert.ToInt32(Request.QueryString["mid"].ToString());
            if (DALRA.ReceiveAddress_Update_Mr(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('发生意外！')</script>";
            }
            else
            {
                Hi_Mr.Value = Request.QueryString["mid"].ToString();
            }
            UserLog.AddUserLog(Hi_MemberId.Value.GetInt(), "商标系统", "修改默认地址");
        }
    }
    public void Bind_Page_Address()//绑定所有地址
    {
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = DALRA.ReceiveAddress_vw_Select_MemberId(pageindex, pagesize, int.Parse(Hi_MemberId.Value), ref count);
        AspNetPager1.RecordCount = count;
        Repeater1.DataSource = iquery;
        Repeater1.DataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Page_Address();
    }
}