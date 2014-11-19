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

public partial class Shop_A_FileExPic : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(65, 0);
    public bool pageadd = Manager.GetManagerQX(65, 1);
    public bool pageupdate = Manager.GetManagerQX(65, 2);

    dal_FileExPic DALFP = new dal_FileExPic();

    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }

        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        if (!IsPostBack)
        {
            Bind_FilePic();
        }
    }

    public void Bind_FilePic()
    {
        if (Request.QueryString["Gid"] != null && Request.QueryString["Gid"] != "")
        {
            t_FileExPic model = DALFP.FileExPic_Select_Id(int.Parse(Request.QueryString["Gid"].ToString()));
            if (model != null)
            {
                text_Name.Value = model.nvc_FileExtensions;
                HiLogo.Value = model.nvc_Pic;
                HiId.Value = model.i_Id.ToString();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        t_FileExPic model = new t_FileExPic();
        model.nvc_FileExtensions = text_Name.Value;

        string filePath = FilesUpLoad.uploading(this.FileUpload1, "../pic_Files/");
        if (FileUpload1.HasFile)
        {
            model.nvc_Pic = "pic_Files/" + filePath;
        }
        else
        {
            model.nvc_Pic = HiLogo.Value;
        }
        if (HiId.Value == "0")
        {
            int ret = DALFP.FileExPic_Add(model);
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
                return;
            }
            else
            {
                Manager.AddLog(0, "文件图标管理", "添加了文件图标[ <font color=\"red\">" + text_Name.Value + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_FileExPic.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=文件图标&hreftype=1&href1=Shop_A_FileExPic.aspx&href2=" + twourl);
            }
        }
        else
        {
            model.i_Id = int.Parse(HiId.Value);
            int ret = DALFP.FileExPic_Update(model);
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
                return;
            }
            else
            {
                Manager.AddLog(0, "文件图标管理", "修改了文件图标[ <font color=\"red\">" + text_Name.Value + "</font> ]的信息");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_FileExPic.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=文件图标&hreftype=2&href1=Shop_A_FileExPic.aspx&href2=" + twourl);
            }
        }
    }
}
