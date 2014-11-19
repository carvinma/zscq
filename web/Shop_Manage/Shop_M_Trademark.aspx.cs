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
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Shop_Manage_shop_delhw : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    public bool pagedel = Manager.GetManagerQX(21, 3);
    public bool pagechu = Manager.GetManagerQX(21, 4);
    dal_DataOrder DALD = new dal_DataOrder();
    dal_Trademark DALT = new dal_Trademark();
    dal_Member DALM=new dal_Member ();
    dal_Nationality DALN = new dal_Nationality();
    public int SType = 0;
    public int usertype = 0;
    public string Keyword = "";
    public int state = 0;
    public string usercount = "0";
    public string weituocount = "0",zixingjiaofei="0";
    public string weituoJiaofeiOKcount = "0";
    public int StockState = 0;
    public int ye = 1;
    public int userid = 0;
    public int sbdays = 0;
    public string statime = "";
    public string endtime = "";
    public string bianhao = "";
    public string username = "";
    public string uname = "";
    public string ubianhao = "";
    public string stime = "";
    public string ptime = "";
    public string shangbiaotype = "";
    public int jiaofeitypezt = -1;
 public string jiaofei = "";
 public string dizhi = "";
 public string zhuangtai = "";


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
      
        HiddenDel.Value = "";
        div_a.InnerHtml = "";
        hi_true.Value = pageupdate ? "1" : "0";//鼠标移动修改
        if (!IsPostBack)
        {
            Bind_Drp_PGuoJiaType();
            Bind_Page_value();
            Bind_Rpt_Product(ye);
            Bind_Page_Info();
        }
    }

  
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "|—";
        }
        else
        {
            for (int i = 0; i < count; i++)
            {
                Returnwords += "&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            Returnwords += "|—";
        }
        return Returnwords;
    }
     private void Bind_Page_Info()// 绑定商标详细数据
    {
                
            var  iquery = DALT.Trademark_SelectAllByUser();
            var mem = from i in DALM.WebPostClass_SelectAll() where i.i_MemberType == 2 select i;
            if (mem.Count() > 0)
            {
                usercount = mem.Count().ToString();
            }
            var iquery1 = from i in iquery where i.i_JiaoFeiType == 2 select i;
            if (iquery1.Count() > 0)
            {
                weituocount = iquery1.Count().ToString();
            }
            var iquery3 = from i in iquery where i.i_JiaoFeiType == 1 select i;
            if (iquery3.Count() > 0)
            {
                zixingjiaofei = iquery3.Count().ToString();
            }
            var iquery2 = from i in iquery1 where i.i_IsPayState== 1 select i;
            if (iquery2.Count() > 0)
            {
                weituoJiaofeiOKcount = iquery2.Count().ToString();
            }
        }
    public void Bind_Page_value()
    {
        if (Request.QueryString["userid"] != null && Request.QueryString["userid"] != "")
        {
            userid = int.Parse(Request.QueryString["userid"].ToString());
        }
        if (Request.QueryString["ye"] != null && Request.QueryString["ye"] != "")
        {
            ye = int.Parse(Request.QueryString["ye"].ToString()); 
        }
        if (Request.QueryString["Keyword"] != null && Request.QueryString["Keyword"] != "")
        {
            this.hw_name.Value = Request.QueryString["Keyword"].ToString();
        }
        if (Request.QueryString["SType"] != null && Request.QueryString["SType"] != "" )
        {
            this.DDL_SType.SelectedValue = Request.QueryString["SType"].ToString();
        }
        if (Request.QueryString["jiaofeitype"] != null && Request.QueryString["jiaofeitype"] != "")
        {
            this.ddl_jiaofei.SelectedValue = Request.QueryString["jiaofeitype"].ToString();
        }
        if (Request.QueryString["jiaofeitypezt"] != null && Request.QueryString["jiaofeitypezt"] != "")
        {
            this.ddl_jiaofeizt.SelectedValue = Request.QueryString["jiaofeitypezt"].ToString();
        }
        if (Request.QueryString["guoji"] != null && Request.QueryString["guoji"] != "")
        {
            this.DDL_guoji.SelectedValue = Request.QueryString["guoji"].ToString();
            //Bind_DDL_Brand();
        }
        if (Request.QueryString["regtype"] != null && Request.QueryString["regtype"] != "")
        {
            this.DDl_regtype.SelectedValue = Request.QueryString["regtype"].ToString();
        }
        if (Request.QueryString["state"] != null && Request.QueryString["state"] != "")
        {
            this.DDL_state.SelectedValue = Request.QueryString["state"].ToString();
        }
        if (Request.QueryString["sb_day"] != null && Request.QueryString["sb_day"] != "")
        {
            sbdays =int.Parse( Request.QueryString["sb_day"].ToString());
            ddl_sheng.SelectedValue = Request.QueryString["sb_day"].ToString();
        }
        if (Request.QueryString["statime"] != null && Request.QueryString["statime"] != "")
        {
            stime= Request.QueryString["statime"].ToString();
            hot_start_date.Value = Request.QueryString["statime"].ToString();
        }
        if (Request.QueryString["endtime"] != null && Request.QueryString["endtime"] != "")
        {
            endtime=Request.QueryString["endtime"].ToString();
            hot_end_date.Value = Request.QueryString["endtime"].ToString();
        }
        if (Request.QueryString["usertype"] != null && Request.QueryString["usertype"] != "")
        {
            this.DDL_usertype.SelectedValue = Request.QueryString["usertype"].ToString();
        }
        if (Request.QueryString["bianhao"] != null && Request.QueryString["bianhao"] != "")
        {
            bianhao = Request.QueryString["bianhao"].ToString();
            bianhao1.Value = bianhao;
        }
        if (Request.QueryString["username"] != null && Request.QueryString["username"] != "")
        {
            this.username = Request.QueryString["username"].ToString();
            username1.Value = username;
        }
        if (Request.QueryString["ubianhao"] != null && Request.QueryString["ubianhao"] != "")
        {
            this.ubianhao = Request.QueryString["ubianhao"].ToString();
            ubianhao1.Value = ubianhao;
        }
        if (Request.QueryString["uname"] != null && Request.QueryString["uname"] != "")
        {
            this.uname = Request.QueryString["uname"].ToString();
            uname1.Value = username;
        }
        if (Request.QueryString["stime"] != null && Request.QueryString["stime"] != "")
        {
            this.stime = Request.QueryString["stime"].ToString();
            stime1.Value = stime;
        }
        if (Request.QueryString["ptime"] != null && Request.QueryString["ptime"] != "")
        {
            this.ptime = Request.QueryString["ptime"].ToString();
            ptime1.Value = ptime;
        }
        if (Request.QueryString["shangbiaotype"] != null && Request.QueryString["shangbiaotype"] != "")
        {
            this.shangbiaotype = Request.QueryString["shangbiaotype"].ToString();
            shangbiaotype1.Value = shangbiaotype;
        }
        if (Request.QueryString["jiaofei"] != null && Request.QueryString["jiaofei"] != "")
        {
            this.jiaofei = Request.QueryString["jiaofei"].ToString();
            jiaofei1.Value = jiaofei;
        }
        if (Request.QueryString["dizhi"] != null && Request.QueryString["dizhi"] != "")
        {
            this.dizhi = Request.QueryString["dizhi"].ToString();
            shangbiaotype1.Value = dizhi;
        }
        if (Request.QueryString["zhuangtai"] != null && Request.QueryString["zhuangtai"] != "")
        {
            this.zhuangtai = Request.QueryString["zhuangtai"].ToString();
            zhuangtai1.Value = zhuangtai;
        }
    }
    protected void aspPage_PageChanged(object sender, EventArgs e)
    {
        Bind_Rpt_Product(((Wuqi.Webdiyer.AspNetPager)sender).CurrentPageIndex);
    }
  

    public string ZTFileImg(object Uid,object zhuti, object sbid)
    {
        string aa = "未上传";
        var m = DALM.Member_Select_Id(int.Parse(Uid.ToString()));
        if (m != null)
        {
            if (m.i_UserTypeId == 3)
            {
                if (zhuti != null && zhuti != "")
                {
                    return "<a href='../" + zhuti + "' target='_blank'><img src='../" + zhuti + "'  width='20' title='主体资格证明文件' border='0'/></a>";
                }
                else
                {
                    return "未上传";
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                {
                    return "<a href='../" + m.nvc_ZhuTiFile + "'  target='_blank'><img src='../" + m.nvc_ZhuTiFile + "'  width='20' title='主体资格证明文件' border='0'/></a>";
                }
                else
                {
                    return "未上传";
                }
            }
        }
        return aa;
    }
    public string GetSBtypeAndName(string country,string typeid)//获得商标类型
    {
        string typename = "";
        if (country == "1")
        {
            if (typeid == "1")
            {
                typename = "中国个人";
            }
            if (typeid == "2")
            {
                typename = "中国企业";
            }
            if (typeid == "3")
            {
                typename = "中国代理机构";
            }
        }
        if (country == "2")
        {
            if (typeid == "1")
            {
                typename = "外国个人";
            }
            if (typeid == "2")
            {
                typename = "外国企业";
            }
            if (typeid == "3")
            {
                typename = "外国代理机构";
            }
        }
        return typename;
    
    }
    public bool BoolFileImg(object fileurl)
    {
        if (fileurl != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
   
    private void Bind_Rpt_Product(int pageCurrent)//绑定列表
    {
        ye = pageCurrent;
        int Ccount = 0;
        int PageSize = 20;
        Keyword = hw_name.Value;
        if (DDL_SType.SelectedValue == "4")
        { 
            t_DataOrder dd = DALD.DataOrder_Select_num(hw_name.Value);
            if (dd != null)
            {
                if (dd.i_DataId != 0)
                {
                    Keyword = dd.i_DataId.ToString();
                }
            }
            else
            {
                Keyword ="0";
            }
        }
        SType = int.Parse(DDL_SType.SelectedValue);
       usertype = int.Parse(DDL_usertype.SelectedValue);
       state = int.Parse(DDL_state.SelectedValue);
       statime = hot_start_date.Value;
       endtime = hot_end_date.Value;
       jiaofeitypezt = Convert.ToInt32(ddl_jiaofeizt.SelectedValue);
       this.rep_brand.DataSource = DALT.Trademark_SelectPage(pageCurrent, PageSize, userid, SType, Keyword, Convert.ToInt32(ddl_jiaofei.SelectedValue), Convert.ToInt32(DDL_guoji.SelectedValue), usertype, Convert.ToInt32(DDl_regtype.SelectedValue), state, bianhao, shangbiaotype, jiaofei, dizhi, username, stime, ptime, zhuangtai, Convert.ToInt32(ddl_sheng.SelectedValue), statime, endtime, uname, ubianhao,jiaofeitypezt, ref Ccount);
        this.rep_brand.DataBind();
        aspPage.RecordCount = Ccount;
        aspPage.PageSize = PageSize;
        aspPage.CurrentPageIndex = pageCurrent;
        Lb_sum.Text = "共" + Ccount + "条";
        Lb_ye.Text = "共" + aspPage.PageCount + "页";
        text_pageindex.Value = pageCurrent.ToString();
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                if (IDList[i] != "")
                {
                    DALT.Trademark_Del(int.Parse(IDList[i]));
                    Manager.AddLog(0, "商标管理", "删除商标");
                }
            }
        }
        Bind_Rpt_Product(aspPage.CurrentPageIndex);
        HiddenDel.Value = "del";
    }
    protected void But_search_Click(object sender, EventArgs e)
    {
        Bind_Rpt_Product(1);
        if (DDL_SType.SelectedValue == "4")
        {
            string sname = hw_name.Value;
            var iqurey = DALD.DataOrder_Select_Bynum(sname,0);
            reptlist.DataSource = iqurey;
            reptlist.DataBind();
           
        }
        if (DDL_SType.SelectedValue == "2")
        {
            string sname = hw_name.Value;
            t_Trademark t = DALT.Trademark_Select_No(sname);
            if (t != null)
            {
                if (t.i_Id != null)
                {
                    var iqurey = DALD.DataOrder_Select_Bynum("",t.i_Id);
                    reptlist.DataSource = iqurey;
                    reptlist.DataBind();
                }
            }

        }
      
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int Ccount = 0;
        Keyword = hw_name.Value;
        SType = int.Parse(DDL_SType.SelectedValue);
        usertype = int.Parse(DDL_usertype.SelectedValue);
        state = int.Parse(DDL_state.SelectedValue);
        statime = hot_start_date.Value;
        endtime = hot_end_date.Value;
        sbdays = Convert.ToInt32(ddl_sheng.SelectedValue);
        jiaofeitypezt = Convert.ToInt32(ddl_jiaofeizt.SelectedValue);
        GridView1.DataSource = DALT.Trademark_SelectPage(1, 100000000, userid, SType, Keyword, Convert.ToInt32(ddl_jiaofei.SelectedValue), Convert.ToInt32(DDL_guoji.SelectedValue), usertype, Convert.ToInt32(DDl_regtype.SelectedValue), state, bianhao, shangbiaotype, jiaofei, dizhi, username, stime, ptime, zhuangtai, Convert.ToInt32(ddl_sheng.SelectedValue), statime, endtime, uname, ubianhao,jiaofeitypezt, ref Ccount);
        GridView1.DataBind();
        toExecl(GridView1);
        GridView1.DataSource = null;
        GridView1.DataBind();
        Manager.AddLog(0, "商标管理", "导出数据");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    void Bind_Drp_PGuoJiaType()// 绑定国籍
    {
        DDL_guoji.Items.Clear();
        ListItem item = new ListItem("请选择国籍", "0");
        DDL_guoji.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            DDL_guoji.Items.Add(li);
        }
    }
    private void toExecl(GridView GVId)
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        // 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GVId.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    protected void rep_brand_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        string id = e.CommandArgument.ToString();
        var query = from q in dzdc.t_Trademark where q.i_Id == int.Parse(id) select q;
        foreach (var q in query)
        {
            if (e.CommandName.ToString() == "state")
            {
                if (q.i_IsPayState == 0)
                {
                    div_a.InnerHtml = "<script>alert('该商标没缴费，不能通过审核！')</script>";
                    return;
                }
                if (q.i_IsPayState == 4)
                {
                    div_a.InnerHtml = "<script>alert('该商标已经无效！，不能通过审核！')</script>";
                    return;
                }
                else
                {
                    if (q.i_State == 0) { q.i_State = 1;
                    q.dt_PassTime = DateTime.Now;
                    }
                    else { q.i_State = 0;
                    q.dt_PassTime = DateTime.Now;//取消时间
                    } 
                }
            } 
            dzdc.SubmitChanges();
            Manager.AddLog(0, "商标管理", "修改了商标[ <font color=\"red\">" + q.nvc_SBRegNum + "</font> ]的信息");
        }
        Bind_Rpt_Product(aspPage.CurrentPageIndex);
    }
    protected void Bt_Onsubmit_Click(object sender, EventArgs e)
    {
        Bind_Rpt_Product(aspPage.CurrentPageIndex);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            int pageindex = Convert.ToInt32(text_pageindex.Value);
            if (pageindex < 1 || pageindex > aspPage.PageCount)
            {
                div_a.InnerHtml = "<script>alert('页索引超出范围！')</script>";
                return;
            }
            else
            {
                Bind_Rpt_Product(pageindex);
            }
        }
        catch { }
    }
}