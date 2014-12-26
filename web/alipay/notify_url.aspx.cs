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
using System.Collections.Specialized;
using System.Collections.Generic;
using Com.Alipay;
using System.Linq;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;

/// <summary>
/// 功能：服务器异步通知页面
/// 版本：3.2
/// 日期：2011-03-11
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
/// 
/// ///////////////////页面功能说明///////////////////
/// 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
/// 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
/// 该页面调试工具请使用写文本函数logResult。
/// 如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
/// TRADE_FINISHED(表示交易已经成功结束，通用即时到帐反馈的交易状态成功标志);
/// TRADE_SUCCESS(表示交易已经成功结束，高级即时到帐反馈的交易状态成功标志);
/// </summary>
public partial class notify_url : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SortedDictionary<string, string> sPara = GetRequestPost();

        if (sPara.Count > 0)//判断是否有带返回参数
        {
            Notify aliNotify = new Notify();
            bool verifyResult = aliNotify.Verify(sPara, Request.Form["notify_id"], Request.Form["sign"]);

            if (verifyResult)//验证成功
            {
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码

                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                //获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表
                string trade_no = Request.Form["trade_no"];         //支付宝交易号
                string order_no = Request.Form["out_trade_no"];     //获取订单号
                string total_fee = Request.Form["total_fee"];       //获取总金额
                string subject = Request.Form["subject"];           //商品名称、订单名称
                string body = Request.Form["body"];                 //商品描述、订单备注、描述
                string buyer_email = Request.Form["buyer_email"];   //买家支付宝账号
                string trade_status = Request.Form["trade_status"]; //交易状态

                if (Request.Form["trade_status"] == "TRADE_FINISHED" || Request.Form["trade_status"] == "TRADE_SUCCESS")
                {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序
                    string StrIndex = order_no.Substring(0, 1);
                    if (StrIndex == "Z")
                    {
                        #region 专利订单
                        dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
                        dal_PatentOrder DALPO = new dal_PatentOrder();
                        t_PatentOrder model = DALPO.PatentOrder_Select_OrderNum(order_no);
                        if (model != null)
                        {
                            if (model.i_Status < 3)
                            {
                                model.i_Status = 4;
                                model.dm_CouponMoney = model.dm_TotalMoney;
                                model.dt_PayMoneyTime = DateTime.Now;
                                //DALPO.PatentOrder_Update(model);
                                //if (model.i_RebateIntegral > 0)
                                //{
                                //    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "付款成功", model.i_RebateIntegral, model.i_Id, 0);
                                //} 

                                #region 赠送积分
                                //注册手机号直接赠送积分  
                                if (model.i_JiFen > 0)
                                {
                                    dal_IntegralMobile DALIM = new dal_IntegralMobile();
                                    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
                                    //dal_SystemSetup DALS = new dal_SystemSetup();
                                    //t_SystemSetup setup = DALS.SystemSetup_Select();
                                    var m = DALIM.IntegralMobile_SelectByMemberId(model.i_UserId);
                                    if (m != null)
                                    {
                                        //int setIntegral = DALPOI.PatentOrderInfo_Select_Count(model.i_Id) * setup.i_ZlIntergral;
                                        //m.i_Integral += setIntegral;
                                        //DALIM.IntegralMobile_Updata(m);
                                        BLLUIN.UserIntegralNote_Add(model.i_UserId, "专利下单", model.i_JiFen);//+员积分并且生成流水
                                        model.i_JiFen = 0;
                                    }
                                }
                                #endregion

                                DALPO.PatentOrder_Update(model);

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
                                //Response.Redirect("../PaySuccess.aspx?oid=" + order_no);
                            }
                        }
                        #endregion
                    }
                    else if (StrIndex == "S")
                    {
                        #region 商标订单
                        dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
                        //dal_Trademark DALT = new dal_Trademark();
                        dal_NewTrademark mark = new dal_NewTrademark();
                        dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
                        t_TrademarkOrder model = DALTO.TrademarkOrder_Select_Number(order_no);
                        if (model != null)
                        {
                            if (model.i_Status == 0)//未支付
                            {
                                model.i_Status = 1;//已支付
                                model.dt_PayTime = DateTime.Now;
                                //DALTO.TrademarkOrder_Update(model);
                                //if (model.i_RebateIntegral > 0)
                                //{
                                //    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "付款成功", model.i_RebateIntegral, model.i_Id, 0);
                                //}

                                var result = DALTOD.OrderDetails_vw_Select_OrderId(model.i_Id);
                                foreach (var r in result)
                                {
                                    //t_Trademark sb_model = DALT.Trademark_Select_Id(r.i_TrademarkId);
                                    //sb_model.i_IsPayState = 2;
                                    //DALT.Trademark_Update(sb_model);

                                    var markModel = mark.Trademark_Select_Id(r.i_TrademarkId);
                                    markModel.Status = 2;//申请中，已汇款
                                    mark.Trademark_Update(markModel);
                                }

                                #region 赠送积分
                                if (model.i_JiFen > 0)
                                {
                                    dal_IntegralMobile DALIM = new dal_IntegralMobile();
                                    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
                                    //dal_SystemSetup DALS = new dal_SystemSetup();
                                    //t_SystemSetup setup = DALS.SystemSetup_Select();

                                    //注册手机号直接赠送积分  
                                    var m = DALIM.IntegralMobile_SelectByMemberId(model.i_MemberId);
                                    if (m != null)
                                    {
                                        //int setIntegral = DALTOD.OrderDetails_Select_Count(model.i_Id) * setup.i_SbIntergral;
                                        //m.i_Integral += setIntegral;
                                        //DALIM.IntegralMobile_Updata(m);
                                        BLLUIN.UserIntegralNote_Add(model.i_MemberId, "商标下单", model.i_JiFen);//+员积分并且生成流水 
                                        model.i_JiFen = 0;
                                    }
                                }
                                #endregion

                                DALTO.TrademarkOrder_Update(model);

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
                                //Response.Redirect("../PaySuccess.aspx?oid=" + order_no); ;
                            }
                        }
                        #endregion
                    }
                    Response.Write("success");  //请不要修改或删除
                    //结束
                }
                else
                {
                    Response.Write("success");  //其他状态判断。普通即时到帐中，其他状态不用判断，直接打印success。
                }

                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }
            else//验证失败
            {
                Response.Write("fail");
            }
        }
        else
        {
            Response.Write("无通知参数");
        }
    }

    /// <summary>
    /// 获取支付宝POST过来通知消息，并以“参数名=参数值”的形式组成数组
    /// </summary>
    /// <returns>request回来的信息组成的数组</returns>
    public SortedDictionary<string, string> GetRequestPost()
    {
        int i = 0;
        SortedDictionary<string, string> sPara = new SortedDictionary<string, string>();
        NameValueCollection coll;
        //Load Form variables into NameValueCollection variable.
        coll = Request.Form;

        // Get names of all forms into a string array.
        String[] requestItem = coll.AllKeys;

        for (i = 0; i < requestItem.Length; i++)
        {
            sPara.Add(requestItem[i], Request.Form[requestItem[i]]);
        }

        return sPara;
    }
}
