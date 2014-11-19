using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.Model;
public partial class nianfei : System.Web.UI.Page
{
    dal_Nationality DALNA = new dal_Nationality();
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_PatentFee DALPF = new dal_PatentFee();
    public string countryId = "1", feetypeId = "1", currency = "", countryName = "", countrydesc = "";
    public string html_country = "";
    public string _Title = "특허연차료 조회";
    public string _Name = "";
    public string _Content = "";
    public string ShopName = "Global Patent";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public string TitleOrKeyword = "";

    void Bind_Page_Title()
    {
        dal_SystemSetup DALSS = new dal_SystemSetup();
        t_SystemSetup t = DALSS.SystemSetup_Select();
        if (t.nvc_ShopName != null && t.nvc_ShopName != "")
        {
            ShopName = t.nvc_ShopName;
        }
        if (t.nvc_ShopKeywords != null && t.nvc_ShopKeywords != "")
        {
            ShopKeywords = t.nvc_ShopKeywords;
        }
        if (t.nvc_ShopDescription != null && t.nvc_ShopDescription != "")
        {
            ShopDescription = t.nvc_ShopDescription;
        }
    }
    void Bind_Page_Value()
    {
        dal_PageInfo DALPI = new dal_PageInfo();
        t_PageInfo model = DALPI.PageInfo_Select_Id(37);
        _Title = string.IsNullOrWhiteSpace(model.PageTitle) ? _Title : model.PageTitle;
        ShopDescription = string.IsNullOrWhiteSpace(model.PageDescription) ? ShopDescription : model.PageDescription;
        ShopKeywords = string.IsNullOrWhiteSpace(model.PageKeywords) ? ShopKeywords : model.PageKeywords;
        TitleOrKeyword = "<title>" + _Title + "_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["feetype"]))
        {
            feetypeId = Request.QueryString["feetype"];
        }
        if (!string.IsNullOrEmpty(Request.QueryString["countryid"]))
        {
            countryId = Request.QueryString["countryid"];
        }
        try
        {
            Bind_Page_Title();
            Bind_Page_Value();
            Bind_County();
            Bind_Rpt_PatentTypeList();
        }
        catch
        {
            Response.Write("<script>history.go(-1);</Script>");
        }
    }
    void Bind_County()
    {
        selContry.Items.Clear();
        StringBuilder sb = new StringBuilder();
        sb.Append("var scountry=new Array(");
        var iquery = DALNA.Nationality_SelectAll();
        foreach (var i in iquery)
        {
            selContry.Items.Add(new ListItem(i.nvc_HanName, i.i_Id.ToString()));
            if (countryId == i.i_Id.ToString())
            {
                currency = i.nvc_Currency;
                countryName = i.nvc_HanName;
                countrydesc = i.nt_krDescription;
            }
            sb.Append(string.Format("[{0},'{1}','{2}'],", i.i_Id, i.nvc_HanName, i.nvc_Currency));
        }
        html_country = sb.ToString().TrimEnd(',') + ");";
        selContry.Value = countryId;
    }
    void Bind_Rpt_PatentTypeList()
    {
        int count = 0;
        var iquery = DALPT.PatentType_SelectPage(1, 10, int.Parse(countryId), ref count);
        if (count == 0)
        {
            div_title.InnerHtml = "</br>상응한 내용이 없습니다";
        }
        Rpt_PatentTypeList.DataSource = iquery;
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
            var result = DALPF.PatentFee_SelectPage(1, 100, guojiaid, id, ref count);
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
        switch (feetypeId)
        {
            case "1": s = "dm_ShouXuFee"; break;
            case "2": s = "dm_ShouXuFee1"; break;
            case "0": s = "dm_ShouXuFee2"; break;
        }
        return s;
    }
    protected string GetBindAgentServiceFeeFiled()
    {
        string s = "dm_AgentServiceFee";
        switch (feetypeId)
        {
            case "1": s = "dm_AgentServiceFee"; break;
            case "2": s = "dm_AgentServiceFee1"; break;
            case "0": s = "dm_AgentServiceFee2"; break;
        }
        return s;
    }
    protected string GetBindTotalFeeFiled()
    {
        string s = "dm_TotalFee";
        switch (feetypeId)
        {
            case "1": s = "dm_TotalFee"; break;
            case "2": s = "dm_TotalFee1"; break;
            case "0": s = "dm_TotalFee2"; break;
        }
        return s;
    }
    protected string FeeToUsd(object money)
    {
        try
        {
            decimal dec = Convert.ToDecimal(money);
            var country = DALNA.Nationality_Select_Id(Convert.ToInt32(countryId));
            var cusd = DALNA.Nationality_Select_Id(2);//美元汇率
            decimal rel = (dec / country.dm_Exchange1) >= (dec / country.dm_Exchange2) ? dec / country.dm_Exchange1 : dec / country.dm_Exchange2;
            return rel.ToString("N");
        }
        catch
        {
            return Convert.ToString(money);
        }
    }
    protected void lbtn_search_Click(object sender, EventArgs e)
    {
        Bind_Rpt_PatentTypeList();
    }
}