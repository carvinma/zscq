using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_A_Country : System.Web.UI.Page
{
    dal_Nationality country = new dal_Nationality();
    public string content = "";
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
        if (Manager.GetManagerQX(41, 1) == false || Manager.GetManagerQX(41, 2) == false)
        {
            this.But_Add.Visible = false;
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                H_Id.Value = Request.QueryString["id"];
                t_Nationality t = country.Nationality_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
                this.Country.Value = t.nvc_Name;
                this.enCountry.Value = t.nvc_EnName;
                this.englishCountry.Value = t.nvc_EnglishName;
                this.bz.Value = t.nvc_Currency;
                this.jpCountry.Value = t.nvc_JpanName;
                this.hanCountry.Value =t.nvc_HanName;

                //txtChg.InnerHtml = t.nvc_HanName;
                //txtChg.Attributes["style"] = "display:none";

                Txt_Short.Value = t.nvc_Short;
                myContent.Value = t.nt_Description;
				myContent2.Value = t.nt_enDescription;
				myContent3.Value = t.nt_krDescription;
				myContent4.Value = t.nt_jpDescription;
                this.t_jiaonaguo.Value = t.nvc_JFBizhong;
            }
            if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
            {
                Hidden1.Value = Request.QueryString["ye"].ToString();
            }
            if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
            {
                Hidden2.Value = Request.QueryString["Keyword"].ToString();
            }
        }
    }
    protected void But_Add_Click(object sender, EventArgs e)
    {
        t_Nationality model = new t_Nationality();
        if (H_Id.Value != "0")
        {
            model = country.Nationality_Select_Id(int.Parse(H_Id.Value));
        }
        model.nvc_Name = this.Country.Value.Trim();
        model.nvc_EnName = this.enCountry.Value.Trim();
        model.nvc_EnglishName = this.englishCountry.Value.Trim();
        model.nvc_JpanName = this.jpCountry.Value.Trim();
        model.nvc_HanName = this.hanCountry.Value.Trim();
        model.nvc_Currency = this.bz.Value;
        model.nvc_Short = Txt_Short.Value;
        model.nvc_JFBizhong = t_jiaonaguo.Value; 
        model.nt_Description = myContent.Value;
		model.nt_enDescription = myContent2.Value;
		model.nt_krDescription = myContent3.Value;
		model.nt_jpDescription = myContent4.Value;
        model.i_UpdateTime = DateTime.Now;
        if (H_Id.Value != "0")
        {
            //  model.i_Id = int.Parse(H_Id.Value.ToString());
            country.Nationality_Update(model);
            Manager.AddLog(0, "国籍管理", "修改了国籍[ <font color=\"red\">" + model.nvc_Name + "</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Country.aspx?ye=" + Hidden1.Value + "&Keyword=" + Hidden2.Value, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=国籍&hreftype=2&href1=Shop_A_Country.aspx&href2=" + twourl);
        }
        else
        {
            if (country.Nationality_Add(model) > 0)
            {
                Manager.AddLog(0, "国籍管理", "添加国籍[ <font color=\"red\">" + model.nvc_Name + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Country.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=国籍&hreftype=1&href1=Shop_A_Country.aspx&href2=" + twourl);
            }
        }
    }
}