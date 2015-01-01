using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;
using System.Text;

public partial class Q_TrademarkRenewalOrderInfo : System.Web.UI.Page
{
    public bool update8 = Manager.GetManagerQX(21, 2);
    public bool del8 = Manager.GetManagerQX(21, 3);
    public bool chu8 = Manager.GetManagerQX(21, 4);

    public bool update9 = Manager.GetManagerQX(21, 2);
    public bool del9 = Manager.GetManagerQX(21, 3);
    public bool chu9 = Manager.GetManagerQX(21, 4);

    public bool update10 = Manager.GetManagerQX(21, 2);
    public bool del10 = Manager.GetManagerQX(21, 3);
    public bool chu10 = Manager.GetManagerQX(21, 4);

    public bool update12 = Manager.GetManagerQX(21, 2);
    public bool del12 = Manager.GetManagerQX(21, 3);
    public bool chu12 = Manager.GetManagerQX(21, 4);

    public bool update13 = Manager.GetManagerQX(21, 2);
    public bool del13 = Manager.GetManagerQX(21, 3);
    public bool chu13 = Manager.GetManagerQX(21, 4);

    public bool update14 = Manager.GetManagerQX(21, 2);
    public bool del14 = Manager.GetManagerQX(21, 3);
    public bool chu14 = Manager.GetManagerQX(21, 4);

    public bool update15 = Manager.GetManagerQX(21, 2);
    public bool del15 = Manager.GetManagerQX(21, 3);
    public bool chu15 = Manager.GetManagerQX(21, 4);

    public bool update16 = Manager.GetManagerQX(21, 2);
    public bool del16 = Manager.GetManagerQX(21, 3);
    public bool chu16 = Manager.GetManagerQX(21, 4);

    public bool update17 = Manager.GetManagerQX(21, 2);
    public bool del17 = Manager.GetManagerQX(21, 3);
    public bool chu17 = Manager.GetManagerQX(21, 4);

