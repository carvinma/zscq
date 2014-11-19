using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.Xml.Linq;
using Aspose.Cells;
using System.Text;
public partial class user_sbupdate : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    public string daoqitime = "";
    public string shengtime = "";
    public string JiaoFeiType = "", Sb_num = "";
    public int TrademarkId = 0, MemberId = 0;
    public int guoji = 0, usertype = 0;
    public string Str_Money = "", Str_Moneymei = "", bizhong = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            int uid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            t_Member t = DALM.Member_Select_Id(uid);
            if (t != null)
            {
                usertype = int.Parse(t.i_UserTypeId.ToString());
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int oknum = 0; string info = ""; int idnum = 0, sbnum = 0;
        t_SystemSetup ts = DALSS.SystemSetup_Select();

        int uid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
        t_Member t = DALM.Member_Select_Id(uid);
        int usertype1 = 0;
        if (t != null)
        {
            usertype1 = int.Parse(t.i_UserTypeId.ToString());
        }
        if (this.ful_price.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(ful_price.FileName);
            if (fileExt == ".xlsx" || fileExt == ".xls")
            {
                string fileadress = Server.MapPath("File_Zscq/File_ShangBiao") + "\\" + "shop_apl_sb_" + DateTime.Now.ToString("yyMMddHHmmss") + fileExt;
                this.ful_price.SaveAs(fileadress);
                Cells cells;
                Workbook wb = new Workbook();
                wb.Open(fileadress);
                cells = wb.Worksheets[0].Cells;
                int shu = 0;
                string fstr = "";
                try
                {
                    if (cells.MaxDataRow > 0)
                    { 
                        for (int i = 6; i < cells.MaxDataRow + 1; i++)
                        {
                            t_Trademark model = new t_Trademark();
                            model.i_MemberId = uid;
                            if (usertype1 == 3)
                            {
                                var result = (from r in dzdc.t_Trademark where r.nvc_SBRegName == cells[i, 2].StringValue && r.i_MemberId == model.i_MemberId && (r.nvc_ZhuTiFile != "" || r.nvc_ZhuTiFile != null) select r).Take(1);
                                foreach (var v in result)
                                {
                                    model.nvc_ZhuTiFile = v.nvc_ZhuTiFile;
                                }

                            }

                            if (ts != null)
                            {
                                model.nvc_DLName = ts.nvc_DLName;
                                model.nvc_DLTel = ts.nvc_DLTel;
                                model.nvc_DLFaxnumber = ts.nvc_DLFaxNumber;
                                model.nvc_DLZuzhiName = ts.nvc_DLCNName;
                                model.nvc_DLZuzhiEnName = ts.nvc_DLENName;
                            }
                            t_Trademark td = DALT.Trademark_Select_No(cells[i, 0].StringValue, Convert.ToInt32(model.i_MemberId));
                            if (td == null)
                            {
                                string miaoshu = "";
                                model.nvc_SBRegNum = cells[i, 0].StringValue;
                                model.nvc_SBType = cells[i, 1].StringValue;//商标类型  

                                model.nvc_SBRegName = cells[i, 2].StringValue;//商标Name of Trademark registrant

                                string dt1 = "";
                                if (usertype1 == 3)
                                {
                                    if (cells[i, 7].StringValue.IndexOf("/") > 0)
                                    {
                                        dt1 = cells[i, 7].StringValue.Replace("/", "-");
                                    }
                                    else
                                    {
                                        dt1 = cells[i, 7].StringValue;
                                    }
                                    model.nvc_SBRegAddress = cells[i, 4].StringValue;
                                    model.nvc_SBPostcode = cells[i, 5].StringValue;
                                    model.nvc_SbRegTime = dt1;
                                    miaoshu = cells[i, 8].StringValue;
                                    model.nvc_SBDescribe = cells[i, 9].StringValue;
                                }
                                else
                                {
                                    if (cells[i, 5].StringValue.IndexOf("/") > 0)
                                    {
                                        dt1 = cells[i, 5].StringValue.Replace("/", "-");
                                    }
                                    else
                                    {
                                        dt1 = cells[i, 5].StringValue;
                                    }
                                    model.nvc_SBRegAddress = cells[i, 3].StringValue;
                                    model.nvc_SBPostcode = cells[i, 4].StringValue;
                                    model.nvc_SbRegTime = dt1;
                                    miaoshu = cells[i, 6].StringValue;
                                    model.nvc_SBDescribe = cells[i, 7].StringValue;
                                }
                                try
                                {

                                    DateTime dt = DateTime.Parse(model.nvc_SbRegTime).AddYears(10).AddDays(-1);
                                    model.nvc_SbDaoqiTime = dt.ToShortDateString();
                                    model.i_ShengDays = Convert.ToInt32(HelpString.DateDiff(dt, DateTime.Now, "day"));
                                }
                                catch
                                {
                                    info = i + "行の時間格式の記入が正しくありません。導入が停止しました！" + oknum + "データを導入できました！";
                                }
                                
                                model.i_MiaoShuType = 1;
                                if (miaoshu.IndexOf("文字") >= 0)
                                {
                                    model.i_MiaoShuType = 1;
                                }
                                if (miaoshu.IndexOf("図形") >= 0)
                                {
                                    model.i_MiaoShuType = 2;
                                }
                                if (miaoshu.IndexOf("と") > 0)
                                {
                                    model.i_MiaoShuType = 3;
                                }
                                model.i_JiaoFeiType = 2;//默认是委託納付
                                model.i_IsPayState = 0;
                                
                                if (usertype1 == 3)
                                {
                                    #region Information of the third party
                                    model.nvc_SBRegEnName = cells[i, 3].StringValue;//
                                    model.nvc_SBRegEnAddress = cells[i, 6].StringValue;
                                    model.nvc_CFaxnumber = cells[i, 10].StringValue;//Reference number
                                    model.nvc_OtherName = cells[i, 11].StringValue;
                                    model.nvc_CTel = cells[i, 12].StringValue;
                                    model.nvc_CAddress = cells[i, 13].StringValue;
                                    #endregion
                                }
                                model.dt_AddTime = DateTime.Now;
                                if (DALT.Trademark_Add(model) > 0)
                                {
                                    oknum++;
                                    #region 生成订单
                                    //int trademarkid = model.i_Id;
                                    //t_TrademarkOrder OrderModer = new t_TrademarkOrder();
                                    //OrderModer.nvc_OrderNumber = DALTO.Set_OrderNo();

                                    //OrderModer.i_MemberId = Convert.ToInt32(cells[i, 0].StringValue);

                                    //OrderModer.i_Status = 0;
                                    //OrderModer.dm_TotalMoney = 0;
                                    //OrderModer.dt_AddTime = DateTime.Now;
                                    //DALTO.TrademarkOrder_Add(OrderModer);
                                    //#endregion

                                    //#region 生成订单详情
                                    //t_TrademarkOrderDetails dModer = new t_TrademarkOrderDetails();
                                    //dModer.i_OrderId = OrderModer.i_Id;
                                    //dModer.i_TrademarkId = trademarkid;
                                    //DALTOD.OrderDetails_Add(dModer);
                                    #endregion
                                }
                            }
                            else
                            {
                                sbnum++;
                                fstr += cells[i, 0].StringValue + "|";
                            }
                        }
                        UserLog.AddUserLog(uid, "商标系统", "批量上传");
                        div_a.InnerHtml = "<script>alert('" + oknum + "個を導入しました！" + info + "" + sbnum + "個の特許コードが重複していま重複している特許コードは：" + fstr + "');location.href='user_sbAddOk.aspx?shu=" + oknum + "&ok=success';</script>";//  Response.Redirect("user_sbAddOk.aspx?shu=" + oknum + "&ok=success");
                        
                    }
                    else
                    {
                        div_a.InnerHtml = "<script>alert('データがありません！')</script>";
                    }
                }
                catch (Exception ex)
                {
                    div_a.InnerHtml = "<script>alert('" + ex.Message + "')</script>";
                }
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('Excelリストをアップロードしてください！')</script>";
        }
    }
}