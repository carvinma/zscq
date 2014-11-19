using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.Data.Linq;
using System.Collections;
public partial class Shop_Manage_Link_islink : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(74, 0);
    public bool pageadd = Manager.GetManagerQX(74, 1);
    public bool pageupdate = Manager.GetManagerQX(74, 2);
    public bool pagedel = Manager.GetManagerQX(74, 3);
    dal_FriendLink DALFL = new dal_FriendLink();
    dal_QuYu DALQY = new dal_QuYu();

    public int ye = 1;
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
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_QuYu_Parent(0, 0);
            Bind_Page_Value();
            Bind_Page_List(ye);
        }
    }
    void Bind_QuYu_Parent(int pid, int count)
    {
        if (count == 0)
        {
            ddl_CQuYu.Items.Add(new ListItem("所属区域", "-1"));
        }
        var iquery = DALQY.QuYu_Select_Pid(pid);

        foreach (t_QuYu quyu in iquery)
        {
            ddl_CQuYu.Items.Add(new ListItem(MakeFelgefu(count) + quyu.nvc_Value, quyu.nvc_Path + quyu.i_Id + ","));
            if (DALQY.QuYu_Select_Pid(quyu.i_Id).Count() > 0)
            {
                Bind_QuYu_Parent(quyu.i_Id, count + 1);
            }
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
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["title"] != null && Request.QueryString["title"] != "")
        {
            title.Value = Request.QueryString["title"];
        }
        if (Request.QueryString["CType"] != null && Request.QueryString["CType"] != "")
        {
            ddl_CType.SelectedValue = Request.QueryString["CType"];
        }
        if (Request.QueryString["CQuYu"] != null && Request.QueryString["CQuYu"] != "")
        {
            ddl_CQuYu.SelectedValue = Request.QueryString["CQuYu"];
        }
    }
    public void Bind_Page_List(int pageIndex)
    {
        int count = 0;
        DataSystemDataContext dsdc = new DataSystemDataContext();
        var iquery = from i in dsdc.t_FriendLink select i;
        if (title.Value != "")
        {
            iquery = iquery.Where(i => i.nvc_LinkName.Contains(title.Value));
        }
        if (ddl_CType.SelectedValue != "-1")
        {
            iquery = iquery.Where(i => i.nvc_TypePath == ddl_CType.SelectedValue);
        }
        if (ddl_CQuYu.SelectedValue != "-1")
        {
            iquery = iquery.Where(i => i.nvc_QuYuPath.Contains(ddl_CQuYu.SelectedValue));
        }
        count = iquery.Count();
        aspPage.RecordCount = count;

        this.Repeater1.DataSource = iquery.OrderBy(i => i.i_Orderby).Skip((pageIndex - 1) * aspPage.PageSize).Take(aspPage.PageSize); ;
        this.Repeater1.DataBind();
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Page_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void lbtn_Del_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALFL.FriendLink_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "友情链接管理", "删除友情链接");
        }
        Bind_Page_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        Bind_Page_List(aspPage.CurrentPageIndex);
    }

}
