using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Data;
using System.Data.SqlClient;
public partial class Shop_Manage_Shop_A_GroupBuy : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(77, 0);
    public bool pageadd = Manager.GetManagerQX(77, 1);
    public bool pageupdate = Manager.GetManagerQX(77, 2);
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataMemberDataContext dmdc = new DataMemberDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
    public string spicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Product\\";
    public string smallpicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Small\\";
    public string content = "";
    public string returnurl = "";
    public int usercount = 0;
    public int dengjicount = 0;
    public int zhuanliType = 0;
    public int okcount = 0;
    public int nocount = 0;
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
            Response.Write("无权限访问");
            Response.End();
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        div_a.InnerHtml = "";
        if (txtStartDate.Value != "" && txtEndDate.Value != "")
        {
            GetPatentOrderCountBySatatus(Convert.ToDateTime(txtStartDate.Value), Convert.ToDateTime(txtEndDate.Value));
        }
        else
        {
            GetPatentOrderCountBySatatus();
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }

    private void Bind_Page_Info()// 绑定商品详细数据
    {
        //var iquery = DALP.Patent_Select_User();
        //if (iquery.Count() > 0)
        //{
        //    usercount = iquery.Count();
        //}
        var iquery = from i in dmdc.t_Member where i.i_MemberType == 1 select i;
        usercount = iquery.Count();

        var iquery1 = DALP.Patent_SelectAll();
        if (iquery1.Count() > 0)
        {
            dengjicount = iquery1.Count();
        }

        var iquery3 = from i in DALP.Patent_SelectAll() where i.i_AnnualFeeStatus == 4 select i;
        if (iquery3.Count() > 0)
        {
            okcount = iquery3.Count();//完成交费
        }

        var iquery4 = from i in DALP.Patent_SelectAll() where i.i_AnnualFeeStatus == 5 select i;
        if (iquery4.Count() > 0)
        {
            nocount = iquery4.Count();//取消交费
        }
        rp_huiyuanfenbu.DataSource = DALN.Nationality_SelectAll();
        rp_huiyuanfenbu.DataBind();

        rp_dengjifenbu.DataSource = DALP.Patent_Select_dengjiGuo();
        rp_dengjifenbu.DataBind();

        rp_Typefenbu.DataSource = DALP.Patent_Select_TypeFenbu();
        rp_Typefenbu.DataBind();

    }
    public int GetCountNum(string nid)
    {
        return DALP.Patent_Select_ByCidUser(int.Parse(nid));
    }

    //获得专利类型
    public string GetCountzhuanliType(string Tid)
    {
        string typename = "";
        t_PatentType type = DALPT.PatentType_Select_Id(int.Parse(Tid));
        if (type != null)
        {
            typename = type.nvc_Name;
        }
        return typename;
    }
    //获得专利类型总数
    public int GetCountzhuanliTypeCount(string tpname)
    {

        int count = 0;
        var iquery = from i in dvdc.vw_Patent where i.nvc_PatentTypeName.Trim() == tpname.Trim() select i;
        if (iquery.Count() > 0)
        {
            count = iquery.Count();
        }
        return count;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtStartDate.Value != "" && txtEndDate.Value != "")
        {
            GetPatentOrderCountBySatatus(Convert.ToDateTime(txtStartDate.Value), Convert.ToDateTime(txtEndDate.Value).AddDays(1));
        }
        else
        {
            GetPatentOrderCountBySatatus();
        }
    }
    private void GetPatentOrderCountBySatatus()
    {
        var PatentOrder = from o in dvdc.vw_PatentOrder select o.i_Id;
        Ltl_PatentOrderCount_1.Text = PatentOrder.Count().ToString();

        var PatentOrder1 = from o in dvdc.vw_PatentOrder where o.i_Status == 1 select o.i_Id;
        Ltl_PatentOrderCount_2.Text = PatentOrder1.Count().ToString();

        var PatentOrder2 = from o in dvdc.vw_PatentOrder where o.i_Status == 2 select o.i_Id;
        Ltl_PatentOrderCount_3.Text = PatentOrder2.Count().ToString();

        var PatentOrder3 = from o in dvdc.vw_PatentOrder where o.i_Status == 3 select o.i_Id;
        Ltl_PatentOrderCount_4.Text = PatentOrder3.Count().ToString();

        var PatentOrder4 = from o in dvdc.vw_PatentOrder where o.i_Status == 4 select o.i_Id;
        Ltl_PatentOrderCount_5.Text = PatentOrder4.Count().ToString();

        var PatentOrder5 = from o in dvdc.vw_PatentOrder where o.i_Status == 5 select o.i_Id;
        Ltl_PatentOrderCount_6.Text = PatentOrder5.Count().ToString();

        var PatentOrder6 = from o in dvdc.vw_PatentOrder where o.i_Status == 6 select o.i_Id;
        Ltl_PatentOrderCount_7.Text = PatentOrder6.Count().ToString();

        var PatentOrder7 = from o in dvdc.vw_PatentOrder where o.i_Status == 7 select o.i_Id;
        Ltl_PatentOrderCount_8.Text = PatentOrder7.Count().ToString();

        var PatentOrder8 = from o in dvdc.vw_PatentOrder where o.i_Status == 8 select o.i_Id;
        Ltl_PatentOrderCount_9.Text = PatentOrder8.Count().ToString();

        var PatentOrder9 = from o in dvdc.vw_PatentOrder where o.i_Status == 9 select o.i_Id;
        Ltl_PatentOrderCount_10.Text = PatentOrder9.Count().ToString();

    }
    private void GetPatentOrderCountBySatatus(DateTime stime, DateTime etime)
    {
        var PatentOrder = from o in dvdc.vw_PatentOrder where o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_1.Text = PatentOrder.Count().ToString();

        var PatentOrder1 = from o in dvdc.vw_PatentOrder where o.i_Status == 1 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_2.Text = PatentOrder1.Count().ToString();

        var PatentOrder2 = from o in dvdc.vw_PatentOrder where o.i_Status == 2 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_3.Text = PatentOrder2.Count().ToString();

        var PatentOrder3 = from o in dvdc.vw_PatentOrder where o.i_Status == 3 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_4.Text = PatentOrder3.Count().ToString();

        var PatentOrder4 = from o in dvdc.vw_PatentOrder where o.i_Status == 4 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_5.Text = PatentOrder4.Count().ToString();

        var PatentOrder5 = from o in dvdc.vw_PatentOrder where o.i_Status == 5 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_6.Text = PatentOrder5.Count().ToString();

        var PatentOrder6 = from o in dvdc.vw_PatentOrder where o.i_Status == 6 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_7.Text = PatentOrder6.Count().ToString();

        var PatentOrder7 = from o in dvdc.vw_PatentOrder where o.i_Status == 7 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_8.Text = PatentOrder7.Count().ToString();

        var PatentOrder8 = from o in dvdc.vw_PatentOrder where o.i_Status == 8 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_9.Text = PatentOrder8.Count().ToString();

        var PatentOrder9 = from o in dvdc.vw_PatentOrder where o.i_Status == 9 && o.dt_AddTime >= stime && o.dt_AddTime <= etime select o.i_Id;
        Ltl_PatentOrderCount_10.Text = PatentOrder9.Count().ToString();

    }
}
