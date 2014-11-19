using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_shezhi : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(56, 0);
    public bool pageupdate = Manager.GetManagerQX(56, 2);
    dal_SystemSetup DALSI = new dal_SystemSetup();
    dal_SystemKey DALSK = new dal_SystemKey();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(Drp_LanguageList);
            SetTabStatus();
            Bind_Page_Info();
        }
    }
    void Bind_Page_Info()
    {
        string language = Drp_LanguageList.SelectedValue;
        t_SystemKey model = DALSK.SystemKey_Select_Key("note_code", language);
        if (model != null)
        {
            note_code.Text = model.nt_Value;
        }
        else
        {
            note_code.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("note_name", language);
        if (model != null)
        {
            note_name.Text = model.nt_Value;
        }
        else
        {
            note_name.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("note_password", language);
        if (model != null)
        {
            note_password.Text = model.nt_Value;
        }
        else
        {
            note_password.Text = "";
        }
        //model = DALSK.SystemKey_Select_Key("i_Register", language);
        //if (model != null)
        //{
        //    cb_Register.Checked = model.i_Value == 1 ? true : false;
        //}
        //else
        //{
        //    cb_Register.Checked = false;
        //}
        //model = DALSK.SystemKey_Select_Key("nvc_Register", language);
        //if (model != null)
        //{
        //    text_Register.Text = model.nt_Value;
        //}
        //else
        //{
        //    text_Register.Text = "";
        //}
        //model = DALSK.SystemKey_Select_Key("i_Register_sb", language);
        //if (model != null)
        //{
        //    cb_Register_sb.Checked = model.i_Value == 1 ? true : false;
        //}
        //else
        //{
        //    cb_Register_sb.Checked = false;
        //}
        //model = DALSK.SystemKey_Select_Key("nvc_Register_sb", language);
        //if (model != null)
        //{
        //    text_Register_sb.Text = model.nt_Value;
        //}
        //else
        //{
        //    text_Register_sb.Text = "";
        //}
        #region 专利
        model = DALSK.SystemKey_Select_Key("i_ZlStatus1", language);
        if (model != null)
        {
            cb_zl_s1.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s1.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus1", language);
        if (model != null)
        {
            txt_zl_content1.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content1.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus2", language);
        if (model != null)
        {
            cb_zl_s2.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s2.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus2", language);
        if (model != null)
        {
            txt_zl_content2.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content2.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus3", language);
        if (model != null)
        {
            cb_zl_s3.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s3.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus3", language);
        if (model != null)
        {
            txt_zl_content3.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content3.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus4", language);
        if (model != null)
        {
            cb_zl_s4.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s4.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus4", language);
        if (model != null)
        {
            txt_zl_content4.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content4.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus5", language);
        if (model != null)
        {
            cb_zl_s5.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s5.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus5", language);
        if (model != null)
        {
            txt_zl_content5.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content5.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus6", language);
        if (model != null)
        {
            cb_zl_s6.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s6.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus6", language);
        if (model != null)
        {
            txt_zl_content6.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content6.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus7", language);
        if (model != null)
        {
            cb_zl_s7.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s7.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus7", language);
        if (model != null)
        {
            txt_zl_content7.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content7.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus8", language);
        if (model != null)
        {
            cb_zl_s8.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s8.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus8", language);
        if (model != null)
        {
            txt_zl_content8.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content8.Text = "";
        }
        #endregion
        #region
        model = DALSK.SystemKey_Select_Key("zl_status_s", language);
        if (model != null)
        {
            zl_status.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con_s", language);
        if (model != null)
        {
            txt_zl_con.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status_0", language);
        if (model != null)
        {
            zl_status0.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status0.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con_0", language);
        if (model != null)
        {
            txt_zl_con0.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con0.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status_15", language);
        if (model != null)
        {
            zl_status15.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status15.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con_15", language);
        if (model != null)
        {
            txt_zl_con15.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con15.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status_30", language);
        if (model != null)
        {
            zl_status30.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status30.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con_30", language);
        if (model != null)
        {
            txt_zl_con30.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con30.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status_60", language);
        if (model != null)
        {
            zl_status60.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status60.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con_60", language);
        if (model != null)
        {
            txt_zl_con60.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con60.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status_90", language);
        if (model != null)
        {
            zl_status90.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status90.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con_90", language);
        if (model != null)
        {
            txt_zl_con90.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con90.Text = "";
        }
        #endregion
        #region 商标
        model = DALSK.SystemKey_Select_Key("i_SbStatus1", language);
        if (model != null)
        {
            cb_sb_s1.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s1.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus1", language);
        if (model != null)
        {
            txt_sb_content1.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content1.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_SbStatus2", language);
        if (model != null)
        {
            cb_sb_s2.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s2.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus2", language);
        if (model != null)
        {
            txt_sb_content2.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content2.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_SbStatus3", language);
        if (model != null)
        {
            cb_sb_s3.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s3.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus3", language);
        if (model != null)
        {
            txt_sb_content3.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content3.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_SbStatus4", language);
        if (model != null)
        {
            cb_sb_s4.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s4.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus4", language);
        if (model != null)
        {
            txt_sb_content4.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content4.Text = "";
        }
        #endregion
        #region
        model = DALSK.SystemKey_Select_Key("sb_status_s", language);
        if (model != null)
        {
            cb_sb_tq1.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq1.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con_s", language);
        if (model != null)
        {
            txt_sb_tq1.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq1.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status_0", language);
        if (model != null)
        {
            cb_sb_tq2.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq2.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con_0", language);
        if (model != null)
        {
            txt_sb_tq2.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq2.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status_15", language);
        if (model != null)
        {
            cb_sb_tq3.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq3.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con_15", language);
        if (model != null)
        {
            txt_sb_tq3.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq3.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status_30", language);
        if (model != null)
        {
            cb_sb_tq4.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq4.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con_30", language);
        if (model != null)
        {
            txt_sb_tq4.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq4.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status_60", language);
        if (model != null)
        {
            cb_sb_tq5.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq5.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con_60", language);
        if (model != null)
        {
            txt_sb_tq5.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq5.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status_90", language);
        if (model != null)
        {
            cb_sb_tq6.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq6.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con_90", language);
        if (model != null)
        {
            txt_sb_tq6.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq6.Text = "";
        }
        #endregion
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string language = Drp_LanguageList.SelectedValue;
        t_SystemKey model1 = DALSK.SystemKey_Select_Key("note_code", language);
        model1.nt_Value = note_code.Text;

        t_SystemKey model2 = DALSK.SystemKey_Select_Key("note_name", language);
        model2.nt_Value = note_name.Text;

        t_SystemKey model3 = DALSK.SystemKey_Select_Key("note_password", language);
        model3.nt_Value = note_password.Text;

        //t_SystemKey model4 = DALSK.SystemKey_Select_Key("i_Register", language);
        //model4.i_Value = cb_Register.Checked ? 1 : 0;
        //t_SystemKey model5 = DALSK.SystemKey_Select_Key("nvc_Register", language);
        //model5.nt_Value = text_Register.Text;

        //t_SystemKey model6 = DALSK.SystemKey_Select_Key("i_Register_sb", language);
        //model6.i_Value = cb_Register_sb.Checked ? 1 : 0;
        //t_SystemKey model7 = DALSK.SystemKey_Select_Key("nvc_Register_sb", language);
        //model7.nt_Value = text_Register_sb.Text;

        #region 专利状态
        t_SystemKey model_zl_s1 = DALSK.SystemKey_Select_Key("i_ZlStatus1", language);
        model_zl_s1.i_Value = cb_zl_s1.Checked ? 1 : 0;
        t_SystemKey model_zl_content1 = DALSK.SystemKey_Select_Key("nvc_ZlStatus1", language);
        model_zl_content1.nt_Value = txt_zl_content1.Text;

        t_SystemKey model_zl_s2 = DALSK.SystemKey_Select_Key("i_ZlStatus2", language);
        model_zl_s2.i_Value = cb_zl_s2.Checked ? 1 : 0;
        t_SystemKey model_zl_content2 = DALSK.SystemKey_Select_Key("nvc_ZlStatus2", language);
        model_zl_content2.nt_Value = txt_zl_content2.Text;

        t_SystemKey model_zl_s3 = DALSK.SystemKey_Select_Key("i_ZlStatus3", language);
        model_zl_s3.i_Value = cb_zl_s3.Checked ? 1 : 0;
        t_SystemKey model_zl_content3 = DALSK.SystemKey_Select_Key("nvc_ZlStatus3", language);
        model_zl_content3.nt_Value = txt_zl_content3.Text;

        t_SystemKey model_zl_s4 = DALSK.SystemKey_Select_Key("i_ZlStatus4", language);
        model_zl_s4.i_Value = cb_zl_s4.Checked ? 1 : 0;
        t_SystemKey model_zl_content4 = DALSK.SystemKey_Select_Key("nvc_ZlStatus4", language);
        model_zl_content4.nt_Value = txt_zl_content4.Text;

        t_SystemKey model_zl_s5 = DALSK.SystemKey_Select_Key("i_ZlStatus5", language);
        model_zl_s5.i_Value = cb_zl_s5.Checked ? 1 : 0;
        t_SystemKey model_zl_content5 = DALSK.SystemKey_Select_Key("nvc_ZlStatus5", language);
        model_zl_content5.nt_Value = txt_zl_content5.Text;

        t_SystemKey model_zl_s6 = DALSK.SystemKey_Select_Key("i_ZlStatus6", language);
        model_zl_s6.i_Value = cb_zl_s6.Checked ? 1 : 0;
        t_SystemKey model_zl_content6 = DALSK.SystemKey_Select_Key("nvc_ZlStatus6", language);
        model_zl_content6.nt_Value = txt_zl_content6.Text;

        t_SystemKey model_zl_s7 = DALSK.SystemKey_Select_Key("i_ZlStatus7", language);
        model_zl_s7.i_Value = cb_zl_s7.Checked ? 1 : 0;
        t_SystemKey model_zl_content7 = DALSK.SystemKey_Select_Key("nvc_ZlStatus7", language);
        model_zl_content7.nt_Value = txt_zl_content7.Text;

        t_SystemKey model_zl_s8 = DALSK.SystemKey_Select_Key("i_ZlStatus8", language);
        model_zl_s8.i_Value = cb_zl_s8.Checked ? 1 : 0;
        t_SystemKey model_zl_content8 = DALSK.SystemKey_Select_Key("nvc_ZlStatus8", language);
        model_zl_content8.nt_Value = txt_zl_content8.Text;
        #endregion
        #region 到期提醒
        t_SystemKey model_tx1 = DALSK.SystemKey_Select_Key("zl_status_0", language);
        model_tx1.i_Value = zl_status0.Checked ? 1 : 0;
        t_SystemKey model_txcon1 = DALSK.SystemKey_Select_Key("txt_zl_con_0", language);
        model_txcon1.nt_Value = txt_zl_con0.Text;

        t_SystemKey model_tx2 = DALSK.SystemKey_Select_Key("zl_status_15", language);
        model_tx2.i_Value = zl_status15.Checked ? 1 : 0;
        t_SystemKey model_txcon2 = DALSK.SystemKey_Select_Key("txt_zl_con_15", language);
        model_txcon2.nt_Value = txt_zl_con15.Text;

        t_SystemKey model_tx3 = DALSK.SystemKey_Select_Key("zl_status_30", language);
        model_tx3.i_Value = zl_status30.Checked ? 1 : 0;
        t_SystemKey model_txcon3 = DALSK.SystemKey_Select_Key("txt_zl_con_30", language);
        model_txcon3.nt_Value = txt_zl_con30.Text;

        t_SystemKey model_tx4 = DALSK.SystemKey_Select_Key("zl_status_60", language);
        model_tx4.i_Value = zl_status60.Checked ? 1 : 0;
        t_SystemKey model_txcon4 = DALSK.SystemKey_Select_Key("txt_zl_con_60", language);
        model_txcon4.nt_Value = txt_zl_con60.Text;

        t_SystemKey model_tx5 = DALSK.SystemKey_Select_Key("zl_status_90", language);
        model_tx5.i_Value = zl_status90.Checked ? 1 : 0;
        t_SystemKey model_txcon5 = DALSK.SystemKey_Select_Key("txt_zl_con_90", language);
        model_txcon5.nt_Value = txt_zl_con90.Text;

        t_SystemKey model_tx6 = DALSK.SystemKey_Select_Key("zl_status_s", language);
        model_tx6.i_Value = zl_status.Checked ? 1 : 0;
        t_SystemKey model_txcon6 = DALSK.SystemKey_Select_Key("txt_zl_con_s", language);
        model_txcon6.nt_Value = txt_zl_con.Text;

        #endregion
        #region 商标状态
        t_SystemKey model_sb_s1 = DALSK.SystemKey_Select_Key("i_SbStatus1", language);
        model_sb_s1.i_Value = cb_sb_s1.Checked ? 1 : 0;
        t_SystemKey model_sb_content1 = DALSK.SystemKey_Select_Key("nvc_SbStatus1", language);
        model_sb_content1.nt_Value = txt_sb_content1.Text;

        t_SystemKey model_sb_s2 = DALSK.SystemKey_Select_Key("i_SbStatus2", language);
        model_sb_s2.i_Value = cb_sb_s2.Checked ? 1 : 0;
        t_SystemKey model_sb_content2 = DALSK.SystemKey_Select_Key("nvc_SbStatus2", language);
        model_sb_content2.nt_Value = txt_sb_content2.Text;

        t_SystemKey model_sb_s3 = DALSK.SystemKey_Select_Key("i_SbStatus3", language);
        model_sb_s3.i_Value = cb_sb_s3.Checked ? 1 : 0;
        t_SystemKey model_sb_content3 = DALSK.SystemKey_Select_Key("nvc_SbStatus3", language);
        model_sb_content3.nt_Value = txt_sb_content3.Text;

        t_SystemKey model_sb_s4 = DALSK.SystemKey_Select_Key("i_SbStatus4", language);
        model_sb_s4.i_Value = cb_sb_s4.Checked ? 1 : 0;
        t_SystemKey model_sb_content4 = DALSK.SystemKey_Select_Key("nvc_SbStatus4", language);
        model_sb_content4.nt_Value = txt_sb_content4.Text;
        #endregion
        #region 到期提醒
        t_SystemKey model_tx11 = DALSK.SystemKey_Select_Key("sb_status_s", language);
        model_tx11.i_Value = cb_sb_tq1.Checked ? 1 : 0;
        t_SystemKey model_txcon11 = DALSK.SystemKey_Select_Key("txt_sb_con_s", language);
        model_txcon11.nt_Value = txt_sb_tq1.Text;

        t_SystemKey model_tx22 = DALSK.SystemKey_Select_Key("sb_status_0", language);
        model_tx22.i_Value = cb_sb_tq2.Checked ? 1 : 0;
        t_SystemKey model_txcon22 = DALSK.SystemKey_Select_Key("txt_sb_con_0", language);
        model_txcon22.nt_Value = txt_sb_tq2.Text;

        t_SystemKey model_tx33 = DALSK.SystemKey_Select_Key("sb_status_15", language);
        model_tx33.i_Value = cb_sb_tq3.Checked ? 1 : 0;
        t_SystemKey model_txcon33 = DALSK.SystemKey_Select_Key("txt_sb_con_15", language);
        model_txcon33.nt_Value = txt_sb_tq3.Text;

        t_SystemKey model_tx44 = DALSK.SystemKey_Select_Key("sb_status_30", language);
        model_tx44.i_Value = cb_sb_tq4.Checked ? 1 : 0;
        t_SystemKey model_txcon44 = DALSK.SystemKey_Select_Key("txt_sb_con_30", language);
        model_txcon44.nt_Value = txt_sb_tq4.Text;

        t_SystemKey model_tx55 = DALSK.SystemKey_Select_Key("sb_status_60", language);
        model_tx55.i_Value = cb_sb_tq5.Checked ? 1 : 0;
        t_SystemKey model_txcon55 = DALSK.SystemKey_Select_Key("txt_sb_con_60", language);
        model_txcon55.nt_Value = txt_sb_tq5.Text;

        t_SystemKey model_tx66 = DALSK.SystemKey_Select_Key("sb_status_90", language);
        model_tx66.i_Value = cb_sb_tq6.Checked ? 1 : 0;
        t_SystemKey model_txcon66 = DALSK.SystemKey_Select_Key("txt_sb_con_90", language);
        model_txcon66.nt_Value = txt_sb_tq6.Text;

        #endregion
        DALSK.SystemKey_Submit();
        Manager.AddLog(0, "短信管理", "修改短信设置");
        div_a.InnerHtml = "<script>alert(\"修改成功\")</script>";
    }
    private void SetTabStatus()
    {
        if (Request.QueryString["status"] != null)
        {
            if (Request.QueryString["status"] == "0")
            {
                td0.Attributes.Add("style", "background-color:White");
                listDiv.Visible = true;
                Div_qx.Visible = false;
                Div_zl.Visible = false;
                Div_sb.Visible = false;
                Div_sb_tq.Visible = false;
            }
            else if (Request.QueryString["status"] == "1")
            {
                td1.Attributes.Add("style", "background-color:White");
                listDiv.Visible = false;
                Div_qx.Visible = false;
                Div_zl.Visible = true;
                Div_sb.Visible = false;
                Div_sb_tq.Visible = false;
            }
            else if (Request.QueryString["status"] == "2")
            {
                td2.Attributes.Add("style", "background-color:White");
                listDiv.Visible = false;
                Div_qx.Visible = false;
                Div_zl.Visible = false;
                Div_sb.Visible = true;
                Div_sb_tq.Visible = false;
            }
            else if (Request.QueryString["status"] == "3")
            {
                td3.Attributes.Add("style", "background-color:White");
                listDiv.Visible = false;
                Div_qx.Visible = true;
                Div_zl.Visible = false;
                Div_sb.Visible = false;
                Div_sb_tq.Visible = false;
            }
            else if (Request.QueryString["status"] == "4")
            {
                td4.Attributes.Add("style", "background-color:White");
                Div_sb_tq.Visible = true;
                listDiv.Visible = false;
                Div_qx.Visible = false;
                Div_zl.Visible = false;
                Div_sb.Visible = false;
            }
        }
        else
        {
            td0.Attributes.Add("style", "background-color:White");
            listDiv.Visible = true;
            Div_qx.Visible = false;
            Div_zl.Visible = false;
            Div_sb.Visible = false;
            Div_sb_tq.Visible = false;
        }
    }
    protected void Drp_LanguageList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Page_Info();
    }
}
