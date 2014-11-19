using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.ComponentModel;
using System.Drawing;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.IO;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;

namespace zscq.BLL
{
    public class FilesUpLoad
    {
        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="fileUpload"></param>
        /// <returns></returns>
        public static string uploading(FileUpload fileUpload, string path)
        {
            string fileName = "";
            string fullFileName = fileUpload.PostedFile.FileName;
            if (!fullFileName.Equals(""))//判断文件是否为空
            {
                fileName = fullFileName.Substring(fullFileName.LastIndexOf("\\") + 1);
                string typeName = fullFileName.Substring(fullFileName.LastIndexOf(".") + 1);
                int index = fileName.LastIndexOf(".");
                string vstype = fileName.Substring(index).ToLower();//或取文件的扩展名
                string vsnewname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");//声称文件名，防止重复
                vsnewname = vsnewname + vstype;//完整的上传文件名

                string vsurl = System.Web.HttpContext.Current.Server.MapPath(path) + vsnewname;

                if (typeName.ToLower() != "jpg" && typeName.ToLower() != "bmp" && typeName.ToLower() != "gif" && typeName.ToLower() != "png" && typeName.ToLower() != "flv" && typeName.ToLower() != "swf")
                {
                    return "文件格式不正确";
                }
                else
                {
                    try
                    {
                        fileUpload.PostedFile.SaveAs(vsurl);
                        return vsnewname;
                    }
                    catch
                    {
                        return "上传失败";
                    }
                }
            }
            else
            {
                return "上传失败";
            }
        }
        /// <summary>
        /// 上传文件  （不限制格式）
        /// </summary>
        /// <param name="fileUpload"></param>
        /// <returns></returns>
        public static string uploadFile(FileUpload fileUpload)
        {
            string fileName = "";
            string fullFileName = fileUpload.PostedFile.FileName;
            if (!fullFileName.Equals(""))//判断文件是否为空
            {

                fileName = fullFileName.Substring(fullFileName.LastIndexOf("\\") + 1);
                string typeName = fullFileName.Substring(fullFileName.LastIndexOf(".") + 1);
                int index = fileName.LastIndexOf(".");
                string vstype = fileName.Substring(index).ToLower();//取文件的扩展名
                string vsnewname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");//声称文件名，防止重复
                vsnewname = vsnewname + vstype;//完整的上传文件名

                string vsurl = System.Web.HttpContext.Current.Server.MapPath("../file/") + vsnewname;

                try
                {
                    fileUpload.PostedFile.SaveAs(vsurl);
                    return vsnewname;
                }
                catch
                {
                    return "上传失败。";
                }
            }
            else
            {
                return "上传失败。";
            }
        }
        //gc.FillRectangle(tbBg, 0, 0, int_Width, int_Height); //填充为白色
        ///<summary>
        /// 生成缩略图
        /// </summary>
        /// <param name="originalImagePath">源图路径（物理路径）</param>
        /// <param name="thumbnailPath">缩略图路径（物理路径）</param>
        /// <param name="width">缩略图宽度</param>
        /// <param name="height">缩略图高度</param>
        /// <param name="mode">生成缩略图的方式</param>    
        public void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, string mode)
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
                case "A":
                    if (originalImage.Width / originalImage.Height >= width / height)
                    {
                        if (originalImage.Width > width)
                        {
                            towidth = width;
                            toheight = (originalImage.Height * width) / originalImage.Width;
                        }
                        else
                        {
                            towidth = originalImage.Width;
                            toheight = originalImage.Height;
                        }
                    }
                    else
                    {
                        if (originalImage.Height > height)
                        {
                            toheight = height;
                            towidth = (originalImage.Width * height) / originalImage.Height;
                        }
                        else
                        {
                            towidth = originalImage.Width;
                            toheight = originalImage.Height;
                        }
                    }
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
            g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.Half;
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;

            //清空画布并以透明背景色填充
            g.Clear(Color.Transparent);

            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(originalImage, new Rectangle(0, 0, towidth, toheight),
             new Rectangle(x, y, ow, oh),
             GraphicsUnit.Pixel);

            try
            {
                //以jpg格式保存缩略图
                bitmap.Save(System.Web.HttpContext.Current.Server.MapPath("file/" + DateTime.Now.ToString("yyyyMMddHHmmssffff") + ".jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);
                //outthumbnailPath=thumbnailPath;
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
        /// <summary>
        /// 截取字符串
        /// </summary>
        /// <param name="str"></param>
        /// <param name="intLength"></param>
        /// <returns></returns>
        public static string getString(string str, int intLength)
        {
            if (!string.IsNullOrEmpty(str))
            {
                string reValue = "";
                if (str.Length > intLength)
                {
                    reValue = str.Substring(0, intLength) + "...";
                }
                else
                {
                    reValue = str;
                }
                return reValue;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 截取字符串
        /// </summary>
        /// <param name="str"></param>
        /// <param name="intLength"></param>
        /// <returns></returns>
        public static string getString01(string str, int intLength)
        {
            if (!string.IsNullOrEmpty(str))
            {
                string reValue = "";
                if (str.Length > intLength)
                {
                    reValue = str.Substring(0, intLength);
                }
                else
                {
                    reValue = str;
                }
                return reValue;
            }
            else
            {
                return null;
            }
        }
    }
}
