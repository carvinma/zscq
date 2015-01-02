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
using System.Collections.Generic;
using Com.Alipay;
using zscq.Model;
using zscq.DAL;

public partial class alipay_alipay : System.Web.UI.Page
{
    DataZscqDataContext dpdc = new DataZscqDataContext();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_TrademarkOrder DALO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALOD = new dal_TrademarkOrderDetails();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "submit")
        {
            ////////////////////////////////////////////请求参数////////////////////////////////////////////

            //必填参数//

            //请与贵网站订单系统中的唯一订单号匹配
            //string out_trade_no = Request.Form["TxtSubject"].Trim();
            //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
            //string subject = Request.Form["TxtSubject"].Trim();// TxtSubject.Text.Trim();
            //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
            //string body = Request.Form["TxtBody"].Trim();// TxtBody.Text.Trim();
            //订单总金额，显示在支付宝收银台里的“应付总额”里
            //string total_fee = Request.Form["TxtTotal_fee"].Trim();// TxtTotal_fee.Text.Trim();

            //订单号
            string out_trade_no = "";
            //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
            string subject = "";// TxtSubject.Text.Trim();
            //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
            string body = "";// TxtBody.Text.Trim();
            //订单总金额，显示在支付宝收银台里的“应付总额”里
            string total_fee = "";




            //扩展功能参数——默认支付方式//

            //默认支付方式，代码见“即时到帐接口”技术文档
            string paymethod = "";
            //默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
            string defaultbank = "";
            string pay_mode = "";

            if (Request["tType"] != null && Request["tType"].ToString() != "" && Request["oId"] != null && Request["oId"].ToString() != "")
            {
                int oType = Convert.ToInt32(Request["tType"]);
                int oId = Convert.ToInt32(Request["oId"]);
                if (oType == 1)
                {
                    #region 专利
                    t_PatentOrder pModel = DALPO.PatentOrder_Select_Id(oId);
                    if (pModel != null && pModel.i_Status < 3)
                    {
                        IQueryable<t_PatentOrderInfo> OrderI = (IQueryable<t_PatentOrderInfo>)DALPOI.PatentOrderInfo_Select_OrderId(pModel.i_Id);
                        
                        string OrderName = "";
                        string nvc_Name = "";

                        foreach (var qy in OrderI)
                        {
                            var query_1 = from i in dpdc.t_Patent
                                          where i.i_Id == qy.i_PatentId
                                          select i;
                            foreach (var qy1 in query_1)
                            {
                                OrderName += "," + qy1.nvc_Number;
                            }
                        }
                        nvc_Name = OrderName.Length > 1 ? OrderName.Substring(1, OrderName.Length - 1) : "";

                        //订单号
                        out_trade_no = pModel.nvc_OrderNumber;
                        //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
                        subject = pModel.nvc_OrderNumber;// TxtSubject.Text.Trim();
                        //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
                        body = nvc_Name;// TxtBody.Text.Trim();
                        //订单总金额，显示在支付宝收银台里的“应付总额”里
                        if (pModel.nvc_CurrencyType == "CNY")
                        {
                            total_fee = pModel.dm_TotalMoney.ToString();
                        }
                        else
                        {
                            total_fee = DALPO.GetPayMoneyByHuiLv(pModel.dm_TotalMoney, pModel.nvc_CurrencyType, "CNY").ToString("0.00");
                        }
                        //total_fee = Math.Round(Omodel.dm_SumMoney - Omodel.dm_OkMoney, 2).ToString();

                        //扩展功能参数——默认支付方式//

                        //默认支付方式，代码见“即时到帐接口”技术文档
                        paymethod = "";
                        //默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        defaultbank = "";
                        pay_mode = "directPay";
                        if (pModel.nvc_PayType != "支付宝支付")
                        {
                            pay_mode = Bind_Bank(pModel.nvc_Bank);
                        }
                        if (pay_mode == "directPay")
                        {
                            paymethod = "directPay";//默认支付方式，代码见“即时到帐接口”技术文档
                            defaultbank = "";//默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        }
                        else
                        {
                            paymethod = "bankPay";//默认支付方式，代码见“即时到帐接口”技术文档
                            defaultbank = pay_mode;//默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        }
                    }
                    else
                    {
                        Response.Redirect("../index.aspx");
                    }
                    #endregion
                }
                else if(oType==2)
                {
                    #region 商标
                    t_TrademarkOrder Omodel = DALO.TrademarkOrder_Select_Id(oId);
                    if (Omodel != null && Omodel.i_Status == 0)//未支付
                    {
                        IQueryable<t_TrademarkOrderDetails> OrderD = (IQueryable<t_TrademarkOrderDetails>)DALOD.OrderDetails_Select_OrderId(Omodel.i_Id);
                        string OrderName = "";
                        string nvc_Name = "";
                        DataZscqDataContext dpdc = new DataZscqDataContext();

                        foreach (var qy in OrderD)
                        {
                            var query_1 = from i in dpdc.t_Trademark
                                          where i.i_Id == qy.i_TrademarkId
                                          select i;
                            foreach (var qy1 in query_1)
                            {
                                OrderName += "," + qy1.nvc_SBRegName; //商标注册名称
                            }
                        }

                        nvc_Name = OrderName.Length > 1 ? OrderName.Substring(1, OrderName.Length - 1) : "";

                        //订单号
                        out_trade_no = Omodel.nvc_OrderNumber;
                        //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
                        subject = Omodel.nvc_OrderNumber;// TxtSubject.Text.Trim();
                        //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
                        body = nvc_Name;// TxtBody.Text.Trim();
                        //订单总金额，显示在支付宝收银台里的“应付总额”里
                        total_fee = Omodel.dm_TotalMoney.ToString();
                        //total_fee = Math.Round(Omodel.dm_SumMoney - Omodel.dm_OkMoney, 2).ToString();

                        //扩展功能参数——默认支付方式//

                        //默认支付方式，代码见“即时到帐接口”技术文档
                        paymethod = "";
                        //默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        defaultbank = "";
                        pay_mode = "directPay";
                        if (Omodel.nvc_PayType != "支付宝支付")
                        {
                            pay_mode = Bind_Bank(Omodel.nvc_Bank);
                        }
                        if (pay_mode == "directPay")
                        {
                            paymethod = "directPay";//默认支付方式，代码见“即时到帐接口”技术文档
                            defaultbank = "";//默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        }
                        else
                        {
                            paymethod = "bankPay";//默认支付方式，代码见“即时到帐接口”技术文档
                            defaultbank = pay_mode;//默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        }
                    }
                    else
                    {
                        Response.Redirect("../index.aspx");
                    }
                    #endregion
                }
                else if (oType == 3) //新商标
                {
                    #region 商标
                    t_NewTrademarkOrder Omodel = DALO.NewTrademarkOrder_Select_Id(oId);
                    if (Omodel != null && Omodel.i_Status == 0)//未支付
                    {
                        IQueryable<t_NewTrademarkOrderDetails> OrderD = (IQueryable<t_NewTrademarkOrderDetails>)DALOD.NewOrderDetails_Select_OrderId(Omodel.i_Id);
                        string OrderName = "";
                        string nvc_Name = "";
                        DataTradeMarkDataContext markdc = new DataTradeMarkDataContext();

                        foreach (var qy in OrderD)
                        {
                            var query_1 = from i in markdc.t_NewTradeMarkInfo
                                          where i.i_Id == qy.i_TrademarkId
                                          select i;
                            foreach (var qy1 in query_1)
                            {
                                if (!string.IsNullOrEmpty(qy1.TrademarkRemark))
                                    OrderName += "," + qy1.TrademarkRemark; //商标说明
                                else
                                    OrderName += "," + qy1.TrademarkDescribe;//描述
                            }
                        }
                        nvc_Name = OrderName.Length > 1 ? OrderName.Substring(1, OrderName.Length - 1) : "";

                        //订单号
                        out_trade_no = Omodel.nvc_OrderNumber;
                        //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
                        subject = Omodel.nvc_OrderNumber;// TxtSubject.Text.Trim();
                        //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
                        body = nvc_Name;// TxtBody.Text.Trim();
                        //订单总金额，显示在支付宝收银台里的“应付总额”里
                        total_fee = Omodel.dm_TotalMoney.ToString();
                        //total_fee = Math.Round(Omodel.dm_SumMoney - Omodel.dm_OkMoney, 2).ToString();

                        //扩展功能参数——默认支付方式//

                        //默认支付方式，代码见“即时到帐接口”技术文档
                        paymethod = "";
                        //默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        defaultbank = "";
                        pay_mode = "directPay";
                        if (Omodel.nvc_PayType != "支付宝支付")
                        {
                            pay_mode = Bind_Bank(Omodel.nvc_Bank);
                        }
                        if (pay_mode == "directPay")
                        {
                            paymethod = "directPay";//默认支付方式，代码见“即时到帐接口”技术文档
                            defaultbank = "";//默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        }
                        else
                        {
                            paymethod = "bankPay";//默认支付方式，代码见“即时到帐接口”技术文档
                            defaultbank = pay_mode;//默认网银代号，代号列表见“即时到帐接口”技术文档“附录”→“银行列表”
                        }
                    }
                    else
                    {
                        Response.Redirect("../index.aspx");
                    }
                    #endregion
                }
            }
            else
            {
                Response.Redirect("../index.aspx");
            }

            //扩展功能参数——防钓鱼//

            //防钓鱼时间戳
            string anti_phishing_key = "";
            //获取客户端的IP地址，建议：编写获取客户端IP地址的程序
            string exter_invoke_ip = "";
            //注意：
            //请慎重选择是否开启防钓鱼功能
            //exter_invoke_ip、anti_phishing_key一旦被设置过，那么它们就会成为必填参数
            //建议使用POST方式请求数据
            //示例：
            //exter_invoke_ip = "";
            //Service aliQuery_timestamp = new Service();
            //anti_phishing_key = aliQuery_timestamp.Query_timestamp();               //获取防钓鱼时间戳函数

            //扩展功能参数——其他//

            //商品展示地址，要用http:// 格式的完整路径，不允许加?id=123这类自定义参数
            string show_url = "http://www.hqht-online.com";
            //自定义参数，可存放任何内容（除=、&等特殊字符外），不会显示在页面上
            string extra_common_param = "";
            //默认买家支付宝账号
            string buyer_email = "";

            //扩展功能参数——分润(若要使用，请按照注释要求的格式赋值)//

            //提成类型，该值为固定值：10，不需要修改
            string royalty_type = "";
            //提成信息集
            string royalty_parameters = "";
            //注意：
            //与需要结合商户网站自身情况动态获取每笔交易的各分润收款账号、各分润金额、各分润说明。最多只能设置10条
            //各分润金额的总和须小于等于total_fee
            //提成信息集格式为：收款方Email_1^金额1^备注1|收款方Email_2^金额2^备注2
            //示例：
            //royalty_type = "10";
            //royalty_parameters = "111@126.com^0.01^分润备注一|222@126.com^0.01^分润备注二";

            ////////////////////////////////////////////////////////////////////////////////////////////////

            //把请求参数打包成数组
            SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
            sParaTemp.Add("payment_type", "1");
            sParaTemp.Add("show_url", show_url);
            sParaTemp.Add("out_trade_no", out_trade_no);
            sParaTemp.Add("subject", subject);
            sParaTemp.Add("body", body);
            sParaTemp.Add("total_fee", total_fee);
            sParaTemp.Add("paymethod", paymethod);
            sParaTemp.Add("defaultbank", defaultbank);
            sParaTemp.Add("anti_phishing_key", anti_phishing_key);
            sParaTemp.Add("exter_invoke_ip", exter_invoke_ip);
            sParaTemp.Add("extra_common_param", extra_common_param);
            sParaTemp.Add("buyer_email", buyer_email);
            sParaTemp.Add("royalty_type", royalty_type);
            sParaTemp.Add("royalty_parameters", royalty_parameters);

            //构造即时到帐接口表单提交HTML数据，无需修改
            Service ali = new Service();
            string sHtmlText = ali.Create_direct_pay_by_user(sParaTemp);
            Response.Write(sHtmlText);
        }
    }
    public string Bind_Bank(string bank)
    {
        if (bank == "1")
        {
            return "directPay";
        }
        else if (bank == "2")
        {
            return "ICBCB2C";
        }
        else if (bank == "3")
        {
            return "CMB";
        }
        else if (bank == "4")
        {
            return "CCB";
        }
        else if (bank == "5")
        {
            return "BOCB2C";
        }
        else if (bank == "6")
        {
            return "ABC";
        }
        else if (bank == "7")
        {
            return "COMM";
        }
        else if (bank == "8")
        {
            return "SPDB";
        }
        else if (bank == "9")
        {
            return "GDB";
        }
        else if (bank == "10")
        {
            return "CITIC";
        }
        else if (bank == "11")
        {
            return "CEBBANK";
        }
        else if (bank == "12")
        {
            return "CIB";
        }
        else if (bank == "13")
        {
            return "SDB";
        }
        else if (bank == "14")
        {
            return "CMBC";
        }
        else if (bank == "15")
        {
            return "HZCB";
        }
        else if (bank == "16")
        {
            return "SHBANK";
        }
        else if (bank == "17")
        {
            return "NBBANK";
        }
        else if (bank == "18")
        {
            return "SPABANK";
        }
        else if (bank == "19")
        {
            return "BJRCB";
        }
        else if (bank == "20")
        {
            return "ICBCBTB";
        }
        else if (bank == "21")
        {
            return "CCBBTB";
        }
        else if (bank == "22")
        {
            return "SPDBB2B";
        }
        else if (bank == "23")
        {
            return "ABCBTB";
        }
        else if (bank == "24")
        {
            return "fdb101";
        }
        return "";
    }
}
