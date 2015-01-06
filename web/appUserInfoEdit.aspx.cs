using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;
using zscq.BLL;
using System.IO;

public partial class appUserInfoEdit : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Address address = new dal_Address();
    dal_Apply apply = new dal_Apply();
    public string PageType = "add";
    public string TitleOrKeyword = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string url = "";
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
        // TitleOrKeyword = "<title>票据邮寄地址_账户中心_专利系统_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        url = Request.Url.ToString();
        div_a.InnerHtml = "";
        //Bind_Page_Title();
        if (!IsPostBack)
        {
            Bind_Page_Member();
            InitPage();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
            t_Member m = DALM.Member_Select_Id(int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString()));
            if (m != null)
            {
                Hi_Mr.Value = m.i_DefaultAddress.ToString();
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }

    private void InitPage()
    {
        string id = Request.QueryString["id"];
        if (!string.IsNullOrEmpty(id))
        {
            Hi_id.Value = id.ToString();
            var model = apply.Apply_Select_Id(int.Parse(id));
            Hi_ApplyType.Value = model.ApplyType.ToString();
            txt_applyname.Value = model.ApplyName;
            //model.ApplyPinYin = PinYinConverter.Get(txt_applyname.Value.Trim());
            if (!string.IsNullOrEmpty(model.ApplyCardNo))
                txt_applyCardNo.Value = model.ApplyCardNo;
            txt_phone.Value = model.PhoneNo;
            if (!string.IsNullOrEmpty(txt_fax.Value))
                txt_fax.Value = model.FaxNo;
            this.txt_ContactPerson.Value = model.ContactPerson;

            Hi_prov.Value = model.provinceID.Value.ToString();
            Hi_city.Value = model.cityID.Value.ToString();
            Hi_country.Value = model.areaID.Value.ToString();
            this.txt_address.Value = model.Address;
            txt_postcode.Value = model.PostCode;

            if (!string.IsNullOrEmpty(model.MobilePhone))
                txt_mobile.Value = model.MobilePhone;
            txt_email.Value = model.Email;
            if (model.QQ.HasValue)
                txt_qq.Value = model.QQ.Value.ToString();

            if (!string.IsNullOrEmpty(model.MainQualificationPath))
            {
                this.HiUpZhuTiZiGe.Value = model.MainQualificationPath;
                aZhuTiZiGePdf.Visible = true;
            }

            if (!string.IsNullOrEmpty(model.CardNoPath))
            {
                this.hiUpCardNo.Value = model.CardNoPath;
                aCardNoPdf.Visible = true;
            }
            
        }
    }
    protected void Bt_AddAddress_Click(object sender, ImageClickEventArgs e)
    {
        string filePath = "File_Zscq/File_ShangBiao/";
        if (!System.IO.Directory.Exists(Server.MapPath(filePath)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(filePath));
        }
        t_Apply model = apply.Apply_Select_Id(int.Parse(Hi_id.Value));
        if (model.i_Id > 0)
        {
            model.MemberID = int.Parse(Hi_MemberId.Value);
            model.ApplyType = int.Parse(Hi_ApplyType.Value);
            model.ApplyName = txt_applyname.Value.Trim();
            model.ApplyPinYin = PinYinConverter.Get(txt_applyname.Value.Trim());
            if (!string.IsNullOrEmpty(txt_applyCardNo.Value))
                model.ApplyCardNo = txt_applyCardNo.Value.Trim();
            model.PhoneNo = txt_phone.Value.Trim();
            if (!string.IsNullOrEmpty(txt_fax.Value))
                model.FaxNo = txt_fax.Value.Trim();
            model.ContactPerson = this.txt_ContactPerson.Value.Trim();

            if (!string.IsNullOrEmpty(Hi_prov.Value))
                model.provinceID = int.Parse(Hi_prov.Value.Trim());
            if (!string.IsNullOrEmpty(Hi_city.Value))
                model.cityID = int.Parse(Hi_city.Value.Trim());
            if (!string.IsNullOrEmpty(Hi_country.Value))
                model.areaID = int.Parse(Hi_country.Value.Trim());
            model.Address = this.txt_address.Value.Trim();
            model.PostCode = txt_postcode.Value.Trim();
            if (!string.IsNullOrEmpty(txt_mobile.Value))
                model.MobilePhone = txt_mobile.Value.Trim();
            model.Email = txt_email.Value.Trim();
            if (!string.IsNullOrEmpty(txt_qq.Value))
                model.QQ = int.Parse(txt_qq.Value.Trim());

            #region 文件上传
            //if (FileUpload1.HasFile)
            //{
            //    string urlname = "";
            //    int i = UpfileLoad(FileUpload1, "File_Zscq/File_ShangBiao/", "SBCYLXRZT", ref urlname);//主体资格证明
            //    if (i == 1) 
            //    {
            //        div_a.InnerHtml = "<script>alert('文件大小不能超过 500KB');location.href='" + url + "';</script>";
            //        return;
            //    }
            //    if (i == 2)
            //    {
            //        div_a.InnerHtml = "<script>alert('文件格式仅限(.jpg  .png  .gif .pdf)!');location.href='" + url + "';</script>";
            //        return;
            //    }
            //   model.MainQualificationPath= urlname;
            //}
            //if (FileUpload2.HasFile)
            //{
            //    string urlname = "";
            //    int i = UpfileLoad(FileUpload2, "File_Zscq/File_ShangBiao/", "SBCYLXRSF", ref urlname);
            //    if (i == 1)
            //    {
            //        div_a.InnerHtml = "<script>alert('文件大小不能超过 500KB');location.href='" + url + "';</script>";
            //        return;
            //    }
            //    if (i == 2)
            //    {
            //        div_a.InnerHtml = "<script>alert('文件格式仅限(.jpg  .png  .gif .pdf)!');location.href='" + url + "';</script>";
            //        return;
            //    }
            //    model.CardNoPath = urlname;
            //}
            string fileName = this.HiUpZhuTiZiGe.Value;//主体资格证明
            if (!string.IsNullOrEmpty(fileName))
            {
                if (fileName.Contains("File_ShangBiao"))
                {
                    model.MainQualificationPath = fileName;
                }
                else
                {
                    System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                       HttpContext.Current.Server.MapPath(filePath + fileName));
                    model.MainQualificationPath = filePath + fileName;
                }
            }
            fileName = this.hiUpCardNo.Value;//身份证
            if (!string.IsNullOrEmpty(fileName))
            {
                if (fileName.Contains("File_ShangBiao"))
                {
                    model.CardNoPath = fileName;
                }
                else
                {
                    System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                       HttpContext.Current.Server.MapPath(filePath + fileName));
                    model.CardNoPath = filePath + fileName;
                }
            }
            #endregion

            switch (apply.Apply_Submit())
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('发生意外，暂时无法常修改用联系人!');</script>";
                    break;
                case 1:
                    //UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "添加常用联系人！");
                    div_a.InnerHtml = "<script>alert('修改成功！'); window.location='appUserInfo.aspx'</script>";
                    break;
            }
        }

    }

}