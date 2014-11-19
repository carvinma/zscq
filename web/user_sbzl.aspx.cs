using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.IO;
public partial class user_sbzl : System.Web.UI.Page
{
    DataMemberDataContext dmdc = new DataMemberDataContext();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    dal_Nationality DALN = new dal_Nationality();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    public string UserName = "",userbianhao="";
    public string TitleOrKeyword = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "", zhutiwenjian = "";
    public int guoji = 0, usertype = 0;
    public void Bind_Page_Title()
    {
        dal_SystemSetup DALSS = new dal_SystemSetup();
        t_SystemSetup t = DALSS.SystemSetup_Select();
        if (t.nvc_ShopName != null && t.nvc_ShopName != "")
        {
            ShopName = t.nvc_ShopName;
        }
        if (t.nvc_ShopKeywords != null && t.nvc_ShopKeywords != "")
        {
            ShopKeywords = t.nvc_ShopKeywords;
        }
        if (t.nvc_ShopDescription != null && t.nvc_ShopDescription != "")
        {
            ShopDescription = t.nvc_ShopDescription;
        }
        TitleOrKeyword = "<title>修改资料_账户中心_商标系统_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        Bind_Page_Title();
        Bind_Page_Member();

        if (!IsPostBack)
        {
            Bind_Drp_PGuoJiaType();
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        //Hi_MemberId.Value = "181";
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + Request.Url.LocalPath);
        }
    }
    public void Bind_Page_Info()//绑定基本信息
    {
        t_Member model = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));
        if (model != null)
        {
            if (model.i_GuoJiId == 1)//中国
            {
                guoji = 1;
                hi_guoji.Value = "1";
            }
            if (model.i_UserTypeId != null)
            {
                if (model.i_UserTypeId == 1)
                {
                    usertype = 1;
                    hi_usertype.Value = "1";
                }
                if (model.i_UserTypeId == 2)
                {
                    usertype = 2;
                    hi_usertype.Value = "2";
                }
                if (model.i_UserTypeId == 3)
                {
                    usertype = 3; hi_usertype.Value = "3";
                }
            }
            UserName = model.nvc_Name;
            userbianhao = model.nvc_UserNum;
            c_Name.Value = model.nvc_RealName;
            c_NameEn.Value = model.nvc_EnglishName;

            Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();
            //Drp_GuoJi_SelectedIndexChanged(null, null);
            //DropDownList2.SelectedValue = model.i_ProvinceId.ToString();
            //DropDownList2_SelectedIndexChanged(null, null);
            //DropDownList3.SelectedValue = model.i_CityId.ToString();
            //DropDownList3_SelectedIndexChanged(null, null);
            //DropDownList4.SelectedValue = model.i_AreaId.ToString();
            text_Address.Value = model.nvc_Address;
            c_addressEn.Value = model.nvc_EnAddress;
            c_company.Value = model.nvc_Company;
            c_companyEn.Value = model.nvc_EnCompany;
            c_dailiName.Value = model.nvc_DaiLiName;

            c_Idcard.Value = model.nvc_IDCard;
            c_youxiao.Value = model.nvc_IDCard;

            c_youbian.Value = model.nvc_ZipCode;
            c_phone.Value = model.nvc_MobilePhone;
            text_Call.Value = model.nvc_TelPhone;
            text_Email.Value = model.nvc_Email;
            text_BYEmail.Value = model.nt_BYEmail;
            text_chuanzhen.Value = model.nvc_FaxNumber;
            text_QQ.Value = model.nvc_LinkManQQ;
            text_msn.Value = model.nvc_LinkManMSN;
            RadioButtonList2.SelectedValue = model.i_IsSend.ToString();
            if (model.nvc_ZhuTiFile != null)
            {
                zhutiwenjian = "<a href='" + model.nvc_ZhuTiFile + "' target='_blank' title='点击查看'>已上传(点击可查看)</a>&nbsp;&nbsp;<span  style=\"color:Red;\">如证明文件有变更，请重新上传</span>";
            }
        }
    }

    protected void Bt_Submit_Click(object sender, EventArgs e)
    {
        try
        {
            t_Member model = DALM.Member_Select_Id(int.Parse(Hi_MemberId.Value));

            var result = from r in dmdc.t_Member where r.i_MemberType == 2 && r.nvc_Email.Trim() == text_Email.Value && r.i_Id != model.i_Id select r;
            if (result.Count() > 0)
            {
                div_a.InnerHtml = "<script>alert('邮箱已经被使用！');</script>";
                return;
            }
            var result2 = from r in dmdc.t_Member where r.i_MemberType == 2 && r.nvc_MobilePhone.Trim() == c_phone.Value && r.i_Id != model.i_Id select r;
            if (c_phone.Value !="")
            {
            if (result2.Count() > 0)
            {
                div_a.InnerHtml = "<script>alert('手机号已经被使用！');</script>";
                return;
            }
        }
            if (hi_guoji.Value == "1")
            {
                model.nvc_IDCard = c_Idcard.Value;
            }
            else
            {
                model.nvc_IDCard = c_youxiao.Value;
            }
            model.nvc_Company= c_company.Value;
             model.nvc_EnCompany = c_companyEn.Value;
            model.nvc_DaiLiName = c_dailiName.Value;
            model.nvc_RealName = c_Name.Value;
            model.nvc_EnglishName = c_NameEn.Value;

            model.i_IsSend = RadioButtonList2.SelectedValue.GetInt();
            //model.i_GuoJiId = int.Parse(Drp_GuoJi.SelectedValue);
            //model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);//添加省
            //model.i_CityId = int.Parse(DropDownList3.SelectedValue);//添加市
            //model.i_AreaId = int.Parse(DropDownList4.SelectedValue);//添加县
            model.nvc_Address = text_Address.Value;
            model.nvc_EnAddress = c_addressEn.Value;
            model.nvc_ZipCode = c_youbian.Value;
            model.nvc_MobilePhone = c_phone.Value;
            model.nvc_TelPhone = text_Call.Value;
            model.nvc_Email = text_Email.Value;
            model.nt_BYEmail = text_BYEmail.Value;
            model.nvc_FaxNumber = text_chuanzhen.Value;
            model.nvc_LinkManQQ = text_QQ.Value;
            model.nvc_LinkManMSN = text_msn.Value;

            if (FileUpload3.HasFile)
            {
                string exname = Path.GetExtension(FileUpload3.FileName).ToLower();
                string fileNameExt = System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName).ToLower();
                if (fileNameExt == ".jpg" || fileNameExt == ".gif" || fileNameExt == ".png" || fileNameExt == ".pdf")
                {
                    if (FileUpload3.PostedFile.ContentLength > 1024 * 1024 * 0.5)
                    {
                        MessageBox.Show(this.Page, "文件大小不能超过 500KB");
                        // div_a.InnerHtml = "<script>alert('文件大小不能超过 512KB');</script>";
                        return;
                    }
                    string toFileName = DateTime.Now.ToString("HHmmssff") + new Random().Next(100);
                    string path = System.AppDomain.CurrentDomain.BaseDirectory + "File_Zscq/File_ShangBiao/" + toFileName + "主体资格证明" + fileNameExt;
                    FileUpload3.SaveAs(path);
                    if (model.nvc_ZhuTiFile != null)
                    {
                        DelPhoto.DeleteFile(model.nvc_ZhuTiFile);
                    }
                    model.nvc_ZhuTiFile = "File_Zscq/File_ShangBiao/" + toFileName + "主体资格证明" + fileNameExt;
                }
                else
                {
                    MessageBox.ShowAndRedirect(this.Page,"文件格式错误！","user_sbzl.aspx");
                    return;
                }
            }
            DALM.Member_Update(model);

            //#region 添加到我的地址薄
            //IQueryable<t_ReceiveAddress> iquery = DALRA.ReceiveAddress_Select_MemberId(int.Parse(Hi_MemberId.Value));
            //if (iquery.Count() > 0)
            //{
            //    foreach (var v in iquery)
            //    {
            //        if (v.nvc_Consignee != c_Name.Value
            //            && v.i_Gid != Convert.ToInt32(this.Drp_GuoJi.SelectedValue)
            //             && v.i_PId != Convert.ToInt32(this.DropDownList2.SelectedValue)
            //             && v.i_CId != Convert.ToInt32(this.DropDownList3.SelectedValue)
            //             && v.i_AId != Convert.ToInt32(this.DropDownList4.SelectedValue)
            //             && v.nvc_StreetAddress != text_Address.Value
            //             && v.nvc_ZipCode != text_Email.Value
            //             && v.nvc_MobilePhone != c_phone.Value
            //             && v.nvc_TelPhone != text_Call.Value
            //            )
            //        {
            //            t_ReceiveAddress tra = new t_ReceiveAddress();
            //            tra.nvc_Consignee = c_Name.Value;
            //            tra.i_Gid = Convert.ToInt32(this.Drp_GuoJi.SelectedValue);
            //            tra.i_PId = Convert.ToInt32(this.DropDownList2.SelectedValue);
            //            tra.i_CId = Convert.ToInt32(this.DropDownList3.SelectedValue);
            //            tra.i_AId = Convert.ToInt32(this.DropDownList4.SelectedValue);
            //            tra.nvc_StreetAddress = text_Address.Value;
            //            tra.nvc_ZipCode = text_Email.Value;
            //            tra.nvc_MobilePhone = c_phone.Value;
            //            tra.nvc_TelPhone = text_Call.Value;
            //            tra.i_MemberId = int.Parse(Hi_MemberId.Value);
            //            DALRA.ReceiveAddress_Add(tra);
            //        }
            //    }
            //}
            //else
            //{
            //    t_ReceiveAddress tra = new t_ReceiveAddress();
            //    tra.nvc_Consignee = c_Name.Value;
            //    tra.i_Gid = Convert.ToInt32(this.Drp_GuoJi.SelectedValue);
            //    tra.i_PId = Convert.ToInt32(this.DropDownList2.SelectedValue);
            //    tra.i_CId = Convert.ToInt32(this.DropDownList3.SelectedValue);
            //    tra.i_AId = Convert.ToInt32(this.DropDownList4.SelectedValue);
            //    tra.nvc_StreetAddress = text_Address.Value;
            //    tra.nvc_ZipCode = text_Email.Value;
            //    tra.nvc_MobilePhone = c_phone.Value;
            //    tra.nvc_TelPhone = text_Call.Value;
            //    tra.i_MemberId = int.Parse(Hi_MemberId.Value);
            //    DALRA.ReceiveAddress_Add(tra);
            //}
            //#endregion
            UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "修改用户信息");
            // div_a.InnerHtml = "<script>alert('修改成功！');location.href='user_sbzl.aspx';</script>";
            ScriptManager.RegisterStartupScript(UpdatePanel2, this.GetType(), "", "<script>alert('修改成功！');location.href='user_sbzl.aspx';</script>", false);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(UpdatePanel2, this.GetType(), "", "<script>alert('参数有误，请核对后在提交！');location.href='user_sbzl.aspx';</script>", false);
            //div_a.InnerHtml = "<script>alert('参数有误，请核对后在提交！');location.href='user_sbzl.aspx';</script>";
        }
    }

    void Bind_Drp_PGuoJiaType()// 绑定国籍
    {
        Drp_GuoJi.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_GuoJi.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_GuoJi.Items.Add(li);
        }
    }
    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //protected void Drp_GuoJi_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(DropDownList2, Drp_GuoJi.SelectedValue);
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}

}