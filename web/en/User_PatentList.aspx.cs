using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentList : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
    public dal_Patent DALP = new dal_Patent();
    dal_Member DALM = new dal_Member();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    public dal_Nationality DALN = new dal_Nationality();
    public string requesthref = "";
    public string href = "";
    int uId = 0;
    public int uType = 0;
    public int Power_Into = 0, Power_Export = 0, Power_Update = 0, Power_Delete = 0;//四个变量分别代表权限 导入、导出、修改、删除
    protected void Page_Load(object sender, EventArgs e)
    {
        div_html.InnerHtml = "";
        href = Request.Url.ToString();
        if (Request["sqlwhere"] != null && Request["sqlwhere"].ToString() == "true")
        {
            requesthref = Request.Url.ToString().Split('?')[1];
            if (requesthref.IndexOf("ExpireType=") >= 0)
            {
                requesthref = requesthref.Substring(requesthref.IndexOf("ExpireType=") + 13);
            }
            requesthref = "&" + requesthref;
        }
        if (!IsPostBack)
        {
            Bind_Drp_PatentNationality();
        }
        if (Request["ShouQuanGuo"] != null && Request["ShouQuanGuo"].ToString() != "")
        {
            Drp_PatentNationality.SelectedValue = Request["ShouQuanGuo"].ToString();
        }
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            t_Member model = DALM.Member_Select_Id(uId);
            DALP.EditPatentFeeByMemberId(uId);//更新专利信息
            uType = Convert.ToInt32(model.i_UserTypeId);

            DALM.GetMemberPower(uId, ref Power_Into, ref Power_Export, ref Power_Update, ref Power_Delete);
            Bind_Rpt_UserPatentList(1, uId);
        }
        if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
        {
            Hf_PatentId.Value = Request.Cookies["hqht_patentidstr"].Value.ToString();
        }

    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        Bind_Rpt_UserPatentList(e.NewPageIndex, uId);
    }
    protected void Drp_PatentNationality_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
    }
    protected void OrderByDesc1(object sender, CommandEventArgs e)
    {
        Lbtn_11.Visible = true;
        Lbtn_1.Visible = false;
        Hf_OrderByFile.Value = "nvc_Number";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByAsc11(object sender, CommandEventArgs e)
    {
        Lbtn_11.Visible = false;
        Lbtn_1.Visible = true;
        Hf_OrderByFile.Value = "nvc_Number";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByDesc2(object sender, CommandEventArgs e)
    {
        Lbtn_22.Visible = true;
        Lbtn_2.Visible = false;
        Hf_OrderByFile.Value = "nvc_Name";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByAsc22(object sender, CommandEventArgs e)
    {
        Lbtn_22.Visible = false;
        Lbtn_2.Visible = true;
        Hf_OrderByFile.Value = "nvc_Name";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByDesc3(object sender, CommandEventArgs e)
    {
        Lbtn_33.Visible = true;
        Lbtn_3.Visible = false;
        Hf_OrderByFile.Value = "nvc_AnnualFeeNotPaymentYear";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByAsc33(object sender, CommandEventArgs e)
    {
        Lbtn_33.Visible = false;
        Lbtn_3.Visible = true;
        Hf_OrderByFile.Value = "nvc_AnnualFeeNotPaymentYear";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByDesc4(object sender, CommandEventArgs e)
    {
        Lbtn_44.Visible = true;
        Lbtn_4.Visible = false;
        Hf_OrderByFile.Value = "dt_AnnualFeeNextYear";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByAsc44(object sender, CommandEventArgs e)
    {
        Lbtn_44.Visible = false;
        Lbtn_4.Visible = true;
        Hf_OrderByFile.Value = "dt_AnnualFeeNextYear";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByDesc5(object sender, CommandEventArgs e)
    {
        Lbtn_55.Visible = true;
        Lbtn_5.Visible = false;
        Hf_OrderByFile.Value = "nvc_AnJuanNum";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByAsc55(object sender, CommandEventArgs e)
    {
        Lbtn_55.Visible = false;
        Lbtn_5.Visible = true;
        Hf_OrderByFile.Value = "nvc_AnJuanNum";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByDesc6(object sender, CommandEventArgs e)
    {
        Lbtn_66.Visible = true;
        Lbtn_6.Visible = false;
        Hf_OrderByFile.Value = "dm_FeeSubtotal";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByAsc66(object sender, CommandEventArgs e)
    {
        Lbtn_66.Visible = false;
        Lbtn_6.Visible = true;
        Hf_OrderByFile.Value = "dm_FeeSubtotal";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_77.Visible = false;
    }
    protected void OrderByDesc7(object sender, CommandEventArgs e)
    {
        Lbtn_77.Visible = true;
        Lbtn_7.Visible = false;
        Hf_OrderByFile.Value = "nvc_CurrencyType";
        Hf_OrderByType.Value = "asc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
    }
    protected void OrderByAsc77(object sender, CommandEventArgs e)
    {
        Lbtn_77.Visible = false;
        Lbtn_7.Visible = true;
        Hf_OrderByFile.Value = "nvc_CurrencyType";
        Hf_OrderByType.Value = "desc";
        Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
        {

            string patentid = Request.Cookies["hqht_patentidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    int pid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    t_Patent tp = DALP.Patent_Select_Id(pid);
                    if (tp != null && tp.i_AnnualFeeRestDay < -180)
                    {
                        div_html.InnerHtml = "<script>alert('[" + tp.nvc_Number + "]The annuiy fee of the subject patent has been overdue 6 months, which order cannot be submitted, so if the subject annuity fee has been already paid, please re-edit  [paid year]  item. For more assitance, please feel free to contact us!')</script>";
                        return;
                    }
                    //IQueryable<t_PatentOrderInfo> list = DALPOI.PatentOrderInfoList_Select_Id(pid);
                    //foreach (var v in list)
                    //{
                    //    t_PatentOrder tpo = DALPO.PatentOrder_Select_Id(v.i_OrderId);
                    //    if (tpo != null)
                    //    {
                    //        if (tpo.i_Status == 7)
                    //        {
                    //            if (tp.nvc_AnnualFeePaymentYear == v.nvc_Year)
                    //            {
                    //                div_html.InnerHtml = "<script>alert('[" + tp.nvc_Number + "]专利[" + tp.nvc_AnnualFeePaymentYear + "]年度已经缴费,若要预缴下一年度费用，请编辑专利缴费年度信息')</script>";
                    //                if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
                    //                {
                    //                    Response.Cookies["hqht_patentidstr"].Value = "";
                    //                }
                    //                return;
                    //            }
                    //        }
                    //    }
                    //}
                }
            }
            Response.Redirect("User_PatentOrderAdd1.aspx");
        }
        else
        {
            div_html.InnerHtml = "<script>alert('Please select the patent which annuity fees to be paid')</script>";
        }
    }
    void Bind_Rpt_UserPatentList(int currentPage, int id)
    {
        int count = 0;
        Rpt_UserPatentList.DataSource = UserPatent_SelectPage(currentPage, AspNetPager1.PageSize, id, ref count);
        Rpt_UserPatentList.DataBind();
        AspNetPager1.RecordCount = count;
    }
    /// <summary>
    /// 绑定Granted Country
    /// </summary>
    void Bind_Drp_PatentNationality()
    {
        Drp_PatentNationality.Items.Clear();
        ListItem item = new ListItem("Granted Country", "0");
        Drp_PatentNationality.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_EnName, q.i_Id.ToString());
            Drp_PatentNationality.Items.Add(li);
        }
    }
    private IQueryable<vw_Patent> UserPatent_SelectPage(int pageindex, int pagesize, int uId, ref int count)
    {
        try
        {
            var iquery = from i in dvdc.vw_Patent where i.i_MemberId == uId && i.i_Show == 1 select i;
            #region Granted Country
            if (Drp_PatentNationality.SelectedValue != "0")
            {
                iquery = from i in iquery where i.i_AuthorizeNationalityId == Convert.ToInt32(Drp_PatentNationality.SelectedValue) select i;
            }
            #endregion
            #region 状态
            if (Request["ExpireType"] != null && Request["ExpireType"].ToString() != "")
            {
                int ExpireType = Convert.ToInt32(Request["ExpireType"]);
                iquery = from i in iquery where i.i_AnnualFeeStatus == ExpireType select i;
            }
            #endregion
            #region 按条件查询
            if (Request["i_OrderBy"] != null)
            {
                iquery = from i in iquery where i.i_OrderBy == Convert.ToInt32(Request["i_OrderBy"]) select i;
            }
            if (Request["nvc_UserNum"] != null)
            {
                iquery = from i in iquery where i.nvc_UserNum.Contains(Request["nvc_UserNum"]) select i;
            }
            if (Request["nvc_UserName"] != null)
            {
                iquery = from i in iquery where i.nvc_UserName.Contains(Request["nvc_UserName"]) select i;
            }
            if (Request["i_GuoJiId"] != null)
            {
                iquery = from i in iquery where i.i_GuoJiId == Convert.ToInt32(Request["i_GuoJiId"]) select i;
            }
            if (Request["nvc_Number"] != null)
            {
                iquery = from i in iquery where i.nvc_Number.Contains(Request["nvc_Number"]) select i;
            }
            //if (Request["nvc_BillNumber"] != null)
            //{
            //    iquery = from i in iquery where i.i_Id == Convert.ToInt32(Request["nvc_BillNumber"].Trim()) select i;
            //}
            if (Request["nvc_Name"] != null)
            {
                iquery = from i in iquery where i.nvc_Name.Contains(Request["nvc_Name"]) select i;
            }
            //if (Request["i_PatentType"] != null)
            //{
            //    iquery = from i in iquery where i.i_PatentType == Convert.ToInt32(Request["i_PatentType"]) select i;
            //}
            if (Request["nvc_PatentTypeName"] != null)
            {
                iquery = from i in iquery where i.nvc_EnglishName.Contains(Request["nvc_PatentTypeName"]) select i;
            }
            if (Request["i_YaoQiuXiang"] != null)
            {
                iquery = from i in iquery where i.i_YaoQiuXiang == Convert.ToInt32(Request["i_YaoQiuXiang"]) select i;
            }
            if (Request["nvc_PatentHolder"] != null)
            {
                iquery = from i in iquery where i.nvc_PatentHolder.Contains(Request["nvc_PatentHolder"]) select i;
            }
            if (Request["i_PatentHolderNationalityId"] != null)
            {
                iquery = from i in iquery where i.i_PatentHolderNationalityId == Convert.ToInt32(Request["i_PatentHolderNationalityId"]) select i;
            }
            if (Request["nvc_PatentInventor"] != null)
            {
                iquery = from i in iquery where i.nvc_PatentInventor.Contains(Request["nvc_PatentInventor"]) select i;
            }
            if (Request["nvc_PatentScope"] != null)
            {
                iquery = from i in iquery where i.nvc_PatentScope.Contains(Request["nvc_PatentScope"]) select i;
            }
            if (Request["nvc_PriorityNumber"] != null)
            {
                iquery = from i in iquery where i.nvc_PriorityNumber.Contains(Request["nvc_PriorityNumber"]) select i;
            }
            if (Request["i_PriorityNationalityId"] != null)
            {
                iquery = from i in iquery where i.i_PriorityNationalityId == Convert.ToInt32(Request["i_PriorityNationalityId"]) select i;
            }
            if (Request["dt_PriorityDate"] != null)
            {
                iquery = from i in iquery where i.dt_PriorityDate >= Convert.ToDateTime(Request["dt_PriorityDate"]) && i.dt_PriorityDate <= Convert.ToDateTime(Request["dt_PriorityDate"]) select i;
            }
            if (Request["nvc_PtcNumber"] != null)
            {
                iquery = from i in iquery where i.nvc_PtcNumber.Contains(Request["nvc_PtcNumber"]) select i;
            }
            if (Request["dt_PtcDate"] != null)
            {
                iquery = from i in iquery where i.dt_PtcDate >= Convert.ToDateTime(Request["dt_PtcDate"]) && i.dt_PriorityDate <= Convert.ToDateTime(Request["dt_PtcDate"]) select i;
            }
            if (Request["i_AuthorizeNationalityId"] != null)
            {
                iquery = from i in iquery where i.i_AuthorizeNationalityId == Convert.ToInt32(Request["i_AuthorizeNationalityId"]) select i;
            }
            if (Request["dt_AuthorizeIsNationalityDate"] != null)
            {
                iquery = from i in iquery where i.dt_AuthorizeIsNationalityDate >= Convert.ToDateTime(Request["dt_AuthorizeIsNationalityDate"]) && i.dt_AuthorizeIsNationalityDate <= Convert.ToDateTime(Request["dt_AuthorizeIsNationalityDate2"]) select i;
            }
            if (Request["dt_AuthorizeIsAuthorizeDate"] != null)
            {
                iquery = from i in iquery where i.dt_AuthorizeIsAuthorizeDate >= Convert.ToDateTime(Request["dt_AuthorizeIsAuthorizeDate"]) && i.dt_AuthorizeIsAuthorizeDate <= Convert.ToDateTime(Request["dt_AuthorizeIsAuthorizeDate2"]) select i;
            }
            if (Request["i_AnnualFeeYear"] != null)
            {
                iquery = from i in iquery where i.i_AnnualFeeYear == Convert.ToInt32(Request["i_AnnualFeeYear"]) select i;
            }
            if (Request["i_AnnualFeeRestYear"] != null)
            {
                iquery = from i in iquery where i.i_AnnualFeeRestYear == Convert.ToInt32(Request["i_AnnualFeeRestYear"]) select i;
            }
            if (Request["dt_AnnualFeeDateStart"] != null)
            {
                iquery = from i in iquery where i.dt_AnnualFeeDateStart >= Convert.ToDateTime(Request["dt_AnnualFeeDateStart"]) && i.dt_AnnualFeeDateStart <= Convert.ToDateTime(Request["dt_AnnualFeeDateStart2"]) select i;
            }
            if (Request["dt_AnnualFeeDateEnd"] != null)
            {
                iquery = from i in iquery where i.dt_AnnualFeeDateStart >= Convert.ToDateTime(Request["dt_AnnualFeeDateStart"]) && i.dt_AnnualFeeDateEnd <= Convert.ToDateTime(Request["dt_AnnualFeeDateEnd2"]) select i;
            }
            if (Request["i_AnnualFeeStatus"] != null)
            {
                iquery = from i in iquery where i.i_AnnualFeeStatus == Convert.ToInt32(Request["i_AnnualFeeStatus"]) select i;
            }
            if (Request["nvc_AnnualFeePaymentYear"] != null)
            {
                iquery = from i in iquery where i.nvc_AnnualFeePaymentYear.Contains(Request["nvc_AnnualFeePaymentYear"]) select i;
            }
            if (Request["nvc_AnnualFeeNotPaymentYear"] != null)
            {
                iquery = from i in iquery where i.nvc_AnnualFeeNotPaymentYear.Contains(Request["nvc_AnnualFeeNotPaymentYear"]) select i;
            }
            if (Request["dt_AnnualFeePrevYear"] != null)
            {
                iquery = from i in iquery where i.dt_AnnualFeePrevYear >= Convert.ToDateTime(Request["dt_AnnualFeePrevYear"]) && i.dt_AnnualFeePrevYear <= Convert.ToDateTime(Request["dt_AnnualFeePrevYear2"]) select i;
            }
            if (Request["dt_AnnualFeeNextYear"] != null)
            {
                iquery = from i in iquery where i.dt_AnnualFeeNextYear >= Convert.ToDateTime(Request["dt_AnnualFeeNextYear"]) && i.dt_AnnualFeeNextYear <= Convert.ToDateTime(Request["dt_AnnualFeeNextYear2"]) select i;
            }
            if (Request["i_AnnualFeeRestDay"] != null)
            {
                iquery = from i in iquery where i.i_AnnualFeeRestDay == Convert.ToInt32(Request["i_AnnualFeeRestDay"]) select i;
            }
            if (Request["dm_AnnualFeeNextPaymentMoney"] != null)
            {
                iquery = from i in iquery where i.dm_AnnualFeeNextPaymentMoney == Convert.ToDecimal(Request["dm_AnnualFeeNextPaymentMoney"]) select i;
            }
            if (Request["dm_RemittanceFee"] != null)
            {
                iquery = from i in iquery where i.dm_RemittanceFee == Convert.ToDecimal(Request["dm_RemittanceFee"]) select i;
            }
            if (Request["dm_RemittanceFee"] != null)
            {
                iquery = from i in iquery where i.dm_RemittanceFee == Convert.ToDecimal(Request["dm_RemittanceFee"]) select i;
            }
            if (Request["dm_AgentServiceFee"] != null)
            {
                iquery = from i in iquery where i.dm_AgentServiceFee == Convert.ToDecimal(Request["dm_AgentServiceFee"]) select i;
            }
            if (Request["dm_ChaoXiangFee"] != null)
            {
                iquery = from i in iquery where i.dm_ChaoXiangFee == Convert.ToDecimal(Request["dm_ChaoXiangFee"]) select i;
            }
            if (Request["dm_FeeSubtotal"] != null)
            {
                iquery = from i in iquery where i.dm_FeeSubtotal == Convert.ToDecimal(Request["dm_FeeSubtotal"]) select i;
            }
            if (Request["nvc_AnJuanNum"] != null)
            {
                iquery = from i in iquery where i.nvc_AnJuanNum.Contains(Request["nvc_AnJuanNum"]) select i;
            }
            if (Request["nvc_LinkMan"] != null)
            {
                iquery = from i in iquery where i.nvc_LinkMan.Contains(Request["nvc_LinkMan"]) select i;
            }
            if (Request["nvc_Address"] != null)
            {
                iquery = from i in iquery where i.nvc_Address.Contains(Request["nvc_Address"]) select i;
            }
            if (Request["nvc_Phone"] != null)
            {
                iquery = from i in iquery where i.nvc_Phone.Contains(Request["nvc_Phone"]) select i;
            }
            #endregion
            #region 排序
            if (Hf_OrderByFile.Value == "nvc_Number")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_Number ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_Number descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "nvc_Name")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_Name ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_Name descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "nvc_AnnualFeeNotPaymentYear")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_AnnualFeeNotPaymentYear ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_AnnualFeeNotPaymentYear descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "dt_AnnualFeeNextYear")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.dt_AnnualFeeNextYear ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.dt_AnnualFeeNextYear descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "nvc_AnJuanNum")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_AnJuanNum ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_AnJuanNum descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "dm_FeeSubtotal")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.dm_FeeSubtotal ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.dm_FeeSubtotal descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "nvc_CurrencyType")
            {
                if (Hf_OrderByType.Value == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_CurrencyType ascending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_CurrencyType descending select i;
                }
            }
            if (Hf_OrderByFile.Value == "dt_AddTime")
            {
                iquery = from i in iquery orderby i.dt_AddTime descending select i;
            }
            #endregion
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        catch
        {
            return null;
        }
    }
    /// <summary>
    /// 得到Title of patent的背景颜色
    /// </summary>
    /// <returns></returns>
    public string GetPatentNameBgColor(int i_AnnualFeeRestDay)
    {
        string s = "";
        if (DALP.GetStatusByAnnualFeeRestDay(i_AnnualFeeRestDay) == 1)
        {
            s = "style='font-size:12px;color:#1e2b6c;font-weight:bold;'";
        }
        else if (DALP.GetStatusByAnnualFeeRestDay(i_AnnualFeeRestDay) == 2)
        {
            s = "style='font-size:12px;color:#50245f;font-weight:bold;'";
        }
        else if (DALP.GetStatusByAnnualFeeRestDay(i_AnnualFeeRestDay) == 3)
        {
            s = "style='font-size:12px;color:#852349;font-weight:bold;'";
        }
        else if (DALP.GetStatusByAnnualFeeRestDay(i_AnnualFeeRestDay) == 4)
        {
            s = "style='font-size:12px;color:#b2333d;font-weight:bold;'";
        }
        else if (DALP.GetStatusByAnnualFeeRestDay(i_AnnualFeeRestDay) == 5)
        {
            s = "style='font-size:12px;color:#d14b1a;font-weight:bold;'";
        }
        else
        {
            s = "style='font-size:12px;color:#ebbf1c;font-weight:bold;'";
        }
        //switch (status)
        //{
        //    case 1:
        //        s = "style='font-size:12px;color:#1e2b6c;font-weight:bold;'";
        //        break;
        //    case 2:
        //        s = "style='font-size:12px;color:#50245f;font-weight:bold;'";
        //        break;
        //    case 3:
        //        s = "style='font-size:12px;color:#852349;font-weight:bold;'";
        //        break;
        //    case 4:
        //        s = "style='font-size:12px;color:#b2333d;font-weight:bold;'";
        //        break;
        //    case 5:
        //        s = "style='font-size:12px;color:#d14b1a;font-weight:bold;'";
        //        break;
        //    case 6:
        //        s = "style='font-size:12px;color:#ebbf1c;font-weight:bold;'";
        //        break;
        //}
        return s;
    }
    public string GetGuoJiaName(int id)
    {
        string s = "";
        t_Nationality model = DALN.Nationality_Select_Id(id);
        if (model != null)
        {
            s = model.nvc_EnName;
        }
        return s;
    }
    public bool CheckTrue(object pId)
    {
        bool flag = false;
        if (DALPO.PanDuanJiaoFeeShow(uId, Convert.ToInt32(pId)))
        {
            flag = true;
        }
        return flag;
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
        DALM.GetMemberPower(uId, ref Power_Into, ref Power_Export, ref Power_Update, ref Power_Delete);
        if (Power_Export == 0)
        {
            Response.Redirect("user_pageinfo.aspx");
        }
        int count = 0;
        GridView1.DataSource = UserPatent_SelectPage(1, 1000, uId, ref count);
        GridView1.DataBind();
        if (count > 0)
        {
            toExecl(GridView1);
            GridView1.DataSource = null;
            GridView1.DataBind();
            Manager.AddLog(0, "专利管理", "导出全部专利信息");
        }
        else
        {
            MessageBox.Show(Page, "No patent is to be outputted.");
        }
    }
    private void toExecl(GridView GV)
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "GB2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        //如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        Response.Write("<meta http-equiv=Content-Type content=text/html;charset=UTF-8>");
        this.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GV.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    public string GetDate(object obj)
    {
        string s = "";
        if (obj != null && obj.ToString() != "")
        {
            s = Convert.ToDateTime(obj).ToString("yyyy-MM-dd");
        }
        return s;
    }
    public string GetGuoJiaName(object obj)
    {
        string guojia = "";
        t_Nationality model = DALN.Nationality_Select_Id(Convert.ToInt32(obj));
        if (model != null)
        {
            guojia = model.nvc_EnName;
        }
        return guojia;
    }
    public string GetZhiNaJin(int zId)
    {
        vw_Patent model = DALP.Patent_SelectView_IdAndMemberId(zId, uId);
        #region Surcharge
        //Surcharge算法 根据Type of patent和专利年度得到专利费用的Surcharge 然后根据专利的到期剩余天数 算出专利过期几个月 
        //dt_AnnualFeeNextYear到期日期
        //i_AnnualFeeRestDay到期剩余天数 每天都会减一
        if (model.i_AnnualFeeRestDay < 0)
        {
            #region 算出专利过期几个月
            DateTime dtt = DateTime.Now;
            int month0_days = DateTime.DaysInMonth(dtt.Year, dtt.Month);
            int month1_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(1).Month);
            int month2_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(2).Month);
            int month3_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(3).Month);
            int month4_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(4).Month);
            int gq = 1;
            if (Math.Abs(model.i_AnnualFeeRestDay) - month0_days > 0)
            {
                gq = 2;
            }
            if (Math.Abs(model.i_AnnualFeeRestDay) - month0_days - month1_days > 0)
            {
                gq = 3;
            }
            if (Math.Abs(model.i_AnnualFeeRestDay) - month0_days - month1_days - month2_days > 0)
            {
                gq = 4;
            }
            if (Math.Abs(model.i_AnnualFeeRestDay) - month0_days - month1_days - month2_days - month3_days > 0)
            {
                gq = 5;
            }
            if (Math.Abs(model.i_AnnualFeeRestDay) - month0_days - month1_days - month2_days - month3_days - month4_days > 0)
            {
                gq = 6;
            }
            #endregion
            IQueryable<t_PatentFee> iquery = from r in dzdc.t_PatentFee where r.i_PatentTypeId == model.i_PatentType && r.nvc_Year == model.nvc_AnnualFeeNotPaymentYear select r;
            string zhinajin = "0.00-0.00-0.00-0.00-0.00-0.00";
            if (iquery.Count() > 0)
            {
                foreach (var i in iquery)
                {
                    zhinajin = i.nvc_ZhiNaJin;
                }
            }
            return "【第" + gq + "个月：" + zhinajin.Split('-')[gq - 1] + "】";
        }
        return "";
        #endregion
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            DALM.GetMemberPower(uId, ref Power_Into, ref Power_Export, ref Power_Update, ref Power_Delete);
            if (Power_Delete == 0)
            {
                Response.Redirect("user_pageinfo.aspx");
            }
            string patentid = Request.Cookies["hqht_patentidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    int pid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    DALP.Patent_Del(pid);
                }
            }
            Bind_Rpt_UserPatentList(AspNetPager1.CurrentPageIndex, uId);
            Response.Cookies["hqht_patentidstr"].Value = "";
            div_html.InnerHtml = "<script>alert('Delete successfully')</script>";
        }
        else
        {
            div_html.InnerHtml = "<script>alert('Please select the patent to be deleted')</script>";
        }
    }
}