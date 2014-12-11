using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class add_trademark_renewal : System.Web.UI.Page
{
    private dal_Goods goods = new dal_Goods();
    private dal_NewTrademark mark = new dal_NewTrademark();
    private dal_CaseNoOrder caseNo = new dal_CaseNoOrder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Page_Member();
            t_GoodsCategoryFees fees = goods.CategoryFees_Select_One();
            hi_MainFees.Value = fees.MainFees.Value.ToString();
            hi_ItemNum.Value = fees.ItemNum.Value.ToString();
            hi_ExceedFees.Value = fees.ExceedFees.Value.ToString();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    protected void btnPreview_Click(object sender, EventArgs e)
    {
        txt_applyname.Value.Trim();
        Hi_prov.Value.Trim();
        Hi_city.Value.Trim();
        Hi_country.Value.Trim();
        txt_address.Value.Trim();
        txt_ContactPerson.Value.Trim();
        txt_phone.Value.Trim();
        txt_fax.Value.Trim();
        txt_postcode.Value.Trim();
        txt_remark.Value.Trim();

        sortarr.Value.Trim();//商标类别

        //Radio3DNo.Checked
        //chkSound.Checked
    }
    private t_NewTradeMarkInfo InitModel()
    {
        string filePath = "File_Zscq/File_ShangBiao/";
        if (!System.IO.Directory.Exists(Server.MapPath(filePath)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(filePath));
        }

        t_NewTradeMarkInfo model = new t_NewTradeMarkInfo();
        model.i_MemberId = int.Parse(Hi_MemberId.Value);
        model.i_Type = 1;
        model.ApplyName = txt_applyname.Value.Trim();
        model.ApplyType = this.RdoPeople.Checked ? 1 : 0;
        string fileName = string.Empty;
        if (model.ApplyType == 1)
        {
            model.CardNoType = 0;
            model.CardNo = txt_applyCardNo.Value.Trim();
            fileName = this.hiUpCardNo.Value;//身份证
            if (fileName.Contains("File_ShangBiao"))
            {
                model.CardNoPDF = fileName;
            }
            else
            {
                System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath(filePath + fileName));
                model.CardNoPDF = filePath + fileName;
            }
        }
        fileName = this.upBusinessLinces.Value;//营业执照
        if (fileName.Contains("File_ShangBiao"))
        {
            model.Businesslicense = fileName;
        }
        else
        {
            System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                    HttpContext.Current.Server.MapPath(filePath + fileName));
            model.Businesslicense = filePath + fileName;
        }

        model.ProvinceId = int.Parse(Hi_prov.Value);
        int cityid, areaid;
        if (int.TryParse(Hi_city.Value, out cityid))
            model.CityId = cityid;
        if (int.TryParse(Hi_country.Value, out areaid))
            model.AreaId = areaid;
        model.Address = txt_address.Value.Trim();
        model.ContactPerson = txt_ContactPerson.Value.Trim();
        model.Phone = txt_phone.Value.Trim();
        model.Fax = txt_fax.Value.Trim();
        model.PostCode = txt_postcode.Value.Trim();
        //日期+本日的序号，6位+3位，例如：141016001
        model.CaseNo = caseNo.GetTodayMaxCaseNo();
        model.RegisteredNo = txt_RegNo.Value.Trim();
        int desctype = 0;
        if (RadioButton2.Checked) desctype = 1;
        if (RadioButton3.Checked) desctype = 2;
        model.TrademarkDescribeType = desctype;
        model.TrademarkDescribe = Sb_miaosu.Value.Trim();
        if (!string.IsNullOrEmpty(txt_applydate.Value))
            model.ApplyDate = DateTime.Parse(txt_applydate.Value);
        model.RegNoticeDate = DateTime.Parse(txt_RegNoticeDate.Value);
        if (!string.IsNullOrEmpty(txt_RenewalDate.Value))
            model.RenewalDate = DateTime.Parse(txt_RenewalDate.Value);
        if (!string.IsNullOrEmpty(this.upRegisteCertificate.Value))
        {
            fileName = this.upRegisteCertificate.Value;//注册证书
            System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath(filePath + fileName));
            model.TrademarkRegBook = filePath + fileName;
        }
        model.TrademarkRemark = txt_remark.Value.Trim();
        model.TrademarkType = sortarr.Value.Replace('，', ',').Trim();
        model.TrademarkGoods = sortGoods.Value.Trim();
        fileName = this.upPattern1.Value;//图样
        System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
               HttpContext.Current.Server.MapPath(filePath + fileName));
        model.TrademarkPattern1 = filePath + fileName;
        model.Remark = txt_remark.Value.Trim();
       
        return model;
    }
    private void addRegNoticeData(int trademarkid)
    {
        //续展日期
        string xzDate = hi_RegNoticeDate.Value.Trim();
        if (!string.IsNullOrEmpty(xzDate))
        {
            List<t_NewTradeMarkRenewalInfo> list = new List<t_NewTradeMarkRenewalInfo>();
            string[] liststr = xzDate.Split('|');
            for (int i = 0; i < liststr.Length - 1; i++)
            {
                t_NewTradeMarkRenewalInfo renewalModel = new t_NewTradeMarkRenewalInfo();
                string[] RenewalDate = liststr[i].Split('_');
                renewalModel.TradeMarkId = trademarkid;
                renewalModel.RenewalDate = DateTime.Parse(RenewalDate[0]);
                renewalModel.IsFinish = RenewalDate[1]=="1" ?true:false ;
                list.Add(renewalModel);
            }
            if (list.Count > 0)
            {
                mark.TrademarkRenewalDate_Add(list, trademarkid);
            }

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        var model = InitModel();
        model.IsSubmit = false;
        mark.Trademark_Add(model);
        addRegNoticeData(model.i_Id);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var model = InitModel();
        model.IsSubmit = true;
        mark.Trademark_Add(model);
        addRegNoticeData(model.i_Id);
    }
    protected void btnCancle_Click(object sender, EventArgs e)
    {

    }
}