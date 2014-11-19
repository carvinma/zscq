using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;
using System.Text;
public partial class Shop_A_PatentType : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(44, 0);
    public bool pageadd = Manager.GetManagerQX(44, 1);
    public bool pageupdate = Manager.GetManagerQX(44, 2);
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentYear DALPY = new dal_PatentYear();
    dal_PatentFee DALPF = new dal_PatentFee();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    public string PageType = "添加专利类型";
    public StringBuilder img_color = new StringBuilder();
    public string content = "";
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
            Bind_Rpt_CbList();
            Bind_Drp_GuoJiaType();
            Bind_Page_Info();
        }
    }
    void Bind_Drp_GuoJiaType()
    {
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_GuoJiaType.Items.Add(li);
        }
    }
    void Bind_Rpt_CbList()
    {
        Rpt_CbList.DataSource = DALPY.PatentYear_SelectAll();
        Rpt_CbList.DataBind();
    }

    public void Bind_Page_Info()//专利类型内容绑定
    {
        if (Request.QueryString["id"] != null)
        {
            PageType = "修改专利类型";
            hd.Value = Request.QueryString["id"].ToString();
            t_PatentType model = DALPT.PatentType_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                Drp_GuoJiaType.SelectedValue = model.i_GuoJiaId.ToString();
                Hi_OldGuoJi.Value = model.i_GuoJiaId.ToString();
                txt_zhongwen.Value = model.nvc_Name;
                txt_yingwen.Value = model.nvc_EnglishName;
                txt_riwen.Value = model.nvc_JapaneseName;
                txt_hanwen.Value = model.nvc_koreanName;

                txt_youxiaoqi.Value = model.i_YouXiaoQi.ToString();
                rb_youxiaoqi1.Checked = model.i_YouXiaoQiStart == 0 ? true : false;
                rb_youxiaoqi2.Checked = model.i_YouXiaoQiStart == 1 ? true : false;
                if (model.i_paymentFirstYear == 0)
                {
                    rb_firstyear1.Checked = true;
                }
                if (model.i_paymentFirstYear == 1)
                {
                    rb_firstyear2.Checked = true;
                }
                if (model.i_paymentFirstYear == 2)
                {
                    rb_firstyear3.Checked = true;
                }
                if (model.i_paymentFirstYear == 3)
                {
                    rb_firstyear4.Checked = true;
                }
                if (model.i_QuanLiYaoQiu == 1)
                {
                    cb_yaoqiuxiang.Checked = true;
                }
                if (model.i_ZhiNaJin == 1)
                {
                    cb_zhinajin.Checked = true;
                }
                if (model.i_ChaoXiang == 1)
                {
                    cb_chaoxiangfee.Checked = true;
                }
                string str = model.nvc_PatentYear;
                if (str != null && str != "")
                {
                    string[] attrId = str.Split('-');
                    for (int i = 0; i < Rpt_CbList.Items.Count; i++)
                    {
                        CheckBox CK = Rpt_CbList.Items[i].FindControl("Cb_Year") as CheckBox;
                        HiddenField HF = Rpt_CbList.Items[i].FindControl("HF") as HiddenField;
                        for (int j = 0; j < attrId.Length - 1; j++)
                        {
                            if (HF.Value == attrId[j].ToString())
                            {
                                CK.Checked = true;
                            }
                        }
                    }
                }

            }
        }
    }
    protected void btOK_Click(object sender, EventArgs e)// 添加专利类型
    {
        t_PatentType model = new t_PatentType();
        string yearsidstr = "";
        if (hd.Value != "0")
        {
            model = DALPT.PatentType_Select_Id(Convert.ToInt32(hd.Value));
            yearsidstr = model.nvc_PatentYear;
        }
        model.i_GuoJiaId = int.Parse(Drp_GuoJiaType.SelectedValue);
        model.nvc_Name = txt_zhongwen.Value.Trim();
        model.nvc_EnglishName = txt_yingwen.Value.Trim();
        model.nvc_JapaneseName = txt_riwen.Value.Trim();
        model.nvc_koreanName = txt_hanwen.Value.Trim();
        model.i_YouXiaoQi = 0;
        if (txt_youxiaoqi.Value != "")
        {
            model.i_YouXiaoQi = Convert.ToInt32(txt_youxiaoqi.Value);
        }
        model.i_YouXiaoQiStart = rb_youxiaoqi1.Checked ? 0 : 1;
        if (rb_firstyear1.Checked)
        {
            model.i_paymentFirstYear = 0;
        }
        if (rb_firstyear2.Checked)
        {
            model.i_paymentFirstYear = 1;
        }
        if (rb_firstyear3.Checked)
        {
            model.i_paymentFirstYear = 2;
        }
        if (rb_firstyear4.Checked)
        {
            model.i_paymentFirstYear = 3;
        }
        model.i_QuanLiYaoQiu = 0;
        if (cb_yaoqiuxiang.Checked)
        {
            model.i_QuanLiYaoQiu = 1;
        }
        model.i_ZhiNaJin = 0;
        if (cb_zhinajin.Checked)
        {
            model.i_ZhiNaJin = 1;
        }
        model.i_ChaoXiang = 0;
        if (cb_chaoxiangfee.Checked)
        {
            model.i_ChaoXiang = 1;
        }
        string yearsid = "";
        string years = "";
        for (int i = 0; i < Rpt_CbList.Items.Count; i++)
        {
            CheckBox CK = Rpt_CbList.Items[i].FindControl("Cb_Year") as CheckBox;
            string id = ((HiddenField)Rpt_CbList.Items[i].FindControl("HF")).Value;
            string yearvalue = ((HiddenField)Rpt_CbList.Items[i].FindControl("HF_Year")).Value;
            if (CK.Checked)
            {
                yearsid += id + "-";
                years += yearvalue + "-";
            }
        }

        if (yearsid != "")
        {
            model.nvc_PatentYear = yearsid.Substring(0, yearsid.Length);
        }
        else
        {
            model.nvc_PatentYear = "";
        }

        if (hd.Value != "0")
        {
            #region 修改国籍的情况下
            if (Hi_OldGuoJi.Value != "0")
            {
                int OldId = int.Parse(Hi_OldGuoJi.Value);
                int NewId = int.Parse(Drp_GuoJiaType.SelectedValue);
                if (OldId != NewId)
                {
                    MessageBox.Show(Page, "注意:年次已经设置过的情况下不能修改国家");
                    return;
                }
            }
            #endregion
            #region
            if (DALPT.PatentType_Update(model) == 1)
            {
                //添加专利费用
                if (yearsid != yearsidstr)//不一样的 话 先删再添加
                {
                    for (int i = 0; i < yearsidstr.Split('-').Length - 1; i++)
                    {
                        int id = (Convert.ToInt32(yearsidstr.Split('-')[i]));
                        t_PatentYear YearModel = DALPY.PatentYear_Select_Id(id);
                        DALPF.PatentFee_Del(YearModel.nvc_Year, model.i_GuoJiaId, model.i_Id);
                    }
                    if (years != "")
                    {
                        for (int i = 0; i < years.Split('-').Length - 1; i++)
                        {
                            t_PatentFee FeeModel = new t_PatentFee();
                            FeeModel.i_NationalityId = Convert.ToInt32(Drp_GuoJiaType.SelectedValue);
                            FeeModel.i_PatentTypeId = Convert.ToInt32(hd.Value);
                            FeeModel.nvc_Year = years.Split('-')[i];
                            FeeModel.dm_SetFee = 0;
                            FeeModel.dm_ShouXuFee = 0;
                            FeeModel.dm_AgentServiceFee = 0;
                            FeeModel.nvc_ZhiNaJin = "0.00-0.00-0.00-0.00-0.00-0.00";
                            FeeModel.dm_TotalFee = 0;
                            FeeModel.dt_AddTime = DateTime.Now;
                            FeeModel.dt_EditTime = DateTime.Now;
                            DALPF.PatentFee_Add(FeeModel);
                        }
                    }
                }

                Manager.AddLog(0, "专利类型管理", "修改了专利类型[ <font color=\"red\">" + model.nvc_Name + "</font> ]的信息");//修改专利类型日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_PatentType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=专利类型&hreftype=2&href1=Shop_A_PatentType.aspx&href2=" + twourl);
            }
            #endregion
        }
        else
        {
            #region
            //添加专利类型 
            int returnId = 0;
            if (DALPT.PatentType_Add(model, ref returnId) > 0)
            {
                //添加专利费用
                if (years != "")
                {
                    for (int i = 0; i < years.Split('-').Length - 1; i++)
                    {
                        t_PatentFee FeeModel = new t_PatentFee();
                        FeeModel.i_NationalityId = Convert.ToInt32(Drp_GuoJiaType.SelectedValue);
                        FeeModel.i_PatentTypeId = returnId;
                        FeeModel.nvc_Year = years.Split('-')[i];
                        FeeModel.dm_SetFee = 0;
                        FeeModel.dm_ShouXuFee = 0;
                        FeeModel.dm_AgentServiceFee = 0;
                        FeeModel.nvc_ZhiNaJin = "0.00-0.00-0.00-0.00-0.00-0.00";
                        FeeModel.dm_TotalFee = 0;
                        FeeModel.dt_AddTime = DateTime.Now;
                        FeeModel.dt_EditTime = DateTime.Now;
                        DALPF.PatentFee_Add(FeeModel);
                    }
                }

                Manager.AddLog(0, "专利类型管理", "添加了专利类型[ <font color=\"red\">" + model.nvc_Name + "</font> ]");//添加专利类型日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_PatentType.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=专利类型&hreftype=1&href1=Shop_A_PatentType.aspx&href2=" + twourl);
            }
            #endregion
        }
    }
}