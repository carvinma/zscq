<%@ WebHandler Language="C#" Class="M_A_TradeMark" %>

using System;
using System.Web;
using System.Linq;
using zscq.Model;
using zscq.DAL;
using Aspose.Words;

public class M_A_TradeMark : IHttpHandler
{
    #region 
    private dal_Address address = new dal_Address();
    /// <summary>
    /// 商标续展代理委托书
    /// </summary>
    private string CreateAgentBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = HttpContext.Current.Server.MapPath("../../File_Zscq/template/BookTrademarkRenewalAgent.doc");
        Aspose.Words.Document doc = new Aspose.Words.Document(tmppath); //载入模板 
        Aspose.Words.DocumentBuilder builder = new Aspose.Words.DocumentBuilder(doc);

        Aspose.Words.NodeCollection shapeCollection = doc.GetChildNodes(Aspose.Words.NodeType.Shape, true);

        // Since we will be adding/removing nodes, it is better to copy all collection
        // into a fixed size array, otherwise iterator will be invalidated.
        Aspose.Words.Node[] shapes = shapeCollection.ToArray();

        int k = 0;
        foreach (Aspose.Words.Drawing.Shape shape in shapes)
        {
            if (shape.ShapeType.Equals(Aspose.Words.Drawing.ShapeType.TextBox))//委托人 //商标
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
                }
                shape.AppendChild(new Aspose.Words.Paragraph(doc));
                Aspose.Words.Paragraph para = shape.FirstParagraph;
                para.ParagraphFormat.Alignment = Aspose.Words.ParagraphAlignment.Center;

