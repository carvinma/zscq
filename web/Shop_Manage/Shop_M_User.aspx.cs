using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using System.Data;
using zscq.Model;
using zscq.BLL;
using System.IO;

public partial class Shop_Manage_shop_user : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Address DALB = new dal_Address();
    dal_Member soldal = new dal_Member();
    dal_Collection DALR = new dal_Collection();
    dal_Coupon DALCP = new dal_Coupon();
    dal_Nationality DALN = new dal_Nationality();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_UserGrade DALG = new dal_UserGrade();
    public bool pageview = false;// Manager.GetManagerQX(10, 0);
    public bool pageupdate = false;// Manager.GetManagerQX(10, 2);
    public bool pagedel = false;// Manager.GetManagerQX(10, 3);
    public bool pagechu = false;// Manager.GetManagerQX(10, 4);
    public int ye = 1;
    public string Keyword = "";
    public int TypeUser = 0;
    public string statiem = "";
    public string endtime = "";
    public string grade = "";
    public int scou = 0;
    public int bzyh = 0;
    public int qqyh = 0;
    public int sinayh = 0;
    public int alipayyh = 0;
    public int qbyh = 0;
    public int GId = 0;
    public int PId = 0;
    public int CId = 0;
    public int AId = 0;
    public int type = 0;
    int ObField = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.QueryString["type"] != null && Request.QueryString["type"] != "")
        {
            type = int.Parse(Request.QueryString["type"].ToString());
            if (type == 1)
            {
                pageview = Manager.GetManagerQX(10, 0);
                pageupdate = Manager.GetManagerQX(10, 2);
                pagedel = Manager.GetManagerQX(10, 3);
                pagechu = Manager.GetManagerQX(10, 4);
            }
            if (type == 2)
            {
                pageview = Manager.GetManagerQX(20, 0);
                pageupdate = Manager.GetManagerQX(20, 2);
                pagedel = Manager.GetManagerQX(20, 3);
                pagechu = Manager.GetManagerQX(20, 4);
            }
        }
        else
        {
            Response.Redirect("Shop_Index.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            BindGrade();
            DALN.Nationality_Bind_DDL(ddl_country);
            //DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_country.SelectedValue);
            //DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
            //DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
            Bind_Page_value();
            Bind_Rpt_List(ye);
        }
    }
    public void Bind_Page_value()
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
            //DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_country.SelectedValue);
        }
        //if (Request.QueryString["PId"] != null && Request.QueryString["PId"] != "" && Request.QueryString["PId"] != "0")
        //{
        //    ddl_sheng.SelectedValue = Request.QueryString["PId"].ToString();
        //    DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
        //}
        //if (Request.QueryString["CId"] != null && Request.QueryString["CId"] != "" && Request.QueryString["CId"] != "0")
        //{
        //    ddl_city.SelectedValue = Request.QueryString["CId"].ToString();
        //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
        //}
        //if (Request.QueryString["AId"] != null && Request.QueryString["AId"] != "" && Request.QueryString["AId"] != "0")
        //{
        //    ddl_diqu.SelectedValue = Request.QueryString["AId"].ToString();
        //}
    }
    public void BindGrade()
    {
        var iquery = DALG.UserGrade_Select_All2();
        ddl_grade.Items.Add(new ListItem("全部等级", ""));
        foreach (var v in iquery)
        {
            ddl_grade.Items.Add(new ListItem(v.nvc_Name.ToString(), v.i_id.ToString()));
        }
    }
    //protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_country.SelectedValue);
    //    DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    //}
    //protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.City_Bind_DDL_PId(ddl_city, ddl_sheng.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    //}
    //protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.Area_Bind_DDL_CId(ddl_diqu, ddl_city.SelectedValue);
    //}
    public void Bind_Rpt_List(int pageIndex)//绑定
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
        //PId = int.Parse(ddl_sheng.SelectedValue);
        //CId = int.Parse(ddl_city.SelectedValue);
        //AId = int.Parse(ddl_diqu.SelectedValue);
        grade = ddl_grade.SelectedValue;
        statiem = hot_start_date.Value;
        endtime = hot_end_date.Value;
        if (type != 0)
        {
            IQueryable<vw_Member> query2 = DALU.Member_SelectPage(pageIndex, pageSize, type, TypeUser, Keyword, GId, PId, CId, AId, grade, statiem, endtime, ObField, ref count);
            this.rept_list.DataSource = query2;
            this.rept_list.DataBind();
            aspPage.RecordCount = count;
            aspPage.PageSize = pageSize;
            aspPage.CurrentPageIndex = pageIndex;
            Lb_sum.Text = "共" + count + "条";
            Lb_ye.Text = "共" + aspPage.PageCount + "页";
        }
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)//分页
    {
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        ye = aspPage.CurrentPageIndex;
    }
    protected void btnDel_Click(object sender, EventArgs e)//删除会员
    {
        dal_Member userdal = new dal_Member();
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                t_Member user = userdal.Member_Select_Id(int.Parse(IDList[i]));
                string username = user.nvc_Name != null ? user.nvc_Name : "异常";
                Manager.AddLog(0, "会员管理", "删除会员：" + username);
                userdal.Member_Del(int.Parse(IDList[i]));
            }
        }
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void btExProt_Click(object sender, EventArgs e)//导出会员列表
    {
        if (Request.QueryString["type"] != null || Request.QueryString["type"] != "")
        {
            type = int.Parse(Request.QueryString["type"].ToString());


            int types = 0;
            string statiem = Request.Form["hot_start_date"];
            string endtime = Request.Form["hot_end_date"];
            if (Request.Form["selectt"] != null)
            {
                types = int.Parse(Request.Form["selectt"]);
            }
            int ccount = 0;
            if (type != 0)
            {
                IQueryable<vw_Member> IQuery = soldal.Member_SelectPage(1, 100000000, type, user_namee.Value.Trim(), 0, types, statiem, endtime, 0, 0, ref ccount);
                GridView1.DataSource = IQuery;
                GridView1.DataBind();

                toExecl();
                GridView1.DataSource = null;
                GridView1.DataBind();
                Manager.AddLog(0, "会员管理", "导出会员信息列表");
            }
        }
    }
    protected void btSelect_Click(object sender, EventArgs e)//搜索
    {
        Bind_Rpt_List(1);
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //这个方法不能删除掉 
    }
    private void toExecl()
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls");  //这里的FileName.xls可以用变量动态替换
        Response.ContentEncoding = System.Text.Encoding.UTF8;// 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        this.GridView1.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    public void CreateExcel(DataTable dt, string FileName, HttpResponse response)// 导出Execl（带表头）
    {
        HttpResponse resp;
        resp = response;
        FileName = System.Web.HttpUtility.UrlEncode(System.Text.Encoding.UTF8.GetBytes(FileName));
        resp.ContentEncoding = System.Text.Encoding.Default;
        resp.AppendHeader("Content-Disposition", "attachment;filename=" + FileName + ".xls");
        string colHeaders = "", ls_item = "";

        //定义表对象与行对象，同时用DataSet对其值进行初始化 

        DataRow[] myRow = dt.Select();//可以类似dt.Select("id>10")之形式达到数据目的
        int i = 0;
        int cl = dt.Columns.Count;

        //取得数据表各列标题，各标题之间以t分割，最后一个列标题后加回车符 
        for (i = 0; i < cl; i++)
        {
            if (i == (cl - 1))//最后一列，加n
            {
                colHeaders += dt.Columns[i].Caption.ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\n";
            }
            else
            {
                colHeaders += dt.Columns[i].Caption.ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\t";
            }

        }
        resp.Write(colHeaders.Replace("\r", " "));
        //向HTTP输出流中写入取得的数据信息 

        //逐行处理数据   
        foreach (DataRow row in myRow)
        {
            //当前行数据写入HTTP输出流，并且置空ls_item以便下行数据     
            for (i = 0; i < cl; i++)
            {
                if (i == (cl - 1))//最后一列，加n
                {
                    ls_item += row[i].ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\n";
                }
                else
                {
                    ls_item += row[i].ToString().Replace("\n", " ").Replace("\"", "\"\"") + "\t";
                }

            }
            resp.Write(ls_item.Replace("\r", " "));
            ls_item = "";

        }
        resp.End();
    }

    public int Set_Collection(object id)//获取评价数
    {
        try
        {
            int ccount = 0;
            DALR.Collection_Select_MemberId(1, 100000000, Convert.ToInt32(id), ref ccount);
            return ccount;
        }
        catch { }
        return 0;
    }
    public int Set_Coupon(object id)//优惠券
    {
        try
        {
            int ccount = 0;
            DALCP.Coupon_Select_Page_MemberId(1, 100000000, Convert.ToInt32(id), 0, ref ccount);
            return ccount;
        }
        catch { }
        return 0;
    }
    protected void bt_gift_Click(object sender, EventArgs e)
    {
        int types = 0;
        if (Request.Form["selectt"] != null)
        {
            types = int.Parse(Request.Form["selectt"]);
        }
        Response.Redirect("Shop_Apl_Gift_Coupon.aspx?yemianType=Gift&lintype=1&keyword=" + this.user_namee.Value.Trim() + "&beginTime=" + Request.Form["hot_start_date"] + "&EndTime=" + Request.Form["hot_end_date"] + "&types=" + types + "");
    }
    protected void bt_coupon_Click(object sender, EventArgs e)
    {
        int types = 0;
        if (Request.Form["selectt"] != null)
        {
            types = int.Parse(Request.Form["selectt"]);
        }
        Response.Redirect("Shop_Apl_Gift_Coupon.aspx?yemianType=Coupon&lintype=1&keyword=" + this.user_namee.Value.Trim() + "&beginTime=" + Request.Form["hot_start_date"] + "&EndTime=" + Request.Form["hot_end_date"] + "&types=" + types + "");
    }
    public string Set_Address(object TId, int SType)
    {
        if (TId != null)
        {
            switch (SType)
            {
                case 1:
                    t_Province Pro = DALB.Province_Select_Id(Convert.ToInt32(TId));
                    if (Pro != null)
                        return Pro.provinceName;
                    break;
                case 2:
                    t_City City = DALB.City_Select_Id(Convert.ToInt32(TId));
                    if (City != null)
                        return City.cityName;
                    break;
                case 3:
                    t_Area Area = DALB.Area_Select_Id(Convert.ToInt32(TId));
                    if (Area != null)
                        return Area.areaName;
                    break;
            }
        }
        return "";
    }
    public string Set_MemberType(object QQ, object Alipay, object Sina)
    {
        if (QQ != null && QQ.ToString() == "1")
        {
            return "QQ会员";
        }
        else if (Alipay != null && Alipay.ToString() == "1")
        {
            return "支付宝会员";
        }
        else if (Sina != null && Sina.ToString() == "1")
        {
            return "新浪会员";
        }
        else
        {
            return "本站会员";
        }
    }
    protected void Bt_UserName_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shop_Apl_StationMessage.aspx?type=1&uType=" + type + "&keyword=" + user_namee.Value.Trim() + "&SType=" + selectt.Value + "&beginTime=" + hot_start_date.Value + "&EndTime=" + hot_end_date.Value + "&GId=" + ddl_country.SelectedValue + "&Grade=" + ddl_grade.SelectedValue);//+ "&PId=" + ddl_sheng.SelectedValue + "&CId=" + ddl_city.SelectedValue + "&AId=" + ddl_diqu.SelectedValue);
    }
    protected void Bt_Phone_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shop_Apl_MessageNote.aspx?PageType=Phone&type=1&uType=" + type + "&keyword=" + user_namee.Value.Trim() + "&SType=" + selectt.Value + "&beginTime=" + hot_start_date.Value + "&EndTime=" + hot_end_date.Value + "&GId=" + ddl_country.SelectedValue + "&Grade=" + ddl_grade.SelectedValue);// + "&PId=" + ddl_sheng.SelectedValue + "&CId=" + ddl_city.SelectedValue + "&AId=" + ddl_diqu.SelectedValue);
    }
    protected void Bt_Mail_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shop_Apl_Mail.aspx?PageType=Mail&uType=" + type + "&Keyword=" + user_namee.Value.Trim() + "&SType=" + selectt.Value + "&STime=" + hot_start_date.Value + "&ETime=" + hot_end_date.Value + "&GId=" + ddl_country.SelectedValue + "&Grade=" + ddl_grade.SelectedValue);// + "&PId=" + ddl_sheng.SelectedValue + "&CId=" + ddl_city.SelectedValue + "&AId=" + ddl_diqu.SelectedValue);
    }
    protected string GetUserPatentCountByMemberId(int id)
    {
        var PatentList = from o in dzdc.t_Patent where o.i_MemberId == id select o.i_Id;
        return PatentList.Count().ToString();
    }
    protected string GetUserTrademarkCountByUserId(int userid)
    {
        var TrademarkList = from o in dzdc.t_Trademark where o.i_MemberId == userid select o.i_Id;
        return TrademarkList.Count().ToString();
    }
    public int getUserIntegral(object oid)
    {
        var model = DALIM.IntegralMobile_SelectByMemberId(Convert.ToInt32(oid));
        if (model != null)
        {
            return model.i_Integral;
        }
        else
        {
            return 0;
        }
    }

    #region 排序
    protected void Ob1(object sender, CommandEventArgs e)
    {
        Lbtn_1.Visible = false;
        Lbtn_11.Visible = true;
        ObField = 1;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob11(object sender, CommandEventArgs e)
    {
        Lbtn_1.Visible = true;
        Lbtn_11.Visible = false;
        ObField = 11;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob2(object sender, CommandEventArgs e)
    {
        Lbtn_2.Visible = false;
        Lbtn_22.Visible = true;
        ObField = 2;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_1.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob22(object sender, CommandEventArgs e)
    {
        Lbtn_2.Visible = true;
        Lbtn_22.Visible = false;
        ObField = 11;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_1.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob3(object sender, CommandEventArgs e)
    {
        Lbtn_3.Visible = false;
        Lbtn_33.Visible = true;
        ObField = 3;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob33(object sender, CommandEventArgs e)
    {
        Lbtn_3.Visible = true;
        Lbtn_33.Visible = false;
        ObField = 33;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob4(object sender, CommandEventArgs e)
    {
        Lbtn_4.Visible = false;
        Lbtn_44.Visible = true;
        ObField = 4;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob44(object sender, CommandEventArgs e)
    {
        Lbtn_4.Visible = true;
        Lbtn_44.Visible = false;
        ObField = 44;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob5(object sender, CommandEventArgs e)
    {
        Lbtn_5.Visible = false;
        Lbtn_55.Visible = true;
        ObField = 5;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob55(object sender, CommandEventArgs e)
    {
        Lbtn_5.Visible = true;
        Lbtn_55.Visible = false;
        ObField = 55;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob6(object sender, CommandEventArgs e)
    {
        Lbtn_6.Visible = false;
        Lbtn_66.Visible = true;
        ObField = 6;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob66(object sender, CommandEventArgs e)
    {
        Lbtn_6.Visible = true;
        Lbtn_66.Visible = false;
        ObField = 66;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob7(object sender, CommandEventArgs e)
    {
        Lbtn_7.Visible = false;
        Lbtn_77.Visible = true;
        ObField = 7;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob77(object sender, CommandEventArgs e)
    {
        Lbtn_7.Visible = true;
        Lbtn_77.Visible = false;
        ObField = 77;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_88.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob8(object sender, CommandEventArgs e)
    {
        Lbtn_8.Visible = false;
        Lbtn_88.Visible = true;
        ObField = 8;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_99.Visible = false;
    }
    protected void Ob88(object sender, CommandEventArgs e)
    {
        Lbtn_8.Visible = false;
        Lbtn_88.Visible = true;
        ObField = 88;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_1.Visible = true;
        Lbtn_9.Visible = true;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_11.Visible = false;
        Lbtn_99.Visible = false;
    }

    protected void Ob9(object sender, CommandEventArgs e)
    {
        Lbtn_9.Visible = false;
        Lbtn_99.Visible = true;
        ObField = 9;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;

    }
    protected void Ob99(object sender, CommandEventArgs e)
    {
        Lbtn_9.Visible = true;
        Lbtn_99.Visible = false;
        ObField = 99;
        Bind_Rpt_List(aspPage.CurrentPageIndex);
        Lbtn_1.Visible = true;
        Lbtn_2.Visible = true;
        Lbtn_3.Visible = true;
        Lbtn_4.Visible = true;
        Lbtn_5.Visible = true;
        Lbtn_6.Visible = true;
        Lbtn_7.Visible = true;
        Lbtn_8.Visible = true;
        Lbtn_11.Visible = false;
        Lbtn_22.Visible = false;
        Lbtn_33.Visible = false;
        Lbtn_44.Visible = false;
        Lbtn_55.Visible = false;
        Lbtn_66.Visible = false;
        Lbtn_77.Visible = false;
        Lbtn_88.Visible = false;
    }
    #endregion

    protected void rept_list_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        string id = e.CommandArgument.ToString();
        var query = from q in dmdc.t_Member where q.i_Id == int.Parse(id) select q;
        foreach (var q in query)
        {
            if (e.CommandName.ToString() == "IsReceiveEmail")
            {
                if (q.i_ReceiveEmail == 1) { q.i_ReceiveEmail = 0; } else { q.i_ReceiveEmail = 1; }
            }
        }
        Manager.AddLog(0, "会员管理", "修改会员列表信息");
        dmdc.SubmitChanges();
        Bind_Rpt_List(ye);
    }
    //*chy//
    public string GetSuoZaiDiQu(int provice, int city, int area)
    {
        string s = "";
        try
        {
            s = DALB.Province_Select_Id(provice).provinceName + DALB.City_Select_Id(city).cityName + DALB.Area_Select_Id(area).areaName;
        }
        catch { }
        return s;
    }
    public string GetDuanXinTiXing(int flag)
    {
        return flag == 1 ? "是" : "否";
    }
    public string GetSex(int flag)
    {
        return flag == 1 ? "男" : "女";
    }
    public string GetBiZhong(int id)
    {
        string s = "";
        try
        {
            s = DALN.Nationality_Select_Id(id).nvc_JFBizhong;
        }
        catch { }
        return s;
    }
    public string GetXinYongDengJi(int id)
    {
        string s = "";
        try
        {
            s = DALG.UserGrade_Select_Id(id).nvc_Name;
        }
        catch { }
        return s;
    }
    public string GetVipPower(object power, int dazhe)
    {
        string s = "";
        if (power != null)
        {
            try
            {
                if (power.ToString().Split(',')[0] == "1")
                {
                    s += "导入,";
                }
                if (power.ToString().Split(',')[0] == "1")
                {
                    s += "导出,";
                }
                if (power.ToString().Split(',')[0] == "1")
                {
                    s += "修改,";
                }
                if (power.ToString().Split(',')[0] == "1")
                {
                    s += "删除,";
                }
                if (dazhe != 0)
                {
                    s += "打" + (Convert.ToDouble(dazhe) / 10) + "折";
                }
                else
                {
                    s += "不打折";
                }
            }
            catch { }
        }


        return s;
    }
    //***//
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (type == 2)
        {
            e.Row.Cells[31].Visible = false;
        }
        else
        {
            e.Row.Cells[32].Visible = false;
        }
    }
}