using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Member DALM = new dal_Member();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            int uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            t_Member model = DALM.Member_Select_Id(uId);
            if(model.i_UserTypeId==3)
            {
                disanfang.Visible = true;
            }
        }
        if(!IsPostBack)
        {
            Bind_Drp_PGuoJiaType();
            Bind_PatentType();
        }
    }
    protected void ImgBtn_Search1_Click(object sender, ImageClickEventArgs e)
    {
        string sqlwhere = "";
        if (txt_zlh.Value != "")
        {
            sqlwhere += "&nvc_Number=" + txt_zlh.Value;
        }
        if (txt_zlmc.Value != "")
        {
            sqlwhere += "&nvc_Name=" + txt_zlmc.Value;
        }
        if (txt_zlqr.Value != "")
        {
            sqlwhere += "&nvc_PatentHolder=" + txt_zlqr.Value;
        }
        //if (txt_ajh.Value != "")
        //{
        //    sqlwhere += "&nvc_AnJuanNum=" + txt_ajh.Value;
        //}
        //if (StringHelper.CheckSqlKeyWord(sqlwhere) == false)
        //{
            //if (sqlwhere == "")
            //{
            //    Response.Redirect("User_PatentList.aspx");
            //}
            Response.Redirect("User_PatentList.aspx?sqlwhere=true" + sqlwhere);
        //}
    }
    protected void ImgBtn_Search2_Click(object sender, ImageClickEventArgs e)
    {
        string sqlwhere = "";
        if(txt_XiTongNum.Value!="")
        {
            sqlwhere += "&i_OrderBy=" + txt_XiTongNum.Value;
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
        if (txt_PtcDate.Value != "" && txt_PtcDate2.Value != "")
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
        if (Drp_AnnualFeeStatus.SelectedValue != "0")
        {
            sqlwhere += "&i_AnnualFeeStatus=" + Drp_AnnualFeeStatus.SelectedValue;
        }
        if (txt_AnnualFeeNotPaymentYear.Value != "")
        {
            sqlwhere += "&nvc_AnnualFeeNotPaymentYear=" + txt_AnnualFeeNotPaymentYear.Value;
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
        if (txt_anjuanhao.Value != "")
        {
            sqlwhere += "&nvc_AnJuanNum=" + txt_anjuanhao.Value;
        }
        if (txt_linkman.Value != "")
        {
            sqlwhere += "&nvc_LinkMan=" + txt_linkman.Value;
        }
        if (txt_address.Value != "" && txt_address.Value .Length<500)
        {
            sqlwhere += "&nvc_Address=" + txt_address.Value;
        }
        if (txt_phone.Value != "")
        {
            sqlwhere += "&nvc_Phone=" + txt_phone.Value;
        }
        //if (StringHelper.CheckSqlKeyWord(sqlwhere) == false)
        //{
        //    if (sqlwhere == "")
        //    {
        //        Response.Redirect("User_PatentList.aspx");
        //    }
            Response.Redirect("User_PatentList.aspx?sqlwhere=true" + sqlwhere);
        //}
    }
    protected void Drp_AuthorizeNationalityId_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Drp_AuthorizeNationalityId.SelectedValue == "0")
        {
            Bind_PatentType();
        }
        else
        {
            Bind_PatentType(int.Parse(Drp_AuthorizeNationalityId.SelectedValue));
        }
    }
    /// <summary>
    /// 绑定国籍
    /// </summary>
    void Bind_Drp_PGuoJiaType()
    {
        Drp_PatentHolderNationalityId.Items.Clear();
        Drp_PriorityNationalityId.Items.Clear();
        Drp_AuthorizeNationalityId.Items.Clear();
        ListItem item = new ListItem("Please select", "0");
        Drp_PatentHolderNationalityId.Items.Add(item);
        Drp_PriorityNationalityId.Items.Add(item);
        Drp_AuthorizeNationalityId.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_EnName, q.i_Id.ToString());
            Drp_PatentHolderNationalityId.Items.Add(li);
            Drp_PriorityNationalityId.Items.Add(li);
            Drp_AuthorizeNationalityId.Items.Add(li);
        }
    }
    void Bind_PatentType(int typeid)
    {
        Drp_PatentType.Items.Clear();
        ListItem item = new ListItem("Please select", "0");
        Drp_PatentType.Items.Add(item);
        int count = 0;
        var iquery = DALPT.PatentType_SelectPage(1, 10, typeid, ref count);
        foreach (var q in iquery)
        {
            this.Drp_PatentType.Items.Add(new ListItem(q.nvc_EnglishName, q.i_Id.ToString()));
        }
    }
    void Bind_PatentType()
    {
        Drp_PatentType.Items.Clear();
        ListItem item = new ListItem("Please select", "0");
        Drp_PatentType.Items.Add(item);
        var iquery = DALPT.GetPatentType("en");
        foreach (var q in iquery)
        {
            this.Drp_PatentType.Items.Add(new ListItem(q.nvc_EnglishName, q.i_Id.ToString()));

        }
    }
}