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
    public string _Title = "ユーザー登録";
    public string TitleOrKeyword = "";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    private string _typeid = "101";
    public string _Adv = "", radioinfo1 = "個人", radioinfo2 = "企業", radioinfo3 = "事務所";
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
                Bind_XY("regxyz", "jp");
                _typeid = "109";
                pageflag = "images/reg1.gif";
                Hf_PageFlag.Value = "zl";
                TitleOrKeyword = "<title>" + "ユーザー登録_" + "特許システム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
            }
            else if (Request["flag"].ToString() == "sb")
            {
                Bind_XY("regxy", "jp");
                _typeid = "111";
                radioinfo1 = "個人";
                radioinfo2 = "企業";
                radioinfo3 = "事務所";
                pageflag = "images/reg2.gif";
                Hf_PageFlag.Value = "sb";
                TitleOrKeyword = "<title>" + "ユーザー登録_" + "商標システム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
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
            ListItem li = new ListItem(q.nvc_JpanName, q.i_Id.ToString());
            Drp_GuoJi.Items.Add(li);
        }
    }
    void Bind_XY(string xykey, string guoji)
    {
        t_SinglePage about = DALSP.SinglePage_Select_Key(xykey, guoji);
        contents = about.nt_Value;
    }
}