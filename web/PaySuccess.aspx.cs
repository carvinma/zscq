using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;

public partial class PaySuccess : System.Web.UI.Page
{
    dal_SystemSetup DALS = new dal_SystemSetup();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_Member DALU = new dal_Member();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    public bool Ishave = false;
    public string AllPrice = "";
    public string OrderNumer = "", leapurl = "", lqurl = "#";
    public int OId = 0;
    public int setIntegral = 0;
    public string TitleOrKeyword = "";
    public string ShopName = "环球汇通";
    public string ShopKeywords = "";
    public string ShopDescription = "";
    public void Bind_Page_Title()
    {
        dal_SystemSetup DALSS = new dal_SystemSetup();
        t_SystemSetup t = DALSS.SystemSetup_Select();
        if (t.nvc_ShopName != null && t.nvc_ShopName != "")
        {
            ShopName = t.nvc_ShopName;
        }
        if (t.nvc_ShopKeywords != null && t.nvc_ShopKeywords != "")
        {
            ShopKeywords = t.nvc_ShopKeywords;
        }
        if (t.nvc_ShopDescription != null && t.nvc_ShopDescription != "")
        {
            ShopDescription = t.nvc_ShopDescription;
        }
        TitleOrKeyword = "<title>支付成功_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        Bind_Page_Value();
    }
    public void Bind_Page_Value()
    {
        if (Request["tType"] != null && Request["tType"].ToString() != "" && Request["oId"] != null && Request["oId"].ToString() != "")
        {
            t_SystemSetup model = DALS.SystemSetup_Select();
            int oType = Convert.ToInt32(Request["tType"]);
            OrderNumer = Request.QueryString["oId"].ToString();
            if (oType == 1)
            {
                t_Member member = DALU.Member_Select_Id(int.Parse(Request.Cookies["hqhtshop"]["hqht_zl_uid"]));
                if (member != null && member.i_IntegralMobileId != 0)
                {
                    Ishave = true;
                }
                t_PatentOrder pModel = DALPO.PatentOrder_Select_OrderNum(OrderNumer);
                if (pModel != null && pModel.dt_PayMoneyTime > DateTime.Now.AddMinutes(-5))
                {
                    setIntegral = DALPOI.PatentOrderInfo_Select_Count(pModel.i_Id) * model.i_ZlIntergral;
                    AllPrice = pModel.dm_TotalMoney.ToString() + "(" + pModel.nvc_CurrencyType + ")";
                    OId = pModel.i_Id;

                    leapurl = "User_PatentOrderInfo.aspx?oId=" + OId;

                }
                //else
                //{
                //    Response.Redirect("index.aspx");
                //}

            }
            else if (oType == 2)
            {
                t_Member member = DALU.Member_Select_Id(int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"]));
                if (member != null && member.i_IntegralMobileId != 0)
                {
                    Ishave = true;
                }
                t_TrademarkOrder tModel = DALTO.TrademarkOrder_Select_Number(OrderNumer);
                if (tModel != null && tModel.dt_PayTime > DateTime.Now.AddMinutes(-5))
                {
                    setIntegral = DALTOD.OrderDetails_Select_Count(tModel.i_Id) * model.i_ZlIntergral;
                    AllPrice = tModel.dm_TotalMoney.ToString();
                    OId = tModel.i_Id;
                    //lqurl = "user_sbsetIntegral.aspx";
                    leapurl = "user_sbddck.aspx?order=" + OId;
                }
                else
                {
                    Response.Redirect("index.aspx");
                }
            }
            else if (oType == 3)
            {
                t_Member member = DALU.Member_Select_Id(int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"]));
                if (member != null && member.i_IntegralMobileId != 0)
                {
                    Ishave = true;
                }
                t_NewTrademarkOrder tModel = DALTO.NewTrademarkOrder_Select_Number(OrderNumer);
                if (tModel != null && tModel.dt_PayTime > DateTime.Now.AddMinutes(-5))
                {
                    setIntegral = DALTOD.NewOrderDetails_Select_Count(tModel.i_Id) * model.i_ZlIntergral;
                    AllPrice = tModel.dm_TotalMoney.ToString();
                    OId = tModel.i_Id;

                    var orderInfo = DALTO.NewTrademarkOrder_vw_Select_Id(tModel.i_Id);
                    if (orderInfo.CaseType == 1) //续展
                    {
                        leapurl = "trademarkrenewalOrder_Info.aspx?order=" + OId + "&tIds=" + orderInfo.TrademarkIds; //续展
                    }
                    else
                        leapurl = "trademarkOrder_Info.aspx?order=" + OId + "&tIds=" + orderInfo.TrademarkIds; //申请
                }
                else
                {
                    Response.Redirect("index.aspx");
                }
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    protected void ibtn_Add_Click(object sender, ImageClickEventArgs e)
    {
        int oType = Convert.ToInt32(Request["tType"]);
        int upid = 0;
        if (oType == 1)
        {
            upid = int.Parse(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            t_Member member = DALU.Member_Select_Id(upid);
            t_IntegralMobile model = null;
            if (member != null && member.i_IntegralMobileId == 0)//专利没有手机号
            {
                model = DALIM.IntegralMobile_SelectByMobile(txt_moblie.Value);
                if (model != null)//手机号是否使用
                {
                    if (model.i_zluid == 0)
                    {
                        if (model.nvc_Password == txt_pwd.Value.Trim().Md5Encrypt())
                        {
                            model.i_zluid = upid;
                            //model.i_Integral += setIntegral;
                            DALIM.IntegralMobile_Updata(model);
                            member.i_IntegralMobileId = model.i_Id;
                            DALU.Member_Update(member);
                            UserLog.AddUserLog(upid, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                            BLLUIN.UserIntegralNote_Add(member.i_Id, "专利订单", setIntegral, OId, 1);//会员积分并且生成流水 
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('您已经成功领取积分');</script>", false); return;
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('密码与原密码不一致,绑定失败！');</script>", false); return;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('已有专利用户使用该手机号！');</script>", false); return;
                    }
                }
                else
                {
                    model = new t_IntegralMobile();
                    //model.i_Integral = setIntegral;
                    model.i_zluid = upid;
                    model.nvc_Mobile = txt_moblie.Value;
                    model.nvc_Password = txt_pwd.Value.Md5Encrypt();
                    DALIM.IntegralMobile_Add(model);
                    member.i_IntegralMobileId = model.i_Id;
                    DALU.Member_Update(member);
                    UserLog.AddUserLog(upid, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                    BLLUIN.UserIntegralNote_Add(member.i_Id, "专利订单", setIntegral, OId, 1);//会员积分并且生成流水
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('您已经成功领取积分');</script>", false); return;
                }
            }
        }
        else
        {
            upid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);
            t_Member member = DALU.Member_Select_Id(upid);
            t_IntegralMobile model = null;
            if (member != null && member.i_IntegralMobileId == 0)//没有绑定手机号
            {
                model = DALIM.IntegralMobile_SelectByMobile(txt_moblie.Value);
                if (model != null)
                {
                    if (model.i_sbuid == 0)
                    {
                        if (model.nvc_Password == txt_pwd.Value.Trim().Md5Encrypt())
                        {
                            model.i_sbuid = upid;
                            model.i_Integral += setIntegral;
                            DALIM.IntegralMobile_Updata(model);
                            member.i_IntegralMobileId = model.i_Id;
                            DALU.Member_Update(member);
                            UserLog.AddUserLog(upid, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                            BLLUIN.UserIntegralNote_Add(member.i_Id, "商标订单", setIntegral, OId, 1);//会员积分并且生成流水
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('您已经成功领取积分');</script>", false); return;
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('密码与原密码不一致,绑定失败！');</script>", false); return;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('已有商标用户使用该手机号！');</script>", false); return;
                    }
                }
                else
                {
                    model = new t_IntegralMobile();
                    model.i_Integral = setIntegral;
                    model.i_sbuid = upid;
                    model.nvc_Mobile = txt_moblie.Value.Trim();
                    model.nvc_Password = txt_pwd.Value.Trim().Md5Encrypt();
                    DALIM.IntegralMobile_Add(model);
                    member.i_IntegralMobileId = model.i_Id;
                    DALU.Member_Update(member);
                    UserLog.AddUserLog(upid, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                    BLLUIN.UserIntegralNote_Add(member.i_Id, "商标订单", setIntegral, OId, 1);//会员积分并且生成流水
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "msg", "<script>alert('您已经成功领取积分');</script>", false); return;
                }
            }
        }
    }
}
