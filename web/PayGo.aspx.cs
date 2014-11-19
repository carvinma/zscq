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
using zscq.Model;
using zscq.BLL;
using zscq.DAL;

public partial class PayGo : System.Web.UI.Page
{
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_Member DALU = new dal_Member();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('支付宝未开通，暂无法支付!');window.location='Index.html';</script>");
        //return;
        string url = "index.aspx";
        if (Request["tType"] != null && Request["tType"].ToString() != "" && Request["oId"] != null && Request["oId"].ToString() != "")
        {
            int oType = Convert.ToInt32(Request["tType"]);
            int oId = Convert.ToInt32(Request["oId"]);
            if (oType == 1)//专利
            {
                t_PatentOrder model = DALPO.PatentOrder_Select_Id(oId);
                if (model != null)
                {
                    if (model.dt_PayMoneyTime == null)
                    {
                        t_Member User = DALU.Member_Select_Id(model.i_UserId);
                        if (User != null)
                        {
                            if (model.nvc_PayType == "支付宝支付" || model.nvc_PayType == "网银支付")
                            {
                                url = "alipay/alipay.aspx?action=submit&tType=1&oId=" + model.i_Id;
                            }
                            else if (model.nvc_PayType == "财付通支付")
                            {
                                Response.Redirect("tenpay/payRequest.aspx?tType=1&oId=" + model.i_Id);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('发生意外!');window.location='" + url + "';</script>");
                            return;
                        }
                    }
                }
            }
            else//商标
            {
                t_TrademarkOrder model = DALTO.TrademarkOrder_Select_Id(oId);
                if (model != null)
                {
                    if (model.dt_PayTime == null)
                    {
                        t_Member User = DALU.Member_Select_Id(model.i_MemberId);
                        if (User != null)
                        {
                            if (model.nvc_PayType == "支付宝支付" || model.nvc_PayType == "网银支付")
                            {
                                url = "alipay/alipay.aspx?action=submit&tType=2&oId=" + model.i_Id;
                            }
                            else if (model.nvc_PayType == "财付通支付")
                            {
                                Response.Redirect("tenpay/payRequest.aspx?tType=2&oId=" + model.i_Id);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('发生意外!');window.location='" + url + "';</script>");
                            return;
                        }
                    }
                }
            }
        }
        Response.Redirect(url);
    }
}
