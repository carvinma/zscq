using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Shop_Manage_Shop_A_IntegralProduct_Img : System.Web.UI.Page
{
    public string bigpicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Big\\";
    public string smallpicpath = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Small\\";
    public bool pageview = Manager.GetManagerQX(30, 0);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        div_a.InnerHtml = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string fileNameExt = System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName).ToLower();
        if (fileNameExt != ".jpg" && fileNameExt != ".png" && fileNameExt != ".gif")
        {
            div_a.InnerHtml = "<script>alert('文件格式仅限(.jpg  .png  .gif)!')</script>";
            return;
        }
        string toFileName = DateTime.Now.ToString("yyyyMMddHHmmssff") + new Random().Next(100);
        string path = System.AppDomain.CurrentDomain.BaseDirectory + "pic_Product\\" + toFileName + fileNameExt;

        FileUpload2.SaveAs(path);

        MakeThumbnail(path, smallpicpath + toFileName + fileNameExt, 171, 171, "Cut");
        MakeThumbnail(path, bigpicpath + toFileName + fileNameExt, 260, 260, "Cut");
        Image2.ImageUrl = "~/pic_Big/" + toFileName + fileNameExt;
        Hi_Value.Value = toFileName + fileNameExt;
        div_a.InnerHtml = "<script>onsuccess()</script>";
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