    public bool update18 = Manager.GetManagerQX(21, 2);
    public bool del18 = Manager.GetManagerQX(21, 3);
    public bool chu18 = Manager.GetManagerQX(21, 4);
    dal_Coupon DALC = new dal_Coupon();
    dal_Address DALA = new dal_Address();
    DataViewDataContext dvdc = new DataViewDataContext();
    bll_MemberGrade BLLMG = new bll_MemberGrade();
    dal_TrademarkOrder DALO = new dal_TrademarkOrder();
    dal_TrademarkOrderOperateInfos DALTOO = new dal_TrademarkOrderOperateInfos();
    dal_Member DALU = new dal_Member();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALS = new dal_TrademarkSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Member DALM = new dal_Member();
    dal_Bank DALB = new dal_Bank();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    dal_NewTrademark mark = new dal_NewTrademark();
    public string PeiSong = "0";
    public string pageurl = "";
    public StringBuilder Str_Money = new StringBuilder();
    public StringBuilder Str_AllMoney = new StringBuilder();
    public string Str_Moneymei = "";
    public int OrderStatus = 0;
    public int userid = 0, guoji = 0;
    public string youjifei = "0.00", bankpay = "";
    public bool isyouji = false, isfapiao = false;
    public int dazhe = 0, dazhe1 = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        div_a.InnerHtml = "";
        HiddenDel.Value = "";
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            pageurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public string ConvertStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkOrderStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
    }
    private void Bind_Page_Info()//绑定订单信息
    {
        if (Request.QueryString["orderid"] != null && Request.QueryString["orderid"].ToString() != "")
        {
            Hi_OrderId.Value = Request.QueryString["orderid"].ToString();
            int orderid = Convert.ToInt32(Request.QueryString["orderid"].ToString());

            vw_NewTrademarkOrder Order = dvdc.vw_NewTrademarkOrder.FirstOrDefault(i => i.i_Id == orderid);
            if (Order != null)
            {
                userid = Order.i_MemberId;

                //状态
                OrderStatus = Order.i_Status;
                this.Lb_OrderStatus.Text = ConvertStatus(Order.i_Status);

                if (Order.i_Status == 0)
                {
                    this.Lb_OrderStatus.ForeColor = System.Drawing.Color.Red;
                }
                //订单号处理
                bankpay = Order.nvc_PayType;
                if (Order.nvc_PayType == "线下汇款")
                {
                    huikuan.Visible = true;
                    string str = "";
                    for (int i = 0; i < Order.nvc_BankId.Split(',').Length; i++)
                    {
                        t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(Order.nvc_BankId.Split(',')[i]));
                        if (tb != null)
                        {
                            str += "&nbsp;开户行：" + tb.nvc_BankDetails + "&nbsp;用户：" + tb.nvc_AccountName + "&nbsp;卡号：" + tb.nvc_BankNumber + "<br/>";
                        }
                    }
                    Ltl_PayType.Text = str;
                }

                string message = "";
                message = Order.nvc_OrderNumber;
                this.labOrderNum.Text = message;
                this.labAddTime.Text = Order.dt_AddTime.ToString();
                this.labAddress.Text = DALA.Set_AddressName_Gid_PId_CId_AId(Order.i_Address_Gid, Order.i_Address_PId, Order.i_Address_CId, Order.i_Address_AId) + Order.nvc_Address + "(收件人：" + Order.nvc_RealName + ")";
                t_ReceiveAddress dizhi = DALRA.ReceiveAddress_Select_Id(Order.i_AddressId);
                if (dizhi != null)
                {
                    labZipCode.Text = dizhi.nvc_ZipCode;
                }
                labMobile.Text = Order.nvc_MobilePhone;
                labTel.Text = Order.nvc_TelPhone;
                labEmail.Text = Order.nvc_Email;
                this.lb_cbianhao.Text = Order.nvc_UserNum;
                this.labUserName.Text = Order.nvc_Name;
                this.lb_cname.Text = Order.nvc_RealName;

                //绑定商标信息
                if (!string.IsNullOrEmpty(Request.QueryString["tIds"]))
                {
                    string[] tIds = Request.QueryString["tIds"].Split(',');
                    var iquery = mark.Trademark_web_Excel(tIds);
                    repSB.DataSource = iquery;
                    repSB.DataBind();
                }
                
                if (Order.i_IsFaPiao == 1)
                {
                    tr_fapiao_1.Visible = true;
                    tr_fapiao_2.Visible = true;
                    tr_fapiao_3.Visible = true;
                    tr_fapiao_4.Visible = true;
                    //lb_fapiao.Text = "已开发票，发票抬头：" + Order.nvc_FaPiaoTaiTou + "</br>另加3.5%的税收：(" + Order.dm_FapiaoMoney + ")";
                    lb_fapiao.Text = Order.nvc_FaPiaoTaiTou;
                    lb_fapiaomoney.Text = Order.dm_TotalMoney.ToString("0.00");
                    if (Order.i_IsYouJi == 1)
                    {
                        isyouji = true;
                        //youjifei = Order.dm_YoujiFee.ToString();//国内快递费25
                    }
                }
                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">商标局规费：</td><td width=\"110\"> " + Order.dm_TrademarkMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                if (Order.dm_TMZhiNaJin.HasValue && Order.dm_TMZhiNaJin>0)
                {
                    Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\"> " + Order.dm_TMZhiNaJin + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                }
                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费：</td><td width=\"110\">" + Order.dm_TMDaiLi + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">增值税：</td><td width=\"110\">" + Order.dm_ZengZhiTax + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">手续费：</td><td width=\"110\">" + Order.dm_ShouXuFee + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">优惠券：</td><td width=\"110\">-" + Order.dm_YouHuiFee + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总计：</td><td style='color:red;' width=\"30\"\">CNY</td><td style='color:red;' width=\"100\" id='allmoney'  align=\"left\">" + Order.dm_TotalMoney + "</td></tr>");

                //支付方式
                #region 绑定操作记录
                repOperateDetail.DataSource = DALTOO.NewOrderOperateInfo_Select(orderid, 0);
                repOperateDetail.DataBind();
                #endregion

                #region 按钮设置
                switch (OrderStatus)
                {
                    case 0:
                        this.btnNoPay.Visible = true;
                        this.btnEsc.Visible = false;
                        break;
                    case 1:
                        this.btnPay.Visible = true;
                        this.btnEsc.Visible = true;

                        break;
                    case 2:
                        this.btnIdeal.Visible = true;
                        this.btnEsc.Visible = true;
                        break;
                    case 3:
                        this.btnComplete.Visible = true;
                        this.btnEsc.Visible = true;
                        break;
                    case 4:
                        this.btnEsc.Visible = true;
                        break;

                }
                #endregion
            }
        }
        else
        {
            Response.Redirect("Q_TrademarkApplyOrder.aspx?" + pageurl);
        }
    }

    protected void btnOperate_Click(object sender, EventArgs e)//提交
    {
        int OrderId = Convert.ToInt32(Request.QueryString["orderid"].ToString());
        t_NewTrademarkOrder Order_Model = DALO.NewTrademarkOrder_Select_Id(OrderId);//订单修改
        t_Member member = DALU.Member_Select_Id(Order_Model.i_MemberId);
        string comName = ((Button)sender).CommandName;
        int? trademarkStatus=null;
        if (!String.IsNullOrEmpty(comName))
        {
            int CType = Convert.ToInt32(comName);

            #region 订单操作记录
            t_NewTrademarkOrderOperateInfos operateModel = new t_NewTrademarkOrderOperateInfos();
            operateModel.i_OrderId = OrderId;
            operateModel.dt_AddTime = System.DateTime.Now;
            operateModel.i_ManagerId = Convert.ToInt32(Request.Cookies["zscqmanage"]["userid"]);
            operateModel.i_Type = CType;
            operateModel.nvc_Info_1 = area_beizhu.Value;

            DALTOO.NewOrderOperateInfos_Add(operateModel);
            #endregion

            #region 状态
            Order_Model.i_Status = CType;
            #region 未支付
            if (CType == 0)//未支付
            {
                trademarkStatus = 10;//已提交订单，尚未接收汇款
            }
            #endregion
            #region 已支付
            if (CType == 1)//已支付
            {
                Order_Model.dt_PayTime = DateTime.Now;
                trademarkStatus =11;//申请中，已汇款
            }
            #endregion
            #region 处理中
            if (CType == 2)//处理中
            {
            }
            #endregion
            #region 完成
            if (CType == 4)
            {
                trademarkStatus = 2;//距续展期限大于90天
                if (Order_Model.nvc_PayType == "线下汇款" && Order_Model.i_JiFen > 0)
                {
                    //积分手机号码信息表 --商标用户ID
                    t_IntegralMobile im = DALIM.IntegralMobile_SelectByMemberId(Order_Model.i_MemberId);
                    if (im != null)
                    {
                        //im.i_Integral += Order_Model.i_JiFen;
                        //DALIM.IntegralMobile_Updata(im);
                        BLLUIN.UserIntegralNote_Add(Order_Model.i_MemberId, "商标下单", Order_Model.i_JiFen);
                        Order_Model.i_JiFen = 0;
                    }
                }
            }
            #endregion
            #region 取消订单
            if (CType == 3)//取消订单  优惠券取消
            {
                trademarkStatus = 12;//已保存，未提交
                if (Order_Model.i_IsUseYHQ == 1)
                {
                    if (Order_Model.nvc_YHQIdstr != null || Order_Model.nvc_YHQIdstr != "")
                    {
                        string[] yhqid = Order_Model.nvc_YHQIdstr.Split(',');
                        for (int i = 0; i < yhqid.Length; i++)
                        {
                            if (yhqid[i] != "" && yhqid[i] != null)
                            {
                                t_Coupon tc = DALC.Coupon_Select_Id(int.Parse(yhqid[i]));
                                if (tc != null)
                                {
                                    tc.i_State = 1;
                                    DALC.Coupon_Update(tc);
                                }
                            }
                        }
                    }
                }
            }
            #endregion
            #endregion
            if (CType != 2) //当订单为处理中时，保持申请中已汇款或申请中未汇款
            {
                if (!string.IsNullOrEmpty(Request.QueryString["tIds"]) && trademarkStatus.HasValue)
                {
                    string[] tIds = Request.QueryString["tIds"].Split(',');

                    var iquery = mark.Trademark_web_Excel(tIds);
                    foreach (var t in iquery)
                    {
                        #region 完成订单：从申请转为续展，计算续展期限日
                        if (CType == 4) //完成
                        {
                            trademarkStatus = 2;//距续展期限大于90天
                            if (t.i_Type == 0) t.i_Type = 1;//从申请转为续展

                            if (t.RenewalDate.HasValue)
                            {
                                t.RenewalDate = t.RenewalDate.Value.AddYears(0); //续展期限日
                            }
                            else
                            {
                                DateTime dt = DateTime.Today;
                                t.RegNoticeDate = dt; //注册公告日
                                t.RenewalDate = dt.AddYears(10);//续展期限日
                            }
                            t.RestDays = Convert.ToInt32(HelpString.DateDiff(t.RenewalDate.Value, DateTime.Today, "day"));
                        }
                        #endregion
                        t.Status = trademarkStatus;
                    }
                    mark.Trademark_Submit();
                }
            }
            DALO.TrademarkOrder_Update(Order_Model);
            Manager.AddLog(0, "订单管理", "更改订单" + Order_Model.nvc_OrderNumber + "状态为" + ConvertStatus(Order_Model.i_Status));

            Response.Redirect(Request.Url.ToString());
        }
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)//删除订单
    {
        int orderID = Convert.ToInt32(Hi_OrderId.Value);
        t_NewTrademarkOrder Order_Model = new dal_TrademarkOrder().NewTrademarkOrder_Select_Id(orderID);
        if (Order_Model != null)
        {
            #region 会员等级
                BLLMG.Member_UpdateGrade(Order_Model, 1);
                #endregion
            new dal_TrademarkOrder().NewTrademarkOrder_Del(orderID);
            Manager.AddLog(0, "商标订单管理", "删除订单");
            Response.Redirect("Q_TrademarkApplyOrder.aspx?" + pageurl);
        }
    }
    public string Set_OperateState(object obj)//操作信息的状态
    {
        return DALTOO.Set_OperateState(obj);
    }
}