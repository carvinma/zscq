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
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_UserGrade DALUG = new dal_UserGrade();
    dal_DataOrder DALDO = new dal_DataOrder();
    public StringBuilder img_color = new StringBuilder();
    public string returnurl = "", href = "";
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
        if (Request.UrlReferrer != null)
        {
            href = Request.UrlReferrer.ToString();
        }
        else
        {
            href = "Shop_M_PatentOrder.aspx";
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    /// <summary>
    /// 通过会员编号得到该会员的专利个数
    /// </summary>
    /// <param name="userNum"></param>
    /// <returns></returns>
    //private int GetPatentCountByUserNum(string userNum)
    //{
    //    int count = 0;
    //    var result = from r in dzdc.t_Patent where r.nvc_UserNum == userNum select r;
    //    count = result.Count();
    //    return count;
    //}
    void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null)
        {
            hd_id.Value = Request.QueryString["id"].ToString();
            #region 更新费用
            t_Patent tp = DALP.Patent_Select_Id(Convert.ToInt32(hd_id.Value));
            if (tp != null)
            {
                DALP.EditPatentFee(tp);
            }
            #endregion
            vw_Patent model = DALP.Patent_SelectView_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                hd_userId.Value = model.nvc_UserNum;
                Ltl_MemberId.Text = model.nvc_UserNum;

                t_Member memberModel = DALM.Member_Select_ByUserNum(model.nvc_UserNum);
                //Ltl_UserName.Text = memberModel.nvc_Name;
                //Ltl_UserRealName.Text = memberModel.nvc_RealName;
                //Ltl_UserNum.Text = memberModel.nvc_UserNum;
                //Ltl_UserGuoJi.Text = DALN.Nationality_Select_Id(memberModel.i_GuoJiId).nvc_Name;
                //Ltl_UserMobilePhone.Text = memberModel.nvc_MobilePhone;
                //Ltl_UserEmail.Text = memberModel.nvc_Email;
                //Ltl_UserPatentCount.Text = GetPatentCountByUserNum(memberModel.nvc_UserNum).ToString();
                //客户信息及费用信息
                Ltl_VipNumber.Text = memberModel.nvc_UserNum;
                //Ltl_VipLoginName.Text = memberModel.nvc_Name;
                //Ltl_VipRegisterTime.Text = memberModel.dt_AddTime.ToString();
                Ltl_VipKeHuName.Text = memberModel.nvc_RealName;
                Ltl_VipKeHuEnglishName.Text = memberModel.nvc_EnglishName;
                //Ltl_VipGuoJi.Text = DALN.Nationality_Select_Id(memberModel.i_GuoJiId).nvc_Name;
                Ltl_VipCompanyAddress.Text = memberModel.nvc_Address;
                Ltl_VipCompanyZip.Text = memberModel.nvc_ZipCode;
                //Ltl_VipCompanyHomePage.Text = memberModel.nvc_CompanyHomePage; 
                Ltl_VipLinkName.Text = memberModel.nvc_LinkName;
                //Ltl_VipLinkMobilePhone.Text = memberModel.nvc_MobilePhone;
                //Ltl_VipLinkPhone.Text = memberModel.nvc_TelPhone;
                //Ltl_VipLinkFax.Text = memberModel.nvc_LinkManFax;
                Ltl_VipLinkEmail.Text = memberModel.nvc_Email;
                //Ltl_VipLinkQQ.Text = memberModel.nvc_LinkManQQ;
                //Ltl_VipLinkSKYPE.Text = memberModel.nvc_LinkManSKYPE;
                //Ltl_VipLinkMSN.Text = memberModel.nvc_LinkManMSN;
                Ltl_VipYuFuKuan.Text = memberModel.dm_YuFuKuan.ToString();
                Ltl_VipYuE.Text = memberModel.dm_YuE.ToString();
                Ltl_VipQianFei.Text = memberModel.dm_QianFei.ToString();
                //Ltl_VipBiZhong.Text = model.nvc_CurrencyType;
                Ltl_VipBiZhong.Text = DALN.Nationality_Select_Id(memberModel.i_GuoJiId).nvc_JFBizhong;
                //Ltl_VipXinYong.Text = DALUG.UserGrade_Select_Id(memberModel.i_Grade).nvc_Name;
                Ltl_VipXinYong.Text = "<img src='../" + DALUG.UserGrade_Select_Id(memberModel.i_Grade).nvc_Logo + "' alt='" + DALUG.UserGrade_Select_Id(memberModel.i_Grade).nvc_Name + "' height='26' title='" + DALUG.UserGrade_Select_Id(memberModel.i_Grade).nvc_Name + "'>";
                //=======================================================
                //Ltl_BillNumber.Text = model.nvc_OrderNum;
                Ltl_Number.Text = model.nvc_Number;
                Ltl_Name.Text = model.nvc_Name;
                Ltl_PatentType.Text = model.nvc_PatentTypeName;
                Ltl_PatentHolder.Text = model.nvc_PatentHolder;
                Ltl_yaoqiuxiang.Text = model.i_YaoQiuXiang.ToString();
                if (model.i_PatentHolderNationalityId > 0)
                {
                    Ltl_PatentHolderNationalityId.Text = DALN.Nationality_Select_Id(model.i_PatentHolderNationalityId).nvc_Name;
                }
                Ltl_PatentInventor.Text = model.nvc_PatentInventor;

                Ltl_PatentScope.Text = model.nvc_PatentScope;
                Ltl_PriorityNumber.Text = model.nvc_PriorityNumber;
                if (model.i_PriorityNationalityId != 0)
                {
                    Ltl_PriorityNationalityId.Text = DALN.Nationality_Select_Id(model.i_PriorityNationalityId).nvc_Name;
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
                Ltl_AuthorizeNationalityId.Text = DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_Name;

                Ltl_AuthorizeIsNationalityDate.Text = Convert.ToDateTime(model.dt_AuthorizeIsNationalityDate).ToShortDateString();
                Ltl_AuthorizeIsAuthorizeDate.Text = model.dt_AuthorizeIsAuthorizeDate != null ? Convert.ToDateTime(model.dt_AuthorizeIsAuthorizeDate).ToShortDateString() : "";

                Ltl_AnnualFeeYear.Text = model.i_AnnualFeeYear.ToString();
                Ltl_AnnualFeeRestYear.Text = model.i_AnnualFeeRestYear.ToString();
                Ltl_AnnualFeeDateStart.Text = Convert.ToDateTime(model.dt_AnnualFeeDateStart).ToShortDateString();
                Ltl_AnnualFeeDateEnd.Text = Convert.ToDateTime(model.dt_AnnualFeeDateEnd).ToShortDateString();

                Ltl_AnnualFeeStatus.Text = DALP.GetStatus(Convert.ToInt32(model.i_AnnualFeeStatus));

                Ltl_AnnualFeePaymentYear.Text = model.nvc_AnnualFeePaymentYear;

                Ltl_AnnualFeePrevYear.Text = Convert.ToDateTime(model.dt_AnnualFeePrevYear).ToShortDateString();

                //已完成所有年度缴费当专利状态是这个状态的时候，以下内容都为空
                if (model.i_AnnualFeeStatus != 13)
                {
                    #region 缴费信息
                    Ltl_AnnualFeeNextYear.Text = Convert.ToDateTime(model.dt_AnnualFeeNextYear).ToShortDateString();
                    Ltl_AnnualFeeRestDay.Text = model.i_AnnualFeeRestDay.ToString();
                    Ltl_AnnualFeeNotPaymentYear.Text = model.nvc_AnnualFeeNotPaymentYear;
                    Ltl_AnnualFeeNextPaymentMoney.Text = model.dm_AnnualFeeNextPaymentMoney.ToString();
                    Ltl_AgentServiceFee.Text = model.dm_AgentServiceFee.ToString();
                    Ltl_RemittanceFee.Text = model.dm_RemittanceFee.ToString();
                    Ltl_chaoxiang.Text = model.dm_ChaoXiangFee.ToString();
                    Ltl_jianmian1.Text = model.i_JianMian1.ToString() + " % ";
                    #region 滞纳金
                    //滞纳金算法 根据专利类型和专利年度得到专利费用的滞纳金 然后根据专利的到期剩余天数 算出专利过期几个月 
                    //dt_AnnualFeeNextYear到期日期
                    //i_AnnualFeeRestDay到期剩余天数 每天都会减一
                    //if (model.i_AnnualFeeRestDay < 0)
                    //{
                    //    string str = DALP.GetZhiNaJinByPatentInfo(model.i_AnnualFeeRestDay, model.i_PatentType, model.nvc_AnnualFeeNotPaymentYear);
                    //    Ltl_zhinajin.Text = "【第" + str.Split(',')[0] + "个月：" + str.Split(',')[1] + "】";
                    //    t_Patent tp = DALP.Patent_Select_Id(model.i_Id);
                    //    tp.nvc_ZhiNaJin = str.Split(',')[1];
                    //    tp.dm_FeeSubtotal += Convert.ToDecimal(str.Split(',')[1]);
                    //    DALP.Patent_Update(tp);
                    //}
                    Ltl_zhinajin.Text = model.nvc_ZhiNaJin;
                    #endregion
                    Ltl_FeeSubtotal.Text = model.dm_FeeSubtotal.ToString();
                    Ltl_HuoBiType.Text = model.nvc_CurrencyType;
                    #endregion
                }
               
                //DateTime begintime = DateTime.Parse(Ltl_AnnualFeeNextYear.Text);
                //DateTime endtime = DateTime.Parse(DateTime.Now.ToShortDateString());
                //TimeSpan ts = begintime - endtime;

                Ltl_OrderBy.Text = model.i_OrderBy.ToString();
                Ltl_anjuanhao.Text = model.nvc_AnJuanNum;
                Ltl_linkman.Text = model.nvc_LinkMan;
                Ltl_address.Text = model.nvc_Address;
                Ltl_phone.Text = model.nvc_Phone;

                Ltl_Show.Text= model.i_Show == 1 ? "是" : "否";
                Ltl_ReceiveEmail.Text = model.i_ReceiveEmail == 1 ? "是" : "否";

                Bind_Rpt_Patent(int.Parse(Request.QueryString["id"].ToString()));

            }
        }
    }
    public void Bind_Rpt_Patent(int did)
    {
        int Ccount = 0;
        reptlist.DataSource = DALDO.DataOrder_SelectPage(1, 10000, did, 1, "", "", ref Ccount);
        reptlist.DataBind();
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALDO.DataOrder_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "商标账单管理", "删除商标账单");
        }

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            int Id = int.Parse(Request.QueryString["id"].ToString());
            Bind_Rpt_Patent(Id);

        }
        HiddenDel.Value = "del";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            t_DataOrder model = new t_DataOrder();
            string data = HI_ATT.Value;
            if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
            {
                int Id = int.Parse(Request.QueryString["id"].ToString());
                if (data != "")
                {
                    string[] liststr = data.Split('|');
                    for (int i = 0; i < liststr.Length - 1; i++)
                    {
                        string[] lname = liststr[i].Split('_');
                        if (lname[0].ToString() != "")
                        {
                            model.i_OrderType = 1;//专利
                            model.i_DataId = Id;//商标id
                            model.nvc_OrderNum = lname[0].ToString();
                            if (lname[1].ToString() != "")
                            {
                                model.dt_AddOrderTime = DateTime.Parse(lname[1].ToString());
                            }
                            if (lname[2].ToString() != "")
                            {
                                model.dt_ShouKuanTime = DateTime.Parse(lname[2].ToString());
                            }
                            if (lname[3].ToString() != "")
                            {
                                model.dt_JiaoFeiTime = DateTime.Parse(lname[3].ToString());
                            }
                            if (lname[4].ToString() != "")
                            {
                                model.dt_SendInfoTime = DateTime.Parse(lname[4].ToString());
                            }
                            if (lname[5].ToString() != "")
                            {
                                model.dt_KaiJuTime = DateTime.Parse(lname[5].ToString());
                            }
                            model.nvc_Info1 = lname[6].ToString();
                            model.nvc_Info2 = lname[7].ToString();
                            model.dt_Addtime = DateTime.Now;
                            int ss = DALDO.DataOrder_Add(model);
                            Response.Redirect(Request.Url.ToString());
                        }
                    }
                }
            }
        }
        catch { }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shop_A_PatentExport.aspx?pId=" + hd_id.Value);
    }
}