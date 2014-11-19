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
    public bool pageview = Manager.GetManagerQX(52, 0);
    public bool pageadd = Manager.GetManagerQX(52, 1);//没有添加权限，默认修改就可以发送
    dal_Member DALM = new dal_Member();
    //dal_StationMessage DALSM = new dal_StationMessage();
    //bll_StationMessage BLLSM = new bll_StationMessage();
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
            Bind_Page_Member();
        }
    }
    public void Bind_Page_Member()
    {
        if (Request.QueryString["type"] == "1")
        {
            string Names = null;
            string Ids = null;
            int count = 0;
            string keyword = Request.QueryString["keyword"];
            string beginTime = Request.QueryString["beginTime"];
            string EndTime = Request.QueryString["EndTime"];
            string grade = "";
            int GId = 0;
            int PId = 0;
            int CId = 0;
            int AId = 0;
            int SType = 0;
            int uType = 0;
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
            IQueryable<vw_Member> query = DALM.Member_SelectPage(1, 10000000, uType, SType, Request.QueryString["Keyword"].ToString(), GId, PId, CId, AId, grade, beginTime, EndTime, 0, ref count);

           
            foreach (var q in query)
            {
                Names += q.nvc_Name + ";";
                Ids += q.i_Id + ";";
                count = count + 1;
            }
            if (!string.IsNullOrEmpty(Names))
            {
                Names = Names.Trim(';');
            }
            if (!string.IsNullOrEmpty(Ids))
            {
                Ids = Ids.Trim(';');
            }
            this.phones.Value = Names;
            this.lbCount.Text = "共有会员" + (count - 1).ToString() + "个";
        }
        else
        {
            this.lbCount.Text = "群发站内消息";
        }
    }
    protected void btnFS_Click(object sender, EventArgs e)// 发送短息
    {
        if (string.IsNullOrEmpty(this.phones.Value.Trim()))
        {
            div_a.InnerHtml = "<script>alert('会员用户名不能为空');</script>";
        }
        else if (string.IsNullOrEmpty(this.content.Value.Trim()))
        {
            div_a.InnerHtml = "<script>alert('内容不能为空');</script>";
        }
        else
        {
        //    string content = this.content.Value;
        //    string[] query = this.phones.Value.Trim().Split(';').Distinct().ToArray();
        //    for (int i = 0; i < query.Length; i++)
        //    {
        //        string UserName = query[i].Trim();
        //        int ManagerId = Convert.ToInt32(Request.Cookies["zscqmanage"]["userid"]);
        //        if (UserName != "")
        //        {
        //            t_Member model = DALM.Member_Select_Name(UserName);
        //            if (model != null)
        //            {
        //                BLLSM.StationMessage_Add("后台群发", model.i_Id, content, ManagerId);
        //            }
        //        }
        //    }
        //    Manager.AddLog(0, "站内消息管理", "批量发送站内消息[ <font color=\"red\">" + content + "</font> ]" + query.Length + "条");
        //    string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_StationMessage.aspx", System.Text.Encoding.GetEncoding("gb2312"));
        //    Response.Redirect("shop_manageok.aspx?hrefname=站内消息&hreftype=1&href1=Shop_Apl_StationMessage.aspx&href2=" + twourl);
            //string content = this.content.Value;
            //string[] query = this.phones.Value.Trim().Split(';').Distinct().ToArray();
            //for (int i = 0; i < query.Length; i++)
            //{
            //    string UserName = query[i].Trim();
            //    int ManagerId = Convert.ToInt32(Request.Cookies["zscqmanage"]["userid"]);
            //    if (UserName != "")
            //    {
            //        t_Member model = DALM.Member_Select_Name(UserName);
            //        if (model != null)
            //        {
            //            BLLSM.StationMessage_Add("后台群发", model.i_Id, content, ManagerId);
            //        }
            //    }
            //}
            //Manager.AddLog(0, "站内消息管理", "批量发送站内消息[ <font color=\"red\">" + content + "</font> ]" + query.Length + "条");
            //string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_StationMessage.aspx", System.Text.Encoding.GetEncoding("gb2312"));
            //Response.Redirect("shop_manageok.aspx?hrefname=站内消息&hreftype=1&href1=Shop_Apl_StationMessage.aspx&href2=" + twourl);
        }
    }
}
