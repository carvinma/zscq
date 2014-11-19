using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
///LanguageConfig 的摘要说明
/// </summary>
public class LanguageConfig
{
    public static readonly string language = ConfigurationManager.AppSettings.Get("Language");

    public LanguageConfig()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        // 
    }

    public static void BindLanguage(DropDownList ddl)
    {
        ddl.Items.Clear();
        string[] arr = language.Split(',');
        foreach (var v in arr)
        {
            ddl.Items.Add(new ListItem(v.Split('_')[1], v.Split('_')[0]));
        }
        if (!string.IsNullOrWhiteSpace(HttpContext.Current.Request.QueryString["lang"]))
        {
            ddl.SelectedValue = HttpContext.Current.Request.QueryString["lang"];
        }
    }
}