using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
public partial class trademark_list : System.Web.UI.Page
{
    dal_NewTrademark mark = new dal_NewTrademark();
    dal_Trademark DALT = new dal_Trademark();
    dal_Member DALM = new dal_Member();
    dal_Address address = new dal_Address();
    public int UserId = 0, usertype = 0;
    public string returnurl = "";
    public int? applyType;
    public string ByCaseNo, ByName, Bytype, ByStatus, ByApplyNo;
    public string qCaseNo, qName;
    public int? qStatus;
    public int iQueryFlag = 0;

    QueryModel querymodel = new QueryModel();

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

            IList<t_NewTradeMarkStatus> tradeMarkStatuslist = BaseDataUtil.tradeMarkApplyStatuslist.ToList();
            tradeMarkStatuslist.Insert(0, new t_NewTradeMarkStatus { StatusName = "全部", StatusValue = null });
            this.ddlTradeMarkStatus.DataSource = tradeMarkStatuslist;
            this.ddlTradeMarkStatus.DataTextField = "StatusName";
            this.ddlTradeMarkStatus.DataValueField = "StatusValue";
            this.ddlTradeMarkStatus.DataBind();
            Bind_RptPrint_Trademark();
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
        if (Request.QueryString["sbstatus"] != null && Request.QueryString["sbstatus"] != "")
        {
            this.ByStatus = Request.QueryString["sbstatus"].ToString().Split('_')[0];
            Hi_orderby4.Value = Request.QueryString["sbstatus"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbstatus"].ToString();//BY CHY
        }
        if (Request.QueryString["sbapplyno"] != null && Request.QueryString["sbapplyno"] != "")
        {
            this.ByApplyNo = Request.QueryString["sbapplyno"].ToString().Split('_')[0];
            Hi_orderby5.Value = Request.QueryString["sbapplyno"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbapplyno"].ToString();//BY CHY
        }



        if (Request.QueryString["qtmcaseno"] != null && Request.QueryString["qtmcaseno"] != "")
        {
            querymodel.qtmcaseno = Request.QueryString["qtmcaseno"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmtype"]))
        {
            querymodel.qtmtype = Request.QueryString["qtmtype"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmapplyname"]))
        {
            querymodel.qtmapplyname = Request.QueryString["qtmapplyname"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmmemberno"]))
        {
            querymodel.qtmmemberno = Request.QueryString["qtmmemberno"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmmembername"]))
        {
            querymodel.qtmmembername = Request.QueryString["qtmmembername"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["qtmprovinceid"]))
        {
            querymodel.qtmprovinceid = Request.QueryString["qtmprovinceid"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmcityid"]))
        {
            querymodel.qtmcityid = Request.QueryString["qtmcityid"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmareaid"]))
        {
            querymodel.qtmareaid = Request.QueryString["qtmareaid"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmaddress"]))
        {
            querymodel.qtmaddress = Request.QueryString["qtmaddress"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["qtmcontactPerson"]))
        {
            querymodel.qtmcontactPerson = Request.QueryString["qtmcontactPerson"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmphone"]))
        {
            querymodel.qtmphone = Request.QueryString["qtmphone"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmapplyno"]))
        {
            querymodel.qtmapplyno = Request.QueryString["qtmapplyno"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmtradmemarkRemark"]))
        {
            querymodel.qtmtradmemarkRemark = Request.QueryString["qtmtradmemarkRemark"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["qtmis3D"]))
        {
            querymodel.qtmis3D = Request.QueryString["qtmis3D"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmisColor"]))
        {
            querymodel.qtmisColor = Request.QueryString["qtmisColor"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmisSound"]))
        {
            querymodel.qtmisSound = Request.QueryString["qtmisSound"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["qtmapplydate"]))
        {
            querymodel.qtmapplydate = Request.QueryString["qtmapplydate"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmpublicDate"]))
        {
            querymodel.qtmpublicDate = Request.QueryString["qtmpublicDate"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmRegNoticeBeginDate"]))
        {
            querymodel.qtmRegNoticeBeginDate = Request.QueryString["qtmRegNoticeBeginDate"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmRegNoticeEndDate"]))
        {
            querymodel.qtmRegNoticeEndDate = Request.QueryString["qtmRegNoticeEndDate"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["qtmRenewalBeginDate"]))
        {
            querymodel.qtmRenewalBeginDate = Request.QueryString["qtmRenewalBeginDate"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmRenewalEndDate"]))
        {
            querymodel.qtmRenewalEndDate = Request.QueryString["qtmRenewalEndDate"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmrestDays"]))
        {
            querymodel.qtmrestDays = Request.QueryString["qtmrestDays"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["qtmadminStatus"]))
        {
            querymodel.qtmadminStatus = Request.QueryString["qtmadminStatus"].ToString(); //检索页面传递过来的値
            iQueryFlag = 1;
        }
    }
    public string GetApplyTypeName(object applyType)
    {
        return EnumManager.GetDescription(typeof(ApplyUserTypeEnum), applyType);
    }
    public string GetApplyStatus(object applyStatus)
    {
        if (applyStatus != null)
            return BaseDataUtil.tradeMarkApplyStatuslist.Where(p => p.StatusValue == int.Parse(applyStatus.ToString())).First().StatusName;
        return string.Empty;
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

        return str;
    }

    private void Bind_Rpt_Trademark()//绑定列表
    {
        if (UserId != 0)
        {
            int Ccount = 0;
            int PageSize = AspNetPager1.PageSize;
            int pageCurrent = AspNetPager1.CurrentPageIndex;
            string tids = "";
            if (!string.IsNullOrEmpty(Request.QueryString["tids"])) //案件统计
            {
                tids = Request.QueryString["tids"];
            }

            this.qCaseNo = this.txtCaseNo.Text.Trim();
            this.qName = this.txtApplyUser.Text.Trim();
            if (!string.IsNullOrEmpty(this.ddlApplyType.SelectedValue))
                this.applyType = int.Parse(this.ddlApplyType.SelectedValue);
            if (!string.IsNullOrEmpty(this.ddlTradeMarkStatus.SelectedValue))
                this.qStatus = int.Parse(this.ddlTradeMarkStatus.SelectedValue);
            if (!string.IsNullOrEmpty(qCaseNo) || !string.IsNullOrEmpty(qName) || applyType.HasValue || qStatus.HasValue|| iQueryFlag == 1)
            {
                tids = "";
            }
            this.Rp_sb_list.DataSource = mark.Trademark_web_SelectPage(pageCurrent, PageSize, UserId, 0, applyType, ByCaseNo, ByName, Bytype, ByStatus, ByApplyNo, qCaseNo, qName, qStatus, ref Ccount, querymodel, tids);
            this.Rp_sb_list.DataBind();
            AspNetPager1.RecordCount = Ccount;
            AspNetPager1.PageSize = PageSize;
            AspNetPager1.CurrentPageIndex = pageCurrent;
        }
    }

    private void Bind_RptPrint_Trademark()//打印列表
    {
        if (UserId != 0)
        {
            int Ccount = 0;
            this.rptPrint.DataSource = mark.Trademark_web_SelectPage(1, int.MaxValue - 1, UserId, 0, null, "", "", "", "", "", "", "", null, ref Ccount, null);
            this.rptPrint.DataBind();
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
                case "4": ByStatus = HF_ORDERBY.Value.Split('_')[0]; break;
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

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    private void toExecl(GridView GVId)
    {
        //for (int i = 0; i < GVId.Columns.Count; i++) //设置每个单元格
        //{
        //    for (int j = 0; j < GVId.Rows.Count; j++)
        //    {
        //        GVId.Rows[j].Cells[i].Attributes.Add("style", "vnd.ms-excel.numberformat:@;");
        //    }
        //}

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


    protected void btnQuery_Click(object sender, EventArgs e)
    {
        this.qCaseNo = this.txtCaseNo.Text.Trim();
        this.qName = this.txtApplyUser.Text.Trim();
        //this.applyType = this.ddlApplyType.SelectedValue;
        //this.qStatus = this.ddlTradeMarkStatus.SelectedValue;
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
}