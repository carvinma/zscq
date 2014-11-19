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
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public partial class Shop_Manage_Shop_A_GroupBuy : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(76, 0);
    public bool pageadd = Manager.GetManagerQX(76, 1);
    public bool pageupdate = Manager.GetManagerQX(76, 2);
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Trademark DALT = new dal_Trademark();
    public string spicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Product\\";
    public string smallpicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Small\\";
    public string content = "";
    public string returnurl = "";
    public int usercount = 0;
    public int dengjicount = 0;
    public int weituocount = 0;
    public int okcount = 0;
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
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }

    private void Bind_Page_Info()// 绑定商品详细数据
    {
        var iquery = DALT.Trademark_Select_User();
        if (iquery.Count() > 0)
        {
            usercount = iquery.Count();        
        }
        var iquery1 = DALT.Trademark_SelectAll();
        if (iquery1.Count() > 0)
        {
            dengjicount = iquery1.Count();
        }
        var iquery2 = from i in DALT.Trademark_SelectAll() where i.i_JiaoFeiType==2 select i;
        if (iquery2.Count() > 0)
        {
            weituocount = iquery2.Count();
        }
        var iquery3= from i in DALT.Trademark_SelectAll() where i.i_IsPayState== 1 select i;
        if (iquery3.Count() > 0)
        {
            okcount = iquery3.Count();//完成交费
        }



        rp_huiyuanfenbu.DataSource=DALN.Nationality_SelectAll();
        rp_huiyuanfenbu.DataBind();

        rp_dengjifenbu.DataSource = DALT.Trademark_SelectAllFenBu() ;
        rp_dengjifenbu.DataBind();
        rp_weituofenbu.DataSource = DALT.Trademark_SelectAllFenBu();
        rp_weituofenbu.DataBind();
           
        }
    public int GetCountNum(string nid)
    {
        int count = 0;
        var iquery = DALT.Patent_Select_ByCidUser(int.Parse(nid));
        if (iquery.Count() > 0)
        {
            count = iquery.Count();
        }
        return count;
    }
    public string GetCountryName(string cid)//根据国家id查询名字
    {
        string cname= "";
        var iquery = DALN.Nationality_Select_Id(int.Parse(cid));
        if (iquery != null)
        {
            cname = iquery.nvc_Name;
        }
        return cname;
    }
    public int GetCountShangbiaoNum(string cid,int typeid)//typeid=1 是自行缴费  =2是代理委托缴费
    {
        int count = 0;
        var iquery = DALT.Trademark_vw_Select_ByCid(int.Parse(cid),typeid);
        if (iquery.Count() > 0)
        {
            count = iquery.Count();
        }
        return count;
    }
  
}
