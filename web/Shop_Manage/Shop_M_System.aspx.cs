using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
using System.IO;
public partial class Shop_Manage_shop_upsystem : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(0, 0);
    public bool pageupdate = Manager.GetManagerQX(0, 2);
    dal_SystemSetup DALS = new dal_SystemSetup();
    public string sbbook = "", zlbook = "", shopbook = "", viewsbook="";
    public string sbbook_en = "", zlbook_en = "", viewsbook_en = "";
    public string sbbook_kr = "", zlbook_kr = "", viewsbook_kr = "";
    public string sbbook_jp = "", zlbook_jp = "", viewsbook_jp = "";

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
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Info()
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        dlname.Text = model.nvc_DLName;
        dltel.Text = model.nvc_DLTel;
        dlchuanzhen.Text = model.nvc_DLFaxNumber;
        text_cnname.Value = model.nvc_DLCNName;
        text_enname.Value = model.nvc_DLENName;
        t_youjifee.Text = model.dm_YouJIFee.ToString();
        if (!string.IsNullOrWhiteSpace(model.nvc_ZLBook))
        {
            zlbook = "<a href='../" + model.nvc_ZLBook + "' title='点击查看'>已上传专利说明书</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_SBBook))
        {
            sbbook = "<a href='../" + model.nvc_SBBook + "' title='点击查看'>已上传商标说明书</a>";
        }
        
        if (!string.IsNullOrWhiteSpace(model.nvc_ShopBook))
        {
            shopbook = "<a href='../" + model.nvc_ShopBook + "' title='点击查看'>已上传商城说明书</a>";
        }
        
        if (!string.IsNullOrWhiteSpace(model.nvc_ZLBook_en))
        {
            zlbook_en = "<a href='../" + model.nvc_ZLBook_en + "' title='点击查看'>已上传专利说明书</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_SBBook_en))
        {
            sbbook_en = "<a href='../" + model.nvc_SBBook_en + "' title='点击查看'>已上传商标说明书</a>";
        }

        if (!string.IsNullOrWhiteSpace(model.nvc_ZLBook_kr))
        {
            zlbook_kr = "<a href='../" + model.nvc_ZLBook_kr + "' title='点击查看'>已上传专利说明书</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_SBBook_kr))
        {
            sbbook_kr = "<a href='../" + model.nvc_SBBook_kr + "' title='点击查看'>已上传商标说明书</a>";
        }

        if (!string.IsNullOrWhiteSpace(model.nvc_ZLBook_jp))
        {
            zlbook_jp = "<a href='../" + model.nvc_ZLBook_jp + "' title='点击查看'>已上传专利说明书</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_SBBook_jp))
        {
            sbbook_jp = "<a href='../" + model.nvc_SBBook_jp + "' title='点击查看'>已上传商标说明书</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_ViewsBook))
        {
            viewsbook = "<a href='../" + model.nvc_ViewsBook + "' title='点击查看'>已上传浏览器操作说明</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_ViewsBook_en))
        {
            viewsbook_en = "<a href='../" + model.nvc_ViewsBook_en + "' title='点击查看'>已上传浏览器操作说明</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_ViewsBook_kr))
        {
            viewsbook_kr = "<a href='../" + model.nvc_ViewsBook_kr + "' title='点击查看'>已上传浏览器操作说明</a>";
        }
        if (!string.IsNullOrWhiteSpace(model.nvc_ViewsBook_jp))
        {
            viewsbook_jp = "<a href='../" + model.nvc_ViewsBook_jp + "' title='点击查看'>已上传浏览器操作说明</a>";
        }
        //cb_Jifen.Checked = model.i_Jifen == 1 ? true : false;
        //text_bilv.Value = model.i_Jifenbilv.ToString();

        //cb_please.Checked = model.i_Please == 1 ? true : false;
        //text_pleasejifen.Value = model.i_PleaseJifen.ToString();
        //text_regjifen.Value = model.i_RegJifen.ToString();
        //text_commentjifen.Value = model.i_CommentJifen.ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        model.nvc_DLName = dlname.Text;
        model.nvc_DLTel = dltel.Text;
        model.nvc_DLFaxNumber = dlchuanzhen.Text;
        model.nvc_DLCNName = text_cnname.Value;
        model.nvc_DLENName = text_enname.Value;

        try
        {
            model.dm_YouJIFee = decimal.Parse(t_youjifee.Text);
        }
        catch
        {
            model.dm_YouJIFee = 0;
        }
        //try
        //{
        //    model.i_Jifenbilv = Convert.ToInt32(text_bilv.Value);
        //}
        //catch { }
        //model.i_Jifen = cb_Jifen.Checked ? 1 : 0;
        //model.i_Please = cb_please.Checked ? 1 : 0;
        //try
        //{
        //    model.i_PleaseJifen = Convert.ToInt32(text_pleasejifen.Value);
        //}
        //catch { }
        //try
        //{
        //    model.i_RegJifen = Convert.ToInt32(text_regjifen.Value);
        //}
        //catch { }
        //try
        //{
        //    model.i_CommentJifen = Convert.ToInt32(text_commentjifen.Value);
        //}
        //catch { }

        if (DALS.SystemSetup_Submit() > 0)
        {
            Manager.AddLog(0, "系统管理", "修改了系统设置");
            div_a.InnerHtml = "<script>alert('修改成功');window.location='" + Request.Url.ToString() + "'</script>";
        }

    }


    public void UpfileLoad(FileUpload fileup, int filetype, string language, string filename)
    {
        string fileNameExt = Path.GetExtension(fileup.FileName).ToLower();
        if (fileNameExt == ".doc" || fileNameExt == ".pdf")
        {
            if (fileup.HasFile)
            {
                if (fileup.PostedFile.ContentLength < 1024 * 1024 * 5)
                {
                    fileup.SaveAs(Server.MapPath("../FileLoad/") + language + "/" + filename + fileNameExt);
                    UpdateInfo(filetype, language, "FileLoad/" + language + "/" + filename + fileNameExt);
                }
                else
                {
                    div_a.InnerHtml = "<script>alert('文件大小不能超过5MB');</script>";
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('请选择你要上传的文件');</script>";
            }
        }
        else
        {
            div_a.InnerHtml = "<script>alert('文件格式不对');</script>";
        }
        Bind_Page_Info();
    }

    public void UpdateInfo(int filetype, string language, string filename) 
    {
        t_SystemSetup model = DALS.SystemSetup_Select();
        if (filetype == 1)
        {
            #region 专利
            switch (language)
            {
                case "cn":
                    model.nvc_ZLBook = filename;
                    break;
                case "en":
                    model.nvc_ZLBook_en = filename;
                    break;
                case "kr":
                    model.nvc_ZLBook_kr = filename;
                    break;
                case "jp":
                    model.nvc_ZLBook_jp = filename;
                    break;
            }
            #endregion
        }
        if (filetype == 2)
        {
            #region 商标
            switch (language)
            {
                case "cn":
                    model.nvc_SBBook = filename;
                    break;
                case "en":
                    model.nvc_SBBook_en = filename;
                    break;
                case "kr":
                    model.nvc_SBBook_kr = filename;
                    break;
                case "jp":
                    model.nvc_SBBook_jp = filename;
                    break;
            }

            #endregion
        }
        if (filetype == 3)
        {
            #region 浏览器操作说明
            switch (language)
            {
                case "cn":
                    model.nvc_ViewsBook = filename;
                    break;
                case "en":
                    model.nvc_ViewsBook_en = filename;
                    break;
                case "kr":
                    model.nvc_ViewsBook_kr = filename;
                    break;
                case "jp":
                    model.nvc_ViewsBook_jp = filename;
                    break;
            }

            #endregion
        }

        //if (filetype == 3)
        //{
        //    if (model.nvc_ShopBook != null)
        //    {
        //        DelPhoto.DeleteFile(model.nvc_ShopBook);
        //    }
        //    model.nvc_ShopBook = filename;
        //} 
        if (DALS.SystemSetup_Submit() > 0)
        {
            div_a.InnerHtml = "<script>alert('文件上传成功！'); </script>";
        }
        else
        {
            div_a.InnerHtml = "<script>alert('文件上传失败！');</script>";
        }
    }

    protected void btn_zl_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_zl, 1, "cn", "专利系统使用说明书");//1 专利
    }
    protected void btn_sb_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_sb, 2, "cn", "商标系统使用说明书");//2商标
    }
    protected void btn_views_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_views, 3, "cn", "浏览器操作说明");//2商标
    }
    protected void btn_zl_en_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_zl_en, 1, "en", "User manual of system of patent annuity fee");//1 专利
    }
    protected void btn_sb_en_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_sb_en, 2, "en", "User manual of system of trademark maintenance");//2商标
    }
    protected void btn_views_en_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_views_en, 3, "en", "The browser operating instructions");//2商标
    }
    protected void btn_zl_kr_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_zl_kr, 1, "kr", "특허 시스템 사용설명");//1 专利
    }
    protected void btn_sb_kr_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_sb_kr, 2, "kr", "상표 시스템 사용설명");//2商标
    }
    protected void btn_views_kr_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_views_kr, 3, "kr", "브라우저 조작설명");//2商标
    }
    protected void btn_zl_jp_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_zl_jp, 1, "jp", "特許システム使用説明");//1 专利
    }
    protected void btn_sb_jp_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_sb_jp, 2, "jp", "商標システム使用説明");//2商标
    }
    protected void btn_views_jp_Click(object sender, EventArgs e)
    {
        UpfileLoad(fup_views_jp, 3, "jp", "ブラウザ操作説明");//2商标
    }

}