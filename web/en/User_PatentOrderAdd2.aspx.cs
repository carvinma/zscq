using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    int uId = 0;
    dal_PatentOrder DALO = new dal_PatentOrder();
    dal_Member DALM = new dal_Member();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            Bind_Page_Info();
            dal_SinglePage DALSP = new dal_SinglePage();
            t_SinglePage model = DALSP.SinglePage_Select_Key("zlpay", "en");
            if (model != null)
            {
                Ltl_ZhuYi.Text =  model.nt_Value;
            }
            
        }
    }
    void Bind_Page_Info()
    {
        try
        {
            if (Request["oNum"] != null && Request["oNum"].ToString() != "")
            {
                string ordernum = Request["oNum"].ToString();
                t_PatentOrder model = DALO.PatentOrder_Select_OrderNum(ordernum);
                if (model != null)
                {
                    HF_oId.Value = model.i_Id.ToString();
                    Ltl_OrderNum.Text = model.nvc_OrderNumber;
                    Ltl_Money.Text = model.dm_TotalMoney.ToString();
                    Ltl_PayType.Text = model.nvc_PayType;
                    if (model.nvc_PayType == "线下汇款")
                    {
                        ImageButton1.Visible = false;
                    }
                    Ltl_MemberNum.Text = DALM.Member_Select_Id(uId).nvc_UserNum;
                    Ltl_MemberName.Text = DALM.Member_Select_Id(uId).nvc_Name;
                    Ltl_AddTime.Text = model.dt_AddTime.ToString();
                    Ltl_Status.Text = DALO.GetStatus(model.i_Status,"en");
                }
            }
        }
        catch { }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (HF_oId.Value != "0" && uId != 0)
        {
            Response.Redirect("PayGo.aspx?tType=1&oId=" + HF_oId.Value);
        }
    }
    protected void ImgBtn_Add_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("User_PatentOrderInfo.aspx?oId=" + HF_oId.Value);
    }
}