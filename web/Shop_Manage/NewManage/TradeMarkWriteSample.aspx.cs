using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_NewManage_TradeMarkWriteSample : System.Web.UI.Page
{
    private dal_NewTrademark mark = new dal_NewTrademark();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.lblmsg.Text = "";
        if (!IsPostBack)
        {
            this.txtSample.Value=mark.TrademarkRenewalWriteSample();
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        int i= mark.TrademarkRenewalWriteSample_Update(this.txtSample.Value.Trim());
 
        if(i>0)lblmsg.Text = "<script>alert('设置成功');</script>";
        else lblmsg.Text = "<script>alert('设置失败');</script>";
    }
}