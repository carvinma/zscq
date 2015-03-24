using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;
using System.Text;
public partial class Shop_A_PatentType : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(44, 0);
    public bool pageadd = Manager.GetManagerQX(44, 1);
    public bool pageupdate = Manager.GetManagerQX(44, 2);
    public dal_IntegralProductType DALPT = new dal_IntegralProductType();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    public string PageType = "添加小商品分类";
    public StringBuilder img_color = new StringBuilder();
    public string content = "";
    public string returnurl = "";
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
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            BindP();
            Bind_Page_Info();
        }
    }
    private void BindP()
    {
        this.DropDownList1.DataSource = DALPT.MainIntegralProductType_SelectAll();
        this.DropDownList1.DataTextField = "nvc_ChinaName";
        this.DropDownList1.DataValueField = "i_Id";
        this.DropDownList1.DataBind();
    }
   

    public void Bind_Page_Info()//专利类型内容绑定
    {
        if (Request.QueryString["id"] != null)
        {
            PageType = "修改小商品分类";
            hd.Value = Request.QueryString["id"].ToString();
            t_IntegralProductType model = DALPT.IntegralProductType_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                DropDownList1.SelectedValue=model.i_ParentId.ToString();
                txt_zhongwen.Value = model.nvc_ChinaName;
                txt_yingwen.Value = model.nvc_EnglishName;
                txt_riwen.Value = model.nvc_JapaneseName;
                txt_hanwen.Value = model.nvc_koreanName;

                

            }
        }
    }
    protected void btOK_Click(object sender, EventArgs e)// 添加专利类型
    {
        t_IntegralProductType model = new t_IntegralProductType();
        
        if (hd.Value != "0")
        {
            model = DALPT.IntegralProductType_Select_Id(Convert.ToInt32(hd.Value));
            
        }
        model.i_ParentId = int.Parse(DropDownList1.SelectedValue);
        model.nvc_ChinaName = txt_zhongwen.Value.Trim();
        model.nvc_EnglishName = txt_yingwen.Value.Trim();
        model.nvc_JapaneseName = txt_riwen.Value.Trim();
        model.nvc_koreanName = txt_hanwen.Value.Trim();
        model.nvc_ParentName=DALPT.IntegralProductType_Select_Id(model.i_ParentId??1).nvc_ChinaName;

        if (hd.Value != "0")
        {
            
            #region
            if (DALPT.IntegralProductType_Update(model) == 1)
            {

                Manager.AddLog(0, "商品分类管理", "修改了商品小分类[ <font color=\"red\">" + model.nvc_ChinaName + "</font> ]的信息");//修改专利类型日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_SubIntegralProductType.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=商品分类&hreftype=2&href1=Shop_A_SubIntegralProductType.aspx&href2=" + twourl);
            }
            #endregion
        }
        else
        {
            #region
            //添加专利类型 
            int returnId = 0;
            if (DALPT.IntegralProductType_Add(model) > 0)
            {


                Manager.AddLog(0, "商品分类管理", "添加了商品小分类[ <font color=\"red\">" + model.nvc_ChinaName + "</font> ]");//添加专利类型日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_SubIntegralProductType.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=商品分类&hreftype=1&href1=Shop_A_SubIntegralProductType.aspx&href2=" + twourl);
            }
            #endregion
        }
    }
}