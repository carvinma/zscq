using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;
using zscq.BLL;

public partial class user_shoporder1 : System.Web.UI.Page
{
    dal_Nationality DALN = new dal_Nationality();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_UserGrade DALUG = new dal_UserGrade();
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Address DALA = new dal_Address();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_IntegralOrderDetails DALIOD = new dal_IntegralOrderDetails();
    dal_Coupon DALC = new dal_Coupon();
    bll_Coupon BLLC = new bll_Coupon();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    public CookiesShopCart CCart = new CookiesShopCart();
    public int PriceCount = 0;
    public StringBuilder td_ShopCart = new StringBuilder();

    public string TitleOrKeyword = "";
    public string ShopName = "Global Patent";
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
        TitleOrKeyword = "<title>Confirm reward points exchange information_" + ShopName + "</title><meta name=\"Keywords\" content=\"" + ShopKeywords + "\"/><meta name=\"Description\" content=\"" + ShopDescription + "\"/>";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Title();
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            DALN.Nationality_Bind_DDL(ddl_guojia,"en");
            Bind_Page_Member();
            Bind_Page_Value();
            if (Request.QueryString["PageType"] != null && Request.QueryString["PageType"] != "")
            {
                Delete_Address();
                Mr_Address();
            }
            Bind_Rpt_Address();
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null)
        {
            if (Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
            {
                Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_shop_uid"].ToString();
                return;
            }
        }
        Response.Redirect("shoplogin.aspx?pageurl2=" + HttpUtility.UrlEncode(Request.Url.ToString()));
    }
    void Bind_Page_Value()//绑定page面
    {
        bool showaddr = false;
        int MemberId = Convert.ToInt32(Hi_MemberId.Value);
        t_Member member = DALM.Member_Select_Id(MemberId);
        if (Request.QueryString["action"] == "del")
        {
            Del_Product();
        }
        #region 绑定购物车
        {
            int shu = 0;
            int allIntegral = 0;
            string[] ShopCart = CCart.Set_ShopCart();
            if (CCart.Set_ShopCart() != null)
            {
                foreach (var q in ShopCart)
                {
                    if (q != "")
                    {
                        var model = DALIP.IntegralProduct_vw_Select_Id(int.Parse(q.Split(',')[0]));
                        if (model.i_Type == 1 && showaddr == false)
                        {
                            showaddr = true;
                        }
                        if (model != null)
                        {
                            int ShopNumber = int.Parse(q.Split(',')[1]);
                            int jf = model.i_NeedIntegral * ShopNumber;
                            allIntegral += jf;
                            shu++;
                            td_ShopCart.Append("<tr>");
                            td_ShopCart.Append("<td width='88' height='70' align='center' bgcolor='#FFFFFF'><a target=\"_blank\" href='jifen_show.aspx?ptype=" + model.i_Type + "&cid=" + model.i_Id + "'  ><img src='../pic_big/" + model.nvc_Pic + "' width='60' height='60' border='0' /></a></td>");
                            td_ShopCart.Append("<td width='191' align='center' bgcolor='#FFFFFF'><a target=\"_blank\" href='jifen_show.aspx?ptype=" + model.i_Type + "&cid=" + model.i_Id + "' class='ac5t'>" + model.nvc_Name + "</a></td>");
                            //td_ShopCart.Append("<td width='137' align='center' bgcolor='#FFFFFF'>" + model.nvc_Number + "</td>");
                            td_ShopCart.Append("<td width='98' align='center' bgcolor='#FFFFFF'><span class='font14ac5'>" + model.i_NeedIntegral + "</span></td>");
                            td_ShopCart.Append("<td width='87' align='center' bgcolor='#FFFFFF'>");
                            td_ShopCart.Append("<table width='90%' border='0' cellspacing='0' cellpadding='0'>");
                            td_ShopCart.Append("<tr>");
                            #region 减图标
                            td_ShopCart.Append("<td width='21%' height='20' align='left'>");
                            if (model.i_Type != 3)
                            {
                                td_ShopCart.Append("<img src='images/icon_jian.gif' width='14' height='13' onclick=\"managepnumber(1,'cartsubproduct','" + shu + "','" + model.i_Id + "',1," + model.i_Type + ")\" style=\" cursor:pointer;\" />");
                            }
                            td_ShopCart.Append("</td>");
                            #endregion
                            #region 数量
                            td_ShopCart.Append("<td width='55%' align='center'>");
                            if (model.i_Type != 3)
                            {
                                td_ShopCart.Append("<input type='hidden' id='hi_pnumber" + shu + "' value='" + ShopNumber + "' />");
                                td_ShopCart.Append("<input type='hidden' id='hi_pintegral" + shu + "' value='" + model.i_NeedIntegral + "' />");
                                td_ShopCart.Append("<input id='pnumber" + shu + "' onblur=\"blurpnumber('" + shu + "','" + model.i_Id + "')\" size='5' maxlength='4' oncopy='return false' onpaste='return false' onkeypress='OnlyNumber()' style='ime-mode: disabled;line-height:18px;height: 18px; width: 35px; font-size: 12px; border: 1px solid #e1e2e3; text-align: center;' type='text' value='" + ShopNumber + "'/>");
                            }
                            else
                            {
                                td_ShopCart.Append(ShopNumber);
                            }
                            td_ShopCart.Append("</td>");
                            #endregion
                            #region 加图标
                            td_ShopCart.Append("<td width='24%' align='left'>");
                            if (model.i_Type != 3)
                            {
                                td_ShopCart.Append("<img src='images/icon_jia.gif' width='14' height='13' onclick=\"managepnumber(1,'cartaddproduct','" + shu + "','" + model.i_Id + "',1," + model.i_Type + ")\" style=\" cursor:pointer;\" />");
                            }
                            td_ShopCart.Append("</td>");
                            #endregion
                            td_ShopCart.Append("</tr>");
                            td_ShopCart.Append("</table>");
                            td_ShopCart.Append("</td>");
                            td_ShopCart.Append("<td width='69' align='center' bgcolor='#FFFFFF'><span class='font14ac5' id='span_integral" + shu + "'>" + jf + "</span></td>");
                            td_ShopCart.Append("<td width='69' align='center' bgcolor='#FFFFFF'><a target=\"_blank\" href='user_shoporder1.aspx?action=del&cid=" + model.i_Id + "&pid=" + model.i_Type + "' class='ac5t'>Delete</a></td>");
                            td_ShopCart.Append("</tr>");
                        }
                    }
                }
            }

            Hi_allintegral.Value = allIntegral.ToString();
        }
        #endregion
        if (showaddr)
        {
            div_addr.Visible = true;
            #region 默认收货Address
            if (member.i_DefaultAddress == 0)
            {
                var iquery = from i in DALRA.ReceiveAddress_Select_MemberId(MemberId) select i;
                if (iquery.Count() > 0)
                {
                    t_ReceiveAddress model_RA = (from i in iquery where i.i_Id == member.i_DefaultAddress select i).FirstOrDefault();
                    if (model_RA == null)
                    {
                        model_RA = iquery.FirstOrDefault();
                    }
                    Hi_AddressId.Value = model_RA.i_Id.ToString();
                }
            }
            else
            {
                Hi_AddressId.Value = member.i_DefaultAddress.ToString();
                Hi_Mr.Value = member.i_DefaultAddress.ToString();
            }
            #endregion
        }
        else
        {
            div_addr.Visible = false;
        }
    }
    void Delete_Address()//删除地址
    {
        if (Request.QueryString["PageType"].ToString() == "del")
        {
            int Id = Convert.ToInt32(Request.QueryString["did"].ToString());
            if (DALRA.ReceiveAddress_Del(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('Error occurs, the subject address cannot be deleted ！')</script>";
            }
            else
            {
                #region 如果删除了默认的Address
                t_Member model = DALM.Member_Select_Id(Convert.ToInt32(Hi_MemberId.Value));
                if (model != null)
                {
                    if (Id == model.i_DefaultAddress)
                    {
                        var iquery = from i in DALRA.ReceiveAddress_Select_MemberId(model.i_Id) select i;
                        if (iquery.Count() > 0)
                        {
                            DALRA.ReceiveAddress_Update_Mr(iquery.FirstOrDefault().i_Id);
                        }
                        else
                        {
                            model.i_DefaultAddress = 0;
                            DALM.Member_Update(model);
                        }
                    }
                }
                #endregion
                Response.Redirect("user_shoporder1.aspx");
            }
        }
    }
    void Mr_Address()//默认
    {
        if (Request.QueryString["PageType"].ToString() == "mr")
        {
            int Id = Convert.ToInt32(Request.QueryString["mid"].ToString());
            if (DALRA.ReceiveAddress_Update_Mr(Id) == 0)
            {
                div_a.InnerHtml = "<script>alert('Error occurs！')</script>";
            }
            else
            {
                Response.Redirect("user_shoporder1.aspx");
            }
        }
    }
    void Bind_Rpt_Address()
    {
        Rpt_Address.DataSource = DALRA.ReceiveAddress_vw_Select_MemberId(Convert.ToInt32(Hi_MemberId.Value));
        Rpt_Address.DataBind();
    }
    //protected void ddlguojia_SelectedIndexChanged(object sender, EventArgs e)//绑定省
    //{
    //    DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_guojia.SelectedValue);
    //    DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    //protected void ddlsheng_SelectedIndexChanged(object sender, EventArgs e)//绑定市
    //{
    //    DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    //protected void ddlshi_SelectedIndexChanged(object sender, EventArgs e)//绑定区
    //{
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    protected void Bt_Add_Click(object sender, EventArgs e)//Add Address
    {
        try
        {
            t_ReceiveAddress model = new t_ReceiveAddress();
            model.nvc_Consignee = text_shouhuoren.Value;
            model.i_Gid = Convert.ToInt32(this.ddl_guojia.SelectedValue);
            //model.i_PId = Convert.ToInt32(this.ddl_sheng.SelectedValue);
            //model.i_CId = Convert.ToInt32(this.ddl_shi.SelectedValue);
            //model.i_AId = Convert.ToInt32(this.ddl_qu.SelectedValue);
            model.nvc_StreetAddress = text_shouhuodizhi.Value;
            model.nvc_ZipCode = text_youzhengbianma.Value;
            model.nvc_MobilePhone = text_shoujihaoma.Value;
            model.nvc_TelPhone = text_gudingdianhua.Value;
            model.nvc_Email = text_dianziyoujian.Value;
            model.i_MemberId = int.Parse(Hi_MemberId.Value);
            switch (DALRA.ReceiveAddress_Add(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('Error occurs, the address cannot be added temperately!');</script>";
                    break;
                case 1:
                    if (CB_Mr.Checked)
                    {
                        DALRA.ReceiveAddress_Update_Mr(model.i_Id);
                    }
                    Response.Redirect("user_shoporder1.aspx");
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('You have the same recipient and the same address information already, which is no need to add again!');</script>";
                    break;
            }
        }
        catch { }
    }
    void Clear_Cart()//清空购物车
    {
        if (Request.QueryString["action"].Trim() == "Clear")
        {
            if (CCart != null)
            {
                CCart.Clear_ShopCart();
                Response.Redirect("user_shoporder1.aspx");
            }
        }
    }
    void Del_Product()//删除商品
    {
        if (Request.QueryString["cid"].Trim() != null && Request.QueryString["cid"].ToString() != "" && Request.QueryString["pid"].Trim() != null && Request.QueryString["pid"].ToString() != "")
        {
            if (CCart != null)
            {
                CCart.Del_ShopCart(Request.QueryString["cid"].ToString(), Request.QueryString["pid"].ToString());
                Response.Redirect("user_shoporder1.aspx");
            }
        }
    }
    bool AddUserGrade(vw_Member v_member, int Pid)
    {
        var grade = DALIP.IntegralProduct_vw_Select_Id(Pid);
        var member = DALM.Member_Select_Id(v_member.i_Id);
        if (v_member.i_GradeId < grade.i_Grade)
        {
            member.i_Grade = Convert.ToInt32(grade.i_MemberGradeId);
            return DALM.Member_Update(member) > 0;
        }
        return false;
    }
    bool AddCounp(vw_Member v_member, int Pid, int number)
    {
        try
        {
            var model = DALIP.IntegralProduct_vw_Select_Id(Pid);
            BLLC.Coupon_ForAdd(number, DateTime.Now.AddMonths(Convert.ToInt32(model.i_TimeLength)).ToString(), model.i_CouponTypeId.ToString(), v_member.i_Id, "商城兑换");
            return true;
        }
        catch { return false; }
    }
    protected void Bt_SubmitOrder_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            int MemberId = Convert.ToInt32(Convert.ToInt32(Hi_MemberId.Value));
            var m_member = DALM.Member_vw_Select_Id(MemberId);
            var m_mobile = DALIM.IntegralMobile_SelectByMemberId(MemberId);
            if (m_member != null & m_mobile != null)
            {
                if (m_mobile.i_Integral >= CCart.Set_ShopCartIntegral())
                {
                    t_IntegralOrder model = new t_IntegralOrder();
                    model.nvc_OrderNumber = DALIO.Set_IntegralOrderNo(model.i_Id.ToString());
                    model.i_IntegralMobileId = m_member.i_IntegralMobileId;
                    model.i_SumIntegral = 0;
                    model.i_MemberId = MemberId;
                    #region 订单Detailed information+订单编号+订单总数量
                    List<t_IntegralOrderDetails> iodlis = new List<t_IntegralOrderDetails>();
                    string[] ShopCart = CCart.Set_ShopCart();
                    if (CCart.Set_ShopCart() == null || CCart.Set_ShopCart().Length == 0)
                    {
                        div_a.InnerHtml = "<script>alert('You need go to pick goods！');window.location='jifen.aspx';</script>";
                        return;
                    }
                    int sumgrade = 0;
                    foreach (var q in ShopCart)
                    {
                        if (q != "")
                        {
                            int PId = int.Parse(q.Split(',')[0]);
                            int ShopNumber = int.Parse(q.Split(',')[1]);
                            var model_ip = DALIP.IntegralProduct_vw_Select_Id(PId);
                            #region 订单Detailed information
                            if (model_ip != null)
                            {
                                if (model_ip.i_Type == 1)
                                {
                                    #region 是否需要Address
                                    int AddressId = Convert.ToInt32(Hi_AddressId.Value);
                                    t_ReceiveAddress model_ra = DALRA.ReceiveAddress_Select_Id(AddressId);
                                    if (model_ra != null)
                                    {
                                        model.i_AddressId = model_ra.i_Id;
                                        model.nvc_Address_Consignee = model_ra.nvc_Consignee;
                                        model.nvc_Address_Email = model_ra.nvc_Email;
                                        model.nvc_Address_MobilePhone = model_ra.nvc_MobilePhone;
                                        model.nvc_Address_StreetAddress = model_ra.nvc_StreetAddress;
                                        model.nvc_Address_TelPhone = model_ra.nvc_TelPhone;
                                        model.nvc_Address_ZipCode = model_ra.nvc_ZipCode;
                                        model.i_Address_GId = model_ra.i_Gid;
                                        model.i_Address_AId = model_ra.i_AId;
                                        model.i_Address_CId = model_ra.i_CId;
                                        model.i_Address_PId = model_ra.i_PId;
                                    }
                                    else
                                    {
                                        div_a.InnerHtml = "<script>alert('Please select Address！');window.location='user_shoporder1.aspx';</script>";
                                        return;
                                    }
                                    #endregion
                                }
                                if (model_ip.i_Type == 2)
                                {
                                    #region 优惠券商品
                                    #endregion
                                }
                                if (model_ip.i_Type == 3)
                                {
                                    sumgrade += 1;
                                    #region 会员等级商品
                                    if (ShopNumber > 1 || sumgrade > 1)
                                    {
                                        div_a.InnerHtml = "<script>alert('Goods can only buy a Member level！');window.location='user_shoporder1.aspx';</script>";
                                        return;
                                    }
                                    if (m_member.i_GradeId >= model_ip.i_Grade)
                                    {
                                        div_a.InnerHtml = "<script>alert('No need to buy this Member level goods！');window.location='user_shoporder1.aspx';</script>";
                                        return;
                                    }
                                    if (model_ip.i_Grade - m_member.i_GradeId > 1)
                                    {
                                        div_a.InnerHtml = "<script>alert('This goods can not buy Member level！');window.location='user_shoporder1.aspx';</script>";
                                    }
                                    #endregion
                                }
                                var iodmodel = new t_IntegralOrderDetails();
                                iodmodel.i_IntegralMobileId = m_member.i_IntegralMobileId;
                                iodmodel.i_IntegralProductId = model_ip.i_Id;
                                iodmodel.i_BuyNumber = ShopNumber;
                                iodmodel.i_Integral = model_ip.i_NeedIntegral * ShopNumber;
                                iodmodel.i_IntegralProductType = model_ip.i_Type;
                                iodlis.Add(iodmodel);
                            }
                            #endregion
                        }
                    }
                    #endregion
                    #region 提交订单
                    //开始提交订单
                    DALIO.IntegralOrder_Add(model);
                    int sumIntegral = 0;
                    int sumBuyNumber = 0;
                    model.i_State = 4;
                    foreach (var v in iodlis)
                    {
                        v.i_IntegralOrderId = model.i_Id;
                        if (v.i_IntegralProductType == 1)
                        { model.i_State = 2; }
                        if (v.i_IntegralProductType == 2)
                        {
                            AddCounp(m_member, v.i_IntegralProductId, v.i_BuyNumber);
                        }
                        if (v.i_IntegralProductType == 3)
                        {
                            AddUserGrade(m_member, v.i_IntegralProductId);
                        }
                        sumIntegral += v.i_Integral;
                        sumBuyNumber += 1;
                        DALIP.IntegralProduct_UpdateBuys(v.i_IntegralProductId, v.i_BuyNumber);
                        DALIOD.IntegralOrderDetails_Add(v);
                    }
                    model.i_BuyNumber = sumBuyNumber;
                    model.i_SumIntegral = sumIntegral;
                    DALIO.IntegralOrder_Update(model);//更新订单
                    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "商城兑换", -sumIntegral);//减会员积分并且生成流水
                    bll_IntegralOrderOperateNote BLLIOON = new bll_IntegralOrderOperateNote(); //订单流水
                    BLLIOON.IntegralOrderOperateNote_Add("Shop orders", "", MemberId, model.i_Id);
                    CCart.Clear_ShopCart();
                    UserLog.AddUserLog(Hi_MemberId.Value, "商城系统", "商城下单");
                    Response.Redirect("user_shoporder2.aspx?oid=" + model.i_Id);
                    #endregion
                }
                else
                {
                    div_a.InnerHtml = "<script>alert('Less Points');window.location='user_shoporder1.aspx';</script>";
                    return;
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('Login has expired！');window.location='index.aspx?pageurl2='" + HttpUtility.UrlEncode(Request.Url.ToString()) + "</script>";
            }
        }
        catch
        {
        }
    }

}