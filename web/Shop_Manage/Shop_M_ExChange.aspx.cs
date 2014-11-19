using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class Shop_Manage_shengmanage : System.Web.UI.Page
{
    public int ye = 1;
    public string Keyword = "";
    public bool ifhave = Manager.GetManagerQX(46, 2);
    dal_Nationality country = new dal_Nationality();
    public string CType = "1";
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
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Page_value();
            BindBrand(ye, this.hoot.Value);
        }
        if (Manager.GetManagerQX(46, 3) == false)
        {
            this.Button2.Visible = false;
        }
    }

    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["CType"] != null && Request.QueryString["CType"].ToString() != "")
        {
            ddl_CType.SelectedValue = Request.QueryString["CType"].ToString();
            CType = ddl_CType.SelectedValue;
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
        {
            this.hoot.Value = Request.QueryString["Keyword"].ToString();
        }
    }
    private void BindBrand(int pageCurrent, string name)
    {
        Keyword = name;
        int PageSize = 20;

        int count = 0;
        this.rep_brand.DataSource = country.Nationality_SelectPage(pageCurrent, PageSize, name, int.Parse(ddl_CType.SelectedValue), ref count);
        this.rep_brand.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        BindBrand(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex, this.hoot.Value);
        ye = aspPage.CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BindBrand(1, this.hoot.Value);
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal_Address area = new dal_Address();
                area.Province_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "国籍管理", "批量删除国际");
        }
        BindBrand(aspPage.CurrentPageIndex, "");
        HiddenDel.Value = "del";
    }
    protected void rep_brand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        var query = country.Nationality_Select_Id(int.Parse(id));
        TextBox tb_cn = (TextBox)e.Item.FindControl("tb_cn");
        TextBox exchange = (TextBox)e.Item.FindControl("tb_exchange");
        TextBox Meiyuan = (TextBox)e.Item.FindControl("tb_Meiyuan");
        if (query != null)
        {
            if (e.CommandName.ToString() == "update")
            {
                query.dm_Exchange = decimal.Parse(tb_cn.Text);
              query.dm_Exchange1 =decimal.Parse(exchange.Text);
              query.dm_Exchange2 = decimal.Parse(Meiyuan.Text);
            }
        }
        Manager.AddLog(0, "汇率管理", "修改国家汇率信息");
        country.Nationality_Update(query);
        BindBrand(aspPage.CurrentPageIndex, "");
    }


    protected void rep_brand_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        foreach (var item in rep_brand.Items)
        {
            
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
       
        foreach (RepeaterItem item in rep_brand.Items)
        {
            CheckBox check = (CheckBox)item.FindControl("CheckBox2");
            Button lb = (Button)item.FindControl("bt_update");
                int id = int.Parse(lb.CommandArgument.ToString());
                var query = country.Nationality_Select_Id(id);
                TextBox tb_cn = (TextBox)item.FindControl("tb_cn");
                TextBox exchange = (TextBox)item.FindControl("tb_exchange");
                TextBox Meiyuan = (TextBox)item.FindControl("tb_Meiyuan");
                if (query != null)
                {
                    query.dm_Exchange = decimal.Parse(tb_cn.Text);
                    query.dm_Exchange1 = decimal.Parse(exchange.Text);
                    query.dm_Exchange2 = decimal.Parse(Meiyuan.Text);
                    country.Nationality_Update(query);
                }
        }
        BindBrand(aspPage.CurrentPageIndex, "");    
    }
}