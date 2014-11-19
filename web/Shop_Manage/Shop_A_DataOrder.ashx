<%@ WebHandler Language="C#" Class="Shop_A_DataOrder" %>

using System;
using System.Web;
using System.Linq;
using zscq.Model;
using zscq.DAL;

public class Shop_A_DataOrder : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        if (context.Request["flag"] != null && context.Request["flag"].ToString() != "")
        {
            string flagtype = context.Request["flag"].ToString();
            if (flagtype == "dataOrder")//添加商标账单
            {
                try
                {
                    dal_DataOrder DALDO = new dal_DataOrder();

                    int id = Convert.ToInt32(context.Request["id"]);
                    string name = context.Request["data"].ToString();
                    t_DataOrder model = DALDO.DataOrder_Select_Id(id);
                    string[] list = name.Split('|');
                    string numstr = list[0].ToString();
                    t_DataOrder model1= DALDO.DataOrder_Select_num(numstr,2,id);
                    if (model1 == null)
                    {
                        model.nvc_OrderNum = list[0].ToString();
                        model.dt_AddOrderTime = DateTime.Parse(list[1].ToString());
                        model.dt_ShouKuanTime = DateTime.Parse(list[2].ToString());
                        model.dt_JiaoFeiTime = DateTime.Parse(list[3].ToString());
                        model.dt_SendInfoTime = DateTime.Parse(list[4].ToString());
                        model.dt_KaiJuTime = DateTime.Parse(list[5].ToString());
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
                    else
                    {
                        context.Response.Write("0");//重复编号
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
                    t_DataOrder model1 = DALDO.DataOrder_Select_num(name,2);
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
                catch( Exception ex)
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
    public bool IsReusable {
        get {
            return false;
        }
    }

}