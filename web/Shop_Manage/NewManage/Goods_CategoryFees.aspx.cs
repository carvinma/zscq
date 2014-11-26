using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_NewManage_Goods_CategoryFees : System.Web.UI.Page
{
    private dal_Goods goods = new dal_Goods();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        t_GoodsCategoryFees model = new t_GoodsCategoryFees();
        model.MainFees = decimal.Parse(txtMainFees.Value);
        model.ItemNum = int.Parse(txtItemNum.Value);
        model.ExceedFees =decimal.Parse(txtExceedFees.Value);
        goods.CategoryFees_Update(model);
    }
}