using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class BrandHelpDoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dal_SinglePage DALSP = new dal_SinglePage();
            t_SinglePage model = DALSP.SinglePage_Select_Key("sbhelpdoc", "cn");
            if (model != null)
            {
                Ltl_LoginInfo.Text = model.nt_Value;
            }
        }
    }
}