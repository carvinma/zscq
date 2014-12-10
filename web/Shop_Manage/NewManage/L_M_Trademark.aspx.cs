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

public partial class L_M_Trademark : System.Web.UI.Page
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

    public string caseno = "";
    public string applyno = "";
    public string memberno = "";
    public string applyuser = "";
    public string membername = "";
    public string trademarktype = "";
    public string timelimit = "";
    public string timeadd = "";
    public string status = "";

    public int jiaofeitypezt = -1;

 public string zhuangtai = "";

 public string returnurl = "";


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

        #region 排序参数
    
        if (Request.QueryString["caseno"] != null && Request.QueryString["caseno"] != "")
        {
            caseno = Request.QueryString["caseno"].ToString();
            this.hi_CaseNo.Value = caseno;
        }
        if (Request.QueryString["applyno"] != null && Request.QueryString["applyno"] != "")
        {
            this.applyno = Request.QueryString["applyno"].ToString();
            hi_applyno.Value = applyno;
        }
        if (Request.QueryString["applyuser"] != null && Request.QueryString["applyuser"] != "")
        {
            this.applyuser = Request.QueryString["applyuser"].ToString();
            hi_applyuser.Value = applyuser;
        }
        if (Request.QueryString["memberno"] != null && Request.QueryString["memberno"] != "")
        {
            this.memberno = Request.QueryString["memberno"].ToString();
            hi_memberno.Value = applyno;
        }
        if (Request.QueryString["membername"] != null && Request.QueryString["membername"] != "")
        {
            this.membername = Request.QueryString["membername"].ToString();
            hi_membername.Value = membername;
        }
        if (Request.QueryString["trademarktype"] != null && Request.QueryString["trademarktype"] != "")
        {
            this.trademarktype = Request.QueryString["trademarktype"].ToString();
            hi_trademarktype.Value = trademarktype;
        }
        if (Request.QueryString["timelimit"] != null && Request.QueryString["timelimit"] != "")
        {
            this.timelimit = Request.QueryString["timelimit"].ToString();
            hi_timelimit.Value = timelimit;
        }
        if (Request.QueryString["timeadd"] != null && Request.QueryString["timeadd"] != "")
        {
            this.timeadd = Request.QueryString["timeadd"].ToString();
            hi_timeadd.Value = timeadd;
        }
        if (Request.QueryString["status"] != null && Request.QueryString["status"] != "")
        {
            this.status = Request.QueryString["status"].ToString();
            hi_status.Value = status;
        }
        #endregion
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
       // ye = pageCurrent;
       // int Ccount = 0;
       // int PageSize = 20;
       // Keyword = hw_name.Value;
       // if (DDL_SType.SelectedValue == "4")
       // { 
       //     t_DataOrder dd = DALD.DataOrder_Select_num(hw_name.Value);
       //     if (dd != null)
       //     {
       //         if (dd.i_DataId != 0)
       //         {
       //             Keyword = dd.i_DataId.ToString();
       //         }
       //     }
       //     else
       //     {
       //         Keyword ="0";
       //     }
       // }
       // SType = int.Parse(DDL_SType.SelectedValue);
       //usertype = int.Parse(DDL_usertype.SelectedValue);
       //state = int.Parse(DDL_state.SelectedValue);
       //statime = hot_start_date.Value;
       //endtime = hot_end_date.Value;
       //jiaofeitypezt = Convert.ToInt32(ddl_jiaofeizt.SelectedValue);
       //this.rep_brand.DataSource = DALT.Trademark_SelectPage(pageCurrent, PageSize, userid, SType, Keyword, Convert.ToInt32(ddl_jiaofei.SelectedValue), Convert.ToInt32(DDL_guoji.SelectedValue), usertype, Convert.ToInt32(DDl_regtype.SelectedValue), state, bianhao, shangbiaotype, jiaofei, dizhi, username, stime, ptime, zhuangtai, Convert.ToInt32(ddl_sheng.SelectedValue), statime, endtime, uname, ubianhao,jiaofeitypezt, ref Ccount);
       // this.rep_brand.DataBind();
       // aspPage.RecordCount = Ccount;
       // aspPage.PageSize = PageSize;
       // aspPage.CurrentPageIndex = pageCurrent;
       // Lb_sum.Text = "共" + Ccount + "条";
       // Lb_ye.Text = "共" + aspPage.PageCount + "页";
        //text_pageindex.Value = pageCurrent.ToString();
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
    
    public override void VerifyRenderingInServerForm(Control control)
    {

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
            //int pageindex = Convert.ToInt32(text_pageindex.Value);
            //if (pageindex < 1 || pageindex > aspPage.PageCount)
            //{
            //    div_a.InnerHtml = "<script>alert('页索引超出范围！')</script>";
            //    return;
            //}
            //else
            //{
            //    Bind_Rpt_Product(pageindex);
            //}
        }
        catch { }
    }
}