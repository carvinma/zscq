using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
public partial class trademarkrenewal_list : System.Web.UI.Page
{
    dal_Trademark DALT = new dal_Trademark();
    dal_Member DALM = new dal_Member();
    dal_Nationality DALN = new dal_Nationality();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    public string Sbtype = "", Sbjiaofeitype = "", SbregName = "", Sbnum = "", Sbjiaofei = "", Sbtime = "", Stime = "";
    public int UserId = 0, usertype = 0;
    public string returnurl = "";
    public int isjiaofei = -1, jiaofeistate = 0;
    public string sb_type = "", days = "", uname = "", uaddress = "", sb_guoji = "0", sb_num = "", sb_regname = "", sb_passtime = "", utel = "", c_anjuanhao = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            UserId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            var m = DALM.Member_Select_Id(UserId);
            if (m != null)
            {
                if (m.i_UserTypeId == 3)
                {
                    usertype = 3;
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        if (!IsPostBack)
        {
           
        }
        Bind_Page_value();
        Bind_Rpt_Trademark();
    }
    public void Bind_Page_value()
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            hi_trademark.Value = Request.Cookies["hqht_Trademarktidstr"].Value.ToString();
        }

        if (Request.QueryString["sbtype"] != null && Request.QueryString["sbtype"] != "")
        {
            this.Sbtype = Request.QueryString["sbtype"].ToString().Split('_')[0];
            Hi_orderby1.Value = Request.QueryString["sbtype"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbtype"].ToString();//BY CHY
        }
        if (Request.QueryString["sbjiaofeitype"] != null && Request.QueryString["sbjiaofeitype"] != "")
        {
            this.Sbjiaofeitype = Request.QueryString["sbjiaofeitype"].ToString().Split('_')[0];
            Hi_orderby2.Value = Request.QueryString["sbjiaofeitype"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbjiaofeitype"].ToString();//BY CHY
        }
        if (Request.QueryString["sbreg"] != null && Request.QueryString["sbreg"] != "")
        {
            this.SbregName = Request.QueryString["sbreg"].ToString().Split('_')[0];
            Hi_orderby3.Value = Request.QueryString["sbreg"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbreg"].ToString();//BY CHY
        }
        if (Request.QueryString["sbnum"] != null && Request.QueryString["sbnum"] != "")
        {
            this.Sbnum = Request.QueryString["sbnum"].ToString().Split('_')[0];
            Hi_orderby4.Value = Request.QueryString["sbnum"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbnum"].ToString();//BY CHY
        }
        if (Request.QueryString["sbjiaofei"] != null && Request.QueryString["sbjiaofei"] != "")
        {
            this.Sbjiaofei = Request.QueryString["sbjiaofei"].ToString().Split('_')[0];
            Hi_orderby5.Value = Request.QueryString["sbjiaofei"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbjiaofei"].ToString();//BY CHY
        }
        if (Request.QueryString["sbtime"] != null && Request.QueryString["sbtime"] != "")
        {
            this.Sbtime = Request.QueryString["sbtime"].ToString().Split('_')[0];
            Hi_orderby6.Value = Request.QueryString["sbtime"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbtime"].ToString();//BY CHY
        }
        if (Request.QueryString["xnum"] != null && Request.QueryString["xnum"] != "")
        {
            this.Sbtime = Request.QueryString["xnum"].ToString().Split('_')[0];
            Hi_orderby7.Value = Request.QueryString["xnum"].ToString();
            HF_ORDERBY.Value = Request.QueryString["xnum"].ToString();//BY CHY
        }
        if (Request.QueryString["stime"] != null && Request.QueryString["stime"] != "")
        {
            string[] stimelist = Request.QueryString["stime"].ToString().Split('_');
            this.Stime = stimelist[0];
            hi_time.Value = stimelist[1];
            HF_ORDERBY.Value = Request.QueryString["stime"].ToString();//BY CHY
        }
        if (Request.QueryString["jiaofeistate"] != null && Request.QueryString["jiaofeistate"] != "")
        {
            jiaofeistate = int.Parse(Request.QueryString["jiaofeistate"].ToString()); //统计页面传递过来的値 缴费状态    
        }
        if (Request.QueryString["isjiaofei"] != null && Request.QueryString["isjiaofei"] != "")
        {
            isjiaofei = int.Parse(Request.QueryString["isjiaofei"].ToString()); //统计页面传递过来的値 是否缴费     
        }
        if (Request.QueryString["sb_num"] != null && Request.QueryString["sb_num"] != "")
        {
            sb_num = Request.QueryString["sb_num"].ToString(); //检索页面传递过来的値
        }
        if (Request.QueryString["sb_type"] != null && Request.QueryString["sb_type"] != "")
        {
            sb_type = Request.QueryString["sb_type"].ToString(); //检索页面传递过来的値 
        }
        if (Request.QueryString["sb_regname"] != null && Request.QueryString["sb_regname"] != "")
        {
            sb_regname = Request.QueryString["sb_regname"].ToString(); //检索页面传递过来的値    
        }
        if (Request.QueryString["sb_regguoji"] != null && Request.QueryString["sb_regguoji"] != "")
        {
            sb_guoji = Request.QueryString["sb_regguoji"].ToString(); //检索页面传递过来的値 
        }
        if (Request.QueryString["sb_passtime"] != null && Request.QueryString["sb_passtime"] != "")
        {
            sb_passtime = Request.QueryString["sb_passtime"].ToString(); //检索页面传递过来的値
        }
        if (Request.QueryString["c_anjuanhao"] != null && Request.QueryString["c_anjuanhao"] != "")
        {
            c_anjuanhao = Request.QueryString["c_anjuanhao"].ToString(); //检索页面传递过来的値  
        }
        if (Request.QueryString["c_uname"] != null && Request.QueryString["c_uname"] != "")
        {
            uname = Request.QueryString["c_uname"].ToString(); //检索页面传递过来的値  
        }
        if (Request.QueryString["c_address"] != null && Request.QueryString["c_address"] != "")
        {
            uaddress = Request.QueryString["c_address"].ToString(); //检索页面传递过来的値
        }
        if (Request.QueryString["c_tel"] != null && Request.QueryString["c_tel"] != "")
        {
            utel = Request.QueryString["c_tel"].ToString(); //检索页面传递过来的値    
        }
    }
    public string Geturl(string url)
    {
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
            if (url == "stime")
            {
                if (returnurl.IndexOf(url) > -1)
                {
                    returnurl = returnurl.Replace("stime=90_1&", "").Replace("stime=61-90_2&", "").Replace("stime=31-60_3&", "").Replace("stime=16-30_4&", "").Replace("stime=0-15_5&", "").Replace("stime=chao_6&", "");
                }
            }
            else
            {
                if (returnurl.IndexOf(url) > -1)
                {
                    for (int i = 1; i <= 6; i++)
                    {
                        returnurl = returnurl.Replace(url + "=asc_" + i + "&", "").Replace(url + "=desc_" + i + "&", "");
                    }
                }
            }
        }
        return returnurl;
    }
    public string Getxiaoji(string sbid)
    {
        string xiaoji = "0.00";
        string bizhong = "";
        t_Trademark model = DALT.Trademark_Select_Id(int.Parse(sbid));
        t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
        if (model != null)
        {
            if (model1 != null)
            {
                t_Member m = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
                if (m != null)
                {
                    t_Nationality na = DALN.Nationality_Select_Id(m.i_GuoJiId);
                    if (na != null)
                    {
                        if (na.nvc_Name == "中国")
                        {
                            bizhong = na.nvc_JFBizhong;
                            #region 委托缴费
                            if (model.i_JiaoFeiType == 2)
                            {
                                string totalmoney = (model1.dm_TMDaiLi + model1.dm_TrademarkMoney).ToString("0.00");
                                xiaoji = bizhong + ":" + totalmoney;
                            #endregion
                            }
                            if (model.i_JiaoFeiType == 1)
                            {
                                //#region 自行缴费
                                //xiaoji = bizhong + ":" + (model1.dm_TrademarkMoney).ToString("0.00");
                                //#endregion
                            }
                        }
                        else
                        {
                            t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                            decimal huilv = 1;
                            bizhong = na.nvc_JFBizhong;
                            if (nafee != null)
                            {
                                if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                {
                                    huilv = nafee.dm_Exchange;
                                }
                            }
                            #region  委托缴费
                            string totalmoney = (model1.dm_TMDaiLi + model1.dm_TrademarkMoney).ToString("0.00");
                            string totalmoneyGY = ((model1.dm_TMDaiLi + model1.dm_TrademarkMoney) * huilv).ToString("0.00");
                            string shangbiao = (model1.dm_TrademarkMoney).ToString("0.00");
                            string shangbiaoGY = ((model1.dm_TrademarkMoney) * huilv).ToString("0.00");
                            string dailimoneyGy = ((model1.dm_TMDaiLi) * huilv).ToString();
                            xiaoji = bizhong + ":" + totalmoneyGY;
                            // xiaoji = totalmoney;
                            #endregion

                            //#region  自行缴费
                            //string totalmoney1 = (model1.dm_TrademarkMoney).ToString("0.00");
                            //string totalmoneyGY1 = ((model1.dm_TrademarkMoney) / huilv).ToString("0.00");

                            //xiaoji = bizhong + ":" + totalmoneyGY1;
                            ////  xiaoji =bizhong+":"+totalmoney1;
                            //#endregion
                        }
                    }
                }
            }
        }
        return xiaoji;
    }
    /// <summary>
    /// 状态判断
    /// </summary>
    public string SetChecked(string state, string isjiaofei, string XujiaoStates)
    {
        string str = "";
        //if (state == "1")
        //{
        if (isjiaofei == "1" || XujiaoStates == "1")//1提交订单 代缴费，2 已交费  4，取消
        {
            str = "disabled='disabled'";
        }
        //}
        //else
        //{
        //    str = "disabled='disabled'";
        //}
        return str;
    }

    private void Bind_Rpt_Trademark()//绑定列表
    {
        if (UserId != 0)
        {
            int Ccount = 0;
            int PageSize = AspNetPager1.PageSize;
            int pageCurrent = AspNetPager1.CurrentPageIndex;
            this.Rp_sb_list.DataSource = DALT.Trademark_web_SelectPage(pageCurrent, PageSize, UserId, Sbtype, Sbjiaofeitype, SbregName, Sbnum, Sbjiaofei, Sbtime, Stime, isjiaofei, jiaofeistate, sb_num, sb_type, sb_regname, int.Parse(sb_guoji), sb_passtime, c_anjuanhao, uname, uaddress, utel, ref Ccount);
            this.Rp_sb_list.DataBind();
            AspNetPager1.RecordCount = Ccount;
            AspNetPager1.PageSize = PageSize;
            AspNetPager1.CurrentPageIndex = pageCurrent;
        }
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
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        if (HF_ORDERBY.Value != "")
        {
            switch (HF_ORDERBY.Value.Split('_')[1])
            {
                case "1": Sbtype = HF_ORDERBY.Value.Split('_')[0]; break;
                case "2": Sbjiaofeitype = HF_ORDERBY.Value.Split('_')[0]; break;
                case "3": SbregName = HF_ORDERBY.Value.Split('_')[0]; break;
                case "4": Sbnum = HF_ORDERBY.Value.Split('_')[0]; break;
                case "5": Sbjiaofei = HF_ORDERBY.Value.Split('_')[0]; break;
                case "6": Sbtime = HF_ORDERBY.Value.Split('_')[0]; break;
                case "7": Stime = HF_ORDERBY.Value.Split('_')[0]; break;
            }
        }
        Bind_Rpt_Trademark();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            Response.Redirect("User_TrademarkOrderAdd.aspx");
        }
        else
        {
            div_a.InnerHtml = "<script>alert('请选择缴费商标！');</script>";

        }
    }
    public string ZTFileImg(object zhuti, object sbid)
    {
        string aa = "<a href='user_sbzl.aspx'>未上传</a>";
        var m = DALM.Member_Select_Id(UserId);
        if (m != null)
        {
            if (m.i_UserTypeId == 3)
            {
                if (zhuti != null && zhuti != "")
                {
                    return "<a href='" + zhuti + "' target='_blank'><img src='" + zhuti + "'  width='20' title='主体资格证明文件' border='0'/></a>";
                }
                else
                {
                    return "<a href='user_sbupdate.aspx?t_r_id=" + sbid + "' target='_blank'>未上传</a>";
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                {
                    return "<a href='" + m.nvc_ZhuTiFile + "'  target='_blank'><img src='" + m.nvc_ZhuTiFile + "'  width='20' title='主体资格证明文件' border='0'/></a>";
                }
                else
                {
                    return "<a href='user_sbzl.aspx'>未上传</a>";
                }
            }
        }
        return aa;
    }

    public string SBZTFile(object tid)
    {
        string namestr = "";
        if (tid != null)
        {
            t_Trademark model = DALT.Trademark_Select_Id(int.Parse(tid.ToString()));
            if (model != null)
            {
                if (model.nvc_ZhuTiFile == null)
                {
                    var m = DALM.Member_Select_Id(UserId);
                    if (m != null && !string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                    {
                        namestr = "已上传";
                    }
                    else
                    {
                        namestr = "未上传";
                    }
                }
                else
                {
                    namestr = "已上传";
                }
            }
        }
        else
        {
            namestr = "未上传";
        }
        return namestr;
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {

        if (UserId != 0)
        {
            bool booldaochu = true;
            t_Member model = DALM.Member_Select_Id(UserId);
            if (model != null)
            {
                if (model.nvc_Power != null && model.nvc_Power != "")
                {
                    booldaochu = model.nvc_Power.Split(',')[1] == "1" ? true : false;//导出  

                }
            }
            if (booldaochu == false)
            {
                Response.Redirect("user_pageinfo.aspx");
            }
            int Ccount = 0;
            int PageSize = AspNetPager1.PageSize;
            int pageCurrent = AspNetPager1.CurrentPageIndex;
            GridView1.DataSource = DALT.Trademark_web_SelectPage(pageCurrent, 100000, UserId, Sbtype, Sbjiaofeitype, SbregName, Sbnum, Sbjiaofei, Sbtime, Stime, isjiaofei, jiaofeistate, sb_num, sb_type, sb_regname, int.Parse(sb_guoji), sb_passtime, c_anjuanhao, uname, uaddress, utel, ref Ccount);
            this.Rp_sb_list.DataBind();
            GridView1.DataBind();
            toExecl(GridView1);
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    public string GetSBtypeAndName(string country, string typeid)//获得商标类型
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
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl(GridView GVId)
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "GB2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //这里的FileName.xls可以用变量动态替换
        // 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。
        Response.Write("<meta http-equiv=Content-Type content=text/html;charset=UTF-8>");
        this.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GVId.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }

    public string GetCurrentClassName(int days)
    {
        string cname = "time0";
        if (days > 90)
        {
            cname = "time1";
        }
        if (days >= 61 && days <= 90)
        {
            cname = "time2";
        }
        if (days >= 31 && days <= 60)
        {
            cname = "time3";
        }
        if (days >= 16 && days <= 30)
        {
            cname = "time4";
        }
        if (days >= 0 && days <= 15)
        {
            cname = "time5";
        }
        if (days < 0)
        {
            cname = "time6";
        }
        return cname;
    }    
}