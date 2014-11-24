using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_NewManage_Goods_SubCategory : System.Web.UI.Page
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
            BindP();
            if (Request.QueryString["id"] != null)
            {
                ViewState["id"] = Request.QueryString["id"];
                BindDateilCategory(int.Parse(Request.QueryString["id"].ToString()));
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
    private void BindP()
    {
        this.DropDownList1.DataSource = goods.MainCategory_SelectAll();
        this.DropDownList1.DataTextField = "CategoryCode";
        this.DropDownList1.DataValueField = "i_Id";
        this.DropDownList1.DataBind();
    }
    private void BindDateilCategory(int id)
    {
        var model = goods.DetailCategory_Select_Id(id);
        this.DropDownList1.SelectedValue = model.MainCategoryID.ToString();
        this.txtCategoryCode.Value = model.CategoryCode;
        this.txtCategoryRemark.Value = model.CategoryRemark;
    }

    protected void But_Add_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.DropDownList1.SelectedValue))
        {
            t_GoodsDetailCategory model = new t_GoodsDetailCategory();

            model.MainCategoryID = int.Parse(this.DropDownList1.SelectedValue);
            model.CategoryCode = this.txtCategoryCode.Value.Trim();
            model.CategoryRemark = this.txtCategoryRemark.Value.Trim();

            if (ViewState["id"] != null)
            {
                model.i_Id = int.Parse(ViewState["id"].ToString());
                goods.DetailCategory_Update(model);
                Manager.AddLog(0, "商品小类管理", "修改小类" + model.CategoryCode);
                string twourl = System.Web.HttpUtility.UrlEncode("NewManage/Goods_SubCategoryList.aspx?PageNo=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("../shop_manageok.aspx?hrefname=商品小类&hreftype=2&href1=NewManage/Goods_SubCategory.aspx&href2=" + twourl);
            }
            else
            {
                goods.DetailCategory_Add(model);
                Manager.AddLog(0, "商品小类管理", "添加小类" + model.CategoryCode);
                string twourl = System.Web.HttpUtility.UrlEncode("NewManage/Goods_SubCategoryList.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("../shop_manageok.aspx?hrefname=商品小类&hreftype=1&href1=NewManage/Goods_SubCategory.aspx&href2=" + twourl);
            }
        }
    }
}