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
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_DataOrder DALDO = new dal_DataOrder();
    public string PageType = "查询专利";
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
            Bind_Drp_PGuoJiaType();
            Bind_PatentType();
        }
       
    }

    void Bind_Drp_PGuoJiaType()// 绑定国籍
    {
        Drp_PatentHolderNationalityId.Items.Clear();
        Drp_PriorityNationalityId.Items.Clear();
        Drp_AuthorizeNationalityId.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_GuoJiId.Items.Add(item);
        Drp_PatentHolderNationalityId.Items.Add(item);
        Drp_PriorityNationalityId.Items.Add(item);
        Drp_AuthorizeNationalityId.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_GuoJiId.Items.Add(li);
            Drp_PatentHolderNationalityId.Items.Add(li);
            Drp_PriorityNationalityId.Items.Add(li);
            Drp_AuthorizeNationalityId.Items.Add(li);
        }
    }
   
    protected void btOK_Click(object sender, EventArgs e)
    {
        string sqlwhere="";
        if (txt_UserNum.Value != "")
        {
            sqlwhere += "&nvc_UserNum=" + txt_UserNum.Value;
        }
        if (txt_UserName.Value != "")
        {
            sqlwhere += "&nvc_UserName=" + txt_UserName.Value;
        }
        if (Drp_GuoJiId.SelectedValue != "0")
        {
            sqlwhere += "&i_GuoJiId=" + Drp_GuoJiId.SelectedValue;
        }
        if (Txt_BillNumber.Value != "")
        {
            try
            {
                t_DataOrder t = DALDO.DataOrder_Select_num(Txt_BillNumber.Value);
                sqlwhere += "&nvc_BillNumber=" + t.i_DataId;
            }
            catch
            {
                sqlwhere += "&nvc_BillNumber=-1";
            }
        }
        if (txt_Number.Value != "")
        {
            sqlwhere += "&nvc_Number=" + txt_Number.Value;
        }
        if (txt_Name.Value != "")
        {
            sqlwhere += "&nvc_Name=" + txt_Name.Value;
        }
        //if (Drp_PatentType.SelectedValue != "0" && Drp_PatentType.SelectedValue != "")
        //{
        //    sqlwhere += "&i_PatentType=" + Drp_PatentType.SelectedValue;
        //}
        if (Drp_PatentType.SelectedValue != "0")
        {
            sqlwhere += "&nvc_PatentTypeName=" + Drp_PatentType.SelectedItem.Text;
        }
        if (txt_yaoqiuxiang.Value != "")
        {
            sqlwhere += "&i_YaoQiuXiang=" + txt_yaoqiuxiang.Value;
        }
        if (txt_PatentHolder.Value != "")
        {
            sqlwhere += "&nvc_PatentHolder=" + txt_PatentHolder.Value;
        }
        if (Drp_PatentHolderNationalityId.SelectedValue != "0")
        {
            sqlwhere += "&i_PatentHolderNationalityId=" + Drp_PatentHolderNationalityId.SelectedValue;
        }
        if (txt_PatentInventor.Value != "")
        {
            sqlwhere += "&nvc_PatentInventor=" + txt_PatentInventor.Value;
        }
        if (Drp_PatentScope.SelectedValue != "0")
        {
            sqlwhere += "&nvc_PatentScope=" + Drp_PatentScope.SelectedValue;
        }
        if (txt_PriorityNumber.Value != "")
        {
            sqlwhere += "&nvc_PriorityNumber=" + txt_PriorityNumber.Value;
        }
        if (Drp_PriorityNationalityId.SelectedValue != "0")
        {
            sqlwhere += "&i_PriorityNationalityId=" + Drp_PriorityNationalityId.SelectedValue;
        }
        if (txt_PriorityDate.Value != "" && txt_PriorityDate2.Value != "")
        {
            sqlwhere += "&dt_PriorityDate=" + txt_PriorityDate.Value;
            sqlwhere += "&dt_PriorityDate2=" + txt_PriorityDate2.Value;
        }
        if (txt_PtcNumber.Value != "")
        {
            sqlwhere += "&nvc_PtcNumber=" + txt_PtcNumber.Value;
        }
        if (txt_PtcDate.Value != ""&&txt_PtcDate2.Value != "")
        {
            sqlwhere += "&dt_PtcDate=" + txt_PtcDate.Value;
            sqlwhere += "&dt_PtcDate2=" + txt_PtcDate2.Value;
        }
        if (Drp_AuthorizeNationalityId.SelectedValue != "0")
        {
            sqlwhere += "&i_AuthorizeNationalityId=" + Drp_AuthorizeNationalityId.SelectedValue;
        }
        if (txt_AuthorizeIsNationalityDate.Value != "" && txt_AuthorizeIsNationalityDate2.Value != "")
        {
            sqlwhere += "&dt_AuthorizeIsNationalityDate=" + txt_AuthorizeIsNationalityDate.Value;
            sqlwhere += "&dt_AuthorizeIsNationalityDate2=" + txt_AuthorizeIsNationalityDate2.Value;
        }
        if (txt_AuthorizeIsAuthorizeDate.Value != "" && txt_AuthorizeIsAuthorizeDate2.Value != "")
        {
            sqlwhere += "&dt_AuthorizeIsAuthorizeDate=" + txt_AuthorizeIsAuthorizeDate.Value;
            sqlwhere += "&dt_AuthorizeIsAuthorizeDate2=" + txt_AuthorizeIsAuthorizeDate2.Value;
        }
        if (txt_AnnualFeeYear.Value != "")
        {
            sqlwhere += "&i_AnnualFeeYear=" + txt_AnnualFeeYear.Value;
        }
        if (txt_AnnualFeeRestYear.Value != "")
        {
            sqlwhere += "&i_AnnualFeeRestYear=" + txt_AnnualFeeRestYear.Value;
        }
        if (txt_AnnualFeeDateStart.Value != "" && txt_AnnualFeeDateStart2.Value != "")
        {
            sqlwhere += "&dt_AnnualFeeDateStart=" + txt_AnnualFeeDateStart.Value;
            sqlwhere += "&dt_AnnualFeeDateStart2=" + txt_AnnualFeeDateStart2.Value;
        }
        if (txt_AnnualFeeDateEnd.Value != "")
        {
            sqlwhere += "&dt_AnnualFeeDateEnd=" + txt_AnnualFeeDateEnd.Value;
        }
        if (Drp_AnnualFeeStatus.SelectedValue != "0")
        {
            sqlwhere += "&i_AnnualFeeStatus=" + Drp_AnnualFeeStatus.SelectedValue;
        }
        if (txt_AnnualFeePaymentYear.Value != "")
        {
            sqlwhere += "&nvc_AnnualFeePaymentYear=" + txt_AnnualFeePaymentYear.Value;
        }
        if (txt_AnnualFeeNotPaymentYear.Value != "")
        {
            sqlwhere += "&nvc_AnnualFeeNotPaymentYear=" + txt_AnnualFeeNotPaymentYear.Value;
        }
        if (txt_AnnualFeePrevYear.Value != "" && txt_AnnualFeePrevYear2.Value != "")
        {
            sqlwhere += "&dt_AnnualFeePrevYear=" + txt_AnnualFeePrevYear.Value;
            sqlwhere += "&dt_AnnualFeePrevYear2=" + txt_AnnualFeePrevYear2.Value;
        }
        if (txt_AnnualFeeNextYear.Value != "" && txt_AnnualFeeNextYear2.Value != "")
        {
            sqlwhere += "&dt_AnnualFeeNextYear=" + txt_AnnualFeeNextYear.Value;
            sqlwhere += "&dt_AnnualFeeNextYear2=" + txt_AnnualFeeNextYear2.Value;
        }
        if (txt_AnnualFeeRestDay.Value != "")
        {
            sqlwhere += "&i_AnnualFeeRestDay=" + txt_AnnualFeeRestDay.Value;
        }
        //if (txt_AnnualFeeNextPaymentMoney.Value != "")
        //{
        //    sqlwhere += "&dm_AnnualFeeNextPaymentMoney=" + txt_AnnualFeeNextPaymentMoney.Value;
        //}
        //if (txt_RemittanceFee.Value != "")
        //{
        //    sqlwhere += "&dm_RemittanceFee=" + txt_RemittanceFee.Value;
        //}
        //if (txt_RemittanceFee.Value != "")
        //{
        //    sqlwhere += "&dm_RemittanceFee=" + txt_RemittanceFee.Value;
        //}
        //if (txt_AgentServiceFee.Value != "")
        //{
        //    sqlwhere += "&dm_AgentServiceFee=" + txt_AgentServiceFee.Value;
        //}
        //if (txt_chaoxiang.Value != "")
        //{
        //    sqlwhere += "&dm_ChaoXiangFee=" + txt_chaoxiang.Value;
        //}
        //if (txt_FeeSubtotal.Value != "")
        //{
        //    sqlwhere += "&dm_FeeSubtotal=" + txt_FeeSubtotal.Value;
        //}
        if (txt_anjuanhao.Value != "")
        {
            sqlwhere += "&nvc_AnJuanNum=" + txt_anjuanhao.Value;
        }
        if (txt_linkman.Value != "")
        {
            sqlwhere += "&nvc_LinkMan=" + txt_linkman.Value;
        }
        if (txt_address.Value != "")
        {
            sqlwhere += "&nvc_Address=" + txt_address.Value;
        }
        if (txt_phone.Value != "")
        {
            sqlwhere += "&nvc_Phone=" + txt_phone.Value;
        }
        Response.Redirect("Shop_M_Patent.aspx?sqlwhere=true" + sqlwhere);
    }
    protected void Drp_AuthorizeNationalityId_SelectedIndexChanged(object sender, EventArgs e)
    {
        Drp_PatentType.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_PatentType.Items.Add(item);
        if (Drp_AuthorizeNationalityId.SelectedValue == "0")
        {
            Bind_PatentType();
        }
        else
        {
            Bind_PatentType(int.Parse(Drp_AuthorizeNationalityId.SelectedValue));
        }
    }
    void Bind_PatentType(int typeid)
    {
        Drp_PatentType.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_PatentType.Items.Add(item);
        int count = 0;
        var iquery = DALPT.PatentType_SelectPage(1, 10, typeid, ref count);
        foreach (var q in iquery)
        {
            this.Drp_PatentType.Items.Add(new ListItem(q.nvc_Name, q.i_Id.ToString()));
        }
    }
    void Bind_PatentType()
    {
        Drp_PatentType.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_PatentType.Items.Add(item);
        var iquery = DALPT.GetPatentType("cn");
        foreach (var q in iquery)
        {
            this.Drp_PatentType.Items.Add(new ListItem(q.nvc_Name, q.i_Id.ToString()));

        }
    }
}