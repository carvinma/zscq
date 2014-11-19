using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class FindPwd : System.Web.UI.Page
{
    public string _Name = "";
    public string _Title = "Retrieve Password";
    public string _Content = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    dal_SystemKey DALSK = new dal_SystemKey();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_Member DALM = new dal_Member();
    public void Bind_Page_Title()
    {
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
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (!string.IsNullOrWhiteSpace(Request.QueryString["flag"]) && (Request.QueryString["flag"] == "zl" || Request.QueryString["flag"] == "sb"))
        {
            Hid_MemberType.Value = Request.QueryString["flag"].ToString(); ;
        }
        else
        {
            Response.Redirect("index.aspx");
        }
        try
        {
            Bind_Page_Title();
            Bind_Page_Value();
        }
        catch
        {
            //Response.Write("<script>history.go(-1);</Script>");
        }
    }
    void Bind_Page_Value()
    {
        t_SystemKey about = DALSK.SystemKey_Select_Key("nvc_About");
        _Content = about.nt_Value;
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(10);
        _Name = string.IsNullOrWhiteSpace(model.PageTitle) ? _Name : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;
        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void lbtn_OK_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["Validate"] != null && Session["Validate"].ToString() != "")
        {
            string vcode = Session["Validate"].ToString().ToLower();
            if (TXT_V.Value.Trim().ToLower() != vcode)
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>$('#msg_v').text('Verification Code error！')</script>", false);
                return;
            }
            t_Member User_Model = new t_Member();
            if (Hid_MemberType.Value == "zl")
            {
                User_Model = DALM.Member_Select_Name(Hid_UserName.Value,1);
            }
            else
            {
                User_Model = DALM.Member_Select_Name(Hid_UserName.Value,2);
            }
            //if (User_Model.nvc_Email == Hid_Email.Value || User_Model.nvc_MobilePhone == Hid_Mobile.Value)
            //{
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('修改失败！');window.location='FindPwd.aspx';</script>", false);
            //}
            User_Model.nvc_PassWord = FormsAuthentication.HashPasswordForStoringInConfigFile(TXT_NEWPWD.Value, "MD5");
            if (DALM.Member_Update(User_Model) > 0)
            {
                UserLog.AddUserLog(User_Model.i_Id, "修改密码", "修改密码");
                Session["Validate"] = null;
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>if(window.confirm('Modify successfully！Are login？')){window.location='Login.aspx?flag=" + (User_Model.i_MemberType == 1 ? "zl" : User_Model.i_MemberType == 2 ? "sb" : "") + "';}else{window.location='index.aspx';}</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('Modification fails！');window.location='FindPwd.aspx';</script>", false);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>$('#msg_v').text('Verification code has expired！');window.location='FindPwd.aspx'; </script>", false);
        }
    }
}
