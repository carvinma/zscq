using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using zscq.DAL;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Reflection;
using System.IO;
using System.Text;
using System.Data;

public partial class M_TrademarkInfo : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALS = new dal_TrademarkSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_DataOrder DALDO = new dal_DataOrder();
    dal_UserGrade DALUG = new dal_UserGrade();
    dal_Member DALM = new dal_Member();
    public string returnurl = "";
    public int trademarkId = 0;
    public string Name = "";
    public string IdCard = "";
    public string Tel = "";
    public string ChuanZhen = "";
    public string Address = "";
    public string YouBian = "";
    public string QQ = "";
    public string BendailiName = "";
    public string BendailiTel = "";
    public string BendailiChuanZhen = "";
    public string BendailiCnName = "";
    public string BendailiEnName = "";
    public string SBRegNum = "";
    public string SBRegaType = "";
    public string SBRegMiaoshu = "";
    public string SBRegName = "";
    public string SBRegAddress = "";
    public string SBRegYouBian = "";
    public string SBRegTime = "";
    public string JiaoFeiType = "";
    public string daoqitime = "";
    public string shengtime = "0";
    public string anjuanhao = "", linkman = "", linkaddress = "", linktel = "";
    public int state = 0, usertype = 0;
    public string isjiaofei = "";
    public int fileurl = 0;
    public int fileword = 0, JFtype = 1;

    private dal_NewTrademark mark = new dal_NewTrademark();
    private dal_Address address = new dal_Address();
    public t_NewTradeMarkInfo model = new t_NewTradeMarkInfo();
    public string division = string.Empty;
    public string status = string.Empty;
    public int goodsItemCount;
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        if (!IsPostBack)
        {
            Bind_Page_Type();
        }
    }
    public void Bind_Page_Type()// 绑定页面信息
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            trademarkId = int.Parse(Request.QueryString["id"].ToString());
            Bind_Page_Info(trademarkId);
            Bind_Rpt_Patent(trademarkId);
            Bind_TradeMarkStatus(trademarkId);
            Bind_Message(trademarkId);
        }
    }
    /// <summary>
    /// 商标留言
    /// </summary>
    private void Bind_Message(int trademarkId)
    {
        this.RptMessage.DataSource = mark.trademarkMessage_Select_id(trademarkId).ToList();
        this.RptMessage.DataBind();
    }
    private void Bind_TradeMarkStatus(int trademarkId)
    {
        var adminstatusDate = mark.trademarkStatusdate_Select_id(trademarkId).ToList();
        var result = from a in BaseDataUtil.tradeMarkStatuslist
                     join b in adminstatusDate
                     on a.i_Id equals b.TradeMarkStatusId into temp
                     from t in temp
                     select new
                     {
                         i_Id = t == null ? 0 : t.i_Id,
                         TradeMarkStatusId = a.i_Id,
                         TradeMarkStatusValue = a.StatusValue,
                         StatusName = a.StatusName,
                         TradeMarkDate = t == null ? null : t.TradeMarkDate,
                     };
        RptAdminStatus.DataSource = result;
        RptAdminStatus.DataBind();

    }
    private void Bind_Page_Info(int trademarkId)// 绑定商品详细数据
    {
        model = mark.Trademark_Select_Id(trademarkId);
        #region 会员信息
        t_Member vmodel = DALM.Member_Select_Id(model.i_MemberId);
        if (vmodel != null)
        {
            lb_username.Text = vmodel.nvc_Name;
            lb_usernum.Text = vmodel.nvc_UserNum;
            Name = vmodel.nvc_RealName;
            IdCard = vmodel.nvc_IDCard;
            Tel = vmodel.nvc_TelPhone;
            ChuanZhen = vmodel.nvc_FaxNumber;
            string  xzqh="";
            if(vmodel.i_ProvinceId>0&& vmodel.i_CityId>0&&vmodel.i_AreaId>0)
            {
               xzqh = address.Set_AddressName_PId_CId_AId(vmodel.i_ProvinceId, vmodel.i_CityId, vmodel.i_AreaId);
            }
            Address =xzqh.Replace(" ","")+ vmodel.nvc_Address;
            YouBian = vmodel.nvc_ZipCode;
            QQ = vmodel.nvc_LinkManQQ;

            Ltl_VipYuFuKuan.Text = vmodel.dm_YuFuKuan.ToString();
            Ltl_VipYuE.Text = vmodel.dm_YuE.ToString();
            Ltl_VipQianFei.Text = vmodel.dm_QianFei.ToString();
            Ltl_VipXinYong.ImageUrl = "../../" + DALUG.UserGrade_Select_Id(vmodel.i_Grade).nvc_Logo;
        }
        #endregion

        if (model.ProvinceId > 0 && model.CityId > 0 && model.AreaId > 0)
        {
            division = address.Set_AddressName_PId_CId_AId(model.ProvinceId.Value, model.CityId.Value, model.AreaId.Value);
        }
        if (model.Status != null)
        {
            status = BaseDataUtil.tradeMarkRenewedStatuslist.Where(p => p.StatusValue == model.Status).First().StatusName;
        }
        if (!string.IsNullOrEmpty(model.ApplyUpBook))
            model.ApplyUpBook = "<a href='../../" + model.ApplyUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
        else
            model.ApplyUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.AgentUpBook))
            model.AgentUpBook = "<a href='../../" + model.AgentUpBook + "' title='点击查看' target='_blank'>委托书已上传</a>";
        else
            model.AgentUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.RenewalApplyUpBook))
            model.RenewalApplyUpBook = "<a href='../../" + model.RenewalApplyUpBook + "' title='点击查看' target='_blank'>申请书已上传</a>";
        else
            model.RenewalApplyUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.RenewalAgentUpBook))
            model.RenewalAgentUpBook = "<a href='../../" + model.RenewalAgentUpBook + "' title='点击查看' target='_blank'>委托书已上传</a>";
        else
            model.RenewalAgentUpBook = "未上传";

        if (!string.IsNullOrEmpty(model.SoundFile))
            model.SoundFile = "<a href='../../" + model.SoundFile + "' title='点击查看' target='_blank'>声音文件已上传</a>";
        else
            model.SoundFile = "未上传";

        if (!string.IsNullOrEmpty(model.Businesslicense))
            model.Businesslicense = "<a href='../../" + model.Businesslicense + "' title='点击查看' target='_blank'>营业执照副本已上传</a>";
        else
            model.Businesslicense = "未上传";
        if (!string.IsNullOrEmpty(model.CardNoPDF))
            model.CardNoPDF = "<a href='../../" + model.CardNoPDF + "' title='点击查看' target='_blank'>身份证证件已上传</a>";
        else
            model.CardNoPDF = "未上传";

        if (!string.IsNullOrEmpty(model.TrademarkPattern1))
            model.TrademarkPattern1 = "<img alt='' height='150px'  width='150px' src='../../" + model.TrademarkPattern1 + "' />";
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
        this.RptRenewalDate.DataSource = mark.TrademarkRenewalDate_Select_TrademarkId(trademarkId);
        this.RptRenewalDate.DataBind();
    }

    public void Bind_Rpt_Patent(int did)
    {
        int Ccount = 0;
        reptlist.DataSource = DALDO.DataOrder_SelectPage(1, 10000, did, 2, "", "", ref Ccount);
        reptlist.DataBind();
    }
}