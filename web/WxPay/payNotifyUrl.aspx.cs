﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using wxpayApp;

//'---------------------------------------------------------
//'微信支付接口处理回调示例，商户按照此示例进行开发即可
//'---------------------------------------------------------
//'==================
//'通知验证逻辑
//'==================
                               

public partial class payNotifyUrl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        ResponseHandler resHandler = new ResponseHandler(Context);
        resHandler.init();
        resHandler.setKey(TenpayUtil.key,TenpayUtil.appkey);
       
        //判断签名
        if (resHandler.isTenpaySign())
        {

            if (resHandler.isWXsign())
            {
                //商户在收到后台通知后根据通知ID向财付通发起验证确认，采用后台系统调用交互模式
                string notify_id = resHandler.getParameter("notify_id");
                //取结果参数做业务处理
                string out_trade_no = resHandler.getParameter("out_trade_no");
                //财付通订单号
                string transaction_id = resHandler.getParameter("transaction_id");
                //金额,以分为单位
                string total_fee = resHandler.getParameter("total_fee");
                //如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
                string discount = resHandler.getParameter("discount");
                //支付结果
                string trade_state = resHandler.getParameter("trade_state");

                //即时到账
                if ("0".Equals(trade_state))
                {
                    //------------------------------
                    //处理业务开始
                    //------------------------------

                    //处理数据库逻辑
                    //注意交易单不要重复处理
                    //注意判断返回金额

                    //------------------------------
                    //处理业务完毕
                    //------------------------------

                    //给财付通系统发送成功信息，财付通系统收到此结果后不再进行后续通知
                    Response.Write("success 后台通知成功");
                }
                else
                {
                    Response.Write("支付失败");
                }
                //回复服务器处理成功
                Response.Write("success");
            }

            else
            {//SHA1签名失败
                Response.Write("fail -SHA1 failed");
                Response.Write(resHandler.getDebugInfo());
            }
        }
        
        else
        {//md5签名失败
            Response.Write("fail -md5 failed");
            Response.Write(resHandler.getDebugInfo());
        }
        
    }
}