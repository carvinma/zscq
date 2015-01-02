using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using tenpay;
using zscq.Model;
using zscq.DAL;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    //商户号
    string partner = "1216896301";
    //密钥
    string key = "b29f4fae9517d778cda7dcb310aaf416";
    //当前时间 yyyyMMdd
    string date = DateTime.Now.ToString("yyyyMMdd");
    //订单号，此处用时间和随机数生成，商户根据自己调整，保证唯一
    string out_trade_no = "20120810153509479";
    string out_trade_type;//业务类别 1专利 2旧商标 3新商标
    //tiger自定义变量金额
    string money = "1";
    //tiger自定义变量商品描述
    string body = "";
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["tType"] != null && Request["tType"].ToString() != "" && Request["oId"] != null && Request["oId"].ToString() != "")
        {
            int oType = Convert.ToInt32(Request["tType"]);
            int oId = Convert.ToInt32(Request["oId"]);
            if (oType == 1)
            {
                #region 专利
                t_PatentOrder pModel = DALPO.PatentOrder_Select_Id(oId);
                if (pModel != null && pModel.dt_PayMoneyTime == null)
                {
                    //订单号
                    out_trade_no = pModel.nvc_OrderNumber;
                    out_trade_type = oType.ToString();
                    //订单金额
                    money = Convert.ToInt32(pModel.dm_TotalMoney * 100).ToString();
                    //商品描述
                    //IQueryable<t_OrderDetails> OrderD = (IQueryable<t_OrderDetails>)new OrderDetailsDAL().OrderDetails_Select_OrderId(model.OrderID);
                    //string OrderName = "";
                    //DataProductDataContext dpdc = new DataProductDataContext();
                    //foreach (var qy in OrderD)
                    //{
                    //    var query_1 = from qq in dpdc.t_Product where qq.ProductID == qy.ProductID select qq;
                    //    foreach (var qy1 in query_1)
                    //    {
                    //        OrderName += "," + (qy1.Name.Length > 10 ? qy1.Name.Substring(0, 10) : qy1.Name);
                    //    }
                    //}
                    //body = OrderName.Length > 1 ? OrderName.Substring(1, OrderName.Length - 1) : "";
                    body = "专利";
                }
                else
                {
                    Response.Redirect("../index.aspx");
                }
                #endregion
            }
            else if(oType==2)
            {
                #region 旧 商标
                t_TrademarkOrder tModel = DALTO.TrademarkOrder_Select_Id(oId);
                if (tModel != null && tModel.dt_PayTime == null)
                {
                    //订单号
                    out_trade_no = tModel.nvc_OrderNumber;
                    //订单金额
                    money = Convert.ToInt32(tModel.dm_TotalMoney * 100).ToString();
                    //商品描述
                    //IQueryable<t_OrderDetails> OrderD = (IQueryable<t_OrderDetails>)new OrderDetailsDAL().OrderDetails_Select_OrderId(model.OrderID);
                    //string OrderName = "";
                    //DataProductDataContext dpdc = new DataProductDataContext();
                    //foreach (var qy in OrderD)
                    //{
                    //    var query_1 = from qq in dpdc.t_Product where qq.ProductID == qy.ProductID select qq;
                    //    foreach (var qy1 in query_1)
                    //    {
                    //        OrderName += "," + (qy1.Name.Length > 10 ? qy1.Name.Substring(0, 10) : qy1.Name);
                    //    }
                    //}
                    //body = OrderName.Length > 1 ? OrderName.Substring(1, OrderName.Length - 1) : "";
                    body = "商标";
                }
                else
                {
                    Response.Redirect("../index.aspx");
                }
                #endregion
            }
            else if (oType == 3)
            {
                #region 新 商标
                t_NewTrademarkOrder tModel = DALTO.NewTrademarkOrder_Select_Id(oId);
                if (tModel != null && tModel.dt_PayTime == null)
                {
                    //订单号
                    out_trade_no = tModel.nvc_OrderNumber;
                    out_trade_type = oType.ToString();
                    //订单金额
                    money = Convert.ToInt32(tModel.dm_TotalMoney * 100).ToString();
                    body = "商标";
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

        //创建RequestHandler实例
        RequestHandler reqHandler = new RequestHandler(Context);
        //初始化
        reqHandler.init();
        //设置密钥
        reqHandler.setKey(key);
        reqHandler.setGateUrl("https://gw.tenpay.com/gateway/pay.htm");



        //-----------------------------
        //设置支付参数
        //-----------------------------
        reqHandler.setParameter("total_fee", money);
        //用户的公网ip,测试时填写127.0.0.1,只能支持10分以下交易
        reqHandler.setParameter("spbill_create_ip", Page.Request.UserHostAddress);//IP地址
        reqHandler.setParameter("return_url", "http://www.hqht-online.com/tenpay/payReturnUrl.aspx");
        //reqHandler.setParameter("return_url", "");
        reqHandler.setParameter("partner", partner);//商户号
        reqHandler.setParameter("out_trade_no", out_trade_no);//订单号
        reqHandler.setParameter("out_trade_type", out_trade_type);//业务类别 1专利 2旧商标 3新商标
        reqHandler.setParameter("notify_url", "http://www.hqht-online.com/tenpay/payNotifyUrl.aspx");
        reqHandler.setParameter("attach", "123");//附加数据
        reqHandler.setParameter("body", body);//商品描述
        reqHandler.setParameter("bank_type", "DEFAULT");//银行代号


        //系统可选参数
        reqHandler.setParameter("sign_type", "MD5");
        reqHandler.setParameter("service_version", "1.0");
        reqHandler.setParameter("input_charset", "GBK");
        reqHandler.setParameter("sign_key_index", "1");

        //业务可选参数
        /*
        reqHandler.setParameter("attach", "");
        reqHandler.setParameter("product_fee", "");
        reqHandler.setParameter("transport_fee", "");
        reqHandler.setParameter("time_start", DateTime.Now.ToString("yyyyMMddHHmmss"));
        reqHandler.setParameter("time_expire", "");
       
        reqHandler.setParameter("buyer_id", "");
        reqHandler.setParameter("goods_tag", "");
        reqHandler.setParameter("agentid", "");
        reqHandler.setParameter("agent_type", "");
         */

        


        //获取请求带参数的url
        string requestUrl = reqHandler.getRequestURL();

        //Get的实现方式
        string a_link = "<a id=\"pay\" href=\"" + requestUrl + "\"></a><script type=\"text/javascript\">document.getElementById('pay').click();</script>";
        divpay.InnerHtml = a_link;


        //post实现方式
        /*
        Response.Write("<form method=\"post\" action=\""+ reqHandler.getGateUrl() + "\" >\n");
        Hashtable ht = reqHandler.getAllParameters();
        foreach(DictionaryEntry de in ht) 
        {
            Response.Write("<input type=\"hidden\" name=\"" + de.Key + "\" value=\"" + de.Value + "\" >\n");
        }
        Response.Write("<input type=\"submit\" value=\"财付通支付\" >\n</form>\n");
        */

        //获取debug信息,建议把请求和debug信息写入日志，方便定位问题
        //string debuginfo = reqHandler.getDebugInfo();
        //Response.Write("<br/>requestUrl:" + requestUrl + "<br/>");
        //Response.Write("<br/>debuginfo:" + debuginfo + "<br/>");
    }
}
