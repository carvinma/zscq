using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using System.Data;
using zscq.DAL;

public partial class Shop_Manage_shop_yhj : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(38, 0);
    public bool pagedel = Manager.GetManagerQX(38, 3);
    public bool pagechu = Manager.GetManagerQX(38, 4);
    dal_Coupon DALC = new dal_Coupon();
    dal_Member DALM = new dal_Member();
    public int uid = 0;
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
        if (Request.QueryString["uid"] != null && Request.QueryString["uid"] != "0")
        {
            uid = int.Parse(Request.QueryString["uid"].ToString());
        }
        if (!IsPostBack)
        {
            Bind_DDL_Type();
            Bind_Rpt_List(1);
        }
    }
    public void Bind_DDL_Type()
    {
        DDL_CouponType.Items.Add(new ListItem("所有优惠券种类", "0"));
        DDL_CouponType.DataSource = DALC.CouponType_Select_All();
        DDL_CouponType.DataTextField = "nvc_Name";
        DDL_CouponType.DataValueField = "i_Id";
        DDL_CouponType.DataBind();
    }
    private void Bind_Rpt_List(int pageIndex)// 绑定列表
    {
        int pageSize = 20;
        int count = 0;
        IQueryable query = DALC.Coupon_Select_Page(pageIndex, pageSize, txtProName.Value, DDL_SType.SelectedValue, uid, DDL_CouponType.SelectedValue, DDL_State.SelectedValue, DDL_TimeType.SelectedValue, hot_start_date.Value, hot_end_date.Value, ref count);
        Repeater1.DataSource = query;
        Repeater1.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pageSize;
        aspPage.CurrentPageIndex = pageIndex;
        Session["data"] = query;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
    }
    protected void btnzf_Click(object sender, EventArgs e)//作废操作
    {
        if (Request.Form["inputPageid"] != null)
        {
            dal_Coupon Coub = new dal_Coupon();
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                if (IDList[i] != "")
                {
                    Coub.Coupon_Del(int.Parse(IDList[i]));
                }
            }
            Manager.AddLog(0, "优惠券管理", "批量删除优惠券");
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btnso_Click(object sender, EventArgs e)
    {
        Bind_Rpt_List(1);
    }
    public string Geturla(string uid)
    {
        string urla = "";
        t_Member t = DALM.Member_Select_Id(int.Parse(uid));
        if (t.i_MemberType != null)
        {
            if (t.i_MemberType == 1)
            {
                urla = "<a href='Shop_U_User.aspx?id=" + t.i_Id.ToString() + "&type=1'>" + t.nvc_Name + "</a>";
            }
            if (t.i_MemberType == 2)
            {
                urla = "<a href='Shop_U_SBUser.aspx?id=" + t.i_Id.ToString() + "&type=2'>" + t.nvc_Name + "</a>";
            }
        }
        return urla;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int count = 0;
        GridView1.DataSource = DALC.Coupon_Select_Page(1, 100000000, txtProName.Value, DDL_SType.SelectedValue, uid, DDL_CouponType.SelectedValue, DDL_State.SelectedValue, DDL_TimeType.SelectedValue, hot_start_date.Value, hot_end_date.Value, ref count);
        GridView1.DataBind();
        toExecl();
        GridView1.DataSource = null;
        GridView1.DataBind();
        Manager.AddLog(0, "优惠券管理", "导出优惠券列表");

    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl()
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        // 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.Default;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        this.GridView1.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//翻页aspPage_PageChanged
    {
        Bind_Rpt_List(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
}
