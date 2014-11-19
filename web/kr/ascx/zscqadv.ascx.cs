using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.ComponentModel;

public partial class ascx_zscqadv : System.Web.UI.UserControl
{
    private string _typeid = "0";
    //[Browsable(true)]
    //[Category("int")]
    //[Description("广告类别ID")]
    //[DefaultValue("0")]
    public string TypeId
    {
        get { return _typeid; }
        set { _typeid = value; }
    }
    public string _Adv = "";
    dal_Adv DALADV = new dal_Adv();
    protected void Page_Load(object sender, EventArgs e)
    {
        t_Adv adv = DALADV.Adv_Select_TypeId(int.Parse(_typeid)).FirstOrDefault();
        if (adv != null)
        {
            _Adv = "<img src=\"../" + adv.nvc_ImageAddress + "\" width=\"1001\" height=\"150\" />";
        }
        else
        {
            _Adv = "";
        }
    }
}