                Aspose.Words.Run run = new Aspose.Words.Run(doc);
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
        string docPath = "File_Zscq/AccountPDF/TrademarkRenewalAgent" + model.CaseNo + ".doc";
        doc.Save(HttpContext.Current.Server.MapPath("../../"+docPath));
        return docPath;
    }
    /// <summary>
    /// 商标续展注册申请书
    /// </summary>
    private string CreateApplyBook(t_NewTradeMarkInfo model)
    {
        string division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);

        string tmppath = HttpContext.Current.Server.MapPath("../../File_Zscq/template/BookTrademarkRenewalApply.doc");
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
        string docPath = "File_Zscq/AccountPDF/TrademarkRenewalApply" + model.CaseNo + ".doc";
        doc.Save(HttpContext.Current.Server.MapPath("../../"+docPath));
        return docPath;
    }
    #endregion
    
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        if (context.Request["flag"] != null && context.Request["flag"].ToString() != "")
        {
            string flagtype = context.Request["flag"].ToString();
            if (flagtype == "addSBmsg")//增加商标留言
            {
                try
                {
                    int tradeMarkId = int.Parse(context.Request["TradeMarkId"].ToString());
                    string message =context.Request["message"].ToString();
                    if (!string.IsNullOrEmpty(message))
                    {
                        dal_NewTrademark mark = new dal_NewTrademark();
                        t_NewTradeMarkMessage Model = new t_NewTradeMarkMessage();
                        Model.TradeMarkId = tradeMarkId;
                        Model.AddTime = DateTime.Today;
                        Model.Message = message.Trim();
                        mark.trademarkMessage_Add(Model);
                        context.Response.Write(Model.i_Id + "|" + DateTime.Today.ToString("yyyy-MM-dd"));
                    }
                }
                catch
                {
                    context.Response.Write("no");
                }
            }
            if (flagtype == "delSBmsg") //删除商标留言
            {
                try
                {
                    int messageid = int.Parse(context.Request["messageid"].ToString());
                    dal_NewTrademark mark = new dal_NewTrademark();
                    mark.trademarkMessage_Del(messageid);
                    context.Response.Write("ok");
                }
                catch
                {
                    context.Response.Write("no");
                }
            }
            if (flagtype == "adminstatusDate")//商标状态日期
            {
                try
                {
                    dal_NewTrademark mark = new dal_NewTrademark();
                    int tradeMarkId = int.Parse(context.Request["TradeMarkId"].ToString());
                    int tradeMarkStatusId = int.Parse(context.Request["TradeMarkStatusId"].ToString());
                    int tradeMarkStatusValue = int.Parse(context.Request["TradeMarkStatusValue"].ToString());
                    string dtime = context.Request["data"].ToString();


                    t_NewTradeMarkStatusDate model = new t_NewTradeMarkStatusDate();

                    model.TradeMarkId = tradeMarkId;
                    model.TradeMarkStatusId = tradeMarkStatusId;
                    if (!string.IsNullOrEmpty(dtime))
                        model.TradeMarkDate = DateTime.Parse(dtime);

                    if (mark.trademarkStatusdateSumbit(model) > 0)
                    {
                        if (!string.IsNullOrEmpty(dtime) && tradeMarkStatusValue>=0)
                        {
                            var find = mark.Trademark_Select_Id(tradeMarkId);
                            find.AdminStatus = tradeMarkStatusValue;
                            if (tradeMarkStatusValue == 0)//商标注册待审中 X年X月X日 →商标申请日
                            {
                                find.ApplyDate = DateTime.Parse(dtime);
                            }
                            else if (tradeMarkStatusValue == 1)//初步审定 X年X月X日 →初审公告日
                            {
                                find.PublicPreliminaryDate = DateTime.Parse(dtime);
                            }
                            else if (tradeMarkStatusValue == 4)//已注册 X年X月X日 →注册公告日 当状态为“已注册”时，此案件自动转到商标续展列表中，不在商标申请列表中显示
                            {
                                find.RegNoticeDate = DateTime.Parse(dtime);
                                find.i_Type = 1;//此案件自动转到商标续展列表中
                                find.Status = 2;//距续展期限大于90天  当“商标状态”中产生已注册后
                                if (find.RenewalDate.HasValue)
                                {
                                    find.RenewalDate = find.RenewalDate.Value.AddYears(10);
                                }
                                else
                                {
                                    find.RenewalDate = find.RegNoticeDate.Value.AddYears(10).AddDays(-1);
                                }
                                TimeSpan ts = find.RenewalDate.Value - DateTime.Today;
                                find.RestDays = ts.Days; //剩于天数
                                find.RenewalAgentBook = CreateAgentBook(find);
                                find.RenewalApplyBook = CreateApplyBook(find);
                                #region 计算费用
                                dal_Goods goods = new dal_Goods();
                                var goodsModels = goods.CategoryFees_Select_All();
                                var mainModel = goodsModels.First(p => p.i_Type == 1);
                                find.TrademarkMoney =mainModel.MainFees* find.TrademarkType.Split(',').Length; //费用
                                var agencyModel = goodsModels.First(p => p.i_Type == 3);
                                find.TrademarkAgencyFee = agencyModel.MainFees * find.TrademarkType.Split(',').Length;//代理费
                                find.TrademarkLateFee = 0;//滞纳金

                                    #region 计算滞纳金
                                    if (ts.Days <= 0)
                                    {
                                        var latefeeModel = goodsModels.First(p => p.i_Type == 4);
                                        find.TrademarkLateFee = latefeeModel.MainFees * find.TrademarkType.Split(',').Length;
                                    }
                                    #endregion
                                #endregion

                                System.Collections.Generic.List<t_NewTradeMarkRenewalInfo> list = new System.Collections.Generic.List<t_NewTradeMarkRenewalInfo>();
                                t_NewTradeMarkRenewalInfo renewalModel = new t_NewTradeMarkRenewalInfo();
                                renewalModel.TradeMarkId = tradeMarkId;
                                renewalModel.RenewalDate = find.RenewalDate;
                                renewalModel.IsFinish = false;
                                list.Add(renewalModel);
                                mark.TrademarkRenewalDate_Add(list, tradeMarkId);
                                
                            }
                            mark.Trademark_Submit();
                        }
                        context.Response.Write("ok");
                    }
                    else
                    {
                        context.Response.Write("no");
                    }
                }

                catch { }
            }

            if (flagtype == "SbDataNum")//检测商标账单
            {
                try
                {
                    dal_DataOrder DALDO = new dal_DataOrder();
                    string name = context.Request["data"].ToString();
                    t_DataOrder model1 = DALDO.DataOrder_Select_num(name, 2);
                    if (model1 != null)
                    {
                        context.Response.Write("0");//重复编号
                    }
                }
                catch { }
            }
            if (flagtype == "PatentOrder")//添加专利订单
            {
                try
                {
                    dal_DataOrder DALDO = new dal_DataOrder();

                    int id = Convert.ToInt32(context.Request["id"]);
                    string name = context.Request["data"].ToString();
                    t_DataOrder model = DALDO.DataOrder_Select_Id(id);
                    string[] list = name.Split('|');

                    model.nvc_OrderNum = list[0].ToString();
                    if (list[1].ToString() != "")
                    {
                        model.dt_AddOrderTime = DateTime.Parse(list[1].ToString());
                    }
                    if (list[2].ToString() != "")
                    {
                        model.dt_ShouKuanTime = DateTime.Parse(list[2].ToString());
                    }
                    if (list[3].ToString() != "")
                    {
                        model.dt_JiaoFeiTime = DateTime.Parse(list[3].ToString());
                    }
                    if (list[4].ToString() != "")
                    {
                        model.dt_SendInfoTime = DateTime.Parse(list[4].ToString());
                    }
                    if (list[5].ToString() != "")
                    {
                        model.dt_KaiJuTime = DateTime.Parse(list[5].ToString());
                    }
                    model.nvc_Info1 = list[6].ToString();
                    model.nvc_Info2 = list[7].ToString();
                    model.dt_Addtime = DateTime.Now;
                    //DALDO.DataOrder_Add(model);
                    if (DALDO.DataOrder_Update(model) > 0)
                    {
                        context.Response.Write("ok");
                    }
                    else
                    {
                        context.Response.Write("no");
                    }
                }
                catch (Exception ex)
                {
                    context.Response.Write(ex.Message);
                }
            }
            if (flagtype == "ZLDataNum")//检测专利账单
            {
                try
                {
                    dal_DataOrder DALDO = new dal_DataOrder();

                    int id = Convert.ToInt32(context.Request["id"]);
                    string name = context.Request["data"].ToString();
                    t_DataOrder model1 = DALDO.DataOrder_Select_num(name);
                    if (model1 != null)
                    {
                        context.Response.Write("0");//重复编号
                    }
                }
                catch { }
            }
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}