using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using System.Data;
using zscq.App_Code;
using zscq.Model;
using zscq.BLL;
using System.Text;
using System.Data.Linq.SqlClient;

public partial class Shop_Manage_shop_orderadd1 : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(38, 0);
    public bool pageadd = Manager.GetManagerQX(38, 1);
    DataMemberDataContext dudc = new DataMemberDataContext();
    DataOrderDataContext dodc = new DataOrderDataContext();
    DataZscqDataContext dpdc = new DataZscqDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
    dal_Address DALB = new dal_Address();
    dal_Member DALM = new dal_Member();
    dal_UserGrade DALMG = new dal_UserGrade();
    dal_Coupon DALC = new dal_Coupon();
    bll_Coupon BLLC = new bll_Coupon();
    dal_Nationality DALN = new dal_Nationality();
    public StringBuilder div_CouponType = new StringBuilder();

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
            DALN.Nationality_Bind_DDL(ddl_country);
            //DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_country.SelectedValue);
            //DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
            //DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
            Bind_DDL_Grade();
        }
        Bind_Page_CouponType();
    }

    //protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_country.SelectedValue);
    //    DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    //}
    //protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    //}
    //protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    //}
    public void Bind_DDL_Grade()
    {
        DDL_Grade.Items.Clear();
        DDL_Grade.Items.Add(new ListItem("所有等级", "0"));
        DDL_Grade.DataSource = DALMG.UserGrade_Select_All();
        DDL_Grade.DataTextField = "nvc_Name";
        DDL_Grade.DataValueField = "i_Id";
        DDL_Grade.DataBind();
    }
    public void Bind_Page_CouponType()
    {
        int shu = 0;
        IQueryable<t_CouponType> IQuery = DALC.CouponType_Select_All();
        foreach (var q in IQuery)
        {
            shu++;
            div_CouponType.Append("<div class=\"divitem\"><input type=\"checkbox\" name=\"cb\" id=\"cb" + shu + "\" value=\"" + q.i_Id + "\" />" + q.nvc_Name + "&nbsp;");
            div_CouponType.Append("<input type=\"text\" onkeydown=\"event.returnValue=IsDigit()\" onkeyup=\"this.value = this.value.replace(/\\D/g, '')\" style=\"ime-mode: disabled;\" maxlength=\"4\" id=\"text_zs" + shu + "\" value=\"1\" class=\"inputs60text\" onblur=\"if(this.value=='')this.value='1';\"");
            div_CouponType.Append(" onkeypress=\"event.returnValue=IsDigit();\" />&nbsp;张</div>");
        }
    }
    public void Bind_Rpt_List(int pageIndex)
    {
        int count = 0;
        IQueryable<vw_Member> iquery = SelectMember(
            Convert.ToInt32(select1.Value)
            , Convert.ToInt32(select2.Value)
            , Convert.ToInt32(DDL_Grade.SelectedValue)
            , user_namee.Value.Trim(), Convert.ToInt32(selectt.Value)
            , Convert.ToInt32(ddl_country.SelectedValue)
            , 0
            , 0
            , 0
            , hot_start_date.Value
            , hot_end_date.Value
            , ref count);
        if (Hi_search.Value == "1")
        {
            this.rept_list.DataSource = iquery;
            this.rept_list.DataBind();
            Lb_Count.Text = "查询会员总数： " + iquery.Count();
            formDiv.Style.Add("display", "");
            listDiv.Style.Add("display", "");
            Div1.Style.Add("display", "none");
            hi_users.Value = "";
            Button1.ToolTip = "";
            Label1.Style.Add("Color", "red");
            Label2.Style.Add("Color", "");
        }
        else
        {
            if (iquery.Count() > 0)
            {
                formDiv.Style.Add("display", "none");
                listDiv.Style.Add("display", "none");
                Div1.Style.Add("display", "");
                foreach (var q in iquery)
                {
                    hi_users.Value += "," + q.i_Id.ToString();
                }
                Lb_MemberNumber.Text = iquery.Count().ToString();
                Label1.Style.Add("Color", "");
                Label2.Style.Add("Color", "red");
            }
            else
            {
                div_a.InnerHtml = "<script>alert('未搜索到会员，无法下一步!')</script>";
            }
        }
    }
    protected void btnSearchUser_Click(object sender, EventArgs e)
    {
        Hi_search.Value = "1";
        Bind_Rpt_List(1);
    }
    protected void Bt_Submit_Click(object sender, EventArgs e)
    {
        if (hi_users.Value != "")
        {
            string From = text_je.Value == "" ? "系统赠送" : text_je.Value;
            dal_SystemSetup sdal = new dal_SystemSetup();
            Note.ChinaSms noteSms = new Note.ChinaSms();
            int shu = 0;
            int couponshu = 0;
            var iquery = from i in dudc.t_Member where (hi_users.Value + ",").IndexOf("," + i.i_Id.ToString() + ",") > -1 select i;
            foreach (var q in iquery)
            {
                try
                {
                    shu++;
                    if (cb_message.Checked)
                    {
                        #region 发短信
                        t_MessageNote model = new t_MessageNote();
                        model.nvc_Content = area_content.Value;
                        model.dt_AddTime = DateTime.Now;
                        model.nvc_PhoneNumber = q.nvc_MobilePhone;

                        bool TorF = true;
                        //短信接口
                        TorF = noteSms.SingleSend(model.nvc_PhoneNumber, model.nvc_Content);

                        if (TorF)
                        {
                            model.nvc_NoteState = "发送成功";
                        }
                        else
                        {
                            model.nvc_NoteState = "发送失败";
                        }
                        model.nvc_NoteType = "短信群发";
                        model.i_MemberId = q.i_Id;
                        dal_Message Ndal = new dal_Message();
                        Ndal.MessageNote_Add(model);
                        #endregion
                    }
                    string[] Array_CouponType = Hi_cb.Value.Split(',');
                    string[] Array_GiveNumber = Hi_text.Value.Split(',');
                    for (int i = 0; i < Array_CouponType.Length; i++)
                    {
                        if (Array_CouponType[i] != "" && Array_GiveNumber[i] != "")
                        {
                            var m = DALC.CouponType_Select_Id(Array_CouponType[i].GetInt());
                            if (m != null)
                            {
                                couponshu += int.Parse(Array_GiveNumber[i]);
                                BLLC.Coupon_ForAdd(int.Parse(Array_GiveNumber[i]), DateTime.Now.AddMonths(m.i_TimeLength).ToString(), Array_CouponType[i], q.i_Id, From);
                            }
                        }

                    }
                }
                catch
                {

                }
            }
            Manager.AddLog(0, "优惠券管理", "赠送给" + shu + "位会员共" + couponshu + "张优惠券!");
            Response.Write("<script>alert('操作成功，赠送给" + shu + "位会员共" + couponshu + "张优惠券!');window.location='Shop_U_UserCoupon.aspx';</script>");
        }
        else
        {
            div_a.InnerHtml = "<script>alert('请选择会员!')</script>";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Hi_search.Value = "0";
        Bind_Rpt_List(1);
    }
    IQueryable<vw_Member> SelectMember(int mtype, int utype, int grade, string keyword, int ktype, int countryid, int shengid, int cityid, int areaid, string bengintime, string endtime, ref int count)
    {
        var iquery = from i in dvdc.vw_Member select i;
        if (mtype != 0)
        {
            iquery = from i in iquery where i.i_MemberType == mtype select i;
        }
        if (utype != 0)
        {
            iquery = from i in iquery where i.i_UserTypeId == utype select i;
        }
        if (grade != 0)
        {
            iquery = from i in iquery where i.i_Grade == grade select i;
        }
        if (keyword != "" && keyword != null)
        {
            switch (ktype)
            {
                case 1://用户名
                    iquery = from i in iquery where SqlMethods.Like(i.nvc_Name, string.Format("%{0}%", keyword)) select i;
                    break;
                case 2://真实姓名
                    iquery = from i in iquery where SqlMethods.Like(i.nvc_RealName, string.Format("%{0}%", keyword)) select i;
                    break;
                case 3://邮箱
                    iquery = from i in iquery where SqlMethods.Like(i.nvc_Email, string.Format("%{0}%", keyword)) select i;
                    break;
                case 4://手机
                    iquery = from i in iquery where SqlMethods.Like(i.nvc_MobilePhone, string.Format("%{0}%", keyword)) select i;
                    break;
                case 5://电话
                    iquery = from i in iquery where SqlMethods.Like(i.nvc_TelPhone, string.Format("%{0}%", keyword)) select i;
                    break;
                case 6:
                    iquery = from i in iquery where i.nvc_Address.Contains(keyword) || i.nvc_TelPhone.Contains(keyword) || i.nvc_Email.Contains(keyword) || i.nvc_MobilePhone.Contains(keyword) || i.nvc_Name.Contains(keyword) || i.nvc_RealName.Contains(keyword) || i.nvc_ZipCode.Contains(keyword) || i.nvc_Age.Contains(keyword) || i.nvc_Name.Contains(keyword) select i;
                    break;
            }
        }
        if (countryid != 0)
        {
            iquery = from i in iquery where i.i_GuoJiId == countryid select i;
        }
        if (shengid != 0)
        {
            iquery = from i in iquery where i.i_ProvinceId == shengid select i;
        }
        if (cityid != 0)
        {
            iquery = from i in iquery where i.i_CityId == cityid select i;
        }
        if (areaid != 0)
        {
            iquery = from i in iquery where i.i_AreaId == areaid select i;
        }
        if (!string.IsNullOrWhiteSpace(bengintime))
        {
            iquery = from i in iquery
                     where Convert.ToDateTime(bengintime) < i.dt_AddTime
                     select i;
        }
        if (!string.IsNullOrWhiteSpace(endtime))
        {
            iquery = from i in iquery
                     where i.dt_AddTime < Convert.ToDateTime(endtime)
                     select i;
        }
        iquery = from i in iquery orderby i.i_Id descending select i;
        count = iquery.Count();
        return iquery;
    }


}
