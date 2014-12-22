using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
public partial class trademark_query : System.Web.UI.Page
{
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    public int MemberId = 0, userType = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            MemberId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            t_Member mm = DALM.Member_Select_Id(MemberId);
            if (mm != null)
            {
                if (mm.i_UserTypeId == 3)
                {
                    userType = 3;
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        if (!IsPostBack)
            Bind_Drp_AdminStatus();
    }
    private void Bind_Drp_AdminStatus()
    {
        List<t_NewTradeMarkStatus> tradeMarkStatuslist = BaseDataUtil.tradeMarkStatuslist.ToList();
        tradeMarkStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = null });
        this.ddlAdminStatus.DataSource = tradeMarkStatuslist;
        this.ddlAdminStatus.DataTextField = "StatusName";
        this.ddlAdminStatus.DataValueField = "StatusValue";
        this.ddlAdminStatus.DataBind();
    }
    protected void bt_kuaijiansuo_Click(object sender, EventArgs e)
    {
        string qtmcaseno = txt_CaseNo0.Value;
        string qtmtype = txt_TrademarkType0.Value;
        string qtmapplyname = txt_applyName0.Value;
        string data = "";
        if (qtmcaseno != "")
        {
            data += "qtmcaseno=" + qtmcaseno + "&";
        }
        if (qtmtype != "")
        {
            data += "qtmtype=" + qtmtype + "&";
        }
        if (qtmapplyname != "")
        {
            data += "qtmapplyname=" + qtmapplyname + "&";
        }
        if (!string.IsNullOrEmpty(hi_Status.Value))
        {
            data += "qtmstatus=" + hi_Status.Value + "&";
        }


        if (!string.IsNullOrEmpty(hi_CaseType.Value))
        {
            if (hi_CaseType.Value == "0")
            {
                Response.Redirect("trademark_list.aspx?" + data);
            }
            else
            {
                Response.Redirect("trademarkrenewal_list.aspx?" + data);
            }
        }
    }
    protected void bt_jiansuoAll_Click(object sender, EventArgs e)
    {
        string qtmcaseno = txt_CaseNo.Value;
        string qtmtype = txt_TrademarkType.Value;
        string qtmapplyname = txt_applyName.Value.Trim();


        string qtmmemberno = txt_memberNo.Value.Trim();
        string qtmmembername = txt_memberName.Value.Trim();

        string qtmprovinceid = Hi_prov.Value;
        string qtmcityid = Hi_city.Value;
        string qtmareaid = Hi_country.Value;
        string qtmaddress = txt_address.Value.Trim();

        string qtmcontactPerson = txt_contactPerson.Value.Trim();
        string qtmphone = txt_phone.Value.Trim();
        string qtmapplyno = txt_regNo.Value.Trim();
        string qtmtradmemarkRemark = txt_remark.Value.Trim();

        string qtmis3D = ddl3D.SelectedValue;
        string qtmisColor = ddlColor.SelectedValue;
        string qtmisSound = ddlSound.SelectedValue;
        string qtmapplydate = txt_applydate.Value.Trim();
        string qtmpublicDate = txt_publicdate.Value.Trim();
        string qtmRegNoticeBeginDate = txt_regDateBegin.Value.Trim();
        string qtmRegNoticeEndDate = txt_regDateEnd.Value.Trim();
        string qtmRenewalBeginDate = txt_regDateBegin.Value.Trim();
        string qtmRenewalEndDate = txt_regDateEnd.Value.Trim();
        string qtmrestDays = txt_restDays.Value.Trim();
        string qtmadminStatus = ddlAdminStatus.SelectedValue;

        string data = "";

        if (!string.IsNullOrEmpty(qtmcaseno))
        {
            data += "qtmcaseno=" + qtmcaseno + "&";
        }
        if (!string.IsNullOrEmpty(qtmtype))
        {
            data += "qtmtype=" + qtmtype + "&";
        }
        if (!string.IsNullOrEmpty(qtmapplyname))
        {
            data += "qtmapplyname=" + qtmapplyname + "&";
        }
        if (!string.IsNullOrEmpty(hi_Status.Value))
        {
            data += "qtmstatus=" + hi_Status.Value + "&";
        }

        if (!string.IsNullOrEmpty(qtmmemberno))
        {
            data += "qtmmemberno=" + qtmmemberno + "&";
        }
        if (!string.IsNullOrEmpty(qtmmembername))
        {
            data += "qtmmembername=" + qtmmembername + "&";
        }
        if (!string.IsNullOrEmpty(qtmprovinceid))
        {
            data += "qtmprovinceid=" + qtmprovinceid + "&";
        }
        if (!string.IsNullOrEmpty(qtmcityid))
        {
            data += "qtmcityid=" + qtmcityid + "&";
        }
        if (!string.IsNullOrEmpty(qtmareaid))
        {
            data += "qtmareaid=" + qtmareaid + "&";
        }
        if (!string.IsNullOrEmpty(qtmaddress))
        {
            data += "qtmaddress=" + qtmaddress + "&";
        }
        if (!string.IsNullOrEmpty(qtmcontactPerson))
        {
            data += "qtmcontactPerson=" + qtmcontactPerson + "&";
        }
        if (!string.IsNullOrEmpty(qtmphone))
        {
            data += "qtmphone=" + qtmphone + "&";
        }
        if (!string.IsNullOrEmpty(qtmapplyno))
        {
            data += "qtmapplyno=" + qtmapplyno + "&";
        }
        if (!string.IsNullOrEmpty(qtmtradmemarkRemark))
        {
            data += "qtmtradmemarkRemark=" + qtmtradmemarkRemark + "&";
        }
        if (!string.IsNullOrEmpty(qtmis3D))
        {
            data += "qtmis3D=" + qtmis3D + "&";
        }
        if (!string.IsNullOrEmpty(qtmisColor))
        {
            data += "qtmisColor=" + qtmisColor + "&";
        }
        if (!string.IsNullOrEmpty(qtmisSound))
        {
            data += "qtmisSound=" + qtmisSound + "&";
        }
        if (!string.IsNullOrEmpty(qtmapplydate))
        {
            data += "qtmapplydate=" + qtmapplydate + "&";
        }
        if (!string.IsNullOrEmpty(qtmpublicDate))
        {
            data += "qtmpublicDate=" + qtmpublicDate + "&";
        }
        if (!string.IsNullOrEmpty(qtmRegNoticeBeginDate))
        {
            data += "qtmRegNoticeBeginDate=" + qtmRegNoticeBeginDate + "&";
        }
        if (!string.IsNullOrEmpty(qtmRegNoticeEndDate))
        {
            data += "qtmRegNoticeEndDate=" + qtmRegNoticeEndDate + "&";
        }
        if (!string.IsNullOrEmpty(qtmRenewalBeginDate))
        {
            data += "qtmRenewalBeginDate=" + qtmRenewalBeginDate + "&";
        }
        if (!string.IsNullOrEmpty(qtmRenewalEndDate))
        {
            data += "qtmRenewalEndDate=" + qtmRenewalEndDate + "&";
        }
        if (!string.IsNullOrEmpty(qtmrestDays))
        {
            data += "qtmrestDays=" + qtmrestDays + "&";
        }
        if (!string.IsNullOrEmpty(qtmadminStatus))
        {
            data += "qtmadminStatus=" + qtmadminStatus + "&";
        }


        if (!string.IsNullOrEmpty(hi_CaseType.Value))
        {
            if (hi_CaseType.Value == "0")
            {
                Response.Redirect("trademark_list.aspx?" + data);
            }
            else
            {
                Response.Redirect("trademarkrenewal_list.aspx?" + data);
            }
        }
    }
}