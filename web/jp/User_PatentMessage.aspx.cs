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
    DataViewDataContext dvdc = new DataViewDataContext();
    dal_Member DALM = new dal_Member();
    dal_OnlineMessage DALOM = new dal_OnlineMessage();

    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerText = "";
        if (Request["ftype"] == "Add")
        {
            Add_OnlineMsg();
        }
        if (!IsPostBack)
        {
            Bind_Page_Member();
        }
        Bind_Rpt_List();
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString();
            t_Member tm = DALM.Member_Select_Id(Hi_MemberId.Value.GetInt());
            if (tm != null)
            {
                ipt_email.Value = tm.nvc_Email;
            }
        }
        else
        {
            Hi_MemberId.Value = "0";
        }
    }

    void Bind_Rpt_List()
    {
        int count = 0;
        int pagesize = AspNetPager1.PageSize;
        int pageindex = AspNetPager1.CurrentPageIndex;
        var iquery = from i in dvdc.vw_OnlineMessage select i;
        iquery = from i in iquery where i.i_Replay == 1 && i.i_MemberId == Convert.ToInt32(Hi_MemberId.Value) orderby i.dt_AddTime descending select i;
        count = iquery.Count();

        iquery = iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        AspNetPager1.RecordCount = count;
        Rpt_List.DataSource = iquery;
        Rpt_List.DataBind();
    }
    protected void AspNetPager1_PageChanging(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }
    void Add_OnlineMsg()
    {
        string subTitle = Request["ipt_subtitle"].ExecRepaceHTML();
        string email = Request["ipt_email"].ExecRepaceHTML();
        string conten = Request["txt_content"].ExecRepaceHTML();
        if (!PageValidate.IsEmail(email))
        {
            div_a.InnerHtml = "<script>alert(\"メールアドレスを入力してください！\");</script>";
            return;
        }

        t_OnlineMessage model = new t_OnlineMessage();
        model.dt_AddTime = DateTime.Now;
        model.i_IsTop = 0;
        model.i_MemberId = int.Parse(Hi_MemberId.Value);
        model.nvc_SubTitle = HttpUtility.HtmlEncode(subTitle);
        model.nvc_AdvisoryContent = HttpUtility.HtmlEncode(conten);
        model.nvc_Email = HttpUtility.HtmlEncode(email);
		model.i_weizhi = 2;
        model.i_IsRecommend = 0;
        model.i_Replay = 0;
        model.nvc_Language = "jp";
        UserLog.AddUserLog(Hi_MemberId.Value, "专利系统", "发布留言");
        if (DALOM.OnlineMessage_Add(model) > 0)
            div_a.InnerHtml = "<script>alert(\"ご質問が既にサービスセンターに発送しました。我々が24時間以内にご返答を致します。直ちに登録し、チェックしてください\");window.location='user_patentmessage.aspx'</script>";
        else
            div_a.InnerHtml = "<script>alert(\"メッセージを発送出来ませんでした！\");</script>";
    }
    protected void lbtn_Search_Click(object sender, EventArgs e)
    {
        AspNetPager1.CurrentPageIndex = 0;
        Bind_Rpt_List();
    }
}