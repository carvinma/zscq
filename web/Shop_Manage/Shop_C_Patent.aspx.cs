﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_Shop_C_Patent : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataViewDataContext dvdc = new DataViewDataContext();
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_UserGrade DALG = new dal_UserGrade();
    public int ye = 1;
    public string Keyword = "";
    public int TypeUser = 0;
    public string statiem = "";
    public string endtime = "";
    public string grade = "";
    public int GId = 0;
    public int type = 0;
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
        if (!IsPostBack)
        {
            BindGrade();
            DALN.Nationality_Bind_DDL(ddl_country);
            Bind_Page_value();
            Bind_Rpt_List(ye);
        }
    }
    void BindGrade()
    {
        var iquery = DALG.UserGrade_Select_All2();
        ddl_grade.Items.Add(new ListItem("全部等级", ""));
        foreach (var v in iquery)
        {
            ddl_grade.Items.Add(new ListItem(v.nvc_Name.ToString(), v.i_id.ToString()));
        }
    }
    void Bind_Page_value()
    {
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString());
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"] != "")
        {
            this.user_namee.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["TypeUser"] != null && Request.QueryString["TypeUser"] != "")
        {
            selectt.Value = Request.QueryString["TypeUser"].ToString();
        }
        if (Request.QueryString["Grade"] != null && Request.QueryString["Grade"] != "")
        {
            ddl_grade.SelectedValue = Request.QueryString["Grade"].ToString();
        }
        if (Request.QueryString["statiem"] != null && Request.QueryString["statiem"] != "")
        {
            hot_start_date.Value = Request.QueryString["statiem"].ToString();
        }
        if (Request.QueryString["endtime"] != null && Request.QueryString["endtime"] != "")
        {
            hot_end_date.Value = Request.QueryString["endtime"].ToString();
        }
        if (Request.QueryString["GId"] != null && Request.QueryString["GId"] != "" && Request.QueryString["GId"] != "0")
        {
            ddl_country.SelectedValue = Request.QueryString["GId"].ToString();
        }
    }
    void Bind_Rpt_List(int pageIndex)//绑定
    {
        dal_Member DALU = new dal_Member();
        int pageSize = 20;
        int count = 0;
        Keyword = user_namee.Value.Trim();
        if (Keyword != "")
        {
            TypeUser = int.Parse(selectt.Value);
        }
        GId = int.Parse(ddl_country.SelectedValue);
        grade = ddl_grade.SelectedValue;
        statiem = hot_start_date.Value;
        endtime = hot_end_date.Value;

        IQueryable<vw_Member> query2 = DALU.Member_SelectPage(pageIndex, pageSize, 1, TypeUser, Keyword, GId, 0, 0, 0, grade, statiem, endtime, 0, ref count);
        this.rept_list.DataSource = query2;
        this.rept_list.DataBind();
        aspPage.RecordCount = count;
        aspPage.PageSize = pageSize;
        aspPage.CurrentPageIndex = pageIndex;
        Lb_sum.Text = "共" + count + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";

    }
    protected void btSelect_Click(object sender, EventArgs e)//搜索
    {
        Bind_Rpt_List(1);
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//分页
    {
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        ye = aspPage.CurrentPageIndex;
    }
    protected void rept_list_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rpt_1 = e.Item.FindControl("rept_list1") as Repeater;
            int id = int.Parse(((HiddenField)e.Item.FindControl("Hi_Id")).Value);
            var result1 = from i in dzdc.t_Patent where i.i_MemberId == id select new { i.i_AuthorizeNationalityId, i.i_MemberId };
            rpt_1.DataSource = result1.Distinct();
            rpt_1.DataBind();
        }
    }
    public string GetGuoJiaNameById(object id)
    {
        string ss = "未知国家";
        t_Nationality model = DALN.Nationality_Select_Id(Convert.ToInt32(id));
        if (model != null)
        {
            ss = model.nvc_Name;
        }
        return ss;
    }
    public int GetPatentCountById(object id)
    {
        var result = from i in dzdc.t_Patent where i.i_MemberId == Convert.ToInt32(id) select i;
        return result.Count();
    }
    public int GetPatentCountById(object id, object gid)
    {
        var result = from i in dzdc.t_Patent where i.i_MemberId == Convert.ToInt32(id) && i.i_AuthorizeNationalityId == Convert.ToInt32(gid) select i;
        return result.Count();
    }
}