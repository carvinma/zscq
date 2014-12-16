<%@ WebHandler Language="C#" Class="M_A_TradeMark" %>

using System;
using System.Web;
using System.Linq;
using zscq.Model;
using zscq.DAL;

public class M_A_TradeMark : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        if (context.Request["flag"] != null && context.Request["flag"].ToString() != "")
        {
            string flagtype = context.Request["flag"].ToString();
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
                        if (!string.IsNullOrEmpty(dtime))
                        {
                            if (tradeMarkStatusValue == 0)//商标注册待审中 X年X月X日 →商标申请日
                            {
                                var find = mark.Trademark_Select_Id(tradeMarkId);
                                find.ApplyDate = DateTime.Parse(dtime);
                                mark.Trademark_Submit();
                            }
                            else if (tradeMarkStatusValue == 1)//初步审定 X年X月X日 →初审公告日
                            {
                                var find = mark.Trademark_Select_Id(tradeMarkId);
                                find.PublicPreliminaryDate = DateTime.Parse(dtime);
                                mark.Trademark_Submit();
                            }
                            else if (tradeMarkStatusValue == 4)//已注册 X年X月X日 →注册公告日 当状态为“已注册”时，此案件自动转到商标续展列表中，不在商标申请列表中显示
                            {
                                var find = mark.Trademark_Select_Id(tradeMarkId);
                                find.RegNoticeDate = DateTime.Parse(dtime);
                                find.i_Type = 1;//此案件自动转到商标续展列表中
                                find.Status = 2;//距续展期限大于90天  当“商标状态”中产生已注册后
                                //find.RenewalDate=
                                //find.RestDays=
                                mark.Trademark_Submit();
                            }
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