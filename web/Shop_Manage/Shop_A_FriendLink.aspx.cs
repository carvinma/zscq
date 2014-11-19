using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.IO;

public partial class Shop_Manage_Link_AddLink : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(73, 0);
    public bool pageadd = Manager.GetManagerQX(73, 1);
    public bool pageupdate = Manager.GetManagerQX(73, 2);
    dal_FriendLink DALFL = new dal_FriendLink();
    dal_QuYu DALQY = new dal_QuYu();

    public string returnurl = "";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Value();
        }
    }
    void Bind_QuYu_Parent(int pid, int count)
    {
        var iquery = DALQY.QuYu_Select_Pid(pid);
        foreach (t_QuYu quyu in iquery)
        {
            DDL_QY.Items.Add(new ListItem(MakeFelgefu(count) + quyu.nvc_Value, quyu.nvc_Path + quyu.i_Id + ","));
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
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            int Id = int.Parse(Request.QueryString["id"].ToString());
            Hi_Id.Value = Id.ToString();
            Bind_Page_Info(Id);
        }
        else
        {
            Bind_QuYu_Parent(0, 0);
        }
        if (Request.QueryString["fid"] != null && Request.QueryString["fid"].ToString() != "")
        {
            int Id = int.Parse(Request.QueryString["fid"].ToString());
            Bind_Page_Info(Id);
        }
    }
    void Bind_Page_Info(int Id)
    {
        t_FriendLink model = DALFL.FriendLink_Select_Id(Id);
        Bind_QuYu_Parent(0, 0);
        tborderby.Text = model.i_Orderby.ToString();
        tbsitename.Text = model.nvc_LinkName;
        entbsitename.Text = model.nvc_enLinkName;
        krtbsitename.Text = model.nvc_krLinkName;
        jptbsitename.Text = model.nvc_jpLinkName;
        tburl.Text = model.nvc_Link;
        DDL_Type.SelectedValue = model.nvc_TypePath;
        DDL_QY.SelectedValue = model.nvc_QuYuPath;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        t_FriendLink model = new t_FriendLink();
        if (Hi_Id.Value != "0")
        {
            model = DALFL.FriendLink_Select_Id(Convert.ToInt32(Hi_Id.Value));
        }

        try
        {
            model.i_Orderby = int.Parse(tborderby.Text);
        }
        catch { }

        if (FileUpload1.HasFile)
        {
            string exname = Path.GetExtension(FileUpload1.FileName).ToLower();

            if (!".jpeg|.jpg|.bmp|.png|.bmp|.gif".Contains(exname))
            {
                Label1.Text = "文件格式错误！"; return;
            }
            if (FileUpload1.PostedFile.ContentLength > 1024 * 1024 * 1)
            {
                Label1.Text = "文件大小不能超过1MB"; return;
            }
            else
            {
                string newname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999)) + exname;
                string path = System.Web.HttpContext.Current.Server.MapPath("../Upload_News/images/") + newname;
                FileUpload1.PostedFile.SaveAs(path);
                model.nvc_Pic = "Upload_News/images/" + newname;
            }
        }
        model.nvc_TypePath = DDL_Type.SelectedValue;
        model.nvc_QuYuPath = DDL_QY.SelectedValue;
        model.nvc_LinkName = tbsitename.Text;
        model.nvc_enLinkName = entbsitename.Text;
        model.nvc_krLinkName = krtbsitename.Text;
        model.nvc_jpLinkName = jptbsitename.Text;

        model.nvc_Link = tburl.Text;

        if (Hi_Id.Value != "0")
        {
            DALFL.FriendLink_Submit(model);
            Manager.AddLog(0, "友情链接管理", "修改了友情链接[ <font color=\"red\">" + tbsitename.Text + "</font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_FriendLink.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=友情链接&hreftype=2&href1=Shop_A_FriendLink.aspx&href2=" + twourl);
        }
        else
        {
            DALFL.FriendLink_Add(model);
            Manager.AddLog(0, "友情链接管理", "添加了友情链接[ <font color=\"red\">" + tbsitename.Text + "<font> ]");
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_FriendLink.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
            Response.Redirect("shop_manageok.aspx?hrefname=友情链接&hreftype=1&href1=Shop_A_FriendLink.aspx&href2=" + twourl);
        }
    }
}
