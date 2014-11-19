using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;

public partial class zscq_sb_leftmenu : System.Web.UI.UserControl
{
    public string myurl = "";
    dal_SystemSetup DALS = new dal_SystemSetup();
    dal_UserGrade DALG = new dal_UserGrade();
    dal_Member DALM = new dal_Member();
    public string unumber = "";
    public string grade = "";
    public string grageImg = "";
    public string filename = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] == "")
        {
            Response.Redirect("Login.aspx?flag=sb&href=" + Request.Url.ToString());
        }
        else
        {
            int uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);
            string flag = Request.Cookies["hqhtshop"]["hqht_user_flag"].ToString();
            if (DALM.Member_Select_Id(uId, flag) == null)
            {
                Response.Redirect("index.aspx");
            }
            var model = DALM.Member_vw_Select_Id(uId);
            if (model != null)
            {
                unumber = model.nvc_UserNum;
                var g = DALG.UserGrade_Select_Id(model.i_Grade); ;
                grade = g.nvc_Name_jp;
                grageImg = g.nvc_Logo;
            }
        }
        get();
        string url = Request.Url.AbsolutePath.ToString().ToLower();
        if (url.IndexOf("jp/") > -1)
        {
            myurl = url.Substring((url.IndexOf("jp/") + 3), (url.IndexOf(".aspx") - url.IndexOf("jp/") - 3));
        }
        else
        {
            myurl = url.TrimStart('/').Replace(".aspx", "");
        }
    }
    public void get()
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        filename = model.nvc_SBBook_jp;
    }
    //public void ResponseFile(string path)
    //{

    //    string fileName = HttpContext.Current.Server.UrlEncode(path.Substring(path.LastIndexOf("/") + 1));
    //    try
    //    {
    //        FileInfo info = new FileInfo(HttpContext.Current.Server.MapPath(path));
    //        long fileSize = info.Length;
    //        Response.Clear();
    //        Response.ContentType = "application/x-zip-compressed";
    //        Response.AddHeader("Content-Disposition", "attachment;filename=" + Server.UrlEncode(fileName));

    //        //不指明Content-Length用Flush的话不会显示下载进度 
    //        Response.AddHeader("Content-Length", fileSize.ToString());
    //        Response.TransmitFile(path, 0, fileSize);
    //        Response.Flush();
    //        Response.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        MessageBox.Show(Page, "无法下载文件：" + fileName + ",由于：" + ex.Message + "");
    //    }
    //}
    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    t_SystemSetup model = DALS.SystemSetup_Select();
    //    ResponseFile(model.nvc_SBBook);
    //}
}