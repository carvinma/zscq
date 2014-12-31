using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.Text;
using zscq.BLL;
public partial class trademarkrenewalOrder_Info : System.Web.UI.Page
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
    dal_NewTrademark mark = new dal_NewTrademark();
    public int uId = 0, guoji = 0, zhinajinnum = 0, isfapiao = 0, isyouhuiquan = 0;
    public string OrderNum = "", UserNum = "", UserName = "", dt_addtime = "", OrderState = "";
    public string fapiaotaitou = "无", youjitype = "无", youjidizhi = "无", youjidizhia = "无", youjidizhib = "无", payway = "";
    public string youhuiquan = "无", isuseyouhui = "无";
    public string fapiaosui = "0.00", youhuifee = "0.00", totalmoney = "0.00";
    public string Str_Moneysb = "0", Str_Moneysbdaili = "0", Str_Moneymeisb = "0", Str_Moneymeisbdaili = "0", bizhong = "", guowaiinfo = "";
    public StringBuilder Str_Money = new StringBuilder();
    public StringBuilder Str_AllMoney = new StringBuilder();
    public int dazhe = 0, dazhe1 = 0;
    public string Orderid; 
    public string TrademarkIds;
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
        if (!IsPostBack)
        {
              Bind_Order_Info();
        }
    }
    public void Bind_Order_Info()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["order"]) && !string.IsNullOrEmpty(Request.QueryString["tIds"]))
        {
            int orderid = int.Parse(Request.QueryString["order"].ToString());
            HF_oId.Value = orderid.ToString();
            Orderid = orderid.ToString();
           // var iquery = new dal_TrademarkOrderDetails().NewOrderDetails_vw_Select_OrderId(orderid);

            #region 案件
            TrademarkIds = Request.QueryString["tIds"];
            string[] trademarkIds = TrademarkIds.Split(',');
            var trademarkList = mark.Trademark_web_Excel(trademarkIds);

            rp_trademark.DataSource = trademarkList;
            rp_trademark.DataBind();
            #endregion

            t_NewTrademarkOrder order = DALTO.NewTrademarkOrder_Select_Id(orderid);
            t_Member user = DALM.Member_Select_Id(order.i_MemberId);
            if (order != null)
            {
                payway = order.nvc_PayType;
                if (order.nvc_PayType == "线下汇款")
                {
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
                    payway = order.nvc_PayType + "<br/><br/>" + yinhang.ToString();
                }
                if (order.nvc_PayType == "线下汇款" || order.i_Status >= 1)
                {
                    ImageButton1.Visible = false;
                }
                totalmoney = order.dm_TotalMoney.ToString();
                OrderNum = order.nvc_OrderNumber;
                dt_addtime = order.dt_AddTime.ToString();
                OrderState = ConvertStatus(order.i_Status);
            }
            if (user != null)
            {
                UserNum = user.nvc_UserNum;
                UserName = user.nvc_Name;
            }
            //int sbnum = 0, sbdailinum = 0;
            //foreach (var item in iquery)
            //{
            //    t_Trademark model = DALT.Trademark_Select_Id(item.i_TrademarkId); ;
            //    if (model != null)
            //    {
            //        sbnum += 1;
            //        if (model.i_JiaoFeiType == 2)
            //        {
            //            sbdailinum += 1;
            //            if (model.i_ShengDays < 0)
            //            {
            //                zhinajinnum += 1;
            //            }
            //        }
            //    }
            //}
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

            #region 金额相关

            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">商标局规费：</td><td width=\"110\">" + order.dm_TrademarkMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\">" + order.dm_TMZhiNaJin + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费：</td><td width=\"110\">" + order.dm_TMDaiLi + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">增值税：</td><td width=\"110\">" + order.dm_ZengZhiTax + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">手续费：</td><td width=\"110\">" + order.dm_ShouXuFee + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总计：</td><td width=\"color:red;\" width=\"30\">CNY</td><td style='color:red;' id='allmoney'  align=\"left\" width=\"100\" >" + order.dm_TotalMoney + "</td></tr>");
            #endregion

            #region 发票

            if (order.i_IsFaPiao == 1)
            {
                isfapiao = 1;

                fapiaosui = order.dm_FapiaoMoney.ToString();
                fapiaotaitou = order.nvc_FaPiaoTaiTou;

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
                    youjidizhi = DALA.Set_AddressName_Gid_PId_CId_AId(order.i_Address_Gid, order.i_Address_PId, order.i_Address_CId, order.i_Address_AId) + order.nvc_Address;
                    youjidizhia = ra.nvc_Consignee;
                    youjidizhib = tel;
                }
            }
            #endregion

            #region 优惠券第三部分

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
    public string ConvertStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkOrderStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
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