using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class user_sbly : System.Web.UI.Page
{
    DataViewDataContext dvdc = new DataViewDataContext();
    dal_Member DALM = new dal_Member();

    public string TitleOrKeyword = "";
    public string ShopName = "環球匯通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    dal_OnlineMessage DALOM = new dal_OnlineMessage();

    public string _Content = "";
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
        TitleOrKeyword = "<title>メッセージフィードバック_サービスセンター_商標システム_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerText = "";
        if (!IsPostBack)
        {
            Bind_Page_Title();
            Bind_Page_Member();
            Bind_Rpt_List();
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
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    void Bind_Rpt_List()//绑定留言列表
    {
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = from i in dvdc.vw_OnlineMessage select i;
        iquery = from i in iquery where i.i_Replay == 1 && i.i_MemberId == Convert.ToInt32(Hi_MemberId.Value) orderby i.dt_AddTime descending select i;
        count = iquery.Count();
        if (count == 0)
        {
            _Content = "関連内容ヲ見つかりませんでした！";
        }
        else
        {
            _Content = "";
        }
        iquery = iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);

        AspNetPager1.RecordCount = count;
        Rpt_List.DataSource = iquery;
        Rpt_List.DataBind();

        //s_name.Value = title;
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }

    void Add_OnlineMsg()
    {
        string subTitle = Request["ipt_subtitle"];
        string email = Request["ipt_email"];
        string conten = Request["txt_content"];

        if (!PageValidate.IsEmail(email))
        {
            //div_a.InnerHtml = "<script>alert(\"请输入正确的邮箱！\");</script>";
            //return;

            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "msg", "<script>alert(\"请输入正确的邮箱\");</script>", false);
            //  div_a.InnerHtml = "<script>alert('お客様の記入したキャラクターが規則に適合してなく、確認してからもう一度記入してください！');</script>";
            return;


        }
        if (conten.Length > 150)
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "msg", "<script>alert(\"您输入的字太多，最多150字！\");</script>", false);
            //  div_a.InnerHtml = "<script>alert('お客様の記入したキャラクターが規則に適合してなく、確認してからもう一度記入してください！');</script>";
            return;
        }
        if (StringHelper.CheckSqlKeyWord(subTitle) || StringHelper.CheckSqlKeyWord(conten))
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "msg", "<script>alert(\"お客様の記入したキャラクターが規則に適合してなく、確認してからもう一度記入してください！\");</script>", false);
            //  div_a.InnerHtml = "<script>alert('お客様の記入したキャラクターが規則に適合してなく、確認してからもう一度記入してください！');</script>";
            return;
        }


        t_OnlineMessage model = new t_OnlineMessage();
        model.dt_AddTime = DateTime.Now;
        model.i_IsTop = 0;
        model.i_MemberId = int.Parse(Hi_MemberId.Value);
        model.nvc_SubTitle = HttpUtility.HtmlEncode(subTitle);
        model.nvc_AdvisoryContent = HttpUtility.HtmlEncode(conten);
        model.nvc_Email = HttpUtility.HtmlEncode(email);
		model.i_weizhi = 3;
        model.i_IsRecommend = 0;
        model.i_Replay = 0;
        model.nvc_Language = "jp";
        if (DALOM.OnlineMessage_Add(model) > 0)
        {
            UserLog.AddUserLog(Hi_MemberId.Value, "商標システム", "添加留言");
            System.Web.UI.ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "success", "alert(\"ご質問が既にサービスセンターに発送しました。我々が24時間以内にご返答を致します。直ちに登録し、チェックしてください\");window.location='user_sbly.aspx'", true);
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "success", "alert(\"メッセージを発送出来ませんでした！\");", true);
        }
    }

    protected void ibtn_ok_Click(object sender, ImageClickEventArgs e)
    {
        Add_OnlineMsg();
    }
}