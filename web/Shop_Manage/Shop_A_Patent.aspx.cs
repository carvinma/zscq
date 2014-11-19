using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_Shop_A_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(11, 0);
    public bool pageadd = Manager.GetManagerQX(11, 1);
    public bool pageupdate = Manager.GetManagerQX(11, 2);
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Patent DALP = new dal_Patent();
    dal_PatentFee DALPF = new dal_PatentFee();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_Member DALM = new dal_Member();
    public string PageType = "添加专利";
    public StringBuilder img_color = new StringBuilder();
    public string returnurl = "";
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
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
            if (returnurl.LastIndexOf("ye=") > -1)
            {
                returnurl = returnurl.Substring(returnurl.LastIndexOf("ye="));
            }

        }
        if (!IsPostBack)
        {
            Bind_Drp_PatentHolderNationalityId();
            Bind_Drp_PriorityNationalityId();
            Bind_Drp_AuthorizeNationalityId();
            Bind_Page_Info();
        }
    }
    void Bind_Drp_PatentHolderNationalityId()
    {
        Drp_PatentHolderNationalityId.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_PatentHolderNationalityId.Items.Add(li);
        }
    }
    void Bind_Drp_PriorityNationalityId()
    {
        Drp_PriorityNationalityId.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_PriorityNationalityId.Items.Add(li);
        }
    }
    void Bind_Drp_AuthorizeNationalityId()
    {
        Drp_AuthorizeNationalityId.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_AuthorizeNationalityId.Items.Add(li);
        }
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null)
        {
            PageType = "修改专利";
            hd_id.Value = Request.QueryString["id"].ToString();
            #region 更新费用
            t_Patent tp = DALP.Patent_Select_Id(Convert.ToInt32(hd_id.Value));
            if (tp != null)
            {
                DALP.EditPatentFee(tp);
            }
            #endregion
            vw_Patent model = DALP.Patent_SelectView_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                hd_userId.Value = model.nvc_UserNum;
                hd_yaoqiuxiang.Value = model.i_QuanLiYaoQiu.ToString();

                txt_MemberId.Value = model.nvc_UserNum;
                txt_Number.Value = model.nvc_Number;
                txt_Name.Value = model.nvc_Name;
                Bind_PatentType(model.i_AuthorizeNationalityId);
                Drp_PatentType.SelectedValue = model.i_PatentType.ToString();
                txt_PatentHolder.Value = model.nvc_PatentHolder;
                txt_yaoqiuxiang.Value = model.i_YaoQiuXiang.ToString();
                Drp_PatentHolderNationalityId.SelectedValue = model.i_PatentHolderNationalityId.ToString();
                txt_PatentInventor.Value = model.nvc_PatentInventor;
                //txt_PatentKeyWord.Value = model.nvc_PatentKeyWord;
                //txt_PatentProductModel.Value = model.nvc_PatentProductModel;
                Drp_PatentScope.SelectedValue = model.nvc_PatentScope;
                txt_PriorityNumber.Value = model.nvc_PriorityNumber;
                Drp_PriorityNationalityId.SelectedValue = model.i_PriorityNationalityId.ToString();
                if (model.dt_PriorityDate != null && model.dt_PriorityDate.ToString() != "")
                {
                    txt_PriorityDate.Value = Convert.ToDateTime(model.dt_PriorityDate).ToShortDateString();
                }
                if (model.dt_PtcDate != null && model.dt_PtcDate.ToString() != "")
                {
                    txt_PtcDate.Value = Convert.ToDateTime(model.dt_PtcDate).ToShortDateString();
                }
                txt_PtcNumber.Value = model.nvc_PtcNumber;
                Drp_AuthorizeNationalityId.SelectedValue = model.i_AuthorizeNationalityId.ToString();
                //txt_ApplicationMumber.Value = model.nvc_ApplicationMumber;
                txt_AuthorizeIsNationalityDate.Value = Convert.ToDateTime(model.dt_AuthorizeIsNationalityDate).ToShortDateString();

                txt_AuthorizeIsAuthorizeDate.Value = model.dt_AuthorizeIsAuthorizeDate != null ? Convert.ToDateTime(model.dt_AuthorizeIsAuthorizeDate).ToShortDateString() : "";
                //txt_AuthorizeAgency.Value = model.nvc_AuthorizeAgency;
                //txt_AuthorizeAgent.Value = model.nvc_AuthorizeAgent;
                txt_AnnualFeeYear.Value = model.i_AnnualFeeYear.ToString();
                txt_AnnualFeeRestYear.Value = model.i_AnnualFeeRestYear.ToString();
                txt_AnnualFeeDateStart.Value = Convert.ToDateTime(model.dt_AnnualFeeDateStart).ToShortDateString();
                txt_AnnualFeeDateEnd.Value = Convert.ToDateTime(model.dt_AnnualFeeDateEnd).ToShortDateString();
                Drp_AnnualFeeStatus.SelectedValue = model.i_AnnualFeeStatus.ToString();
                //txt_AnnualFeeSumMoney.Value = model.dm_AnnualFeeSumMoney.ToString();
                Bind_txt_AnnualFeePaymentYear();
                txt_AnnualFeePaymentYear.SelectedValue = model.nvc_AnnualFeePaymentYear;
                if (model.i_AnnualFeeStatus != 13)//不是已完成所有年度缴费
                {
                    txt_AnnualFeeNotPaymentYear.Value = model.nvc_AnnualFeeNotPaymentYear;
                    txt_AnnualFeePrevYear.Value = Convert.ToDateTime(model.dt_AnnualFeePrevYear).ToShortDateString();
                    txt_AnnualFeeNextYear.Value = Convert.ToDateTime(model.dt_AnnualFeeNextYear).ToShortDateString();
                    txt_AnnualFeeRestDay.Value = model.i_AnnualFeeRestDay.ToString();

                    txt_AnnualFeeNextPaymentMoney.Value = model.dm_AnnualFeeNextPaymentMoney.ToString();
                    txt_RemittanceFee.Value = model.dm_RemittanceFee.ToString();
                    txt_AgentServiceFee.Value = model.dm_AgentServiceFee.ToString();
                    txt_chaoxiang.Value = model.dm_ChaoXiangFee.ToString();
                    #region 滞纳金
                    //滞纳金算法 根据专利类型和专利年度得到专利费用的滞纳金 然后根据专利的到期剩余天数 算出专利过期几个月 
                    //dt_AnnualFeeNextYear到期日期
                    //i_AnnualFeeRestDay到期剩余天数 每天都会减一
                    //if (model.i_AnnualFeeRestDay < 0)
                    //{
                    //    string str = DALP.GetZhiNaJinByPatentInfo(model.i_AnnualFeeRestDay, model.i_PatentType, model.nvc_AnnualFeeNotPaymentYear);
                    //    txt_zhinajin.Value = str.Split(',')[1];
                    //    t_Patent tp = DALP.Patent_Select_Id(model.i_Id);
                    //    tp.nvc_ZhiNaJin = str.Split(',')[1];
                    //    tp.dm_FeeSubtotal += Convert.ToDecimal(str.Split(',')[1]);
                    //    DALP.Patent_Update(tp);
                    //}
                    txt_zhinajin.Value = model.nvc_ZhiNaJin;
                    #endregion
                    txt_FeeSubtotal.Value = model.dm_FeeSubtotal.ToString();
                    txt_CurrencyType.Value = model.nvc_CurrencyType;


                    hf_guanfei.Value = model.dm_AnnualFeeNextPaymentMoney.ToString();//
                    hf_total.Value = model.dm_FeeSubtotal.ToString();
                }
                //cb_Receipt.Checked = model.i_Receipt == 1 ? true : false;
                //txt_ReceiptWay.Value = model.nvc_ReceiptWay;
                //cb_Invoice.Checked = model.i_Invoice == 1 ? true : false;
                //txt_InvoiceWay.Value = model.nvc_InvoiceWay;
                //txt_InvoiceName.Value = model.nvc_InvoiceName;
                nt_Remarks.Value = model.nt_Remarks;
                txt_OrderBy.Value = model.i_OrderBy.ToString();

                txt_anjuanhao.Value = model.nvc_AnJuanNum;
                txt_linkman.Value = model.nvc_LinkMan;
                txt_address.Value = model.nvc_Address;
                txt_phone.Value = model.nvc_Phone;
                txt_jianmian1.Value = model.i_JianMian1.ToString();

                cb_Show.Checked = model.i_Show == 1 ? true : false;
                cb_ReceiveEmail.Checked = model.i_ReceiveEmail == 1 ? true : false;
            }
        }
        else
        {
            txt_OrderBy.Value = DALP.Patent_SelectCount().ToString();
        }
    }
    protected void btOK_Click(object sender, EventArgs e)
    {
        t_Patent model = new t_Patent();
        int memberid = 0;
        if (hd_id.Value != "0")
        {
            model = DALP.Patent_Select_Id(Convert.ToInt32(hd_id.Value));
        }
        try
        {
            t_Member tm = DALM.Member_Select_ByUserNum(txt_MemberId.Value);
            if (tm != null)
            {
                memberid = tm.i_Id;
            }
            model.i_MemberId = memberid;
        }
        catch { }

        model.nvc_Number = txt_Number.Value;
        model.nvc_Name = txt_Name.Value;
        try
        {
            model.i_PatentType = int.Parse(Drp_PatentType.SelectedValue);
        }
        catch { }
        try
        {
            model.i_YaoQiuXiang = int.Parse(txt_yaoqiuxiang.Value);
        }
        catch { }
        model.nvc_PatentHolder = txt_PatentHolder.Value;
        try
        {
            model.i_PatentHolderNationalityId = int.Parse(Drp_PatentHolderNationalityId.SelectedValue);
        }
        catch { }
        model.nvc_PatentInventor = txt_PatentInventor.Value;
        //model.nvc_PatentKeyWord = txt_PatentKeyWord.Value;
        //model.nvc_PatentProductModel = txt_PatentProductModel.Value;
        model.nvc_PatentScope = Drp_PatentScope.SelectedValue;
        model.nvc_PriorityNumber = txt_PriorityNumber.Value;
        try
        {
            model.i_PriorityNationalityId = int.Parse(Drp_PriorityNationalityId.SelectedValue);
        }
        catch { }

        model.dt_PriorityDate = null;
        if (txt_PriorityDate.Value != "")
        {
            model.dt_PriorityDate = Convert.ToDateTime(txt_PriorityDate.Value);
        }

        model.nvc_PtcNumber = txt_PtcNumber.Value;
        model.dt_PtcDate = null;
        if (txt_PtcDate.Value != "")
        {
            model.dt_PtcDate = Convert.ToDateTime(txt_PtcDate.Value);
        }
        try
        {
            model.i_AuthorizeNationalityId = int.Parse(Drp_AuthorizeNationalityId.SelectedValue);
        }
        catch { }
        //model.nvc_ApplicationMumber = txt_ApplicationMumber.Value;
        if (txt_AuthorizeIsNationalityDate.Value != "")
        {
            model.dt_AuthorizeIsNationalityDate = Convert.ToDateTime(txt_AuthorizeIsNationalityDate.Value);
        }
        try
        {
            if (Convert.ToDateTime(txt_AuthorizeIsAuthorizeDate.Value) < DateTime.Now.AddYears(-100))
            {
                model.dt_AuthorizeIsAuthorizeDate = null;
            }
            else
            {
                model.dt_AuthorizeIsAuthorizeDate = Convert.ToDateTime(txt_AuthorizeIsAuthorizeDate.Value);
            }
        }
        catch { }
        //model.nvc_AuthorizeAgency = txt_AuthorizeAgency.Value;
        //model.nvc_AuthorizeAgent = txt_AuthorizeAgent.Value;
        try
        {
            model.i_AnnualFeeYear = int.Parse(txt_AnnualFeeYear.Value);
        }
        catch { }
        try
        {
            model.i_AnnualFeeRestYear = int.Parse(txt_AnnualFeeRestYear.Value);
        }
        catch { }
        if (txt_AnnualFeeDateStart.Value != "")
        {
            model.dt_AnnualFeeDateStart = Convert.ToDateTime(txt_AnnualFeeDateStart.Value);
        }
        if (txt_AnnualFeeDateEnd.Value != "")
        {
            model.dt_AnnualFeeDateEnd = Convert.ToDateTime(txt_AnnualFeeDateEnd.Value);
        }

        try
        {
            model.i_AnnualFeeStatus = int.Parse(Drp_AnnualFeeStatus.SelectedValue);
        }
        catch { }
        try
        {
            // model.dm_AnnualFeeSumMoney = Convert.ToDecimal(txt_AnnualFeeSumMoney.Value);
        }
        catch { }
        model.nvc_AnnualFeePaymentYear = txt_AnnualFeePaymentYear.SelectedValue;
        model.nvc_AnnualFeeNotPaymentYear = txt_AnnualFeeNotPaymentYear.Value;
        if (model.i_AnnualFeeStatus != 13)//不是已完成所有年度缴费
        {
            if (txt_AnnualFeePrevYear.Value != "")
            {
                model.dt_AnnualFeePrevYear = Convert.ToDateTime(txt_AnnualFeePrevYear.Value);
            }
            if (txt_AnnualFeeNextYear.Value != "")
            {
                model.dt_AnnualFeeNextYear = Convert.ToDateTime(txt_AnnualFeeNextYear.Value);
            }
            try
            {
                model.i_AnnualFeeRestDay = int.Parse(txt_AnnualFeeRestDay.Value);
            }
            catch { }
            try
            {
                model.dm_AnnualFeeNextPaymentMoney = Convert.ToDecimal(txt_AnnualFeeNextPaymentMoney.Value);
            }
            catch { }
            try
            {
                model.dm_RemittanceFee = Convert.ToDecimal(txt_RemittanceFee.Value);
            }
            catch { }
            try
            {
                model.dm_AgentServiceFee = Convert.ToDecimal(txt_AgentServiceFee.Value);
            }
            catch { }
            try
            {
                model.dm_ChaoXiangFee = Convert.ToDecimal(txt_chaoxiang.Value);
            }
            catch { }
            try
            {
                model.dm_FeeSubtotal = Convert.ToDecimal(txt_FeeSubtotal.Value);
            }
            catch { }

            model.nvc_CurrencyType = txt_CurrencyType.Value;
        }
        //model.i_Receipt = cb_Receipt.Checked == true ? 1 : 0;
        //model.nvc_ReceiptWay = txt_ReceiptWay.Value;
        //model.i_Invoice = cb_Invoice.Checked == true ? 1 : 0;
        //model.nvc_InvoiceWay = txt_InvoiceWay.Value;
        //model.nvc_InvoiceName = txt_InvoiceName.Value;
        model.nt_Remarks = nt_Remarks.Value;
        model.nvc_AnJuanNum = txt_anjuanhao.Value;
        model.nvc_LinkMan = txt_linkman.Value;
        model.nvc_Address = txt_address.Value;
        model.nvc_Phone = txt_phone.Value;
        model.i_JianMian1 = 0;
        if (txt_jianmian1.Value != "")
        {
            model.i_JianMian1 = Convert.ToInt32(txt_jianmian1.Value);
        }
        model.i_JianMian2 = 0;
        //if (txt_jianmian1.Value != "")
        //{
        //    model.i_JianMian2 = Convert.ToInt32(txt_jianmian2.Value);
        //}
        //model.nvc_ZhiNaJin = txt_zhinajin1.Value + "-" + txt_zhinajin2.Value + "-" + txt_zhinajin3.Value + "-" + txt_zhinajin4.Value + "-" + txt_zhinajin5.Value + "-" + txt_zhinajin6.Value; 
        if (txt_OrderBy.Value != "")
        {
            model.i_OrderBy = int.Parse(txt_OrderBy.Value);
        }
        else
        {
            model.i_OrderBy = DALP.Patent_SelectCount();
        }
        model.i_Show = cb_Show.Checked == true ? 1 : 0;
        model.i_ReceiveEmail = cb_ReceiveEmail.Checked == true ? 1 : 0;
        if (hd_id.Value != "0")
        {
            if (DALP.Patent_Select_Number(model.nvc_Number, model.i_AuthorizeNationalityId, model.i_MemberId, model.i_Id) <= 0)
            {
                model.dt_EditTime = DateTime.Now;
                if (DALP.Patent_Update(model) == 1)
                {
                    Manager.AddLog(0, "专利管理", "修改了专利[ <font color=\"red\">" + model.nvc_Name + "</font> ]的信息");//修改专利日志
                    string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Patent.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                    Response.Redirect("shop_manageok.aspx?hrefname=专利&hreftype=2&href1=Shop_A_Patent.aspx&href2=" + twourl);
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('专利号重复')</script>";
            }
        }
        else
        {
            if (DALP.Patent_Select_Number(model.nvc_Number, model.i_AuthorizeNationalityId, model.i_MemberId, 0) <= 0)
            {
                model.dt_AddTime = DateTime.Now;
                if (DALP.Patent_Add(model) > 0)
                {
                    #region 生成订单 已注释
                    //t_PatentOrder OrderModer = new t_PatentOrder();
                    //OrderModer.nvc_OrderNumber = "Z" + ((DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000).ToString();
                    //OrderModer.i_UserId = memberid;
                    //OrderModer.i_Status = 1;
                    //OrderModer.dm_SetMoney = Convert.ToDecimal(txt_AnnualFeeNextPaymentMoney.Value);
                    //OrderModer.dm_RemittanceFee = Convert.ToDecimal(txt_RemittanceFee.Value);
                    //OrderModer.dm_AgentServiceFee = Convert.ToDecimal(txt_AgentServiceFee.Value);
                    //OrderModer.dm_ChaoXiangFee = Convert.ToDecimal(txt_chaoxiang.Value);
                    //OrderModer.dm_TotalMoney = Convert.ToDecimal(txt_FeeSubtotal.Value);
                    //OrderModer.nvc_CurrencyType = txt_CurrencyType.Value;
                    //OrderModer.dm_PsMoney = 0;
                    //OrderModer.dm_CouponMoney = 0;
                    //OrderModer.dm_InvoiceMoney = 0;
                    //OrderModer.dt_AddTime = DateTime.Now;
                    //OrderModer.dt_PayMoneyTime = DateTime.Now;
                    //DALPO.PatentOrder_Add(OrderModer);
                    #endregion

                    #region 生成订单详情 已注释
                    //t_PatentOrderInfo InfoModer = new t_PatentOrderInfo();
                    //    #region 缴费国家币种
                    //    t_Member tm = DALM.Member_Select_Id(model.i_MemberId);
                    //    t_Nationality tn = DALN.Nationality_Select_Id(tm.i_GuoJiId);
                    //    string paybizhong = "";
                    //    if (tn != null)
                    //    {
                    //        paybizhong = tn.nvc_JFBizhong;//费用缴纳国家币种
                    //    }
                    //    #endregion
                    //    InfoModer.i_OrderId = OrderModer.i_Id;
                    //    InfoModer.i_PatentId = model.i_Id;
                    //    InfoModer.nvc_Year = model.nvc_AnnualFeePaymentYear;

                    //    InfoModer.dm_ZhengFuGuiDingFei = model.dm_AnnualFeeNextPaymentMoney;
                    //    InfoModer.dm_HuiKuanShouXuFei = model.dm_RemittanceFee;
                    //    InfoModer.dm_DaiLiFuWuFei = model.dm_AgentServiceFee;
                    //    InfoModer.dm_ChaoXiangFei = model.dm_ChaoXiangFee;
                    //    InfoModer.dm_ZhiNaJin = Convert.ToDecimal(model.nvc_ZhiNaJin);
                    //    InfoModer.dm_TotalMoney = model.dm_FeeSubtotal;
                    //    InfoModer.nvc_BiZhong = model.nvc_CurrencyType;

                    //    InfoModer.dm_ZhengFuGuiDingFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_AnnualFeeNextPaymentMoney, model.nvc_CurrencyType, paybizhong);
                    //    InfoModer.dm_HuiKuanShouXuFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_RemittanceFee, model.nvc_CurrencyType, paybizhong);
                    //    InfoModer.dm_DaiLiFuWuFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_AgentServiceFee, model.nvc_CurrencyType, paybizhong);
                    //    InfoModer.dm_ChaoXiangFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_ChaoXiangFee, model.nvc_CurrencyType, paybizhong);
                    //    InfoModer.dm_ZhiNaJin1 = DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(model.nvc_ZhiNaJin), model.nvc_CurrencyType, paybizhong);
                    //    InfoModer.dm_TotalMoney1 = DALPO.GetPayMoneyByHuiLv(model.dm_FeeSubtotal, model.nvc_CurrencyType, paybizhong);
                    //    InfoModer.nvc_BiZhong1 = paybizhong;

                    //    InfoModer.nvc_PatentNumber = model.nvc_Name;
                    //    InfoModer.nvc_PatentName = model.nvc_Number;
                    //    InfoModer.nvc_PatentShouQuanGuo = DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_Name;
                    //    InfoModer.dt_PatentJiaoFeeQiXian = model.dt_AnnualFeeNextYear;
                    //    InfoModer.i_PatentShouQuanGuoId = model.i_AuthorizeNationalityId;
                    //DALPOI.PatentOrderInfo_Add(InfoModer);

                    #endregion

                    Manager.AddLog(0, "专利管理", "添加了专利[ <font color=\"red\">" + model.nvc_Name + "</font> ]");//添加专利日志
                    string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Patent.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                    Response.Redirect("shop_manageok.aspx?hrefname=专利&hreftype=1&href1=Shop_A_Patent.aspx&href2=" + twourl);
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('专利号重复')</script>";
            }

        }
    }
    protected void Drp_AuthorizeNationalityId_SelectedIndexChanged(object sender, EventArgs e)
    {
        Drp_PatentType.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_PatentType.Items.Add(item);
        if (Drp_AuthorizeNationalityId.SelectedValue != "0")
        {
            int count = 0;
            var iquery = DALPT.PatentType_SelectPage(1, 10, int.Parse(Drp_AuthorizeNationalityId.SelectedValue), ref count);
            foreach (var q in iquery)
            {
                ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
                this.Drp_PatentType.Items.Add(li);
            }
        }
    }
    protected void Drp_PatentType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_txt_AnnualFeePaymentYear();
    }

    void Bind_PatentType(int typeid)
    {
        int count = 0;
        var iquery = DALPT.PatentType_SelectPage(1, 10, typeid, ref count);
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            this.Drp_PatentType.Items.Add(li);
        }
    }
    void Bind_txt_AnnualFeePaymentYear()
    {
        txt_AnnualFeePaymentYear.Items.Clear();
        int gid = int.Parse(Drp_AuthorizeNationalityId.SelectedValue);
        int tid = int.Parse(Drp_PatentType.SelectedValue);
        int count = 0;
        ListItem item = new ListItem("请选择", "0");
        txt_AnnualFeePaymentYear.Items.Add(item);
        var iquery = DALPF.PatentFee_SelectPage(1, 30, gid, tid, ref count);
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Year, q.nvc_Year);
            txt_AnnualFeePaymentYear.Items.Add(li);
        }
    }
}