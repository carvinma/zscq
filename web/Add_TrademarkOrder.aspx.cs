using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
public partial class Add_TrademarkOrder : System.Web.UI.Page
{
    public dal_PatentOrder DALPO = new dal_PatentOrder();
    int uId = 0;
    string href = "";
    bll_Email BLLE = new bll_Email();
    public StringBuilder sb_trademrk = new StringBuilder();
    public StringBuilder sb_xianxia = new StringBuilder();
    dal_Trademark DALT = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_PayWay DALPY = new dal_PayWay();
    dal_PSWay DALPS = new dal_PSWay();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    dal_PSWay DALPSW = new dal_PSWay();
    dal_Bank DALBK = new dal_Bank();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    public StringBuilder tr_PayWay = new StringBuilder();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_UserGrade DALUG = new dal_UserGrade();
    dal_Coupon DALC = new dal_Coupon();

    dal_NewTrademark mark = new dal_NewTrademark();
    public string strtotalmoney = "0", strtotalmoneymei = "0", guowaiyouji = "0";
    public string bizhong = "", guowaiinfo = "";
    public int guoji = 0;
    public decimal meihuilv = 1;
    public StringBuilder PSWay = new StringBuilder();
    public StringBuilder Str_Money = new StringBuilder();
    public StringBuilder Str_AllMoney = new StringBuilder();
    public int dazhe = 0, dazhe1 = 0;
    public decimal TMDaiLi = 0, TrademarkMoney = 0, TMZhiNaJin = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        href = Request.Url.ToString();
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_Sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_Sb_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_Sb_uid"]);
            zscqaddress.MemberId = uId;
            //hi_dfaid.Value = zscqaddress.AddressId.ToString();
            //Response.Write(zscqaddress.AddressId.ToString());
            Bind_PatentList();
            if (!IsPostBack)
            {
                Delete_Patent();
                Bind_Page_PayWay();
                Bind_Drp_YouHuiQuan();
                GetDefaultAddress(uId);
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            string patentid = Request.Cookies["hqht_Trademarktidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            string emalladdress = "";
            #region 生成订单
            t_TrademarkOrder OrderModer = new t_TrademarkOrder();
            OrderModer.nvc_OrderNumber = DALTO.Set_OrderNo();
            OrderModer.dm_TrademarkMoney = TrademarkMoney;
            OrderModer.dm_TMZhiNaJin = TMZhiNaJin;
            OrderModer.dm_TMDaiLi = TMDaiLi;
            OrderModer.i_MemberId = uId;
            OrderModer.i_Status = 1;
            OrderModer.dm_TotalMoney = decimal.Parse(strtotalmoney);//国内要缴纳的总钱
            OrderModer.dm_TotalMoneyGY = decimal.Parse(strtotalmoneymei);
            OrderModer.dt_AddTime = DateTime.Now;
            string youhui = "", yhqid = ""; decimal youhuifee = 0;
            if (rp_youhui.Items.Count > 0)
            {
                string flag = Request.Form["inputPageid"];
                //Response.Write(flag);
                //return;
                //得到币种和汇率
                t_Member mm = DALM.Member_Select_Id(uId);

                t_Nationality na = DALN.Nationality_Select_Id(mm.i_GuoJiId);

                t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                if (nafee != null)
                {
                    bizhong = "CNY";
                    if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                    {
                        meihuilv = nafee.dm_Exchange;
                    }
                }
                if (flag != null && flag != "")
                {
                    string[] flaglist = flag.Split(',');
                    for (int j = 0; j < flaglist.Length; j++)
                    {
                        if (flaglist[j] != "" || flaglist[j] != null)
                        {
                            vw_Coupon t = DALC.Coupon_Select_Vw_Id(int.Parse(flaglist[j]));
                            t_Coupon tc = DALC.Coupon_Select_Id(int.Parse(flaglist[j]));
                            if (t != null && tc != null)
                            {
                                yhqid += tc.i_Id + ",";
                                youhui += "+" + t.nvc_Name + bizhong + t.i_Money;
                                youhuifee += decimal.Parse(t.i_Money.ToString());
                                tc.i_State = 2;
                                tc.nvc_OrderNumber = OrderModer.nvc_OrderNumber;
                                DALC.Coupon_Update(tc);
                            }
                        }
                    }
                    OrderModer.i_IsUseYHQ = 1;
                    OrderModer.nvc_YHQIdstr = yhqid;
                    OrderModer.dm_YouHuiFee = youhuifee;
                    OrderModer.dm_TotalMoney = decimal.Parse(strtotalmoney) - youhuifee;
                    OrderModer.dm_TotalMoneyGY = decimal.Parse((OrderModer.dm_TotalMoney * meihuilv).ToString());


                }

                OrderModer.nvc_YouHUiQuan = youhui.TrimStart('+');

            }
            if (checkfp.Checked)
            {
                OrderModer.i_IsFaPiao = 1;
                OrderModer.nvc_FaPiaoTaiTou = txt_fptt.Value;
                OrderModer.i_IsYouJi = 1;
                OrderModer.i_YouJiType = 1;//是否邮寄
                if (hi_guoji.Value != "1")//国外
                {
                    string fapiao = ((float.Parse(hi_GanfeeZhinajin.Value)) * 0.033).ToString();
                    OrderModer.dm_FapiaoMoney = decimal.Parse(fapiao);
                    OrderModer.dm_YoujiFee = decimal.Parse(guowaiyouji.ToString());
                    string nowmoney = (float.Parse(strtotalmoney) + float.Parse(fapiao) + float.Parse(guowaiyouji)).ToString();
                    if (youhuifee > 0)
                    {
                        nowmoney = (float.Parse(strtotalmoney) + float.Parse(fapiao) + float.Parse(guowaiyouji) - (float.Parse(youhuifee.ToString()))).ToString();
                    }
                    OrderModer.dm_TotalMoney = decimal.Parse(nowmoney);//国内要缴纳的总钱
                    OrderModer.dm_TotalMoneyGY = decimal.Parse((decimal.Parse(nowmoney) * meihuilv).ToString());
                }
                else
                {
                    OrderModer.i_YouJiType = 2;
                    string youjinow = "0";
                    string youji = Request.Form["way"];
                    string fapiao = "0.00";
                    if (youji != null)
                    {
                        string[] youjimoney = youji.Split(',');
                        youjinow = youjimoney[1].ToString();
                        fapiao = ((float.Parse(hi_GanfeeZhinajin.Value)) * 0.033).ToString();
                        OrderModer.dm_YoujiFee = decimal.Parse(youjinow.ToString());
                    }
                    OrderModer.dm_FapiaoMoney = decimal.Parse(fapiao);
                    string nowmoney = (float.Parse(strtotalmoney) + float.Parse(fapiao) + float.Parse(youjinow)).ToString();
                    if (youhuifee > 0)
                    {
                        nowmoney = (float.Parse(strtotalmoney) + float.Parse(fapiao) + float.Parse(youjinow) - (float.Parse(youhuifee.ToString()))).ToString();
                    }
                    OrderModer.dm_TotalMoney = decimal.Parse(nowmoney);//国内要缴纳的总钱                   
                }
                vw_ReceiveAddress dizhi = DALRA.ReceiveAddress_vw_Select_Id(zscqaddress.AddressId);
                if (dizhi != null)
                {
                    OrderModer.i_AddressId = zscqaddress.AddressId;
                    OrderModer.i_Address_Gid = dizhi.i_Gid;
                    OrderModer.i_Address_PId = (int)dizhi.i_PId;
                    OrderModer.i_Address_CId = (int)dizhi.i_CId;
                    OrderModer.i_Address_AId = (int)dizhi.i_AId;
                    OrderModer.nvc_Address = dizhi.nvc_StreetAddress;
                }
            }
            t_Member user = DALM.Member_Select_Id(uId);
            if (user != null)
            {
                emalladdress = user.nvc_Email;
            }
            // OrderModer.nvc_YouHUiQuan = "0";
            if (input_payway.Value == "网银支付")
            {
                OrderModer.nvc_PayType = input_payway.Value;
                OrderModer.nvc_Bank = bank.Value;
            }
            else
            {
                OrderModer.nvc_PayType = input_payway.Value;
            }
            int o = DALTO.TrademarkOrder_Add(OrderModer);
            #region 银行
            string bankId = "";
            if (Convert.ToInt32(hi_guoji.Value) == 1)
            {
                bankId = Bind_Rpt_BankList(0, 1);
            }
            else if (Convert.ToInt32(hi_guoji.Value) == 11)
            {
                bankId = Bind_Rpt_BankList(2, 1);
            }
            else
            {
                bankId = Bind_Rpt_BankList(1, 1);
            }

            #region
            if (OrderModer.nvc_PayType == "线下汇款")
            {
                if (bankId.IndexOf(',') > -1)
                {
                    string s = "";
                    for (int i = 0; i < bankId.Split(',').Length - 1; i++)
                    {
                        t_Bank tb = DALBK.Bank_Select_Id(Convert.ToInt32(bankId.Split(',')[i]));
                        if (tb != null)
                        {
                            if (checkfp.Checked == true)
                            {
                                if (tb.i_FaPiao == 1)
                                {
                                    s += bankId.Split(',')[i] + ",";
                                }
                            }
                            else
                            {
                                if (tb.i_FaPiao == 0)
                                {
                                    s += bankId.Split(',')[i] + ",";
                                }
                            }
                        }
                    }
                    OrderModer.nvc_BankId = s.Substring(0, s.Length - 1);
                }
                else
                {
                    OrderModer.nvc_BankId = bankId;
                }
            }
            #endregion
            DALTO.TrademarkOrder_Update(OrderModer);
            #endregion
            #endregion

            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    int tid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    int number = Convert.ToInt32(arr_pid[i].Split(',')[1]);
                    t_Trademark model = DALT.Trademark_Select_Id(tid);

                    if (model != null)
                    {
                        sbnum += 1;
                        if (model.i_IsPayState == 2)//续交商标
                        {
                            //model.nvc_SbRegTime = model.nvc_SbDaoqiTime;
                            //model.nvc_SbDaoqiTime = DateTime.Parse(model.nvc_SbDaoqiTime + " 00:00").AddYears(10).ToShortDateString();
                            //DateTime dt = DateTime.Parse(model.nvc_SbDaoqiTime + " 00:00:00").AddYears(10);
                            //DateTime dtold = DateTime.Parse(model.nvc_SbDaoqiTime + " 00:00:00");
                            //model.i_ShengDays += int.Parse(HelpString.DateDiff(dt, dtold, "day"));
                            model.i_XujiaoStates = 1;
                        }
                        else
                        {
                            model.i_IsPayState = 1;
                        }
                        #region 生成订单详情
                        int trademarkid = model.i_Id;
                        t_TrademarkOrderDetails dModer = new t_TrademarkOrderDetails();
                        dModer.i_OrderId = OrderModer.i_Id;
                        dModer.i_TrademarkId = trademarkid;
                        dModer.nvc_SBRegNum = model.nvc_SBRegNum;
                        dModer.nvc_SBType = model.nvc_SBType;
                        dModer.nvc_SBRegName = model.nvc_SBRegName;
                        dModer.nvc_SBRegEnName = model.nvc_SBRegEnName;
                        dModer.i_ShengDays = model.i_ShengDays;
                        dModer.i_JiaoFeiType = model.i_JiaoFeiType;
                        dModer.nvc_SbDaoqiTime = model.nvc_SbDaoqiTime;
                        int ok = DALTOD.OrderDetails_Add(dModer);
                        DALT.Trademark_Update(model);
                        #endregion
                        UserLog.AddUserLog(uId, "商标系统", "提交订单");
                        if (o > 0 && ok > 0)
                        {

                        }
                    }
                }
            }
            dal_SystemSetup DALS = new dal_SystemSetup();
            t_SystemSetup ts = DALS.SystemSetup_Select();
            if (ts != null)
            {
                OrderModer.i_JiFen = DALTOD.OrderDetails_Select_Count(OrderModer.i_Id) * ts.i_SbIntergral;
                DALTO.TrademarkOrder_Update(OrderModer);
            }
            if (sbnum == 0)
            {
                div_a.InnerHtml = "<script>alert('没有要交费的商标！');localtion.href='user_sblb.aspx';</script>";
            }
            else
            {
                if (emalladdress != "")
                {
                    bool states = false;
                    string huikuanbankinfo = "";
                    if (input_payway.Value == "线下汇款")
                    {
                        // huikuanbankinfo = "";

                        string str1 = "本公司的银行帐户信息如下<br/>";
                        for (int i = 0; i < OrderModer.nvc_BankId.Split(',').Length; i++)
                        {
                            t_Bank tb = DALBK.Bank_Select_Id(Convert.ToInt32(OrderModer.nvc_BankId.Split(',')[i]));
                            if (tb != null)
                            {
                                str1 += "<br/><font color='red'>开户行：" + tb.nvc_BankDetails + "&nbsp;&nbsp;<br/>账户：" + tb.nvc_AccountName + "&nbsp;<br/>卡号：" + tb.nvc_BankNumber + "</font><br/>";
                            }
                        }
                        huikuanbankinfo = str1;
                    }

                    BLLE.Email_Add(emalladdress, "商标缴费订单", "您好！您要缴费的订单号：" + OrderModer.nvc_OrderNumber + " <br/>  下单时间为：" + OrderModer.dt_AddTime + "  <br/>  您选择" + input_payway.Value + "支付，" + huikuanbankinfo + " <br/><br/> 支付商标费用详情：<br/>" + hi_feeinfo.Value + "<br/>请于工作日的24小时内付费！如有问题，请与环球汇通联系！<br/>咨询电话：86-10-84505596<br/>E-MAIL：pat-annuity@hqht-online.com", uId, ref states, "cn");
                }
                Response.Cookies["hqht_Trademarktidstr"].Value = null;
                Response.Redirect("User_TrademarkOrderOk.aspx?order=" + OrderModer.i_Id);
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('没有要交费的商标！');localtion.href='user_sblb.aspx';</script>";
        }

    }
    void Bind_Drp_YouHuiQuan()
    {
        int count = 0;
        var iquery = DALC.Coupon_Select_Page_MemberYouHui(1, 100, uId, ref count);
        if (count > 0)
        {
            rp_youhui.DataSource = iquery;
            rp_youhui.DataBind();
            table_youhuiquan.Visible = true;
            table_yhq1.Visible = true;
        }
        else
        {
            table_youhuiquan.Visible = false;
            table_yhq1.Visible = false;
        }
    }
    public int sbnum = 0, sbdailinum = 0, zhinajinnum = 0;
    void Bind_PatentList()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ids"]))
        {
            string patentid = Request.QueryString["ids"];
            string[] arr_pid = patentid.Split(',');

            #region 用户资料

            t_Member muser = DALM.Member_Select_Id(uId);
            if (muser != null)
            {
                if (muser.i_UserTypeId == 3)
                {
                    if ((muser.nvc_DaiLiName == "" || muser.nvc_DaiLiName == null) || (muser.nvc_RealName == "" || muser.nvc_RealName == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null) || (muser.nvc_Address == "" || muser.nvc_Address == null) || (muser.nvc_ZipCode == "" || muser.nvc_ZipCode == null))
                    {
                        MessageBox.ShowAndRedirect(this.Page, "用户资料填写不完整，请先完善资料！", "user_sbzl.aspx");
                        return;
                    }
                }
                else if (muser.i_UserTypeId == 2)
                {
                    if (muser.i_GuoJiId == 1)
                    {
                        if ((muser.nvc_Company == "" || muser.nvc_Company == null) || (muser.nvc_RealName == "" || muser.nvc_RealName == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null) || (muser.nvc_Address == "" || muser.nvc_Address == null) || (muser.nvc_ZipCode == "" || muser.nvc_ZipCode == null))
                        {
                            MessageBox.ShowAndRedirect(this.Page, "用户资料填写不完整，请先完善资料！", "user_sbzl.aspx");
                            return;
                        }
                    }
                    else
                    {
                        if ((muser.nvc_EnCompany == "" || muser.nvc_EnCompany == null) || (muser.nvc_EnglishName == "" || muser.nvc_EnglishName == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null) || (muser.nvc_EnAddress == "" || muser.nvc_EnAddress == null) || (muser.nvc_ZipCode == "" || muser.nvc_ZipCode == null))
                        {
                            MessageBox.ShowAndRedirect(this.Page, "用户资料填写不完整，请先完善资料！", "user_sbzl.aspx");
                            return;
                        }
                    }
                }
                else
                {
                    if (muser.i_GuoJiId == 1)
                    {
                        if ((muser.nvc_RealName == "" || muser.nvc_RealName == null) || (muser.nvc_IDCard == "" || muser.nvc_IDCard == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null) || (muser.nvc_Address == "" || muser.nvc_Address == null) || (muser.nvc_ZipCode == "" || muser.nvc_ZipCode == null))
                        {
                            MessageBox.ShowAndRedirect(this.Page, "用户资料填写不完整，请先完善资料！", "user_sbzl.aspx");
                            return;
                        }
                    }
                    else
                    {
                        if ((muser.nvc_EnglishName == "" || muser.nvc_EnglishName == null) || (muser.nvc_IDCard == "" || muser.nvc_IDCard == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null) || (muser.nvc_EnAddress == "" || muser.nvc_EnAddress == null) || (muser.nvc_ZipCode == "" || muser.nvc_ZipCode == null))
                        {
                            MessageBox.ShowAndRedirect(this.Page, "用户资料填写不完整，请先完善资料！", "user_sbzl.aspx");
                            return;
                        }
                    }
                }
                #region 会员折扣 by chy
                dazhe = muser.i_PowerDaZhe;
                t_MemberGrade tmg = DALUG.UserGrade_Select_Id(muser.i_Grade);
                if (tmg != null)
                {
                    dazhe1 = Convert.ToInt32(tmg.i_Discount);
                }
                #endregion
            }
            #endregion


            Bind_Rpt_BankList(0, 0);//国内

            var iquery = mark.Trademark_web_Excel(arr_pid);
            Rpt_order.DataSource = iquery;
            Rpt_order.DataBind();

            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">商标局规费：</td><td width=\"110\">" + iquery.Sum(p => p.TrademarkMoney).Value.ToString("0.00") + "*" + sbnum + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费：</td><td width=\"110\">" + "0" + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">增值税：</td><td width=\"110\">" + (iquery.Sum(p => p.TrademarkMoney).Value * 0.033m).ToString("0.00") + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">手续费：</td><td width=\"110\">" + "0" + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            string totalmoney = string.Empty;
            totalmoney = (iquery.Sum(p => p.TrademarkMoney).Value + iquery.Sum(p => p.TrademarkMoney).Value * 0.033m + 0).ToString("0.00");
            hi_allmy.Value = totalmoney;
            strtotalmoney = totalmoney;
            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总金额：</td><td style=\"color:red;\" width=\"30\">CNY</td><td style='color:red;width:100px;' id='allmoney'  align=\"left\">" + totalmoney + "</td></tr>");

        }
        else
        {
            Response.Redirect("trademark_list.aspx");
        }
    }

    void Delete_Patent()
    {
        if (Request["pagetype"] != null && Request["pagetype"].ToString() != "")
        {
            if (Request["pagetype"].ToString() == "del")
            {
                if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
                {
                    string sid = Request["cs"].ToString();
                    string pids = Request.Cookies["hqht_Trademarktidstr"].Value;
                    pids = (pids + "|").Replace("|" + sid + "|", "|");
                    pids = pids.TrimEnd('|');
                    Response.Cookies["hqht_Trademarktidstr"].Value = pids;
                    Response.Redirect("User_TrademarkOrderAdd.aspx");
                }
            }
        }
    }
    void Bind_Page_PayWay()//绑定支付方式
    {
        //t_Member umodel = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
        int shu = 0;
        var iquery = DALPY.PayWay_Select_All();
        foreach (var q in iquery)
        {
            shu++;
            string ischeck = "";
            string img = "";
            string info = "";
            if (q.nvc_Name == "支付宝支付")
            {
                img = "&nbsp;&nbsp;<img alt=\"\" border=\"0\" src=\"images/orderimg1.jpg\">";
                info = "推荐淘宝用户使用!";
            }
            else if (q.nvc_Name == "财付通支付")
            {
                img = "&nbsp;&nbsp;<img alt=\"\" border=\"0\" src=\"images/orderimg2.jpg\">";
                info = "推荐腾讯拍拍用户使用";
            }
            tr_PayWay.Append("<tr><td width=\"29\" height=\"35\" align=\"right\" valign=\"middle\">&nbsp;");
            tr_PayWay.Append("<input id=\"payway" + shu + "\" name=\"payway\" type=\"radio\" onclick=\"change();checkpay(0);\" value=\"" + q.nvc_Name + "," + q.nt_Explain + "\"" + ischeck + " /></td>");

            tr_PayWay.Append("<td width=\"657\" align=\"left\" valign=\"middle\" class=\"huisezi\">" + img + "</td>");

            tr_PayWay.Append("<td colspan=\"4\">&nbsp;&nbsp;<label for=\"payway" + shu + "\">" + info + "</label></td></tr>");

        }

    }
    void GetDefaultAddress(int uid)
    {
        string address = "";
        t_Member model = DALM.Member_Select_Id(uid);
        vw_ReceiveAddress dizhi = DALRA.ReceiveAddress_vw_Select_Id(model.i_DefaultAddress);
        if (dizhi != null)
        {
            address = dizhi.provinceName + " " + dizhi.cityName + " " + dizhi.areaName + " " + dizhi.nvc_StreetAddress;
            //Ltl_DefaultAddress.Text = address;
        }
        else
        {
            // s_adress.Style["display"] = "block";
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Cookies["hqht_Trademarktidstr"].Value = null;
        Response.Redirect("user_sblb.aspx");
    }
    string Bind_Rpt_BankList(int guojitype, int type)
    {
        string s = "";
        IQueryable<t_Bank> iquery = DALBK.Bank_Select_FaPiaoAndGuoJi(guojitype);
        if (type == 0)
        {
            Rpt_BankList.DataSource = iquery;
            Rpt_BankList.DataBind();
        }
        else
        {
            foreach (var i in iquery)
            {
                s += i.i_Id + ",";
            }
        }
        return s;
    }
}