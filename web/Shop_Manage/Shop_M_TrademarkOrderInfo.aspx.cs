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

public partial class Shop_Manage_shop_submore : System.Web.UI.Page
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
    public string ZTFileImg(object Uid, object tid)
    {
        string filestr = "未上传";
        if (Uid != null)
        {
            var m = DALM.Member_Select_Id(int.Parse(Uid.ToString()));
            if (m.i_UserTypeId == 3)
            {
                if (tid != null)
                {
                    t_Trademark t = DALT.Trademark_Select_Id(int.Parse(tid.ToString()));
                    if (t != null)
                    {
                        if (t.nvc_ZhuTiFile != null)
                        {
                            filestr = "<a href='../" + t.nvc_ZhuTiFile + "' title='主体资格证明文件'><img src='../" + t.nvc_ZhuTiFile + "' width='60'  title='主体资格证书' border='0'/></a>";
                        }
                    }
                }
            }
            else
            {
                if (m != null && !string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                {
                    filestr = "<a href='../" + m.nvc_ZhuTiFile + "' title='主体资格证明文件'><img src='../" + m.nvc_ZhuTiFile + "' width='60'  title='主体资格证书' border='0'/></a>";

                }
                else
                {
                    if (tid != null)
                    {
                        t_Trademark t = DALT.Trademark_Select_Id(int.Parse(tid.ToString()));
                        if (t != null)
                        {
                            if (t.nvc_ZhuTiFile != null)
                            {
                                filestr = "<a href='../" + t.nvc_ZhuTiFile + "' title='主体资格证明文件'><img src='../" + t.nvc_ZhuTiFile + "' width='60'  title='主体资格证书' border='0'/></a>";
                            }
                        }
                    }

                }
            }
        }
        return filestr;
    }
    public bool BoolFileImg(object fileurl)
    {
        if (fileurl != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    private void Bind_Page_Info()//绑定订单信息
    {
        if (Request.QueryString["orderid"] != null && Request.QueryString["orderid"].ToString() != "")
        {
            Hi_OrderId.Value = Request.QueryString["orderid"].ToString();
            int orderid = Convert.ToInt32(Request.QueryString["orderid"].ToString());

            vw_TrademarkOrder Order = dvdc.vw_TrademarkOrder.FirstOrDefault(i => i.i_Id == orderid);
            if (Order != null)
            {
                userid = Order.i_MemberId;

                //状态
                OrderStatus = Order.i_Status;
                this.Lb_OrderStatus.Text = DALO.Set_TrademarkOrderState(Order.i_Status);

                if (Order.i_Status == 4)
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
                var iquery = DALTOD.OrderDetails_vw_Select_OrderId(orderid);
                repSB.DataSource = iquery;
                repSB.DataBind();
                int sbdailinum = 0, zhinajinnum = 0;
                foreach (var item in iquery)
                {
                    t_Trademark v = DALT.Trademark_Select_Id(item.i_TrademarkId);
                    if (v != null)
                    {
                        if (v.i_JiaoFeiType == 2)
                        {
                            sbdailinum += 1;
                            if (v.i_ShengDays < 0)
                            {
                                zhinajinnum += 1;
                            }
                        }
                    }
                }
                t_TradeMarkSetup model = DALS.TrademarkSetup_Select();//代理费用
                t_Member mm = DALU.Member_Select_Id(Order.i_MemberId);

                #region 会员折扣 by chy
                dazhe = mm.i_PowerDaZhe;
                dal_UserGrade DALUG = new dal_UserGrade();
                t_MemberGrade tmg = DALUG.UserGrade_Select_Id(mm.i_Grade);
                if (tmg != null)
                {
                    dazhe1 = Convert.ToInt32(tmg.i_Discount);
                }
                #endregion

                #region 会员折扣 by chy
                decimal dalifee = model.dm_TMDaiLi;
                if (dazhe != 0)
                {
                    dalifee = dalifee * dazhe / 100;
                }
                if (dazhe1 != 0)
                {
                    dalifee = dalifee * dazhe1 / 100;
                }
                #endregion
                if (model != null)
                {
                    t_Nationality na = DALN.Nationality_Select_Id(Convert.ToInt32(Order.i_GuoJiId));
                    if (na != null)
                    {
                        string bizhong = "";
                        // lb_huobi.Text = na.nvc_Currency;
                        if (na.nvc_Name == "中国")
                        {
                            guoji = 1;
                            bizhong = na.nvc_JFBizhong;
                            string totalmoney = (((dalifee) * sbdailinum) + ((model.dm_TrademarkMoney) * sbdailinum) + ((model.dm_TMZhiNaJin) * zhinajinnum)).ToString("0.00");
                            string shangbiao = (model.dm_TrademarkMoney * (iquery.Count())).ToString("0.00");
                            string zhinajin = model.dm_TMZhiNaJin.ToString("0.00");

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
                                    youjifei = Order.dm_YoujiFee.ToString();//国内快递费25
                                }
                            }
                            //Str_Money = "<table  style='width:320px;'>"
                            //    + "<tr><td align='right'>-使用优惠券：</td><td align='left'>" + Order.nvc_YouHUiQuan + "</td></tr>"
                            //    + "<tr><td align='right'>+邮费：</td><td align='left'>￥" + youjifei + "(" + iquery.Count() + "个)" + "</td></tr>"
                            //    + "<tr><td align='right'>+税收：</td><td align='left'>" + Order.dm_FapiaoMoney
                            //    + "<tr><td align='right'>+国内代理费：</td><td align='left'><span style=\"color:red; font-weight:bold;\">￥" + (model.dm_TMDaiLi * sbdailinum).ToString("0.00") + "</span>(" + sbdailinum + "个)" + "</td></tr>"
                            //    + "<tr><td align='right'>+官网商标费用：</td><td align='left'><span style='color:red;'>￥" + shangbiao + "</span>" + "</td></tr>"
                            //    + "<tr><td align='right'>=    实收总计：</td><td align='left'>￥" + totalmoney + "</td></tr>"
                            //+ "</table>";
                            //Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">缴费币种：</td><td width=\"110\"> &nbsp;" + bizhong + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">官方商标续展费用：</td><td width=\"110\"> " + Order.dm_TrademarkMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            if (zhinajinnum != 0)
                            {
                                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\"> " + Order.dm_TMZhiNaJin + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            }
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费用：</td><td width=\"110\">" + Order.dm_TMDaiLi + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">小计：</td><td width=\"30\">CNY</td><td width=\"100\" align=\"left\">" + totalmoney + "</td></tr>");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">使用优惠券：</td><td width=\"110\">-" + Order.dm_YouHuiFee + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">发票费用：</td><td width=\"110\">" + Order.dm_FapiaoMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">邮寄费用：</td><td width=\"110\">" + youjifei + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总计：</td><td style='color:red;' width=\"30\"\">CNY</td><td style='color:red;' width=\"100\" id='allmoney'  align=\"left\">" + Order.dm_TotalMoney + "</td></tr>");
                        }
                        else
                        {
                            guoji = 0;
                            string youjifei = "0.00";
                            t_SystemSetup ss = DALSS.SystemSetup_Select();
                            if (Order.i_IsFaPiao == 1)
                            {
                                isfapiao = true;
                                lb_fapiao.Text = Order.nvc_FaPiaoTaiTou;
                                if (Order.i_IsYouJi == 1)
                                {
                                    isyouji = true;
                                    youjifei = Order.dm_YoujiFee.ToString();//国外快递费                         

                                }
                            }
                            lb_ordertype.Text = na.nvc_Name + "商标订单";
                            // lb_huobi.Text = na.nvc_Currency;

                            decimal huilv = 1;
                            t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                            if (nafee != null)
                            {
                                bizhong = nafee.nvc_Currency;
                                if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                {
                                    huilv = nafee.dm_Exchange;
                                }
                            }
                            string totalmoney = (Convert.ToDecimal(Order.dm_TMDaiLi + Order.dm_TMZhiNaJin + Order.dm_TrademarkMoney)).ToString("0.00");
                            string totalmoneyGY = (Order.dm_TotalMoney / huilv).ToString("0.00");
                            string shangbiao = (model.dm_TrademarkMoney * (iquery.Count())).ToString("0.00");
                            string zhinajin = (model.dm_TMZhiNaJin * (iquery.Count())).ToString("0.00");
                            string zhinajinGY = ((model.dm_TMZhiNaJin * (iquery.Count())) / huilv).ToString("0.00");
                            string dailimoneyGy = ((((dalifee) * (iquery.Count()))) / huilv).ToString();
                            string shangbiaoGY = ((((model.dm_TrademarkMoney) * (iquery.Count()))) / huilv).ToString("0.00") + "美元";
                            //Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">缴费币种：</td><td width=\"110\"> &nbsp;" + bizhong + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">官方商标续展费用：</td><td width=\"110\"> " + Order.dm_TrademarkMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            if (zhinajinnum != 0)
                            {
                                Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\"> " + Order.dm_TMZhiNaJin + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            }
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费用：</td><td width=\"110\">" + Order.dm_TMDaiLi + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">小计：</td><td width=\"30\">CNY</td><td width=\"100\" align=\"left\">" + totalmoney + "</td></tr>");

                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">使用优惠券：</td><td width=\"110\">-" + Order.dm_YouHuiFee + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">发票费用：</td><td width=\"110\">" + Order.dm_FapiaoMoney + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">邮寄费用：</td><td width=\"110\">" + youjifei + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
                            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总计：</td><td style='color:red;' width=\"30\"\">CNY</td><td style='color:red;' width=\"100\" id='allmoney'  align=\"left\">" + Order.dm_TotalMoney + "</td></tr>");
                            Str_AllMoney.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\"></td><td style='color:red;' width=\"30\">" + bizhong + "&nbsp;</td><td style='color:red;' width=\"100\" id='allmonymei' >" + Order.dm_TotalMoneyGY + "</td></tr>");
                        }
                    }
                }
                //支付方式
                #region 绑定操作记录
                repOperateDetail.DataSource = DALTOO.OrderOperateInfo_Select(orderid, 0);
                repOperateDetail.DataBind();
                #endregion

                #region 按钮设置
                switch (OrderStatus)
                {
                    case 0:
                        this.Bt_Confirm.Visible = true;
                        this.Bt_Esc.Visible = false;
                        break;
                    case 1:
                        this.Bt_Pay.Visible = true;
                        this.Bt_Esc.Visible = true;

                        break;
                    case 2:
                        this.Bt_Ok.Visible = true;
                        this.Bt_Esc.Visible = true;
                        break;
                    case 3:
                        this.Bt_shenhe.Visible = true;
                        this.Bt_Esc.Visible = true;
                        break;
                    case 4:
                        this.Bt_Esc.Visible = true;
                        break;

                }
                #endregion
            }
        }
        else
        {
            Response.Redirect("Shop_M_TrademarkOrder.aspx?" + pageurl);
        }
    }

    protected void btnOperate_Click(object sender, EventArgs e)//提交
    {
        int OrderId = Convert.ToInt32(Request.QueryString["orderid"].ToString());
        t_TrademarkOrder Order_Model = DALO.TrademarkOrder_Select_Id(OrderId);//订单修改
        t_Member member = DALU.Member_Select_Id(Order_Model.i_MemberId);
        string comName = ((Button)sender).CommandName;
        if (!String.IsNullOrEmpty(comName))
        {
            int CType = Convert.ToInt32(comName);

            #region 订单操作记录
            t_TrademarkOrderOperateInfos operateModel = new t_TrademarkOrderOperateInfos();
            operateModel.i_OrderId = OrderId;
            operateModel.dt_AddTime = System.DateTime.Now;
            operateModel.i_ManagerId = Convert.ToInt32(Request.Cookies["zscqmanage"]["userid"]);
            operateModel.i_Type = CType + 1;
            operateModel.nvc_Info_1 = area_beizhu.Value;

            DALTOO.OrderOperateInfos_Add(operateModel);
            #endregion

            #region 状态
            Order_Model.i_Status = CType + 1;
            #region 待付款
            if (CType == 1)//待付款
            {
                var result = DALTOD.OrderDetails_vw_Select_OrderId(OrderId);
                foreach (var r in result)
                {
                    t_Trademark sb_model = DALT.Trademark_Select_Id(r.i_TrademarkId);
                    if (sb_model.i_IsPayState == 2)
                    {
                        sb_model.i_XujiaoStates = 2;
                    }
                    else
                    {
                        sb_model.i_IsPayState = 1;
                    }
                    DALT.Trademark_Update(sb_model);
                }
            }
            #endregion
            #region 付款
            if (CType == 2)//付款
            {
                Order_Model.dt_PayTime = DateTime.Now;
            }
            #endregion
            #region 完成
            if (CType == 3)
            {
                if (Order_Model.nvc_PayType == "线下汇款" && Order_Model.i_JiFen > 0)
                {
                    t_IntegralMobile im = DALIM.IntegralMobile_SelectByMemberId(Order_Model.i_MemberId);
                    if (im != null)
                    {
                        //im.i_Integral += Order_Model.i_JiFen;
                        //DALIM.IntegralMobile_Updata(im);
                        BLLUIN.UserIntegralNote_Add(Order_Model.i_MemberId, "商标下单", Order_Model.i_JiFen);
                        Order_Model.i_JiFen = 0;
                    }
                }

                var result = DALTOD.OrderDetails_vw_Select_OrderId(OrderId);
                foreach (var r in result)
                {
                    t_Trademark sb_model = DALT.Trademark_Select_Id(r.i_TrademarkId);
                    if (sb_model.i_IsPayState == 2)
                    {
                        sb_model.i_XujiaoStates = 2;
                        DateTime t1 = Convert.ToDateTime(sb_model.nvc_SbDaoqiTime).AddYears(10).AddDays(0);
                        //DateTime f1 = Convert.ToDateTime(sb_model.nvc_SbDaoqiTime); 
                        sb_model.i_ShengDays += Convert.ToInt32(HelpString.DateDiff(t1, Convert.ToDateTime(sb_model.nvc_SbDaoqiTime), "day"));
                        sb_model.nvc_SbDaoqiTime = t1.ToShortDateString();
                    }
                    else
                    {
                        sb_model.i_IsPayState = 2;
                        sb_model.i_XujiaoStates = 2;
                        DateTime t1 = Convert.ToDateTime(sb_model.nvc_SbDaoqiTime).AddYears(10).AddDays(0);
                        //DateTime f1 = Convert.ToDateTime(sb_model.nvc_SbDaoqiTime); 
                        sb_model.i_ShengDays += Convert.ToInt32(HelpString.DateDiff(t1,Convert.ToDateTime(sb_model.nvc_SbDaoqiTime),  "day"));
                        sb_model.nvc_SbDaoqiTime = t1.ToShortDateString();
                    }
                    DALT.Trademark_Update(sb_model);
                }
            }
            #endregion
            #region 取消订单
            if (CType == 4)//取消订单  优惠券取消
            {
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
                var result = DALTOD.OrderDetails_vw_Select_OrderId(OrderId);
                foreach (var r in result)
                {
                    t_Trademark sb_model = DALT.Trademark_Select_Id(r.i_TrademarkId);
                    sb_model.i_IsPayState = 4;
                    DALT.Trademark_Update(sb_model);
                }

            }
            #endregion
            #endregion

            DALO.TrademarkOrder_Update(Order_Model);
            Manager.AddLog(0, "订单管理", "更改订单" + Order_Model.nvc_OrderNumber + "状态为" + DALO.Set_TrademarkOrderState(Order_Model.i_Status));

            #region 发短信
            //switch (CType)
            //{
            //    case 2:
            //        {
            //            t_SystemKey sk = DALSK.SystemKey_Select_Key("i_OrderPay");
            //            if (sk.i_Value == 1)
            //            {
            //                sk = DALSK.SystemKey_Select_Key("nvc_OrderPay");
            //                string smsContent = sk.nt_Value.Replace("Order", Order_Model.nvc_OrderNumber);
            //                bool Tref = true;
            //                BLLMS.Message_Add(Order_Model.nvc_Address_MobilePhone, smsContent, "订单付款", Order_Model.i_MemberId, ref Tref);
            //            }
            //        }
            //        break;
            //    case 4:
            //        {
            //            t_SystemKey sk = DALSK.SystemKey_Select_Key("i_OrderSendGood");
            //            if (sk.i_Value == 1)
            //            {
            //                sk = DALSK.SystemKey_Select_Key("nvc_OrderSendGood");
            //                string smsContent = sk.nt_Value.Replace("Order", Order_Model.nvc_OrderNumber);
            //                bool Tref = true;
            //                BLLMS.Message_Add(Order_Model.nvc_Address_MobilePhone, smsContent, "订单生产", Order_Model.i_MemberId, ref Tref);
            //            }
            //        }
            //        break;
            //    case 5:
            //        {
            //            t_SystemKey sk = DALSK.SystemKey_Select_Key("i_OrderGetGood");
            //            if (sk.i_Value == 1)
            //            {
            //                sk = DALSK.SystemKey_Select_Key("nvc_OrderGetGood");
            //                string smsContent = sk.nt_Value.Replace("Order", Order_Model.nvc_OrderNumber);
            //                bool Tref = true;
            //                BLLMS.Message_Add(Order_Model.nvc_Address_MobilePhone, smsContent, "订单配送", Order_Model.i_MemberId, ref Tref);
            //            }
            //        }
            //        break;
            //}
            #endregion

            Response.Redirect(Request.Url.ToString());
        }
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)//删除订单
    {
        int orderID = Convert.ToInt32(Hi_OrderId.Value);
        t_TrademarkOrder Order_Model = new dal_TrademarkOrder().TrademarkOrder_Select_Id(orderID);
        if (Order_Model != null)
        {
            if (Order_Model.i_Status < 7)//已取消，已退款订单滚蛋，直接删
            {
                #region 会员等级
                BLLMG.Member_UpdateGrade(Order_Model, 1);
                #endregion
            }
            new dal_TrademarkOrder().TrademarkOrder_Del(orderID);
            Manager.AddLog(0, "商标订单管理", "删除订单");
            Response.Redirect("Shop_M_TrademarkOrder.aspx?" + pageurl);
        }
    }
    public string Set_OperateState(object obj)//操作信息的状态
    {
        return DALTOO.Set_OperateState(obj);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //DataOrderDataContext dodc = new DataOrderDataContext();
        //DataViewDataContext dc = new DataViewDataContext();
        //int OrderId = int.Parse(Hi_OrderId.Value);

        //DataTable table = new DataTable();
        //table.Columns.Add("客户编码", typeof(string));
        //table.Columns.Add("客户名称", typeof(string));
        //table.Columns.Add("地址", typeof(string));
        //#region 查询
        //var iquery = from i in dc.t_Orders_s
        //             join p in dc.t_ReceiveAddress_s on i.ReceiveAddressID equals p.i_Id
        //             join u in dc.t_Member_s on i.i_MemberId equals u.i_Id
        //             where i.i_Invoice == 1 && i.i_Id == OrderId
        //             select new
        //             {
        //                 i.i_Id,
        //                 i.nvc_OrderNumber,
        //                 i.i_MemberId,
        //                 i.i_Export,
        //                 p.nvc_Consignee,
        //                 p.i_CId,
        //                 u.nvc_Name
        //             };
        //#endregion
        //StringBuilder StrOrder = new StringBuilder();
        //foreach (var q in iquery)
        //{
        //    DataRow row = table.NewRow();
        //    row["客户编码"] = "10000" + q.i_MemberId.ToString();
        //    row["客户名称"] = q.nvc_Consignee;
        //    row["地址"] = Set_City(q.i_CId);
        //    table.Rows.Add(row);
        //    StrOrder.Append("," + q.i_Id.ToString());
        //}
        //if (iquery.Count() > 0)
        //{
        //    var up_iquery = from i in dodc.t_Orders where (StrOrder.ToString() + ",").IndexOf("," + i.i_Id.ToString() + ",") > -1 select i;
        //    foreach (var q in up_iquery)
        //    {
        //        q.i_Export = 1;
        //    }
        //    dodc.SubmitChanges();
        //}
        //Manager.AddLog(0, "订单管理", "导出开票客户信息");
        //CreateExcel(table, "开票客户信息" + DateTime.Now.ToString(), Page.Response);
    }
    public void CreateExcel(DataTable dt, string FileName, HttpResponse response)
    {
        HttpResponse resp;
        resp = response;
        FileName = System.Web.HttpUtility.UrlEncode(System.Text.Encoding.UTF8.GetBytes(FileName));
        resp.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
        resp.AppendHeader("Content-Disposition", "attachment;filename=" + FileName + ".txt");
        //string colHeaders = "";
        string ls_item = "";

        //定义表对象与行对象，同时用DataSet对其值进行初始化 

        DataRow[] myRow = dt.Select();//可以类似dt.Select("id>10")之形式达到数据目的
        int i = 0;
        int cl = dt.Columns.Count;

        //取得数据表各列标题，各标题之间以t分割，最后一个列标题后加回车符 
        //for (i = 0; i < cl; i++)
        //{
        //    if (i == (cl - 1))//最后一列，加n
        //    {
        //        colHeaders += dt.Columns[i].Caption.ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\r\n";
        //    }
        //    else
        //    {
        //        colHeaders += dt.Columns[i].Caption.ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\t";
        //    }

        //}
        //resp.Write(colHeaders);
        //向HTTP输出流中写入取得的数据信息 

        //逐行处理数据   
        foreach (DataRow row in myRow)
        {
            //当前行数据写入HTTP输出流，并且置空ls_item以便下行数据
            for (i = 0; i < cl; i++)
            {
                if (i == (cl - 1))//最后一列，加n
                {
                    ls_item += row[i].ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\r\n";
                }
                else
                {
                    ls_item += row[i].ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\t";
                }
            }
            resp.Write(ls_item);
            ls_item = "";
        }
        resp.End();
    }
    public string Set_City(object CityId)
    {
        dal_Address DALA = new dal_Address();
        if (CityId != null)
        {
            t_City city = DALA.City_Select_Id(Convert.ToInt32(CityId));
            if (city != null)
            {
                if (city.cityName != null && city.cityName != "市辖区" && city.cityName != "县")
                {
                    return city.cityName;
                }
                else
                {
                    t_Province Pro = DALA.Province_Select_Id(city.provinceID);
                    if (Pro != null)
                    {
                        return Pro.provinceName;
                    }
                }
            }
        }
        return "";
    }
    public string Set_ProductGuigeValue(object GuigeType1, object Guige1, object GuigeType2, object Guige2, object GuigeType3, object Guige3)
    {
        string ret = "";
        if (GuigeType1 != null)
        {
            ret += GuigeType1 + "：" + Guige1;
        }
        if (GuigeType2 != null)
        {
            ret += "&nbsp;&nbsp;" + GuigeType2 + "：" + Guige2;
        }
        if (GuigeType3 != null)
        {
            ret += "&nbsp;&nbsp;" + GuigeType3 + "：" + Guige3;
        }
        return ret;
    }
    public string Set_Return(object ReturnState, object ReturnNumber, object Returnyuanyin, object ReturnTime)
    {
        try
        {
            string ret = "";
            if (ReturnState != null)
            {
                switch (ReturnState.ToString())
                {
                    case "1":
                        ret += "（退货申请中）";
                        break;
                    case "2":
                        ret += "（退货已通过）";
                        break;
                    case "3":
                        ret += "（退货未通过）";
                        break;
                    case "4":
                        ret += "（退货已取消）";
                        break;
                }
                ret += "<br>退货数量：" + ReturnNumber.ToString();
                ret += "<br>退货原因：" + Returnyuanyin.ToString();
                ret += "</br>申请时间：" + ReturnTime;
                return ret;
            }
        }
        catch { }
        return "";
    }
    public string GetGuojiName(object id)// 获得国籍
    {
        string guojiname = "";
        t_Nationality nn = DALN.Nationality_Select_Id(id.ToString().GetInt());
        if (nn != null)
        {
            guojiname = nn.nvc_Name;
        }
        return guojiname;
    }
}