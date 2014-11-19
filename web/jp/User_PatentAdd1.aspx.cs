using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentAdd1 : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Patent DALP = new dal_Patent();
    dal_PatentFee DALPF = new dal_PatentFee();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    string uNumebr = "";
    int uId = 0;
    public int Power_Into = 0, Power_Export = 0, Power_Update = 0, Power_Delete = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            DALM.GetMemberPower(uId, ref Power_Into, ref Power_Export, ref Power_Update, ref Power_Delete);
            if (Power_Into == 0)
            {
                Response.Redirect("user_pageinfo.aspx");
            }
        }
        if (!IsPostBack)
        {
            Bind_Drp_AuthorizeNationalityId();
            Bind_Drp_PatentHolderNationalityId();
            Bind_Drp_PriorityNationalityId();
            Bind_Page_Info();
        }
    }
    protected void ImgBtn_Add_Click(object sender, ImageClickEventArgs e)//添加修改专利
    {
        t_Patent model = new t_Patent();
        if (hd_id.Value != "0")
        {
            model = DALP.Patent_Select_Id(Convert.ToInt32(hd_id.Value));
        }
        try
        {
            model.i_MemberId = uId;
        }
        catch { }
        model.nvc_Number = txt_Number.Value.Trim();
        model.nvc_Name = txt_Name.Value.Trim();
        try
        {
            //model.i_PatentType = int.Parse(Drp_PatentType.SelectedValue);
            model.i_PatentType = int.Parse(Hi_PatentTypeId.Value);
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
        //model.nvc_PatentScope = Drp_PatentScope.SelectedValue;
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
            //model.i_AuthorizeNationalityId = int.Parse(Drp_AuthorizeNationalityId.SelectedValue);
            model.i_AuthorizeNationalityId = int.Parse(Hi_ShouQuanGuoId.Value);
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
            catch {
                model.dm_ChaoXiangFee = 0;
            }
            try
            {
                model.dm_FeeSubtotal = Convert.ToDecimal(txt_FeeSubtotal.Value);
            }
            catch { }
        }
        model.nvc_CurrencyType = txt_CurrencyType.Value;
        //model.i_Receipt = cb_Receipt.Checked == true ? 1 : 0;
        //model.nvc_ReceiptWay = txt_ReceiptWay.Value;
        //model.i_Invoice = cb_Invoice.Checked == true ? 1 : 0;
        //model.nvc_InvoiceWay = txt_InvoiceWay.Value;
        //model.nvc_InvoiceName = txt_InvoiceName.Value;
        model.nt_Remarks = nt_Remarks.Value.Length > 500 ? "" : nt_Remarks.Value;
        model.nvc_AnJuanNum = txt_anjuanhao.Value;
        model.nvc_LinkMan = txt_linkman.Value;
        model.nvc_Address = txt_address.Value;
        model.nvc_Phone = txt_phone.Value;
        model.i_JianMian1 = 0;
        model.i_ReceiveEmail = 1;
        if (txt_jianmian1.Value != "")
        {
            model.i_JianMian1 = Convert.ToInt32(txt_jianmian1.Value);
        }
        model.i_JianMian2 = 0;
        //if (txt_jianmian1.Value != "")
        //{
        //    model.i_JianMian2 = Convert.ToInt32(txt_jianmian2.Value);
        //}
        model.nvc_ZhiNaJin = txt_zhinajin.Value;
        if (txt_OrderBy.Value != "")
        {
            model.i_OrderBy = int.Parse(txt_OrderBy.Value);
        }
        else
        {
            model.i_OrderBy = DALP.Patent_SelectCount();
        }
        if (hd_id.Value != "0")
        {
            if (DALP.Patent_Select_Number(model.nvc_Number, model.i_AuthorizeNationalityId, model.i_MemberId, model.i_Id) <= 0)
            {
                model.dt_EditTime = DateTime.Now;
                if (DALP.Patent_Update(model) == 1)
                {
                    UserLog.AddUserLog(uId, "专利系统", "更新专利信息");
                    Response.Redirect("User_PatentList.aspx");
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('特許番号を繰り返すことはできない')</script>";
            }

        }
        else
        {
            if (DALP.Patent_Select_Number(model.nvc_Number, model.i_AuthorizeNationalityId, model.i_MemberId, 0) <= 0)
            {
                model.dt_AddTime = DateTime.Now;
                if (DALP.Patent_Add(model) > 0)
                {
                    UserLog.AddUserLog(uId, "专利系统", "添加专利");
                    Response.Redirect("User_PatentAddOk.aspx?AddType=成功添加专利&AddOkCount=1");
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('特許番号を繰り返すことはできない')</script>";
            }
        }

    }
    void Bind_Page_Info()//初始化专利信息
    {
        try
        {
            uNumebr = DALM.Member_Select_Id(uId).nvc_UserNum;
            if (DALM.Member_Select_Id(uId).i_UserTypeId == 3)
            {
                disanfang.Visible = true;
            }
            else
            {
                disanfang.Visible = false;
            }
            txt_MemberId.Value = uNumebr;
            if (Request["pId"] != null)
            {
                if (DALPO.PanDuanJiaoFeeShow(uId, Convert.ToInt32(Request["pId"])))
                {
                    ImgBtn_Add.Visible = false;
                }
                DALM.GetMemberPower(uId, ref Power_Into, ref Power_Export, ref Power_Update, ref Power_Delete);
                if (Power_Update == 0)
                {
                    ImgBtn_Add.Visible = false;
                    //Response.Redirect("user_pageinfo.aspx?href=" + Request.UrlReferrer.ToString());
                    Response.Redirect("user_pageinfo.aspx");
                }
                hd_id.Value = Request["pId"].ToString();
                #region 更新费用
                t_Patent tp = DALP.Patent_Select_Id(Convert.ToInt32(hd_id.Value));
                if (tp != null)
                {
                    DALP.EditPatentFee(tp);
                }
                #endregion
                vw_Patent model = DALP.Patent_SelectView_Id(int.Parse(hd_id.Value));
                if (model != null)
                {
                    hd_userId.Value = model.nvc_UserNum;
                    hd_yaoqiuxiang.Value = model.i_QuanLiYaoQiu.ToString();

                    txt_Number.Value = model.nvc_Number;
                    //txt_Name.Value = model.nvc_Name;
                    div_name.InnerHtml = model.nvc_Name;
                    div_name.Attributes["style"] = "display:none";

                    //Bind_PatentType(model.i_AuthorizeNationalityId);
                    //Drp_PatentType.SelectedValue = model.i_PatentType.ToString();
                    Hi_PatentTypeId.Value = model.i_PatentType.ToString();
                    txt_PatentHolder.Value = model.nvc_PatentHolder;
                    txt_yaoqiuxiang.Value = model.i_YaoQiuXiang.ToString();
                    Drp_PatentHolderNationalityId.SelectedValue = model.i_PatentHolderNationalityId.ToString();
                    txt_PatentInventor.Value = model.nvc_PatentInventor;

                    //Drp_PatentScope.SelectedValue = model.nvc_PatentScope;
                    txt_PriorityNumber.Value = model.nvc_PriorityNumber;
                    Drp_PriorityNationalityId.SelectedValue = model.i_PriorityNationalityId.ToString();
                    if (model.dt_PriorityDate != null && model.dt_PriorityDate.ToString()!="")
                    {
                        txt_PriorityDate.Value = Convert.ToDateTime(model.dt_PriorityDate).ToShortDateString();
                    }
                    if (model.dt_PtcDate != null && model.dt_PtcDate.ToString() != "")
                    {
                        txt_PtcDate.Value = Convert.ToDateTime(model.dt_PtcDate).ToShortDateString();
                    }
                    txt_PtcNumber.Value = model.nvc_PtcNumber;
                    
                    //Drp_AuthorizeNationalityId.SelectedValue = model.i_AuthorizeNationalityId.ToString();
                    Hi_ShouQuanGuoId.Value = model.i_AuthorizeNationalityId.ToString();

                    txt_AuthorizeIsNationalityDate.Value = Convert.ToDateTime(model.dt_AuthorizeIsNationalityDate).ToShortDateString();
                    txt_AuthorizeIsAuthorizeDate.Value = model.dt_AuthorizeIsAuthorizeDate !=null ?Convert.ToDateTime(model.dt_AuthorizeIsAuthorizeDate).ToShortDateString():"";

                    txt_AnnualFeeYear.Value = model.i_AnnualFeeYear.ToString();
                    txt_AnnualFeeRestYear.Value = model.i_AnnualFeeRestYear.ToString();
                    txt_AnnualFeeDateStart.Value = Convert.ToDateTime(model.dt_AnnualFeeDateStart).ToShortDateString();
                    txt_AnnualFeeDateEnd.Value = Convert.ToDateTime(model.dt_AnnualFeeDateEnd).ToShortDateString();
                    Drp_AnnualFeeStatus.SelectedValue = model.i_AnnualFeeStatus.ToString();
                    hd_xuanxiang.Value = model.i_AnnualFeeStatus.ToString();
                    //Bind_txt_AnnualFeePaymentYear();
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
                        if (model.i_AnnualFeeRestDay < 0)
                        {
                            tr_zhinajin.Visible = true;
                            txt_zhinajin.Value =  model.nvc_ZhiNaJin;
                        }
                        #endregion
                        txt_FeeSubtotal.Value = model.dm_FeeSubtotal.ToString();
                        txt_CurrencyType.Value = model.nvc_CurrencyType;
                    }
                    
                    nt_Remarks.Value = model.nt_Remarks;
                    txt_OrderBy.Value = model.i_OrderBy.ToString();

                    txt_anjuanhao.Value = model.nvc_AnJuanNum;
                    txt_linkman.Value = model.nvc_LinkMan;
                    txt_address.Value = model.nvc_Address;
                    txt_phone.Value = model.nvc_Phone;
                    if (model.i_JianMian1!=0)
                    {
                        tr_jianmian1.Visible = true;
                        txt_jianmian1.Value = model.i_JianMian1.ToString()+"%";
                    }
                }
            }
            else
            {
                txt_OrderBy.Value = DALP.Patent_SelectCount().ToString();
            }
        }
        catch { }
    }
    //protected void Drp_AuthorizeNationalityId_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Drp_PatentType.Items.Clear();
    //    ListItem item = new ListItem("選択して下さい", "0");
    //    Drp_PatentType.Items.Add(item);
    //    if (Drp_AuthorizeNationalityId.SelectedValue != "0")
    //    {
    //        int count = 0;
    //        var iquery = DALPT.PatentType_SelectPage(1, 10, int.Parse(Drp_AuthorizeNationalityId.SelectedValue), ref count);
    //        foreach (var q in iquery)
    //        {
    //            ListItem li = new ListItem(q.nvc_JapaneseName, q.i_Id.ToString());
    //            this.Drp_PatentType.Items.Add(li);
    //        }
    //    }
    //}
    //protected void Drp_PatentType_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Bind_txt_AnnualFeePaymentYear();
    //}
    //void Bind_PatentType(int typeid)
    //{
    //    int count = 0;
    //    var iquery = DALPT.PatentType_SelectPage(1, 10, typeid, ref count);
    //    foreach (var q in iquery)
    //    {
    //        ListItem li = new ListItem(q.nvc_JapaneseName, q.i_Id.ToString());
    //        this.Drp_PatentType.Items.Add(li);
    //    }
    //}
    //void Bind_txt_AnnualFeePaymentYear()
    //{
    //    txt_AnnualFeePaymentYear.Items.Clear();
    //    int gid = int.Parse(Drp_AuthorizeNationalityId.SelectedValue);
    //    int tid = int.Parse(Drp_PatentType.SelectedValue);
    //    int count = 0;
    //    ListItem item = new ListItem("選択して下さい", "0");
    //    txt_AnnualFeePaymentYear.Items.Add(item);
    //    var iquery = DALPF.PatentFee_SelectPage(1, 30, gid, tid, ref count);
    //    foreach (var q in iquery)
    //    {
    //        ListItem li = new ListItem(q.nvc_Year, q.nvc_Year);
    //        txt_AnnualFeePaymentYear.Items.Add(li);
    //    }
    //}
    void Bind_Drp_AuthorizeNationalityId()// 绑定国籍
    {
        Drp_AuthorizeNationalityId.Items.Clear();
        ListItem item = new ListItem("選択して下さい", "0");
        Drp_AuthorizeNationalityId.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_JpanName, q.i_Id.ToString());
            Drp_AuthorizeNationalityId.Items.Add(li);
        }
    }
    void Bind_Drp_PatentHolderNationalityId()// 绑定国籍
    {
        Drp_PatentHolderNationalityId.Items.Clear();
        ListItem item = new ListItem("選択して下さい", "0");
        Drp_PatentHolderNationalityId.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_JpanName, q.i_Id.ToString());
            Drp_PatentHolderNationalityId.Items.Add(li);
        }
    }
    void Bind_Drp_PriorityNationalityId()// 绑定国籍
    {
        Drp_PriorityNationalityId.Items.Clear();
        ListItem item = new ListItem("選択して下さい", "0");
        Drp_PriorityNationalityId.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_JpanName, q.i_Id.ToString());
            Drp_PriorityNationalityId.Items.Add(li);
        }
    }
}