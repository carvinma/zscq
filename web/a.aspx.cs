using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class a : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    protected void Page_Load(object sender, EventArgs e)
    {
        DALM.SetMemberNumber(1, 1, 1);
    }
}