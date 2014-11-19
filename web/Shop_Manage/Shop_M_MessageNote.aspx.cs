using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;

public partial class Shop_Manage_shop_smscount : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(56, 0);
    public bool pageadd = Manager.GetManagerQX(56, 1);
    public bool pagedel = Manager.GetManagerQX(56, 3);
    dal_Message dal = new dal_Message();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        HiddenDel.Value = "";
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
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(Drp_LanguageList);
            Bind_DDL_TType();
            Bind_Rpt_List(1);
        }
    }
    public void Bind_DDL_TType()
    {
        ListItem item = new ListItem("所有类型", "所有类型");
        this.ddlType.Items.Add(item);
        DataSystemDataContext dsdc = new DataSystemDataContext();
        var q = from a in dsdc.t_MessageNote group a by new { a.nvc_NoteType } into f select new { leibie = f.Key.nvc_NoteType };
        ddlType.DataSource = q;
        ddlType.DataTextField = "leibie";
        ddlType.DataValueField = "leibie";
        ddlType.DataBind();
    }
    public void Bind_Rpt_List(int pageCurrent)
    {
        int count = 0;
        this.rplist.DataSource = dal.MessageNote_SelectPage(pageCurrent, aspPage.PageSize, user_namee.Value, ddlState.SelectedValue, ddlType.SelectedValue,Drp_LanguageList.SelectedValue, ref  count);
        this.rplist.DataBind();
        aspPage.RecordCount = count;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List(aspPage.CurrentPageIndex);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal.MessageNote_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "短信管理", "删除短信发送流水");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btnSarch_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
}
