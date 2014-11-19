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
using System.IO;

public partial class Shop_Manage_Shop_M_IntegralUser : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    public bool pageview = Manager.GetManagerQX(33, 0);
    public bool pageupdate = Manager.GetManagerQX(33, 2);
    public bool pagedel = Manager.GetManagerQX(33, 3);
    public bool pagechu = Manager.GetManagerQX(33, 4);
    public int ye = 1;
    public string Keyword = "";
    public int TypeUser = 0;
    public string statiem = "";
    public string endtime = "";

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
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Page_value();
            Bind_Rpt_List(ye);
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["Keyword"] != null)
        {
            this.user_namee.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["starttime"] != null && Request.QueryString["starttime"] != "")
        {
            hot_start_date.Value = Request.QueryString["starttime"].ToString();
        }
        if (Request.QueryString["endtime"] != null && Request.QueryString["endtime"] != "")
        {
            hot_end_date.Value = Request.QueryString["endtime"].ToString();
        }

    }
    public void Bind_Rpt_List(int pageIndex)//绑定
    {
        int pageSize = 20;
        int count = 0;
        Keyword = user_namee.Value.Trim();
        statiem = hot_start_date.Value;
        endtime = hot_end_date.Value;
        IQueryable<t_IntegralMobile> query2 = DALIM.IntegralMobile_SelectByPage(pageIndex, pageSize, Keyword, statiem, endtime, ref count);
        this.rept_list.DataSource = query2;
        this.rept_list.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pageSize;
        aspPage.CurrentPageIndex = pageIndex;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//分页
    {
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        ye = aspPage.CurrentPageIndex;
    }
    protected void btnDel_Click(object sender, EventArgs e)//删除会员
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                var user = DALIM.IntegralMobile_SelectById(int.Parse(IDList[i]));
                Manager.AddLog(0, "积分手机号管理", "删除手机号：" + user.nvc_Mobile);
                DALIM.IntegralMobile_Del(user);
            }
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btSelect_Click(object sender, EventArgs e)//搜索
    {
        Bind_Rpt_List(1);
    }
    protected string GetUserOrderCount(object usernum)
    {
        return DALIO.IntegralOrder_CountByMobileId(Convert.ToInt32(usernum)).ToString();
    }
    public int getUserIntegral(object oid)
    {
        var model = DALIM.IntegralMobile_SelectByMemberId(Convert.ToInt32(oid));
        if (model != null)
        {
            return model.i_Integral;
        }
        else
        {
            return 0;
        }
    }
    protected void Bt_Phone_Click(object sender, EventArgs e)//提取用户手机号码
    {
        Response.Redirect("Shop_Apl_ItregralMobile.aspx?PageType=Phone&keyword=" + user_namee.Value.Trim() + "&BeginTime=" + hot_start_date.Value + "&EndTime=" + hot_end_date.Value);
    }
}