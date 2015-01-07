using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.IO;
using zscq.BLL;
public partial class user_sbzl : System.Web.UI.Page
{
    DataMemberDataContext dmdc = new DataMemberDataContext();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    dal_Nationality DALN = new dal_Nationality();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Apply apply = new dal_Apply();
    public string UserName = "", userbianhao = "";
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
       

        if (!IsPostBack)
        { Bind_Page_Title();
        Bind_Page_Member();
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
            if (model.i_UserTypeId != null) //1代表个人，2代表企业，3代表代理机构
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

            Hi_prov.Value = model.i_ProvinceId.ToString();
            Hi_city.Value = model.i_CityId.ToString();
            Hi_country.Value = model.i_AreaId.ToString();

            txt_address.Value = model.nvc_Address;
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

    private void InsertApplyUser(t_Member memberModel)
    {
        t_Apply model = new t_Apply();
        model.MemberID = int.Parse(Hi_MemberId.Value);
        model.ApplyType = memberModel.i_UserTypeId.Value == 1 ? 1 : 0;
        string applyName = memberModel.i_UserTypeId.Value == 1 ? memberModel.nvc_RealName : memberModel.nvc_Company;
        model.ApplyName = applyName;
        model.ApplyPinYin = PinYinConverter.Get(applyName);
        if (!string.IsNullOrEmpty(memberModel.nvc_IDCard))
            model.ApplyCardNo = memberModel.nvc_IDCard;
        model.PhoneNo = memberModel.nvc_TelPhone;
        if (!string.IsNullOrEmpty(memberModel.nvc_FaxNumber))
            model.FaxNo = memberModel.nvc_FaxNumber;
        model.ContactPerson = memberModel.nvc_RealName;

        if (!string.IsNullOrEmpty(Hi_prov.Value))
            model.provinceID = int.Parse(Hi_prov.Value.Trim());
        if (!string.IsNullOrEmpty(Hi_city.Value))
            model.cityID = int.Parse(Hi_city.Value.Trim());
        if (!string.IsNullOrEmpty(Hi_country.Value))
            model.areaID = int.Parse(Hi_country.Value.Trim());
        model.Address = memberModel.nvc_Address;
        model.PostCode = memberModel.nvc_ZipCode;
        model.Email = memberModel.nvc_Email;
        if (!string.IsNullOrEmpty(memberModel.nvc_LinkManQQ))
            model.QQ = int.Parse(memberModel.nvc_LinkManQQ);

        model.MainQualificationPath = memberModel.nvc_ZhuTiFile;//主体资格证明
        //model.CardNoPath=   //身份证
        apply.myInfoApplyAdd(model);
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

    protected void Bt_Submit_Click(object sender, ImageClickEventArgs e)
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
            if (c_phone.Value != "")
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
            model.nvc_Company = c_company.Value;
            model.nvc_EnCompany = c_companyEn.Value;
            model.nvc_DaiLiName = c_dailiName.Value;
            model.nvc_RealName = c_Name.Value;
            model.nvc_EnglishName = c_NameEn.Value;
            model.nvc_IDCard = c_Idcard.Value.Trim();

            model.i_IsSend = RadioButtonList2.SelectedValue.GetInt();
            model.i_ProvinceId = int.Parse(Hi_prov.Value.Trim());
            model.i_CityId = int.Parse(Hi_city.Value.Trim());
            model.i_AreaId = int.Parse(Hi_country.Value.Trim());

            model.nvc_Address = txt_address.Value;
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
                //if (fileNameExt == ".jpg" || fileNameExt == ".gif" || fileNameExt == ".png" || fileNameExt == ".pdf")
                if (fileNameExt == ".pdf")
                {
                    if (FileUpload3.PostedFile.ContentLength > 1024 * 1024 *1)
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
                    MessageBox.ShowAndRedirect(this.Page, "文件格式错误！", "user_sbzl.aspx");
                    return;
                }
            }
            DALM.Member_Update(model);
            //插入申请人
            InsertApplyUser(model);
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
}