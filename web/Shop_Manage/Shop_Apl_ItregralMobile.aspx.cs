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

public partial class Shop_Manage_Shop_Apl_ItregralMobile : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(33, 0);
    public bool pageadd = Manager.GetManagerQX(33, 1);//没有添加权限，默认修改就可以发送

    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_Message dalU = new dal_Message();
    dal_SystemSetup sdal = new dal_SystemSetup();
    dal_Message Ndal = new dal_Message();
    Note.ChinaSms noteSms = new Note.ChinaSms();
    int uType = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
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
            if (Request.QueryString["PageType"] == "Phone")
            {
                string tel = null;
                string uid = null;
                //string username = null;
                int count = 0;
                string keyword = Request.QueryString["keyword"];
                string beginTime = Request.QueryString["BeginTime"];
                string EndTime = Request.QueryString["EndTime"];

                int CCount = 0;
                IQueryable<t_IntegralMobile> query = DALIM.IntegralMobile_SelectByPage(1, 100000000, keyword, beginTime, EndTime, ref CCount);
                foreach (var q in query)
                {
                    if (q.nvc_Mobile != null && q.nvc_Mobile != "" && q.nvc_Mobile != "0")
                    {
                        tel += q.nvc_Mobile + ";";
                        count = count + 1;
                    }
                    uid += q.i_Id + ";";
                    //username += q.nvc_Mobile + ";";
                }
                if (!string.IsNullOrEmpty(tel))
                {
                    tel = tel.Trim(';');
                }
                if (!string.IsNullOrEmpty(uid))
                {
                    uid = uid.Trim(';');
                }
                //if (!string.IsNullOrEmpty(username))
                //{
                //    username = username.Trim(';');
                //}
                this.phones.Value = tel;

            }
        }
        else
        {
            t_MessageNote acmodel = dalU.MessageNote_Select_Id(int.Parse(Request.QueryString["i_Id"]));
            this.phones.Value = acmodel.nvc_PhoneNumber;
            this.content.Value = acmodel.nvc_Content;
        }
    }
    protected void btnFS_Click(object sender, EventArgs e)// 发送短息
    {
        if (pageview)
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
                t_MessageNote model = new t_MessageNote();
                string keyword = Request.QueryString["keyword"];
                string beginTime = Request.QueryString["BeginTime"];
                string EndTime = Request.QueryString["EndTime"];

                string[] query = this.phones.Value.Trim().Split(';').Distinct().ToArray();
                for (int i = 0; i < query.Length; i++)
                {
                    if (query[i].Trim() != "")
                    {
                        model.nvc_Content = this.content.Value.Trim();
                        model.dt_AddTime = DateTime.Now;
                        model.nvc_PhoneNumber = query[i].Trim();
                        model.i_systemType = uType;
                        model.nvc_NoteType = "积分提醒";
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
                        model.nvc_Language = Drp_LanguageList.SelectedValue;
                        Ndal.MessageNote_Add(model);
                    }
                }
                Manager.AddLog(0, "短信管理", "批量发送短信[ <font color=\"red\">" + this.content.Value.Trim() + "</font> ]" + query.Length + "条");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_MessageNote.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=短信&hreftype=1&href1=Shop_M_IntegralUser.aspx&href2=" + twourl);
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('你的权限不够，请与管理员联系。');history.back();</script>";
        }
    }
}
