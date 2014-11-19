using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.Text;
public partial class user_sbddck : System.Web.UI.Page
{
    dal_Trademark DALT = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_Address DALA = new dal_Address();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Member DALM = new dal_Member();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    public int uId = 0, guoji = 0, zhinajinnum=0,isfapiao=0,isyouhuiquan=0,xianxiafukuan=0;
  
    public string fapiaosui = "0.00", youhuifee = "0.00", youjifee = "0.00", totalmoney = "0.00";
    public string Str_Moneysb = "0", Str_Moneysbdaili = "0", Str_Moneymeisb = "0", Str_Moneymeisbdaili = "0", bizhong = "", guowaiinfo = "";
    public StringBuilder Str_Money = new StringBuilder();
    public StringBuilder Str_AllMoney = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        Bind_Order_Info();
    }
    public void Bind_Order_Info()
    {
        if (Request.QueryString["order"] != null || Request.QueryString["order"].ToString() != "")
        {
            //int count = 0;
            //int pagesize = AspNetPager1.PageSize;
            int pageindex = AspNetPager1.CurrentPageIndex;
            int orderid = int.Parse(Request.QueryString["order"].ToString());          
            var iquery = new dal_TrademarkOrderDetails().OrderDetails_vw_Select_OrderId(orderid);
            rp_trademark.DataSource = iquery;
            rp_trademark.DataBind();

            //iquery = from i in iquery  orderby i.i_Id descending select i;

            //count = iquery.Count();
            //iquery = iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
            AspNetPager1.RecordCount = iquery.Count();
            
        }
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        Bind_Order_Info();
    }

    public string ConvertStatus(object obj)
    {
        return DALTO.Set_TrademarkOrderState(obj);
    }
    public string GetGuojiName(int id)// 获得国籍
    {
        string guojiname = "";
        t_Nationality nn = DALN.Nationality_Select_Id(id);
        if (nn != null)
        {
            guojiname = nn.nvc_Name;
        }
        return guojiname;
    }
    public string GetGuojiName(object id)// 获得国籍
    {
        string guojiname = "";
        t_Nationality nn = DALN.Nationality_Select_Id(id.ToString().GetInt());
        if (nn != null)
        {
            guojiname = nn.nvc_Name;
        }
        return guojiname;
    }
}