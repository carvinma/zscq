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
    
 
    public string returnurl = "";
   public int trademarkId =0;
    public string worletitle = "";
    public int jiaofeitype = 0;
    public int fileurl = 0;
    public int fileword = 0;
    public int miaoshutype = 0; public string str = "", sbnumber = "", sbtype = "", sb_red="";
    dal_Trademark DAL = new dal_Trademark();
    public string typedaochu = "0",worldinfo="";
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
          // NewMethod();
        }
       
    }
    //public void Bind_Page_Type()// 绑定page面信息
    //{
    //    if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
    //    {
    //    trademarkId = int.Parse(Request.QueryString["id"].ToString());

    //    typedaochu = Request.QueryString["type"].ToString();
    //        worldinfo = "商标续展注册申请书";
    //        var iquery = DALT.Trademark_vw_Select_ById(trademarkId);        
    //      DataList1.DataSource = iquery;
    //        DataList1.DataBind();
    //        if (iquery.Count() > 0)
    //        {
    //            foreach (var item in iquery)
    //            {
    //                if (item.i_JiaoFeiType != 0)
    //                {
    //                    jiaofeitype = int.Parse(item.i_JiaoFeiType.ToString());
    //                }
    //            }
    //        }
    //    }
    //}

    public void Bind_Page_Type()// 绑定page面信息
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
                    sbtype = item.nvc_SBType;
                    
                    if (item.i_UserTypeId == 1)
                    {
                        sb_red = "(" + item.nvc_IDCard + ")";
                    }
                        str = item.nvc_SBRegName + ";";
                    
                    str = str + item.nvc_SBRegAddress + ";";
                    if (item.nvc_SBPostcode != null)
                    {
                        str = str + item.nvc_SBPostcode + ";";
                    }
                    else
                    {
                        str = str + " " + ";";
                    }

                    if (Request.QueryString["zixing"] != null)
                    {
                        if (Request.QueryString["zixing"] != "")
                        {
                            string info =Request.QueryString["zixing"].ToString();
                            if (info == "ok")
                            {
                                str = str + item.nvc_RealName + ";";
                                str = str + item.nvc_TelPhone + ";";
                                str = str + item.nvc_FaxNumber + ";";
                                str = str + item.nvc_DaiLiName + ";";
                            }
                            else
                            {
                                MessageBox.ShowAndRedirect(this.Page, "Data abnormal...","user_sblb.aspx"); 
                            }
                        }
                    }
                    else
                    {
                        str = str + item.nvc_DLName + ";";
                        str = str + item.nvc_DLTel + ";";
                        str = str + item.nvc_DLFaxnumber + ";";
                        str = str + item.nvc_DLZuzhiName + ";";
                    }
                }
            }
            #endregion
            #region
            string tmppath = Server.MapPath("File_Zscq/sb_shenqingshuTemp.doc");
            Document doc = new Document(tmppath); //载入模板 
            if (doc.Range.Bookmarks["sb_name"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_name"];
                mark.Text = str.Split(';')[0];
            }
            if (doc.Range.Bookmarks["sb_nameAddress"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_nameAddress"];
                mark.Text = str.Split(';')[1];
            }
            if (doc.Range.Bookmarks["sb_nameyoubian"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_nameyoubian"];
                mark.Text = str.Split(';')[2];
            }           
            if (doc.Range.Bookmarks["c_name"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_name"];
                mark.Text = str.Split(';')[3];
                
            }         
            if (doc.Range.Bookmarks["c_Tel"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_Tel"];
                mark.Text = str.Split(';')[4];
            }
            if (doc.Range.Bookmarks["c_chuanzhen"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["c_chuanzhen"];
                mark.Text = str.Split(';')[5];
            }
            if (doc.Range.Bookmarks["sb_dailizuzhi"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_dailizuzhi"];
                mark.Text = str.Split(';')[6];
            }
            if (doc.Range.Bookmarks["sb_regNum"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_regNum"];
                mark.Text = sbnumber;
            }
            if (doc.Range.Bookmarks["sb_type"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_type"];
                mark.Text = sbtype;
            }
            if (doc.Range.Bookmarks["sb_red"] != null)
            {
                Bookmark mark = doc.Range.Bookmarks["sb_red"];
                mark.Text = sb_red;
            }    
            #endregion
            string path = Server.MapPath("File_Zscq/" + sbnumber + "Renewal application of registered Trademark.doc");
            doc.Save(path, SaveFormat.Doc); //保存为doc
            Response.Redirect("File_Zscq/" + sbnumber + "Renewal application of registered Trademark.doc"); 
        }
    }

    public int i = 0;
    private void OutPut(string fileType, string strType)
    {
        i += 1;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312"; 
        Response.AppendHeader("Content-Disposition", fileType);     
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = strType;
        this.EnableViewState = true;
        System.IO.StringWriter swOut = new System.IO.StringWriter();
        HtmlTextWriter hTw = new HtmlTextWriter(swOut);
       // GridView1.RenderControl(hTw);
       DataList1.RenderControl(hTw);
      // Response.Output.Write(hTw.ToString());
        Response.Write(swOut.ToString());
        Response.Flush();
        Response.End();
    }
    protected void Button_Click(object sender, CommandEventArgs e)
    {
        NewMethod();
    }

    private void NewMethod()
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
           int  trademarkId = int.Parse(Request.QueryString["id"].ToString());
           t_Trademark model = DALT.Trademark_Select_Id(trademarkId);
           if (model != null)
           {
               DateTime dt = DateTime.Now;
               if (typedaochu == "3")
               {
                   worletitle = "商标注册申请书";

                   OutPut("attachment;filename=" + model.nvc_SBRegNum+ worletitle + ".doc", "application/ms-word");
               }
           }
        }
    }
}