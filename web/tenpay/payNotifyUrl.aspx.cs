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
using zscq.Model;
using zscq.DAL;
using zscq.BLL;
using System.Linq;

public partial class payNotifyUrl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //商户号
        string partner = "1216896301";
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

            //通过通知ID查询，确保通知来至财付通
            //创建查询请求
            RequestHandler queryReq = new RequestHandler(Context);
            queryReq.init();
            queryReq.setKey(key);
            queryReq.setGateUrl("https://gw.tenpay.com/gateway/verifynotifyid.xml");
            queryReq.setParameter("partner", partner);
            queryReq.setParameter("notify_id", notify_id);

            //通信对象
            TenpayHttpClient httpClient = new TenpayHttpClient();
            httpClient.setTimeOut(5);
            //设置请求内容
            httpClient.setReqContent(queryReq.getRequestURL());

            //后台调用
            if (httpClient.call())
            {
                //设置结果参数
                ClientResponseHandler queryRes = new ClientResponseHandler();
                queryRes.setContent(httpClient.getResContent());
                queryRes.setKey(key);

                //判断签名及结果
                //只有签名正确,retcode为0，trade_state为0才是支付成功
                if (queryRes.isTenpaySign() && queryRes.getParameter("retcode") == "0" && queryRes.getParameter("trade_state") == "0" && queryRes.getParameter("trade_mode") == "1")
                {
                    //取结果参数做业务处理
                    string out_trade_no = queryRes.getParameter("out_trade_no");
                    //业务类别 1专利 2旧商标 3新商标
                    string out_trade_type = resHandler.getParameter("out_trade_type");
                    //财付通订单号
                    string transaction_id = queryRes.getParameter("transaction_id");
                    //金额,以分为单位
                    string total_fee = queryRes.getParameter("total_fee");
                    //如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
                    string discount = queryRes.getParameter("discount");

                    //------------------------------
                    //处理业务开始
                    //------------------------------

                    //处理数据库逻辑
                    //注意交易单不要重复处理
                    //注意判断返回金额
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
                                Response.Redirect("../WebOrderPaySuccess.aspx?oid=" + out_trade_no);
                            }
                        }
                       
                        #endregion
                    }
                    else if (StrIndex == "S")
                    {
                        if (out_trade_type == "2")
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
                                    //Response.Redirect("../WebOrderPaySuccess.aspx?oid=" + out_trade_no); ;
                                    //结束
                                }
                            }
                            #endregion
                        }
                        else if (out_trade_type == "3")
                        {
                            #region 商标订单
                            dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
                            dal_NewTrademark mark = new dal_NewTrademark();
                            dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
                            t_NewTrademarkOrder model = DALTO.NewTrademarkOrder_Select_Number(out_trade_no);
                            if (model != null)
                            {
                                if (model.i_Status == 0)
                                {
                                    model.i_Status = 1;
                                    model.dt_PayTime = DateTime.Now;
                                    DALTO.TrademarkOrder_Update(model);
                                    //if (model.i_RebateIntegral > 0)
                                    //{
                                    //    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "付款成功", model.i_RebateIntegral, model.i_Id, 0);
                                    //}
                                    var result = DALTOD.NewOrderDetails_vw_Select_OrderId(model.i_Id);
                                    foreach (var r in result)
                                    {
                                        var markModel = mark.Trademark_Select_Id(r.i_TrademarkId);
                                        if (markModel.i_Type == 0) //申请案
                                            markModel.Status = 2;//申请中，已汇款
                                        else //续展案
                                            markModel.Status = 11;//已提交订单，续展中
                                    }

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
                                            BLLUIN.UserIntegralNote_Add(model.i_MemberId, model.CaseType == 0 ? "商标申请下单" : "商标续展下单", model.i_JiFen);//+员积分并且生成流水 
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
                                    //Response.Redirect("../WebOrderPaySuccess.aspx?oid=" + out_trade_no); ;
                                    //结束
                                }
                            }
                            #endregion
                        }
                    }
                    //------------------------------
                    //处理业务完毕
                    //------------------------------
                    //通知财付通已经处理成功，无需重新通知
                    //Response.Write("success");

                }
                else
                {
                    //错误时，返回结果可能没有签名，写日志trade_state、retcode、retmsg看失败详情。
                    //通知财付通处理失败，需要重新通知
                    Response.Write("fail");
                }

                //获取查询的debug信息,建议把请求、应答内容、debug信息，通信返回码写入日志，方便定位问题
                /*
                Response.Write("http res:" + httpClient.getResponseCode() + "," + httpClient.getErrInfo() + "<br>");
                Response.Write("query req url:" + queryReq.getRequestURL() + "<br/>");
                Response.Write("query req debug:" + queryReq.getDebugInfo() + "<br/>");
                Response.Write("query res content:" + Server.HtmlEncode(httpClient.getResContent()) + "<br/>");
                Response.Write("query res debug:" + Server.HtmlEncode(queryRes.getDebugInfo()) + "<br/>");
                 */
                


            }
            else
            {
                //通知财付通处理失败，需要重新通知
                Response.Write("fail");
                //写错误日志
                Response.Write("call err:" + httpClient.getErrInfo() + "<br>" + httpClient.getResponseCode() + "<br>");

            }

            //获取debug信息,建议把debug信息写入日志，方便定位问题
            /*
            string debuginfo = resHandler.getDebugInfo();
            Response.Write("<br/>debuginfo:" + debuginfo + "<br/>");
            */
        }
    }
}
