using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;
public partial class Shop_Manage_Shop_M_QuYu : System.Web.UI.Page
{
    public bool ifhave = Manager.GetManagerQX(74, 2);
    public bool pageview = Manager.GetManagerQX(74, 0);
    public bool pageadd = Manager.GetManagerQX(74, 1);
    public bool pageupdate = Manager.GetManagerQX(74, 2);
    public bool pagedel = Manager.GetManagerQX(74, 3);
    dal_QuYu DALQY = new dal_QuYu();
    public string table_Category = "<table cellspacing='1' cellpadding='3'><tr><td align=\"center\">暂无信息</td></tr></table>";
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
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
            Bind_Page_List();
        }
    }
    public void Bind_Page_List()
    {
        IQueryable<t_QuYu> IQuery_P = DALQY.QuYu_Select_Pid(0);
        if (IQuery_P.Count() > 0)
        {
            //table_Category = "<table cellspacing='1' cellpadding='3'><tr><td><input name=\"checkall\" id=\"checkall2\" type=\"checkbox\" onclick=\"SelAll(this)\" />&nbsp;<input type=\"button\" id=\"Button2\" value=\"删除\" onclick=\"xwshow()\" class=\"button\" /></td></tr></table>";
            table_Category = "<table cellspacing='1' cellpadding='3'><tr><th>类别</th><th width=\"80\">添加子类</th><th width=\"80\">修改</th></tr>";
            CreateHtml(0, 0);
            table_Category += "</table><table cellspacing='1' cellpadding='3'><tr><td><input name=\"checkall\" id=\"checkall\" type=\"checkbox\" onclick=\"SelAll(this)\" />&nbsp;<input" +
                              " type=\"button\" id=\"Button1\" value=\"删除\" onclick=\"xwshow()\" class=\"button\" /></td></tr></table>";
        }
    }
    private void CreateHtml(int Parent, int count)
    {
        IQueryable<t_QuYu> IQuery_P = DALQY.QuYu_Select_Pid(Parent);
        foreach (var q in IQuery_P)
        {
            StringBuilder html = new StringBuilder();
            IQueryable<t_QuYu> IQuery_S = DALQY.QuYu_Select_Pid(int.Parse(q.i_Id.ToString()));
            if (IQuery_S.Count() > 0)
            {
                html.Append("<tr id=\"tr" + Parent + "\"" + (Parent == 0 ? "" : " style=\"display:none;\"") + "><td height=\"25\"><span style=\"margin-left:" + (count * 30) + "px\"><img name=\"img" + Parent + "\" id=\"img" + q.i_Id + "\" src=\"images/tree_folder4.gif\" style=\"cursor:pointer;\" ");
                html.Append("onclick=\"fold(" + q.i_Id + ");\"><input name=\"inputPageid\" onclick=\"Selbox(this)\" value=\"" + q.i_Id + "\" type=\"checkbox\"/><b>" + q.nvc_Value.ToString() + "（" + IQuery_S.Count() + "）</b></span></td>");
                html.Append("<td height=\"25\" align=\"center\"><input type=\"button\" " + (Parent == 0 ? " " : " style=\"display:none;\"") + " title=\"添加\" class=\"inputicoaddbutton\" onclick=\"window.location='Shop_A_QuYu.aspx?ctype=add&id=" + q.i_Id + "'\"> </td><td height=\"25\" align=\"center\"><input type=\"button\" title=\"修改\" class=\"inputicoeditbutton\" onclick=\"window.location='Shop_A_QuYu.aspx?ctype=update&id=" + q.i_Id + "'\"></td></tr>\n\r");
                //<a href=\"Shop_A_ProductCategory.aspx?ctype=update&id=" + q.i_Id + "\">修改</a>
                //<a href=\"Shop_A_ProductCategory.aspx?ctype=add&id=" + q.i_Id + "\">添加</a>
            }
            else
            {
                html.Append("<tr id=\"tr" + Parent + "\"" + (Parent == 0 ? "" : " style=\"display:none;\"") + "><td height=\"25\"><span style=\"margin-left:" + (count * 30) + "px\"><input name=\"inputPageid\" onclick=\"Selbox(this)\" value=\"" + q.i_Id + "\" type=\"checkbox\"/>" + q.nvc_Value + "</span></td><td height=\"25\" align=\"center\"><input type=\"button\" " + (Parent == 0 ? " " : " style=\"display:none;\"") + " title=\"添加\" class=\"inputicoaddbutton\" onclick=\"window.location='Shop_A_QuYu.aspx?ctype=add&id=" + q.i_Id + "'\"></td><td height=\"25\" align=\"center\">");
                html.Append("<input type=\"button\" title=\"修改\" class=\"inputicoeditbutton\" onclick=\"window.location='Shop_A_QuYu.aspx?ctype=update&id=" + q.i_Id + "'\"></td></tr>\n\r");
            }
            table_Category += html;
            CreateHtml(q.i_Id, count + 1);
        }
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页
    {
        Bind_Page_List();
    }
    protected void lbtn_Ok_Click(object sender, EventArgs e)
    {
        dal_QuYu DALN = new dal_QuYu();
        if (pagedel)
        {
            if (Request.Form["inputPageid"] != null)
            {
                string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
                for (int i = 0; i < IDList.Length; i++)
                {
                    DALN.QuYu_Delete(int.Parse(IDList[i]));
                }
                Manager.AddLog(0, "Link区域管理", "批量删除区域");
            }
            Bind_Page_List();
            HiddenDel.Value = "del";
        }

    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Page_List();
    }
}