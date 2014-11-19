using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentInfo : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    public dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    public string pagehref = "";
    public int uId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            if (Request["href"] != null && Request["href"].ToString() != "")
            {
                pagehref = Request["href"].ToString();
            }
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    void Bind_Page_Info()
    {
        try
        {
            if (Request.QueryString["pId"] != null)
            {
                if (DALM.Member_Select_Id(uId).i_UserTypeId == 3)
                {
                    disanfang.Visible = true;
                }
                else
                {
                    disanfang.Visible = false;
                }
                hd_id.Value = Request["pId"].ToString();
                if (DALPO.PanDuanJiaoFeeShow(uId, Convert.ToInt32(Request["pId"])))
                {
                    imgedit.Visible = false;
                }
                #region 更新费用
                t_Patent tp = DALP.Patent_Select_Id(Convert.ToInt32(hd_id.Value));
                if (tp != null)
                {
                    DALP.EditPatentFee(tp);
                }
                #endregion
                vw_Patent model = DALP.Patent_SelectView_IdAndMemberId(int.Parse(Request["pId"].ToString()), uId);
                if (model != null)
                {
                    hd_userId.Value = model.nvc_UserNum;
                    //=======================================================
                    Ltl_Number.Text = model.nvc_Number;
                    Ltl_Name.Text = model.nvc_Name;
                    Ltl_PatentType.Text = model.nvc_EnglishName;
                    Ltl_PatentHolder.Text = model.nvc_PatentHolder;
                    if (model.i_YaoQiuXiang <= 0)//Number of claims
                    {
                        tr_qlyqx.Visible = false;
                    }
                    else
                    {
                        Ltl_yaoqiuxiang.Text = model.i_YaoQiuXiang.ToString();
                    }
                    try
                    {
                        Ltl_PatentHolderNationalityId.Text = DALN.Nationality_Select_Id(model.i_PatentHolderNationalityId).nvc_EnName;
                    }
                    catch { }
                    Ltl_PatentInventor.Text = model.nvc_PatentInventor;

                    //Ltl_PatentScope.Text = model.nvc_PatentScope;
                    Ltl_PriorityNumber.Text = model.nvc_PriorityNumber;
                    if (model.i_PriorityNationalityId != 0)
                    {
                        Ltl_PriorityNationalityId.Text = DALN.Nationality_Select_Id(model.i_PriorityNationalityId).nvc_EnName;
                    }
                    if (model.dt_PriorityDate != null && model.dt_PriorityDate.ToString() != "")
                    {
                        Ltl_PriorityDate.Text = Convert.ToDateTime(model.dt_PriorityDate).ToShortDateString();
                    }
                    if (model.dt_PtcDate != null && model.dt_PtcDate.ToString() != "")
                    {
                        Ltl_PtcDate.Text = Convert.ToDateTime(model.dt_PtcDate).ToShortDateString();
                    }
                    Ltl_PtcNumber.Text = model.nvc_PtcNumber;
                    Ltl_AuthorizeNationalityId.Text = DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_EnName;
                    Ltl_AuthorizeIsNationalityDate.Text = Convert.ToDateTime(model.dt_AuthorizeIsNationalityDate).ToShortDateString();
                    Ltl_AuthorizeIsAuthorizeDate.Text = model.dt_AuthorizeIsAuthorizeDate != null ? Convert.ToDateTime(model.dt_AuthorizeIsAuthorizeDate).ToShortDateString() : "";

                    Ltl_AnnualFeeYear.Text = model.i_AnnualFeeYear.ToString();
                    Ltl_AnnualFeeRestYear.Text = model.i_AnnualFeeRestYear.ToString();
                    Ltl_AnnualFeeDateStart.Text = Convert.ToDateTime(model.dt_AnnualFeeDateStart).ToShortDateString();
                    Ltl_AnnualFeeDateEnd.Text = Convert.ToDateTime(model.dt_AnnualFeeDateEnd).ToShortDateString();

                    Ltl_AnnualFeeStatus.Text = DALP.GetStatus(Convert.ToInt32(model.i_AnnualFeeStatus), "en");

                    Ltl_AnnualFeePaymentYear.Text = model.nvc_AnnualFeePaymentYear;

                    Ltl_AnnualFeePrevYear.Text = Convert.ToDateTime(model.dt_AnnualFeePrevYear).ToShortDateString();

                    //All the annuity fee payments already done当Patent Status是这个状态的时候，以下Content都为空
                    if (model.i_AnnualFeeStatus != 13)
                    {
                        #region Payment information
                        Ltl_AnnualFeeNextYear.Text = Convert.ToDateTime(model.dt_AnnualFeeNextYear).ToShortDateString();
                        Ltl_AnnualFeeRestDay.Text = model.i_AnnualFeeRestDay.ToString();
                        Ltl_AnnualFeeNotPaymentYear.Text = model.nvc_AnnualFeeNotPaymentYear;
                        Ltl_AnnualFeeNextPaymentMoney.Text = model.dm_AnnualFeeNextPaymentMoney.ToString();
                        Ltl_AgentServiceFee.Text = model.dm_AgentServiceFee.ToString();
                        Ltl_RemittanceFee.Text = model.dm_RemittanceFee.ToString();
                        if (model.dm_ChaoXiangFee > 0)
                        {
                            Ltl_chaoxiang.Text = model.dm_ChaoXiangFee.ToString();
                        }
                        else
                        {
                            tr_chaoxiangfee.Visible = false;
                        }
                        if (model.i_JianMian1 > 0)
                        {
                            Ltl_jianmian1.Text = model.i_JianMian1.ToString() + " % ";
                        }
                        else
                        {
                            tr_jianmianfee.Visible = false;
                        }
                        #region Surcharge
                        //Surcharge算法 根据Type of patent和专利年度得到专利费用的Surcharge 然后根据专利的到期剩余天数 算出专利过期几个月 
                        //dt_AnnualFeeNextYear到期日期
                        //i_AnnualFeeRestDay到期剩余天数 每天都会减一
                        if (model.i_AnnualFeeRestDay < 0)
                        {
                            Ltl_zhinajin.Text = model.nvc_ZhiNaJin;
                        }
                        else
                        {
                            tr_zhinajinfee.Visible = false;
                        }
                        #endregion
                        Ltl_FeeSubtotal.Text = model.dm_FeeSubtotal.ToString();
                        Ltl_HuoBiType.Text = model.nvc_CurrencyType;
                        #endregion
                    }

                    Ltl_Remark.Text = model.nt_Remarks;
                    //DateTime begintime = DateTime.Parse(Ltl_AnnualFeeNextYear.Text);
                    //DateTime endtime = DateTime.Parse(DateTime.Now.ToShortDateString());
                    //TimeSpan ts = begintime - endtime;

                    Ltl_OrderBy.Text = model.i_OrderBy.ToString();
                    Ltl_anjuanhao.Text = model.nvc_AnJuanNum;
                    Ltl_linkman.Text = model.nvc_LinkMan;
                    Ltl_address.Text = model.nvc_Address;
                    Ltl_phone.Text = model.nvc_Phone;
                }
            }
        }
        catch { }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request["pId"] != null && Request["pId"].ToString() != "")
        {
            IQueryable<vw_Patent> iquery = DALP.Patent_VW_IdAndMemberId(int.Parse(Request["pId"].ToString()), uId);
            if (iquery != null)
            {
                Manager.AddLog(0, "专利管理", "导出专利信息");
                GridView1.DataSource = iquery;
                GridView1.DataBind();
                toExecl(GridView1);
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
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
}