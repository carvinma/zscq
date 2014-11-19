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
    dal_Bank DALB = new dal_Bank();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_Address DALA = new dal_Address();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Member DALM = new dal_Member();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    public int uId = 0, guoji = 0, zhinajinnum=0,isfapiao=0,isyouhuiquan=0,xianxiafukuan=0;
    public string OrderNum = "", UserNum = "", UserName = "", dt_addtime = "", OrderState = "";
    public string fapiaotaitou = "无", youjitype = "无", youjidizhi = "无", youjidizhia = "无", youjidizhib = "无", payway = "";
    public string youhuiquan = "无", isuseyouhui = "无";
    public string fapiaosui = "0.00", youhuifee = "0.00", youjifee = "0.00", totalmoney = "0.00";
    public string Str_Moneysb = "0", Str_Moneysbdaili = "0", Str_Moneymeisb = "0", Str_Moneymeisbdaili = "0", bizhong = "", guowaiinfo = "";
    public StringBuilder Str_Money = new StringBuilder();
    public StringBuilder Str_AllMoney = new StringBuilder();
    public int dazhe = 0, dazhe1 = 0;
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
            int orderid = int.Parse(Request.QueryString["order"].ToString());
            HF_oId.Value = orderid.ToString();
            var iquery = new dal_TrademarkOrderDetails().OrderDetails_vw_Select_OrderId(orderid);
            rp_trademark.DataSource = iquery;
            rp_trademark.DataBind();
            t_TrademarkOrder order = DALTO.TrademarkOrder_Select_Id(orderid);
            t_Member user = DALM.Member_Select_Id(order.i_MemberId);
            if (order != null)
            {
                //payway = order.nvc_PayType;
                int num = 0;
                if (order.nvc_PayType == "线下汇款")
                {
                    //string str = "";
                    //for (int i = 0; i < order.nvc_BankId.Split(',').Length; i++)
                    //{
                    //    t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(order.nvc_BankId.Split(',')[i]));
                    //    if (tb != null)
                    //    {

                    //        str += "<br/><br/>&nbsp;&nbsp;开户行:" + tb.nvc_BankDetails + "<br/>&nbsp;&nbsp;&nbsp;&nbsp;用户:" + tb.nvc_AccountName + "<br/>&nbsp;&nbsp;&nbsp;&nbsp;卡号:" + tb.nvc_BankNumber;
                    //    }
                    //}
                    StringBuilder yinhang = new StringBuilder();
                    #region 邮件中的银行信息
                    yinhang.Append("<table width='100%' border='0' cellspacing='1' cellpadding='0' style='background-color: #CCC;'>");
                    yinhang.Append("<tr>");
                    yinhang.Append("<td width='38%' height='28' align='center' bgcolor='#FFFFFF'><strong>开户行</strong></td>");
                    yinhang.Append("<td width='30%' height='28' align='center' bgcolor='#FFFFFF'><strong>户名</strong></td>");
                    yinhang.Append("<td width='32%' height='28' align='center' bgcolor='#FFFFFF'><strong>卡号</strong></td>");
                    yinhang.Append("</tr>");
                    for (int i = 0; i < order.nvc_BankId.Split(',').Length; i++)
                    {
                        t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(order.nvc_BankId.Split(',')[i]));
                        if (tb != null)
                        {
                            yinhang.Append("<tr>");
                            yinhang.Append("<td width='25%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankDetails + "</td>");
                            yinhang.Append("<td width='25%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_AccountName + "</td>");
                            yinhang.Append("<td width='25%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankNumber + "</td>");
                            yinhang.Append("</tr>");
                        }
                    }
                    yinhang.Append("</table>");

                    #endregion
                    //payway = order.nvc_PayType + str;          
                    payway = yinhang.ToString();
                }
                if (order.nvc_PayType == "线下汇款" || order.i_Status == 5)
                {
                    ImageButton1.Visible = false;
                }  
                totalmoney = order.dm_TotalMoney.ToString();
                OrderNum = order.nvc_OrderNumber;
                dt_addtime = order.dt_AddTime.ToString();
                OrderState = ConvertStatus(order.i_Status);
                if (order.i_Status == 4)
                {
                    ImageButton1.Enabled = false;
                    ImageButton1.ToolTip = "已付款";
                }
            }
            if (user != null)
            {
                UserNum = user.nvc_UserNum;
                UserName = user.nvc_Name;
            }
            int sbnum = 0, sbdailinum = 0;
            foreach (var item in iquery)
            {
                t_Trademark model = DALT.Trademark_Select_Id(item.i_TrademarkId); ;
                if (model != null)
                {
                    sbnum += 1;
                    if (model.i_JiaoFeiType == 2)
                    {
                        sbdailinum += 1;
                        if (model.i_ShengDays < 0)
                        {
                            zhinajinnum += 1;
                        }
                    }
                }
            }
            t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
            t_Member mm = DALM.Member_Select_Id(uId);

            #region 会员折扣 by chy
            dazhe = mm.i_PowerDaZhe;
            dal_UserGrade DALUG = new dal_UserGrade();
            t_MemberGrade tmg = DALUG.UserGrade_Select_Id(mm.i_Grade);
            if (tmg != null)
            {
                dazhe1 = Convert.ToInt32(tmg.i_Discount);
            }
            #endregion

            #region 会员折扣 by chy
            decimal dalifee = model1.dm_TMDaiLi;
            if (dazhe != 0)
            {
                dalifee = dalifee * dazhe / 100;
            }
            if (dazhe1 != 0)
            {
                dalifee = dalifee * dazhe1 / 100;
            }
            #endregion

            if (mm != null)
            {
                if (mm.i_GuoJiId != null)
                {
                    t_Nationality na = DALN.Nationality_Select_Id(mm.i_GuoJiId);
                    if (na != null)
                    {
                        bizhong = na.nvc_Currency;
                        if (na.nvc_Name == "中国")
                        {
                            guoji = 1;
                            string totalmoney = (Convert.ToDecimal(order.dm_TMDaiLi + order.dm_TMZhiNaJin + order.dm_TrademarkMoney)).ToString("0.00");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">官方商标续展费用：</td><td width=\"110\">" + order.dm_TrademarkMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            if (zhinajinnum != 0)
                            {
                                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\">" + order.dm_TMZhiNaJin + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            }
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费用：</td><td width=\"110\">" + order.dm_TMDaiLi + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">小计：</td><td width=\"30\">CNY</td><td width=\"100\" align=\"left\">" + order.dm_TotalMoney + "</td></tr>");
                            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总计：</td><td width=\"color:red;\" width=\"30\">CNY</td><td style='color:red;' id='allmoney'  align=\"left\" width=\"100\" >" + order.dm_TotalMoney + "</td></tr>");
                        }
                        else
                        {
                           
                            decimal huilv = 1;
                            t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                            if (nafee != null)
                            {
                                bizhong = nafee.nvc_Currency;
                                if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                {
                                    huilv = nafee.dm_Exchange;
                                }
                            }
                            string totalmoney = (Convert.ToDecimal(order.dm_TMDaiLi + order.dm_TMZhiNaJin + order.dm_TrademarkMoney)).ToString("0.00");
                            string totalmoneyGY = ((((dalifee) / huilv) * sbdailinum) + (((model1.dm_TrademarkMoney) / huilv) * sbnum) + (((model1.dm_TMZhiNaJin) / huilv) * zhinajinnum)).ToString("0.00");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">官方商标续展费用：</td><td width=\"110\">" + order.dm_TrademarkMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            if (zhinajinnum != 0)
                            {
                                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\">" + order.dm_TMZhiNaJin + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            }
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费用：</td><td width=\"110\">" + order.dm_TMDaiLi + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">小计：</td><td width=\"30\">CNY</td><td width=\"100\" align=\"left\">" + totalmoney + "</td></tr>");

                            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总计：</td><td style='color:red;' width=\"30\"\">CNY</td><td style='color:red;' width=\"100\" id='allmoney'  align=\"left\">" + order.dm_TotalMoney + "</td></tr>");

                            Str_AllMoney.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\"></td><td style='color:red;' width=\"30\">" + bizhong + "&nbsp;</td><td style='color:red;' width=\"100\" id='allmonymei' >" + order.dm_TotalMoneyGY + "</td></tr>");

                        }
                    }
                }
            }
            if (order.i_IsFaPiao == 1)
            {
                isfapiao = 1;
                t_SystemSetup ss = DALSS.SystemSetup_Select();
               
                fapiaosui = order.dm_FapiaoMoney.ToString();
                fapiaotaitou = order.nvc_FaPiaoTaiTou;

                if (order.i_YouJiType == 1)
                {
                    if (ss.dm_YouJIFee != null)
                    {
                        youjifee = ss.dm_YouJIFee.ToString();
                        youjitype = "国外邮寄";                       
                    }
                }
                if (order.i_YouJiType == 2)
                {

                    youjitype = order.nvc_YouJiWay;
                    youjifee = order.dm_YoujiFee.ToString();
                }
                t_ReceiveAddress ra = DALRA.ReceiveAddress_Select_Id(order.i_AddressId);
                if (ra != null)
                {
                    string tel = "";
                    if (ra.nvc_MobilePhone != null)
                    {
                        tel = ra.nvc_MobilePhone;
                    }
                    else
                    {
                        tel = ra.nvc_TelPhone;
                    }
                    youjidizhi = DALA.Set_AddressName_Gid_PId_CId_AId(order.i_Address_Gid, order.i_Address_PId, order.i_Address_CId, order.i_Address_AId) + order.nvc_Address ;
                    youjidizhia =  ra.nvc_Consignee;
                    youjidizhib = tel ;
                }
            }


            #region 优惠券第三部分

            //DataViewDataContext dvdc = new DataViewDataContext();
            //var iqueryCoupon = from i in dvdc.vw_Coupon where i.i_MemberId == order.i_MemberId && i.i_Where <= order.dm_TotalMoney && i.i_State == 1 && i.dt_AddTime < DateTime.Now && DateTime.Now < i.dt_ExpireTime select i;
            //if (iqueryCoupon.Count() > 0)
            //{

            //    DDL_youhui.Items.Add(new ListItem("您有可以使用的优惠券", "0,0"));

            //    string CouponType = "";//暂存种类
            //    foreach (var q in iqueryCoupon)
            //    {
            //        if ((CouponType + ",").IndexOf("," + q.i_Type + ",") == -1)//如果已经有这个优惠券种类了
            //        {
            //            DDL_youhui.Items.Add(new ListItem(q.nvc_Name.ToString(), q.i_Id.ToString() + "," + q.i_Money.ToString()));
            //            CouponType += "," + q.i_Type;
            //        }
            //    }
            //}

            if (order.i_IsUseYHQ == 1)
            {
                isyouhuiquan = 1;
                youhuifee = "-" + order.dm_YouHuiFee.ToString();
                isuseyouhui = "已使用";
                youhuiquan = order.nvc_YouHUiQuan;
            }
            else
            {
                Table_YouHuiQuan1.Visible = false;
                Table_YouHuiQuan2.Visible = false;
            }
            #endregion
        }
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            int uid = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);
            if (HF_oId.Value != "0" && uid != 0)
            {
                Response.Redirect("PayGo.aspx?tType=2&oId=" + HF_oId.Value);
            }
        }
    }
}