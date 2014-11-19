using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using tenpay;
using System.Linq;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;

public partial class payReturnUrl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //密钥
        string key = "b29f4fae9517d778cda7dcb310aaf416";


        //创建ResponseHandler实例
        ResponseHandler resHandler = new ResponseHandler(Context);
        resHandler.setKey(key);

        //判断签名
        if (resHandler.isTenpaySign())
        {

            ///通知id
            string notify_id = resHandler.getParameter("notify_id");
            //商户订单号
            string out_trade_no = resHandler.getParameter("out_trade_no");
            //财付通订单号
            string transaction_id = resHandler.getParameter("transaction_id");
            //金额,以分为单位
            string total_fee = resHandler.getParameter("total_fee");
            //如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
            string discount = resHandler.getParameter("discount");
            //支付结果
            string trade_state = resHandler.getParameter("trade_state");
			
			string trade_mode = resHandler.getParameter("trade_mode");

            if ("0".Equals(trade_state) && "1".Equals(trade_mode))
            {
                //------------------------------
                //处理业务开始
                //------------------------------

                //注意交易单不要重复处理
                //注意判断返回金额
                string summoney = (decimal.Parse(total_fee) / 100).ToString();
                string StrIndex = out_trade_no.Substring(0, 1);
                if (StrIndex == "Z")
                {
                    #region 专利订单
                    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
                    dal_PatentOrder DALPO = new dal_PatentOrder();
                    t_PatentOrder model = DALPO.PatentOrder_Select_OrderNum(out_trade_no);
                    if (model != null)
                    {
                        if (model.i_Status < 3)
                        {
                            model.i_Status = 7;
                            model.dt_PayMoneyTime = DateTime.Now;
                            DALPO.PatentOrder_Update(model);
                            //if (model.i_RebateIntegral > 0)
                            //{
                            //    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "付款成功", model.i_RebateIntegral, model.i_Id, 0);
                            //}
                            #region 赠送积分

                            dal_IntegralMobile DALIM = new dal_IntegralMobile();
                            bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
                            //dal_SystemSetup DALS = new dal_SystemSetup();
                            //t_SystemSetup setup = DALS.SystemSetup_Select();
                            //注册手机号直接赠送积分  
                            if (model.i_JiFen > 0)
                            {
                                var m = DALIM.IntegralMobile_SelectByMemberId(model.i_UserId);
                                if (m != null)
                                {
                                    //int setIntegral = DALPOI.PatentOrderInfo_Select_Count(model.i_Id) * setup.i_ZlIntergral;
                                    //m.i_Integral += setIntegral;
                                    //DALIM.IntegralMobile_Updata(m);
                                    BLLUIN.UserIntegralNote_Add(model.i_UserId, "专利下单", model.i_JiFen);//+员积分并且生成流水
                                    model.i_JiFen = 0;
                                    DALPO.PatentOrder_Update(model);
                                }
                            }

                            #endregion

                            #region 操作记录
                            UserLog.AddUserLog(model.i_UserId, "专利", "客户在线支付成功");
                            #endregion

                            #region 发短信
                            //dal_SystemKey DALSK = new dal_SystemKey();
                            //t_SystemKey sk = DALSK.SystemKey_Select_Key("i_OrderPay");
                            //if (sk.i_Value == 1)
                            //{
                            //    sk = DALSK.SystemKey_Select_Key("nvc_OrderPay");
                            //    string smsContent = sk.nt_Value.Replace("Order", model.nvc_OrderNumber);
                            //    bool Tref = true;
                            //    bll_Message BLLMS = new bll_Message();
                            //    BLLMS.Message_Add(model.nvc_Address_MobilePhone, smsContent, "会员付款", model.i_MemberId, ref Tref);
                            //}
                            #endregion
                            //结束
                            Response.Redirect("../PaySuccess.aspx?tType=1&oId=" + out_trade_no);
                        }
                        Response.Redirect("../PaySuccess.aspx?tType=1&oId=" + out_trade_no);
                    }

                    #endregion
                }
                else if (StrIndex == "S")
                {
                    #region 商标订单
                    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
                    dal_Trademark DALT = new dal_Trademark();
                    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
                    t_TrademarkOrder model = DALTO.TrademarkOrder_Select_Number(out_trade_no);
                    if (model != null)
                    {
                        if (model.i_Status < 2)
                        {
                            model.i_Status = 2;
                            model.dt_PayTime = DateTime.Now;
                            DALTO.TrademarkOrder_Update(model);
                            //if (model.i_RebateIntegral > 0)
                            //{
                            //    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "付款成功", model.i_RebateIntegral, model.i_Id, 0);
                            //}

                            #region 赠送积分

                            dal_IntegralMobile DALIM = new dal_IntegralMobile();
                            bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
                            //dal_SystemSetup DALS = new dal_SystemSetup();
                            //t_SystemSetup setup = DALS.SystemSetup_Select();

                            //注册手机号直接赠送积分  
                            if (model.i_JiFen > 0)
                            {
                                var m = DALIM.IntegralMobile_SelectByMemberId(model.i_MemberId);
                                if (m != null)
                                {
                                    //int setIntegral = DALTOD.OrderDetails_Select_Count(model.i_Id) * setup.i_SbIntergral;
                                    //m.i_Integral += setIntegral;
                                    //DALIM.IntegralMobile_Updata(m);
                                    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "商标下单", model.i_JiFen);//+员积分并且生成流水 
                                    model.i_JiFen = 0;
                                    DALTO.TrademarkOrder_Update(model);
                                }
                            }

                            #endregion

                            #region 操作记录
                            UserLog.AddUserLog(model.i_MemberId, "商标", "客户在线支付成功");
                            #endregion

                            #region 发短信
                            //dal_SystemKey DALSK = new dal_SystemKey();
                            //t_SystemKey sk = DALSK.SystemKey_Select_Key("i_OrderPay");
                            //if (sk.i_Value == 1)
                            //{
                            //    sk = DALSK.SystemKey_Select_Key("nvc_OrderPay");
                            //    string smsContent = sk.nt_Value.Replace("Order", model.nvc_OrderNumber);
                            //    bool Tref = true;
                            //    bll_Message BLLMS = new bll_Message();
                            //    BLLMS.Message_Add(model.nvc_Address_MobilePhone, smsContent, "会员付款", model.i_MemberId, ref Tref);
                            //}
                            #endregion
                            Response.Redirect("../PaySuccess.aspx?tType=2&oId=" + out_trade_no);
                            //结束
                        }
                        Response.Redirect("../PaySuccess.aspx?tType=2&oId=" + out_trade_no);
                    }
                    #endregion
                }

                //------------------------------
                //处理业务完毕
                //------------------------------	
                //Response.Write("支付成功,out_trade_no=" + out_trade_no);
            }
            else
            {
                //当做不成功处理
                Response.Write("支付失败");
            }

        }
        else
        {
            Response.Write("认证签名失败");

        }

        //获取debug信息,建议把debug信息写入日志，方便定位问题
        //string debuginfo = resHandler.getDebugInfo();
        //Response.Write("<br/>debuginfo:" + debuginfo + "<br/>");

    }
}
