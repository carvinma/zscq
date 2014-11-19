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

public partial class Shop_Manage_shop_manageok : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["hreftype"] != null && Request.QueryString["hreftype"].ToString() != "")
        {
            HiddenType.Value = Request.QueryString["hreftype"].ToString();
        }
        if (Request.QueryString["href1"] != null && Request.QueryString["href1"].ToString() != "")
        {
            Hidden1.Value = Request.QueryString["href1"].ToString();
        }
        if (Request.QueryString["href2"] != null && Request.QueryString["href2"].ToString() != "")
        {
            //Hidden2.Value = System.Web.HttpUtility.UrlDecode(Request.QueryString["href2"].ToString(),enc);
            Hidden2.Value = System.Web.HttpUtility.UrlDecode(Request.QueryString["href2"].ToString(), System.Text.Encoding.UTF8);
        }
        href2.InnerHtml = "列表";
        href1.InnerHtml = "添加";
        if (Request.QueryString["hrefname"] != null && Request.QueryString["hrefname"].ToString() != "")
        {
            href1.InnerHtml = "添加" + Request.QueryString["hrefname"].ToString();
            if (Request.QueryString["hrefname"].ToString() == "会员")
            {
                href1.InnerHtml = "";
            }
            href2.InnerHtml = Request.QueryString["hrefname"].ToString() + "列表";
            if (Request.QueryString["hrefname"].ToString() == "胭脂币" || Request.QueryString["hrefname"].ToString() == "代金券")
            {
                href1.InnerHtml = "生成" + Request.QueryString["hrefname"].ToString();
            }
            if (Request.QueryString["hrefname"].ToString() == "短信" || Request.QueryString["hrefname"].ToString() == "邮件")
            {
                href1.InnerHtml = "群发" + Request.QueryString["hrefname"].ToString();
                href2.InnerHtml = Request.QueryString["hrefname"].ToString() + "流水";
            }
        }
    }
}
