using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentExport : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    public dal_Patent DALP = new dal_Patent();
    public dal_PatentType DALPT = new dal_PatentType();
    public dal_Nationality DALN = new dal_Nationality();
    public dal_Member DALM = new dal_Member();
    public string pagehref = "";
    public int uId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
            OutPut("attachment;filename=" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".doc", "application/ms-word");
        }
    }
    void Bind_Page_Info()
    {
        try
        {
            if (Request["pId"] != null && Request["pId"].ToString()!="")
            {
                IQueryable<vw_Patent> iquery = DALP.Patent_VW_IdAndMemberId(int.Parse(Request["pId"].ToString()), uId);
                if (iquery!=null)
                {
                    DataList1.DataSource = iquery;
                    DataList1.DataBind();
                }
            }
        }
        catch { }
    }

    private void OutPut(string fileType, string strType)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", fileType);
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = strType;
        this.EnableViewState = true;
        System.IO.StringWriter swOut = new System.IO.StringWriter();
        HtmlTextWriter hTw = new HtmlTextWriter(swOut);
        // GridView1.RenderControl(hTw);
        DataList1.RenderControl(hTw);
        // Response.Output.Write(hTw.ToString());
        Response.Write(swOut.ToString());
        Response.Flush();
        Response.End();
    }
    public string GetZhiNaJin(int d, int type, string y)//i_AnnualFeeRestDay/model.i_PatentType//nvc_AnnualFeeNotPaymentYear
    {
        #region 滞纳金
        //滞纳金算法 根据专利类型和专利年度得到专利费用的滞纳金 然后根据专利的到期剩余天数 算出专利过期几个月 
        //dt_AnnualFeeNextYear到期日期
        //i_AnnualFeeRestDay到期剩余天数 每天都会减一
        if (d < 0)
        {
            #region 算出专利过期几个月
            DateTime dtt = DateTime.Now;
            int month0_days = DateTime.DaysInMonth(dtt.Year, dtt.Month);
            int month1_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(1).Month);
            int month2_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(2).Month);
            int month3_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(3).Month);
            int month4_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(4).Month);
            int gq = 1;
            if (Math.Abs(d) - month0_days > 0)
            {
                gq = 2;
            }
            if (Math.Abs(d) - month0_days - month1_days > 0)
            {
                gq = 3;
            }
            if (Math.Abs(d) - month0_days - month1_days - month2_days > 0)
            {
                gq = 4;
            }
            if (Math.Abs(d) - month0_days - month1_days - month2_days - month3_days > 0)
            {
                gq = 5;
            }
            if (Math.Abs(d) - month0_days - month1_days - month2_days - month3_days - month4_days > 0)
            {
                gq = 6;
            }
            #endregion
            IQueryable<t_PatentFee> iquery = from r in dzdc.t_PatentFee where r.i_PatentTypeId == type && r.nvc_Year == y select r;
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
}