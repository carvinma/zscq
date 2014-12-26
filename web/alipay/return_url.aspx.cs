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
/// 功能：页面跳转同步通知页面
/// 版本：3.2
/// 日期：2011-03-11
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
/// 
/// ///////////////////////页面功能说明///////////////////////
/// 该页面可在本机电脑测试
/// 可放入HTML等美化页面的代码、商户业务逻辑程序代码
/// 该页面可以使用ASP.NET开发工具调试，也可以使用写文本函数LogResult进行调试
/// TRADE_FINISHED(表示交易已经成功结束，为普通即时到帐的交易状态成功标识);
/// TRADE_SUCCESS(表示交易已经成功结束，为高级即时到帐的交易状态成功标识);
/// </summary>
public partial class return_url : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SortedDictionary<string, string> sPara = GetRequestGet();

        if (sPara.Count > 0)//判断是否有带返回参数
        {
            Notify aliNotify = new Notify();
            bool verifyResult = aliNotify.Verify(sPara, Request.QueryString["notify_id"], Request.QueryString["sign"]);

            if (verifyResult)//验证成功
            {
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码

                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
                string trade_no = Request.QueryString["trade_no"];              //支付宝交易号
                string order_no = Request.QueryString["out_trade_no"];	        //获取订单号
                string total_fee = Request.QueryString["total_fee"];            //获取总金额
                string subject = Request.QueryString["subject"];                //商品名称、订单名称
                string body = Request.QueryString["body"];                      //商品描述、订单备注、描述
                string buyer_email = Request.QueryString["buyer_email"];        //买家支付宝账号
                string trade_status = Request.QueryString["trade_status"];      //交易状态

                if (Request.QueryString["trade_status"] == "TRADE_FINISHED" || Request.QueryString["trade_status"] == "TRADE_SUCCESS")
                {
                    //判断该笔订单是否在商户网站中已经做过处理（可参考“集成教程”中“3.4返回数据处理”）
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

                                Response.Redirect("../PaySuccess.aspx?tType=1&oId=" + order_no);
                                //结束
                            }
                            Response.Redirect("../PaySuccess.aspx?tType=1&oId=" + order_no);
                        }
                        #endregion
                    }
                    else if (StrIndex == "S")
                    {
                        #region 商标订单
                        dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
                        dal_NewTrademark mark = new dal_NewTrademark();
                        dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
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
                                    var markModel= mark.Trademark_Select_Id(r.i_TrademarkId);
                                    if (markModel.i_Type == 0) //申请案
                                        markModel.Status = 2;//申请中，已汇款
                                    else //续展案
                                        markModel.Status = 11;//已提交订单，续展中
                                    mark.Trademark_Update(markModel);
                                }
                                //mark.Trademark_Submit();

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

                                Response.Redirect("../PaySuccess.aspx?tType=2&oId=" + order_no);
                                //结束
                            }
                            Response.Redirect("../PaySuccess.aspx?tType=2&oId=" + order_no);
                        }
                        #endregion
                    }
                }
                else
                {
                    Response.Write("trade_status=" + Request.QueryString["trade_status"]);
                }

                //打印页面
                Response.Write("验证成功<br />");
                Response.Write("trade_no=" + trade_no);

                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }
            else//验证失败
            {
                Response.Write("验证失败");
            }
        }
        else
        {
            Response.Write("无返回参数");
        }
    }

    /// <summary>
    /// 获取支付宝GET过来通知消息，并以“参数名=参数值”的形式组成数组
    /// </summary>
    /// <returns>request回来的信息组成的数组</returns>
    public SortedDictionary<string, string> GetRequestGet()
    {
        int i = 0;
        SortedDictionary<string, string> sPara = new SortedDictionary<string, string>();
        NameValueCollection coll;
        //Load Form variables into NameValueCollection variable.
        coll = Request.QueryString;

        // Get names of all forms into a string array.
        String[] requestItem = coll.AllKeys;

        for (i = 0; i < requestItem.Length; i++)
        {
            sPara.Add(requestItem[i], Request.QueryString[requestItem[i]]);
        }

        return sPara;
    }
}
