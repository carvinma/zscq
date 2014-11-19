using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
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
        catch { }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString();
            t_Member model = DALM.Member_Select_Id(Convert.ToInt32(Hi_MemberId.Value));
            Hi_Mr.Value = model.i_DefaultAddress.ToString();
        }
        else
        {
            Hi_MemberId.Value = "0";
        }
    }
    public void Delete_Address()//削除地址
    {
        if (Request.QueryString["PageType"].ToString() == "del")
        {
            int Id = Convert.ToInt32(Request.QueryString["did"].ToString());
            if (DALRA.ReceiveAddress_Del(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('事故が起こり、このアドレスを削除することができない！')</script>";
            }
            UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_zl_uid"], "专利系统", "删除地址");
        }
    }
    public void Update_TopAddress()//デフォルト設定
    {
        if (Request.QueryString["PageType"].ToString() == "mr")
        {
            int Id = Convert.ToInt32(Request.QueryString["mid"].ToString());
            if (DALRA.ReceiveAddress_Update_Mr(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('事故が起こり！')</script>";
            }
            else
            {
                Hi_Mr.Value = Request.QueryString["mid"].ToString();
            }
        }
        UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_zl_uid"], "专利系统", "设置默认地址");
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
    protected void AspNetPager1_PageChanging(object sender, EventArgs e)
    {
        Bind_Page_Address();
    }
}