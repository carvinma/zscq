using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class aBrand_add_trademark : System.Web.UI.Page
{
    private dal_Goods goods = new dal_Goods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Page_Member();
             t_GoodsCategoryFees fees= goods.CategoryFees_Select_One();
            hi_MainFees.Value = fees.MainFees.Value.ToString();
            hi_ItemNum.Value = fees.ItemNum.Value.ToString();
            hi_ExceedFees.Value = fees.ExceedFees.Value.ToString();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
    protected void btnPreview_Click(object sender, EventArgs e)
    {
        txt_applyname.Value.Trim();
        Hi_prov.Value.Trim();
        Hi_city.Value.Trim();
        Hi_country.Value.Trim();
        txt_address.Value.Trim();
        txt_ContactPerson.Value.Trim();
        txt_phone.Value.Trim();
        txt_fax.Value.Trim();
        txt_postcode.Value.Trim();
        txt_remark.Value.Trim();

        sortarr.Value.Trim();//商标类别

         //Radio3DNo.Checked
        //chkSound.Checked
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancle_Click(object sender, EventArgs e)
    {

    }
}