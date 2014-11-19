using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;

public partial class user_shoporder2 : System.Web.UI.Page
{
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_Member DALM = new dal_Member();
    dal_PayWay DALPW = new dal_PayWay();
    dal_MessageSetup DALMS = new dal_MessageSetup();

    public int OrderId, OrderMoney = 0;
    public string OrderNo, OrderAddTime, OrderState = "";

    public string MNo, MName = "";

    public string PayWay = "";
    public bool huodaofukuan = false;

    public string TitleOrKeyword = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public void Bind_Page_Title()
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
        TitleOrKeyword = "<title>태환태환정보 확인_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null)
        {
            if (Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
            {
                Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString();
                return;
            }
        }
        Response.Redirect("shoplogin.aspx?pageurl2=" + HttpUtility.UrlEncode(Request.Url.ToString()));
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Member();
        Bind_Page_Title();
        Bind_Page_Info();
    }
    void Bind_Page_Info()
    {
        if (Request.QueryString["oid"] != null && Request.QueryString["oid"].ToString() != "" && Request.QueryString["oid"].ToString() != "0")
        {
            OrderId = int.Parse(Request.QueryString["oid"].ToString());
            vw_IntegralOrder model = DALIO.IntegralOrder_vw_Select_Id(OrderId);
            t_Member Member = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
            MName = Member.nvc_Name;
            MNo = Member.nvc_UserNum;
            if (model != null)
            {
                OrderState = DALIO.Set_IntegralOrderState(model.i_State,"kr");
                OrderNo = model.nvc_OrderNumber;
                OrderMoney = model.i_SumIntegral;
                OrderAddTime = model.dt_AddTime.ToString();

                //给下单人发送短信
                //t_MessageSetup sys = DALMS.MessageSetup_Select();
                //if (sys.i_Order == 1)
                //{
                //    bll_Message BLLMS = new bll_Message();
                //    string smsContent = sys.nvc_Order.Replace("Order", model.nvc_OrderNumber);
                //    bool ff = false;
                //    BLLMS.Message_Add(model.nvc_Address_MobilePhone, smsContent, "会员下单", model.i_MemberId, ref ff);
                //}
            }
        }
        else
        {
            Response.Redirect("jifen.aspx");
        }
    }
}