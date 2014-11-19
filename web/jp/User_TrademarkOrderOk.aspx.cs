using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    int uId = 0;
    string href = "";
    public StringBuilder sb_trademrk = new StringBuilder();
    dal_Trademark DALT = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    public string OrderNum = "", UserNum = "", UserName = "", dt_addtime = "", OrderState = "", all_money = "",all_moneymei="", payway = "",sbOrderId="",bizhong="";
    public int guoji=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        href = Request.Url.ToString();
        if (Request.QueryString["order"] != null || Request.QueryString["order"].ToString() != "")
        {
            int orderid = int.Parse(Request.QueryString["order"].ToString());
            sbOrderId = Request.QueryString["order"].ToString();
            if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_Sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_Sb_uid"].ToString() != "")
            {

                uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_Sb_uid"]);
                t_TrademarkOrder order = DALTO.TrademarkOrder_Select_Id(orderid);
                t_Member user = DALM.Member_Select_Id(order.i_MemberId);
                if (order != null)
                {

                    all_money = order.dm_TotalMoney.ToString();
                    payway = order.nvc_PayType;
                    if (payway == "线下汇款")
                    {
                        ImageButton1.Visible = false;
                    }
                    OrderNum = order.nvc_OrderNumber;
                    dt_addtime = order.dt_AddTime.ToString();
                    OrderState = ConvertStatus(order.i_Status,"jp");
                }
                if (user != null)
                {
                    if (user.i_GuoJiId != null)
                    {
                        t_Nationality na = DALN.Nationality_Select_Id(user.i_GuoJiId);
                        if (na != null)
                        {

                            if (na.nvc_Name == "中国")
                            {
                                guoji = 1;
                                bizhong = na.nvc_Currency;
                            }
                            else
                            {
                                t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong); 
                                all_moneymei = order.dm_TotalMoneyGY.ToString();
                                if (nafee != null)
                                {
                                    bizhong = nafee.nvc_Currency;
                                }
                            }
                            UserNum = user.nvc_UserNum;
                            UserName = user.nvc_Name;
                        }
                    }

                    dal_SinglePage DALSP = new dal_SinglePage();
                    t_SinglePage model = DALSP.SinglePage_Select_Key("sbpay", "jp");
                    if (model != null)
                    {
                        Ltl_ZhuYi.Text = model.nt_Value;
                    }
                }
            }
        }
    }
    public string ConvertStatus(object obj,string gj)
    {
        return DALTO.Set_TrademarkOrderState(obj,gj);
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

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (sbOrderId != "0" && uId!=0)
        {
            Response.Redirect("PayGo.aspx?tType=2&oId=" +sbOrderId);
        }
    }
}