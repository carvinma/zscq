using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;

public partial class Shop_Manage_shop_mailpl : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(52, 0);
    public bool pageadd = Manager.GetManagerQX(52, 1);//没有添加权限，默认修改就可以发送
    dal_Member soldal = new dal_Member();
    dal_Email dal = new dal_Email();
    dal_Member udal = new dal_Member();
    dal_SystemKey DALSK = new dal_SystemKey();
    dal_EmailModel DALEM = new dal_EmailModel();
    public string content = "";
    public string EModelName = "";
    int uType = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(Drp_LanguageList);
            Bind_DDL_Model();
            Bind_Page_value();
        }
    }
    public void Bind_Page_value()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            t_EmailNote model = dal.EmailNote_Select_Id(int.Parse(Request.QueryString["id"]));
            this.area_Title.Value = model.nvc_Title;
            content = model.nvc_EmailContent;
            Drp_LanguageList.SelectedValue = model.nvc_Language;
        }
        else if (Request.QueryString["PageType"] != null && Request.QueryString["PageType"].ToString() != "" && Request.QueryString["PageType"].ToString() == "Mail")
        {
            string statiem = Request.QueryString["STime"].ToString() == "" ? String.Format("{0:yyyy-MM-dd}", System.DateTime.Now.AddYears(-1)) : Request.QueryString["STime"].ToString();
            string endtime = Request.QueryString["ETime"].ToString() == "" ? String.Format("{0:yyyy-MM-dd}", System.DateTime.Now.AddDays(1)) : Request.QueryString["ETime"].ToString();
            string Str_Mail = "";
            int ccount = 0;
            string grade = "";
            int GId = 0;
            int PId = 0;
            int CId = 0;
            int AId = 0;
            int TypeUser = 0;
            if (Request.QueryString["Keyword"].ToString() != "")
            {
                TypeUser = int.Parse(Request.QueryString["SType"].ToString());
            }
            if (Request.QueryString["uType"] != null && Request.QueryString["uType"].ToString() != "")
            {
                uType = int.Parse(Request.QueryString["uType"].ToString());
            }
            if (Request.QueryString["grade"] != null && Request.QueryString["grade"].ToString() != "")
            {
                grade = Request.QueryString["grade"];
            }
            if (Request.QueryString["GId"] != null && Request.QueryString["GId"].ToString() != "")
            {
                GId = int.Parse(Request.QueryString["GId"].ToString());
            }
            if (Request.QueryString["PId"] != null && Request.QueryString["PId"].ToString() != "")
            {
                PId = int.Parse(Request.QueryString["PId"].ToString());
            }
            if (Request.QueryString["CId"] != null && Request.QueryString["CId"].ToString() != "")
            {
                CId = int.Parse(Request.QueryString["CId"].ToString());
            }
            if (Request.QueryString["AId"] != null && Request.QueryString["AId"].ToString() != "")
            {
                AId = int.Parse(Request.QueryString["AId"].ToString());
            }
            IQueryable<vw_Member> query = soldal.Member_SelectPage(1, 10000000, uType, TypeUser, Request.QueryString["Keyword"].ToString(), GId, PId, CId, AId, grade, statiem, endtime, 0, ref ccount);

            foreach (var q in query)
            {
                if (q.nvc_Email != null && q.nvc_Email != "")
                {
                    Str_Mail += ";" + q.nvc_Email;
                }
            }
            this.phones.Value = Str_Mail.Length > 1 ? Str_Mail.Remove(0, 1) : Str_Mail;
        }
    }
    public void Bind_DDL_Model()
    {
        DDL_Model.Items.Clear();
        DDL_Model.Items.Add(new ListItem("请选择", "0"));
        DDL_Model.DataSource = DALEM.EmailModel_SelectAll_Orderby(Drp_LanguageList.SelectedValue);
        DDL_Model.DataTextField = "nvc_Name";
        DDL_Model.DataValueField = "i_Id";
        DDL_Model.DataBind();
    }
    protected void btnFS_Click(object sender, EventArgs e)// 发送邮件
    {
        if (pageadd)
        {
            if (string.IsNullOrEmpty(this.phones.Value.Trim()))
            {
                div_a.InnerHtml = "<script>alert('邮箱不能为空');</script>";
            }
            else if (string.IsNullOrEmpty(Request.Form["myContent"]))
            {
                div_a.InnerHtml = "<script>alert('内容不能为空');</script>";
            }
            else
            {
                t_SystemKey sys = DALSK.SystemKey_Select_Key("smtp_email", Drp_LanguageList.SelectedValue);
                string smtp_email = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_name", Drp_LanguageList.SelectedValue);
                string smtp_name = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_username", Drp_LanguageList.SelectedValue);
                string smtp_username = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_password", Drp_LanguageList.SelectedValue);
                string smtp_password = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp", Drp_LanguageList.SelectedValue);
                string smtp = sys.nt_Value;

                string Domain = Request.Url.AbsoluteUri;
                try
                {
                    Domain = Domain.Substring(Domain.IndexOf(":") + 3);//http://之后的
                    Domain = Domain.Substring(0, Domain.IndexOf('/'));
                }
                catch { }
                string[] email = this.phones.Value.Trim().Split(';').Distinct().ToArray();
                string Content = Request.Form["myContent"].Replace("src=\"/Shop_Manage/Uppic_web/", "src=\"http://" + Domain + "/Shop_Manage/Uppic_web/");

                for (int i = 0; i < email.Length; i++)
                {
                    if (email[i].Trim() != "")
                    {
                        string reWrite = Email.Mail(smtp_email, smtp_name, email[i].Trim(), area_Title.Value, Content, smtp_username, smtp_password, smtp, "");

                        #region 插入流水
                        t_EmailNote model = new t_EmailNote();
                        if (Request.QueryString["uType"] != null && Request.QueryString["uType"].ToString() != "")
                        {
                            uType = int.Parse(Request.QueryString["uType"].ToString());
                            var mem = soldal.Member_Select_Email(email[i].Trim(), uType);
                            model.i_MemberId = mem.i_Id;
                            model.nvc_Email = email[i].Trim();
                            model.nvc_MemberName = mem.nvc_Name;
                        }
                        else
                        {
                            var mem = soldal.Member_Select_Email(email[i].Trim());
                            model.i_MemberId = mem.i_Id;
                            model.nvc_Email = email[i].Trim();
                            model.nvc_MemberName = mem.nvc_Name;
                        }

                        model.nvc_Title = area_Title.Value;
                        model.nvc_EmailContent = Content;
                        model.nvc_EmailState = reWrite;
                        model.i_systemType = uType;
                        model.nvc_Language = Drp_LanguageList.SelectedValue;
                        dal.EmailNote_Add(model);
                        #endregion
                    }
                }
                if (cb_newmodel.Checked)
                {
                    #region 插入新模板
                    t_EmailModel EModel = new t_EmailModel();
                    EModel.dt_AddTime = DateTime.Now;
                    EModel.nvc_Name = text_modelname.Value;
                    EModel.nvc_Title = area_Title.Value;
                    EModel.nt_Content = Request.Form["myContent"];
                    DALEM.EmailModel_Add(EModel);
                    #endregion
                }
                if (cb_updatemodel.Checked)
                {
                    #region 更改模板
                    t_EmailModel EModel = DALEM.EmailModel_Select_Id(int.Parse(DDL_Model.SelectedValue));
                    if (EModel != null)
                    {
                        EModel.nvc_Title = area_Title.Value;
                        EModel.nt_Content = Request.Form["myContent"];
                        DALEM.EmailModel_Update(EModel);
                    }
                    #endregion
                }
                Manager.AddLog(0, "邮件管理", "批量发送邮件[ <font color=\"red\">" + area_Title.Value + "</font> ]" + email.Length + "封");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Mail.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=邮件&hreftype=1&href1=Shop_Apl_Mail.aspx&href2=" + twourl);
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('你的权限不够，请与管理员联系。');history.back();</script>";
        }
    }
    protected void DDL_Model_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDL_Model.SelectedValue != "0")
        {
            tr_new.Visible = false;
            tr_update.Visible = true;
            t_EmailModel EM = DALEM.EmailModel_Select_Id(int.Parse(DDL_Model.SelectedValue));
            if (EM != null)
            {
                area_Title.Value = EM.nvc_Title;
                content = EM.nt_Content;
            }
            EModelName = DDL_Model.SelectedItem.Text;
        }
        else
        {
            tr_new.Visible = true;
            tr_update.Visible = false;
        }
    }
    protected void Drp_LanguageList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_DDL_Model();
    }
}
