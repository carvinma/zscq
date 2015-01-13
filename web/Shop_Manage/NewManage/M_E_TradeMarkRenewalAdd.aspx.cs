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
        if (string.IsNullOrEmpty(hi_TradeMarkId.Value))
            model.CaseNo = caseNo.GetTodayMaxCaseNo();
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

    protected void btOK_Click(object sender, EventArgs e)
    {
        var model = InitModel();
        if (model != null)
        {
            model.i_Type = 0;
            model.Status = 0;
            model.AgentBook = CreateAgentBook(model);
            model.ApplyBook = CreateApplyBook(model);
            if (!string.IsNullOrEmpty(hi_TradeMarkId.Value))
                mark.Trademark_Submit();
            else
                mark.Trademark_Add(model);
            hi_TradeMarkId.Value = model.i_Id.ToString();
            Bind_Page_Type();
           // Response.Redirect("L_M_Trademark.aspx");
        }
    }

    #region 生成书
    /// <summary>
    /// 商标申请代理委托书
    /// </summary>
    private string CreateAgentBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = Server.MapPath("../../File_Zscq/template/BookTrademarkAgent.doc");
        Document doc = new Document(tmppath); //载入模板 
        DocumentBuilder builder = new DocumentBuilder(doc);

        NodeCollection shapeCollection = doc.GetChildNodes(NodeType.Shape, true);

        Node[] shapes = shapeCollection.ToArray();

        foreach (Shape shape in shapes)
        {
            if (shape.ShapeType.Equals(ShapeType.TextBox))//委托人
            {
                string agentPeople = model.ApplyName;
                if (model.ApplyType == 1)
                    agentPeople = model.ApplyName + "(" + model.CardNo + ")";

                shape.AppendChild(new Paragraph(doc));
                Paragraph para = shape.FirstParagraph;
                para.ParagraphFormat.Alignment = ParagraphAlignment.Center;

                Run run = new Run(doc);
                run.Text = agentPeople;
                run.Font.Name = "宋体";
                run.Font.Size = 12;
                para.AppendChild(run);
                break;
            }
        }
        foreach (Aspose.Words.Bookmark mark in doc.Range.Bookmarks)
        {
            if (mark.Name == "client")
            {
                //string agentPeople = model.ApplyName;
                //if (model.ApplyType == 1)
                //    agentPeople = model.ApplyName + "("+model.CardNo+")";
                //mark.Text = agentPeople.PadRight(38,' ');
            }
            if (mark.Name == "pattern")
            {
                builder.MoveToBookmark("pattern");
                builder.InsertImage(Server.MapPath("../../" + model.TrademarkPattern1), 40, 20);
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

        string docPath = "../../File_Zscq/AccountPDF/TrademarkAgent" + model.CaseNo + ".doc";
        doc.Save(Server.MapPath(docPath));
        return docPath;
    }
    /// <summary>
    /// 商标注册申请书
    /// </summary>
    private string CreateApplyBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = Server.MapPath("../../File_Zscq/template/BookTrademarkApply.doc");
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
            if (mark.Name == "applynationality")
            {
                t_Nationality na = DALN.Nationality_Select_ByMemberId(model.i_MemberId);
                if (na != null)
                    mark.Text = na.nvc_Name;
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
            if (mark.Name == "is3D")
            {
                if (model.Is3D == null || !model.Is3D.Value)
                    mark.Text = "  ";
            }
            if (mark.Name == "isColor")
            {
                if (model.IsColor == null || !model.IsColor.Value)
                    mark.Text = "  ";
            }
            if (mark.Name == "isSound")
            {
                if (model.IsSound == null || !model.IsSound.Value)
                    mark.Text = "  ";
            }
            if (mark.Name == "applyno")
            {
                mark.Text = !string.IsNullOrEmpty(model.RegisteredNo) ? model.RegisteredNo : "";
            }
            if (mark.Name == "image")
            {
                builder.MoveToBookmark("image");
                builder.InsertImage(Server.MapPath("../../" + model.TrademarkPattern1), 283, 280);
            }
            if (mark.Name == "remark")
                mark.Text = model.TrademarkRemark;
        }
        builder.MoveToBookmark("marktype");
        IQueryable<t_GoodsSearch> find = goods.Goods_Select_MultipleId(model.TrademarkGoods.Split(','));
        foreach (string type in model.TrademarkType.Split(','))
        {
            builder.InsertBreak(BreakType.LineBreak);
            builder.Writeln("类别：" + type);
            var q = find.Where(p => p.MainCategoryCode == type)
                .Select(p => p.GoodsRemark).ToArray().Aggregate((current, next) => String.Format("{0}、{1}", current, next));
            builder.Writeln("商品/服务项目：" + q + " 截止");

        }

        //doc.Range.Bookmarks["table"].Text = "";    // 清掉标示  
        string docPath = "../../File_Zscq/AccountPDF/TrademarkApply" + model.CaseNo + ".doc";
        doc.Save(Server.MapPath(docPath));
        return docPath;
    }

    #endregion

}