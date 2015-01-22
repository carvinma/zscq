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

public partial class M_E_TradeMarkRenewalAdd : System.Web.UI.Page
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
    public string PageType = "添加续展";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            t_GoodsCategoryFees fees = goods.CategoryFees_Select_ByType(0);
            hi_MainFees.Value = fees.MainFees.Value.ToString();
            hi_ItemNum.Value = fees.ItemNum.Value.ToString();
            hi_ExceedFees.Value = fees.ExceedFees.Value.ToString();
        }
        // Bind_Page_Type();
    }
    public void Bind_Page_Type()// 绑定页面信息
    {
        if (!string.IsNullOrEmpty(hi_TradeMarkId.Value))
        {
            int trademarkId = int.Parse(hi_TradeMarkId.Value);
            Bind_Admin_Status(trademarkId);
        }
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


    private t_NewTradeMarkInfo InitModel()
    {
        string filePath = "File_Zscq/File_ShangBiao/";
        if (!System.IO.Directory.Exists(Server.MapPath("../../" + filePath)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath("../../" + filePath));
        }
        t_NewTradeMarkInfo model = new t_NewTradeMarkInfo();
        if (!string.IsNullOrEmpty(hi_TradeMarkId.Value))
        {
            model = mark.Trademark_Select_Id(int.Parse(hi_TradeMarkId.Value));
        }
        model.i_MemberId = int.Parse(Hi_MemberId.Value);
        model.ApplyName = txt_applyname.Value.Trim();
        model.ApplyType = this.RdoPeople.Checked ? 1 : 0;
        if (!string.IsNullOrEmpty(this.txt_RegNo.Value))
        {
            model.RegisteredNo = this.txt_RegNo.Value.Trim();
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
        if (!string.IsNullOrEmpty(fileName))
        {
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
        //model.CaseNo = this.lblCaseNo.Text;
        if (string.IsNullOrEmpty(hi_TradeMarkId.Value))
            model.CaseNo = caseNo.GetTodayMaxCaseNo();

        if (!string.IsNullOrEmpty(this.upSound.Value))
        {
            System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
            model.SoundFile = filePath + fileName;
        }
        model.TrademarkRemark = txt_remark.Value.Trim();
        //输入类别，不够俩位补全2位，例：2->02
        string[] trademarkTypes = sortarr.Value.Replace('，', ',').Trim().Split(',');
        string markType = trademarkTypes.Aggregate((current, next) =>
        {
            return (current.Length == 1 ? current.PadLeft(2, '0') : current) + "," +
                (next.Length == 1 ? next.PadLeft(2, '0') : next);
        });
        model.TrademarkType = markType;
        decimal money = 0;
        decimal.TryParse(hi_money.Value, out money);
        model.TrademarkMoney = money;
        var agencyModel = goods.CategoryFees_Select_ByType(3);
        model.TrademarkAgencyFee = agencyModel.MainFees * model.TrademarkType.Split(',').Length;//代理费
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
                model.TrademarkLateFee = latefeeModel.MainFees * model.TrademarkType.Split(',').Length;//滞纳金
            }
            #endregion
        }

        if (!string.IsNullOrEmpty(txt_RegNoticeDate.Value))
            model.RegNoticeDate = DateTime.Parse(txt_RegNoticeDate.Value);
        if (!string.IsNullOrEmpty(txt_RenewalDate.Value))
            model.RenewalDate = DateTime.Parse(txt_RenewalDate.Value);

        if (!string.IsNullOrEmpty(this.upRegisteCertificate.Value))
        {
            fileName = this.upRegisteCertificate.Value;//注册证书
            System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
            model.TrademarkRegBook = filePath + fileName;
        }

        fileName = this.upPattern1.Value;//图样1
        if (!string.IsNullOrEmpty(fileName))
        {
            System.IO.File.Move(HttpContext.Current.Server.MapPath("../../UploadTemp\\" + fileName),
                   HttpContext.Current.Server.MapPath("../../" + filePath + fileName));
            model.TrademarkPattern1 = filePath + fileName;
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
    protected void btOK_Click(object sender, EventArgs e)
    {
        try
        {
            var model = InitModel();
            if (model != null)
            {
                model.i_Type = 1;
                model.Status = 12;
                model.RenewalAgentBook = CreateAgentBook(model);
                model.RenewalApplyBook = CreateApplyBook(model);
                if (!string.IsNullOrEmpty(hi_TradeMarkId.Value))
                    mark.Trademark_Submit();
                else
                    mark.Trademark_Add(model);
                addRegNoticeData(model.i_Id);
                hi_TradeMarkId.Value = model.i_Id.ToString();
                if (model.RegNoticeDate.HasValue)
                {
                    t_NewTradeMarkStatusDate sdmodel = new t_NewTradeMarkStatusDate();
                    sdmodel.TradeMarkId = model.i_Id;
                    sdmodel.TradeMarkStatusId = 31;
                    sdmodel.TradeMarkDate = model.RegNoticeDate;
                    mark.trademarkStatusdateSumbit(sdmodel);
                }
                Bind_Page_Type();
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "alert1", "alert('商标续展添加成功!');", true);
                // Response.Redirect("L_M_Trademark.aspx");
            }
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "alert1", "alert('商标续展添加失败!');", true);
        }
    }

    /// <summary>
    /// 商标续展代理委托书
    /// </summary>
    private string CreateAgentBook(t_NewTradeMarkInfo model)
    {
        int proId = model.ProvinceId.HasValue ? model.ProvinceId.Value : 0;
        int cityId = model.CityId.HasValue ? model.CityId.Value : 0;
        int areaId = model.AreaId.HasValue ? model.AreaId.Value : 0;
        string division = address.Set_AddressName_PId_CId_AId(proId, cityId, areaId);

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
        doc.Save(Server.MapPath("../../" + docPath));
        return docPath;
    }
    /// <summary>
    /// 商标续展注册申请书
    /// </summary>
    private string CreateApplyBook(t_NewTradeMarkInfo model)
    {
        int proId = model.ProvinceId.HasValue ? model.ProvinceId.Value : 0;
        int cityId = model.CityId.HasValue ? model.CityId.Value : 0;
        int areaId = model.AreaId.HasValue ? model.AreaId.Value : 0;
        string division = address.Set_AddressName_PId_CId_AId(proId, cityId, areaId);

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
        doc.Save(Server.MapPath("../../" + docPath));
        return docPath;
    }

}