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
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pagedaoru = Manager.GetManagerQX(21, 4);
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Trademark DALT = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_Member DALM = new dal_Member();
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int usertype1 = 0;
        int oknum = 0; string info = "";int idnum=0,sbnum=0 ;
        t_SystemSetup ts = DALSS.SystemSetup_Select();
        if (this.ful_price.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(ful_price.FileName);
            if (fileExt == ".xlsx" || fileExt == ".xls")
            {
                string fileadress = Server.MapPath("FileLoad/file_sb") + "\\" + "shop_apl_trademark_" + DateTime.Now.ToString("yyMMddHHmmss") + fileExt;
                this.ful_price.SaveAs(fileadress);
                Cells cells;
                Workbook wb = new Workbook();
                wb.Open(fileadress);
                cells = wb.Worksheets[0].Cells;
                string fstr = "";
                try
                {
                    if (cells.MaxDataRow > 0)
                    {
                        for (int i = 6; i < cells.MaxDataRow + 1; i++)
                        {
                            t_Trademark model = new t_Trademark();
                            t_Member tm = DALM.Member_Select_ByUserNum(cells[i, 0].StringValue);
                            if(tm!=null)
                            {
                                model.i_MemberId = tm.i_Id;
                                usertype1 = Convert.ToInt32(tm.i_UserTypeId);
                            }
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

                            t_Trademark td = DALT.Trademark_Select_No(cells[i, 1].StringValue, Convert.ToInt32(model.i_MemberId));

                            if (td == null)
                            {
                                model.nvc_SBRegNum = cells[i, 1].StringValue;
                                model.nvc_SBType = cells[i, 2].StringValue;//商标类型                     
                                model.nvc_SBRegName = cells[i, 3].StringValue;//商标注册人姓名
                                // model.nvc_SBRegEnName = cells[i, 4].StringValue;//
                                model.nvc_SBRegAddress = cells[i, 4].StringValue;
                                // model.nvc_SBRegEnAddress = cells[i, 6].StringValue;
                                model.nvc_SBPostcode = cells[i, 5].StringValue;
                                model.nvc_SbRegTime = cells[i, 6].StringValue;

                                try
                                {
                                    DateTime dt = DateTime.Parse(cells[i, 6].StringValue).AddYears(10).AddDays(-1);
                                    model.nvc_SbDaoqiTime = dt.ToShortDateString();
                                    model.i_ShengDays = int.Parse(HelpString.DateDiff(dt, DateTime.Now, "day"));
                                }
                                catch
                                {
                                    info = "第" + i + "行，时间格式输入不正确，已停止插入！成功插入" + oknum + "数据！";
                                }
                                string miaoshu = cells[i, 7].StringValue;
                                model.i_MiaoShuType = 1;
                                if (miaoshu.IndexOf("纯文字") >= 0)
                                {
                                    model.i_MiaoShuType = 1;
                                }
                                if (miaoshu.IndexOf("纯图形") >= 0)
                                {
                                    model.i_MiaoShuType = 2;
                                }
                                if (miaoshu.IndexOf("与") > 0)
                                {
                                    model.i_MiaoShuType = 3;
                                }
                                model.i_JiaoFeiType = 2;//默认是委托缴费
                                model.i_IsPayState = 0;
                                model.nvc_SBDescribe = cells[i, 8].StringValue;
                                if (usertype1 == 3)
                                {
                                    #region 第三方信息
                                    model.nvc_CFaxnumber = cells[i, 9].StringValue;//案卷号
                                    model.nvc_OtherName = cells[i, 10].StringValue;
                                    model.nvc_CTel = cells[i, 11].StringValue;
                                    model.nvc_CAddress = cells[i, 12].StringValue;
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
                                fstr += cells[i, 0].StringValue + ";";
                            }
                        }
                        Manager.AddLog(0, "商标管理", "批量导入商标");
                        div_a.InnerHtml = "<script>alert('成功导入" + oknum + "个！" + info + "，有" + sbnum + "个商标编号重复,重复的商标注册号有：" + fstr + ");location.href='Shop_Apl_Trademark.aspx?shu=" + oknum + "&ok=success';</script>";//  Response.Redirect("user_sbAddOk.aspx?shu=" + oknum + "&ok=success");
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