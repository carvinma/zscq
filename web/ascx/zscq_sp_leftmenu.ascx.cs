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
        if (url.IndexOf("web/") > -1)
        {
            myurl = url.Substring((url.IndexOf("web/") + 4), (url.IndexOf(".aspx") - url.IndexOf("web/") - 4));
        }
        else
        {
            myurl = url.TrimStart('/').Replace(".aspx", "");
        }
    }
}