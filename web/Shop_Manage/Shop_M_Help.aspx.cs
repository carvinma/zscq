using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_shop_type : System.Web.UI.Page
{
    public bool htpageview = Manager.GetManagerQX(70, 0);
    public bool htpageadd = Manager.GetManagerQX(70, 1);
    public bool htpageupdate = Manager.GetManagerQX(70, 2);
    public bool htpagedel = Manager.GetManagerQX(70, 3);
    public bool hpageview = Manager.GetManagerQX(71, 0);
    public bool hpageadd = Manager.GetManagerQX(71, 1);
    public bool hpageupdate = Manager.GetManagerQX(71, 2);
    public bool hpagedel = Manager.GetManagerQX(71, 3);
    dal_Help DALH = new dal_Help();
    dal_HelpType DALHT = new dal_HelpType();
    public int ye = 1;
    public string Keyword = "";
    public string TypeHelp = "";
    public string table_Category = "<table cellspacing='1' cellpadding='3'><tr><td align=\"center\">暂无帮助</td></tr></table>";
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
        if (!htpageview && !hpageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            if (Request.QueryString["pagetype"] != null && Request.QueryString["pagetype"].ToString() != "")
            {
                Delete();
            }
            Bind_Rpt_List(ye);
        }
    }
    public void Delete()
    {
        if (Request.QueryString["pagetype"].ToString() == "del")
        {
            if (DALHT.HelpType_Del(int.Parse(Request.QueryString["htid"].ToString())) == 1)
            {
                Manager.AddLog(0, "帮助管理", "删除帮助类别");
                HiddenDel.Value = "del";
            }
            else
            {
                div_a.InnerHtml = "<script>alert('删除失败');</script>";
            }
        }
    }
    public void Bind_Rpt_List(int pageCurrent)
    {
        IQueryable<t_HelpType> IQuery_P = DALHT.HelpType_SelectAll();
        if (IQuery_P.Count() > 0)
        {
            if (hpagedel)
            {
                table_Category = "<table cellspacing='1' cellpadding='3'><tr><td><input name=\"checkall\" id=\"checkall2\" type=\"checkbox\" onclick=\"SelAll(this)\" />&nbsp;<input" +
                              " type=\"button\" id=\"Button2\" value=\"删除\" onclick=\"xwshow()\" class=\"button\" /></td></tr></table>";
            }
            else
            {
                table_Category = "";
            }
            table_Category += "<table cellspacing='1' cellpadding='3'><tr><th>标题</th><th width=\"80\">添加帮助</th><th width=\"80\">修改</th><th width=\"80\">删除</th></tr>";
            foreach (var q in IQuery_P)
            {
                int ccount = 0;
                IQueryable<vw_Help> IQuery_S = DALH.Help_SelectPage(1, 100000000, "", q.i_Id, ref ccount);

                table_Category += ("<tr ><td><a href=\"###\" onclick=\"fold(" + q.i_Id + ");\"><img id=\"img" + q.i_Id + "\" src=\"images/tree_folder4.gif\"");
                table_Category += (" style=\"border:0;\"><b>" + q.nvc_Name.ToString() + "（" + IQuery_S.Count() + "）</b></a></td>");
                string haddstr = "";
                if (hpageadd)
                {
                    haddstr = "<input type=\"button\" class=\"inputicoaddbutton\" onclick=\"javascript:window.location='Shop_A_Help.aspx?htid=" + q.i_Id + "'\" title=\"添加\" />";
                }
                table_Category += ("<td align=\"center\">" + haddstr + "</td>");
                string delstr = "";
                if (htpagedel)
                {
                    delstr = "<input type=\"button\" class=\"inputicodelbutton\" onclick=\"if (!confirm('确定删除？')) {return false;} else {window.location='Shop_M_Help.aspx?pagetype=del&htid=" + q.i_Id + "';}\" />";
                }
                string updatestr = "";
                if (htpageupdate)
                {
                    updatestr = "<input type=\"button\" class=\"inputicoeditbutton\" onclick=\"javascript:window.location='Shop_A_HelpType.aspx?tid=" + q.i_Id + "'\" title=\"修改\" />";
                }
                table_Category += ("<td align=\"center\">" + updatestr + "</td><td align=\"center\">" + delstr + "</td></tr>\n\r");

                StringBuilder html = new StringBuilder();
                foreach (var p in IQuery_S)
                {
                    html.Append("<tr id=\"tr" + q.i_Id + "\" style=\"display:none;\"><td colspan=\"4\"><span style=\"margin-left:30px\"><input name=\"inputPageid\" onclick=\"Selbox(this)\"");
                    string hupdatestr = "";
                    if (hpageadd)
                    {
                        hupdatestr = "<a href=\"Shop_A_Help.aspx?hid=" + p.i_Id + "\">" + p.nvc_Title + "</a>";
                    }
                    html.Append(" value=\"" + p.i_Id + "\" type=\"checkbox\"/>" + hupdatestr + "</span></td></tr>\n\r");
                }
                table_Category += html;
            }
            table_Category += "</table>";
            if (hpagedel)
            {
                table_Category += "<table cellspacing='1' cellpadding='3'><tr><td><input name=\"checkall\" id=\"checkall\" type=\"checkbox\" onclick=\"SelAll(this)\" />&nbsp;<input" +
                              " type=\"button\" id=\"Button1\" value=\"删除\" onclick=\"xwshow()\" class=\"button\" /></td></tr></table>";
            }
        }

        //int count = 0;
        //Keyword = this.txtKeyword.Text.Trim();
        //TypeHelp = this.ddlType.SelectedValue;
        //this.rpList.DataSource = DALH.Help_SelectPage(pageCurrent, aspPage.PageSize, Keyword, int.Parse(TypeHelp), ref count);
        //this.rpList.DataBind();
        //aspPage.RecordCount = count;
        //aspPage.CurrentPageIndex = pageCurrent;
        //Lb_sum.Text = "共" + count + "条";
        //Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
        ye = ((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex;
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALH.Help_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "帮助管理", "删除帮助信息");
            Bind_Rpt_List(0);
            HiddenDel.Value = "del";
        }
    }
}
