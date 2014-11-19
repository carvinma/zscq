using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Aspose.Cells;
using zscq.Model;
using zscq.DAL;
using System.Text;
public partial class Shop_Manage_Shop_Apl_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(11, 0);
    public bool pageadd = Manager.GetManagerQX(11, 1);
    public bool pagedaoru = Manager.GetManagerQX(11, 4);
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_Member DALM = new dal_Member();
    public int MaxOrderBy = 0;
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
        div_a.InnerHtml = "";
        if (!pageadd)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        MaxOrderBy = DALP.Patent_SelectOneByOrderBy();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.ful_price.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(ful_price.FileName);
            if (fileExt == ".xlsx" || fileExt == ".xls")
            {
                string fileadress = Server.MapPath("FileLoad") + "\\" + "shop_apl_patent_" + DateTime.Now.ToString("yyMMddHHmmss") + fileExt;
                this.ful_price.SaveAs(fileadress);
                Cells cells;
                Workbook wb = new Workbook();
                wb.Open(fileadress);
                cells = wb.Worksheets[0].Cells;
                try
                {
                    if (cells.MaxDataRow > 8)
                    {
                        int ok = 0, no = 0;
                        string nostr = "";
                        for (int i = 8; i < cells.MaxDataRow + 1; i++)
                        {
                            if (cells[i, 2].StringValue.Trim() != "")
                            {
                                if (DALP.Patent_Select_Number(cells[i, 2].StringValue, DALN.Nationality_Select_Name(cells[i, 4].StringValue, "cn").i_Id, DALM.Member_Select_ByUserNum(cells[i, 1].StringValue.Trim()).i_Id,0) <= 0)
                                {
                                    #region
                                    t_Patent model = new t_Patent();
                                    model.i_MemberId = DALM.Member_Select_ByUserNum(cells[i, 1].StringValue.Trim()).i_Id;//会员编号*
                                    model.nvc_Number = cells[i, 2].StringValue;//专利号*
                                    model.nvc_Name = cells[i, 3].StringValue;//专利名称
                                    model.i_AuthorizeNationalityId = DALN.Nationality_Select_Name(cells[i, 4].StringValue, "cn").i_Id;//专利授权国*
                                    model.i_PatentType = DALPT.PatentType_Select_GuoJiaIdAndName(model.i_AuthorizeNationalityId, cells[i, 5].StringValue, "cn").i_Id;//专利类型*
                                    model.dt_AuthorizeIsNationalityDate = Convert.ToDateTime(cells[i, 6].StringValue);//申请日*
                                    if (cells[i, 7].StringValue != "")
                                    {
                                        model.dt_AuthorizeIsAuthorizeDate = Convert.ToDateTime(cells[i, 7].StringValue);//授权日
                                    }
                                    else
                                    {
                                        //得到授权日
                                        string a = "", b = "", c = "";
                                        DALP.GetPatentInfoByPatentTypeAndShenQingRi(model.i_PatentType, model.dt_AuthorizeIsNationalityDate.ToString(), ref a, ref b, ref c);
                                        model.dt_AnnualFeeDateStart = Convert.ToDateTime(b);
                                        model.dt_AnnualFeeDateEnd = Convert.ToDateTime(c);
                                        model.i_AnnualFeeYear = int.Parse(a);
                                        model.i_AnnualFeeRestYear = int.Parse(a);
                                    }
                                    if (cells[i, 8].StringValue != "")
                                    {
                                        model.i_YaoQiuXiang = Convert.ToInt32(cells[i, 8].StringValue);//权利要求项
                                    }
                                    else
                                    {
                                        model.i_YaoQiuXiang = 0;
                                    }
                                    model.nvc_PatentHolder = cells[i, 9].StringValue;//专利权人
                                    if (cells[i, 10].StringValue != "")
                                    {
                                        model.i_PatentHolderNationalityId = DALN.Nationality_Select_Name(cells[i, 10].StringValue, "cn").i_Id;//专利权人国籍
                                    }
                                    model.nvc_PatentInventor = cells[i, 11].StringValue;//发明人
                                    model.nvc_AnnualFeePaymentYear = cells[i, 12].StringValue;//专利已缴年度*
                                    if (cells[i, 13].StringValue != "")
                                    {
                                        model.dt_AnnualFeePrevYear = Convert.ToDateTime(cells[i, 13].StringValue);//上一次年费缴纳期限日*
                                    }
                                    model.nvc_PriorityNumber = cells[i, 14].StringValue;//优先权申请号
                                    if (cells[i, 15].StringValue != "")
                                    {
                                        model.i_PriorityNationalityId = DALN.Nationality_Select_Name(cells[i, 15].StringValue, "cn").i_Id;//优先权申请国
                                    }
                                    if (cells[i, 16].StringValue != "")
                                    {
                                        model.dt_PriorityDate = Convert.ToDateTime(cells[i, 16].StringValue);//优先权申请日
                                    }
                                    model.nvc_PtcNumber = cells[i, 17].StringValue;//PTC申请号
                                    if (cells[i, 18].StringValue != "")
                                    {
                                        model.dt_PtcDate = Convert.ToDateTime(cells[i, 18].StringValue);//PTC申请日
                                    }

                                    try
                                    {
                                        model.nvc_AnJuanNum = cells[i, 19].StringValue;
                                        model.nvc_LinkMan = cells[i, 20].StringValue;
                                        model.nvc_Address = cells[i, 21].StringValue;
                                        model.nvc_Phone = cells[i, 22].StringValue;
                                    }
                                    catch
                                    {
                                        model.nvc_AnJuanNum = "";
                                        model.nvc_LinkMan = "";
                                        model.nvc_Address = "";
                                        model.nvc_Phone = "";
                                    }

                                    model.i_AnnualFeeYear = DALPT.PatentType_Select_GuoJiaIdAndName(model.i_AuthorizeNationalityId, cells[i, 5].StringValue, "cn").i_YouXiaoQi;//有效维持年限

                                    string s2 = DALP.GetPatentInfo(model.i_AuthorizeNationalityId, model.i_PatentType, model.dt_AuthorizeIsNationalityDate.ToString(), model.dt_AuthorizeIsAuthorizeDate.ToString(), model.i_PatentHolderNationalityId, model.nvc_AnnualFeePaymentYear, model.i_MemberId, model.i_YaoQiuXiang);
                                    //Year:'{0}', SetFee:'{1}',ShouXuFee:'{2}',AgentServiceFee:'{3}',MoneyType:'{4}',TotalFee:'{5}',ShengYear:'{6}',
                                    //YearFeeTotal:'{7}',ChaoXiangFee:'{8}',YouXiaoQiStart:'{9}',YouXiaoQiEnd:'{10}',PrevJiaoFeeDate:'{11}',JiaoFeeDate:'{12}',
                                    //JiaoFeeday:'{13}',DaiJiaoYear:'{14}'

                                    model.i_AnnualFeeYear = Convert.ToInt32(s2.Split(',')[0]);
                                    model.i_AnnualFeeRestYear = Convert.ToInt32(s2.Split(',')[6]);
                                    model.dt_AnnualFeeDateStart = Convert.ToDateTime(s2.Split(',')[9]);
                                    model.dt_AnnualFeeDateEnd = Convert.ToDateTime(s2.Split(',')[10]);
                                    model.nvc_AnnualFeeNotPaymentYear = s2.Split(',')[14];
                                    model.dt_AnnualFeePrevYear = Convert.ToDateTime(s2.Split(',')[11]);
                                    model.dt_AnnualFeeNextYear = Convert.ToDateTime(s2.Split(',')[12]);
                                    model.i_AnnualFeeRestDay = Convert.ToInt32(s2.Split(',')[13]);
                                    model.i_AnnualFeeStatus = DALP.GetStatusByAnnualFeeRestDay(model.i_AnnualFeeRestDay);//状态
                                    model.dm_AnnualFeeNextPaymentMoney = Convert.ToDecimal(s2.Split(',')[1]);
                                    model.dm_RemittanceFee = Convert.ToDecimal(s2.Split(',')[2]);
                                    model.dm_AgentServiceFee = Convert.ToDecimal(s2.Split(',')[3]);
                                    model.dm_ChaoXiangFee = Convert.ToDecimal(s2.Split(',')[8]);
                                    model.dm_FeeSubtotal = Convert.ToDecimal(s2.Split(',')[5]);
                                    model.nvc_CurrencyType = s2.Split(',')[4];

                                    model.i_OrderBy = MaxOrderBy + i;
                                    model.dt_AddTime = DateTime.Now;
                                    model.i_ReceiveEmail = 1;
                                    if (DALP.Patent_Add(model) > 0)
                                    {
                                        #region 生成订单 已注释
                                        //t_PatentOrder OrderModer = new t_PatentOrder();
                                        //OrderModer.nvc_OrderNumber = "Z" +
                                        //    ((DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000 + i).ToString();
                                        //OrderModer.i_UserId = model.i_MemberId;
                                        //OrderModer.i_Status = 1;
                                        //OrderModer.dm_TotalMoney = 0;
                                        //OrderModer.dm_PsMoney = 0;
                                        //OrderModer.dm_CouponMoney = 0;
                                        //OrderModer.dm_InvoiceMoney = 0;
                                        //OrderModer.dt_AddTime = DateTime.Now;
                                        //OrderModer.dt_PayMoneyTime = DateTime.Now;
                                        //DALPO.PatentOrder_Add(OrderModer);
                                        #endregion

                                        #region 生成订单详情 已注释
                                        //t_PatentOrderInfo InfoModer = new t_PatentOrderInfo();
                                        //#region 缴费国家币种
                                        //t_Member tm = DALM.Member_Select_Id(model.i_MemberId);
                                        //t_Nationality tn = DALN.Nationality_Select_Id(tm.i_GuoJiId);
                                        //string paybizhong = "";
                                        //if (tn != null)
                                        //{
                                        //    paybizhong = tn.nvc_JFBizhong;//费用缴纳国家币种
                                        //}
                                        //#endregion
                                        //InfoModer.i_OrderId = OrderModer.i_Id;
                                        //InfoModer.i_PatentId = model.i_Id;
                                        //InfoModer.nvc_Year = model.nvc_AnnualFeePaymentYear;

                                        //InfoModer.dm_ZhengFuGuiDingFei = model.dm_AnnualFeeNextPaymentMoney;
                                        //InfoModer.dm_HuiKuanShouXuFei = model.dm_RemittanceFee;
                                        //InfoModer.dm_DaiLiFuWuFei = model.dm_AgentServiceFee;
                                        //InfoModer.dm_ChaoXiangFei = model.dm_ChaoXiangFee;
                                        //InfoModer.dm_ZhiNaJin = Convert.ToDecimal(model.nvc_ZhiNaJin);
                                        //InfoModer.dm_TotalMoney = model.dm_FeeSubtotal;
                                        //InfoModer.nvc_BiZhong = model.nvc_CurrencyType;

                                        //InfoModer.dm_ZhengFuGuiDingFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_AnnualFeeNextPaymentMoney, model.nvc_CurrencyType, paybizhong);
                                        //InfoModer.dm_HuiKuanShouXuFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_RemittanceFee, model.nvc_CurrencyType, paybizhong);
                                        //InfoModer.dm_DaiLiFuWuFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_AgentServiceFee, model.nvc_CurrencyType, paybizhong);
                                        //InfoModer.dm_ChaoXiangFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_ChaoXiangFee, model.nvc_CurrencyType, paybizhong);
                                        //InfoModer.dm_ZhiNaJin1 = DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(model.nvc_ZhiNaJin), model.nvc_CurrencyType, paybizhong);
                                        //InfoModer.dm_TotalMoney1 = DALPO.GetPayMoneyByHuiLv(model.dm_FeeSubtotal, model.nvc_CurrencyType, paybizhong);
                                        //InfoModer.nvc_BiZhong1 = paybizhong;

                                        //InfoModer.nvc_PatentNumber = model.nvc_Name;
                                        //InfoModer.nvc_PatentName = model.nvc_Number;
                                        //InfoModer.nvc_PatentShouQuanGuo = DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_Name;
                                        //InfoModer.dt_PatentJiaoFeeQiXian = model.dt_AnnualFeeNextYear;
                                        //InfoModer.i_PatentShouQuanGuoId = model.i_AuthorizeNationalityId;
                                        //DALPOI.PatentOrderInfo_Add(InfoModer);
                                        #endregion
                                    }
                                    #endregion
                                    ok++;
                                }
                                else
                                {
                                    no++;
                                    nostr += cells[i, 2].StringValue + "|";
                                }
                            }
                        }
                        Manager.AddLog(0, "专利管理", "批量导入专利");
                        div_a.InnerHtml = "<script>alert('成功导入" + ok + "个！有" + no + "个专利编号重复,重复的专利编号有：" + nostr + "')</script>";
                        return;
                    }
                    else
                    {
                        div_a.InnerHtml = "<script>alert('没有数据！')</script>";
                    }
                }
                catch (Exception ex)
                {
                    div_a.InnerHtml = "<script>alert('" + ex.Message + "')</script>";
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('请上传Excel表格！')</script>";
            }
        }
    }
}