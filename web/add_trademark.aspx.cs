using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class aBrand_add_trademark : System.Web.UI.Page
{
    private dal_Goods goods = new dal_Goods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // goods.MainCategory_SelectAll();
        }
    }
}