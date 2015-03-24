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
using zscq.DAL;
using zscq.Model;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public partial class Shop_Manage_Shop_A_IntegralProduct : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(30, 0);
    public bool pageadd = Manager.GetManagerQX(30, 1);
    public bool pageupdate = Manager.GetManagerQX(30, 2);
    dal_IntegralProduct DALIP = new dal_IntegralProduct();

    public string content = "";
    public string tip = "";
    public string returnurl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            BindDDL();
            Bind_Page_Info();
        }
    }
    private void Bind_Page_Info()// 绑定商品详细数据
    {
        if (Request.QueryString["ipid"] != null && Request.QueryString["ipid"].ToString() != "")
        {
            Hi_Id.Value = Request.QueryString["ipid"].ToString();
            int id = int.Parse(Request.QueryString["ipid"].ToString());
            t_IntegralProduct model = DALIP.IntegralProduct_Select_Id(id);
            if (model != null)
            {
                //tr_IpNumber.Visible = true;
                //Label1.Text = model.nvc_Number;
                ddl_language.SelectedValue = model.nvc_Language;
                ddl_type.SelectedValue = model.i_Type.ToString();
                text_head0.Value = model.nvc_Name;//新
                //text_head1.Value = model.nvc_Name1;//新
                //text_head2.Value = model.nvc_Name2;//新
                //text_head3.Value = model.nvc_Name3;//新
                hw_price2.Value = model.i_NeedIntegral.ToString();
                hw_buys.Value = model.i_Buys.ToString();
                hw_xu.Value = model.i_Orderby.ToString();
                hw_views.Value = model.i_Follow.ToString();//最低人数
                cb_tj.Checked = (model.i_Recommend == 1);
                is_shangjia.Checked = (model.i_Show == 1);
                content = model.nt_ProductDetails;
                tip = model.nvc_Name1;
                ifrimg.Value = model.nvc_Pic;//图片
                ddl_Coupontype.SelectedValue = model.i_CouponTypeId.ToString();
                ddl_MGrade.SelectedValue = model.i_MemberGradeId.ToString();
                ddl_ProductType.SelectedValue = model.i_ProductType.ToString();
            }
        }
        else
        {
            //tr_IpNumber.Visible = false;
        }
    }
    protected void Bt_submit_Click(object sender, EventArgs e)
    {
        try
        {
            t_IntegralProduct model = new t_IntegralProduct();
            if (Hi_Id.Value != "0")
            {
                model = DALIP.IntegralProduct_Select_Id(Convert.ToInt32(Hi_Id.Value));
            }
            else
            {
                model.nvc_Number = HelpString.GetRamdom();
            }
            model.nvc_Language = ddl_language.SelectedValue;
            model.i_NeedIntegral = Convert.ToInt32(hw_price2.Value);
            model.i_Orderby = int.Parse(hw_xu.Value);
            model.i_Buys = int.Parse(hw_buys.Value);
            model.i_Stock = int.Parse(hw_views.Value);            
            model.nvc_Name = text_head0.Value;//新的
            //model.nvc_Name1 = text_head1.Value;//新的
            //model.nvc_Name2 = text_head2.Value;//新的
            //model.nvc_Name3 = text_head3.Value;//新的 
            model.i_Type = int.Parse(ddl_type.SelectedValue);
            model.i_Recommend = cb_tj.Checked ? 1 : 0;
            model.i_Show = is_shangjia.Checked ? 1 : 0;
            model.nt_ProductDetails = Request.Form["myContent"];
            model.nvc_Name1 = Request.Form["myTip"];
            if (ddl_type.SelectedValue == "2")
            {
                model.i_CouponTypeId = int.Parse(ddl_Coupontype.SelectedValue);
            }
            if (ddl_type.SelectedValue == "3")
            {
                model.i_MemberGradeId = int.Parse(ddl_MGrade.SelectedValue);
            }
            if (ifrimg.Value != "")
            {
                model.nvc_Pic = ifrimg.Value;
            }
            model.i_ProductType = int.Parse(ddl_ProductType.SelectedValue);
            if (Hi_Id.Value == "0")
            {
                DALIP.IntegralProduct_Add(model);
                Manager.AddLog(0, "积分商品管理", "增加了积分商品[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_IntegralProduct.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=积分商品&hreftype=1&href1=Shop_A_IntegralProduct.aspx&href2=" + twourl);
            }
            else
            {
                DALIP.IntegralProduct_Submit();
                Manager.AddLog(0, "积分商品管理", "修改了积分商品[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_IntegralProduct.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=积分商品&hreftype=2&href1=Shop_A_IntegralProduct.aspx&href2=" + twourl);
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('数据类型错误！');</script>";
        }
    }
    void BindDDL()
    {
        ddl_Coupontype.Items.Clear();
        ddl_MGrade.Items.Clear();
        ddl_Coupontype.DataSource = new dal_Coupon().CouponType_Select_All();
        ddl_Coupontype.DataValueField = "i_Id";
        ddl_Coupontype.DataTextField = "nvc_Name";
        ddl_Coupontype.DataBind();
        ddl_MGrade.DataSource = new dal_UserGrade().UserGrade_Select_All();
        ddl_MGrade.DataTextField = "nvc_Name";
        ddl_MGrade.DataValueField = "i_Id";
        ddl_MGrade.DataBind();
        ddl_MGrade.Items.Insert(0, new ListItem("请选择", ""));
        ddl_Coupontype.Items.Insert(0, new ListItem("请选择", ""));

        DataZscqDataContext dpdc = new DataZscqDataContext();
        var iquery = from i in dpdc.t_IntegralProductType where i.i_ParentId == null select i;
        foreach (var i in iquery)
        {
            ddl_ProductType.Items.Add(new ListItem(i.nvc_ChinaName, i.i_Id.ToString()));
            var iquery2 = from i2 in dpdc.t_IntegralProductType where i2.i_ParentId == i.i_Id select i2;
            foreach (var i2 in iquery2)
            {
                ddl_ProductType.Items.Add(new ListItem("|--" + i2.nvc_ChinaName, i2.i_Id.ToString()));
                
            }

        }
        ddl_ProductType.Items.Insert(0, new ListItem("请选择", ""));
    }
}
