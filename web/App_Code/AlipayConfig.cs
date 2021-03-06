﻿using System.Web;
using System.Text;
using System.IO;
using System.Net;
using System;
using System.Collections.Generic;
using System.Linq;
using zscq.DAL;
using zscq.Model;

namespace Com.Alipay
{
    /// <summary>
    /// 类名：Config
    /// 功能：基础配置类
    /// 详细：设置帐户有关信息及返回路径
    /// 版本：3.2
    /// 日期：2011-03-17
    /// 说明：
    /// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
    /// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
    /// 
    /// 如何获取安全校验码和合作身份者ID
    /// 1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
    /// 2.点击“商家服务”(https://b.alipay.com/order/myOrder.htm)
    /// 3.点击“查询合作者身份(PID)”、“查询安全校验码(Key)”
    /// </summary>
    internal class Config
    {
        #region 字段
        private static string partner = "";
        private static string key = "";
        private static string seller_email = "";
        private static string return_url = "";
        private static string notify_url = "";
        private static string input_charset = "";
        private static string sign_type = "";
        private static string transport = "";
        #endregion

        static Config()
        {
            //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

            dal_SystemKey DALSK = new dal_SystemKey();
            t_SystemKey model1 = DALSK.SystemKey_Select_Key("alipay_id");
            partner = model1.nt_Value;

            t_SystemKey model2 = DALSK.SystemKey_Select_Key("alipay_password");
            key = model2.nt_Value;

            t_SystemKey model3 = DALSK.SystemKey_Select_Key("alipay_username");
            seller_email = model3.nt_Value;

            t_SystemKey model4 = DALSK.SystemKey_Select_Key("jump_url");
            string jump_url = System.Web.HttpUtility.UrlEncode(model4.nt_Value, System.Text.Encoding.GetEncoding("gb2312"));

            //return_url = "http://www.panbaobao.cn/alipay/return_url.aspx";
            //notify_url = "http://www.panbaobao.cn/alipay/notify_url.aspx";

            return_url = "http://" + jump_url + "/alipay/return_url.aspx";
            notify_url = "http://" + jump_url + "/alipay/notify_url.aspx";

            //netshop_payonline pagonline = netshop_payonline_dal.payoinfo();
            ////合作身份者ID，以2088开头由16位纯数字组成的字符串
            //partner = pagonline.pay_zhifubaop;// "2088001132865899";

            ////交易安全检验码，由数字和字母组成的32位字符串
            //key = pagonline.pay_paypal;// "ti2nimdm7vp8ftnxpyu4mgg24hryypah";
            ////签约支付宝账号或卖家支付宝帐户
            //seller_email = pagonline.pay_zhifubao;
            ////页面跳转同步返回页面文件路径 要用 http://格式的完整路径，不允许加?id=123这类自定义参数

            ////服务器通知的页面文件路径 要用 http://格式的完整路径，不允许加?id=123这类自定义参数


            //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


            //字符编码格式 目前支持 gbk 或 utf-8
            input_charset = "gbk";

            //签名方式 不需修改
            sign_type = "MD5";

            //访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
            transport = "https";
        }

        #region 属性
        /// <summary>
        /// 获取或设置合作者身份ID
        /// </summary>
        public static string Partner
        {
            get { return partner; }
            set { partner = value; }
        }

        /// <summary>
        /// 获取或设置交易安全检验码
        /// </summary>
        public static string Key
        {
            get { return key; }
            set { key = value; }
        }

        /// <summary>
        /// 获取或设置签约支付宝账号或卖家支付宝帐户
        /// </summary>
        public static string Seller_email
        {
            get { return seller_email; }
            set { seller_email = value; }
        }

        /// <summary>
        /// 获取页面跳转同步通知页面路径
        /// </summary>
        public static string Return_url
        {
            get { return return_url; }
        }

        /// <summary>
        /// 获取服务器异步通知页面路径
        /// </summary>
        public static string Notify_url
        {
            get { return notify_url; }
        }

        /// <summary>
        /// 获取字符编码格式
        /// </summary>
        public static string Input_charset
        {
            get { return input_charset; }
        }

        /// <summary>
        /// 获取签名方式
        /// </summary>
        public static string Sign_type
        {
            get { return sign_type; }
        }

        /// <summary>
        /// 获取访问模式
        /// </summary>
        public static string Transport
        {
            get { return transport; }
        }
        #endregion
    }
}