﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using zscq.Model;
using zscq.DAL;
using zscq.BLL;

public partial class trademarkrenewal_detail : System.Web.UI.Page
{
    private dal_NewTrademark mark = new dal_NewTrademark();
    private dal_Address address = new dal_Address();
    public t_NewTradeMarkInfo model = new t_NewTradeMarkInfo();
    public string division = string.Empty;
    public string status = string.Empty;
    public int trademarkId;
    public int goodsItemCount;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            int uid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            //t_Member model = DALM.Member_Select_Id(uid);
            //if (model != null)
            //{

            //}
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        // div_a.InnerHtml = "";
        Bind_Page_Type();
    }

    public void Bind_Page_Type()// 绑定页面信息
    {
        if (Request.QueryString["t_r_id"] != null && Request.QueryString["t_r_id"].ToString() != "")
        {
            trademarkId = int.Parse(Request.QueryString["t_r_id"].ToString());
            hrefedit.HRef = "edit_trademark_renewal.aspx?t_r_id=" + trademarkId;
            Bind_Page_Info(trademarkId);
            Bind_TradeMarkStatus();
            Bind_Message();
        }
        else
        {
            Response.Redirect("trademarkrenewal_list.aspx");
        }

    }

    /// <summary>
    /// 商标留言
    /// </summary>
    private void Bind_Message()
    {
       this.RptMessage.DataSource=  mark.trademarkMessage_Select_id(trademarkId).ToList();
       this.RptMessage.DataBind();
    }
    /// <summary>
    /// 商标状态
    /// </summary>
    private void Bind_TradeMarkStatus()
    { 
        var adminstatusDate = mark.trademarkStatusdate_Select_id(trademarkId).ToList();
            var result = from a in BaseDataUtil.tradeMarkStatuslist
                            join b in adminstatusDate
                            on a.i_Id equals b.TradeMarkStatusId into  temp
                            from t in temp
                            select new 
                            {
                                i_Id = t==null? 0:t.i_Id,
                                TradeMarkStatusId = a.i_Id,
                                TradeMarkStatusValue=a.StatusValue,
                                StatusName=a.StatusName,
                                TradeMarkDate = t==null? null: t.TradeMarkDate,
                            }; 
        RptAdminStatus.DataSource=result;
        RptAdminStatus.DataBind();

    }
    private void Bind_Page_Info(int trademarkId)// 绑定商标详细数据
    {
        model = mark.Trademark_Select_Id(trademarkId);
        if (model.ProvinceId > 0 && model.CityId > 0 && model.AreaId > 0)
        {
            division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);
        }
        if (model.Status != null)
        {
            //已提交，未汇款10  已提交，续展中11
            if (model.Status.Value>=2&& model.Status.Value<=9)
                hrefedit.Visible = true;
            else
                hrefedit.Visible = false;
            status = BaseDataUtil.tradeMarkRenewedStatuslist.Where(p => p.StatusValue == model.Status).First().StatusName;
        }

        if (!string.IsNullOrEmpty(model.ApplyUpBook))
            model.ApplyUpBook = "<a href='" + model.ApplyUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
        else
            model.ApplyUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.AgentUpBook))
            model.AgentUpBook = "<a href='" + model.AgentUpBook + "' title='点击查看' target='_blank'>委托书已上传</a>";
        else
            model.AgentUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.RenewalApplyUpBook))
            model.RenewalApplyUpBook = "<a href='" + model.RenewalApplyUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
        else
            model.RenewalApplyUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.RenewalAgentUpBook))
            model.RenewalAgentUpBook = "<a href='" + model.RenewalAgentUpBook + "' title='点击查看' target='_blank'>委托书已上传</a>";
        else
            model.RenewalAgentUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.SoundFile))
            model.SoundFile = "<a href='" + model.SoundFile + "' title='点击查看' target='_blank'>声音文件已上传</a>";
        else
            model.SoundFile = "未上传";

        if (!string.IsNullOrEmpty(model.Businesslicense))
            model.Businesslicense = "<a href='" + model.Businesslicense + "' title='点击查看' target='_blank'>营业执照副本已上传</a>";
        else
            model.Businesslicense = "未上传";
        if (!string.IsNullOrEmpty(model.CardNoPDF))
            model.CardNoPDF = "<a href='" + model.CardNoPDF + "' title='点击查看' target='_blank'>身份证证件已上传</a>";
        else
            model.CardNoPDF = "未上传";

        if (!string.IsNullOrEmpty(model.TrademarkPattern1))
            model.TrademarkPattern1 = "<img alt='' height='150px'  width='150px' src='" + model.TrademarkPattern1 + "' />";
        else
            model.TrademarkPattern1 = "未上传";

        if (!string.IsNullOrEmpty(model.TrademarkType) && !string.IsNullOrEmpty(model.TrademarkGoods))
        {
            //根据商品ID查找商品的信息
            dal_Goods goods = new dal_Goods();
            string[] goodIds = model.TrademarkGoods.Split(',');
            var result = goods.Goods_Select_MultipleId(goodIds);
            if (result != null && result.Count() > 0)
            {
                goodsItemCount = result.Count();
                this.Rpt_goods.DataSource = result;
                this.Rpt_goods.DataBind();
            }
        }
       this.RptRenewalDate.DataSource= mark.TrademarkRenewalDate_Select_TrademarkId(trademarkId);
       this.RptRenewalDate.DataBind();
    }
}