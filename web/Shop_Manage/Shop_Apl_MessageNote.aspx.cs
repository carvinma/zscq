using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using System.Data;
using zscq.Model;
using zscq.BLL;

public partial class Shop_Manage_shop_smspl : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(56, 0);
    public bool pageadd = Manager.GetManagerQX(56, 1);//没有添加权限，默认修改就可以发送
    dal_Member udal = new dal_Member();
    dal_Message dalU = new dal_Message();
    dal_SystemSetup sdal = new dal_SystemSetup();
    dal_Message Ndal = new dal_Message();
    Note.ChinaSms noteSms = new Note.ChinaSms();
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
            Bind_Page_Phone();
        }
    }
    public void Bind_Page_Phone()
    {
        if (string.IsNullOrEmpty(Request.QueryString["i_Id"]))
        {
            if (Request.QueryString["type"] == "1")
            {
                string tel = null;
                string uid = null;
                string username = null;
                int count = 0;
                string keyword = Request.QueryString["keyword"];
                string beginTime = Request.QueryString["beginTime"];
                string EndTime = Request.QueryString["EndTime"];
                int PId = 0;
                int CId = 0;
                int AId = 0;
                int SType = 0;
                string grade = "";
                int GId = 0;
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
                if (Request.QueryString["SType"] != null && Request.QueryString["SType"].ToString() != "")
                {
                    SType = int.Parse(Request.QueryString["SType"].ToString());
                }
                int CCount = 0;
                IQueryable<vw_Member> query = udal.Member_SelectPage(1, 10000000, uType, SType, Request.QueryString["Keyword"].ToString(), GId, PId, CId, AId, grade, beginTime, EndTime, 0, ref count);

                foreach (var q in query)
                {
                    if (q.nvc_MobilePhone != null && q.nvc_MobilePhone != "" && q.nvc_MobilePhone != "0")
                    {
                        tel += q.nvc_MobilePhone + ";";
                        count = count + 1;
                    }
                    uid += q.i_Id + ";";
                    username += q.nvc_Name + ";";
                }
                if (!string.IsNullOrEmpty(tel))
                {
                    tel = tel.Trim(';');
                }
                if (!string.IsNullOrEmpty(uid))
                {
                    uid = uid.Trim(';');
                }
                if (!string.IsNullOrEmpty(username))
                {
                    username = username.Trim(';');
                }
                this.phones.Value = tel;
                this.lbCount.Text = "共有会员" + (count - 1).ToString() + "个";
            }
            else
            {
                this.lbCount.Text = "群发短信";
            }
        }
        else
        {
            t_MessageNote acmodel = dalU.MessageNote_Select_Id(int.Parse(Request.QueryString["i_Id"]));
            this.phones.Value = acmodel.nvc_PhoneNumber;
            this.content.Value = acmodel.nvc_Content;
            this.lbCount.Text = "重新发送短信";
        }
    }
    protected void btnFS_Click(object sender, EventArgs e)// 发送短息
    {
        if (pageadd)
        {
            if (string.IsNullOrEmpty(this.phones.Value.Trim()))
            {
                div_a.InnerHtml = "<script>alert('手机不能为空');</script>";
            }
            else if (string.IsNullOrEmpty(this.content.Value.Trim()))
            {
                div_a.InnerHtml = "<script>alert('内容不能为空');</script>";
            }
            else
            {
                string keyword = Request.QueryString["keyword"];
                string beginTime = Request.QueryString["beginTime"];
                string EndTime = Request.QueryString["EndTime"];

                string[] query = this.phones.Value.Trim().Split(';').Distinct().ToArray();
                for (int i = 0; i < query.Length; i++)
                {
                    if (query[i].Trim() != "")
                    {
                        t_MessageNote model = new t_MessageNote();
                        model.nvc_Content = this.content.Value.Trim();
                        model.dt_AddTime = DateTime.Now;
                        model.nvc_PhoneNumber = query[i].Trim();
                        model.i_systemType = uType;

                        bool TorF = true;
                        //短信接口
                        TorF = noteSms.SingleSend(model.nvc_PhoneNumber, model.nvc_Content, Drp_LanguageList.SelectedValue);

                        if (TorF)
                        {
                            model.nvc_NoteState = "发送成功";
                        }
                        else
                        {
                            model.nvc_NoteState = "发送失败";
                        }
                        t_Member q = udal.Member_Select_Phone(query[i].Trim());
                        model.nvc_NoteType = "后台群发";
                        if (q != null)
                        {
                            model.i_MemberId = q.i_Id;
                        }
                        else
                        {
                            model.i_MemberId = 0;
                        }
                        model.nvc_Language = Drp_LanguageList.SelectedValue;
                        Ndal.MessageNote_Add(model);
                    }
                }
                Manager.AddLog(0, "短信管理", "批量发送短信[ <font color=\"red\">" + this.content.Value.Trim() + "</font> ]" + query.Length + "条");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_MessageNote.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=短信&hreftype=1&href1=Shop_Apl_MessageNote.aspx&href2=" + twourl);
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('你的权限不够，请与管理员联系。');history.back();</script>";
        }
    }
}
