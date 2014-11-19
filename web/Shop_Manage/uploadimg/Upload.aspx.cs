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
using System.IO;
using System.Security.AccessControl;
using System.Drawing;

public partial class Shop_Manage_uploadimg_Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpFileCollection files = Request.Files;
        if (files.Count == 0)
        {
            Response.Write("请勿直接访问本文件");
            Response.End();
        }
        HttpPostedFile file = files[0];
        DataTable dt = (DataTable)Session["photos"];
        if (file != null)
        {
            string filename = DateTime.Now.ToString("yyMMddhhmmss") + new Random().Next(99999999).ToString() + ".png";
            string filepath = "../../pic_Big/" + filename;
            DataRow dr = dt.NewRow();
            dr[0] = filename.Trim();
            dr[1] = "1";
            dr[2] = "../pic_Big/" + filename;
            dt.Rows.Add(dr);
            Session["photos"] = dt;

            SetWH(400, 600, file, Server.MapPath(filepath));
        }
    }
    public static void SetWH(int with, int height, string sourcepath, string savepath)
    {
        System.Drawing.Image img = System.Drawing.Bitmap.FromFile(sourcepath);
        int tempwith = 0, tempheight = 0;
        int sourcewith = img.Width;
        int sourceheight = img.Height;

        double sourcebl = sourcewith * 1.000 / sourceheight;

        if (sourceheight >= sourcewith)
        {
            if (sourceheight > height)
            {
                tempheight = height;
                tempwith = Convert.ToInt32(sourcebl * height);
            }
            else if (sourcewith > with)
            {
                tempwith = with;
                tempheight = Convert.ToInt32(with / sourcebl);
            }
            else
            {
                tempheight = sourceheight;
                tempwith = sourcewith;
            }
        }
        else
        {
            if (sourcewith > with)
            {
                tempwith = with;
                tempheight = Convert.ToInt32(with / sourcebl);
            }
            else if (sourceheight > height)
            {
                tempheight = height;
                tempwith = Convert.ToInt32(sourcebl * height);
            }
            else
            {
                tempheight = sourceheight;
                tempwith = sourcewith;
            }
        }

        Bitmap bt = new Bitmap(img, new Size(tempwith, tempheight));

        bt.Save(savepath);
        bt.Dispose();
    }
    public static void SetWH(int with, int height, HttpPostedFile file, string savepath)
    {
        Stream stream = file.InputStream;
        long n = stream.Length;
        byte[] ss = new byte[1024];
        int k = 0;
        while (true)
        {
            long temp = n - k * 1024;
            if (temp < 1024)
            {
                stream.Read(ss, 0, int.Parse(n.ToString()));
                break;
            }
            stream.Read(ss, 0, 1024);
            k++;
        }
        System.Drawing.Image img = System.Drawing.Bitmap.FromStream(stream);
        stream.Close();
        stream.Dispose();
        int tempwith = 0, tempheight = 0;
        int sourcewith = img.Width;
        int sourceheight = img.Height;

        double sourcebl = sourcewith * 1.000 / sourceheight;
        if (sourceheight >= sourcewith)
        {
            if (sourceheight > height)
            {
                tempheight = height;
                tempwith = Convert.ToInt32(sourcebl * height);
            }
            else if (sourcewith > with)
            {
                tempwith = with;
                tempheight = Convert.ToInt32(with / sourcebl);
            }
            else
            {
                tempheight = sourceheight;
                tempwith = sourcewith;
            }

        }
        else
        {
            if (sourcewith > with)
            {
                tempwith = with;
                tempheight = Convert.ToInt32(with / sourcebl);
            }
            else if (sourceheight > height)
            {
                tempheight = height;
                tempwith = Convert.ToInt32(sourcebl * height);
            }
            else
            {
                tempheight = sourceheight;
                tempwith = sourcewith;
            }
        }

        Bitmap bt = new Bitmap(img, new Size(tempwith, tempheight));

        bt.Save(savepath);
    }
}
