using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.IO;

public partial class Shop_Manage_Link_AddLink : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(64, 0);
    public bool pageadd = Manager.GetManagerQX(64, 1);
    public bool pageupdate = Manager.GetManagerQX(64, 2);
    string val = "";
    public string returnurl = "";
    dal_FileExPic DALFP = new dal_FileExPic();
    dal_Files DALF = new dal_Files();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_DDL_TB();
            Bind_Page_Info();
        }
    }
    void Bind_DDL_TB()
    {
        var iquery = DALFP.FileExPic_Select_All();
        foreach (var v in iquery)
        {
            DDL_TB.Items.Add(new ListItem(v.nvc_FileExtensions, v.nvc_Pic + "$$$" + v.i_Id.ToString()));
        }
    }
    void Bind_Page_Info()
    {
        if (Request.QueryString["uid"] != null && Request.QueryString["uid"].ToString() != "")
        {
            Hi_Id.Value = Request.QueryString["uid"];
            int Id = int.Parse(Request.QueryString["uid"].ToString());
            vw_Files model = DALF.vwFiles_Select_Id(Id);
            ddl_language.SelectedValue = model.nvc_Language;
            tborderby.Text = model.i_Order.ToString();
            tbfilename.Text = model.nvc_FileName;
            ddl_CType.SelectedValue = model.i_TypeId.ToString();
            DDL_TB.SelectedValue = model.nvc_Pic + "$$$" + model.i_PicId.ToString();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            t_Files model = new t_Files();
            if (Hi_Id.Value != "0")
            {
                model = DALF.Files_Select_Id(Convert.ToInt32(Hi_Id.Value));
            }
            else
            {
                if (!FileUpload1.HasFile)
                {
                    Label1.Text = "请选择文件！"; return;
                }
            }
            if (FileUpload1.HasFile)
            {
                string fname = FileUpload1.FileName.ToLower();
                string exname = Path.GetExtension(FileUpload1.FileName);

                if (!DDL_TB.SelectedItem.Text.Contains(exname))
                {
                    Label1.Text = "文件类型错误"; return;
                }
                if (FileUpload1.PostedFile.ContentLength > 1024 * 1024 * 2)
                {
                    Label1.Text = "文件大小不能超过2MB"; return;
                }
                model.i_FileSize = FileUpload1.PostedFile.ContentLength;//单位B
                model.nvc_FilePath = "Upload_Files/" + fname;
                FileUpload1.PostedFile.SaveAs(MapPath("../Upload_Files/") + fname);
            }
            model.nvc_Language = ddl_language.SelectedValue;
            model.i_Order = tborderby.Text.GetInt();
            model.dt_AddTime = DateTime.Now;
            model.i_TypeId = ddl_CType.SelectedValue.GetInt();
            model.nvc_FileName = tbfilename.Text.RemoveUnSafe();
            model.i_PicId = int.Parse(DDL_TB.SelectedValue.Split(new string[1] { "$$$" }, StringSplitOptions.RemoveEmptyEntries)[1]);
            if (Hi_Id.Value != "0")
            {
                DALF.Files_Update(model);
                Manager.AddLog(0, "文件管理", "修改了文件[ <font color=\"red\">" + tbfilename.Text + "</font> ]");
            }
            else
            {
                DALF.Files_Add(model);
                Manager.AddLog(0, "文件管理", "添加了文件[ <font color=\"red\">" + tbfilename.Text + "</font> ]");
            }
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Files.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=文件&hreftype=2&href1=Shop_A_Files.aspx&href2=" + twourl);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(Page, this.Page.GetType(), "msg", "<script>alert('数据异常!');</script>", false);
        }
    }

}
