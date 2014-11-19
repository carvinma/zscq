using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class shop_zx : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(9, 0);
    public bool pageupdate = Manager.GetManagerQX(9, 2);
    public bool pagedel = Manager.GetManagerQX(9, 3);
    dal_OnlineMessage DALO = new dal_OnlineMessage();
    public int ye = 1;
    public string Keyword = "";
    public string TypePAdvisory = "1";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_value();
            Bind_Rpt_List(ye);
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"].ToString() != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"].ToString() != "")
        {
            txtProName.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["SType"] != null && Request.QueryString["SType"].ToString() != "")
        {
            DDL_SType.SelectedValue = Request.QueryString["SType"].ToString();
        }
        if (Request.QueryString["TType"] != null && Request.QueryString["TType"].ToString() != "")
        {
            DDL_TType.SelectedValue = Request.QueryString["TType"].ToString();
        }
        if (Request.QueryString["TimeType"] != null && Request.QueryString["TimeType"].ToString() != "")
        {
            DDL_TimeType.SelectedValue = Request.QueryString["TimeType"].ToString();
        }
        if (Request.QueryString["STime"] != null && Request.QueryString["STime"].ToString() != "")
        {
            txtStartDate.Value = Request.QueryString["STime"].ToString();
        }
        if (Request.QueryString["ETime"] != null && Request.QueryString["ETime"].ToString() != "")
        {
            txtEndDate.Value = Request.QueryString["ETime"].ToString();
        }
    }
    public void Bind_Rpt_List(int pageIndex)
    {
        int pageSize = 20;
        int count = 0;
        Repeater1.DataSource = DALO.OnlineMessage_SelectPage(pageIndex, pageSize, txtProName.Value, int.Parse(DDL_SType.SelectedValue), ddl_language.SelectedValue, int.Parse(DDL_TType.SelectedValue), int.Parse(DDL_TimeType.SelectedValue), txtStartDate.Value, txtEndDate.Value, ref count);
        Repeater1.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pageSize;
        aspPage.CurrentPageIndex = pageIndex;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void Btnproname_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
    protected void Btndel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALO.OnlineMessage_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "在线留言管理", "删除留言");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Replay")
            {
                TextBox TB_Replay = (TextBox)e.Item.FindControl("TB_Replay");
                int Id = int.Parse(e.CommandArgument.ToString());
                t_OnlineMessage model = DALO.OnlineMessage_Select_Id(Id);
                if (model != null)
                {
                    model.nvc_ReplayContent = TB_Replay.Text;
                    model.i_ManagerId = int.Parse(Request.Cookies["zscqmanage"]["userid"].ToString());
                    model.i_Replay = 1;
                    model.dt_ReplayTime = DateTime.Now;
                    if (DALO.OnlineMessage_Update(model) == 1)
                    {
                        Manager.AddLog(0, "在线留言管理", "回复留言");
                        Bind_Rpt_List(aspPage.CurrentPageIndex);
                    }
                }
            }
            if (e.CommandName == "IsTop")
            {
                Button TB_Replay = (Button)e.Item.FindControl("Btn_IsTop");
                int Id = int.Parse(e.CommandArgument.ToString());
                t_OnlineMessage model = DALO.OnlineMessage_Select_Id(Id);
                if (model != null)
                {
                    if (model.i_IsTop == 1)
                    {
                        model.i_IsTop = 0;
                    }
                    else
                    {
                        model.i_IsTop = 1;
                    }
                    if (DALO.OnlineMessage_Update(model) == 1)
                    {
                        Manager.AddLog(0, "在线留言管理", "状态修改");
                        Bind_Rpt_List(aspPage.CurrentPageIndex);
                    }
                }
            }
            if (e.CommandName == "IsRecommend")
            {
                Button TB_Replay = (Button)e.Item.FindControl("Btn_IsRecommend");
                int Id = int.Parse(e.CommandArgument.ToString());
                t_OnlineMessage model = DALO.OnlineMessage_Select_Id(Id);
                if (model != null)
                {
                    if (model.i_IsRecommend == 1)
                    {
                        model.i_IsRecommend = 0;
                    }
                    else
                    {
                        model.i_IsRecommend = 1;
                    }
                    if (DALO.OnlineMessage_Update(model) == 1)
                    {
                        Manager.AddLog(0, "在线留言管理", "状态修改");
                        Bind_Rpt_List(aspPage.CurrentPageIndex);
                    }
                }
            }
        }
        catch { }

    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }

}