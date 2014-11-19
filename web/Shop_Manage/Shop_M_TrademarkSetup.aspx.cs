using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;

public partial class Shop_Manage_shop_upsystem : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(47, 0);
    public bool pageupdate = Manager.GetManagerQX(47, 2);
    dal_TrademarkSetup DALS = new dal_TrademarkSetup();   
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
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public void Bind_Page_Info()
    {
        t_TradeMarkSetup model = DALS.TrademarkSetup_Select();
        if (model != null)
        {
            dlguanfei.Value = model.dm_TrademarkMoney.ToString();
            dldaili.Value = model.dm_TMDaiLi.ToString();
            dlzhinajin.Value = model.dm_TMZhiNaJin.ToString();
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        t_TradeMarkSetup model = DALS.TrademarkSetup_Select();
        model.dm_TrademarkMoney = Convert.ToDecimal(dlguanfei.Value);
        model.dm_TMDaiLi = Convert.ToDecimal(dldaili.Value);
        model.dm_TMZhiNaJin = Convert.ToDecimal(dlzhinajin.Value);
        DALS.TrademarkSetup_Submit();
        Manager.AddLog(0, "商标管理", "修改了商标设置");
        Response.Redirect(Request.Url.ToString());
    }
}