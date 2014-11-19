using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_Shop_M_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(11, 0);
    public bool pageadd = Manager.GetManagerQX(11, 1);
    public bool pageupdate = Manager.GetManagerQX(11, 2);
    public bool pagedel = Manager.GetManagerQX(11, 3);
    public bool pagechu = Manager.GetManagerQX(11, 4);
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
    public dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    public dal_Nationality DALN = new dal_Nationality();
    public int ye = 1;
    public string Keyword = "";
    public int userid = 0;
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
            if (returnurl.IndexOf("flag=ob") > -1)
            {
                returnurl = returnurl.Substring(0, returnurl.IndexOf("flag=ob"));
            }
        }
        div_a.InnerHtml = "";
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Drp_Type();
            Bind_Drp_PGuoJiaType();
            Bind_Page_value();
            Bind_Rpt_Patent(ye);
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["userid"] != null && Request.QueryString["userid"] != "")
        {
            userid = int.Parse(Request.QueryString["userid"].ToString());
        }
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        //if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"] != "")
        //{
        //    hoot.Value = Request.QueryString["Keyword"].ToString();
        //}
        //if (Request.QueryString["FType"] != null && Request.QueryString["FType"] != "")
        //{
        //    Drp_FType.SelectedValue = Request.QueryString["FType"].ToString();
        //}
        //if (Request.QueryString["PType"] != null && Request.QueryString["PType"] != "")
        //{
        //    Drp_PType.SelectedValue = Request.QueryString["PType"].ToString();
        //}
        //if (Request.QueryString["PGuoJiaType"] != null && Request.QueryString["PGuoJiaType"] != "")
        //{
        //    Drp_PGuoJiaType.SelectedValue = Request.QueryString["PGuoJiaType"].ToString();
        //}
    }
    void Bind_Drp_Type()// 绑定专利类型
    {
        //Drp_PType.Items.Clear();
        //ListItem item = new ListItem("所有类型", "0");
        //Drp_PType.Items.Add(item);
        //var iquery = DALPT.PatentType_SelectAll();
        //foreach (var q in iquery)
        //{
        //    ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
        //    Drp_PType.Items.Add(li);
        //}
    }
    void Bind_Drp_PGuoJiaType()// 绑定专利授权国
    {
        //Drp_PGuoJiaType.Items.Clear();
        //ListItem item = new ListItem("所有授权国", "0");
        //Drp_PGuoJiaType.Items.Add(item);
        //var iquery = DALN.Nationality_SelectAll();
        //foreach (var q in iquery)
        //{
        //    ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
        //    Drp_PGuoJiaType.Items.Add(li);
        //}
    }
    public void Bind_Rpt_Patent(int index)
    {
        int pageindex = index;
        int pagesiz = 20;
        int count = 0;
        reptlist.DataSource = Patent_SelectPage(pageindex, pagesiz,ref count);
        reptlist.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pagesiz;
        aspPage.CurrentPageIndex = index;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_Patent(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_Patent(1);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALP.Patent_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "专利管理", "删除专利");
        }
        Bind_Rpt_Patent(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        Manager.AddLog(0, "专利管理", "导出专利列表");
        int count = 0;
        GridView1.DataSource = Patent_SelectPage(1, 1000, ref count);
        GridView1.DataBind();
        toExecl(GridView1);
        GridView1.DataSource = null;
        GridView1.DataBind();
    }
    private void toExecl(GridView GV)
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        //如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GV.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    /// <summary>
    /// 查询分页
    /// </summary>
    /// <param name="pageindex"></param>
    /// <param name="pagesiz"></param>
    /// <param name="count"></param>
    /// <returns></returns>
    private IQueryable<vw_Patent> Patent_SelectPage(int pageindex, int pagesiz, ref int count)
    {
        try
        {
            var iquery = from i in dvdc.vw_Patent select i;
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
            if (Request["nvc_BillNumber"] != null)
            {
                iquery = from i in iquery where i.i_Id == Convert.ToInt32(Request["nvc_BillNumber"].Trim()) select i;
            }
            if (Request["nvc_Name"] != null)
            {
                iquery = from i in iquery where i.nvc_Name.Contains(Request["nvc_Name"]) select i;
            }
            //if (Request["i_PatentType"] != null)
            //{
            //    iquery = from i in iquery where i.i_PatentType == Convert.ToInt32(Request["i_PatentType"]) select i;
            //}
            if (Request["nvc_PatentTypeName"]!=null)
            {
                iquery = from i in iquery where i.nvc_PatentTypeName.Contains(Request["nvc_PatentTypeName"]) select i;
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
            if (Request["flag"] != null)
            {
                if (Request["ob_UserNum"] != null)
                {
                    if (Request["ob_UserNum"].ToString() == "0")
                    {
                        HF_userNumAsc.Value = "asc";
                        iquery = from i in iquery orderby i.nvc_UserNum ascending select i;
                    }
                    else
                    {
                        HF_userNumAsc.Value = "desc";
                        iquery = from i in iquery orderby i.nvc_UserNum descending select i;
                    }
                }
                if (Request["ob_UserName"] != null)
                {
                    if (Request["ob_UserName"].ToString() == "0")
                    {
                        HF_userNameAsc.Value = "asc";
                        iquery = from i in iquery orderby i.nvc_UserName ascending select i;
                    }
                    else
                    {
                        HF_userNameAsc.Value = "desc";
                        iquery = from i in iquery orderby i.nvc_UserName descending select i;
                    }
                }
                if (Request["ob_Name"] != null)
                {
                    if (Request["ob_Name"].ToString() == "0")
                    {
                        HF_NameAsc.Value = "asc";
                        iquery = from i in iquery orderby i.nvc_Name ascending select i;
                    }
                    else
                    {
                        HF_NameAsc.Value = "desc";
                        iquery = from i in iquery orderby i.nvc_Name descending select i;
                    }
                }
                if (Request["ob_Number"] != null)
                {
                    if (Request["ob_Number"].ToString() == "0")
                    {
                        HF_NumberAsc.Value = "asc";
                        iquery = from i in iquery orderby i.nvc_Number ascending select i;
                    }
                    else
                    {
                        HF_NumberAsc.Value = "desc";
                        iquery = from i in iquery orderby i.nvc_Number descending select i;
                    }
                }
                if (Request["ob_ShouQuanGuo"] != null)
                {
                    if (Request["ob_ShouQuanGuo"].ToString() == "0")
                    {
                        HF_ShouQuanGuoAsc.Value = "asc";
                        iquery = from i in iquery orderby i.i_AuthorizeNationalityId ascending select i;
                    }
                    else
                    {
                        HF_ShouQuanGuoAsc.Value = "desc";
                        iquery = from i in iquery orderby i.i_AuthorizeNationalityId descending select i;
                    }
                }
                if (Request["ob_AnnualFeeStatus"] != null)
                {
                    if (Request["ob_AnnualFeeStatus"].ToString() == "0")
                    {
                        HF_AnnualFeeStatusAsc.Value = "asc";
                        iquery = from i in iquery orderby i.i_AnnualFeeStatus ascending select i;
                    }
                    else
                    {
                        HF_AnnualFeeStatusAsc.Value = "desc";
                        iquery = from i in iquery orderby i.i_AnnualFeeStatus descending select i;
                    }
                }
                if (Request["ob_AnnualFeeNotPaymentYear"] != null)
                {
                    if (Request["ob_AnnualFeeNotPaymentYear"].ToString() == "0")
                    {
                        HF_AnnualFeeNotPaymentYearAsc.Value = "asc";
                        iquery = from i in iquery orderby i.nvc_AnnualFeeNotPaymentYear ascending select i;
                    }
                    else
                    {
                        HF_AnnualFeeNotPaymentYearAsc.Value = "desc";
                        iquery = from i in iquery orderby i.nvc_AnnualFeeNotPaymentYear descending select i;
                    }
                }
                if (Request["ob_AnnualFeeRestDay"] != null)
                {
                    if (Request["ob_AnnualFeeRestDay"].ToString() == "0")
                    {
                        HF_AnnualFeeRestDayAsc.Value = "asc";
                        iquery = from i in iquery orderby i.i_AnnualFeeRestDay ascending select i;
                    }
                    else
                    {
                        HF_AnnualFeeRestDayAsc.Value = "desc";
                        iquery = from i in iquery orderby i.i_AnnualFeeRestDay descending select i;
                    }
                }
                if (Request["ob_EditTime"] != null)
                {
                    if (Request["ob_EditTime"].ToString() == "0")
                    {
                        HF_EditTimeAsc.Value = "asc";
                        iquery = from i in iquery orderby i.dt_EditTime ascending select i;
                    }
                    else
                    {
                        HF_EditTimeAsc.Value = "desc";
                        iquery = from i in iquery orderby i.dt_EditTime descending select i;
                    }
                }
            }
            else
            {
                iquery = from i in iquery orderby i.dt_AddTime descending select i;
            }
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        catch
        {
            return null;
        }
    }
    public string GetGuoJiaName(int id)
    {
        string s = "";
        t_Nationality model = DALN.Nationality_Select_Id(id);
        if (model != null)
        {
            s = model.nvc_Name;
        }
        return s;
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
            guojia = model.nvc_Name;
        }
        return guojia;
    }
    public string GetZhiNaJin(int zId)
    {
        vw_Patent model = DALP.Patent_SelectView_Id(zId);
        #region 滞纳金
        //滞纳金算法 根据专利类型和专利年度得到专利费用的滞纳金 然后根据专利的到期剩余天数 算出专利过期几个月 
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

    protected void reptlist_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        var query = from q in dzdc.t_Patent where q.i_Id == int.Parse(id) select q;
        foreach (var q in query)
        {
            if (e.CommandName.ToString() == "IsShow")
            {
                if (q.i_Show == 1) { q.i_Show = 0; } else { q.i_Show = 1; }
            }
            if (e.CommandName.ToString() == "IsReceiveEmail")
            {
                if (q.i_ReceiveEmail == 1) { q.i_ReceiveEmail = 0; } else { q.i_ReceiveEmail = 1; }
            }
        }
        Manager.AddLog(0, "专利管理", "修改专利列表信息");
        dzdc.SubmitChanges();
        Bind_Rpt_Patent(aspPage.CurrentPageIndex);
    }
}