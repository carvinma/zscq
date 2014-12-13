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

public partial class Q_M_TradeMarkSelect : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(11, 0);
    public bool pageadd = Manager.GetManagerQX(11, 1);
    public bool pageupdate = Manager.GetManagerQX(11, 2);
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_DataOrder DALDO = new dal_DataOrder();
    public string PageType = "查询商标";
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
        }
        if (!IsPostBack)
        {
            Bind_Drp();
        }

    }

    void Bind_Drp()// 绑定状态
    {
        Drp_Status.Items.Clear();
        List<t_NewTradeMarkStatus> tradeMarkapplyStatuslist;
        tradeMarkapplyStatuslist = BaseDataUtil.tradeMarkApplyStatuslist.ToList();
        tradeMarkapplyStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = null });
        if (this.Drp_CaseType.SelectedValue == "-1")
        {
            foreach (var item in BaseDataUtil.tradeMarkRenewedStatuslist)
            {
                tradeMarkapplyStatuslist.Add(item);
            }
        }

        else if (this.Drp_CaseType.SelectedValue == "1")
        {
            tradeMarkapplyStatuslist.Clear();
            tradeMarkapplyStatuslist = BaseDataUtil.tradeMarkRenewedStatuslist.ToList();
            tradeMarkapplyStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = null });
        }
        this.Drp_Status.DataSource = tradeMarkapplyStatuslist;
        this.Drp_Status.DataTextField = "StatusName";
        this.Drp_Status.DataValueField = "StatusValue";
        this.Drp_Status.DataBind();

        Drp_AdminStatus.Items.Clear();
        List<t_NewTradeMarkStatus> tradeMarkStatuslist = BaseDataUtil.tradeMarkStatuslist.ToList();
        tradeMarkStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = null });
        this.Drp_AdminStatus.DataSource = tradeMarkStatuslist;
        this.Drp_AdminStatus.DataTextField = "StatusName";
        this.Drp_AdminStatus.DataValueField = "StatusValue";
        this.Drp_AdminStatus.DataBind();
    }

    protected void btOK_Click(object sender, EventArgs e)
    {
        string sqlwhere = "";
        if (!string.IsNullOrEmpty(txt_UserNum.Value))
        {
            sqlwhere += "&qnvc_UserNum=" + txt_UserNum.Value.Trim();
        }
        if (!string.IsNullOrEmpty(txt_UserName.Value))
        {
            sqlwhere += "&qnvc_UserName=" + txt_UserName.Value.Trim();
        }
        if (!string.IsNullOrEmpty(Txt_applyName.Value))
        {
            sqlwhere += "&qapplyName=" + Txt_applyName.Value.Trim();
        }

        if (!string.IsNullOrEmpty(Hi_prov.Value))
        {
            sqlwhere += "&qProvinceId=" + Hi_prov.Value;
        }
        if (!string.IsNullOrEmpty(Hi_city.Value))
        {
            sqlwhere += "&qCityId=" + Hi_city.Value;
        }
        if (!string.IsNullOrEmpty(Hi_country.Value))
        {
            sqlwhere += "&qAreaId=" + Hi_country.Value;
        }

        if (!string.IsNullOrEmpty(this.txt_address.Value))
        {
            sqlwhere += "&qaddress=" + txt_address.Value.Trim();
        }
        
        if (this.Drp_CaseType.SelectedValue != "-1")
        {
            sqlwhere += "&qi_Type=" + Drp_CaseType.SelectedValue;
        }
        if (!string.IsNullOrEmpty(this.txt_caseNo.Value))
        {
            sqlwhere += "&qCaseNo=" + txt_caseNo.Value.Trim();
        }
        if (!string.IsNullOrEmpty(txt_applyNo.Value))
        {
            sqlwhere += "&qRegisteredNo=" + txt_applyNo.Value.Trim();
        }
        if (!string.IsNullOrEmpty(txt_traceMarkType.Value))
        {
            sqlwhere += "&qTrademarkType=" + txt_traceMarkType.Value.Trim();
        }
        if (!string.IsNullOrEmpty(txt_traceMarkRemark.Value))
        {
            sqlwhere += "&qTrademarkRemark=" + txt_traceMarkRemark.Value.Trim();
        }
        if (Drp_3D.SelectedValue != "-1")
        {
            sqlwhere += "&qIs3D=" + Drp_3D.SelectedValue;
        }
        if (Drp_Color.SelectedValue != "-1")
        {
            sqlwhere += "&qIsColor=" + Drp_Color.SelectedValue;
        }
        if (Drp_Sound.SelectedValue != "-1")
        {
            sqlwhere += "&qIsSound=" + Drp_Sound.SelectedValue;
        }
        if (!string.IsNullOrEmpty(txt_ApplyDate.Value))
        {
            sqlwhere += "&qApplyDate=" + txt_ApplyDate.Value.Trim();
        }
        if (!string.IsNullOrEmpty(txt_PublicPreliminaryDate.Value))
        {
            sqlwhere += "&qPublicPreliminaryDate=" + txt_PublicPreliminaryDate.Value.Trim();
        }

        if (txt_RegNoticeDateBegin.Value != "" && txt_RegNoticeDateEnd.Value != "")
        {
            sqlwhere += "&qRegNoticeDate=" + txt_RegNoticeDateBegin.Value.Trim();
            sqlwhere += "&qRegNoticeDate2=" + txt_RegNoticeDateEnd.Value.Trim();
        }

        if (txt_RenewalDateBegin.Value != "" && txt_RenewalDateEnd.Value != "")
        {
            sqlwhere += "&qRenewalDate=" + txt_RenewalDateBegin.Value.Trim();
            sqlwhere += "&qRenewalDate2=" + txt_RenewalDateEnd.Value.Trim();
        }

        if (!string.IsNullOrEmpty(txt_restDays.Value))
        {
            sqlwhere += "&qrestDays=" + txt_restDays.Value;
        }
        if (!string.IsNullOrEmpty(Drp_Status.SelectedValue))
        {
            sqlwhere += "&qStatus=" + Drp_Status.SelectedValue;
        }
        if (!string.IsNullOrEmpty(Drp_AdminStatus.SelectedValue))
        {
            sqlwhere += "&qAdminStatus=" + Drp_AdminStatus.SelectedValue;
        }

        if (!string.IsNullOrEmpty(txt_AccountNo.Value))
        {
            sqlwhere += "&qnvc_OrderNumber=" + txt_AccountNo.Value.Trim();
        }
        Response.Redirect("L_M_Trademark.aspx?sqlwhere=true" + sqlwhere);
    }

    protected void Drp_CaseType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Drp();
    }
}