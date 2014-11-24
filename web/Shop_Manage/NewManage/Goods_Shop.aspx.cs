using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_NewManage_Goods_Shop : System.Web.UI.Page
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
                BindShop(int.Parse(Request.QueryString["id"].ToString()));
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

        if (!string.IsNullOrEmpty(this.DropDownList1.SelectedValue))
        {
            this.DropDownList2.DataSource = goods.DetailCategory_Select_MainCategoryId(int.Parse(this.DropDownList1.SelectedValue));
            this.DropDownList2.DataTextField = "CategoryCode";
            this.DropDownList2.DataValueField = "i_Id";
            this.DropDownList2.DataBind();
        }
    }
    private void BindShop(int id)
    {
        var model = goods.Goods_Select_Id(id);
        var main= goods.DetailCategory_Select_Id(model.DetailCategoryID);
        this.DropDownList1.SelectedValue = main.MainCategoryID.ToString();
        DropDownList1_SelectedIndexChanged(null,null);
        this.DropDownList2.SelectedValue = model.DetailCategoryID.ToString();
        
        

        this.txtCategoryCode.Value = model.GoodsCode;
        this.txtCategoryRemark.Value = model.GoodsRemark;
    }

    protected void But_Add_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.DropDownList2.SelectedValue))
        {
            t_Goods model = new t_Goods();
            model.DetailCategoryID = int.Parse(this.DropDownList2.SelectedValue);
            model.GoodsCode = this.txtCategoryCode.Value.Trim();
            model.GoodsRemark = this.txtCategoryRemark.Value.Trim();

            if (ViewState["id"] != null)
            {
                model.i_Id = int.Parse(ViewState["id"].ToString());
                goods.Goods_Update(model);
                Manager.AddLog(0, "商品管理", "修改商品" + model.GoodsRemark);
                string twourl = System.Web.HttpUtility.UrlEncode("NewManage/Goods_ShopList.aspx?PageNo=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("../shop_manageok.aspx?hrefname=商品hreftype=2&href1=NewManage/Goods_Shop.aspx&href2=" + twourl);
            }
            else
            {
                goods.Goods_Add(model);
                Manager.AddLog(0, "商品管理", "添加商品" + model.GoodsRemark);
                string twourl = System.Web.HttpUtility.UrlEncode("NewManage/Goods_ShopList.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("../shop_manageok.aspx?hrefname=商品&hreftype=1&href1=NewManage/Goods_Shop.aspx&href2=" + twourl);
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.DropDownList1.SelectedValue))
        {
            this.DropDownList2.DataSource = goods.DetailCategory_Select_MainCategoryId(int.Parse(this.DropDownList1.SelectedValue));
            this.DropDownList2.DataTextField = "CategoryCode";
            this.DropDownList2.DataValueField = "i_Id";
            this.DropDownList2.DataBind();
        }
    }
}
