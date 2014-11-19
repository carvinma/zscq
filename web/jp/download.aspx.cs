using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

public partial class download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrWhiteSpace(Request.QueryString["filename"]))
            {
                SendStream(HttpUtility.UrlDecode(Request.QueryString["filename"], Encoding.UTF8).ToString());
            }
            else
            {
                Response.Write("ファイルダウンロードエラー！");
            }
        }
    }

    public void SendStream(string filepath)
    {
        try
        {
            string fullpath = Server.MapPath(filepath);//路径
            string name = Path.GetFileName(filepath);//客户端保存的文件名
            if (File.Exists(fullpath))
            {
                //以字符流的形式下载文件
                FileStream fs = new FileStream(fullpath, FileMode.Open);
                byte[] bytes = new byte[(int)fs.Length];
                fs.Read(bytes, 0, bytes.Length);
                fs.Close();
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.ContentType = "application/octet-stream";
                //通知浏览器下载文件而不是打开 
                Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(name, System.Text.Encoding.UTF8));
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }

        }
        catch
        {
            Response.Write("ファイルダウンロードエラー！");
        }
    }

}