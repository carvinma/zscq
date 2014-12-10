using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class M_A_TradeMark : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    dal_Address DALB = new dal_Address();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_Member DALM = new dal_Member();
    public string PageType = "添加申请";
    public StringBuilder img_color = new StringBuilder();
    public string returnurl = "";

    private dal_Goods goods = new dal_Goods();
    private dal_NewTrademark mark = new dal_NewTrademark();
    private dal_CaseNoOrder caseNo = new dal_CaseNoOrder();
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
            //Bind_Drp_PGuoJiaType();
            Bind_Page_Info();

            t_GoodsCategoryFees fees = goods.CategoryFees_Select_One();
            hi_MainFees.Value = fees.MainFees.Value.ToString();
            hi_ItemNum.Value = fees.ItemNum.Value.ToString();
            hi_ExceedFees.Value = fees.ExceedFees.Value.ToString();
        }
    }

  
    public void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null)
        {
            PageType = "修改商标";
            hd_id.Value = Request.QueryString["id"].ToString();
            t_Trademark model = DALT.Trademark_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                hd_userId.Value = model.i_MemberId.ToString();
                t_Member mm = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
                if (mm != null)
                {
                    txt_MemberId.Value = mm.nvc_UserNum.ToString();
                }
            }
        }
    }

    private t_NewTradeMarkInfo InitModel()
    {
        string filePath = "File_Zscq/File_ShangBiao/";
        if (!System.IO.Directory.Exists(Server.MapPath(filePath)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(filePath));
        }

        t_NewTradeMarkInfo model = new t_NewTradeMarkInfo();
        string usermember = txt_MemberId.Value;
        t_Member mm = DALM.Member_Select_ByUserNum(usermember);
        if (mm == null) return null;
        model.i_MemberId = mm.i_Id;
        model.ApplyName = txt_applyname.Value.Trim();
        model.ApplyType = this.RdoPeople.Checked ? 1 : 0;
        string fileName = string.Empty;
        if (model.ApplyType == 1)
        {
            model.CardNoType = 0;
            model.CardNo = txt_applyCardNo.Value.Trim();
            fileName = this.hiUpCardNo.Value;//身份证
            if (!string.IsNullOrEmpty(fileName))
            {
                System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath(filePath + fileName));
                model.CardNoPDF = filePath + fileName;
            }
        }
        fileName = this.upBusinessLinces.Value;//营业执照
        if (!string.IsNullOrEmpty(fileName))
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
        model.Is3D = Radio3DNo.Checked ? false : true;
        model.IsColor = rdoColorNO.Checked ? false : true;
        model.IsSound = chkSound.Checked ? true : false;
        if (!string.IsNullOrEmpty(this.upSound.Value))
        {
            fileName = this.upSound.Value;//声音
            System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath(filePath + fileName));
            model.SoundFile = filePath + fileName;
        }
        model.TrademarkRemark = txt_remark.Value.Trim();
        model.TrademarkType = sortarr.Value.Trim();
        model.TrademarkGoods = sortGoods.Value.Trim();
        fileName = this.upPattern1.Value;//图样1
        string baseDir = System.AppDomain.CurrentDomain.BaseDirectory;
       // System.IO.File.Move(baseDir+"UploadTemp\\" + fileName,baseDir+filePath + fileName);

        System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
               HttpContext.Current.Server.MapPath(filePath + fileName));
        model.TrademarkPattern1 = filePath + fileName;


        if (!string.IsNullOrEmpty(this.upPattern2.Value))
        {
            fileName = this.upPattern2.Value;//图样2
            System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath(filePath + fileName));
            model.TrademarkPattern2 = filePath + fileName;
        }
        return model;
    }
    protected void btOK_Click(object sender, EventArgs e)
    {
        var model = InitModel();
        if (model != null)
        {
            model.IsSubmit = true;
            mark.Trademark_Add(model);
        }
    }
     
     

}