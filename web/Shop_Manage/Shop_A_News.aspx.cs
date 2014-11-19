using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;
using System.Text;
using System.IO;
using System.Configuration;
public partial class Shop_Manage_shop_addnews : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(60, 0);
    public bool pageadd = Manager.GetManagerQX(60, 1);
    public bool pageupdate = Manager.GetManagerQX(60, 2);
    dal_News DALN = new dal_News();
    dal_NewsType DALNT = new dal_NewsType();
    public string PageType = "添加新闻";
    public StringBuilder img_color = new StringBuilder();
    public string content = "";
    public string returnurl = "";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    void Bind_DDL_Category(int parentid, int count)
    {
        if (count == 0)
        {
            this.DDL_Type.Items.Add(new ListItem("请选择分类", ""));
        }
        var queryable = DALNT.NewsType_SelectAll(parentid, ddl_language.SelectedValue);
        foreach (var q in queryable)
        {
            ListItem li = new ListItem(HttpUtility.HtmlDecode(MakeFelgefu(count)) + q.nvc_Name, q.i_Id.ToString());
            this.DDL_Type.Items.Add(li);
            Bind_DDL_Category(q.i_Id, count + 1);
        }
    }
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "|—";
        }
        else
        {
            for (int i = 0; i < count; i++)
            {
                Returnwords += "&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            Returnwords += "|—";
        }
        return Returnwords;
    }
    public void Bind_Page_Info()//新闻内容绑定
    {
        LanguageConfig.BindLanguage(ddl_language);
        if (Request.QueryString["id"] != null)
        {
            PageType = "修改新闻";
            hd.Value = Request.QueryString["id"].ToString();
            t_News model = DALN.News_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                ddl_language.SelectedValue = model.nvc_Language;
                this.DDL_Type.Items.Clear();
                Bind_DDL_Category(0, 0);
                DDL_Type.SelectedValue = model.i_NewsTypeId.ToString();
                //Hi_Color.Value = model.i_TitleColorId.ToString();
                news_title.Value = model.nvc_Title;
                //news_title2.Value = model.nvc_SubTitle;
                text_Orderby.Value = model.i_OrderBy.ToString();
                text_Views.Value = model.i_Views.ToString();
                DDL_Type.SelectedValue = model.i_NewsTypeId.ToString();
                cb_Recomment.Checked = model.i_Show == 1 ? true : false;
                Newdate.Value = (Convert.ToDateTime(model.dt_AddTime.ToString())).ToString("yyyy-MM-dd");
                if (string.IsNullOrWhiteSpace(model.nvc_TitlePhoto))
                {
                    imgTitle.Src = "images/zwtp.gif";
                }
                else
                {
                    imgTitle.Src = "../" + model.nvc_TitlePhoto;
                }
                //imgFile.Src = "../" + model.nvc_FilePhoto;
                //ipt_filesrc.Value = model.nvc_FileLink;
                content = model.nt_Content;
                text_Link.Value = model.nvc_TitleLink;
                TB_WebTitle.Text = model.nvc_PageTitle;
                news_keyword.Value = model.nvc_PageKeywords;
                news_content2.Value = model.nvc_PageDescription;
            }
        }
        else
        {
            this.DDL_Type.Items.Clear();
            Bind_DDL_Category(0, 0);
        }
    }
    protected void btOK_Click(object sender, EventArgs e)// 添加新闻
    {
        try
        {
            t_News model = new t_News();
            if (hd.Value != "0")
            {
                model = DALN.News_Select_Id(Convert.ToInt32(hd.Value));
            }
            //try
            //{
            //    model.i_TitleColorId = int.Parse(Hi_Color.Value);
            //}
            //catch { }
            model.nvc_Language = ddl_language.SelectedValue;
            model.nvc_Title = news_title.Value;
            //model.nvc_SubTitle = news_title2.Value;
            model.i_NewsTypeId = int.Parse(DDL_Type.SelectedValue);
            model.i_OrderBy = string.IsNullOrEmpty(text_Orderby.Value) ? 0 : int.Parse(text_Orderby.Value);
            model.i_Views = string.IsNullOrEmpty(text_Views.Value) ? 0 : int.Parse(text_Views.Value);
            model.dt_AddTime = string.IsNullOrEmpty(Newdate.Value) ? DateTime.Now : Convert.ToDateTime(Newdate.Value);

            //model.dt_AddTime = DateTime.Now;

            if (FileUpload1.HasFile)
            {
                string exname = Path.GetExtension(FileUpload1.FileName).ToLower();

                if (!".jpeg|.jpg|.bmp|.png|.bmp|.gif".Contains(exname))
                {
                    Label1.Text = "文件格式错误！"; return;
                }
                if (FileUpload1.PostedFile.ContentLength > 1024 * 1024 * 1)
                {
                    Label1.Text = "文件大小不能超过1MB"; return;
                }
                else
                {
                    string newname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999)) + exname;
                    string path = System.Web.HttpContext.Current.Server.MapPath("../Upload_News/images/") + newname;
                    FileUpload1.PostedFile.SaveAs(path);
                    model.nvc_TitlePhoto = "Upload_News/images/" + newname;
                }
            }
            #region 作废
            //if (FileUpload2.HasFile)
            //{
            //    string exname = Path.GetExtension(FileUpload2.FileName).ToLower();

            //    if (!".jpeg|.jpg|.bmp|.png|.bmp|.gif".Contains(exname))
            //    {
            //        Label2.Text = "文件格式错误！"; return;
            //    }
            //    if (FileUpload2.PostedFile.ContentLength > 1024 * 1024 * 1)
            //    {
            //        Label2.Text = "文件大小不能超过1MB"; return;
            //    }
            //    else
            //    {
            //        string newname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999)) + exname;
            //        string path = System.Web.HttpContext.Current.Server.MapPath("../Upload_News/images/") + newname;
            //        FileUpload2.PostedFile.SaveAs(path);
            //        model.nvc_FilePhoto = "Upload_News/images/" + newname;
            //    }
            //}
            //if (FileUpload3.HasFile)
            //{
            //    string exname = Path.GetExtension(FileUpload3.FileName).ToLower();

            //    if (!".jpeg|.jpg|.bmp|.png|.bmp|.gif|.pdf|.doc|.docx|.excel|.ppt|.txt|.zip|.rar|.swf|.mp3".Contains(exname))
            //    {
            //        Label3.Text = "文件格式错误！"; return;
            //    }
            //    if (FileUpload3.PostedFile.ContentLength > 1024 * 1024 * 2)
            //    {
            //        Label3.Text = "文件大小不能超过2MB"; return;
            //    }
            //    else
            //    {
            //        string newname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999)) + exname;
            //        string path = System.Web.HttpContext.Current.Server.MapPath("../Upload_News/files/") + newname;
            //        FileUpload3.PostedFile.SaveAs(path);
            //        model.nvc_FileLink = "Upload_News/files/" + newname;
            //    }
            //}
            #endregion
            model.i_Show = cb_Recomment.Checked ? 1 : 0;
            model.nvc_TitleLink = text_Link.Value;

            model.nt_Content = Request.Form["myContent"];
            model.nvc_PageTitle = TB_WebTitle.Text;
            model.nvc_PageKeywords = news_keyword.Value;
            model.nvc_PageDescription = news_content2.Value;
            if (hd.Value != "0")
            {
                if (DALN.News_Update(model) == 1)
                {
                    Manager.AddLog(0, "新闻管理", "修改了新闻[ <font color=\"red\">" + model.nvc_Title + "</font> ]的信息");//修改新闻日志
                    string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_News.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                    Response.Redirect("shop_manageok.aspx?hrefname=新闻&hreftype=2&href1=Shop_A_News.aspx&href2=" + twourl);
                }
            }
            else
            {
                //添加新闻 
                if (DALN.News_Add(model) > 0)
                {
                    Manager.AddLog(0, "新闻管理", "添加了新闻[ <font color=\"red\">" + model.nvc_Title + "</font> ]");//添加新闻日志
                    string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_News.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                    Response.Redirect("shop_manageok.aspx?hrefname=新闻&hreftype=1&href1=Shop_A_News.aspx&href2=" + twourl);
                }
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据异常，请重新提交！');</script>";
        }
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.DDL_Type.Items.Clear();
        Bind_DDL_Category(0, 0);
    }
}