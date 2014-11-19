using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Register : System.Web.UI.Page
{
    public string contents = "";
    public string pageflag = "";
    public string _Title = "회원가입";
    public string TitleOrKeyword = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    private string _typeid = "101";
    public string _Adv = "", radioinfo1 = "개인", radioinfo2 = "기업", radioinfo3 = "사무소";
    dal_Adv DALADV = new dal_Adv();
    dal_SinglePage DALSP = new dal_SinglePage();

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
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request["pageurl"] != null && Request["pageurl"].ToString() != "")
        {
            Hf_Href.Value = Request["pageurl"].ToString();
        }
        if (Request["flag"] != null && Request["flag"].ToString() != "")
        {
            if (Request["flag"].ToString() == "zl")
            {
                Bind_XY("regxyz", "kr");
                _typeid = "113";
                pageflag = "images/reg1.gif";
                Hf_PageFlag.Value = "zl";
                TitleOrKeyword = "<title>" + "회원가입_" + "특허시스템_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
            }
            else if (Request["flag"].ToString() == "sb")
            {
                Bind_XY("regxy", "kr");
                _typeid = "115";
                radioinfo1 = "개인";
                radioinfo2 = "기업";
                radioinfo3 = "사무소 ";
                pageflag = "images/reg2.gif";
                Hf_PageFlag.Value = "sb";
                TitleOrKeyword = "<title>" + "회원가입_" + "상표시시템_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
            }
            else
            {
                Response.Redirect("index.aspx");
            }
            //=============
            //if (Request["href"] != null && Request["href"].ToString() != "")
            //{
            //    Hf_Href.Value = Request["href"].ToString();
            //}
            //==========
        }
        else
        {
            Response.Redirect("index.aspx");
        }
        Bind_Page_Title();
        Bind_Drp_PGuoJiaType();

        t_Adv adv = DALADV.Adv_Select_TypeId(int.Parse(_typeid)).FirstOrDefault();
        if (adv != null)
        {
            _Adv = adv.nvc_ImageAddress;
        }
    }
    void Bind_Drp_PGuoJiaType()// 绑定国籍
    {
        dal_Nationality DALN = new dal_Nationality();
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_HanName, q.i_Id.ToString());
            Drp_GuoJi.Items.Add(li);
        }
    }
    void Bind_XY(string xykey, string guoji)
    {
        t_SinglePage about = DALSP.SinglePage_Select_Key(xykey, guoji);
        contents = about.nt_Value;
    }
}