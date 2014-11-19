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
    public bool pageview = Manager.GetManagerQX(50, 0);
    public bool pageupdate = Manager.GetManagerQX(50, 2);
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
        #region
        string language = Drp_LanguageList.SelectedValue;
        t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", language);
        if (model != null)
        {
            smtp.Text = model.nt_Value;
        }
        else
        {
            smtp.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("smtp_username", language);
        if (model != null)
        {
            smtp_username.Text = model.nt_Value;
        }
        else
        {
            smtp_username.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("smtp_password", language);
        if (model != null)
        {
            smtp_password.Text = model.nt_Value;
        }
        else
        {
            smtp_password.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("smtp_email", language);
        if (model != null)
        {
            smtp_email.Text = model.nt_Value;
        }
        else
        {
            smtp_email.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("smtp_name", language);
        if (model != null)
        {
            smtp_name.Text = model.nt_Value;
        }
        else
        {
            smtp_name.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("is_smtp", language);
        if (model != null)
        {
            cb_register.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_register.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("register_title", language);
        if (model != null)
        {
            register_title.Text = model.nt_Value;
        }
        else
        {
            register_title.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("register_body", language);
        if (model != null)
        {
            register_body.Text = model.nt_Value;
        }
        else
        {
            register_body.Text = "";
        }
        
        //=======
        model = DALSK.SystemKey_Select_Key("sb_is_smtp", language);
        if (model != null)
        {
            sb_cb_register.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            sb_cb_register.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("sb_register_title", language);
        if (model != null)
        {
            sb_register_title.Text = model.nt_Value;
        }
        else
        {
            sb_register_title.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("sb_register_body", language);
        if (model != null)
        {
            sb_register_body.Text = model.nt_Value;
        }
        else
        {
            sb_register_body.Text = "";
        }
        #endregion
        #region 专利
        model = DALSK.SystemKey_Select_Key("i_ZlStatus11", language);
        if (model != null)
        {
            cb_zl_s1.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s1.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus11", language);
        if (model != null)
        {
            txt_zl_content1.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content1.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus22", language);
        if (model != null)
        {
            cb_zl_s2.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s2.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus22", language);
        if (model != null)
        {
            txt_zl_content2.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content2.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus33", language);
        if (model != null)
        {
            cb_zl_s3.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s3.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus33", language);
        if (model != null)
        {
            txt_zl_content3.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content3.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus44", language);
        if (model != null)
        {
            cb_zl_s4.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s4.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus44", language);
        if (model != null)
        {
            txt_zl_content4.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content4.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus55", language);
        if (model != null)
        {
            cb_zl_s5.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s5.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus55", language);
        if (model != null)
        {
            txt_zl_content5.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content5.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus66", language);
        if (model != null)
        {
            cb_zl_s6.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s6.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus66", language);
        if (model != null)
        {
            txt_zl_content6.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content6.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus77", language);
        if (model != null)
        {
            cb_zl_s7.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s7.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus77", language);
        if (model != null)
        {
            txt_zl_content7.Text = model.nt_Value;
        }
        else
        {
            txt_zl_content7.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_ZlStatus88", language);
        if (model != null)
        {
            cb_zl_s8.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_zl_s8.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_ZlStatus88", language);
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
        model = DALSK.SystemKey_Select_Key("zl_status", language);
        if (model != null)
        {
            zl_status.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con", language);
        if (model != null)
        {
            txt_zl_con.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status0", language);
        if (model != null)
        {
            zl_status0.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status0.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con0", language);
        if (model != null)
        {
            txt_zl_con0.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con0.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status15", language);
        if (model != null)
        {
            zl_status15.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status15.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con15", language);
        if (model != null)
        {
            txt_zl_con15.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con15.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status30", language);
        if (model != null)
        {
            zl_status30.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status30.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con30", language);
        if (model != null)
        {
            txt_zl_con30.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con30.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status60", language);
        if (model != null)
        {
            zl_status60.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status60.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con60", language);
        if (model != null)
        {
            txt_zl_con60.Text = model.nt_Value;
        }
        else
        {
            txt_zl_con60.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("zl_status90", language);
        if (model != null)
        {
            zl_status90.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            zl_status90.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_zl_con90", language);
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
        model = DALSK.SystemKey_Select_Key("i_SbStatus11", language);
        if (model != null)
        {
            cb_sb_s1.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s1.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus11", language);
        if (model != null)
        {
            txt_sb_content1.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content1.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_SbStatus22", language);
        if (model != null)
        {
            cb_sb_s2.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s2.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus22", language);
        if (model != null)
        {
            txt_sb_content2.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content2.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_SbStatus33", language);
        if (model != null)
        {
            cb_sb_s3.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s3.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus33", language);
        if (model != null)
        {
            txt_sb_content3.Text = model.nt_Value;
        }
        else
        {
            txt_sb_content3.Text = "";
        }
        model = DALSK.SystemKey_Select_Key("i_SbStatus44", language);
        if (model != null)
        {
            cb_sb_s4.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_s4.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("nvc_SbStatus44", language);
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
        model = DALSK.SystemKey_Select_Key("sb_status0", language);
        if (model != null)
        {
            cb_sb_tq1.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq1.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con0", language);
        if (model != null)
        {
            txt_sb_tq1.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq1.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status90", language);
        if (model != null)
        {
            cb_sb_tq2.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq2.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con90", language);
        if (model != null)
        {
            txt_sb_tq2.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq2.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status60", language);
        if (model != null)
        {
            cb_sb_tq3.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq3.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con60", language);
        if (model != null)
        {
            txt_sb_tq3.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq3.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status30", language);
        if (model != null)
        {
            cb_sb_tq4.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq4.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con30", language);
        if (model != null)
        {
            txt_sb_tq4.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq4.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status15", language);
        if (model != null)
        {
            cb_sb_tq5.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq5.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con15", language);
        if (model != null)
        {
            txt_sb_tq5.Text = model.nt_Value;
        }
        else
        {
            txt_sb_tq5.Text = "";
        }

        model = DALSK.SystemKey_Select_Key("sb_status", language);
        if (model != null)
        {
            cb_sb_tq6.Checked = model.i_Value == 1 ? true : false;
        }
        else
        {
            cb_sb_tq6.Checked = false;
        }
        model = DALSK.SystemKey_Select_Key("txt_sb_con", language);
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
        #region
        string language = Drp_LanguageList.SelectedValue;
        t_SystemKey model1 = DALSK.SystemKey_Select_Key("smtp", language);
        model1.nt_Value = smtp.Text;

        t_SystemKey model2 = DALSK.SystemKey_Select_Key("smtp_username", language);
        model2.nt_Value = smtp_username.Text;

        t_SystemKey model3 = DALSK.SystemKey_Select_Key("smtp_password", language);
        model3.nt_Value = smtp_password.Text;

        t_SystemKey model4 = DALSK.SystemKey_Select_Key("smtp_email", language);
        model4.nt_Value = smtp_email.Text;

        t_SystemKey model5 = DALSK.SystemKey_Select_Key("smtp_name", language);
        model5.nt_Value = smtp_name.Text;

        t_SystemKey model6 = DALSK.SystemKey_Select_Key("is_smtp", language);
        model6.i_Value = cb_register.Checked ? 1 : 0;

        t_SystemKey model7 = DALSK.SystemKey_Select_Key("register_title", language);
        model7.nt_Value = register_title.Text;

        t_SystemKey model8 = DALSK.SystemKey_Select_Key("register_body", language);
        model8.nt_Value = register_body.Text;
        //===========
        t_SystemKey model66 = DALSK.SystemKey_Select_Key("sb_is_smtp", language);
        model66.i_Value = sb_cb_register.Checked ? 1 : 0;

        t_SystemKey model77 = DALSK.SystemKey_Select_Key("sb_register_title", language);
        model77.nt_Value = sb_register_title.Text;

        t_SystemKey model88 = DALSK.SystemKey_Select_Key("sb_register_body", language);
        model88.nt_Value = sb_register_body.Text;
        //=============
        #endregion
        #region 专利状态
        t_SystemKey model_zl_s1 = DALSK.SystemKey_Select_Key("i_ZlStatus11", language);
        model_zl_s1.i_Value = cb_zl_s1.Checked ? 1 : 0;
        t_SystemKey model_zl_content1 = DALSK.SystemKey_Select_Key("nvc_ZlStatus11", language);
        model_zl_content1.nt_Value = txt_zl_content1.Text;

        t_SystemKey model_zl_s2 = DALSK.SystemKey_Select_Key("i_ZlStatus22", language);
        model_zl_s2.i_Value = cb_zl_s2.Checked ? 1 : 0;
        t_SystemKey model_zl_content2 = DALSK.SystemKey_Select_Key("nvc_ZlStatus22", language);
        model_zl_content2.nt_Value = txt_zl_content2.Text;

        t_SystemKey model_zl_s3 = DALSK.SystemKey_Select_Key("i_ZlStatus33", language);
        model_zl_s3.i_Value = cb_zl_s3.Checked ? 1 : 0;
        t_SystemKey model_zl_content3 = DALSK.SystemKey_Select_Key("nvc_ZlStatus33", language);
        model_zl_content3.nt_Value = txt_zl_content3.Text;

        t_SystemKey model_zl_s4 = DALSK.SystemKey_Select_Key("i_ZlStatus44", language);
        model_zl_s4.i_Value = cb_zl_s4.Checked ? 1 : 0;
        t_SystemKey model_zl_content4 = DALSK.SystemKey_Select_Key("nvc_ZlStatus44", language);
        model_zl_content4.nt_Value = txt_zl_content4.Text;

        t_SystemKey model_zl_s5 = DALSK.SystemKey_Select_Key("i_ZlStatus55", language);
        model_zl_s5.i_Value = cb_zl_s5.Checked ? 1 : 0;
        t_SystemKey model_zl_content5 = DALSK.SystemKey_Select_Key("nvc_ZlStatus55", language);
        model_zl_content5.nt_Value = txt_zl_content5.Text;

        t_SystemKey model_zl_s6 = DALSK.SystemKey_Select_Key("i_ZlStatus66", language);
        model_zl_s6.i_Value = cb_zl_s6.Checked ? 1 : 0;
        t_SystemKey model_zl_content6 = DALSK.SystemKey_Select_Key("nvc_ZlStatus66", language);
        model_zl_content6.nt_Value = txt_zl_content6.Text;

        t_SystemKey model_zl_s7 = DALSK.SystemKey_Select_Key("i_ZlStatus77", language);
        model_zl_s7.i_Value = cb_zl_s7.Checked ? 1 : 0;
        t_SystemKey model_zl_content7 = DALSK.SystemKey_Select_Key("nvc_ZlStatus77", language);
        model_zl_content7.nt_Value = txt_zl_content7.Text;

        t_SystemKey model_zl_s8 = DALSK.SystemKey_Select_Key("i_ZlStatus88", language);
        model_zl_s8.i_Value = cb_zl_s8.Checked ? 1 : 0;
        t_SystemKey model_zl_content8 = DALSK.SystemKey_Select_Key("nvc_ZlStatus88", language);
        model_zl_content8.nt_Value = txt_zl_content8.Text;
        #endregion
        #region 到期提醒
        t_SystemKey model_tx1 = DALSK.SystemKey_Select_Key("zl_status0", language);
        model_tx1.i_Value = zl_status0.Checked ? 1 : 0;
        t_SystemKey model_txcon1 = DALSK.SystemKey_Select_Key("txt_zl_con0", language);
        model_txcon1.nt_Value = txt_zl_con0.Text;

        t_SystemKey model_tx2 = DALSK.SystemKey_Select_Key("zl_status15", language);
        model_tx2.i_Value = zl_status15.Checked ? 1 : 0;
        t_SystemKey model_txcon2 = DALSK.SystemKey_Select_Key("txt_zl_con15", language);
        model_txcon2.nt_Value = txt_zl_con15.Text;

        t_SystemKey model_tx3 = DALSK.SystemKey_Select_Key("zl_status30", language);
        model_tx3.i_Value = zl_status30.Checked ? 1 : 0;
        t_SystemKey model_txcon3 = DALSK.SystemKey_Select_Key("txt_zl_con30", language);
        model_txcon3.nt_Value = txt_zl_con30.Text;

        t_SystemKey model_tx4 = DALSK.SystemKey_Select_Key("zl_status60", language);
        model_tx4.i_Value = zl_status60.Checked ? 1 : 0;
        t_SystemKey model_txcon4 = DALSK.SystemKey_Select_Key("txt_zl_con60", language);
        model_txcon4.nt_Value = txt_zl_con60.Text;

        t_SystemKey model_tx5 = DALSK.SystemKey_Select_Key("zl_status90", language);
        model_tx5.i_Value = zl_status90.Checked ? 1 : 0;
        t_SystemKey model_txcon5 = DALSK.SystemKey_Select_Key("txt_zl_con90", language);
        model_txcon5.nt_Value = txt_zl_con90.Text;

        t_SystemKey model_tx6 = DALSK.SystemKey_Select_Key("zl_status", language);
        model_tx6.i_Value = zl_status.Checked ? 1 : 0;
        t_SystemKey model_txcon6 = DALSK.SystemKey_Select_Key("txt_zl_con", language);
        model_txcon6.nt_Value = txt_zl_con.Text;

        #endregion
        #region 商标状态
        t_SystemKey model_sb_s1 = DALSK.SystemKey_Select_Key("i_SbStatus11", language);
        model_sb_s1.i_Value = cb_sb_s1.Checked ? 1 : 0;
        t_SystemKey model_sb_content1 = DALSK.SystemKey_Select_Key("nvc_SbStatus11", language);
        model_sb_content1.nt_Value = txt_sb_content1.Text;

        t_SystemKey model_sb_s2 = DALSK.SystemKey_Select_Key("i_SbStatus22", language);
        model_sb_s2.i_Value = cb_sb_s2.Checked ? 1 : 0;
        t_SystemKey model_sb_content2 = DALSK.SystemKey_Select_Key("nvc_SbStatus22", language);
        model_sb_content2.nt_Value = txt_sb_content2.Text;

        t_SystemKey model_sb_s3 = DALSK.SystemKey_Select_Key("i_SbStatus33", language);
        model_sb_s3.i_Value = cb_sb_s3.Checked ? 1 : 0;
        t_SystemKey model_sb_content3 = DALSK.SystemKey_Select_Key("nvc_SbStatus33", language);
        model_sb_content3.nt_Value = txt_sb_content3.Text;

        t_SystemKey model_sb_s4 = DALSK.SystemKey_Select_Key("i_SbStatus44", language);
        model_sb_s4.i_Value = cb_sb_s4.Checked ? 1 : 0;
        t_SystemKey model_sb_content4 = DALSK.SystemKey_Select_Key("nvc_SbStatus44", language);
        model_sb_content4.nt_Value = txt_sb_content4.Text;
        #endregion
        #region 到期提醒
        t_SystemKey model_tx11 = DALSK.SystemKey_Select_Key("sb_status0", language);
        model_tx11.i_Value = cb_sb_tq1.Checked ? 1 : 0;
        t_SystemKey model_txcon11 = DALSK.SystemKey_Select_Key("txt_sb_con0", language);
        model_txcon11.nt_Value = txt_sb_tq1.Text;

        t_SystemKey model_tx22 = DALSK.SystemKey_Select_Key("sb_status90", language);
        model_tx22.i_Value = cb_sb_tq2.Checked ? 1 : 0;
        t_SystemKey model_txcon22 = DALSK.SystemKey_Select_Key("txt_sb_con90", language);
        model_txcon22.nt_Value = txt_sb_tq2.Text;

        t_SystemKey model_tx33 = DALSK.SystemKey_Select_Key("sb_status60", language);
        model_tx33.i_Value = cb_sb_tq3.Checked ? 1 : 0;
        t_SystemKey model_txcon33 = DALSK.SystemKey_Select_Key("txt_sb_con60", language);
        model_txcon33.nt_Value = txt_sb_tq3.Text;

        t_SystemKey model_tx44 = DALSK.SystemKey_Select_Key("sb_status30", language);
        model_tx44.i_Value = cb_sb_tq4.Checked ? 1 : 0;
        t_SystemKey model_txcon44 = DALSK.SystemKey_Select_Key("txt_sb_con30", language);
        model_txcon44.nt_Value = txt_sb_tq4.Text;

        t_SystemKey model_tx55 = DALSK.SystemKey_Select_Key("sb_status15", language);
        model_tx55.i_Value = cb_sb_tq5.Checked ? 1 : 0;
        t_SystemKey model_txcon55 = DALSK.SystemKey_Select_Key("txt_sb_con15", language);
        model_txcon55.nt_Value = txt_sb_tq5.Text;

        t_SystemKey model_tx66 = DALSK.SystemKey_Select_Key("sb_status", language);
        model_tx66.i_Value = cb_sb_tq6.Checked ? 1 : 0;
        t_SystemKey model_txcon66 = DALSK.SystemKey_Select_Key("txt_sb_con", language);
        model_txcon66.nt_Value = txt_sb_tq6.Text;

        #endregion
        DALSK.SystemKey_Submit();
        Manager.AddLog(0, "邮件管理", "修改邮件设置");
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
