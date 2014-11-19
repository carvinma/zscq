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
    public bool pageview = Manager.GetManagerQX(43, 0);
    public bool pageadd = Manager.GetManagerQX(43, 1);
    public bool pageupdate = Manager.GetManagerQX(43, 2);
    public bool pagedel = Manager.GetManagerQX(43, 3);
    public bool pagechu = Manager.GetManagerQX(43, 4);
    public dal_PatentYear DALPY = new dal_PatentYear();
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
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            Bind_Rpt_Patent();
        }
    }

    public void Bind_Rpt_Patent()
    {
        reptlist.DataSource = DALPY.PatentYear_SelectAll();
        reptlist.DataBind();
    }
    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        try
        {
            t_PatentYear model = new t_PatentYear();
            model.nvc_Year = Txt_Name.Text;
            model.i_OrderBy = Convert.ToInt32(Txt_OrderBy.Text);
            DALPY.PatentYear_Add(model);
            Bind_Rpt_Patent();
            Txt_Name.Text = "";
            Txt_OrderBy.Text = "";
        }
        catch { }
    }
    //public void Edit(object sender, CommandEventArgs e)
    //{
    //    int id = Convert.ToInt32(e.CommandName);
    //}

    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALPY.PatentYear_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "专利年份管理", "删除专利年份");
        }
        Bind_Rpt_Patent();
        HiddenDel.Value = "del";
    }

}