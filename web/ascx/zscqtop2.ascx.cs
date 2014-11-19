using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using zscq.Model;
using zscq.DAL;

public partial class ascx_zscqtop2 : System.Web.UI.UserControl
{
    dal_SinglePage DALSP = new dal_SinglePage();
    private string _keywords = "";
    [Browsable(true)]
    [Category("string")]
    [Description("搜索关键词")]
    [DefaultValue("")]
    public string Keywords
    {
        get { return _keywords; }
        set { _keywords = value; }
    }
    public string contents1, contents2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(Request.QueryString["keywords"]))
        {
            Keywords = Request.QueryString["keywords"].RemoveUnSafe();
        }
        t_SinglePage model = DALSP.SinglePage_Select_Key("tiaokuan", "cn");
        contents1 = model.nt_Value;
        model = DALSP.SinglePage_Select_Key("yinsi", "cn");
        contents2 = model.nt_Value;
    }
    public string  Checkvalue(string title)
    {
        string aa="true";
        if (StringHelper.CheckSqlKeyWord(title) || StringHelper.CheckSqlKeyWord(title))
        {
            //div_a.InnerHtml = "<script>alert('您输入的字符不符合规范,请核对后重新输入！');</script>";
            //return;
            aa = "false";
        }
        return aa;
    }


}