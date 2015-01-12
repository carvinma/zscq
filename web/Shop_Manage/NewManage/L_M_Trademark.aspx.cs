using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using System.Data;
using zscq.DAL;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class L_M_Trademark : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    public bool pagedel = Manager.GetManagerQX(21, 3);
    public bool pagechu = Manager.GetManagerQX(21, 4);
    dal_DataOrder DALD = new dal_DataOrder();
    dal_Trademark DALT = new dal_Trademark();
    dal_Member DALM = new dal_Member();
    dal_Nationality DALN = new dal_Nationality();

    dal_NewTrademark dalmark = new dal_NewTrademark();
    DataTradeMarkDataContext mark = new DataTradeMarkDataContext();
    public int SType = 0;
    public int usertype = 0;
    public string Keyword = "";
    public int state = 0;
    public string usercount = "0";
    public string weituocount = "0", zixingjiaofei = "0";
    public string weituoJiaofeiOKcount = "0";
    public int StockState = 0;
    public int ye = 1;
    public int userid = 0;
    public int sbdays = 0;
    public string statime = "";
    public string endtime = "";

    public string caseno = "";
    public string applyno = "";
    public string memberno = "";
    public string applyuser = "";
    public string membername = "";
    public string trademarktype = "";
    public string timelimit = "";
    public string timeadd = "";
    public string status = "";

    public int jiaofeitypezt = -1;

    public string zhuangtai = "";

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

        HiddenDel.Value = "";
        div_a.InnerHtml = "";
        hi_true.Value = pageupdate ? "1" : "0";//鼠标移动修改
        if (!IsPostBack)
        {
            Bind_Page_value();
            Bind_Rpt_Product(ye);
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

        #region 排序参数

        if (Request.QueryString["caseno"] != null && Request.QueryString["caseno"] != "")
        {
            caseno = Request.QueryString["caseno"].ToString();
            this.hi_CaseNo.Value = caseno;
        }
        if (Request.QueryString["applyno"] != null && Request.QueryString["applyno"] != "")
        {
            this.applyno = Request.QueryString["applyno"].ToString();
            hi_applyno.Value = applyno;
        }
        if (Request.QueryString["applyuser"] != null && Request.QueryString["applyuser"] != "")
        {
            this.applyuser = Request.QueryString["applyuser"].ToString();
            hi_applyuser.Value = applyuser;
        }
        if (Request.QueryString["memberno"] != null && Request.QueryString["memberno"] != "")
        {
            this.memberno = Request.QueryString["memberno"].ToString();
            hi_memberno.Value = memberno;
        }
        if (Request.QueryString["membername"] != null && Request.QueryString["membername"] != "")
        {
            this.membername = Request.QueryString["membername"].ToString();
            hi_membername.Value = membername;
        }
        if (Request.QueryString["trademarktype"] != null && Request.QueryString["trademarktype"] != "")
        {
            this.trademarktype = Request.QueryString["trademarktype"].ToString();
            hi_trademarktype.Value = trademarktype;
        }
        if (Request.QueryString["timelimit"] != null && Request.QueryString["timelimit"] != "")
        {
            this.timelimit = Request.QueryString["timelimit"].ToString();
            hi_timelimit.Value = timelimit;
        }
        if (Request.QueryString["timeadd"] != null && Request.QueryString["timeadd"] != "")
        {
            this.timeadd = Request.QueryString["timeadd"].ToString();
            hi_timeadd.Value = timeadd;
        }
        if (Request.QueryString["status"] != null && Request.QueryString["status"] != "")
        {
            this.status = Request.QueryString["status"].ToString();
            hi_status.Value = status;
        }
        #endregion
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_Product(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }

    public string GetApplyStatus(object caseType, object applyStatus)
    {
        if (applyStatus != null)
        {
            if (caseType.ToString() == "0")
                return BaseDataUtil.tradeMarkApplyStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
            else
                return BaseDataUtil.tradeMarkRenewedStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        }
        return string.Empty;
    }
    public string ZTFileImg(object Uid, object zhuti, object sbid)
    {
        string aa = "未上传";
        var m = DALM.Member_Select_Id(int.Parse(Uid.ToString()));
        if (m != null)
        {
            if (m.i_UserTypeId == 3)
            {
                if (zhuti != null && zhuti != "")
                {
                    return "<a href='../" + zhuti + "' target='_blank'><img src='../" + zhuti + "'  width='20' title='主体资格证明文件' border='0'/></a>";
                }
                else
                {
                    return "未上传";
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                {
                    return "<a href='../" + m.nvc_ZhuTiFile + "'  target='_blank'><img src='../" + m.nvc_ZhuTiFile + "'  width='20' title='主体资格证明文件' border='0'/></a>";
                }
                else
                {
                    return "未上传";
                }
            }
        }
        return aa;
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
    /// <summary>
    /// 
    /// </summary>
    /// <param name="i_Type"></param>
    /// <param name="fileurl">ApplyUpBook 申请案上传</param>
    /// <param name="renwalfileurl">RenewalApplyUpBook 续展案上传</param>
    /// <param name="booktype"></param>
    /// <returns></returns>
    public string upFileInfo(object i_Type, object fileurl,object renwalfileurl,object booktype)
    {
        string downlinkname=booktype.ToString()=="0" ? "商标申请书":"商标委托书";
        string downlinknameNo = booktype.ToString() == "0" ? "申请书未上传" : "委托书未上传";
        switch (i_Type.ToString())
        {
            case "0":
                return fileurl == null ? downlinknameNo : "<a href='../../" + fileurl.ToString() + "' title='点击下载' target='_blank'>" + downlinkname + "</a>";

            case "1": return renwalfileurl == null ? downlinknameNo : "<a href='../../" + renwalfileurl.ToString() + "' title='点击下载' target='_blank'>" + downlinkname + "</a>";
        }
        return "未上传";
    }
    private void Bind_Rpt_Product(int pageCurrent)//绑定列表
    {
        ye = pageCurrent;
        int Ccount = 0;
        int PageSize = 20;

        this.rep_brand.DataSource = Patent_SelectPage(pageCurrent, PageSize, ref Ccount);
        this.rep_brand.DataBind();
        aspPage.RecordCount = Ccount;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + Ccount + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }


    /// <summary>
    /// 查询分页
    /// </summary>
    /// <param name="pageindex"></param>
    /// <param name="pagesiz"></param>
    /// <param name="count"></param>
    /// <returns></returns>
    private IQueryable<vw_NewTradeMark> Patent_SelectPage(int pageindex, int pagesiz, ref int count)
    {
        try
        {
            var iquery = from i in mark.vw_NewTradeMark select i;
            #region 查询参数

            if (Request["qnvc_UserNum"] != null)
            {
                iquery = from i in iquery where i.nvc_UserNum.Contains(Request["qnvc_UserNum"]) select i;
            }
            if (Request["qnvc_UserName"] != null)
            {
                iquery = from i in iquery where i.nvc_Name.Contains(Request["qnvc_UserName"]) select i;
            }
            if (Request["qapplyName"] != null)
            {
                iquery = from i in iquery where i.ApplyName.Contains(Request["qapplyName"]) select i;
            }
            if (Request["qProvinceId"] != null)
            {
                iquery = from i in iquery where i.ProvinceId == Convert.ToInt32(Request["qProvinceId"]) select i;
            }
            if (Request["qCityId"] != null)
            {
                iquery = from i in iquery where i.CityId == Convert.ToInt32(Request["qCityId"].Trim()) select i;
            }
            if (Request["qAreaId"] != null)
            {
                iquery = from i in iquery where i.AreaId == Convert.ToInt32(Request["qAreaId"]) select i;
            }
            if (Request["qaddress"] != null)
            {
                iquery = from i in iquery where i.Address.Contains(Request["qaddress"]) select i;
            }
            if (Request["qi_Type"] != null)
            {
                iquery = from i in iquery where i.i_Type == Convert.ToInt32(Request["qi_Type"]) select i;
            }
            if (Request["qCaseNo"] != null)
            {
                iquery = from i in iquery where i.CaseNo.Contains(Request["qCaseNo"]) select i;
            }
            if (Request["qRegisteredNo"] != null)
            {
                iquery = from i in iquery where i.RegisteredNo.Contains(Request["qRegisteredNo"]) select i;
            }
            if (Request["qTrademarkType"] != null)
            {
                iquery = from i in iquery where i.TrademarkType.Contains(Request["qTrademarkType"]) select i;
            }
            if (Request["TrademarkRemark"] != null)
            {
                iquery = from i in iquery where i.TrademarkRemark.Contains(Request["TrademarkRemark"]) select i;
            }
            if (Request["qIs3D"] != null)
            {
                if (Request["qIs3D"] == "1")
                    iquery = from i in iquery where i.Is3D == true select i;
                else
                    iquery = from i in iquery where i.Is3D == null || i.Is3D == false select i;
            }
            if (Request["qIsColor"] != null)
            {
                if (Request["qIsColor"] == "1")
                    iquery = from i in iquery where i.IsColor == true select i;
                else
                    iquery = from i in iquery where i.IsColor == null || i.IsColor == false select i;
            }
            if (Request["qIsSound"] != null)
            {
                if (Request["qIsSound"] == "1")
                    iquery = from i in iquery where i.IsSound == true select i;
                else
                    iquery = from i in iquery where i.IsSound == null || i.IsSound == false select i;
            }
            if (Request["qApplyDate"] != null)
            {
                iquery = from i in iquery where i.ApplyDate == Convert.ToDateTime(Request["qApplyDate"]) select i;
            }
            if (Request["qPublicPreliminaryDate"] != null)
            {
                iquery = from i in iquery where i.PublicPreliminaryDate == Convert.ToDateTime(Request["qPublicPreliminaryDate"]) select i;
            }
            if (Request["qRegNoticeDate"] != null)
            {
                iquery = from i in iquery where i.RegNoticeDate >= Convert.ToDateTime(Request["qRegNoticeDate"]) && i.RegNoticeDate <= Convert.ToDateTime(Request["qRegNoticeDate2"]) select i;
            }
            if (Request["qRenewalDate"] != null)
            {
                iquery = from i in iquery where i.RenewalDate >= Convert.ToDateTime(Request["qRenewalDate"]) && i.RenewalDate <= Convert.ToDateTime(Request["qRenewalDate2"]) select i;
            }
            if (Request["qrestDays"] != null)
            {
                iquery = from i in iquery where i.RestDays <= Convert.ToInt32(Request["qrestDays"]) select i;
            }
            if (Request["qStatus"] != null)
            {
                iquery = from i in iquery where i.Status == Convert.ToInt32(Request["qStatus"]) select i;
            }
            if (Request["qAdminStatus"] != null)
            {
                iquery = from i in iquery where i.AdminStatus == Convert.ToInt32(Request["qAdminStatus"]) select i;
            }
            if (Request["qnvc_OrderNumber"] != null)
            {
                iquery = from i in iquery where i.nvc_OrderNum.Contains(Request["qnvc_OrderNumber"]) select i;
            }
            #endregion

            #region 排序参数
            iquery = from i in iquery orderby i.i_Id descending select i;

            if (Request.QueryString["caseno"] != null && Request.QueryString["caseno"] != "")
            {
                caseno = Request.QueryString["caseno"].ToString();
                this.hi_CaseNo.Value = caseno;
                if (caseno == "asc")
                    iquery = from i in iquery orderby i.CaseNo ascending select i;
                else
                    iquery = from i in iquery orderby i.CaseNo descending select i;
            }
            if (Request.QueryString["applyno"] != null && Request.QueryString["applyno"] != "")
            {
                this.applyno = Request.QueryString["applyno"].ToString();
                hi_applyno.Value = applyno;
                if (applyno == "asc")
                    iquery = from i in iquery orderby i.RegisteredNo ascending select i;
                else
                    iquery = from i in iquery orderby i.RegisteredNo descending select i;
            }
            if (Request.QueryString["applyuser"] != null && Request.QueryString["applyuser"] != "")
            {
                this.applyuser = Request.QueryString["applyuser"].ToString();
                hi_applyuser.Value = applyuser;
                if (applyuser == "asc")
                    iquery = from i in iquery orderby i.ApplyName ascending select i;
                else
                    iquery = from i in iquery orderby i.ApplyName descending select i;
            }
            if (Request.QueryString["memberno"] != null && Request.QueryString["memberno"] != "")
            {
                this.memberno = Request.QueryString["memberno"].ToString();
                hi_memberno.Value = memberno;
                if (memberno == "asc")
                    iquery = from i in iquery orderby i.nvc_UserNum ascending select i;
                else
                    iquery = from i in iquery orderby i.nvc_UserNum descending select i;
            }
            if (Request.QueryString["membername"] != null && Request.QueryString["membername"] != "")
            {
                this.membername = Request.QueryString["membername"].ToString();
                hi_membername.Value = membername;
                if (membername == "asc")
                    iquery = from i in iquery orderby i.nvc_Name ascending select i;
                else
                    iquery = from i in iquery orderby i.nvc_Name descending select i;
            }
            if (Request.QueryString["trademarktype"] != null && Request.QueryString["trademarktype"] != "")
            {
                this.trademarktype = Request.QueryString["trademarktype"].ToString();
                hi_trademarktype.Value = trademarktype;
                if (trademarktype == "asc")
                    iquery = from i in iquery orderby i.TrademarkType ascending select i;
                else
                    iquery = from i in iquery orderby i.TrademarkType descending select i;
            }
            if (Request.QueryString["timelimit"] != null && Request.QueryString["timelimit"] != "")
            {
                this.timelimit = Request.QueryString["timelimit"].ToString();
                hi_timelimit.Value = timelimit;
                if (timelimit == "asc")
                    iquery = from i in iquery orderby i.RenewalDate ascending select i;
                else
                    iquery = from i in iquery orderby i.RenewalDate descending select i;
            }
            if (Request.QueryString["timeadd"] != null && Request.QueryString["timeadd"] != "")
            {
                this.timeadd = Request.QueryString["timeadd"].ToString();
                hi_timeadd.Value = timeadd;
                if (timeadd == "asc")
                    iquery = from i in iquery orderby i.InputTime ascending select i;
                else
                    iquery = from i in iquery orderby i.InputTime descending select i;
            }
            if (Request.QueryString["status"] != null && Request.QueryString["status"] != "")
            {
                this.status = Request.QueryString["status"].ToString();
                hi_status.Value = status;
                if (status == "asc")
                    iquery = from i in iquery orderby i.Status ascending select i;
                else
                    iquery = from i in iquery orderby i.Status descending select i;
            }
            #endregion
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        catch
        {
            return null;
        }
    }

    /// <summary>
    /// 删除
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                if (IDList[i] != "")
                {
                    dalmark.Trademark_Del(int.Parse(IDList[i]));
                    Manager.AddLog(0, "商标管理", "删除商标");
                }
            }
        }
        Bind_Rpt_Product(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }

    protected void rep_brand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        string id = e.CommandArgument.ToString();
        var query = from q in dzdc.t_Trademark where q.i_Id == int.Parse(id) select q;
        foreach (var q in query)
        {
            if (e.CommandName.ToString() == "state")
            {
                if (q.i_IsPayState == 0)
                {
                    div_a.InnerHtml = "<script>alert('该商标没缴费，不能通过审核！')</script>";
                    return;
                }
                if (q.i_IsPayState == 4)
                {
                    div_a.InnerHtml = "<script>alert('该商标已经无效！，不能通过审核！')</script>";
                    return;
                }
                else
                {
                    if (q.i_State == 0)
                    {
                        q.i_State = 1;
                        q.dt_PassTime = DateTime.Now;
                    }
                    else
                    {
                        q.i_State = 0;
                        q.dt_PassTime = DateTime.Now;//取消时间
                    }
                }
            }
            dzdc.SubmitChanges();
            Manager.AddLog(0, "商标管理", "修改了商标[ <font color=\"red\">" + q.nvc_SBRegNum + "</font> ]的信息");
        }
        Bind_Rpt_Product(aspPage.CurrentPageIndex);
    }
    protected void Bt_Onsubmit_Click(object sender, EventArgs e)
    {
        Bind_Rpt_Product(aspPage.CurrentPageIndex);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            //int pageindex = Convert.ToInt32(text_pageindex.Value);
            //if (pageindex < 1 || pageindex > aspPage.PageCount)
            //{
            //    div_a.InnerHtml = "<script>alert('页索引超出范围！')</script>";
            //    return;
            //}
            //else
            //{
            //    Bind_Rpt_Product(pageindex);
            //}
        }
        catch { }
    }
}