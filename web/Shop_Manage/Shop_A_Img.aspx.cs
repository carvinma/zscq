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
using zscq.Model;
using zscq.DAL;
using zscq.BLL;

public partial class Shop_Manage_Shop_A_ProductImg : System.Web.UI.Page
{
    //dal_Product DALP = new dal_Product();
    //dal_Brand DALB = new dal_Brand();
    //dal_WebProductCategory DALWPC = new dal_WebProductCategory();
    public int width = 0;
    public int divwidth = 60;
    public int height = 0;
    public string ram = "仅支持上传“.jpg”，“.gif”，“.png”格式的图片";
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
        if (!IsPostBack)
        {
            Bind_Page_value();
            Bind_Page_Image();
        }

        if (Request.QueryString["width"] != null && Request.QueryString["width"].ToString() != "")
        {
            width = Convert.ToInt32(Request.QueryString["width"].ToString());
            Image1.Width = width;
            if (width == 0)
            {
                ram += "，图片宽自定义";
            }
            else
            {
                ram += "，图片宽" + width;
            }
            if (width > 60)
            {
                divwidth = width;
            }
        }
        if (Request.QueryString["height"] != null && Request.QueryString["height"].ToString() != "")
        {
            height = Convert.ToInt32(Request.QueryString["height"].ToString());
            Image1.Height = height;
            if (height == 0)
            {
                ram += "，图片高自定义";
            }
            else
            {
                ram += "，图片高" + height;
            }
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["sessionid"] != null && Request.QueryString["sessionid"].ToString() != "")
        {
            Hi_Session.Value = Request.QueryString["sessionid"].ToString();
        }
        else
        {
            Response.Write("参数缺失");
            Response.End();
        }
    }
    public void Bind_Page_Image()
    {
        //if (Request.QueryString["ttype"] != null && Request.QueryString["ttype"].ToString() != "")
        //{
        //    if (Request.QueryString["tid"] != null && Request.QueryString["tid"].ToString() != "")
        //    {
        //        int Id = int.Parse(Request.QueryString["tid"].ToString());
        //        string TType = Request.QueryString["ttype"].ToString();

        //        switch (TType)
        //        {
        //            case "brand":
        //                t_Brand BInfo = DALB.Brand_Select_Id(Id);
        //                if (BInfo != null)
        //                {
        //                    if (BInfo.nvc_Logo != null && BInfo.nvc_Logo != "")
        //                    {
        //                        Image1.ImageUrl = "../" + BInfo.nvc_Logo;
        //                        Session[Hi_Session.Value] = BInfo.nvc_Logo;
        //                    }
        //                }
        //                break;
        //        }
        //    }
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Upload(FileUpload1, Image1, "../pic_Other/", Hi_Session.Value);//Hi_LoadUrl
    }
    public void Upload(FileUpload FileUploadId, Image ImageId, string RootPath, string session)
    {
        if (FileUploadId.HasFile)
        {
            string fileName = FilesUpLoad.uploading(FileUploadId, RootPath);
            if (fileName.IndexOf('.') > -1)
            {
                ImageId.ImageUrl = RootPath + fileName;
                Session[session] = RootPath.Replace("../", "") + fileName;
            }
            else
            {
                div_a.InnerHtml = "<script>alert('" + fileName + "')</script>";
                return;
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('请选择图片！')</script>";
            return;
        }
    }
}
