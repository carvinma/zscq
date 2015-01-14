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
using Aspose.Words;
using Aspose.Words.Drawing;

public partial class M_E_TradeMarkRenewal : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    dal_Address DALB = new dal_Address();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_SystemSetup DALSS = new dal_SystemSetup();
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
    private dal_Address address = new dal_Address();
    private dal_Nationality DALN = new dal_Nationality();
    private dal_DataOrder DALDO = new dal_DataOrder();
    public int goodsItemCount;
    public string ApplyUpBook = "未上传", AgentUpBook = "未上传";
    public string RenewalApplyUpBook = "未上传", RenewalAgentUpBook = "未上传";
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
            Bind_Page_Type();


            t_GoodsCategoryFees fees = goods.CategoryFees_Select_ByType(0);
            hi_MainFees.Value = fees.MainFees.Value.ToString();
            hi_ItemNum.Value = fees.ItemNum.Value.ToString();
            hi_ExceedFees.Value = fees.ExceedFees.Value.ToString();
        }
    }
    public void Bind_Page_Type()// 绑定页面信息
    {

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            int trademarkId = int.Parse(Request.QueryString["id"].ToString());
            hi_TradeMarkId.Value = trademarkId.ToString();
            Bind_Page_Info(trademarkId);
            Bind_Bills(trademarkId);
            Bind_RenewalDate(trademarkId);
            Bind_Admin_Status(trademarkId);
            Bind_Message(trademarkId);
        }

    }
    private void Bind_RenewalDate(int trademarkId)
    {
        this.RptRenewalDate.DataSource = mark.TrademarkRenewalDate_Select_TrademarkId(trademarkId);
        this.RptRenewalDate.DataBind();
    }
    private void Bind_Message(int trademarkId)
    {
        this.RptMessage.DataSource = mark.trademarkMessage_Select_id(trademarkId);
        this.RptMessage.DataBind();
    }
    public void Bind_Admin_Status(int trademarkId)
    {
        var adminstatusDate = mark.trademarkStatusdate_Select_id(trademarkId).ToList();
        var result = from a in BaseDataUtil.tradeMarkStatuslist
                     join b in adminstatusDate
                     on a.i_Id equals b.TradeMarkStatusId into temp
                     from t in temp.DefaultIfEmpty()
                     select new
                     {
                         i_Id = t == null ? 0 : t.i_Id,
                         TradeMarkStatusId = a.i_Id,
                         TradeMarkStatusValue = a.StatusValue,
                         StatusName = a.StatusName,
                         TradeMarkDate = t == null ? null : t.TradeMarkDate,
                     };
        RptAdminStatus.DataSource = result;
        RptAdminStatus.DataBind();
    }
    private void Bind_Page_Info(int trademarkId)
    {
        PageType = "修改商标";
        t_NewTradeMarkInfo model = mark.Trademark_Select_Id(trademarkId);
        if (model != null)
        {
            spStatus.InnerText = BaseDataUtil.tradeMarkRenewedStatuslist.Where(p => p.StatusValue == model.Status).First().StatusName;
            Hi_MemberId.Value = model.i_MemberId.ToString();
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
            Hi_prov.Value = model.ProvinceId.ToString();////
            Hi_city.Value = model.CityId.ToString();
            Hi_country.Value = model.AreaId.ToString();
            this.txt_address.Value = model.Address;
            this.txt_ContactPerson.Value = model.ContactPerson;
            this.txt_phone.Value = model.Phone;
            this.txt_fax.Value = model.Fax;
            this.txt_postcode.Value = model.PostCode;
            this.lblCaseNo.Text = model.CaseNo;
            this.txt_applyNum.Value = model.RegisteredNo;

            if (model.Is3D == true) Radio3DYES.Checked = true;
            else Radio3DNo.Checked = true;
            if (model.IsColor == true) rdoColorYes.Checked = true;
            else rdoColorNO.Checked = true;
            chkSound.Checked = model.IsSound == true ? true : false;
            if (model.IsSound != null && model.IsSound.Value == true)
                soundfiles.Visible = true;
            if (!string.IsNullOrEmpty(model.SoundFile))
            {
                upSound.Value = model.SoundFile;
                spWav.Visible = true;
            }
            txt_remark.Value = model.TrademarkRemark;
            sortarr.Value = model.TrademarkType;
            sortGoods.Value = model.TrademarkGoods;
            hi_money.Value = model.TrademarkMoney.ToString();
            t_SBmiaosu.Value= model.TrademarkDescribe;
            //
            if (!string.IsNullOrEmpty(model.TrademarkPattern1))
            {
                Image1.ImageUrl = "../../" + model.TrademarkPattern1;
                upPattern1.Value = model.TrademarkPattern1;
            }
            if (!string.IsNullOrEmpty(model.TrademarkPattern2))
            {
                Image2.ImageUrl = "../../" + model.TrademarkPattern2;
                upPattern2.Value = model.TrademarkPattern2;
            }
            if (!string.IsNullOrEmpty(model.TrademarkType) && !string.IsNullOrEmpty(model.TrademarkGoods))
            {
                //根据商品ID查找商品的信息
                string[] goodIds = model.TrademarkGoods.Split(',');
                var result = goods.Goods_Select_MultipleId(goodIds);
                if (result != null && result.Count() > 0)
                {
                    goodsItemCount = result.Count();
                    this.Rpt_goods.DataSource = result;
                    this.Rpt_goods.DataBind();
                }
            }
            cb_Show.Checked = model.IsShow == true ? true : false;
            cb_ReceiveEmail.Checked = model.IsReceiveEmail == true ? true : false;
            if (!string.IsNullOrEmpty(model.ApplyUpBook))
            {
                ApplyUpBook = "<a href='" + model.ApplyUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
            }
            if (!string.IsNullOrEmpty(model.AgentUpBook))
            {
                AgentUpBook = "<a href='" + model.AgentUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
            }
            if (!string.IsNullOrEmpty(model.RenewalApplyUpBook))
            {
                RenewalApplyUpBook = "<a href='" + model.RenewalApplyUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
            }
            if (!string.IsNullOrEmpty(model.RenewalAgentUpBook))
            {
                RenewalAgentUpBook = "<a href='" + model.RenewalAgentUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
            }

            if (model.ApplyDate.HasValue)
                spApplydate.InnerText = model.ApplyDate.Value.ToString("yyyy-MM-dd");
            if (model.PublicPreliminaryDate.HasValue)
                spPublicPreliminaryDate.InnerText = model.PublicPreliminaryDate.Value.ToString("yyyy-MM-dd");
            if (model.RegNoticeDate.HasValue)
                txt_RegNoticeDate.Value = model.RegNoticeDate.Value.ToString("yyyy-MM-dd");
            if (model.RenewalDate.HasValue)
            {
                spRenewalDate.Text = model.RenewalDate.Value.ToString("yyyy-MM-dd");
                hi_RenewalDate.Value = model.RenewalDate.Value.ToString("yyyy-MM-dd");
            }
            if (model.RestDays.HasValue)
                spRestDays.InnerText = model.RestDays.Value.ToString();

            hd_userId.Value = model.i_MemberId.ToString();
            t_Member mm = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
            if (mm != null)
            {
                // txt_MemberId.Value = mm.nvc_UserNum.ToString();
            }
        }
    }

    private void Bind_Bills(int did)
    {
        int Ccount = 0;
        reptlist.DataSource = DALDO.DataOrder_SelectPage(1, 10000, did, 3, "", "", ref Ccount);
        reptlist.DataBind();
    }

    private t_NewTradeMarkInfo InitModel()
    {
        string filePath = "File_Zscq/File_ShangBiao/";
        if (!System.IO.Directory.Exists(Server.MapPath("../../" + filePath)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath("../../" + filePath));
        }
        t_NewTradeMarkInfo model = mark.Trademark_Select_Id(int.Parse(hi_TradeMarkId.Value));
        model.ApplyName = txt_applyname.Value.Trim();
        model.ApplyType = this.RdoPeople.Checked ? 1 : 0;
        if (!string.IsNullOrEmpty(this.txt_applyNum.Value))
        {
            model.RegisteredNo = this.txt_applyNum.Value.Trim();
        }
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
                System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
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
            System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                    HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
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
        //model.CaseNo = this.lblCaseNo.Text; 
        model.Is3D = Radio3DNo.Checked ? false : true;
        model.IsColor = rdoColorNO.Checked ? false : true;
        model.IsSound = chkSound.Checked ? true : false;
        if (!string.IsNullOrEmpty(this.upSound.Value))
        {
            fileName = this.upSound.Value;//声音
            if (fileName.Contains("File_ShangBiao"))
            {
                model.SoundFile = fileName;
            }
            else
            {
                System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                       HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
                model.SoundFile = filePath + fileName;
            }
        }
        model.TrademarkRemark = txt_remark.Value.Trim();
        model.TrademarkType = sortarr.Value.Trim();
        model.TrademarkGoods = sortGoods.Value.Trim();
        decimal money = 0;
        decimal.TryParse(hi_money.Value, out money);
        model.TrademarkMoney = money;
        var agencyModel = goods.CategoryFees_Select_ByType(2);
        model.TrademarkAgencyFee = agencyModel.MainFees * model.TrademarkType.Split(',').Length;//代理费
        model.TrademarkLateFee = 0;//滞纳金
        if (!string.IsNullOrEmpty(txt_RegNoticeDate.Value))
            model.RegNoticeDate = DateTime.Parse(txt_RegNoticeDate.Value.Trim());
        if (!string.IsNullOrEmpty(hi_RenewalDate.Value))
        {
            model.RenewalDate = DateTime.Parse(hi_RenewalDate.Value);
            TimeSpan ts = DateTime.Parse(hi_RenewalDate.Value) - DateTime.Today;
            model.RestDays = ts.Days; //剩于天数
            #region 计算滞纳金
            if (ts.Days <= 0)
            {
                var latefeeModel = goods.CategoryFees_Select_ByType(4);
                model.TrademarkLateFee = latefeeModel.MainFees * model.TrademarkType.Split(',').Length;
            }
            #endregion
        }
        fileName = this.upPattern1.Value;//图样1
        if (fileName.Contains("File_ShangBiao"))
        {
            model.TrademarkPattern1 = fileName;
        }
        else
        {
            System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
            model.TrademarkPattern1 = filePath + fileName;
        }


        if (!string.IsNullOrEmpty(this.upPattern2.Value))
        {
            fileName = this.upPattern2.Value;//图样2
            if (fileName.Contains("File_ShangBiao"))
            {
                model.TrademarkPattern2 = fileName;
            }
            else
            {
                System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                       HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
                model.TrademarkPattern2 = filePath + fileName;
            }
        }

        int type = 0;
        if (this.RadioButton2.Checked) type = 1;
        else if (this.RadioButton3.Checked) type = 2;
        model.TrademarkDescribeType = type;
        model.TrademarkDescribe = t_SBmiaosu.Value.Trim();

        model.IsShow = cb_Show.Checked ? true : false;
        model.IsReceiveEmail = cb_ReceiveEmail.Checked ? true : false;
        model.Remark = t_Remark.Text.Trim();
        
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
    private void InitPaymodel(int id)
    {
        try
        {
            t_DataOrder model = new t_DataOrder();
            string data = HI_ATT.Value;

            int Id = id;
            if (data != "")
            {
                string[] liststr = data.Split('|');
                for (int i = 0; i < liststr.Length - 1; i++)
                {
                    string[] lname = liststr[i].Split('_');
                    if (lname[0].ToString() != "")
                    {
                        model.i_OrderType = 2;//商标
                        model.i_DataId = Id;//商标id
                        model.nvc_OrderNum = lname[0].ToString();
                        if (lname[1].ToString() != "")
                        {
                            model.dt_AddOrderTime = DateTime.Parse(lname[1].ToString());
                        }
                        if (lname[2].ToString() != "")
                        {
                            model.dt_ShouKuanTime = DateTime.Parse(lname[2].ToString());
                        }
                        if (lname[3].ToString() != "")
                        {
                            model.dt_JiaoFeiTime = DateTime.Parse(lname[3].ToString());
                        }
                        if (lname[4].ToString() != "")
                        {
                            model.dt_SendInfoTime = DateTime.Parse(lname[4].ToString());
                        }
                        if (lname[5].ToString() != "")
                        {
                            model.dt_KaiJuTime = DateTime.Parse(lname[5].ToString());
                        }
                        model.nvc_Info1 = lname[6].ToString();
                        model.nvc_Info2 = lname[7].ToString();
                        model.dt_Addtime = DateTime.Now;
                        dal_DataOrder DALDO = new dal_DataOrder();
                        int ss = DALDO.DataOrder_Add(model);
                        //Response.Redirect(Request.Url.ToString());
                    }
                }
            }
        }
        catch { }
    }
    protected void btOK_Click(object sender, EventArgs e)
    {
        var model = InitModel();
        if (model != null)
        {
            model.i_Type = 1;
            model.AgentBook = CreateAgentBook(model);
            model.ApplyBook = CreateApplyBook(model);
            if(model.RestDays>90)
                model.Status = 2;
            else if (model.RestDays <= 90 && model.RestDays >=61)
                model.Status = 3;
            else if (model.RestDays <= 60 && model.RestDays >= 31)
                model.Status = 4;
            else if (model.RestDays <= 30 && model.RestDays >= 16)
                model.Status = 5;
            else if (model.RestDays <= 15 && model.RestDays >=0)
                model.Status = 6;
            else if (model.RestDays < 0)
                model.Status = 7;
            else if (model.RestDays < 0&&model.RestDays>=-30)
                model.Status = 8;
            else if (model.RestDays <-30&&model.RestDays>=-150)
                model.Status = 8;

            mark.Trademark_Submit();
            addRegNoticeData(model.i_Id);
            InitPaymodel(model.i_Id);
            hi_TradeMarkId.Value = model.i_Id.ToString();
            Response.Redirect("L_M_Trademark.aspx");
        }
    }

    #region 生成书
    /// <summary>
    /// 商标申请代理委托书
    /// </summary>
    private string CreateAgentBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = Server.MapPath("../../File_Zscq/template/BookTrademarkRenewalAgent.doc");
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
                        System.IO.FileInfo file = new System.IO.FileInfo(HttpContext.Current.Server.MapPath("../../"+model.TrademarkPattern1));
                        if (file.Exists)
                        {
                            builder.MoveToBookmark("pattern");
                            builder.InsertImage(HttpContext.Current.Server.MapPath("../../"+model.TrademarkPattern1), 40, 20);
                        }
                    }
                }
                if (!string.IsNullOrEmpty(value))
                {
                    shape.AppendChild(new Paragraph(doc));
                    Paragraph para = shape.FirstParagraph;
                    para.ParagraphFormat.Alignment = ParagraphAlignment.Center;

                    Run run = new Run(doc);
                    run.Text = value;
                    run.Font.Name = "宋体";
                    run.Font.Size = 12;
                    para.AppendChild(run);
                }
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
        string docPath = "File_Zscq/AccountPDF/TrademarkRenewalAgent" + model.CaseNo + ".doc";
        doc.Save(Server.MapPath("../../"+docPath));
        return docPath;
    }
    /// <summary>
    /// 商标注册申请书
    /// </summary>
    private string CreateApplyBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = Server.MapPath("../../File_Zscq/template/BookTrademarkRenewalApply.doc");
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
        doc.Save(Server.MapPath("../../"+docPath));
        return docPath;
    }

    #endregion

    //帐单提交数据
    protected void btnBill_Click(object sender, EventArgs e)
    {
        try
        {
            t_DataOrder model = new t_DataOrder();
            string data = HI_ATT.Value;
            if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
            {
                int Id = int.Parse(Request.QueryString["id"].ToString());
                if (!string.IsNullOrEmpty(data))
                {
                    string[] liststr = data.Split('|');
                    for (int i = 0; i < liststr.Length - 1; i++)
                    {
                        string[] lname = liststr[i].Split('_');
                        if (lname[0].ToString() != "")
                        {
                            model.i_OrderType = 2;//2对应的是商标 订单  1 对应的是专利订单
                            model.i_DataId = Id;//商标id
                            model.nvc_OrderNum = lname[0].ToString();
                            if (lname[1].ToString() != "")
                            {
                                model.dt_AddOrderTime = DateTime.Parse(lname[1].ToString());
                            }
                            if (lname[2].ToString() != "")
                            {
                                model.dt_ShouKuanTime = DateTime.Parse(lname[2].ToString());
                            }
                            if (lname[3].ToString() != "")
                            {
                                model.dt_JiaoFeiTime = DateTime.Parse(lname[3].ToString());
                            }
                            if (lname[4].ToString() != "")
                            {
                                model.dt_SendInfoTime = DateTime.Parse(lname[4].ToString());
                            }
                            if (lname[5].ToString() != "")
                            {
                                model.dt_KaiJuTime = DateTime.Parse(lname[5].ToString());
                            }
                            model.nvc_Info1 = lname[6].ToString();
                            model.nvc_Info2 = lname[7].ToString();
                            model.dt_Addtime = DateTime.Now;
                            int ss = DALDO.DataOrder_Add(model);
                            Response.Redirect(Request.Url.ToString());
                        }
                    }
                }
            }
        }
        catch { }
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALDO.DataOrder_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "商标账单管理", "删除商标账单");
        }

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            int Id = int.Parse(Request.QueryString["id"].ToString());
            Bind_Bills(Id);
        }
        HiddenDel.Value = "del";
    }
}