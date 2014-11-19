using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_Shop_M_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(45, 0);
    public bool pageadd = Manager.GetManagerQX(45, 1);
    public bool pageupdate = Manager.GetManagerQX(45, 2);
    public bool pagedel = Manager.GetManagerQX(45, 3);
    public bool pagechu = Manager.GetManagerQX(45, 4);
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_PatentFee DALPF = new dal_PatentFee();
    dal_PatentYear DALPY = new dal_PatentYear();
    dal_Nationality DALN = new dal_Nationality();
    public int ye = 1;
    public string Keyword = "";
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
            Bind_Drp_GuoJiaType();
            Bind_Page_value();
            Bind_Rpt_PatentTypeList();
        }
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["GuoJiaType"] != null && Request.QueryString["GuoJiaType"] != "")
        {
            Drp_GuoJiaType.SelectedValue = Request.QueryString["GuoJiaType"].ToString();
        }
    }
    void Bind_Drp_GuoJiaType()
    {
        Drp_GuoJiaType.Items.Clear();
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_GuoJiaType.Items.Add(li);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Bind_Rpt_PatentTypeList();
    }
    protected void Delete_Year(object sender, CommandEventArgs e)
    {
        string s = e.CommandArgument.ToString();
        int PatentFeeId = Convert.ToInt32(s.Split('-')[0]);
        int PatentTypeId = Convert.ToInt32(s.Split('-')[1]);
        string NianDu = s.Split('-')[2];
        int YearId = DALPY.GetPatentYearByPatentYear(NianDu);
        if (YearId != 0)
        {
            t_PatentType model = DALPT.PatentType_Select_Id(PatentTypeId);
            if (model != null)
            {
                string PatentYear = "-" + model.nvc_PatentYear;
                if (PatentYear.IndexOf("-" + YearId + "-") >= 0)
                {
                    PatentYear = PatentYear.Replace("-" + YearId + "-", "-");
                    if (PatentYear.IndexOf("-") == 0)
                    {
                        PatentYear = PatentYear.Substring(1);
                    }
                    model.nvc_PatentYear = PatentYear;
                }
                DALPT.PatentType_Update(model);//修改专利类型表中nvc_PatentYear字段的信息
                DALPF.PatentFee_Del(PatentFeeId);//删除专利费用信息
                MessageBox.Show(Page, "删除成功");
                Bind_Rpt_PatentTypeList();
            }
        }
        else
        {
            MessageBox.Show(Page, "删除失败");
        }
    }
    void Bind_Rpt_PatentTypeList()
    {
        int count = 0;
        Rpt_PatentTypeList.DataSource = DALPT.PatentType_SelectPage(1,10,Convert.ToInt32(Drp_GuoJiaType.SelectedValue),ref count);
        Rpt_PatentTypeList.DataBind();
    }
    protected void Rpt_PatentTypeList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rpt_two = e.Item.FindControl("reptlist") as Repeater;
            int id = int.Parse(((HiddenField)e.Item.FindControl("HF_ID")).Value);
            int guojiaid = int.Parse(((HiddenField)e.Item.FindControl("HF_GuoJiaId")).Value);
            int count = 0;
            var result = DALPF.PatentFee_SelectPage(1, 100, guojiaid,id, ref count);
            if (result != null)
            {
                rpt_two.DataSource = result;
                rpt_two.DataBind();
            }
        }
    }
    protected string GetBindShouXuFeeFiled()
    {
        string s = "dm_ShouXuFee";
        switch (Drp_PayFeeType.SelectedValue)
        {
            case "0": s = "dm_ShouXuFee"; break;
            case "1": s = "dm_ShouXuFee1"; break;
            case "2": s = "dm_ShouXuFee2"; break;
        }
        return s;
    }
    protected string GetBindAgentServiceFeeFiled()
    { 
        string s ="dm_AgentServiceFee";
        switch(Drp_PayFeeType.SelectedValue)
        {
            case "0": s = "dm_AgentServiceFee"; break;
            case "1": s = "dm_AgentServiceFee1"; break;
            case "2": s = "dm_AgentServiceFee2"; break;
        }
        return s;
    }
    protected string GetBindTotalFeeFiled()
    {
        string s = "dm_TotalFee";
        switch (Drp_PayFeeType.SelectedValue)
        {
            case "0": s = "dm_TotalFee"; break;
            case "1": s = "dm_TotalFee1"; break;
            case "2": s = "dm_TotalFee2"; break;
        }
        return s;
    }

    protected string GetBiZhong(int guoji)
    {
        t_Nationality tn = DALN.Nationality_Select_Id(guoji);
        return tn.nvc_Currency;
    }
}