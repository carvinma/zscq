using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class User_PatentCount : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Bind_Page_Member();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString();
        }
        else
        {
            Hi_MemberId.Value = "0";
        }
    }
    protected void Bt_Submit_Click(object sender, EventArgs e)//비밀번호 수정
    {
        t_Member User_Model = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
        if (User_Model.nvc_PassWord != FormsAuthentication.HashPasswordForStoringInConfigFile(iptOldpwd.Value, "MD5"))
        {
            div_a.InnerHtml = "<script>alert('원비밀번호가 틀렸습니다！')</script>";
            return;
        }
        User_Model.nvc_PassWord = FormsAuthentication.HashPasswordForStoringInConfigFile(iptNewpwd2.Value, "MD5");
        UserLog.AddUserLog(Hi_MemberId.Value, "专利系统", "修改密码");
        DALM.Member_Update(User_Model);
        div_a.InnerHtml = ("<script>alert('수개성공 !다음 로그할때 효력이 발생합니다！')</script>");
    }
}