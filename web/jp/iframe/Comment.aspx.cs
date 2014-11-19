using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using dskl.BLL;
using dskl.DAL;
using dskl.Model;
using System.Drawing;

public partial class iframe_Comment : System.Web.UI.Page
{
    dal_ProductGuigeContent DALPGC = new dal_ProductGuigeContent();
    public string smallpicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Small\\";
    //--------------------//
    bll_Comment BLLC = new bll_Comment();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Session["BigPic"] = "";
        }
        
        Bind_Page_Value();
    }
    void Bind_Page_Value()//绑定页面传值
    {
        if (Request.QueryString["pid"] != null
            && Request.QueryString["pid"].ToString() != ""
            && Request.QueryString["pid"].ToString() != "0"
            && Functions.IsNumber(Request.QueryString["pid"].ToString()))
        {
            Hi_PId.Value = Request.QueryString["pid"].ToString(); 
            //Hi_SessionName.Value = "picpc";
            //Hi_SessionNameMain.Value = "picpmain";
        }
        else
        {
            Response.Redirect("../Product.html");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int MemberId = Convert.ToInt32(Request.Cookies["dsklshop"]["userid"].ToString());
            int ProductId = Convert.ToInt32(Hi_PId.Value);
            int Fraction = Convert.ToInt32(Request.Form["t_start"].ToString());
            string _Content = t_content2.Value;
            string youdian = txt_youdian.Text;
            string quedian = txt_quedian.Text;
            string bigpic = Session["BigPic"].ToString();
            string smallpic = "";
            switch (BLLC.Comment_Add(Fraction, MemberId, ProductId, _Content,youdian,quedian,bigpic,smallpic))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('事故の発生!');window.parent.addcommentdivhidden();</script>";
                    break;
                case 1:
                    div_a.InnerHtml = "<script>alert('评价成功!');window.parent.addcommentdivhidden();if(window.parent.obj('Hi_MemberId')){window.parent.location='../Member_Comment.aspx';}</script>";
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('您未购买过该商品，不能进行评价!');window.parent.addcommentdivhidden();</script>";
                    break;
                case 3:
                    div_a.InnerHtml = "<script>alert('每次购买的商品只能评价一次，您在以前的交易中已经评价过，若要再次评价，请再次购买该商品!');window.parent.addcommentdivhidden();</script>";
                    break;
            }
        }
        catch 
        {
            div_a.InnerHtml = "<script>alert('事故の発生!');window.parent.addcommentdivhidden();</script>";
        }
       
    }

    //------------------//
    
    void Bind_Rpt_Pic()
    {
        DataTable dt_Related = new DataTable();
        dt_Related.Columns.Add("pic");
        dt_Related.Columns.Add("pickey");
        if (Session["BigPic"] != null)
        {
            string[] peitao = Session["BigPic"].ToString().Split(';');

            for (int i = 0; i < peitao.Length; i++)
            {
                try
                {
                    if (peitao[i] != "")
                    {
                        DataRow row = dt_Related.NewRow();
                        row["pic"] = peitao[i];
                        string twourl = System.Web.HttpUtility.UrlEncode(peitao[i], System.Text.Encoding.GetEncoding("gb2312"));
                        row["pickey"] = twourl;
                        dt_Related.Rows.Add(row);
                    }
                }
                catch { }
            }
        }
        Rpt_Pic.DataSource = dt_Related;
        Rpt_Pic.DataBind();
    }
    protected void Rpt_Pic_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandArgument != null && e.CommandArgument.ToString() != "")
            {
                string pics = Session["BigPic"].ToString();
                string tid = System.Web.HttpUtility.UrlDecode(e.CommandArgument.ToString(), System.Text.Encoding.GetEncoding("gb2312"));
                pics = pics.Replace(";" + tid, "");
                Session["BigPic"] = pics;
                Bind_Rpt_Pic();
            }
        }
        catch { }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string fileNameExt = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
        if (fileNameExt != ".jpg" && fileNameExt != ".png" && fileNameExt != ".gif")
        {
            div_a.InnerHtml = "<script>alert('文件格式仅限(.jpg  .png  .gif)!')</script>";
            return;
        }
        string toFileName = DateTime.Now.ToString("yyyyMMddHHmmssff") + new Random().Next(100);
        string path = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Big\\" + toFileName + fileNameExt;
        FileUpload1.SaveAs(path);
        string pics = "";
        if (Session["BigPic"] != null)
        {
            pics = Session["BigPic"].ToString();
        }
        pics += ";pic_Big/" + toFileName + fileNameExt;
        Session["BigPic"] = pics;
        Bind_Rpt_Pic();

       

        //System.Drawing.Image originalImage = System.Drawing.Image.FromFile(path);
        //int ow = originalImage.Width;
        //int oh = originalImage.Height;
        //if (ow == oh)
        //{
        //    MakeThumbnail(path, smallpicpath + toFileName + fileNameExt, 90, 90, "Cut");
        //}
        //else
        //{
        //    decimal l = 180M / Convert.ToDecimal(ow);
        //    int nh = Convert.ToInt32(Math.Round(Convert.ToDecimal(oh) * l));
        //    int nh3 = Convert.ToInt32(Math.Round((Convert.ToDecimal(oh) * l) / 3));
        //    MakeThumbnail(path, smallpicpath + toFileName + fileNameExt, 90, nh3, "Cut");
        //}

        //Session[Hi_SessionNameMain.Value] = toFileName + fileNameExt;
        //string smallPics = "";
        //if (Session[Hi_SessionNameMain.Value] != null)
        //{
        //    smallPics = Session[Hi_SessionNameMain.Value].ToString();
        //}
        //smallPics += ";pic_Small/" + toFileName + fileNameExt;
        //Session[Hi_SessionNameMain.Value] = smallPics;

    }

    public static void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, string mode)
    {

        System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

        int towidth = width;
        int toheight = height;

        int x = 0;
        int y = 0;
        int ow = originalImage.Width;
        int oh = originalImage.Height;

        switch (mode)
        {
            case "HW"://指定高宽缩放（可能变形）                
                break;
            case "W"://指定宽，高按比例                    
                toheight = originalImage.Height * width / originalImage.Width;
                break;
            case "H"://指定高，宽按比例
                towidth = originalImage.Width * height / originalImage.Height;
                break;
            case "Cut"://指定高宽裁减（不变形）                
                if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                {
                    oh = originalImage.Height;
                    ow = originalImage.Height * towidth / toheight;
                    y = 0;
                    x = (originalImage.Width - ow) / 2;
                }
                else
                {
                    ow = originalImage.Width;
                    oh = originalImage.Width * height / towidth;
                    x = 0;
                    y = (originalImage.Height - oh) / 2;
                }
                break;
            default:
                break;
        }
        //新建一个bmp图片
        System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

        //新建一个画板
        Graphics g = System.Drawing.Graphics.FromImage(bitmap);

        //设置高质量插值法
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

        //设置高质量,低速度呈现平滑程度
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

        //清空画布并以透明背景色填充
        g.Clear(Color.Transparent);

        //在指定位置并且按指定大小绘制原图片的指定部分
        g.DrawImage(originalImage, new Rectangle(0, 0, towidth, toheight),
            new Rectangle(x, y, ow, oh),
            GraphicsUnit.Pixel);

        try
        {
            //以jpg格式保存缩略图
            bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        catch (System.Exception e)
        {
            throw e;
        }
        finally
        {
            originalImage.Dispose();
            bitmap.Dispose();
            g.Dispose();
        }
    }
}
