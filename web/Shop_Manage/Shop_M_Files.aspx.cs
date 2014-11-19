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
public partial class Shop_M_Files : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(64, 0);
    public bool pageadd = Manager.GetManagerQX(64, 1);
    public bool pageupdate = Manager.GetManagerQX(64, 2);
    public bool pagedel = Manager.GetManagerQX(64, 3);
    dal_Files DALF = new dal_Files();
    DataViewDataContext dvdc = new DataViewDataContext();
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
        if (Request.QueryString["PageType"] == "del")
        {
            DelFile();
        }
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_Value();
            Bind_Page_List();
        }
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            aspPage.CurrentPageIndex = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["title"] != null && Request.QueryString["title"] != "")
        {
            title.Value = Request.QueryString["title"];
        }
        if (Request.QueryString["CType"] != null && Request.QueryString["CType"] != "")
        {
            ddl_CType.SelectedValue = Request.QueryString["CType"];
        }
    }
    public void Bind_Page_List()
    {
       
        int count = 0;
        int pageindex = aspPage.CurrentPageIndex;
        int pagesize = aspPage.PageSize;
        var iquery = from i in dvdc.vw_Files select i;
        if (ddl_language.SelectedValue != "")
        {
            iquery = iquery.Where(i => i.nvc_Language == ddl_language.SelectedValue);
        }
        if (title.Value != "")
        {
            iquery = iquery.Where(i => i.nvc_FileName.Contains(title.Value));
        }
        if (ddl_CType.SelectedValue != "-1")
        {
            iquery = iquery.Where(i => i.i_TypeId.ToString() == ddl_CType.SelectedValue);
        }
        iquery = from i in iquery orderby i.dt_AddTime descending select i;
        count = iquery.Count();
        iquery = iquery.OrderBy(i => i.i_Order).Skip((pageindex - 1) * pagesize).Take(pagesize);
        
        aspPage.RecordCount = count;
        this.Repeater1.DataSource = iquery;
        this.Repeater1.DataBind();
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Page_List();
    }
    protected void lbtn_Del_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALF.Files_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "文件管理", "批量删除文件");
        }
        Bind_Page_List();
        HiddenDel.Value = "del";
    }
    void DelFile()
    {
        if (Request.Form["did"] != null)
        {
            int id = int.Parse(Request.Form["did"].ToString());
            DALF.Files_Del(id);
            Manager.AddLog(0, "文件管理", "删除文件");
        }
        Bind_Page_List();
        HiddenDel.Value = "del";
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        Bind_Page_List();
    }
    public string GetDW(object number)
    {
        decimal d = Convert.ToDecimal(number);
        if (d > 1024 * 1024)
        {
            return string.Format("{0:N2}MB", d / 1024 / 1024);
        }
        if (d > 1024)
        {
            return string.Format("{0:N2}KB", d / 1024);
        }
        return string.Format("{0:N2}B", d);


    }

}
