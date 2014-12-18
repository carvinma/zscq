using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
public partial class trademarkrenewal_list : System.Web.UI.Page
{
    dal_NewTrademark mark = new dal_NewTrademark();
    dal_Address address = new dal_Address();

    dal_Trademark DALT = new dal_Trademark();
    dal_Member DALM = new dal_Member();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    public string Sbtype = "", Sbjiaofeitype = "", SbregName = "", Sbnum = "", Sbjiaofei = "", Sbtime = "", Stime = "";
    public int UserId = 0, usertype = 0;
    public string returnurl = "";
    public string sb_type = "", days = "", uname = "", uaddress = "", sb_guoji = "0", sb_num = "", sb_regname = "", sb_passtime = "", utel = "", c_anjuanhao = "";

    public string ByCaseNo, ByName, Bytype, ByTime,ByApplyNo;
    public int? applyType;
    public string qCaseNo,qApplyNo, qName;

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
            Dictionary<string, int?> dic = new Dictionary<string, int?>();
            dic.Add("全部", null);
            for (int i = 0; i <= 1; i++)
            {
                string key = EnumManager.GetDescription(typeof(ApplyUserTypeEnum), i);
                if (!string.IsNullOrEmpty(key))
                    dic.Add(key, i);
            }

            this.ddlApplyType.DataSource = dic;
            this.ddlApplyType.DataTextField = "Key";
            this.ddlApplyType.DataValueField = "Value";
            this.ddlApplyType.DataBind();
        }
        Bind_Page_value();
        Bind_Rpt_Trademark();
    }
    public void Bind_Page_value()
    {
        if (Request.QueryString["sbcaseno"] != null && Request.QueryString["sbcaseno"] != "")
        {
            this.ByCaseNo = Request.QueryString["sbcaseno"].ToString().Split('_')[0];
            Hi_orderby1.Value = Request.QueryString["sbcaseno"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbcaseno"].ToString();//BY CHY
        }
        if (Request.QueryString["sbname"] != null && Request.QueryString["sbname"] != "")
        {
            this.ByName = Request.QueryString["sbname"].ToString().Split('_')[0];
            Hi_orderby2.Value = Request.QueryString["sbname"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbname"].ToString();//BY CHY
        }
        if (Request.QueryString["sbtype"] != null && Request.QueryString["sbtype"] != "")
        {
            this.Bytype = Request.QueryString["sbtype"].ToString().Split('_')[0];
            Hi_orderby3.Value = Request.QueryString["sbtype"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbtype"].ToString();//BY CHY
        }
        if (Request.QueryString["sbtime"] != null && Request.QueryString["sbtime"] != "")
        {
            this.ByTime = Request.QueryString["sbtime"].ToString().Split('_')[0];
            Hi_orderby4.Value = Request.QueryString["sbtime"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbtime"].ToString();//BY CHY
        }
        if (Request.QueryString["sbapplyno"] != null && Request.QueryString["sbapplyno"] != "")
        {
            this.ByApplyNo = Request.QueryString["sbapplyno"].ToString().Split('_')[0];
            Hi_orderby5.Value = Request.QueryString["sbapplyno"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbapplyno"].ToString();//BY CHY
        }

        if (Request.QueryString["stime"] != null && Request.QueryString["stime"] != "")
        {
            string[] stimelist = Request.QueryString["stime"].ToString().Split('_');
            this.Stime = stimelist[0];
            hi_time.Value = stimelist[1];
            HF_ORDERBY.Value = Request.QueryString["stime"].ToString();
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
    
    private void Bind_Rpt_Trademark()//绑定列表
    {
        if (UserId != 0)
        {
            int Ccount = 0;
            int PageSize = AspNetPager1.PageSize;
            int pageCurrent = AspNetPager1.CurrentPageIndex;
            this.qCaseNo = this.txtCaseNo.Text.Trim();
            this.qApplyNo = this.txtApplyNo.Text.Trim();
            this.qName = this.txtApplyUser.Text.Trim();
            if (!string.IsNullOrEmpty(this.ddlApplyType.SelectedValue))
                this.applyType = int.Parse(this.ddlApplyType.SelectedValue);

            this.Rp_sb_list.DataSource = mark.Trademark_web_SelectPage(pageCurrent, PageSize, UserId, 1, applyType, ByCaseNo, ByName, Bytype, ByTime, ByApplyNo, qCaseNo, qApplyNo, qName, this.Stime, ref Ccount);
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
                case "1": ByCaseNo = HF_ORDERBY.Value.Split('_')[0]; break;
                case "2": ByName = HF_ORDERBY.Value.Split('_')[0]; break;
                case "3": applyType = int.Parse(HF_ORDERBY.Value.Split('_')[0]); break;
                case "4": ByTime = HF_ORDERBY.Value.Split('_')[0]; break;
                case "5": ByApplyNo = HF_ORDERBY.Value.Split('_')[0]; break;
            }
        }
        Bind_Rpt_Trademark();
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

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl(GridView GVId)
    {
        string style = @"<style> .text { mso-number-format:\@; } </script> "; 
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
        Response.Write(style); 
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

    public string GetApplyTypeName(object applyType)
    {
        return EnumManager.GetDescription(typeof(ApplyUserTypeEnum), applyType);
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        if (Request.Form["chkItem"] != null)
        {
            string[] IDList = Request.Form["chkItem"].ToString().Split(',');
            if (IDList.Count() > 0)
            {
                GridView1.DataSource = mark.Trademark_web_Excel(IDList);
                GridView1.DataBind();
                toExecl(GridView1);
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }      
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        this.qCaseNo = this.txtCaseNo.Text.Trim();
        this.qName = this.txtApplyUser.Text.Trim();
    }

    public string GetProviceArea(object provinceid, object cityid, object areaid)
    {
        int pid, cid, aid;
        if (provinceid != null && cityid != null && areaid != null)
        {
            if (int.TryParse(provinceid.ToString(), out pid) && int.TryParse(cityid.ToString(), out cid) && int.TryParse(areaid.ToString(), out aid))
            {
                return address.Set_AddressName_PId_CId_AId(pid, cid, aid);
            }
        }
        return string.Empty;
    }
    public string GetApplyStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkRenewedStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
    }
}