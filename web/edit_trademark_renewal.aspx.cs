using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using Aspose.Words;
using Aspose.Words.Drawing;

public partial class edit_trademark_renewal : System.Web.UI.Page
{
    private dal_Member DALU = new dal_Member();
    private dal_Goods goods = new dal_Goods();
    private dal_NewTrademark mark = new dal_NewTrademark();
    private dal_CaseNoOrder caseNo = new dal_CaseNoOrder();
    private dal_Address address = new dal_Address();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Page_Member();

            hi_MainFees.Value = goods.CategoryFees_Select_All().First(p => p.i_Type == 1).MainFees.ToString();//续展每个大类费用
            hi_tradeMarkdesc.Value = mark.TrademarkRenewalWriteSample();
            this.Sb_miaosu.Value = hi_tradeMarkdesc.Value;
            Bind_Page_Type();
        }
    }

    public void Bind_Page_Type()// 绑定页面信息
    {
        if (Request.QueryString["t_r_id"] != null && Request.QueryString["t_r_id"].ToString() != "")
        {
            int trademarkId = int.Parse(Request.QueryString["t_r_id"].ToString());
            Bind_Page_EditInfo(trademarkId);
            // Bind_TradeMarkStatus();
        }
        else
        {
            //Response.Redirect("trademark_list.aspx");
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

    #region  编辑
    private void Bind_Page_EditInfo(int trademarkId)// 绑定商标详细数据
    {
        var model = mark.Trademark_Select_Id(trademarkId);
        if (model.ApplyType == 0)
        {
            this.RdoPeople.Checked = false;
            this.RdoCorp.Checked = true;
        }
        else
        {
            this.RdoPeople.Checked = true;
            this.RdoCorp.Checked = false;
        }
        txt_applyname.Value = model.ApplyName;
        txt_applyCardNo.Value = model.CardNo;
        if (!string.IsNullOrEmpty(model.CardNoPDF))
        {
            hiUpCardNo.Value = model.CardNoPDF;
            aCardNoPdf.Visible = true;
        }
        if (!string.IsNullOrEmpty(model.Businesslicense))
        {
            upBusinessLinces.Value = model.Businesslicense;
            aBusinessLicense.Visible = true;
        }

        if (!string.IsNullOrEmpty(model.TrademarkRegBook))
        {
            upRegisteCertificate.Value = model.TrademarkRegBook;
            aRegisteCertificate.Visible = true;
        }

        Hi_prov.Value = model.ProvinceId.HasValue ? model.ProvinceId.ToString() : "0";////
        Hi_city.Value = model.CityId.HasValue ? model.CityId.ToString() : "0";
        Hi_country.Value = model.AreaId.HasValue ? model.AreaId.ToString() : "0";

        this.txt_address.Value = model.Address;
        this.txt_ContactPerson.Value = model.ContactPerson;
        this.txt_phone.Value = model.Phone;
        this.txt_fax.Value = model.Fax;
        this.txt_postcode.Value = model.PostCode;
        this.lblCaseNo.Text = model.CaseNo;

        this.txt_RegNo.Value = model.RegisteredNo;

        txt_remark.Value = model.Remark;
        sortarr.Value = model.TrademarkType;
        sortGoods.Value = model.TrademarkGoods;
        hi_money.Value = model.TrademarkMoney.ToString();
        if (model.TrademarkDescribeType == 0)
            this.RadioButton1.Checked = true;
        else if (model.TrademarkDescribeType == 1)
            this.RadioButton2.Checked = true;
        else
            this.RadioButton3.Checked = true;

        Sb_miaosu.Value = model.TrademarkDescribe;
        if (model.ApplyDate.HasValue)
            this.txt_applydate.Value = model.ApplyDate.Value.ToString("yyyy-MM-dd");
        if(model.RegNoticeDate.HasValue)
            this.txt_RegNoticeDate.Value = model.RegNoticeDate.Value.ToString("yyyy-MM-dd");

        if (model.RenewalDate.HasValue)
            this.txt_RenewalDate.Value = model.RenewalDate.Value.ToString("yyyy-MM-dd");

        //
        if (!string.IsNullOrEmpty(model.TrademarkPattern1))
        {
            Image1.ImageUrl = model.TrademarkPattern1;
            upPattern1.Value = model.TrademarkPattern1;
        }
        this.RptRenewalDate.DataSource = mark.TrademarkRenewalDate_Select_TrademarkId(trademarkId);
        this.RptRenewalDate.DataBind();

    }
    #endregion
   
    private t_NewTradeMarkInfo InitModel()
    {
        string filePath = "File_Zscq/File_ShangBiao/";
        if (!System.IO.Directory.Exists(Server.MapPath(filePath)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(filePath));
        }

        t_NewTradeMarkInfo model;
        if (Request.QueryString["t_r_id"] != null && Request.QueryString["t_r_id"].ToString() != "")
        {
            int trademarkId = int.Parse(Request.QueryString["t_r_id"].ToString());
            model = mark.Trademark_Select_Id(trademarkId);
        }
        else
        {
            model = new t_NewTradeMarkInfo();
        }
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

        int provid = 0, cityid = 0, areaid = 0;
        int.TryParse(Hi_prov.Value, out provid);
        int.TryParse(Hi_city.Value, out cityid);
        int.TryParse(Hi_country.Value, out areaid);
        model.ProvinceId = provid;
        model.CityId = cityid;
        model.AreaId = areaid;

        model.Address = txt_address.Value.Trim();
        model.ContactPerson = txt_ContactPerson.Value.Trim();
        model.Phone = txt_phone.Value.Trim();
        model.Fax = txt_fax.Value.Trim();
        model.PostCode = txt_postcode.Value.Trim();
        //日期+本日的序号，6位+3位，例如：141016001
        //model.CaseNo = caseNo.GetTodayMaxCaseNo();
        model.RegisteredNo = txt_RegNo.Value.Trim();
        int desctype = 0;
        if (RadioButton2.Checked) desctype = 1;
        if (RadioButton3.Checked) desctype = 2;
        model.TrademarkDescribeType = desctype;
        model.TrademarkDescribe = Sb_miaosu.Value.Trim();
        if (!string.IsNullOrEmpty(txt_applydate.Value))
            model.ApplyDate = DateTime.Parse(txt_applydate.Value);
        if (!string.IsNullOrEmpty(txt_RegNoticeDate.Value))
        {
            model.RegNoticeDate = DateTime.Parse(this.txt_RegNoticeDate.Value);
        }
        if (!string.IsNullOrEmpty(txt_PublicDate.Value))
        {
            model.PublicPreliminaryDate = DateTime.Parse(this.txt_PublicDate.Value);
        }
        if (!string.IsNullOrEmpty(txt_RenewalDate.Value))
        {
            model.RenewalDate = DateTime.Parse(txt_RenewalDate.Value);
            TimeSpan ts = DateTime.Parse(txt_RenewalDate.Value) - DateTime.Today;
            model.RestDays = ts.Days; //剩于天数
        }
        fileName = this.upRegisteCertificate.Value;//注册证书
        if (!string.IsNullOrEmpty(fileName))
        {
            if (fileName.Contains("File_ShangBiao"))
            {
                model.TrademarkRegBook = fileName;
            }
            else
            {
                System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                        HttpContext.Current.Server.MapPath(filePath + fileName));
                model.TrademarkRegBook = filePath + fileName;
            }
        }
        model.TrademarkRemark = txt_remark.Value.Trim();
        model.TrademarkType = sortarr.Value.Replace('，', ',').Trim();
        decimal money = 0;
        decimal.TryParse(hi_money.Value, out money);
        model.TrademarkMoney = money;
        model.TrademarkMoney = model.TrademarkType.Split(',').Length * decimal.Parse(hi_MainFees.Value);

        t_Member Membermodel = DALU.Member_Select_Id(model.i_MemberId);
        int disCount = Membermodel.i_PowerDaZhe;
        var agencyModel = goods.CategoryFees_Select_ByType(3);
        decimal? agencyFee = agencyModel.MainFees * model.TrademarkType.Split(',').Length;//代理费
        if (disCount > 0) agencyFee = agencyFee * (disCount / 100.0m); //打折
        model.TrademarkAgencyFee = agencyFee;//代理费

        model.TrademarkLateFee = 0;//滞纳金
        if (!string.IsNullOrEmpty(txt_RenewalDate.Value))
        {
            model.RenewalDate = DateTime.Parse(txt_RenewalDate.Value);
            TimeSpan ts = DateTime.Parse(txt_RenewalDate.Value) - DateTime.Today;
            model.RestDays = ts.Days; //剩于天数
            #region 计算滞纳金
            if (ts.Days <= 0)
            {
                var latefeeModel = goods.CategoryFees_Select_ByType(4);
                model.TrademarkLateFee = latefeeModel.MainFees * model.TrademarkType.Split(',').Length;
            }
            #endregion
        }
        //model.TrademarkGoods = sortGoods.Value.Trim();
        fileName = this.upPattern1.Value;//图样
        if (!string.IsNullOrEmpty(fileName))
        {
            if (fileName.Contains("File_ShangBiao"))
            {
                model.TrademarkPattern1 = fileName;
            }
            else
            {
                System.IO.File.Move(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName),
                        HttpContext.Current.Server.MapPath(filePath + fileName));
                model.TrademarkPattern1 = filePath + fileName;
            }
        }
        model.Remark = txt_remark.Value.Trim();

        if (model.RestDays > 90)
            model.Status = 2;
        else if (model.RestDays <= 90 && model.RestDays >= 61)
            model.Status = 3;
        else if (model.RestDays <= 60 && model.RestDays >= 31)
            model.Status = 4;
        else if (model.RestDays <= 30 && model.RestDays >= 16)
            model.Status = 5;
        else if (model.RestDays <= 15 && model.RestDays >= 0)
            model.Status = 6;
        else if (model.RestDays < 0)
            model.Status = 7;
        else if (model.RestDays < 0 && model.RestDays >= -30)
            model.Status = 8;
        else if (model.RestDays < -30 && model.RestDays >= -150)
            model.Status = 8;

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
                renewalModel.IsFinish = RenewalDate[1] == "1" ? true : false;
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
        model.RenewalAgentBook = CreateAgentBook(model);
        model.RenewalApplyBook = CreateApplyBook(model);
        if (mark.Trademark_Submit() > 0)
        {
            addRegNoticeData(model.i_Id);
            div_a.InnerHtml = "<script>alert('信息添加成功!');<script>";
            UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "更新商标内容");
            Response.Redirect("trademarkrenewal_list.aspx");
        }
        else
        {
            div_a.InnerHtml = "<script>alert('信息更新失败!');<script>";
        }
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var model = InitModel();
        model.RenewalAgentBook = CreateAgentBook(model);
        model.RenewalApplyBook = CreateApplyBook(model);
        if (mark.Trademark_Submit() > 0)
        {
            addRegNoticeData(model.i_Id);
            UserLog.AddUserLog(Hi_MemberId.Value, "商标系统", "更新商标内容");
            Response.Redirect("Add_TrademarkrenewalOrder.aspx?ids=" + model.i_Id);
        }
        else
        {
            div_a.InnerHtml = "<script>alert('信息更新失败!');<script>";
        }
    }

    /// <summary>
    /// 商标续展代理委托书
    /// </summary>
    private string CreateAgentBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = Server.MapPath("File_Zscq/template/BookTrademarkRenewalAgent.doc");
        Document doc = new Document(tmppath); //载入模板 
        DocumentBuilder builder = new DocumentBuilder(doc);

        NodeCollection shapeCollection = doc.GetChildNodes(NodeType.Shape, true);

        // Since we will be adding/removing nodes, it is better to copy all collection
        // into a fixed size array, otherwise iterator will be invalidated.
        Node[] shapes = shapeCollection.ToArray();

        int k = 0;
        foreach (Shape shape in shapes)
        {
            if (shape.ShapeType.Equals(ShapeType.TextBox))//委托人 //商标
            {
                string value = string.Empty;
                if (k == 0)
                {
                    value = model.ApplyName;
                    if (model.ApplyType == 1)
                        value = model.ApplyName + "(" + model.CardNo + ")";
                }
                else if (k == 1)
                {
                    value = model.TrademarkDescribe;
                    if (string.IsNullOrEmpty(value))
                    {
                        value = "商标注册号为" + model.RegisteredNo;
                        //System.IO.FileInfo file = new System.IO.FileInfo(HttpContext.Current.Server.MapPath(model.TrademarkPattern1));
                        //if (file.Exists)
                        //{
                        //    builder.MoveToBookmark("pattern");
                        //    builder.InsertImage(HttpContext.Current.Server.MapPath(model.TrademarkPattern1), 40, 20);
                        //}
                    }
                }
                shape.AppendChild(new Paragraph(doc));
                Paragraph para = shape.FirstParagraph;
                para.ParagraphFormat.Alignment = ParagraphAlignment.Center;

                Run run = new Run(doc);
                run.Text = value;
                run.Font.Name = "宋体";
                run.Font.Size = 12;
                para.AppendChild(run);
                if (k == 1) break;
                k++;
            }
        }
        foreach (Aspose.Words.Bookmark mark in doc.Range.Bookmarks)
        {
            if (mark.Name == "client")
            {
            }
        
            if (mark.Name == "address")
                mark.Text = (division.Replace(" ", "") + model.Address).PadRight(26, ' ');
            if (mark.Name == "linkman")
                mark.Text = model.ContactPerson.PadRight(29, ' ');
            if (mark.Name == "tel")
                mark.Text = model.Phone.PadRight(29, ' ');
            if (mark.Name == "postcode")
                mark.Text = model.PostCode.PadRight(29, ' ');
        }
        string docPath ="File_Zscq/AccountPDF/TrademarkRenewalAgent" + model.CaseNo + ".doc";
        doc.Save(Server.MapPath(docPath));
        return docPath;
    }
    /// <summary>
    /// 商标续展注册申请书
    /// </summary>
    private string CreateApplyBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = Server.MapPath("File_Zscq/template/BookTrademarkRenewalApply.doc");
        Document doc = new Document(tmppath); //载入模板 
        DocumentBuilder builder = new DocumentBuilder(doc);

        dal_SystemSetup systemSetup = new dal_SystemSetup();
        t_SystemSetup systemModel = systemSetup.SystemSetup_Select();

        foreach (Aspose.Words.Bookmark mark in doc.Range.Bookmarks)
        {
            if (mark.Name == "applyname")
            {
                string agentPeople = model.ApplyName;
                if (model.ApplyType == 1)
                    agentPeople = model.ApplyName + "(" + model.CardNo + ")";
                mark.Text = agentPeople;
            }
            if (mark.Name == "applyaddress")
                mark.Text = division.Replace(" ", "") + model.Address;
            if (mark.Name == "postcode")
                mark.Text = model.PostCode;
            if (mark.Name == "linkman")
                mark.Text = model.ContactPerson;
            if (mark.Name == "tel")
                mark.Text = model.Phone;
            if (mark.Name == "agentgroup")
                mark.Text = systemModel.nvc_DLCNName;

            if (mark.Name == "applyno")
            {
                mark.Text = !string.IsNullOrEmpty(model.RegisteredNo) ? model.RegisteredNo : "";
            }
            if (mark.Name == "marktype")
                mark.Text = model.TrademarkType;
        }
        //doc.Range.Bookmarks["table"].Text = "";    // 清掉标示  
        string docPath = "File_Zscq/AccountPDF/TrademarkRenewalApply" + model.CaseNo + ".doc";
        doc.Save(Server.MapPath(docPath));
        return docPath;
    }
}