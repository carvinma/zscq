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
    DataMemberDataContext dmdc = new DataMemberDataContext();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Member DALM = new dal_Member();
    dal_Address DALA = new dal_Address();
    dal_Nationality DALN = new dal_Nationality();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_UserGrade DALG = new dal_UserGrade();
    
    public string UserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Nationality_Bind_DDL(ddl_guojia);
            Bind_Page_Member();
            Bind_Page_Info();
        }
    }
    void Nationality_Bind_DDL(DropDownList ddl)
    {
        ddl.Items.Clear();
        ListItem item = new ListItem("선택하세요", "0");
        ddl.Items.Add(item);
        var iquery = from p in dzdc.t_Nationality orderby p.i_Id ascending select p;
        foreach (var s in iquery)
        {
            ListItem item2 = new ListItem(s.nvc_HanName, s.i_Id.ToString());
            ddl.Items.Add(item2);
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString();
        }
        else
        {
            Hi_MemberId.Value = "0";
        }
    }
    public void Bind_Page_Info()//绑定基本信息
    {
        t_Member model = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
        if (model != null)
        {
            ltl_name.Text = model.nvc_Name;
            ltl_number.Text = model.nvc_UserNum;
            ltl_grade.Text = DALG.UserGrade_Select_Id(model.i_Grade).nvc_Name_kr;
            ltl_registertime.Text = model.dt_AddTime.ToString();

            text_RealName.Value = model.nvc_RealName;
            text_EnName.Value = model.nvc_EnglishName;
            RadioButtonList1.SelectedValue = model.i_Sex.ToString();

            ddl_guojia.SelectedValue = model.i_GuoJiId.ToString();
            //DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_guojia.SelectedValue);
            //ddl_sheng.SelectedValue = model.i_ProvinceId.ToString();
            //DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
            //ddl_shi.SelectedValue = model.i_CityId.ToString();
            //DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
            //ddl_qu.SelectedValue = model.i_AreaId.ToString();

            RadioButtonList2.SelectedValue = model.i_IsSend.ToString();

            text_Address.Value = model.nvc_Address;
            text_ZipCode.Value = model.nvc_ZipCode;
            text_Mobile.Value = model.nvc_MobilePhone;
            text_Call.Value = model.nvc_TelPhone;
            text_Email.Value = model.nvc_Email;
            text_BYEmail.Value = model.nt_BYEmail;
            text_Fax.Value = model.nvc_LinkManFax;
            text_QQ.Value = model.nvc_LinkManQQ;
            text_Skype.Value = model.nvc_LinkManSKYPE;
            text_msn.Value = model.nvc_LinkManMSN;
            text_HomePage.Value = model.nvc_CompanyHomePage;
            text_LinkName.Value = model.nvc_LinkName;
        }
    }

    protected void Bt_Submit_Click(object sender, EventArgs e)
    {
        try
        {
            t_Member model = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
            //var result = from r in dmdc.t_Member where r.nvc_Email.Trim() == text_Email.Value && r.i_Id != model.i_Id select r;
            //if (result.Count() > 0)
            //{
            //    div_a.InnerHtml = "<script>alert('邮箱已经被使用！');</script>";
            //    return;
            //}
            //var result2 = from r in dmdc.t_Member where r.nvc_MobilePhone.Trim() == text_Mobile.Value && r.i_Id != model.i_Id select r;
            //if (result2.Count() > 0)
            //{
            //    div_a.InnerHtml = "<script>alert('手机号已经被使用！');</script>";
            //    return;
            //}

            model.nvc_RealName = text_RealName.Value;
            model.nvc_EnglishName = text_EnName.Value;
            
            model.i_Sex = Convert.ToInt32(RadioButtonList1.SelectedValue);

            model.i_GuoJiId = int.Parse(ddl_guojia.SelectedValue);//添加国家
            //model.i_ProvinceId = int.Parse(ddl_sheng.SelectedValue);//添加省
            //model.i_CityId = int.Parse(ddl_shi.SelectedValue);//添加市
            //model.i_AreaId = int.Parse(ddl_qu.SelectedValue);//添加县

            model.i_IsSend = RadioButtonList2.SelectedValue.GetInt();
            model.nvc_Address = text_Address.Value;
            model.nvc_ZipCode = text_ZipCode.Value;
            model.nvc_MobilePhone = text_Mobile.Value;
            model.nvc_TelPhone = text_Call.Value;
            model.nvc_Email = text_Email.Value;
            model.nt_BYEmail = text_BYEmail.Value;
            model.nvc_LinkName = text_LinkName.Value;
            model.nvc_LinkManFax = text_Fax.Value;
            model.nvc_LinkManQQ = text_QQ.Value;
            model.nvc_LinkManSKYPE = text_Skype.Value;
            model.nvc_LinkManMSN = text_msn.Value;
            model.nvc_CompanyHomePage = text_HomePage.Value;

            DALM.Member_Update(model);
            #region 添加到我的地址薄
            IQueryable<t_ReceiveAddress> iquery = DALRA.ReceiveAddress_Select_MemberId(int.Parse(Hi_MemberId.Value));
            if (iquery.Count() > 0)
            {
                foreach (var v in iquery)
                {
                    if (v.nvc_Consignee != text_RealName.Value
                        && v.i_Gid != Convert.ToInt32(this.ddl_guojia.SelectedValue)
                         //&& v.i_PId != Convert.ToInt32(this.ddl_sheng.SelectedValue)
                         //&& v.i_CId != Convert.ToInt32(this.ddl_shi.SelectedValue)
                         //&& v.i_AId != Convert.ToInt32(this.ddl_qu.SelectedValue)
                         && v.nvc_StreetAddress != text_Address.Value
                         && v.nvc_ZipCode != text_ZipCode.Value
                         && v.nvc_MobilePhone != text_Mobile.Value
                         && v.nvc_TelPhone != text_Call.Value
                        )
                    {
                        t_ReceiveAddress tra = new t_ReceiveAddress();
                        tra.nvc_Consignee = text_RealName.Value;
                        tra.i_Gid = Convert.ToInt32(this.ddl_guojia.SelectedValue);
                        //tra.i_PId = Convert.ToInt32(this.ddl_sheng.SelectedValue);
                        //tra.i_CId = Convert.ToInt32(this.ddl_shi.SelectedValue);
                        //tra.i_AId = Convert.ToInt32(this.ddl_qu.SelectedValue);
                        tra.nvc_StreetAddress = text_Address.Value;
                        tra.nvc_ZipCode = text_ZipCode.Value;
                        tra.nvc_MobilePhone = text_Mobile.Value;
                        tra.nvc_TelPhone = text_Call.Value;
                        tra.i_MemberId = int.Parse(Hi_MemberId.Value);
                        DALRA.ReceiveAddress_Add(tra);
                    }
                }
            }
            else
            {
                t_ReceiveAddress tra = new t_ReceiveAddress();
                tra.nvc_Consignee = text_RealName.Value;
                tra.i_Gid = Convert.ToInt32(this.ddl_guojia.SelectedValue);
                //tra.i_PId = Convert.ToInt32(this.ddl_sheng.SelectedValue);
                //tra.i_CId = Convert.ToInt32(this.ddl_shi.SelectedValue);
                //tra.i_AId = Convert.ToInt32(this.ddl_qu.SelectedValue);
                tra.nvc_StreetAddress = text_Address.Value;
                tra.nvc_ZipCode = text_ZipCode.Value;
                tra.nvc_MobilePhone = text_Mobile.Value;
                tra.nvc_TelPhone = text_Call.Value;
                tra.i_MemberId = int.Parse(Hi_MemberId.Value);
                DALRA.ReceiveAddress_Add(tra);
            }
            #endregion
            UserLog.AddUserLog(Hi_MemberId.Value, "专利系统", "更新个人信息");
            div_a.InnerHtml = "<script>alert('수개성공');location.href='User_PatentUpdateData.aspx';</script>";
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('매개 변수 잘못된 검토해 주십시오 후 제출！');location.href='user_sbzl.aspx';</script>";
        }

    }
    //protected void ddl_guojia_SelectedIndexChanged(object sender, EventArgs e)//国家改变
    //{
    //    DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_guojia.SelectedValue);
    //    DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    //protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)//省改变
    //{
    //    DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    //protected void ddl_shi_SelectedIndexChanged(object sender, EventArgs e)//市改变
    //{
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
}