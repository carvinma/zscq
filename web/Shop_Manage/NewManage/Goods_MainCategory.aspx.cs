using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_NewManage_Goods_MainCategory : System.Web.UI.Page
{
    private dal_Goods goods = new dal_Goods();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (Manager.GetManagerQX(42, 1) == false || Manager.GetManagerQX(42, 2) == false)
        {
            this.But_Add.Visible = false;
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                HF_ID.Value = Request.QueryString["id"];
                var t =goods.MainCategory_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
                this.txtCategoryCode.Value = t.CategoryCode;
                this.txtCategoryRemark.Value = t.CategoryRemark;
            }
            if (Request.QueryString["PageNo"] != null && Request.QueryString["PageNo"].ToString() != "")
            {
                Hidden1.Value = Request.QueryString["PageNo"].ToString();
            }
            if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
            {
                Hidden2.Value = Request.QueryString["Keyword"].ToString();
            }
        }
    }
    protected void But_Add_Click(object sender, EventArgs e)
    {
        t_GoodsMainCategory model = new t_GoodsMainCategory();
        model.CategoryCode = this.txtCategoryCode.Value.Trim();
        model.CategoryRemark = this.txtCategoryRemark.Value.Trim();
        if (HF_ID.Value != "0")
        {
            model.i_Id = int.Parse(HF_ID.Value);
            goods.MainCategory_Update(model);
            Manager.AddLog(0, "商品大类管理", "修改了大类[ <font color=\"red\">" + model.CategoryCode + "</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("NewManage/Goods_MainCategoryList.aspx?PageNo=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("../shop_manageok.aspx?hrefname=商品大类&hreftype=2&href1=NewManage/Goods_MainCategory.aspx&href2=" + twourl);
        }
        else
        {
            if (goods.MainCategory_Add(model) > 0)
            {
                Manager.AddLog(0, "商品大类管理", "添加了大类[ <font color=\"red\">" + model.CategoryCode + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("NewManage/Goods_MainCategoryList.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("../shop_manageok.aspx?hrefname=商品大类&hreftype=1&href1=NewManage/Goods_MainCategory.aspx&href2=" + twourl);
            }
        }        
    }
}