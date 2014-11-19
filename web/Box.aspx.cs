using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class Box : System.Web.UI.Page
{
    dal_Patent DALP = new dal_Patent();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_FeeInfo();
        }
    }
    protected string Bind_FeeInfo()
    {
        StringBuilder sb = new StringBuilder();
        if (Request["pId"] != null && Request["pId"].ToString() != "")
        {
            int id = Convert.ToInt32(Request["pId"]);
            sb.Append("<table width='600' border='0' cellspacing='1' cellpadding='0' style='background-color: #CCC;'>");
            sb.Append("<tr>");
            sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'><strong>官费</strong></td>");
            sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'><strong>滞纳金</strong></td>");
            sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'><strong>超项费</strong></td>");
            sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'><strong>汇款手续费</strong></td>");
            sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'><strong>代理服务费</strong></td>");
            sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'><strong>总计</strong></td>");
            sb.Append("<td width='10%' height='28' align='center' bgcolor='#FFFFFF'><strong>币种</strong></td>");
            sb.Append("</tr>");

            if (Request["bizhong"] != null && Request["bizhong"].ToString() != "")
            {
                string paybizhong = Request["bizhong"].ToString();
                t_Patent model = DALP.Patent_Select_Id(id);
                if (model != null)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_AnnualFeeNextPaymentMoney + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.nvc_ZhiNaJin + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ChaoXiangFee + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_RemittanceFee + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_AgentServiceFee + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_FeeSubtotal + "</td>");
                    sb.Append("<td width='10%' height='28' align='center' bgcolor='#FFFFFF'>" + model.nvc_CurrencyType + "</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr>");

                    decimal dm_AnnualFeeNextPaymentMoney = DALPO.GetPayMoneyByHuiLv(model.dm_AnnualFeeNextPaymentMoney, model.nvc_CurrencyType, paybizhong);
                    decimal dm_ZhiNaJin = DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(model.nvc_ZhiNaJin), model.nvc_CurrencyType, paybizhong);
                    decimal dm_ChaoXiangFee = DALPO.GetPayMoneyByHuiLv(model.dm_ChaoXiangFee, model.nvc_CurrencyType, paybizhong);
                    decimal dm_RemittanceFee = DALPO.GetPayMoneyByHuiLv(model.dm_RemittanceFee, model.nvc_CurrencyType, paybizhong);
                    decimal dm_AgentServiceFee = DALPO.GetPayMoneyByHuiLv(model.dm_AgentServiceFee, model.nvc_CurrencyType, paybizhong);

                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + dm_AnnualFeeNextPaymentMoney + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + dm_ZhiNaJin + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + dm_ChaoXiangFee + "</td>");
                    if (Request["IsHave"] != null)
                    {
                        sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>0.00</td>");
                    }
                    else
                    {
                        sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + dm_RemittanceFee + "</td>");
                    }
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + dm_AgentServiceFee + "</td>");
                    if (Request["IsHave"] != null)
                    {
                        decimal subtotal = dm_AnnualFeeNextPaymentMoney + dm_ZhiNaJin + dm_ChaoXiangFee + dm_AgentServiceFee;
                        sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + subtotal + "</td>");
                    }
                    else
                    {
                        decimal subtotal = dm_AnnualFeeNextPaymentMoney + dm_ZhiNaJin + dm_ChaoXiangFee + dm_AgentServiceFee + +dm_RemittanceFee;
                        sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + subtotal + "</td>");
                    }

                    sb.Append("<td width='10%' height='28' align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                    sb.Append("</tr>");
                }
            }
            else
            {
                t_PatentOrderInfo model = DALPOI.PatentOrderInfo_Select_Id(id);
                if (model != null)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ZhengFuGuiDingFei + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ZhiNaJin + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ChaoXiangFei + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_HuiKuanShouXuFei + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_DaiLiFuWuFei + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_TotalMoney + "</td>");
                    sb.Append("<td width='10%' height='28' align='center' bgcolor='#FFFFFF'>" + model.nvc_BiZhong + "</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ZhengFuGuiDingFei1 + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ZhiNaJin1 + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_ChaoXiangFei1 + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_HuiKuanShouXuFei1 + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_DaiLiFuWuFei1 + "</td>");
                    sb.Append("<td width='15%' height='28' align='center' bgcolor='#FFFFFF'>" + model.dm_TotalMoney1 + "</td>");
                    sb.Append("<td width='10%' height='28' align='center' bgcolor='#FFFFFF'>" + model.nvc_BiZhong1 + "</td>");
                    sb.Append("</tr>");

                }
            }
            sb.Append("</table>");

        }
        return sb.ToString();
    }
}