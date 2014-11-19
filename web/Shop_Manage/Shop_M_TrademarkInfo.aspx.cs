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

public partial class Shop_Manage_shop_addhw : System.Web.UI.Page
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
    public int state = 0, usertype=0;
    public string isjiaofei ="";
    public int fileurl = 0;
    public int fileword = 0,JFtype=1;
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
        div_a.InnerHtml = "";
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
            Hi_TId.Value = trademarkId.ToString();
            Bind_Page_Info(trademarkId);
            Bind_Rpt_Patent(trademarkId);
        }

    }
    private void Bind_Page_Info(int trademarkId)// 绑定商品详细数据
    {
        vw_Trademark model = DALT.Trademark_vw_Select_Id(trademarkId);
        t_TradeMarkSetup model1 = DALS.TrademarkSetup_Select();//代理费用
      
        if (model != null)
        {
            lb_username.Text = model.nvc_Name;
            lb_usernum.Text = model.nvc_UserNum;
            if (model1 != null)
            {
                t_Nationality na = DALN.Nationality_Select_Id(model.i_GuoJiId);
                string huilv = "1";
                if (na.nvc_Name == "中国")
                {

                    //lb_shangbiao.Text = "￥" + model1.dm_TrademarkMoney.ToString("0.00") + "元";

                    //lb_daili.Text = "￥" + model1.dm_TMDaiLi.ToString("0.00") + "元";
                }
                else
                {
                    if (na.dm_Exchange != null || na.dm_Exchange != 0)
                    {
                        huilv = na.dm_Exchange.ToString();
                    }
                    //lb_shangbiao.Text = model1.dm_TrademarkMoney.ToString("0.00") + "元" + "   国外商标费用:" + HelpString.GetMoneyFormat(model1.dm_TrademarkMoney, huilv) + "美元";
                    //lb_daili.Text = model1.dm_TMDaiLi.ToString("0.00") + "元" + "国外商标代理费用：" + HelpString.GetMoneyFormat(model1.dm_TMDaiLi, huilv) + "美元";
                }
            }
            Ltl_VipYuFuKuan.Text = model.dm_YuFuKuan.ToString();
            Ltl_VipYuE.Text = model.dm_YuE.ToString();
            Ltl_VipQianFei.Text = model.dm_QianFei.ToString();
            Ltl_VipXinYong.ImageUrl = "../" + DALUG.UserGrade_Select_Id(model.i_Grade).nvc_Logo;
            Name = model.nvc_RealName;
            Tel = model.nvc_TelPhone;
            ChuanZhen = model.nvc_FaxNumber;
           Address = model.nvc_Address;
           YouBian = model.nvc_ZipCode;
           QQ = model.nvc_LinkManQQ;
            BendailiName = model.nvc_DLName;
            BendailiTel = model.nvc_DLTel;
            BendailiChuanZhen = model.nvc_DLFaxnumber;
            BendailiCnName = model.nvc_DLZuzhiName;
            BendailiEnName = model.nvc_DLZuzhiEnName;
            SBRegNum = model.nvc_SBRegNum;
            SBRegaType = model.nvc_SBType;
            if (model.i_GuoJiId == 1)
            {
                if (model.i_UserTypeId == 1)
                {
                  IdCard = model.nvc_IDCard;
                }
            }
            if (model.nvc_SBFile != null)
            {
                fileurl = 1;
                Image3.ImageUrl = "../" + model.nvc_SBFile;
            }

            if (model.i_MemberId != null)
            {
                if (model.i_UserTypeId != 3)
                {
                    var m = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
                    if (m != null && !string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                    {
                        if (m.nvc_ZhuTiFile != null)
                        {
                            Image1.ImageUrl = "../" + m.nvc_ZhuTiFile;
                        }
                    }
                }
                else
                {
                    if (model.nvc_ZhuTiFile != null)
                    {
                        Image1.ImageUrl = "../" + model.nvc_ZhuTiFile;
                    }
                }
            }
            else
            {
                if (model.user_ZhuTiFile != null)
                {
                    Image1.ImageUrl = "../" + model.nvc_ZhuTiFile;
                }

            }
            if (model.nvc_ShenQingShu != null)
            {
                Image2.ImageUrl = "../" + model.nvc_ShenQingShu;
            }
                if (model.i_JiaoFeiType == 1)
                {
                    JFtype = 1;
                    if (model.nvc_JFApplicationUrl != null || model.nvc_JFApplicationUrl != "")
                    {
                        fileword = 1;
                    }
                }
                else
                {
                    JFtype = 2;
                    if (model.nvc_WeituoFile != null)
                    {
                        Image4.ImageUrl = "../" + model.nvc_WeituoFile;
                    }
                    if (model.nvc_JFApplicationUrl1 != null || model.nvc_JFApplicationUrl1 != "")
                    {
                        fileword = 1;
                    }
                }
          
            if (model.i_IsPayState == 0)
            {
                isjiaofei = "未缴费";
            }
            if (model.i_IsPayState == 1)
            {
                isjiaofei = "已缴费";
            }
            if (model.i_IsPayState == 3)
            {
                isjiaofei = "无效";
            }
            SBRegMiaoshu = model.nvc_SBDescribe;
            SBRegName = model.nvc_SBRegName;
            SBRegAddress = model.nvc_SBRegAddress;
            SBRegYouBian = model.nvc_SBPostcode;
            SBRegTime = model.nvc_SbRegTime;

            daoqitime = model.nvc_SbDaoqiTime;
            shengtime = model.i_ShengDays.ToString();          
            JiaoFeiType = model.i_JiaoFeiType == 1 ? "自行缴费" : "代理缴费";

            t_Member mm = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
            if (mm != null)
            {               
                if (mm.i_UserTypeId == 3)//代理
                {
                    usertype = 3;                    
                    anjuanhao = model.nvc_CFaxnumber;
                    linkman = model.nvc_OtherName;
                    linktel = model.nvc_CTel;
                    linkaddress = model.nvc_CAddress;
                }
            }
        }
    }

    public void Bind_Rpt_Patent(int did)
    {
        int Ccount = 0;
        reptlist.DataSource = DALDO.DataOrder_SelectPage(1, 10000, did, 2, "", "", ref Ccount);
        reptlist.DataBind();
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Request.Form["inputPageid"] != null)
        {
            string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                DALDO.DataOrder_Del(int.Parse(IDList[i]));
            }
            Manager.AddLog(0, "商标账单管理", "删除商标账单");
        }

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            int Id = int.Parse(Request.QueryString["id"].ToString());
            Bind_Rpt_Patent(Id);
        }
        HiddenDel.Value = "del";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            t_DataOrder model = new t_DataOrder();
            string data = HI_ATT.Value;
            if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
            {
                int Id = int.Parse(Request.QueryString["id"].ToString());
                if (data != "")
                {
                   // Response.Write("<script>alert('"+data+"');</script>");
                    string[] liststr = data.Split('|');
                    for (int i = 0; i < liststr.Length - 1; i++)
                    {
                        string[] lname = liststr[i].Split('_');
                        if (lname[0].ToString() != "")
                        {
                            model.i_OrderType = 2;//2对应的是商标 订单  1 对应的是专利订单
                            model.i_DataId = Id;//商标id
                            model.nvc_OrderNum = lname[0].ToString();
                            if (lname[1].ToString() != "")
                            {
                                model.dt_AddOrderTime = DateTime.Parse(lname[1].ToString());
                            }
                            if (lname[2].ToString() != "")
                            {
                                model.dt_ShouKuanTime = DateTime.Parse(lname[2].ToString());
                            }
                            if (lname[3].ToString() != "")
                            {
                                model.dt_JiaoFeiTime = DateTime.Parse(lname[3].ToString());
                            }
                            if (lname[4].ToString() != "")
                            {
                                model.dt_SendInfoTime = DateTime.Parse(lname[4].ToString());
                            }
                            if (lname[5].ToString() != "")
                            {
                                model.dt_KaiJuTime = DateTime.Parse(lname[5].ToString());
                            }
                            model.nvc_Info1 = lname[6].ToString();
                            model.nvc_Info2 = lname[7].ToString();
                            model.dt_Addtime = DateTime.Now;
                            int ss = DALDO.DataOrder_Add(model);
                            Response.Redirect(Request.Url.ToString());
                        }
                    }
                }
            }
        }
        catch { }
    }

}