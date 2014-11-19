using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using zscq.Model;
using zscq.DAL;

public partial class iframe_ReceiveAddress : System.Web.UI.Page
{
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Address DALA = new dal_Address();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            DALA.Provice_Bind_DDL(ddlsheng);
            Bind_Page_Value();
            if (Request.QueryString["PageType"] != null && Request.QueryString["PageType"] != "")
            {
                Delete_Address();
                Mr_Address();
            }
            Bind_Rpt_Address();
        }
    }
    void Bind_Page_Value()
    {
        CookiesShopCart shopcart = new CookiesShopCart();
        Hi_MemberId.Value = shopcart.Get_UerId().ToString();
        if (shopcart.Get_UerId() > 0)
        {
            if (Request.QueryString["ctype"] != null && Request.QueryString["ctype"].ToString() == "2")
            {
                Hi_CType.Value = Request.QueryString["ctype"].ToString();
            }
            if (Request.QueryString["aid"] != null
            && Request.QueryString["aid"].ToString() != "")
            {
                t_Member Member = DALM.Member_Select_Id(Convert.ToInt32(Hi_MemberId.Value));
                if (Member != null)
                {
                    Hi_Mr.Value = Member.i_DefaultAddress.ToString();
                    int Id = Convert.ToInt32(Request.QueryString["aid"].ToString());
                    if (Id != 0)
                    {
                        t_ReceiveAddress model = DALRA.ReceiveAddress_Select_Id(Id);
                        if (model != null)
                        {

                            text_shouhuoren.Value = model.nvc_Consignee;
                            text_shouhuodizhi.Value = model.nvc_StreetAddress;
                            text_youzhengbianma.Value = model.nvc_ZipCode;
                            text_shoujihaoma.Value = model.nvc_MobilePhone;

                            text_gudingdianhua.Value = model.nvc_TelPhone;
                            text_dianziyoujian.Value = model.nvc_Email;
                            this.ddlsheng.SelectedValue = Convert.ToString(model.i_PId);
                            DALA.City_Bind_DDL_PId(ddlshi, ddlsheng.SelectedValue);
                            this.ddlshi.SelectedValue = Convert.ToString(model.i_CId);
                            DALA.Area_Bind_DDL_CId(ddlqu, ddlshi.SelectedValue);
                            this.ddlqu.SelectedValue = Convert.ToString(model.i_AId);
                        }
                        Hi_AddressId.Value = Request.QueryString["aid"].ToString();
                    }
                    else
                    {
                        Bt_Update.Visible = false;
                    }
                    return;
                }
            }
        }
        Response.Redirect("../user_shoporder1.aspx");
    }
    void Delete_Address()//删除地址
    {
        if (Request.QueryString["PageType"].ToString() == "del")
        {
            int Id = Convert.ToInt32(Request.QueryString["did"].ToString());
            if (DALRA.ReceiveAddress_Del(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('Error occurs, the subject address cannot be deleted ！')</script>";
            }
            else
            {
                #region 如果删除了选中的地址
                if (Request.QueryString["aid"].ToString() == Request.QueryString["did"].ToString())
                {
                    t_Member model = DALM.Member_Select_Id(Convert.ToInt32(Hi_MemberId.Value));
                    var iquery = from i in DALRA.ReceiveAddress_Select_MemberId(model.i_Id) select i;
                    if (iquery.Count() > 0)
                    {
                        t_ReceiveAddress model_RA = (from i in iquery where i.i_Id == model.i_DefaultAddress select i).FirstOrDefault();
                        if (model_RA == null)
                        {
                            model_RA = iquery.FirstOrDefault();
                        }
                        if (Hi_CType.Value == "1")//订单确认页面
                        {
                            string AddressInfo = DALA.Set_AddressName_PId_CId_AId(model_RA.i_PId, model_RA.i_CId, model_RA.i_AId) + "&nbsp;&nbsp;" + model_RA.nvc_StreetAddress + "&nbsp;&nbsp;（" + model_RA.nvc_Consignee + "&nbsp;&nbsp;收）" + "&nbsp;&nbsp;" + model_RA.nvc_MobilePhone;
                            Response.Write("<script>window.parent.obj('Hi_AddressId').value=" + model_RA.i_Id + ";window.parent.obj('div_ReceiveAddress').innerHTML='" + AddressInfo + "';window.parent.checkaddress(0);</script>");
                        }
                        else
                        {
                            div_a.InnerHtml = "<script>window.parent.obj('Hi_AddressId').value=0;</script>";
                        }
                    }
                    else//如果没了地址了
                    {
                        if (Hi_CType.Value == "1")//订单确认页面
                        {
                            Response.Write("<script>window.parent.obj('Hi_AddressId').value=0;window.parent.obj('div_ReceiveAddress').innerHTML='';window.parent.checkaddress(0);</script>");
                        }
                        else
                        {
                            div_a.InnerHtml = "<script>window.parent.obj('Hi_AddressId').value=0;</script>";
                        }
                    }
                }
                #endregion
            }
        }
    }
    void Mr_Address()//默认
    {
        if (Request.QueryString["PageType"].ToString() == "mr")
        {
            int Id = Convert.ToInt32(Request.QueryString["mid"].ToString());
            if (DALRA.ReceiveAddress_Update_Mr(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('Error occurs！')</script>";
            }
            else
            {
                Hi_Mr.Value = Request.QueryString["mid"].ToString();
            }
        }
    }
    void Bind_Rpt_Address()
    {
        Rpt_Address.DataSource = DALRA.ReceiveAddress_Select_MemberId(Convert.ToInt32(Hi_MemberId.Value));
        Rpt_Address.DataBind();
    }
    protected void ddlshi_SelectedIndexChanged(object sender, EventArgs e)//绑定区
    {
        DALA.Area_Bind_DDL_CId(ddlqu, ddlshi.SelectedValue);
    }
    protected void ddlsheng_SelectedIndexChanged(object sender, EventArgs e)//绑定市
    {
        DALA.City_Bind_DDL_PId(ddlshi, ddlsheng.SelectedValue);
        DALA.Area_Bind_DDL_CId(ddlqu, ddlshi.SelectedValue);
    }
    protected void Bt_Update_Click(object sender, EventArgs e)//修改地址
    {
        try
        {
            t_ReceiveAddress model = DALRA.ReceiveAddress_Select_Id(Convert.ToInt32(Hi_AddressId.Value));
            model.nvc_Consignee = text_shouhuoren.Value;
            model.i_PId = Convert.ToInt32(this.ddlsheng.SelectedValue);
            model.i_CId = Convert.ToInt32(this.ddlshi.SelectedValue);
            model.i_AId = Convert.ToInt32(this.ddlqu.SelectedValue);
            model.nvc_StreetAddress = text_shouhuodizhi.Value;
            model.nvc_ZipCode = text_youzhengbianma.Value;
            model.nvc_MobilePhone = text_shoujihaoma.Value;
            model.nvc_TelPhone = text_gudingdianhua.Value;
            model.nvc_Email = text_dianziyoujian.Value;
            model.i_MemberId = int.Parse(Hi_MemberId.Value);
            switch (DALRA.ReceiveAddress_Update(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('Error occurs, the address cannot be modified temperately!');</script>";
                    break;
                case 1:
                    if (Hi_CType.Value == "1")//订单确认页面
                    {
                        string AddressInfo = DALA.Set_AddressName_PId_CId_AId(model.i_PId, model.i_CId, model.i_AId) + "&nbsp;&nbsp;" + model.nvc_StreetAddress + "&nbsp;&nbsp;（" + model.nvc_Consignee + "&nbsp;&nbsp;收）" + "&nbsp;&nbsp;" + model.nvc_MobilePhone;
                        Response.Write("<script>window.parent.obj('div_ReceiveAddress').innerHTML='" + AddressInfo + "';window.parent.checkaddress(1);</script>");
                    }
                    else
                    {
                        div_a.InnerHtml = "<script>alert('Modify successfully!');</script>";
                        Bind_Rpt_Address();
                    }
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('You have the same recipient and the same address information already, which is no need to add again!');</script>";
                    break;
            }
        }
        catch { }
    }
    protected void Bt_Add_Click(object sender, EventArgs e)//添加地址
    {
        try
        {
            t_ReceiveAddress model = new t_ReceiveAddress();
            model.nvc_Consignee = text_shouhuoren.Value;
            model.i_PId = Convert.ToInt32(this.ddlsheng.SelectedValue);
            model.i_CId = Convert.ToInt32(this.ddlshi.SelectedValue);
            model.i_AId = Convert.ToInt32(this.ddlqu.SelectedValue);
            model.nvc_StreetAddress = text_shouhuodizhi.Value;
            model.nvc_ZipCode = text_youzhengbianma.Value;
            model.nvc_MobilePhone = text_shoujihaoma.Value;
            model.nvc_TelPhone = text_gudingdianhua.Value;
            model.nvc_Email = text_dianziyoujian.Value;
            model.i_MemberId = int.Parse(Hi_MemberId.Value);
            switch (DALRA.ReceiveAddress_Add(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('Error occurs, the address cannot be added temperately!');</script>";
                    break;
                case 1:
                    if (Hi_CType.Value == "1")//订单确认页面
                    {
                        string AddressInfo = DALA.Set_AddressName_PId_CId_AId(model.i_PId, model.i_CId, model.i_AId) + "&nbsp;&nbsp;" + model.nvc_StreetAddress + "&nbsp;&nbsp;（" + model.nvc_Consignee + "&nbsp;&nbsp;收）" + "&nbsp;&nbsp;" + model.nvc_MobilePhone;
                        Response.Write("<script>window.parent.obj('Hi_AddressId').value=" + model.i_Id + ";window.parent.obj('div_ReceiveAddress').innerHTML='" + AddressInfo + "';window.parent.checkaddress(1);</script>");
                    }
                    else
                    {
                        Response.Redirect("ReceiveAddress.aspx?aid=" + Hi_AddressId.Value + "&ctype=" + Hi_CType.Value);
                    }
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('You have the same recipient and the same address information already, which is no need to add again!');</script>";
                    break;
            }
        }
        catch { }
    }
    public string Set_AddressName(object PId, object CId, object AId)
    {
        return DALA.Set_AddressName_PId_CId_AId(Convert.ToInt32(PId), Convert.ToInt32(CId), Convert.ToInt32(AId));
    }
}