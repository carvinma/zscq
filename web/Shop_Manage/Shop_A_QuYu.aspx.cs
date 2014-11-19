using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_Shop_A_QuYu : System.Web.UI.Page
{
    dal_QuYu DALQY = new dal_QuYu();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        div_a.InnerHtml = "";
        if (Manager.GetManagerQX(74, 1) == false || Manager.GetManagerQX(74, 2) == false)
        {
            this.But_Add.Visible = false;
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                H_Id.Value = Request.QueryString["id"];
            }
            Bind_Page_Value();
        }
    }
    void Bind_QuYu_Parent(int pid, int count)
    {
        var iquery = DALQY.QuYu_Select_Pid(pid);
        if (count == 0)
        {
            DDL_Parent.Items.Add(new ListItem("一级分类", ",0,"));
        }
        foreach (var quyu in iquery)
        {
            DDL_Parent.Items.Add(new ListItem(MakeFelgefu(count) + quyu.nvc_Value, quyu.nvc_Path + quyu.i_Id + ","));
            //if (DALQY.QuYu_Select_Pid(quyu.i_Id).Count() > 0)
            //{
            //    Bind_QuYu_Parent(quyu.i_Id, count + 1);
            //}
        }
    }
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        for (int i = 0; i < count; i++)
        {
            Returnwords += "|—";
        }
        return Returnwords;
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
        {
            var model = DALQY.QuYu_Select_Id(int.Parse(Request.QueryString["id"]));
            Bind_QuYu_Parent(0, 0);
            if (Request.QueryString["ctype"] == "update")
            {
                DDL_Parent.SelectedValue = model.nvc_Path;
                Country.Value = model.nvc_Value;
                enCountry.Value = model.nvc_enValue;
                krCountry.Value = model.nvc_krValue;
                jpCountry.Value = model.nvc_jpValue;
            }
            else
            {
                DDL_Parent.SelectedValue = "," + model.i_Pid + "," + model.i_Id + ",";
            }
        }
        else
        {
            Bind_QuYu_Parent(0, 0);
        }
    }
    protected void But_Add_Click(object sender, EventArgs e)
    {
        t_QuYu model = new t_QuYu();
        if (H_Id.Value != "0" && Request.QueryString["ctype"] == "update")
        {
            model = DALQY.QuYu_Select_Id(int.Parse(H_Id.Value));
        }
        model.nvc_Path = DDL_Parent.SelectedValue;
        model.i_Pid = int.Parse(DDL_Parent.SelectedValue.Trim(',').Split(',').Last());
        model.nvc_Value = Country.Value;
        model.nvc_enValue = enCountry.Value;
        model.nvc_krValue = krCountry.Value;
        model.nvc_jpValue = jpCountry.Value;
        if (Request.QueryString["ctype"] == "update")
        {
            DALQY.QuYu_Updata(model);
            Manager.AddLog(0, "区域管理", "修改了区域[ <font color=\"red\">" + model.nvc_Value + "</font> ]的信息");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_QuYu.aspx?lang=" + Request.QueryString["lang"]);
            Response.Redirect("shop_manageok.aspx?hrefname=区域&hreftype=2&href1=Shop_A_QuYu.aspx&href2=" + twourl);
        }
        else
        {
            if (DALQY.QuYu_Add(model) > 0)
            {
                Manager.AddLog(0, "区域管理", "添加区域[ <font color=\"red\">" + model.nvc_Value + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_QuYu.aspx?lang=" + Request.QueryString["lang"]);
                Response.Redirect("shop_manageok.aspx?hrefname=区域&hreftype=1&href1=Shop_A_QuYu.aspx&href2=" + twourl);
            }
        }
    }

}