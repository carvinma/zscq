using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;

/// <summary>
///MessageBox 的摘要说明
/// </summary>
public class MessageBox
{
	public MessageBox()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 提示信息并返回一个只等的页面
    /// </summary>
    /// <param name="strMessage">提示信息</param>
    /// <param name="strUrl">要返回的页面</param>
    public static void Show(string strMessage, string strUrl)
    {
        HttpContext.Current.Response.Write("<script language=\"javascript\" >");
        HttpContext.Current.Response.Write(string.Format("alert(\"{0}\");", strMessage));
        HttpContext.Current.Response.Write(string.Format("window.location.href=\"{0}\";", strUrl));
        HttpContext.Current.Response.Write("</script>");
    }

    /// <summary>
    /// 显示消息提示对话框
    /// </summary>
    /// <param name="page">当前页面指针，一般为this</param>
    /// <param name="msg">提示信息</param>
    public static void Show(System.Web.UI.Page page, string msg)
    {
        page.RegisterStartupScript("message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
    }
    /// <summary>
    /// 控件点击 消息确认提示框
    /// </summary>
    /// <param name="page">当前页面指针，一般为this</param>
    /// <param name="msg">提示信息</param>
    public static void ShowConfirm(System.Web.UI.WebControls.WebControl Control, string msg)
    {
        //Control.Attributes.Add("onClick","if (!window.confirm('"+msg+"')){return false;}");
        Control.Attributes.Add("onclick", "return confirm('" + msg + "');");
    }

    /// <summary>
    /// 显示消息提示对话框，并进行页面跳转
    /// </summary>
    /// <param name="page">当前页面指针，一般为this</param>
    /// <param name="msg">提示信息</param>
    /// <param name="url">跳转的目标URL</param>
    public static void ShowAndRedirect(System.Web.UI.Page page, string msg, string url)
    {
        StringBuilder Builder = new StringBuilder();
        Builder.Append("<script language='javascript' defer>");
        Builder.AppendFormat("alert('{0}');", msg);
        Builder.AppendFormat("top.location.href='{0}'", url);
        Builder.Append("</script>");
        page.RegisterStartupScript("message", Builder.ToString());

    }
    public static void ShowConfirmAndRedirect(System.Web.UI.Page page, string msg, string url)
    {
        StringBuilder Builder = new StringBuilder();
        Builder.Append("<script language='javascript' defer>");
        Builder.AppendFormat("return confirm(('{0}');", msg);
        Builder.AppendFormat("top.location.href='{0}'", url);
        Builder.Append("</script>");
        page.RegisterStartupScript("message", Builder.ToString());

    }
    /// <summary>
    /// 输出自定义脚本信息
    /// </summary>
    /// <param name="page">当前页面指针，一般为this</param>
    /// <param name="script">输出脚本</param>
    public static void ResponseScript(System.Web.UI.Page page, string script)
    {
        page.RegisterStartupScript("message", "<script language='javascript' defer>" + script + "</script>");
    }
    /// <summary>
    /// 输出自定义脚本信息
    /// </summary>
    /// <param name="page">当前页面指针，一般为this</param>
    /// <param name="script">输出脚本</param>
    public static void ResponseScript(string script)
    {
        System.Web.HttpContext.Current.Response.Write("<script language='javascript' defer>" + script + "</script>");
    }
    /// <summary>
    /// 获得焦点
    /// </summary>
    /// <param name="ctrl">控件名（this.TextBox）</param>
    /// <param name="page">this.page</param>
    public static void SetFocus(System.Web.UI.Control ctrl, System.Web.UI.Page page)
    {
        string s = "<SCRIPT language='javascript' defer>document.getElementById('" + ctrl.ID + "').focus() </SCRIPT>";
        page.RegisterStartupScript("focus", s);

    }
}
