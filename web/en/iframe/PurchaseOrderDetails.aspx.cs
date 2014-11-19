using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dskl.BLL;
using dskl.DAL;
using dskl.Model;

public partial class iframe_PurchaseOrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Value();
    }
    void Bind_Page_Value()//绑定页面传值
    {
        if (Request.QueryString["oid"] != null
            && Request.QueryString["oid"].ToString() != ""
            && Request.QueryString["oid"].ToString() != "0"
            && Functions.IsNumber(Request.QueryString["oid"].ToString()))
        {
            Hi_PId.Value = Request.QueryString["oid"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}