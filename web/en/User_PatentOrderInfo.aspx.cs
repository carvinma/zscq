using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class User_PatentCount : System.Web.UI.Page
{
    public dal_Nationality DALN = new dal_Nationality();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_Member DALM = new dal_Member();
    dal_Bank DALB = new dal_Bank();
    int uId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            //t_Member model = DALM.Member_Select_Id(uId);
            //if(model!=null)
            //{
                
            //}
            Bind_Page_OrderInfo();
        }
    }
    protected void ImgBtn_Pay_Click(object sender, ImageClickEventArgs e)
    {
        if(HF_oId.Value!="0" && uId!=0)
        {
            Response.Redirect("PayGo.aspx?tType=1&oId=" + HF_oId.Value);
        }
    }
    void Bind_Page_OrderInfo()
    {
        try
        {
            if (Request["oId"] != null && Request["oId"].ToString() != "")
            {
                //int oId = Convert.ToInt32(Request["oId"]);
                HF_oId.Value = Request["oId"].ToString();
                t_PatentOrder model = DALPO.PatentOrder_Select_Id(Convert.ToInt32(HF_oId.Value));
                if (model != null)
                {
                    if(model.i_Status==8 || model.i_Status==9)
                    {
                        ImgBtn_Pay.Visible = false;
                    }
                    Ltl_OrderNum.Text = model.nvc_OrderNumber;
                    t_Member tm = DALM.Member_Select_Id(uId);
                    Ltl_MemberNum.Text = tm.nvc_UserNum;
                    Ltl_MemberName.Text = tm.nvc_Name;
                    Ltl_AddTime.Text = model.dt_AddTime.ToString();
                    Ltl_OrderStatus.Text = DALPO.GetStatus(model.i_Status,"en");
                    #region 绑定专利列表
                    IQueryable<t_PatentOrderInfo> iquery = DALPOI.PatentOrderInfo_Select_OrderId(model.i_Id);
                    Rpt_PatentList.DataSource = iquery;
                    Rpt_PatentList.DataBind();
                    #endregion

                    Ltl_FaPiaoTaiTou.Text = model.nvc_FaPiaoTaiTou;
                    Ltl_YouJiType.Text = model.i_YouJiType==0?"挂号信":"快递";
                    Ltl_YouJiAddress.Text = model.nvc_PostAddress;

                    if (model.nvc_YouHUiQuan == null || model.nvc_YouHUiQuan == "")
                    {
                        Table_YouHuiQuan1.Visible = false;
                        Table_YouHuiQuan2.Visible = false;
                    }
                    else
                    {
                        Ltl_YouHuiQuan.Text = model.nvc_YouHUiQuan;
                    }

                    //Lal_JiFen.Text = model.i_JiFen.ToString();
                    Lal_YouHui.Text = model.dm_YouHui.ToString();
                    //Lal_CouponMoney.Text = model.dm_CouponMoney.ToString();
                    lb_zhinajin.Text = model.dm_ZhiNaJin.ToString();
                    //lb_fapiao.Text = model.dm_InvoiceMoney.ToString();
                    Lal_GuanFei.Text = model.dm_SetMoney.ToString();
                    Lal_DaiLiFei.Text = model.dm_AgentServiceFee.ToString();
                    Lal_ShouXuFei.Text = model.dm_RemittanceFee.ToString();
                    Lal_ChangXiangFei.Text = model.dm_ChaoXiangFee.ToString();
                    //Lal_PeiSongFee.Text = model.dm_PsMoney.ToString();

                    Lal_bizhong1.Text = model.nvc_CurrencyType;
                    decimal subtotal = Convert.ToDecimal(model.dm_SetMoney + model.dm_AgentServiceFee + model.dm_ChaoXiangFee + model.dm_ZhiNaJin);
                    Lal_xiaoji.Text = subtotal.ToString("0.00");

                    Lal_BiZhong.Text = model.nvc_CurrencyType;
                    Lal_TotalMoney.Text = model.dm_TotalMoney.ToString();//Granted CountryCurrency总计

                    //Lal_BiZhong2.Text = hi_paybizhong.Value;
                    //Lal_TotalMoneys.Text = GetPayTotalMoney(model.dm_TotalMoney).ToString();

                    Table_FaPiao1.Visible = model.i_IsFaPiao == 0 ? false : true;
                    Table_FaPiao2.Visible = model.i_IsFaPiao == 0 ? false : true;


                    Ltl_PayType.Text = "Offline remittance";// model.nvc_PayType;
                    if (model.nvc_PayType == "线下汇款")
                    {
                        StringBuilder yinhang = new StringBuilder();
                        #region 邮件中的银行信息
                            yinhang.Append("<table width='100%' border='0' cellspacing='1' cellpadding='0' style='background-color: #CCC;'>");
                            yinhang.Append("<tr>");
                            yinhang.Append("<td width='24%' height='28' align='center' bgcolor='#FFFFFF'><strong>Bank Details</strong></td>");
                            yinhang.Append("<td width='20%' height='28' align='center' bgcolor='#FFFFFF'><strong>SWIFT CODE</strong></td>");
                            yinhang.Append("<td width='28%' height='28' align='center' bgcolor='#FFFFFF'><strong>Account Name</strong></td>");
                            yinhang.Append("<td width='28%' height='28' align='center' bgcolor='#FFFFFF'><strong>Account Number</strong></td>");
                            yinhang.Append("</tr>");
                            for (int i = 0; i < model.nvc_BankId.Split(',').Length; i++)
                            {
                                t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(model.nvc_BankId.Split(',')[i]));
                                if (tb != null)
                                {
                                    yinhang.Append("<tr>");

                                    yinhang.Append("<td width='24%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankDetails + "</td>");
                                    yinhang.Append("<td width='20%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_SwiftCode + "</td>");
                                    yinhang.Append("<td width='28%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_AccountName + "</td>");
                                    yinhang.Append("<td width='28%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankNumber + "</td>");
                                    yinhang.Append("</tr>");
                                }
                            }
                            yinhang.Append("</table>");
                        
                        #endregion
                            Ltl_PayType.Text = "Offline remittance" + "<br/><br/>" + yinhang.ToString();
                        ImgBtn_Pay.Visible=false;
                    }

                    if (model.dt_PayMoneyTime != null || model.dt_PayMoneyTime.ToString()!="")
                    {
                        ImgBtn_Pay.Visible=false;
                    }
                }
            }
        }
        catch { }
    }
    
}