using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Aspose.Cells;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    int uId = 0, MaxOrderBy = 0;
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Member DALM = new dal_Member();
    dal_Nationality DALN = new dal_Nationality();
    public string excelpath = "";
    public int Power_Into = 0, Power_Export = 0, Power_Update = 0, Power_Delete = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            DALM.GetMemberPower(uId, ref Power_Into, ref Power_Export, ref Power_Update, ref Power_Delete);
            if (Power_Into == 0)
            {
                ImgBtn_Add2.Visible = false;
                Response.Redirect("user_pageinfo.aspx");
            }
            if (DALM.Member_Select_Id(uId).i_UserTypeId == 3)
            {
                excelpath = "FileLoad/Patent Informaiton(2).xls";
            }
            else
            {
                excelpath = "FileLoad/Patent Informaiton(1).xls";
            }
            Hi_MemberId.Value = uId.ToString();
            MaxOrderBy = DALP.Patent_SelectOneByOrderBy();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=zl&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    protected void ImgBtn_Add2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (Fu_ExcelTable.HasFile)
            {
                string fileExt = System.IO.Path.GetExtension(Fu_ExcelTable.FileName);
                if (fileExt == ".xlsx" || fileExt == ".xls")
                {
                    string fileadress = Server.MapPath("FileLoad") + "\\" + "shop_apl_patent_" + DateTime.Now.ToString("yyMMddHHmmss") + fileExt;
                    Fu_ExcelTable.SaveAs(fileadress);
                    Cells cells;
                    Workbook wb = new Workbook();
                    wb.Open(fileadress);
                    cells = wb.Worksheets[0].Cells;

                    t_Member user = DALM.Member_Select_Id(uId);
                    if (cells.MaxDataRow >= 8)
                    {
                        int ok = 0, no = 0;
                        string nostr = "";
                        for (int i = 8; i < cells.MaxDataRow + 1; i++)
                        {
                            if(cells[i, 2].StringValue.Trim() != "")
                            {
                                if (DALP.Patent_Select_Number(cells[i, 2].StringValue, DALN.Nationality_Select_Name(cells[i, 4].StringValue, "jp").i_Id, uId, 0) <= 0)
                                {
                                    #region
                                    t_Patent model = new t_Patent();
                                    model.i_MemberId = uId;//会员编号*
                                    model.nvc_Number = cells[i, 2].StringValue;//专利号*
                                    model.nvc_Name = cells[i, 3].StringValue;//特許名称
                                    model.i_AuthorizeNationalityId = DALN.Nationality_Select_Name(cells[i, 4].StringValue, "jp").i_Id;//特許授権国*
                                    model.i_PatentType = DALPT.PatentType_Select_GuoJiaIdAndName(model.i_AuthorizeNationalityId, cells[i, 5].StringValue, "jp").i_Id;//专利类型*
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
                                        model.i_YaoQiuXiang = Convert.ToInt32(cells[i, 8].StringValue);//権利要求項目
                                    }
                                    else
                                    {
                                        model.i_YaoQiuXiang = 0;
                                    }
                                    model.nvc_PatentHolder = cells[i, 9].StringValue;//特許権利人
                                    if (cells[i, 10].StringValue != "")
                                    {
                                        model.i_PatentHolderNationalityId = DALN.Nationality_Select_Name(cells[i, 10].StringValue, "jp").i_Id;//特許権利人国籍
                                    }
                                    model.nvc_PatentInventor = cells[i, 11].StringValue;//発明者
                                    model.nvc_AnnualFeePaymentYear = cells[i, 12].StringValue;//专利已缴年度*
                                    if (cells[i, 13].StringValue != "")
                                    {
                                        model.dt_AnnualFeePrevYear = Convert.ToDateTime(cells[i, 13].StringValue);//上一次年费缴纳期限日*
                                    }
                                    model.nvc_PriorityNumber = cells[i, 14].StringValue;//優先権申請番号
                                    if (cells[i, 15].StringValue != "")
                                    {
                                        model.i_PriorityNationalityId = DALN.Nationality_Select_Name(cells[i, 15].StringValue, "jp").i_Id;//优先权申请国
                                    }
                                    if (cells[i, 16].StringValue != "")
                                    {
                                        model.dt_PriorityDate = Convert.ToDateTime(cells[i, 16].StringValue);//優先権申請日
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

                                    model.i_AnnualFeeYear = DALPT.PatentType_Select_GuoJiaIdAndName(model.i_AuthorizeNationalityId, cells[i, 5].StringValue, "jp").i_YouXiaoQi;//有效维持年限

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

                                    model.dt_AddTime = DateTime.Now;
                                    model.i_OrderBy = MaxOrderBy + i;
                                    model.i_ReceiveEmail = 1;
                                    DALP.Patent_Add(model);
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
                        UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_zl_uid"], "专利管理", "批量导入专利");
                        div_a.InnerHtml = "<script>alert('" + ok + "個を導入しました！" + no + "個の特許コードが重複しています,重複している特許コードは：" + nostr + "');location.href='User_PatentAddOk.aspx?AddType=成功导入专利&AddOkCount=" + ok + "';</script>";
                    }
                    else
                    {
                        div_a.InnerHtml = "<script>alert('データがありません')</script>";
                    }

                }
                else
                {
                    div_a.InnerHtml = "<script>alert('Excelリストをアップロードしてください！')</script>";
                }
            }
        }
        catch (Exception ex)
        {
            //div_a.InnerHtml = "<script>alert('" + ex.Message + "')</script>";
            div_a.InnerHtml = "<script>alert('データ異常')</script>";
        }
    }
}