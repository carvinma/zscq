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
        string qtmapplyname = txt_applyName.Value;
        

        string shenqintime = txt_applydate.Value;
       
        string anjuanhao = txt_memberNo.Value;
        string caddress = txt_address.Value;
        string linkman = txt_memberName.Value;
        string Ctel = txt_phone.Value;
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

        if (shenqintime != "")
        {
            data += "sb_passtime=" + shenqintime + "&";
        }
         
        if (anjuanhao != "")
        {
            data += "c_anjuanhao=" + anjuanhao + "&";
        }
        if (linkman != "")
        {
            data += "c_uname=" + linkman + "&";
        }
        if (caddress != "")
        {
            data += "c_address=" + caddress + "&";
        }
        if (Ctel != "")
        {
            data += "c_tel=" + Ctel + "&";
        }
        Response.Redirect("user_sblb.aspx?" + data);
    }
}