using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_shop_NewsClassAdd : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(61, 0);
    public bool pageadd = Manager.GetManagerQX(61, 1);
    public bool pageupdate = Manager.GetManagerQX(61, 2);
    public bool pagedel = Manager.GetManagerQX(61, 3);

    dal_NewsType DALNT = new dal_NewsType();
    public StringBuilder table_Category = new StringBuilder();
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
        div_a.InnerHtml = "";
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            if (Request.QueryString["type"] == "delete" && Request.QueryString["did"] != null)
            {
                Delate_NewsType();
            }
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_List();
        }
    }
    public void Bind_Page_List()
    {
        var iquery = DALNT.NewsType_SelectAll(0);

        if (iquery.Count() > 0)
        {
            //if (pagedel)
            //{
            //    table_Category.Append("<table cellspacing='1' cellpadding='3'><tr><td><input name=\"checkall\" id=\"checkall2\" type=\"checkbox\" onclick=\"SelAll(this)\" /><input type=\"button\" id=\"Button2\" value=\"删除\" onclick=\"xwshow()\" class=\"button\" />&nbsp;</td></tr></table>");
            //}
            table_Category.Append("<table cellspacing='1' cellpadding='3'><tr><th>类别</th><th width=\"80\">ID</th><th width=\"80\">序号</th><th width=\"160\">操作</th></tr>");

            CreateHtml(0, 0);
            table_Category.Append("</table>");

            if (pagedel)
            {
                table_Category.Append("<table cellspacing='1' cellpadding='3'><tr><td><input name=\"checkall\" id=\"checkall\" type=\"checkbox\" onclick=\"SelAll(this)\" />&nbsp;<input type=\"button\" id=\"Button1\" value=\"删除\" onclick=\"xwshow()\" class=\"button\" /></td></tr></table>");
            }
        }
    }
    private void CreateHtml(int Parent, int count)
    {
        var IQuery_P = DALNT.NewsType_SelectAll(Parent, ddl_language.SelectedValue);
        foreach (var q in IQuery_P)
        {
            StringBuilder html = new StringBuilder();
            var IQuery_S = DALNT.NewsType_SelectAll(int.Parse(q.i_Id.ToString()));
            if (IQuery_S.Count() > 0)
            {
                table_Category.Append(string.Format("<tr id=\"tr{0}\" style=\"display:{1};\"><td height=\"25\"><span style=\"margin-left:{2}px\"><img name=\"img{3}\" id=\"img{4}\" src=\"images/tree_folder4.gif\" style=\"cursor:pointer;\" onclick=\"fold({5});\"/>", Parent, Parent == 0 ? "" : "none", 30 * count, Parent, q.i_Id, q.i_Id));
            }
            else
            {
                table_Category.Append(string.Format("<tr id=\"tr{0}\" style=\"display:{1};\"><td height=\"25\"><span style=\"margin-left:{2}px\">", Parent, Parent == 0 ? "" : "none", 30 * count));
            }
            if (q.i_IsAllow == 0)
            {
                table_Category.Append(string.Format("<input name=\"inputPageid\"  onclick=\"Selbox(this)\"  value=\"{0}\" type=\"checkbox\"/><b>{1}({2})</b></span></td>", q.i_Id, q.nvc_Name, IQuery_S.Count()));
            }
            else
            {
                table_Category.Append(string.Format("&nbsp;&nbsp;<b>{0}({1})</b></span></td>", q.nvc_Name, IQuery_S.Count()));
            }
            table_Category.Append(string.Format("<td align=\"center\">{0}</td>", q.i_Id));
            table_Category.Append(string.Format("<td align=\"center\">{0}</td><td align=\"center\">", q.i_Orderby));
            if (pageadd)
            {
                table_Category.Append(string.Format("<input type=\"button\" style=\"margin-left:20px\" title=\"添加\" class=\"inputicoaddbutton\" onclick=\"window.location='Shop_A_NewsType.aspx?id={0}&type=add&lang={1}'\"/>", q.i_Id, ddl_language.SelectedValue));
            }
            if (pageupdate)
            {
                table_Category.Append(string.Format("<input type=\"button\" style=\"margin-left:20px\" title=\"修改\" class=\"inputicoeditbutton\" onclick=\"window.location='Shop_A_NewsType.aspx?id={0}&type=updata&lang={1}'\">", q.i_Id, ddl_language.SelectedValue));
            }
            if (pagedel && q.i_IsAllow == 0)
            {
                table_Category.Append(string.Format("<input type=\"button\" style=\"margin-left:20px\" title=\"删除\" class=\"inputicodelbutton\" onclick=\"if(window.confirm('确定要删除此分类吗？删除此分类将同时删除所包含的信息，并且不能恢复！'))window.location='Shop_M_NewsType.aspx?did={0}&type=delete&lang={1}'\" />", q.i_Id, ddl_language.SelectedValue));
            }
            table_Category.Append("</td></tr>\n\r");
            CreateHtml(q.i_Id, count + 1);
        }
    }
    protected void lbtn_Delete_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                if (IDList[i] != "")
                {
                    DALNT.NewsType_Del(int.Parse(IDList[i]));
                }
            }
            Manager.AddLog(0, "新闻管理", "删除新闻类别");
            HiddenDel.Value = "del";
            Bind_Page_List();
        }
    }
    public void Delate_NewsType()// 删除
    {
        if (Request.QueryString["type"] == "delete")
        {
            int id = int.Parse(Request.QueryString["did"].ToString());
            DALNT.NewsType_Del(id);
            Manager.AddLog(0, "新闻管理", "删除新闻分类");
        }
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Page_List();
    }

}
