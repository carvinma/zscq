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
using Aspose.Words;
using Aspose.Cells;
using System.Threading.Tasks;
public partial class Add_TrademarkrenewalOrder : System.Web.UI.Page
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
    public string ids;
    public string membername, memberPhone, memberPostcode, memberAddress, membernum, emailAttachments;
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
               // Delete_Patent();
                Bind_Page_PayWay();
                Bind_Drp_YouHuiQuan();
                hi_address.Value= GetDefaultAddress(uId);
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (!string.IsNullOrEmpty(hi_ids.Value))
        {
            StringBuilder emailMarktable = new StringBuilder();
            string patentid = hi_ids.Value;
            string[] arr_pid = patentid.Split(',');
            string emalladdress = "";

            var iquery = mark.Trademark_web_Excel(arr_pid);
            sbnum = iquery.Count();
            #region 生成订单
            t_NewTrademarkOrder OrderModer = new t_NewTrademarkOrder();
            OrderModer.nvc_OrderNumber = DALTO.Set_OrderNo();
            OrderModer.dm_TrademarkMoney = iquery.Sum(p => p.TrademarkMoney); //商标金额
            OrderModer.dm_TMZhiNaJin = iquery.Sum(p => p.TrademarkLateFee);//滞纳金
            OrderModer.dm_TMDaiLi = iquery.Sum(p => p.TrademarkAgencyFee);//代理费
            OrderModer.dm_ZengZhiTax = decimal.Parse(hi_tax.Value);//增值税
            OrderModer.dm_ShouXuFee = decimal.Parse(hi_shouxufei.Value);//手续费
            OrderModer.i_MemberId = uId;
            OrderModer.i_Status = 0;
            OrderModer.dm_TotalMoney = decimal.Parse(hi_totalmoney.Value);//国内要缴纳的总钱
            //OrderModer.dm_TotalMoneyGY = decimal.Parse(strtotalmoneymei);
            OrderModer.dt_AddTime = DateTime.Now;
            string youhui = "", yhqid = ""; decimal youhuifee = 0;
            if (rp_youhui.Items.Count > 0)
            {
                string flag = Request.Form["inputPageid"];
                bizhong = "CNY";
                if (flag != null && flag != "") //使用优惠券
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
                    //OrderModer.dm_TotalMoney = decimal.Parse(strtotalmoney) - youhuifee;
                    //OrderModer.dm_TotalMoneyGY = decimal.Parse((OrderModer.dm_TotalMoney * meihuilv).ToString());
                }
                OrderModer.nvc_YouHUiQuan = youhui.TrimStart('+');
            }
            if (checkfp.Checked)
            {
                OrderModer.i_IsFaPiao = 1;
                OrderModer.nvc_FaPiaoTaiTou = txt_fptt.Value;
                OrderModer.i_IsYouJi = 1;
                OrderModer.i_YouJiType = 1;//是否邮寄

                OrderModer.i_YouJiType = 2;
                // string youjinow = "0";
                // string youji = Request.Form["way"];
                // string fapiao = "0.00";
                //if (youji != null)
                //{
                //    string[] youjimoney = youji.Split(',');
                //    youjinow = youjimoney[1].ToString();
                //    fapiao = ((float.Parse(hi_GanfeeZhinajin.Value)) * 0.033).ToString();
                //    OrderModer.dm_YoujiFee = decimal.Parse(youjinow.ToString());
                //}
                //OrderModer.dm_FapiaoMoney = decimal.Parse(fapiao);
                OrderModer.dm_FapiaoMoney = 0;
                //string nowmoney = (float.Parse(strtotalmoney) + float.Parse(fapiao) + float.Parse(youjinow)).ToString();
                //if (youhuifee > 0)
                //{
                //    nowmoney = (float.Parse(strtotalmoney) + float.Parse(fapiao) + float.Parse(youjinow) - (float.Parse(youhuifee.ToString()))).ToString();
                //}
                // OrderModer.dm_TotalMoney = decimal.Parse(nowmoney);//国内要缴纳的总钱                   

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

            int o = DALTO.TrademarkOrder_Add(OrderModer);//增加订单
            #region 银行
            string bankId = "";
            bankId = Bind_Rpt_BankList(0, 1);

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
            foreach (var model in iquery)
            {
                #region 生成订单详情
                int trademarkid = model.i_Id;
                t_NewTrademarkOrderDetails dModer = new t_NewTrademarkOrderDetails();
                dModer.i_OrderId = OrderModer.i_Id;
                dModer.i_TrademarkId = trademarkid; //nvc_SBRegNum
                dModer.nvc_SBRegNum = model.RegisteredNo; //申请-商标注册号为空 续展-商标注册号
                dModer.nvc_SBType = model.i_Type.ToString(); //商标类型 0-申请 1续展
                dModer.nvc_SBRegName = model.ApplyName; //商标申请人名称
                //dModer.nvc_SBRegEnName = model.nvc_SBRegEnName;
                if (model.RestDays.HasValue)
                    dModer.i_ShengDays = model.RestDays.Value;
                dModer.i_JiaoFeiType = 1; //缴费类型，1代表自行缴费，2代表代理缴费
                if (model.RenewalDate.HasValue)
                    dModer.nvc_SbDaoqiTime = model.RenewalDate.Value.ToString("yyyy-MM-dd");//到期时间
                dModer.dm_TrademarkMoney = model.TrademarkMoney;
                dModer.dm_TMDaiLi = model.TrademarkAgencyFee;//代理费
                dModer.dm_ZhiNaJin= model.TrademarkLateFee;   //滞纳金

                decimal? tax = this.checkfp.Checked ? ((model.TrademarkMoney + model.TrademarkAgencyFee+model.TrademarkLateFee) * 0.033m) : 0;
                dModer.dm_ZengZhiTax = tax;//增值税

                decimal point = 0;
                if (OrderModer.nvc_PayType == "支付宝支付" || OrderModer.nvc_PayType == "网银直接支付")
                {
                    point = 0.012m;
                }
                else if (OrderModer.nvc_PayType == "财付通支付")
                {
                    point = 0.01m;
                }
                dModer.dm_ShouXuFee = (model.TrademarkMoney + model.TrademarkAgencyFee+model.TrademarkLateFee+ tax) * point;
                dModer.dm_TotalMoney = dModer.dm_ShouXuFee + dModer.dm_ZengZhiTax + model.TrademarkMoney + model.TrademarkAgencyFee+model.TrademarkLateFee;

                int ok = DALTOD.OrderDetails_Add(dModer);
                model.Status = 10;//申请中，未汇款
                //DALT.Trademark_Update(model);
                #endregion

                #region 邮件中替换的商标信息表格
                emailMarktable.Append("<tr>");
                emailMarktable.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + model.CaseNo + "</td>");
                emailMarktable.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + model.RegisteredNo + "</td>");
                emailMarktable.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + model.ApplyName + "</td>");
                emailMarktable.Append("<td align='center' bgcolor='#FFFFFF'>" + model.TrademarkType + "</td>");
                emailMarktable.Append("<td align='center' bgcolor='#FFFFFF'>" + model.RenewalDate.Value.ToString("yyyy-MM-dd") + "</td>");
                emailMarktable.Append("<td align='center' bgcolor='#FFFFFF'>" + (model.TrademarkMoney.Value + model.TrademarkAgencyFee.Value + model.TrademarkLateFee.Value).ToString("0.00") + "</td>");
                emailMarktable.Append("</tr>");
                #endregion

                UserLog.AddUserLog(uId, "商标系统", "提交订单");
            }
            mark.Trademark_Submit();

            dal_SystemSetup DALS = new dal_SystemSetup();
            t_SystemSetup ts = DALS.SystemSetup_Select();
            if (ts != null)
            {
                OrderModer.i_JiFen = DALTOD.OrderDetails_Select_Count(OrderModer.i_Id) * ts.i_SbIntergral; //一个商标赠送积分
                DALTO.TrademarkOrder_Update(OrderModer);
            }

            string emailAttachments1 = CreateWordToPDF_Total(OrderModer);
            string emailAttachments2 = CreateWordToPDF_Detail(OrderModer, iquery);
            if (!string.IsNullOrEmpty(emailAttachments1) && !string.IsNullOrEmpty(emailAttachments2))
                emailAttachments = emailAttachments1 + ";" + emailAttachments2;
            if (sbnum == 0)
            {
                div_a.InnerHtml = "<script>alert('没有要交费的商标！');localtion.href='trademark_list.aspx';</script>";
            }
            else
            {
                if (emalladdress != "")
                {
                    bool states = false;
                    string huikuanbankinfo = "";
                    if (input_payway.Value == "线下汇款")
                    {
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
                    #region 邮件中的商标订单清单和费用
                    StringBuilder strzl = new StringBuilder();
                    StringBuilder zongji = new StringBuilder();

                    strzl.Append("<table width='689' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0'>");
                    strzl.Append("<tr>");
                    strzl.Append("<td width='131' height='35' align='center' bgcolor='#FFFFFF'>案件号</td>");
                    strzl.Append("<td width='130' align='center' bgcolor='#FFFFFF'>申请号</td>");
                    strzl.Append("<td width='100' align='center' bgcolor='#FFFFFF'>申请人</td>");
                    strzl.Append("<td width='130' align='center' bgcolor='#FFFFFF'>类别</td>");
                    strzl.Append("<td width='100' align='center' bgcolor='#FFFFFF'>期限日</td>");
                    strzl.Append("<td width='100' align='center' bgcolor='#FFFFFF'>金额</td>");
                    strzl.Append("</tr>");
                    strzl.Append(emailMarktable);
                    strzl.Append("</table><br/><br/>");

                    #endregion
                    Task.Factory.StartNew(()=>{
                    BLLE.Email_Add(emalladdress, "商标缴费订单", membername + "客户(" + membernum + ")，您好！<br/>您要缴费的订单号：" + OrderModer.nvc_OrderNumber + " <br/>  下单时间为：" + OrderModer.dt_AddTime + "  <br/>  您选择" + input_payway.Value + "支付，" + huikuanbankinfo + " <br/><br/> 支付商标费用详情：<br/>" + strzl.ToString() + hi_feeinfo.Value + "<br/>请于工作日的24小时内付费！如有问题，请与环球汇通联系！<br/>咨询电话：86-10-84505596<br/>E-MAIL：pat-annuity@hqht-online.com", uId, ref states, "cn", emailAttachments);
                    });
                    // BLLE.Email_Add(emalladdress, "商标缴费订单", "您好！您要缴费的订单号：" + OrderModer.nvc_OrderNumber + " <br/>  下单时间为：" + OrderModer.dt_AddTime + "  <br/>  您选择" + input_payway.Value + "支付，" + huikuanbankinfo + " <br/><br/> 支付商标费用详情：<br/>" + hi_feeinfo.Value + "<br/>请于工作日的24小时内付费！如有问题，请与环球汇通联系！<br/>咨询电话：86-10-84505596<br/>E-MAIL：pat-annuity@hqht-online.com", uId, ref states, "cn");
                }
                Response.Redirect("trademarkrenewalOrderOk.aspx?order=" + OrderModer.i_Id + "&orderNo=" + OrderModer.nvc_OrderNumber+"&tIds=" + patentid);
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('没有要交费的商标！');localtion.href='trademark_list.aspx';</script>";
        }

    }

    #region 生成帐单
    private string CreateWordToPDF_Total(t_NewTrademarkOrder OrderModer)
    {

        #region  生成总帐单

        string tmppath = Server.MapPath("File_Zscq/template/trademarkRenewalAll.doc");
        Document doc = new Document(tmppath); //载入模板 
        foreach (Aspose.Words.Bookmark mark in doc.Range.Bookmarks)
        {
            if (mark.Name == "ClientName")
                mark.Text = this.membername;
            if (mark.Name == "OrderNo")
                mark.Text = OrderModer.nvc_OrderNumber;
            if (mark.Name == "OrderDate")
                mark.Text = OrderModer.dt_AddTime.Value.ToString("yyyy-MM-dd");
            if (mark.Name == "OrderStatus")
                mark.Text = ConvertStatus(OrderModer.i_Status);
            if (mark.Name == "DateLimit")
                mark.Text = OrderModer.dt_AddTime.Value.AddDays(3).ToString("yyyy-MM-dd"); //延长三天后的日期
            
            if (mark.Name == "guiFee")
                mark.Text = OrderModer.dm_TrademarkMoney.ToString();
            if (mark.Name == "zhinaJin")
                mark.Text = OrderModer.dm_TMZhiNaJin.ToString();
            if (mark.Name == "daliFee")
                mark.Text = OrderModer.dm_TMDaiLi.ToString();
            if (mark.Name == "taxFee")
                mark.Text = OrderModer.dm_ZengZhiTax.ToString();
            if (mark.Name == "shouxuFee")
                mark.Text = OrderModer.dm_ShouXuFee.ToString();
            if (mark.Name == "youhuiMoney")
            {
                mark.Text = OrderModer.dm_YouHuiFee > 0 ? ("-" + OrderModer.dm_YouHuiFee.ToString()) : "0";
            }
            if (mark.Name == "totalMoney")
                mark.Text = OrderModer.dm_TotalMoney.ToString();

            //string address= GetDefaultAddress(this.uId);
            if (mark.Name == "address" && !string.IsNullOrEmpty(hi_address.Value))
                mark.Text = hi_address.Value;
            if (mark.Name == "phone" && !string.IsNullOrEmpty(memberPhone))
                mark.Text = memberPhone;
            if (mark.Name == "postcode" && !string.IsNullOrEmpty(memberPostcode))
                mark.Text = memberPostcode;
        }


        int tableIndex = 3;
        if (!string.IsNullOrEmpty(OrderModer.nvc_BankId))
        {
            string[] bankids = OrderModer.nvc_BankId.Split(',');
            int k = 0;
            if (bankids.Length == 1)
            {
                Aspose.Words.Tables.Table tableBank = (Aspose.Words.Tables.Table)doc.GetChild(NodeType.Table, tableIndex, true);
                tableBank.Remove();
            }
            else
                tableIndex = 4;
            foreach (string bankid in bankids)
            {
                t_Bank bank = DALBK.Bank_Select_Id(int.Parse(bankid));

                if (doc.Range.Bookmarks["bank" + k] != null)
                {
                    Bookmark mark = doc.Range.Bookmarks["bank" + k];
                    mark.Text = bank.nvc_BankName;
                }
                if (doc.Range.Bookmarks["bankName" + k] != null)
                {
                    Bookmark mark = doc.Range.Bookmarks["bankName" + k];
                    mark.Text = bank.nvc_AccountName;
                }
                if (doc.Range.Bookmarks["bankCardNo" + k] != null)
                {
                    Bookmark mark = doc.Range.Bookmarks["bankCardNo" + k];
                    mark.Text = bank.nvc_BankNumber;
                }
                k++;
            }
        }
        else
        {
            tableIndex = 4;
        }
        DocumentBuilder builder = new DocumentBuilder(doc);
        var orderDetailsList = DALTOD.NewOrderDetails_Select_OrderId(OrderModer.i_Id);
        int rownum = 1;
        Aspose.Words.Tables.Table table = (Aspose.Words.Tables.Table)doc.GetChild(NodeType.Table, tableIndex, true);
        foreach (var detail in orderDetailsList)
        {
            var trademarkModel = mark.Trademark_Select_Id(detail.i_TrademarkId);

            if (rownum < orderDetailsList.Count())
            {
                Aspose.Words.Tables.Row beforeRow = table.Rows[rownum];
                Aspose.Words.Tables.Row clonedRow = (Aspose.Words.Tables.Row)beforeRow.Clone(true);
                table.InsertAfter(clonedRow, beforeRow);//插入到指定位置下面
            }

            builder.MoveToCell(tableIndex, rownum, 0, 0);
            builder.Write(rownum.ToString());//序号
            builder.MoveToCell(tableIndex, rownum, 1, 0);
            builder.Write(trademarkModel.CaseNo);//案件号
            builder.MoveToCell(tableIndex, rownum, 2, 0);
            builder.Write(trademarkModel.RegisteredNo);//申请号

            builder.MoveToCell(tableIndex, rownum, 3, 0);
            builder.Write(trademarkModel.TrademarkType);//类别
            builder.MoveToCell(tableIndex, rownum, 4, 0);
            builder.Write(trademarkModel.ApplyName);//权利人
            builder.MoveToCell(tableIndex, rownum, 5, 0);
            builder.Write(trademarkModel.RenewalDate.Value.ToString("yyyy-MM-dd"));//期限日
            rownum++;
        }

        string pdfPath = Server.MapPath("File_Zscq/AccountPDF/TotalBill" + OrderModer.nvc_OrderNumber + ".pdf");
        doc.Save(pdfPath, SaveFormat.Pdf);
        return pdfPath;
        #endregion

    }

    private string CreateWordToPDF_Detail(t_NewTrademarkOrder OrderModer, IQueryable<t_NewTradeMarkInfo> listMark)
    {
        #region  生成分帐单
        int orderRank = 1;
        List<string> allDetailPath = new List<string>();
        foreach (var item in listMark)
        {
            string tmppath = Server.MapPath("File_Zscq/template/trademarkRenewalDetail.doc");
            Document doc = new Document(tmppath); //载入模板 
            decimal? tax = this.checkfp.Checked ? ((item.TrademarkMoney+item.TrademarkAgencyFee+item.TrademarkLateFee) * 0.033m) : 0;//增值税
            decimal? shouxuFee = 0;
            decimal youhimoney = 0;
            decimal point = 0;
            if (OrderModer.nvc_PayType == "支付宝支付" || OrderModer.nvc_PayType == "网银直接支付")
            {
                point = 0.012m;
            }
            else if (OrderModer.nvc_PayType == "财付通支付")
            {
                point = 0.01m;
            }
            shouxuFee = (item.TrademarkMoney +item.TrademarkAgencyFee+item.TrademarkLateFee+ tax) * point;
           
            foreach (Aspose.Words.Bookmark mark in doc.Range.Bookmarks)
            {
                if (mark.Name == "ClientName")
                    mark.Text = this.membername;
                if (mark.Name == "OrderNo")
                    mark.Text = OrderModer.nvc_OrderNumber + "-" + orderRank.ToString();
                if (mark.Name == "OrderDate")
                    mark.Text = OrderModer.dt_AddTime.Value.ToString("yyyy-MM-dd");
                if (mark.Name == "OrderStatus")
                    mark.Text = ConvertStatus(OrderModer.i_Status);
                if (mark.Name == "DateLimit")
                    mark.Text = OrderModer.dt_AddTime.Value.AddDays(3).ToString("yyyy-MM-dd"); //延长三天后的日期

                if (mark.Name == "guiFee")
                    mark.Text = item.TrademarkMoney.ToString();
                if (mark.Name == "zhinaJin")
                    mark.Text = item.TrademarkLateFee.ToString();
                if (mark.Name == "daliFee")
                    mark.Text = item.TrademarkAgencyFee.ToString();
                if (mark.Name == "taxFee" && tax.HasValue)
                    mark.Text = tax.Value.ToString("0.00");

                if (mark.Name == "shouxuFee" && shouxuFee.HasValue)
                    mark.Text = shouxuFee.Value.ToString("0.00");
           
                if (mark.Name == "youhuiMoney")
                {
                    youhimoney = orderRank == 1 ? OrderModer.dm_YouHuiFee : 0;
                    mark.Text = youhimoney > 0 ? ("-" + youhimoney.ToString()) : "0";
                }
                if (mark.Name == "totalMoney")
                    mark.Text = (item.TrademarkMoney + item.TrademarkAgencyFee+item.TrademarkLateFee + tax + shouxuFee - youhimoney).Value.ToString("0.00");
                if (mark.Name == "address" && !string.IsNullOrEmpty(hi_address.Value))
                    mark.Text = hi_address.Value;
                if (mark.Name == "phone" && !string.IsNullOrEmpty(memberPhone))
                    mark.Text = memberPhone;
                if (mark.Name == "postcode" && !string.IsNullOrEmpty(memberPostcode))
                    mark.Text = memberPostcode;
            }


            int tableIndex = 4;
            if (!string.IsNullOrEmpty(OrderModer.nvc_BankId))
            {
                string[] bankids = OrderModer.nvc_BankId.Split(',');
                int k = 0;
                if (bankids.Length == 1)
                {
                    Aspose.Words.Tables.Table tableBank = (Aspose.Words.Tables.Table)doc.GetChild(NodeType.Table, tableIndex, true);
                    tableBank.Remove();
                }
                foreach (string bankid in bankids)
                {
                    t_Bank bank = DALBK.Bank_Select_Id(int.Parse(bankid));

                    if (doc.Range.Bookmarks["bank" + k] != null)
                    {
                        Bookmark mark = doc.Range.Bookmarks["bank" + k];
                        mark.Text = bank.nvc_BankName;
                    }
                    if (doc.Range.Bookmarks["bankName" + k] != null)
                    {
                        Bookmark mark = doc.Range.Bookmarks["bankName" + k];
                        mark.Text = bank.nvc_AccountName;
                    }
                    if (doc.Range.Bookmarks["bankCardNo" + k] != null)
                    {
                        Bookmark mark = doc.Range.Bookmarks["bankCardNo" + k];
                        mark.Text = bank.nvc_BankNumber;
                    }
                    k++;
                }


            }
            tableIndex = 1;
            DocumentBuilder builder = new DocumentBuilder(doc);
            int rownum = 1;
            Aspose.Words.Tables.Table table = (Aspose.Words.Tables.Table)doc.GetChild(NodeType.Table, tableIndex, true);


            builder.MoveToCell(tableIndex, rownum, 0, 0);
            builder.Write(item.CaseNo);
            builder.MoveToCell(tableIndex, rownum, 1, 0);
            builder.Write(item.RegisteredNo);

            builder.MoveToCell(tableIndex, rownum, 2, 0);
            builder.Write(item.TrademarkType);
            builder.MoveToCell(tableIndex, rownum, 3, 0);
            builder.Write(item.ApplyName);
            builder.MoveToCell(tableIndex, rownum, 4, 0);
            builder.Write(item.RenewalDate.Value.ToString("yyyy-MM-dd"));
            builder.MoveToCell(tableIndex, rownum,5, 0);
            builder.Write((item.TrademarkMoney+item.TrademarkAgencyFee+item.TrademarkLateFee).ToString());

            string pdfPath = "File_Zscq/AccountPDF/SeparateBill" + OrderModer.nvc_OrderNumber + "-" + orderRank + ".doc";
            allDetailPath.Add(pdfPath);
            doc.Save(Server.MapPath(pdfPath));
            orderRank++;
        } 
        #endregion
        if (allDetailPath.Count > 0)
        {
            Document dstDoc = new Document(Server.MapPath(allDetailPath[0]));

            foreach (string path in allDetailPath)
            {
                if (path != allDetailPath[0])
                {
                    Document srcDoc = new Document(Server.MapPath(path));
                    srcDoc.FirstSection.PageSetup.SectionStart = SectionStart.NewPage;
                    dstDoc.AppendDocument(srcDoc, ImportFormatMode.KeepSourceFormatting);
                }
            }
            string pdfPath = Server.MapPath("File_Zscq/AccountPDF/SeparateBill" + OrderModer.nvc_OrderNumber + ".pdf");
            dstDoc.Save(pdfPath);
            return pdfPath;
        }
        return "";
    }
    #endregion
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
            ids = Request.QueryString["ids"];
            string[] arr_pid = ids.Split(',');

            #region 用户资料

            t_Member muser = DALM.Member_Select_Id(uId);
            if (muser != null)
            {
                membername = muser.nvc_Name;
                membernum = muser.nvc_UserNum;
                memberPhone = muser.nvc_MobilePhone;
                memberPostcode = muser.nvc_ZipCode;
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
            sbnum = iquery.Count();
            Rpt_order.DataSource = iquery;
            Rpt_order.DataBind();

            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">商标局规费：</td><td width=\"110\" id='guifei'>" + iquery.Sum(p => p.TrademarkMoney).Value.ToString("0.00") + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">滞纳金：</td><td width=\"110\" id='zhinajin'>" + iquery.Sum(p => p.TrademarkLateFee).Value.ToString("0.00") + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">代理费：</td><td width=\"110\" id='dailifei'>" + iquery.Sum(p => p.TrademarkAgencyFee).Value.ToString("0.00") + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr class='FP' style='display:none;' align=\"left\"><td width=\"200\" align=\"right\">增值税：</td><td width=\"110\" id='tax'>" + (iquery.Sum(p => p.TrademarkMoney + p.TrademarkAgencyFee+ p.TrademarkLateFee).Value * 0.033m).ToString("0.00") + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            Str_Money.Append(" <tr align=\"left\"><td width=\"200\" align=\"right\">手续费：</td><td width=\"110\"  id='shouxufei'>" + "0" + "</td><td width=\"30\"></td><td width=\"100\"></td></tr>");
            string totalmoney = string.Empty;
            totalmoney = (iquery.Sum(p => p.TrademarkMoney + p.TrademarkAgencyFee + p.TrademarkLateFee).Value).ToString("0.00");
            hi_allmy.Value = totalmoney;
            strtotalmoney = totalmoney;
            Str_AllMoney.Append("<tr align=\"left\"><td width=\"200\" align=\"right\"></td><td width=\"110\" align=\"right\">总金额：</td><td style=\"color:red;\" width=\"30\">CNY</td><td style='color:red;width:100px;' id='allmoney'  align=\"left\">" + totalmoney + "</td></tr>");

        }
        else
        {
            Response.Redirect("trademarkrenewal_list.aspx");
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
                info = "推荐淘宝用户使用!   <span style='color:Red'>（加收1.2%手续费）</span>";
            }
            else if (q.nvc_Name == "财付通支付")
            {
                img = "&nbsp;&nbsp;<img alt=\"\" border=\"0\" src=\"images/orderimg2.jpg\">";
                info = "推荐腾讯拍拍用户使用!   <span style='color:Red'>（加收1%手续费）</span>";
            }
            tr_PayWay.Append("<tr><td width=\"29\" height=\"35\" align=\"right\" valign=\"middle\">&nbsp;");
            tr_PayWay.Append("<input id=\"payway" + shu + "\" name=\"payway\" type=\"radio\" onclick=\"change();checkpay(0);\" value=\"" + q.nvc_Name + "," + q.nt_Explain + "\"" + ischeck + " /></td>");

            tr_PayWay.Append("<td width=\"657\" align=\"left\" valign=\"middle\" class=\"huisezi\">" + img + "</td>");

            tr_PayWay.Append("<td colspan=\"4\">&nbsp;&nbsp;<label for=\"payway" + shu + "\">" + info + "</label></td></tr>");

        }

    }
    string GetDefaultAddress(int uid)
    {
        dal_Address address = new dal_Address();
        //string address = string.Empty;
        t_Member model = DALM.Member_Select_Id(uid);
        if (model.i_ProvinceId > 0 && model.i_CityId > 0 && model.i_AreaId > 0)
        {
            string division = address.Set_AddressName_PId_CId_AId(model.i_ProvinceId, model.i_CityId, model.i_AreaId);

            //vw_ReceiveAddress dizhi = DALRA.ReceiveAddress_vw_Select_Id(model.i_DefaultAddress);
            //if (dizhi != null)
            //{
            //    address = dizhi.provinceName + " " + dizhi.cityName + " " + dizhi.areaName + " " + dizhi.nvc_StreetAddress;
            //    //Ltl_DefaultAddress.Text = address;
            //}
            //else
            //{
            //    // s_adress.Style["display"] = "block";
            //}
            return division;
        }
        return string.Empty;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // Response.Cookies["hqht_Trademarktidstr"].Value = null;
        Response.Redirect("trademarkrenewal_list.aspx");
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

    public string ConvertStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkOrderStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
    }
}