using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class zscq_sp_leftmenu : System.Web.UI.UserControl
{
    public string myurl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
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
}