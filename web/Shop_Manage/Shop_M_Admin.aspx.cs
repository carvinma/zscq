using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;

public partial class Shop_Manage_shop_admin : System.Web.UI.Page
{
    public bool mgpageview = Manager.GetManagerQX(81, 0);
    public bool mgpageadd = Manager.GetManagerQX(81, 1);
    public bool mgpageupdate = Manager.GetManagerQX(81, 2);
    public bool mgpagedel = Manager.GetManagerQX(81, 3);
    public bool mpageview = Manager.GetManagerQX(80, 0);
    public bool mpageadd = Manager.GetManagerQX(80, 1);
    public bool mpageupdate = Manager.GetManagerQX(80, 2);
    public bool mpagedel = Manager.GetManagerQX(80, 3);
    dal_ManagerGroup DALMG = new dal_ManagerGroup();
    dal_Manager DALM = new dal_Manager();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!mpageview && !mgpageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
            {
                Delete();
            }
            Bind_Rpt_Manager();
        }
    }
    void Delete()
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        DALMG.ManagerGroup_Del(id);
        Manager.AddLog(0, "权限管理", "删除管理组");
        HiddenDel.Value = "del";
    }
    public void Bind_Rpt_Manager()
    {
        Rpt_ManagerGroup.DataSource = DALMG.ManagerGroup_SelectAll();
        Rpt_ManagerGroup.DataBind();

        rep_brand.DataSource = DALM.Manager_Select_GId(0);
        rep_brand.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                dal_Manager dal = new dal_Manager();
                dal.Manager_Del(int.Parse(IDList[i]));
                Manager.AddLog(0, "权限管理", "删除管理员");
            }
            HiddenDel.Value = "del";
            Bind_Rpt_Manager();
        }
    }
    protected void Rpt_ManagerGroup_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            Repeater Rpt_Manager = (Repeater)e.Item.FindControl("Rpt_Manager");
            HiddenField Hi_Id = (HiddenField)e.Item.FindControl("Hi_Id");
            Label Lb_Items = (Label)e.Item.FindControl("Lb_Items");
            Rpt_Manager.DataSource = DALM.Manager_Select_GId(Convert.ToInt32(Hi_Id.Value));
            Rpt_Manager.DataBind();
            Lb_Items.Text = "（" + Rpt_Manager.Items.Count + "）";
        }
        catch { }
    }
}
