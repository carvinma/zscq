using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using zscq.DAL;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Reflection;
using System.IO;
using System.Text;
using System.Data;
using Aspose.Words;
using Aspose.Cells;

public partial class Shop_Manage_shop_addhw : System.Web.UI.Page
{
    dal_Trademark DALT = new dal_Trademark();
    dal_Trademark DAL = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    public string returnurl = "";
    public int trademarkId =0;
    public string worletitle = "";
    public int jiaofeitype = 0;
    public int fileurl = 0;
    public int fileword = 0;
    public int miaoshutype=0;
    public string typedaochu = "0",worldinfo="";
    public string str = "", sbnumber = "", miaoshu = "", wtr_cn = "", wtr_en = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        if (!IsPostBack)
        {
           Bind_Page_Type();
           //NewMethod();
        }
       
    }
    public void Bind_Page_Type()// 绑定页面信息
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            trademarkId = int.Parse(Request.QueryString["id"].ToString());
            var iquery = DALT.Trademark_vw_Select_ById(trademarkId).Take(1);
            var dic = new Dictionary<string, string>();
            #region
            if (iquery.Count() > 0)
            {
                foreach (var item in iquery)
                {
                    sbnumber = item.nvc_SBRegNum;
                    if (item.i_MiaoShuType == 1)
                    {
                        miaoshu = item.nvc_SBDescribe;
                    }
                    if (item.i_MiaoShuType == 2)
                    {
                        miaoshu = "图片";
                    }
                    if (item.i_MiaoShuType == 3)
                    {
                        miaoshu = item.nvc_SBDescribe + "+ 图片";
                    }

                    if (item.i_UserTypeId == 3)//代理机构 调用的是商标注册里的用户信息
                    {
                        
                        if (Request.QueryString["zixing"] != null)
                        {
                            if (Request.QueryString["zixing"] != "")
                            {
                                string info = Request.QueryString["zixing"].ToString();
                                if (info == "ok")
                                {
                                    wtr_cn = item.nvc_DaiLiName;
                                    wtr_en = "";
                                    str = item.nvc_SBRegName + ";";
                                    if (item.nvc_SBRegEnName != null)
                                    {
                                        str = str + item.nvc_SBRegEnName + ";";
                                    }
                                    else
                                    {
                                        str = str + " " + ";";
                                    }
                                    str = str + item.nvc_SBRegAddress + ";";

                                    if (item.nvc_SBRegEnAddress != null)
                                    {
                                        str = str + item.nvc_SBRegEnAddress + ";";
                                    }
                                    else
                                    {
                                        str = str + " " + ";";
                                    }
                                    str = str + " " + ";";
                                    str = str + " " + ";";
                                    str = str + " " + ";";
                                    str = str + " " + ";";
                                    str = str + " " + ";";
                                    str = str + " " + ";";
                                }
                                else
                                {
                                    MessageBox.ShowAndRedirect(this.Page, "データ異常,将要へスキップ列表页...", "user_sblb.aspx");
                                }
                            }
                        }
                        else
                        {
                            wtr_cn = "北京环球惠通咨询服务有限公司";
                            wtr_en = "Global Patent Annuity Fees Payment Agency Co.,Ltd";
                           
                                str = item.nvc_SBRegName + ";";
                            
                            
                            if (item.nvc_SBRegEnName != null)
                            {
                                str = str + item.nvc_SBRegEnName + ";";
                            }
                            else
                            {
                                str = str + " " + ";";
                            }
                            str = str + item.nvc_SBRegAddress + ";";

                            if (item.nvc_SBRegEnAddress != null)
                            {
                                str = str + item.nvc_SBRegEnAddress + ";";
                            }
                            else
                            {
                                str = str + " " + ";";
                            }
                            str = str + " " + ";";
                            str = str + " " + ";";
                            str = str + " " + ";";
                            str = str + " " + ";";
                            str = str + " " + ";";
                            str = str + " " + ";";
                        }


                    }
                    else
                    {
                        wtr_cn = "北京环球惠通咨询服务有限公司";
                        wtr_en = "Global Patent Annuity Fees Payment Agency Co.,Ltd";
                        
                        if (item.i_UserTypeId == 2)
                        {
                            str = item.nvc_Company + ";";
                        }
                        else if (item.i_UserTypeId == 1)
                        {
                            str = item.nvc_RealName + ";";
                        }
                        if (item.nvc_EnglishName != null)
                        {
                            str = str + item.nvc_EnglishName + ";";
                        }
                        else
                        {
                            str = str + " " + ";";
                        }
                        str = str + item.nvc_Address + ";";

                        if (item.nvc_EnAddress != null)
                        {
                            str = str + item.nvc_EnAddress + ";";
                        }
                        else
                        {
                            str = str + " " + ";";
                        }
                        str = str + item.nvc_RealName + ";";
                        if (item.nvc_EnglishName != null)
                        {
                            str = str + item.nvc_EnglishName + ";";
                        }
                        else
                        {
                            str = str + " " + ";";
                        }
                        str = str + item.nvc_TelPhone + ";";
                        str = str + item.nvc_TelPhone + ";";
                        str = str + item.nvc_ZipCode + ";";
                        str = str + item.nvc_ZipCode + ";";
                    }
                    str = str + item.nvc_SBRegNum + ";";
                    str = str + item.nvc_SBType + ";";
                    str = str + DALN.Nationality_Select_Id(item.i_GuoJiId).nvc_Name + ";";
                    str = str + DALN.Nationality_Select_Id(item.i_GuoJiId).nvc_EnName + ";";
                }
            }
            #endregion
            #region
            string tmppath = Server.MapPath("File_Zscq/sb_weituoshuTemp.doc");
            Document doc = new Document(tmppath); //载入模板 
            if (doc.Range.Bookmarks["weituoren"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["weituoren"];
                mark.Text = str.Split(';')[0];
            }
            if (doc.Range.Bookmarks["weituorenEn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["weituorenEn"];
                mark.Text = str.Split(';')[1];
            }
            if (doc.Range.Bookmarks["address"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["address"];
                mark.Text = str.Split(';')[2];
            }
            if (doc.Range.Bookmarks["addressEn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["addressEn"];
                mark.Text = str.Split(';')[3];
            }
            if (doc.Range.Bookmarks["c_name"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_name"];
                mark.Text = str.Split(';')[4];
            }
            if (doc.Range.Bookmarks["c_nameEn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_nameEn"];
                mark.Text = str.Split(';')[5];
            }
            if (doc.Range.Bookmarks["c_Tel"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_Tel"];
                mark.Text = str.Split(';')[6];
            }
            if (doc.Range.Bookmarks["c_TelEn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_TelEn"];
                mark.Text = str.Split(';')[7];
            }
            if (doc.Range.Bookmarks["c_Youbian"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_Youbian"];
                mark.Text = str.Split(';')[8];
            }
            if (doc.Range.Bookmarks["c_YoubianEn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_YoubianEn"];
                mark.Text = str.Split(';')[9];
            }
            if (doc.Range.Bookmarks["sb_regNum"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_regNum"];
                mark.Text = str.Split(';')[10];
            }
            if (doc.Range.Bookmarks["sb_type"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_type"];
                mark.Text = str.Split(';')[11];
            }
            if (doc.Range.Bookmarks["guoji"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["guoji"];
                mark.Text = str.Split(';')[12];
            }
            if (doc.Range.Bookmarks["guojiEn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["guojiEn"];
                mark.Text = str.Split(';')[13];
            }
            if (doc.Range.Bookmarks["Miaoshu"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["Miaoshu"];
                mark.Text = miaoshu;
            }
            if (doc.Range.Bookmarks["wtr_cn"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["wtr_cn"];
                mark.Text = wtr_cn;
            }
            if (doc.Range.Bookmarks["wtr_en"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["wtr_en"];
                mark.Text = wtr_en;
            }
            #endregion
            string path = Server.MapPath("File_Zscq/" + sbnumber + "Power of Attorney.doc");
            doc.Save(path, SaveFormat.Doc); //保存为doc
            Response.Redirect("File_Zscq/" + sbnumber + "Power of Attorney.doc");
            //Replace("", "");
            //typedaochu = Request.QueryString["type"].ToString();      
            //    worldinfo = "商标代理委托书";        
            //    var iquery = DALT.Trademark_vw_Select_ById(trademarkId);
            //    Repeater1.DataSource = iquery;
            //    Repeater1.DataBind();
            //    if (iquery.Count() > 0)
            //    {
            //        foreach (var item in iquery)
            //        {
            //            if (item.i_JiaoFeiType != 0)
            //            {
            //                jiaofeitype = int.Parse(item.i_JiaoFeiType.ToString());
            //            }
            //        }
            //    }

        }
    }

    //public int i = 0;
    //private void OutPut(string fileType, string strType)
    //{
    //    i += 1;
    //    Response.Clear();
    //    Response.Buffer = true;
    //    Response.Charset = "gb2312"; 
    //    Response.AppendHeader("Content-Disposition", fileType);     
    //    Response.ContentEncoding = System.Text.Encoding.UTF8;
    //    Response.ContentType = strType;
    //    this.EnableViewState = true;
    //    System.IO.StringWriter swOut = new System.IO.StringWriter();
    //    HtmlTextWriter hTw = new HtmlTextWriter(swOut);
    //   // GridView1.RenderControl(hTw);
    //    Repeater1.RenderControl(hTw);
    //  // DataList1.RenderControl(hTw);
    //  // Response.Output.Write(hTw.ToString());
    //    Response.Write(swOut.ToString());
    //    Response.Flush();
    //    Response.End();
    //}
    //protected void Button_Click(object sender, CommandEventArgs e)
    //{
    //    NewMethod();
    //}

    //private void NewMethod()
    //{
    //    if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
    //    {
    //       int  trademarkId = int.Parse(Request.QueryString["id"].ToString());
    //       t_Trademark model = DALT.Trademark_Select_Id(trademarkId);
    //       if (model != null)
    //       {
    //           DateTime dt = DateTime.Now;
    //               worletitle = "商标代理委托书";
    //               OutPut("attachment;filename=" + model.nvc_SBRegNum + worletitle + ".doc", "application/ms-word");
    //       }
    //    }
    //}

    //public void Replace(string strOldText, string strNewText)
    //{
    //    try
    //    {
    //        Microsoft.Office.Interop.Word.Application app = new Microsoft.Office.Interop.Word.Application();
    //        object MissingValue = Type.Missing;
    //        object file = Server.MapPath("File_Zscq/sb_weituoshuTemp.doc");
    //        Microsoft.Office.Interop.Word.Document doc = app.Documents.Open(
    //            ref file, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue, ref MissingValue);
    //        //doc.Content.Find.Text = strOldText ;

    //        object FindText, ReplaceWith, Replace;// 
    //        string strold = "$weituoren$;$weituorenEn$;$address$;$addressEn$;$c_name$;$c_nameEn$;$c_Tel$;$c_TelEn$;$c_Youbian$;$c_YoubianEn$;$sb_regNum$;$sb_type$;$guoji$;$guojiEn$";
    //        string[] str_old = strold.Split(';');
    //        string strnew = str;
    //        string[] str_new = strnew.Split(';');
    //        for (int i = 0; i < str_old.Length; i++)
    //        {
    //            doc.Content.Find.Text = str_old[i];// strOldText ;
    //            FindText = str_old[i];// strOldText ;//要查找的文本
    //            ReplaceWith = str_new[i];// strNewText ;//替换文本
    //            Replace = Microsoft.Office.Interop.Word.WdReplace.wdReplaceAll;/**//*wdReplaceAll - 替换找到的所有项。
    //                                                  * wdReplaceNone - 不替换找到的任何项。
    //                                                * wdReplaceOne - 替换找到的第一项。
    //                                                * */
    //            doc.Content.Find.ClearFormatting();//移除Find的搜索文本和段落格式设置
    //            if (doc.Content.Find.Execute(
    //                ref FindText, ref MissingValue,
    //                ref MissingValue, ref MissingValue,
    //                ref MissingValue, ref MissingValue,
    //                ref MissingValue, ref MissingValue, ref MissingValue,
    //                ref ReplaceWith, ref Replace,
    //                ref MissingValue, ref MissingValue,
    //                ref MissingValue, ref MissingValue))
    //            {

    //            }
    //        }

    //        //doc.Save();
    //        object fn = (object)Server.MapPath("File_Zscq/" + sbnumber + "商标代理委托书.doc");
    //        doc.SaveAs(ref fn, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue,
    //            ref MissingValue, ref MissingValue, ref MissingValue, ref MissingValue);
    //        doc.Close(ref MissingValue, ref MissingValue, ref MissingValue);
    //        //关闭应用
    //        app.Quit(ref MissingValue, ref MissingValue, ref MissingValue);
    //        app = null;
    //        GC.Collect();
    //        Response.Redirect("File_Zscq/" + sbnumber + "商标代理委托书.doc");
    //    }
    //    catch (Exception e)
    //    {
    //        Response.Write(e.Message);
    //    }

    //}

}