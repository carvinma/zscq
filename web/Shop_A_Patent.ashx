<%@ WebHandler Language="C#" Class="Shop_A_Patent" %>

using System;
using System.Web;
using System.Linq;
using zscq.DAL;
using zscq.Model;

public class Shop_A_Patent : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataMemberDataContext dmdc = new DataMemberDataContext();
        if (context.Request["flag"] != null && context.Request["flag"].ToString() != "")
        {
            string flagtype = context.Request["flag"].ToString();
            flagtype = flagtype.ToLower();
            switch (flagtype)
            {
                #region 专利年次设置
                case "patentyear":
                    int id = Convert.ToInt32(context.Request["id"]);
                    string name = context.Request["Txt_Name"].ToString();
                    int order = Convert.ToInt32(context.Request["Txt_OrderBys"]);
                    dal_PatentYear DALPY = new dal_PatentYear();
                    t_PatentYear model = DALPY.PatentYear_Select_Id(id);
                    model.nvc_Year = name;
                    model.i_OrderBy = order;
                    DALPY.PatentYear_Update(model);
                    context.Response.Write("ok");
                    ; break;
                #endregion
                #region 各国专利费用设置
                case "patentfee":
                    int FeeType = Convert.ToInt32(context.Request["FeeType"]);
                    string HFID = context.Request["HFID"].ToString();
                    string SetFee = context.Request["SetFee"].ToString();
                    string ShouXuFee = context.Request["ShouXuFee"].ToString();
                    string AgentServiceFee = context.Request["AgentServiceFee"].ToString();
                    string ZhiNaJin = context.Request["ZhiNaJin"].ToString();
                    string ChaoXiangFee = context.Request["ChaoXiangFee"].ToString();
                    string TotalFee = context.Request["TotalFee"].ToString();
                    dal_PatentFee DALPF = new dal_PatentFee();
                    for (int i = 0; i < SetFee.Split('-').Length - 1; i++)
                    {
                        int ID = Convert.ToInt32(HFID.Split('-')[i]);
                        t_PatentFee modelfee = DALPF.PatentFee_Select_Id(ID);
                        modelfee.dm_SetFee = Convert.ToDecimal(SetFee.Split('-')[i]);
                        modelfee.dm_ChaoXiangFee = Convert.ToDecimal(ChaoXiangFee.Split('-')[i]);
                        modelfee.nvc_ZhiNaJin = ZhiNaJin.Split('|')[i];
                        switch (FeeType)
                        {
                            case 0:
                                modelfee.dm_ShouXuFee = Convert.ToDecimal(ShouXuFee.Split('-')[i]);
                                modelfee.dm_AgentServiceFee = Convert.ToDecimal(AgentServiceFee.Split('-')[i]);
                                modelfee.dm_TotalFee = Convert.ToDecimal(TotalFee.Split('-')[i]);
                                ; break;
                            case 1:
                                modelfee.dm_ShouXuFee1 = Convert.ToDecimal(ShouXuFee.Split('-')[i]);
                                modelfee.dm_AgentServiceFee1 = Convert.ToDecimal(AgentServiceFee.Split('-')[i]);
                                modelfee.dm_TotalFee1 = Convert.ToDecimal(TotalFee.Split('-')[i]);
                                ; break;
                            case 2:
                                modelfee.dm_ShouXuFee2 = Convert.ToDecimal(ShouXuFee.Split('-')[i]);
                                modelfee.dm_AgentServiceFee2 = Convert.ToDecimal(AgentServiceFee.Split('-')[i]);
                                modelfee.dm_TotalFee2 = Convert.ToDecimal(TotalFee.Split('-')[i]);
                                ; break;
                        }
                        DALPF.PatentFee_Update(modelfee);
                    }
                    context.Response.Write("ok");
                    break;
                #endregion
                #region 判断是否有改会员
                case "user":
                    string usermember = context.Request["member"].ToString();
                    var m = from r in dmdc.t_Member where r.nvc_UserNum == usermember select r;
                    if (m.Count() <= 0)
                    {
                        context.Response.Write("no");
                    }
                    ; break;
                #endregion
                #region 判断专利号是否存在
                case "zl_num":
                    string hao = context.Request["zl_num"].ToString();
                    IQueryable<t_Patent> zlh = from r in dzdc.t_Patent where r.nvc_Number == hao select r;
                    if (context.Request["zl_num_id"] != null
                        && context.Request["zl_num_id"].ToString() != ""
                        && context.Request["zl_num_id"].ToString() != "0")
                    {
                        int zl_id = Convert.ToInt32(context.Request["zl_num_id"]);
                        zlh = from r in zlh where r.i_Id != zl_id select r;
                    }
                    if (zlh.Count() <= 0)
                    {
                        context.Response.Write("no");
                    }
                    ; break;
                #endregion
                #region 判断是否有要求项
                case "yaoqiuxiang":
                    int pTid = int.Parse(context.Request["patentTypeId"].ToString());
                    string yqx = "";
                    var pt = from r1 in dzdc.t_PatentType where r1.i_Id == pTid select r1;
                    foreach (var r1 in pt)
                    {
                        yqx = r1.i_QuanLiYaoQiu + ";" + r1.i_YouXiaoQiStart + ";" + r1.i_paymentFirstYear;
                    }
                    context.Response.Write(yqx);
                    ; break;
                #endregion
                #region 申请日
                case "shenqingri":
                    int zlID = int.Parse(context.Request["Pid"].ToString());
                    string sqR = context.Request["sqr"].ToString();
                    var bb = from r1 in dzdc.t_PatentType where r1.i_Id == zlID select r1;
                    string sq_year = "";
                    string sq_qs = "";
                    string sq_date = "";
                    foreach (var r1 in bb)
                    {
                        if (r1.i_YouXiaoQiStart == 0)//有效期起始日==申请日
                        {
                            sq_year = r1.i_YouXiaoQi.ToString();
                            sq_qs = sqR;
                            sq_date = Convert.ToDateTime(sqR).AddYears(r1.i_YouXiaoQi).ToShortDateString();
                        }
                    }
                    string str_1 = string.Format("{{ sq_year:'{0}', sq_qs:'{1}', sq_date:'{2}'}}", sq_year, sq_qs, sq_date);
                    context.Response.Write(str_1);
                    ; break;
                #endregion
                #region 授权日
                case "shouquanri":
                    int zlid = int.Parse(context.Request["Pid"].ToString());
                    string sqr = context.Request["sqr"].ToString();
                    var cc = from r1 in dzdc.t_PatentType where r1.i_Id == zlid select r1;
                    string sqr_year = "";
                    string sqr_qs = "";
                    string sqr_date = "";
                    foreach (var r1 in cc)
                    {
                        if (r1.i_YouXiaoQiStart == 1)//有效期起始日==授权日
                        {
                            sqr_year = r1.i_YouXiaoQi.ToString();
                            sqr_qs = sqr;
                            sqr_date = Convert.ToDateTime(sqr).AddYears(r1.i_YouXiaoQi).ToShortDateString();
                        }
                    }
                    string str_2 = string.Format("{{ sq_year:'{0}', sq_qs:'{1}', sq_date:'{2}'}}", sqr_year, sqr_qs, sqr_date);
                    context.Response.Write(str_2);
                    ; break;
                #endregion
                #region 计算得到专利信息
                case "yyt":
                    int Pid = int.Parse(context.Request["Pid"].ToString());
                    string yxq = context.Request["yxq"].ToString();
                    int yx_year = 0;
                    string yx_date = "";
                    var aa = from r1 in dzdc.t_PatentType where r1.i_Id == Pid select r1;
                    foreach (var r1 in aa)
                    {
                        yx_year = r1.i_YouXiaoQi;
                        yx_date = Convert.ToDateTime(yxq).AddYears(r1.i_YouXiaoQi).ToShortDateString();
                    }

                    string str = string.Format("{{ yx_year:'{0}', yx_date:'{1}'}}", yx_year, yx_date);
                    context.Response.Write(str);
                    ; break;
                #endregion
                #region 计算得到专利信息
                case "getpinfo":
                    dal_Nationality DALN = new dal_Nationality();
                    dal_UserGrade DALUG = new dal_UserGrade();
                    int nId = int.Parse(context.Request["selIndex"].ToString());//授权国国籍
                    int pId = int.Parse(context.Request["patentTypeId"].ToString());//专利类型
                    string shenqingri = context.Request["shenqingri"].ToString();//申请日
                    string shouquanri = context.Request["shouquanri"].ToString();//授权日
                    int sId = int.Parse(context.Request["quanrenguoji"].ToString());//授权人国籍==应该是客户国籍(在下面改了)
                    string yijiaoyear = context.Request["yijiaoyear"].ToString();//已缴年度
                    string userNum = context.Request["userNum"].ToString();//会员编号
                    int yaoqiuxiang = int.Parse(context.Request["yaoqiuxiang"].ToString());//权利要求项
                    int dazhe = 0, dazhe1 = 0;
                    string youxiaoqistart = "";//有效期起算日
                    string youxiaoqiend = "";//有效期终止日
                    string nianxian = "";//专利于该授权国的有效维持年限
                    decimal yearfeetotal = 0;//专利于该授权国已缴纳年费总额：
                    string shengnianxian = "";//专利于该授权国的剩余有效维持年限(不包含当年)：
                    decimal setfee = 0;//政府规定费用
                    decimal shouxufee = 0;//汇款手续费
                    decimal agentservicefee = 0;//代理服務費
                    decimal chaoxiangfee = 0;//专利超项费
                    decimal zhinajin = 0;//滞纳金
                    decimal totalfee = 0;//费用小计
                    string moneytype = DALN.Nationality_Select_Id(nId).nvc_Currency;//货币种类
                    string prevjiaofeedate = "";//上一次年费缴纳期限日
                    string jiaofeedate = "";//缴纳期限
                    string jiaofeeday = "";//距离缴费所剩天数
                    string daijiaoyear = "";
                    int feeId = 0;

                    string s_month = "", s_fee = "";
                    int status = 13;
                    string max_year = "";
                    string yijiaonian = "";
                    //最大年度
                    var mm = (from i in dzdc.t_PatentFee where i.i_NationalityId == nId && i.i_PatentTypeId == pId orderby i.i_Id descending select i).Take(1);
                    if (mm.Count() > 0)
                    {
                        foreach (var v in mm)
                        {
                            max_year = v.nvc_Year;
                        }
                    }
                    //
                    var user = (from r in dmdc.t_Member where r.nvc_UserNum == userNum select r).Take(1);
                    foreach (var u in user)
                    {
                        dazhe = u.i_PowerDaZhe;
                        sId = u.i_GuoJiId;
                        t_MemberGrade tmg = DALUG.UserGrade_Select_Id(u.i_Grade);
                        if (tmg != null)
                        {
                            dazhe1 = Convert.ToInt32(tmg.i_Discount);
                        }
                    }
                    var result = (from r in dzdc.t_PatentFee where r.i_NationalityId == nId && r.i_PatentTypeId == pId && r.nvc_Year == yijiaoyear orderby r.i_Id descending select r).Take(1);
                    var result1 = from r1 in dzdc.t_PatentType where r1.i_Id == pId select r1;

                    foreach (var r in result)
                    {
                        feeId = r.i_Id;
                    }
                    var iquery = (from i in dzdc.t_PatentFee where i.i_NationalityId == nId && i.i_PatentTypeId == pId && i.i_Id > feeId select i).Take(1);
                    foreach (var r in iquery)
                    {
                        yearfeetotal = 0;
                        setfee = r.dm_SetFee;
                        chaoxiangfee = r.dm_ChaoXiangFee * yaoqiuxiang;
                        if (nId == sId)//本国国内汇款
                        {
                            shouxufee = r.dm_ShouXuFee;
                            agentservicefee = r.dm_AgentServiceFee;
                        }
                        else if (sId == 1 && nId != 1)//中国国内汇款
                        {
                            shouxufee = r.dm_ShouXuFee1;
                            agentservicefee = r.dm_AgentServiceFee1;
                        }
                        else if (sId != 1)//中国境外汇款
                        {
                            shouxufee = r.dm_ShouXuFee2;
                            agentservicefee = r.dm_AgentServiceFee2;
                        }
                        if (dazhe != 0)//服务费折扣
                        {
                            agentservicefee = agentservicefee * dazhe / 100;
                        }
                        if (dazhe1 != 0)
                        {
                            agentservicefee = agentservicefee * dazhe1 / 100;
                        }
                        //这个小计=（官费、代理费、汇款手续费）+超项费（单个费用*项数）+滞纳金（如果有的话）
                        totalfee = setfee + agentservicefee + shouxufee + chaoxiangfee + zhinajin;
                        daijiaoyear = r.nvc_Year;
                    }
                    foreach (var r1 in result1)
                    {
                        nianxian = r1.i_YouXiaoQi.ToString();
                        if (r1.i_YouXiaoQiStart == 0)//有效期起始日=申请日
                        {
                            youxiaoqistart = shenqingri;
                            youxiaoqiend = Convert.ToDateTime(shenqingri).AddYears(r1.i_YouXiaoQi).ToShortDateString().ToString();
                            shengnianxian = (Convert.ToDateTime(shenqingri).AddYears(r1.i_YouXiaoQi).Year - DateTime.Now.Year).ToString();

                        }
                        else//有效期起始日=授权日
                        {
                            youxiaoqistart = shouquanri;
                            youxiaoqiend = Convert.ToDateTime(shouquanri).AddYears(r1.i_YouXiaoQi).ToShortDateString();
                            shengnianxian = (Convert.ToDateTime(shenqingri).AddYears(r1.i_YouXiaoQi).Year - DateTime.Now.Year).ToString();
                        }
                        if (yijiaoyear != max_year)
                        {
                            //以中国为例
                            //上一次年费缴纳期限日（可手动更改）=申请日+已缴年度-1（这个申请日是根据专利类型设置的【缴费第一年起算日】得到的）
                            //缴费期限=上一次年费缴纳期限日+1
                            //代缴年度=已缴年度+1
                            //距缴费期限所剩天数=缴费期限-当天日期
                            //有的已缴费年度是这样的1~3.5 这样的7.5~11.5 还有这样的16~20
                            int addyue = 0, addmonth = 0;
                            if (yijiaoyear.IndexOf('~') > 0 && yijiaoyear.IndexOf('.') > 0)
                            {
                                yijiaonian = yijiaoyear.Split('~')[0];
                                yijiaoyear = yijiaoyear.Split('~')[1];
                                if (yijiaonian.IndexOf('.') > 0)
                                {
                                    yijiaonian = yijiaonian.Split('.')[0];
                                    addyue = 6;
                                }
                                if (yijiaoyear.IndexOf('.') > 0)
                                {
                                    yijiaoyear = yijiaoyear.Split('.')[0];
                                    addmonth = 6;
                                }
                            }
                            else
                            {
                                if (yijiaoyear.IndexOf('~') > 0)
                                {
                                    yijiaonian = yijiaoyear.Split('~')[0];
                                    yijiaoyear = yijiaoyear.Split('~')[1];
                                    yijiaonian = (Convert.ToInt32(yijiaonian) - 1).ToString();
                                }
                                else
                                {
                                    yijiaonian = (Convert.ToInt32(yijiaoyear) - 1).ToString();
                                }
                            }
                            if (r1.i_paymentFirstYear == 0)//缴费第一年起算日等于申请日
                            {
                                prevjiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaonian)).AddMonths(addyue).ToShortDateString();
                                jiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaoyear)).AddMonths(addmonth).ToShortDateString();
                                TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                                jiaofeeday = (ts.Days + 1).ToString();
                            }
                            if (r1.i_paymentFirstYear == 1)//缴费第一年起算日等于授权日
                            {
                                prevjiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaonian)).AddMonths(addyue).ToShortDateString();
                                jiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaoyear)).AddMonths(addmonth).ToShortDateString();
                                TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                                jiaofeeday = (ts.Days + 1).ToString();
                            }
                            if (r1.i_paymentFirstYear == 2)//缴费第一年起算日等于申请日的第二年
                            {
                                prevjiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaonian) + 1).AddMonths(addyue).ToShortDateString();
                                jiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaoyear) + 1).AddMonths(addmonth).ToShortDateString();
                                TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                                jiaofeeday = (ts.Days + 1).ToString();
                            }
                            if (r1.i_paymentFirstYear == 3)//缴费第一年起算日等于授权日的第二年
                            {
                                prevjiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaonian) + 1).AddMonths(addyue).ToShortDateString();
                                jiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaoyear) + 1).AddMonths(addmonth).ToShortDateString();
                                TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                                jiaofeeday = (ts.Days + 1).ToString();
                            }
                        }
                    }

                    if (yijiaoyear != max_year)
                    {
                        dal_Patent DALP = new dal_Patent();
                        if (Convert.ToInt32(jiaofeeday) < 0)
                        {
                            string ss = DALP.GetZhiNaJinByPatentInfo(Convert.ToInt32(jiaofeeday), pId, daijiaoyear);
                            s_month = ss.Split(',')[0];
                            s_fee = ss.Split(',')[1];
                            totalfee = Convert.ToDecimal(totalfee) - Convert.ToDecimal(s_fee);
                        }

                        status = DALP.GetStatusByAnnualFeeRestDay(Convert.ToInt32(jiaofeeday));
                    }
                    string json = string.Format("{{ Year:'{0}', SetFee:'{1}',ShouXuFee:'{2}',AgentServiceFee:'{3}',MoneyType:'{4}',TotalFee:'{5}',ShengYear:'{6}',YearFeeTotal:'{7}',ChaoXiangFee:'{8}',YouXiaoQiStart:'{9}',YouXiaoQiEnd:'{10}',PrevJiaoFeeDate:'{11}',JiaoFeeDate:'{12}',JiaoFeeday:'{13}',DaiJiaoYear:'{14}',ZhiNaMonth:'{15}',ZhiNaJin:'{16}',Status:'{17}'}}", nianxian, setfee, shouxufee, agentservicefee, moneytype, totalfee, shengnianxian, yearfeetotal, chaoxiangfee, youxiaoqistart, youxiaoqiend, prevjiaofeedate, jiaofeedate, jiaofeeday, daijiaoyear, s_month, s_fee, status);
                    context.Response.Write(json);
                    ; break;
                #endregion
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