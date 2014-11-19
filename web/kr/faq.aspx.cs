using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class faq : System.Web.UI.Page
{
    public string _Title = "FAQ";
    public string _Name = "";
    public string _Content = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";
    public string title = "";
    dal_OnlineMessage DALOM = new dal_OnlineMessage();
    DataViewDataContext dvdc = new DataViewDataContext();
    dal_Member DALM = new dal_Member();
    void Bind_Page_Title()
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
    void Bind_Page_Value()
    {
        t_PageInfo model = new dal_PageInfo().PageInfo_Select_Id(36);

        _Title = string.IsNullOrWhiteSpace(model.PageTitle) ? _Title : model.PageTitle;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;

        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerText = "";
        if (!IsPostBack)
        {
            try
            {
                Bind_Rpt_List();
            }
            catch
            {
                Response.Write("<script>history.go(-1);</Script>");
            }

        }
        Bind_Page_Title();
        Bind_Page_Value();
        Bind_Email();
    }
    void Bind_Rpt_List()
    {

        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = from i in dvdc.vw_OnlineMessage where i.nvc_Language=="kr" select i;
        if (!string.IsNullOrWhiteSpace(Request.QueryString["pagekey"]))
        {
            title = Server.UrlDecode(Request.QueryString["pagekey"]).RemoveUnSafe(30);//.ExecRemoveHTML(); 
            if (StringHelper.CheckSqlKeyWord(title))
            {
                lb_msg.Text = "규범에 맞지 않습니다 확인하고 다시 입력해주세요！";
                return;
            }
            pagekeyword.Value = title;
            iquery = from i in iquery where i.nvc_SubTitle.Contains(title) || i.nvc_AdvisoryContent.Contains(title) || i.nvc_ReplayContent.Contains(title) select i;
        }
        iquery = from i in iquery where i.i_Replay == 1 select i;
        iquery = from i in iquery where i.i_IsRecommend == 1 || i.i_MemberId == 0 orderby i.i_IsTop descending, i.dt_AddTime descending select i;

        count = iquery.Count();
        iquery = iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);

        AspNetPager1.RecordCount = count;
        Rpt_List.DataSource = iquery;
        Rpt_List.DataBind();

    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
    protected void lbtn_Search_Click(object sender, EventArgs e)
    {
        AspNetPager1.CurrentPageIndex = 0;
        Bind_Rpt_List();
    }
    protected void ibtn_Add_Click(object sender, ImageClickEventArgs e)
    {
        string subTitle = Request["ipt_subtitle"].ExecRepaceHTML();
        string email = Request["ipt_email"].ExecRepaceHTML();
        string conten = Request["txt_content"].ExecRepaceHTML();
        if (!PageValidate.IsEmail(email))
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "msg", "<script>alert(\"请输入正确的邮箱！\");</script>", false);
            return;
        }
        t_OnlineMessage model = new t_OnlineMessage();
        model.dt_AddTime = DateTime.Now;
        model.i_IsTop = 0;
        model.nvc_SubTitle = HttpUtility.HtmlEncode(subTitle);
        model.nvc_AdvisoryContent = HttpUtility.HtmlEncode(conten);
        model.nvc_Email = HttpUtility.HtmlEncode(email);
		model.i_weizhi = 1;
        model.i_IsRecommend = 1;
        model.i_Replay = 0;
        model.nvc_Language = "kr";
        if (DALOM.OnlineMessage_Add(model) > 0)
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "msg", "<script>alert(\"문제는 이미 고개센터로  발송하였습니다 24시간이내에 답변드리겠습니다  즉지검색하기를  바랍니다！\");window.location='faq.aspx';</script>", false);
        else
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "msg", "<script>alert(\"뎃글 발송실페！\");</script>", false);

    }

    /// <summary>
    /// 给在线咨询中的email框赋值
    /// </summary>
    void Bind_Email()
    {
        int uid = 0;
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "")
        {
            uid = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
        }
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            uid = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);
        }
        t_Member tm = DALM.Member_Select_Id(uid);
        if (tm != null)
        {
            ipt_email.Value = tm.nvc_Email;
        }
    }
}