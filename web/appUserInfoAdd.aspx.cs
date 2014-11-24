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

public partial class appUserInfoAdd : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Address DALA = new dal_Address();
    dal_Nationality DALN = new dal_Nationality();
    private bll_Trademark bllmark = new bll_Trademark();
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
        TitleOrKeyword = "<title>票据邮寄地址_账户中心_专利系统_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        url = Request.Url.ToString();
        div_a.InnerHtml = "";
        Bind_Page_Title();
        if (!IsPostBack)
        {
            Bind_Page_Member();
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
    protected void Bt_AddAddress_Click(object sender, EventArgs e)
    {
        t_ReceiveAddress model = new t_ReceiveAddress();
        if (Hi_AddressId.Value != "0")
        {
            model = DALRA.ReceiveAddress_Select_Id(Convert.ToInt32(Hi_AddressId.Value));
        }
        // model.nvc_Consignee = text_shouhuoren.Value;
        //// model.i_Gid=Convert.ToInt32(this.ddl_guojia.SelectedValue);
        // //model.i_PId = Convert.ToInt32(this.ddl_sheng.SelectedValue);
        // //model.i_CId = Convert.ToInt32(this.ddl_shi.SelectedValue);
        // //model.i_AId = Convert.ToInt32(this.ddl_qu.SelectedValue);
        // model.nvc_StreetAddress = text_shouhuodizhi.Value;
        // model.nvc_ZipCode = text_youzhengbianma.Value;
        // model.nvc_MobilePhone = text_shoujihaoma.Value;
        // model.nvc_TelPhone = text_gudingdianhua.Value;
        // model.nvc_Email = text_dianziyoujian.Value;
        // model.i_MemberId = int.Parse(Hi_MemberId.Value);
        if (Hi_AddressId.Value == "0")
        {
            switch (DALRA.ReceiveAddress_Add(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('发生意外，暂时无法添加地址!');</script>";
                    break;
                case 1:
                    //if (ismr.Checked)
                    //{
                    //    DALRA.ReceiveAddress_Update_Mr(model.i_Id);
                    //}
                    UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "添加地址");
                    div_a.InnerHtml = "<script>alert('添加成功！'); window.location='user_sbdz.aspx'</script>";
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('您已经有相同收货人和相同地址信息，不需要重复添加!');</script>";
                    break;
            }
        }
        else
        {
            switch (DALRA.ReceiveAddress_Update(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('发生意外，暂时无法修改地址!');</script>";
                    break;
                case 1:
                    //if (ismr.Checked)
                    //{
                    //    DALRA.ReceiveAddress_Update_Mr(model.i_Id);
                    //}
                    UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "添加地址");
                    div_a.InnerHtml = "<script>alert('修改成功！'); window.location='user_sbdz.aspx'</script>";
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('您已经有相同收货人和相同地址信息，不需要重复添加!');</script>";
                    break;
            }
        }
    }
    protected void Bt_AddAddress_Click(object sender, ImageClickEventArgs e)
    {
        t_Apply model = new t_Apply();
        model.MemberID = int.Parse(Hi_MemberId.Value);
        model.ApplyType = int.Parse(Hi_ApplyType.Value);
        model.ApplyName = txt_applyname.Value.Trim();
        model.ApplyPinYin = PinYinConverter.Get(txt_applyname.Value.Trim());
        if (!string.IsNullOrEmpty(txt_applyCardNo.Value))
            model.ApplyCardNo = txt_applyCardNo.Value.Trim();
        model.PhoneNo = txt_phone.Value.Trim();
        if (!string.IsNullOrEmpty(txt_fax.Value))
            model.FaxNo = txt_fax.Value.Trim();

        if (!string.IsNullOrEmpty(Hi_prov.Value))
            model.provinceID = int.Parse(Hi_prov.Value.Trim());
        if (!string.IsNullOrEmpty(Hi_city.Value))
            model.cityID = int.Parse(Hi_city.Value.Trim());
        if (!string.IsNullOrEmpty(Hi_country.Value))
            model.areaID = int.Parse(Hi_country.Value.Trim());
        model.Address = this.txt_address.Value.Trim();
        model.PostCode = txt_postcode.Value.Trim();
        if (!string.IsNullOrEmpty(txt_mobile.Value))
            model.MobilePhone =txt_mobile.Value.Trim();
        model.Email = txt_email.Value.Trim();
        if (!string.IsNullOrEmpty(txt_qq.Value))
            model.QQ = int.Parse(txt_qq.Value.Trim());

        #region 文件上传
        if (FileUpload1.HasFile)
        {
            string urlname = "";
            int i = UpfileLoad(FileUpload1, "File_Zscq/File_ShangBiao/", "SBCYLXRZT", ref urlname);//主体资格证明
            if (i == 1) 
            {
                div_a.InnerHtml = "<script>alert('文件大小不能超过 500KB');location.href='" + url + "';</script>";
                return;
            }
            if (i == 2)
            {
                div_a.InnerHtml = "<script>alert('文件格式仅限(.jpg  .png  .gif .pdf)!');location.href='" + url + "';</script>";
                return;
            }
           model.MainQualificationPath= urlname;
        }
        if (FileUpload2.HasFile)
        {
            string urlname = "";
            int i = UpfileLoad(FileUpload2, "File_Zscq/File_ShangBiao/", "SBCYLXRSF", ref urlname);
            if (i == 1)
            {
                div_a.InnerHtml = "<script>alert('文件大小不能超过 500KB');location.href='" + url + "';</script>";
                return;
            }
            if (i == 2)
            {
                div_a.InnerHtml = "<script>alert('文件格式仅限(.jpg  .png  .gif .pdf)!');location.href='" + url + "';</script>";
                return;
            }
            model.CardNoPath = urlname;
        }
        #endregion

        switch (bllmark.Apply_Add(model))
        {
            case 0:
                div_a.InnerHtml = "<script>alert('发生意外，暂时无法常用联系人!');</script>";
                break;
            case 1:
                //UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "添加常用联系人！");
                div_a.InnerHtml = "<script>alert('添加成功！'); window.location='appUserInfo.aspx'</script>";
                break;
        }

    }

    public int UpfileLoad(FileUpload fileup, string pathname, string filename, ref string urlname)
    {
        string exname = Path.GetExtension(fileup.FileName).ToLower();
        string fileNameExt = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
        if (fileNameExt == ".jpg" || fileNameExt == ".gif" || fileNameExt == ".png" || fileNameExt == ".pdf")
        {
            if (fileup.PostedFile.ContentLength > 1024 * 1024 * 0.5)
            {
                return 1;
            }
            string toFileName = DateTime.Now.ToString("HHmmssff") + new Random().Next(100) + fileNameExt;//fileup.FileName;
            string path = System.AppDomain.CurrentDomain.BaseDirectory + pathname + filename + toFileName;
            fileup.SaveAs(path);
            urlname = pathname + filename + toFileName;
        }
        else
        {

            return 2;
        }
        return 0;
    }
}