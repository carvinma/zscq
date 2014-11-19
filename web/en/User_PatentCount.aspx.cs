using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class User_PatentCount : System.Web.UI.Page
{
    public dal_Patent DALP = new dal_Patent();
    dal_Nationality DALN = new dal_Nationality();
    public StringBuilder sb_count = new StringBuilder();
    public int uId = 0,TotalCount=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            Bind_Patent_Count(uId);
            Bind_Rpt_PatentCountList();
        }
        else
        {
            Response.Redirect("Index.aspx");
        }
    }
    void Bind_Patent_Count(int id)
    {
        TotalCount = DALP.Patent_SelectView_AnnualFeeStatusisshow(0, id);
        Ltl_PatentCount_1.Text=DALP.Patent_SelectView_AnnualFeeStatusisshow(1,id).ToString();
        Ltl_PatentCount_2.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(2, id).ToString();
        Ltl_PatentCount_3.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(3, id).ToString();
        Ltl_PatentCount_4.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(4, id).ToString();
        Ltl_PatentCount_5.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(5, id).ToString();
        Ltl_PatentCount_6.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(6, id).ToString();
        Ltl_PatentCount_7.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(7, id).ToString();
        Ltl_PatentCount_8.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(8, id).ToString();
        Ltl_PatentCount_9.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(9, id).ToString();
        Ltl_PatentCount_10.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(10, id).ToString();
        Ltl_PatentCount_11.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(11, id).ToString();
        Ltl_PatentCount_12.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(12, id).ToString();
        Ltl_PatentCount_13.Text = DALP.Patent_SelectView_AnnualFeeStatusisshow(13, id).ToString();
    }
    void Bind_Rpt_PatentCountList()
    {
        IQueryable<t_Nationality> iquery = DALN.Nationality_SelectAll();
        int i = 0;
        int yushu = 0;
        foreach (var q  in iquery)
        {
            if (DALP.Patent_SelectView_AuthorizeNationalityId(Convert.ToInt32(q.i_Id), uId)>0)
            {
                i++;
                string s = "";
                yushu = i % 5;
                if (yushu == 0)
                {
                    s = "index_main5pro1e";
                }
                sb_count.Append("<div class=\"index_main5proe auto " + s + "\">");
                sb_count.Append("<div class=\"index_main5protite auto\">");
                sb_count.Append(q.nvc_EnName + "：<a href=\"User_PatentList.aspx?ShouQuanGuo="+q.i_Id+"\" class=\"ac_hei\">");
                sb_count.Append(DALP.Patent_SelectView_AuthorizeNationalityId(Convert.ToInt32(q.i_Id), uId));
                sb_count.Append("</a>");
                sb_count.Append("</div>");
                sb_count.Append("</div>");
            }
        }
        if (yushu > 0)
        {
            for (int a = 0; a < 5 - yushu; a++)
            {
                if (a == 5 - yushu-1)
                {
                    sb_count.Append("<div class=\"index_main5proe index_main5pro1e auto\">");
                }
                else
                {
                    sb_count.Append("<div class=\"index_main5proe auto\">");
                }
                sb_count.Append("<div class=\"index_main5protite auto\"></div>");
                sb_count.Append("</div>");
            }
        }
    }
}