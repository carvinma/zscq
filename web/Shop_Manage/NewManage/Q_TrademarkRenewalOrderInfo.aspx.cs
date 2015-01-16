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
                    //huikuan.Visible = true;
                    //string str = "";
                    //for (int i = 0; i < Order.nvc_BankId.Split(',').Length; i++)
                    //{
                    //    t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(Order.nvc_BankId.Split(',')[i]));
                    //    if (tb != null)
                    //    {
                    //        str += "&nbsp;开户行：" + tb.nvc_BankDetails + "&nbsp;用户：" + tb.nvc_AccountName + "&nbsp;卡号：" + tb.nvc_BankNumber + "<br/>";
                    //    }
                    //}
                    //Ltl_PayType.Text = str;
                    StringBuilder yinhang = new StringBuilder();
                    #region 邮件中的银行信息
                    yinhang.Append("<div class='list-div'>");
                    yinhang.Append("<table width='100%'>");
                    yinhang.Append("<tr><th colspan='4'>银行信息</td></tr>");
                    yinhang.Append("<tr>");
                    //yinhang.Append("<td width='25%' height='28' align='center'><strong>银行类型</strong></td>");
                    yinhang.Append("<td width='40%' height='28' align='center'><strong>开户银行</strong></td>");
                    yinhang.Append("<td width='30%' height='28' align='center'><strong>户名</strong></td>");
                    yinhang.Append("<td width='30%' height='28' align='center'><strong>卡号</strong></td>");
                    yinhang.Append("</tr>");
                    for (int i = 0; i < Order.nvc_BankId.Split(',').Length; i++)
                    {
                        t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(Order.nvc_BankId.Split(',')[i]));
                        if (tb != null)
                        {
                            yinhang.Append("<tr>");
                            //yinhang.Append("<td width='25%' height='28' align='center'>" + tb.nvc_BankName + "</td>");
                            yinhang.Append("<td width='40%' height='28' align='center'>" + tb.nvc_BankDetails + "</td>");
                            yinhang.Append("<td width='30%' height='28' align='center'>" + tb.nvc_AccountName + "</td>");
                            yinhang.Append("<td width='30%' height='28' align='center'>" + tb.nvc_BankNumber + "</td>");
                            yinhang.Append("</tr>");
                        }
                    }
                    yinhang.Append("</table>");
                    yinhang.Append("</div>");
                    #endregion
                    Ltl_PayType.Text = "<br/>" + yinhang.ToString();
                }

                string message = "";
                message = Order.nvc_OrderNumber;
                this.labOrderNum.Text = message;
                this.labAddTime.Text = Order.dt_AddTime.ToString();
                this.labAddress.Text = DALA.Set_AddressName_Gid_PId_CId_AId(Order.i_Address_Gid, Order.i_Address_PId, Order.i_Address_CId, Order.i_Address_AId) + Order.nvc_Address;
                t_ReceiveAddress dizhi = DALRA.ReceiveAddress_Select_Id(Order.i_AddressId);
                if (dizhi != null)
                {
                    labZipCode.Text = dizhi.nvc_ZipCode;
                    labPhone.Text = !string.IsNullOrEmpty(dizhi.nvc_MobilePhone) ? dizhi.nvc_MobilePhone : dizhi.nvc_TelPhone;
                    this.labAddress.Text = this.labAddress.Text + "(收件人：" + dizhi.nvc_Consignee + ")";
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
                    tr_fapiao_5.Visible = true;
                    //lb_fapiao.Text = "已开发票，发票抬头：" + Order.nvc_FaPiaoTaiTou + "</br>另加3.5%的税收：(" + Order.dm_FapiaoMoney + ")";
                    lb_fapiao.Text = Order.nvc_FaPiaoTaiTou;
                    lb_fapiaomoney.Text = Order.dm_TotalMoney.ToString("0.00");
                    if (Order.i_IsYouJi == 1)
                    {
                        isyouji = true;
                        //youjifei = Order.dm_YoujiFee.ToString();//国内快递费25
                    }
                }
                this.Lal_GuanFei.Text = Order.dm_TrademarkMoney.ToString();
                this.Txt_GuanFei.Text = Order.dm_TrademarkMoney.ToString();

                this.Lal_zhinajin.Text = Order.dm_TMZhiNaJin > 0 ? Order.dm_TMZhiNaJin.ToString() : "0";
                this.Txt_Zhinajin.Text = Order.dm_TMZhiNaJin > 0 ? Order.dm_TMZhiNaJin.ToString() : "0";

                this.Lal_DaiLiFei.Text = Order.dm_TMDaiLi.ToString();
                this.Txt_DaiLiFei.Text = Order.dm_TMDaiLi.ToString();

                this.Lal_ZengzhiTax.Text = Order.dm_ZengZhiTax.ToString();
                this.Txt_ZengzhiTax.Text = Order.dm_ZengZhiTax.ToString();

                this.Lal_ShouxuFei.Text = Order.dm_ShouXuFee.ToString();
                this.Txt_ShouxuFei.Text = Order.dm_ShouXuFee.ToString();

                this.Lal_Youhui.Text = Order.dm_YouHuiFee.ToString();
                this.Txt_Youhui.Text = Order.dm_YouHuiFee.ToString();

                this.Lal_TotalMoney.Text = Order.dm_TotalMoney.ToString();
                this.Txt_TotalMoney.Text = Order.dm_TotalMoney.ToString();

                /*
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
                */
                //支付方式
                #region 绑定操作记录
                repOperateDetail.DataSource = DALTOO.NewOrderOperateInfo_Select(orderid, 0);
                repOperateDetail.DataBind();
                #endregion

                #region 按钮设置
                switch (OrderStatus)
                {
                    //case 0:
                    //    this.btnNoPay.Visible = true;
                    //    this.btnEsc.Visible = false;
                    //    break;
                    //case 1:
                    //    this.btnPay.Visible = true;
                    //    this.btnEsc.Visible = true;

                    //    break;
                    //case 2:
                    //    this.btnIdeal.Visible = true;
                    //    this.btnEsc.Visible = true;
                    //    break;
                    //case 3:
                    //    this.btnComplete.Visible = true;
                    //    this.btnEsc.Visible = true;
                    //    break;
                    //case 4:
                    //    this.btnEsc.Visible = true;
                    //    break;

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
                            DateTime dt = DateTime.Today;
                            if (t.RenewalDate.HasValue)
                            {
                                if (t.RegNoticeDate.HasValue)
                                    dt = t.RegNoticeDate.Value;
                                t.RenewalDate = t.RenewalDate.Value.AddYears(10); //续展期限日
                            }
                            else
                            {
                                t.RegNoticeDate = dt; //注册公告日
                                t.RenewalDate = dt.AddYears(10).AddDays(-1);//续展期限日
                            }
                            //这个案件10年后再续展的话就要上传新的申请书和委托书了
                            t.RenewalAgentUpBook = null;
                            t.RenewalApplyUpBook = null;
                            t.RestDays = Convert.ToInt32(HelpString.DateDiff(t.RenewalDate.Value, DateTime.Today, "day"));
                            addRegNoticeData(t.i_Id, dt.AddYears(10).AddDays(-1), t.RenewalDate.Value);
                            //addRegNoticeData(t.i_Id, dt, t.RenewalDate.Value);//更改续展日期到数据库（2015-01-12 是 否 完成）
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

    //续展日期添加
    private void addRegNoticeData(int trademarkid, DateTime RegNoticeBeginDate, DateTime RegNoticeEndDate)
    {
        List<t_NewTradeMarkRenewalInfo> list = new List<t_NewTradeMarkRenewalInfo>();
        for (DateTime dt = RegNoticeBeginDate; dt <= RegNoticeEndDate; dt=dt.AddYears(10))
        {
            t_NewTradeMarkRenewalInfo renewalModel = new t_NewTradeMarkRenewalInfo();
            renewalModel.TradeMarkId = trademarkid;
            renewalModel.RenewalDate = dt;
            renewalModel.IsFinish = dt == RegNoticeEndDate ? false : true;
            list.Add(renewalModel);
        }
        if (list.Count > 0)
        {
            mark.TrademarkRenewalDate_Add(list, trademarkid);
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
    protected void Btn_EditFee_Click(object sender, EventArgs e)
    {
        bool flag = false;
        if (Txt_GuanFei.Visible == false)
        {
            flag = true;
        }
        this.Txt_GuanFei.Visible = flag;
        this.Txt_Zhinajin.Visible = flag;
        this.Txt_DaiLiFei.Visible = flag;
        this.Txt_ZengzhiTax.Visible = flag;
        this.Txt_ShouxuFei.Visible = flag;
        this.Txt_Youhui.Visible = flag;
        this.Txt_TotalMoney.Visible = flag;

        this.Lal_GuanFei.Visible = !flag;
        this.Lal_zhinajin.Visible = !flag;
        this.Lal_DaiLiFei.Visible = !flag;
        this.Lal_ZengzhiTax.Visible = !flag;
        this.Lal_ShouxuFei.Visible = !flag;
        this.Lal_Youhui.Visible = !flag;

        if (!flag)
        {
            t_NewTrademarkOrder order = DALO.NewTrademarkOrder_Select_Id(Convert.ToInt32(Hi_OrderId.Value));

            order.dm_TrademarkMoney = Convert.ToDecimal(Txt_GuanFei.Text);
            order.dm_TMZhiNaJin = Convert.ToDecimal(Txt_Zhinajin.Text);

            order.dm_TMDaiLi = Convert.ToDecimal(Txt_DaiLiFei.Text);
            order.dm_ZengZhiTax = Convert.ToDecimal(Txt_ZengzhiTax.Text);

            order.dm_ShouXuFee = Convert.ToDecimal(Txt_ShouxuFei.Text);
            order.dm_YouHuiFee = Convert.ToDecimal(Txt_Youhui.Text);
            order.dm_TotalMoney = Convert.ToDecimal(Txt_TotalMoney.Text);

            DALO.TrademarkOrder_Update(order);
            div_a.InnerHtml = "<script>alert('修改成功')</script>";
            Lal_GuanFei.Text = Txt_GuanFei.Text;
            Lal_zhinajin.Text = Txt_Zhinajin.Text;
            Lal_DaiLiFei.Text = Txt_DaiLiFei.Text;
            Lal_ZengzhiTax.Text = Txt_ZengzhiTax.Text;
            Lal_ShouxuFei.Text = Txt_ShouxuFei.Text;
            Lal_Youhui.Text = Txt_Youhui.Text;
            Lal_TotalMoney.Text = Txt_TotalMoney.Text;
        }
    }
}