using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using System.Data;
using zscq.DAL;
using System.Text;

public partial class Shop_Manage_shop_orderprint : System.Web.UI.Page
{
    dal_IntegralOrder DALO = new dal_IntegralOrder();
    dal_IntegralOrderOperateNote DALOD = new dal_IntegralOrderOperateNote();
    dal_Address DALA = new dal_Address();
    public string Str_Money = "";
    public string Lb_FP = "";
    public string Lb_FPTT = "";
    public string fapiaotype = "普通发票";
    public bool br_fapiao = false;
    public bool table_fapiao = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            BindInfo();
        }
    }
    private void BindInfo()
    {
        if (Request.QueryString["orderid"] != null)
        {
            int orderid = Convert.ToInt32(Request.QueryString["orderid"].ToString());
            //绑定订单信息
            vw_IntegralOrder model = (from i in new DataViewDataContext().vw_IntegralOrder where i.i_Id == orderid select i).FirstOrDefault();
            if (model != null)
            {
                this.labOrderNum.Text = model.nvc_OrderNumber;
                this.labAddTime.Text = model.dt_AddTime.ToString();
                this.labTotalMoney.Text = model.i_SumIntegral.ToString();
                //decimal SumMoney = model.dm_SumMoney + model.dm_IntegralMoney + model.dm_CouponMoney + model.dm_MemberDiscountMoney + model.dm_PromotionMoney;
                Str_Money = "商品总计：<span style=\"color:red; font-weight:bold;\">总积分" + model.i_SumIntegral.ToString() + "</span>&nbsp;&nbsp;</span>";

                //if (model.i_Invoice == 1)
                //{
                //    br_fapiao = true;
                //    table_fapiao = true;
                //    Lb_FPTT = model.nvc_InvoiceTitle.ToString();
                //    Lb_FP = model.dm_SumMoney.ToString();
                //    if (model.i_InvoiceType == 2)
                //    {
                //        fapiaotype = "增值税发票";
                //    }
                //}

                this.labUserName.Text = model.nvc_MemberName;
                string address = DALA.Set_AddressName_PId_CId_AId(model.i_Address_PId, model.i_Address_CId, model.i_Address_AId) + " " + model.nvc_Address_StreetAddress;
                this.labMobile.Text = model.nvc_Address_MobilePhone;
                this.labReceiver.Text = model.nvc_Address_Consignee;

                //绑定商品信息
                repProduct.DataSource = DALOD.IntegralOrderOperateNote_vw_Select(orderid);
                repProduct.DataBind();
            }
        }
    }
}
