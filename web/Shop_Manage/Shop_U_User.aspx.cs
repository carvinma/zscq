using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
using System.Data;
using System.Web.Security;
public partial class Shop_Manage_shop_modify : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(10, 0);
    public bool pageupdate = Manager.GetManagerQX(10, 2);

    dal_Address DALB = new dal_Address();
    dal_Member DALU = new dal_Member();
    dal_IntegralProduct DALP = new dal_IntegralProduct();
    dal_IntegralOrder DALO = new dal_IntegralOrder();
    dal_ReceiveAddress DALORA = new dal_ReceiveAddress();
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Nationality DALN = new dal_Nationality();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    public string UserName = string.Empty;//用户名
    int upid = 0;
    public string returnurl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null || Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            upid = Convert.ToInt32(Request.QueryString["id"].ToString());
            t_Member t = DALU.Member_Select_Id(upid);
            if (t != null)
            {
                if (t.i_MemberType == 2)
                {
                    Response.Redirect("Shop_U_SBUser.aspx?id=" + t.i_Id.ToString() + "&type=2");
                }
            }
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Drp_PGuoJiaType();
            //Drp_GuoJi_SelectedIndexChanged(null, null);
            Bind_DDL_Grade();
            Bind_Page_Info();
        }
    }
    public void Bind_DDL_Grade()
    {
        dal_UserGrade DALG = new dal_UserGrade();
        DDL_Grade.DataSource = DALG.UserGrade_Select_All();
        DDL_Grade.DataTextField = "nvc_Name";
        DDL_Grade.DataValueField = "i_Id";
        DDL_Grade.DataBind();
    }
    void Bind_Drp_PGuoJiaType()// 绑定国籍
    {
        Drp_GuoJi.Items.Clear();
        ListItem item = new ListItem("请选择", "0");
        Drp_GuoJi.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var q in iquery)
        {
            ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
            Drp_GuoJi.Items.Add(li);
        }
    }
    public void Bind_Page_Info()// 根据会员ID 获取会员信息
    {
        vw_Member model = DALU.Member_vw_Select_Id(upid);
        if (model != null)
        {

            Hi_MemberId.Value = model.i_Id.ToString();
            RadioButtonList2.SelectedValue = model.i_IsSend.ToString();
            RadioButtonList20.SelectedValue = model.i_UserTypeId.ToString();
            UserName = model.nvc_Name;
            Ltl_VipNumber.Text = model.nvc_UserNum;
            Ltl_VipLoginName.Text = model.nvc_Name;
            //Txt_VipLoginPwd.Value = model.nvc_PassWord;
            Ltl_VipRegisterTime.Text = model.dt_AddTime.ToString();
            Txt_VipKeHuName.Value = model.nvc_RealName;
            Txt_VipKeHuEngLishName.Value = model.nvc_EnglishName;
            Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();
            Txt_VipZipCode.Value = model.nvc_ZipCode;
            Txt_VipCompanyHomePage.Value = model.nvc_CompanyHomePage;
            Txt_VipLinkManName.Value = model.nvc_LinkName;
            Txt_VipLinkManMobilePhone.Value = model.nvc_MobilePhone;
            Txt_VipLinkManPhone.Value = model.nvc_TelPhone;
            Txt_VipLinkManFax.Value = model.nvc_LinkManFax;
            Txt_VipLinkManEmail.Value = model.nvc_Email;
            Txt_VipLinkManQQ.Value = model.nvc_LinkManQQ;
            Txt_VipLinkManSKYPE.Value = model.nvc_LinkManSKYPE;
            Txt_VipLinkManMSN.Value = model.nvc_LinkManMSN;
            Txt_VipYuFuKuan.Value = model.dm_YuFuKuan.ToString();
            Txt_VipYuE.Value = model.dm_YuE.ToString();
            Txt_VipQianFei.Value = model.dm_QianFei.ToString();
            Txt_Address.Value = model.nvc_Address;
            Ltl_BiZhong.Text = DALN.Nationality_Select_Id(model.i_GuoJiId).nvc_JFBizhong;
            text_BYEmail.Value = model.nt_BYEmail;
            if (model.nvc_Power != null && model.nvc_Power != "")
            {
                Cb_VipPower1.Checked = model.nvc_Power.Split(',')[0] == "1" ? true : false;
                Cb_VipPower2.Checked = model.nvc_Power.Split(',')[1] == "1" ? true : false;
                Cb_VipPower3.Checked = model.nvc_Power.Split(',')[2] == "1" ? true : false;
                Cb_VipPower4.Checked = model.nvc_Power.Split(',')[3] == "1" ? true : false;
            }
            Txt_VipPowerDaZhe.Text = model.i_PowerDaZhe.ToString();
            //Txt_VipPowerJiFen.Text = model.i_PowerJiFen.ToString();
            Text_VipBeiZhu.Value = model.nt_BeiZhu;
            //if (model.i_ProvinceId != 0 && model.i_CityId != 0 && model.i_AreaId != 0)
            //{
            //    try
            //    {
            //        DALN.Provice_Bind_DDL_NId(DropDownList2, Drp_GuoJi.SelectedValue);
            //        t_Province sheng = DALB.Province_Select_Id(model.i_ProvinceId);
            //        if (sheng != null)
            //        {

            //            DropDownList2.SelectedValue = sheng.i_ID.ToString();
            //            DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
            //            t_City shi = DALB.City_Select_Id(model.i_CityId);
            //            if (shi != null)
            //            {
            //                DropDownList3.SelectedValue = shi.i_ID.ToString();
            //                DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
            //                t_Area qu = DALB.Area_Select_Id(model.i_AreaId);
            //                if (qu != null)
            //                {
            //                    DropDownList4.SelectedValue = qu.i_ID.ToString();
            //                }
            //            }
            //        }
            //    }
            //    catch { }
            //}
            DDL_Grade.SelectedValue = model.i_Grade.ToString();
            RadioButtonList1.SelectedValue = model.i_Sex.ToString();
            cb_ReceiveEmail.Checked = model.i_ReceiveEmail == 1 ? true : false;
            //text_Age.Value = model.nvc_Age;


            //地址
            repitem.DataSource = DALORA.ReceiveAddress_Select_MemberId(upid);
            repitem.DataBind();
            //订单
            //this.repOrder.DataSource = DALO.IntegralOrder_Select_MemberId(upid);
            //this.repOrder.DataBind();
            // 积分
            if (model.i_IntegralMobileId != 0)
            {
                V0.Enabled = false;
                V1.Enabled = false;
                V3.Enabled = false;
                Txt_VipIntegralMobile.ReadOnly = true;
                t_IntegralMobile Imobile = DALIM.IntegralMobile_SelectById(model.i_IntegralMobileId);
                Txt_VipIntegralMobile.Text = Imobile.nvc_Mobile;
                Txt_VipPowerJiFen.Text = Imobile.i_Integral.ToString();
                Rpt_IntegralNote.DataSource = DALUIN.vwIntegralNote_Select_MobileId(model.i_IntegralMobileId);
                Rpt_IntegralNote.DataBind();
            }
            else
            {
                Txt_VipPowerJiFen.Text = "0";
            }
            ////评价
            int ccount = 0;
            //dal_Comment DALC = new dal_Comment();
            //Repeater1.DataSource = DALC.Comment_SelectPage_MemberId(1, 100000000, upid, ref ccount);
            //Repeater1.DataBind();
            //咨询
            // Repeater2.DataSource = DALA.Advisory_SelectPage_MemberId(1, 100000000, upid, ref ccount);
            //Repeater2.DataBind();
            ////收藏
            //dal_Collection DALCL = new dal_Collection();
            //Rpt_Collection.DataSource = DALCL.Collection_Select_MemberId(1, 100000000, upid, ref ccount);
            //Rpt_Collection.DataBind();
            //优惠券
            dal_Coupon DALCP = new dal_Coupon();
            Repeater3.DataSource = DALCP.Coupon_Select_Page_MemberId(1, 100000000, upid, 0, ref ccount);
            Repeater3.DataBind();
        }
    }
    protected void btUpDate_Click(object sender, EventArgs e)// 修改会员
    {
        t_Member model = DALU.Member_Select_Id(upid);
        if (model != null)
        {
            model.nvc_UserNum = Ltl_VipNumber.Text;
            model.i_IsSend = RadioButtonList2.SelectedValue.GetInt();
            model.i_UserTypeId= RadioButtonList20.SelectedValue.GetInt();
            model.nvc_RealName = Txt_VipKeHuName.Value;
            model.nvc_EnglishName = Txt_VipKeHuEngLishName.Value;
            model.i_GuoJiId = Convert.ToInt32(Drp_GuoJi.SelectedValue);
            model.nvc_ZipCode = Txt_VipZipCode.Value;
            model.nvc_CompanyHomePage = Txt_VipCompanyHomePage.Value;
            model.nvc_LinkName = Txt_VipLinkManName.Value;
            model.nvc_MobilePhone = Txt_VipLinkManMobilePhone.Value;
            model.nvc_TelPhone = Txt_VipLinkManPhone.Value;
            model.nvc_LinkManFax = Txt_VipLinkManFax.Value;
            model.nvc_Email = Txt_VipLinkManEmail.Value;
            model.nvc_LinkManQQ = Txt_VipLinkManQQ.Value;
            model.nvc_LinkManSKYPE = Txt_VipLinkManSKYPE.Value;
            model.nvc_LinkManMSN = Txt_VipLinkManMSN.Value;
            model.dm_YuFuKuan = Convert.ToDecimal(Txt_VipYuFuKuan.Value);
            model.dm_YuE = Convert.ToDecimal(Txt_VipYuE.Value);
            model.dm_QianFei = Convert.ToDecimal(Txt_VipQianFei.Value);
            model.nvc_Address = Txt_Address.Value;
            model.nt_BYEmail = text_BYEmail.Value;
            //if (DropDownList2.SelectedValue != "0" && DropDownList3.SelectedValue != "0" && DropDownList4.SelectedValue != "0")
            //{
            //    model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);//添加省//Request.Form["province"];
            //    model.i_CityId = int.Parse(DropDownList3.SelectedValue);//添加市//Request.Form["city"];
            //    model.i_AreaId = int.Parse(DropDownList4.SelectedValue);//添加县// Request.Form["area"];
            //}
            model.i_Grade = Convert.ToInt32(DDL_Grade.SelectedValue);
            model.i_Sex = Convert.ToInt32(RadioButtonList1.SelectedValue);
            model.i_ReceiveEmail = cb_ReceiveEmail.Checked ? 1 : 0;
            model.nvc_Age = "0";
            string vip_power = "";
            #region
            if (Cb_VipPower1.Checked)
            {
                vip_power += "1,";
            }
            else
            {
                vip_power += "0,";
            }
            if (Cb_VipPower2.Checked)
            {
                vip_power += "1,";
            }
            else
            {
                vip_power += "0,";
            }
            if (Cb_VipPower3.Checked)
            {
                vip_power += "1,";
            }
            else
            {
                vip_power += "0,";
            }
            if (Cb_VipPower4.Checked)
            {
                vip_power += "1";
            }
            else
            {
                vip_power += "0";
            }
            #endregion
            model.nvc_Power = vip_power;
            model.i_PowerDaZhe = Convert.ToInt32(Txt_VipPowerDaZhe.Text);
            //model.i_PowerJiFen= Convert.ToInt32(Txt_VipPowerJiFen.Text);
            model.nt_BeiZhu = Text_VipBeiZhu.Value;
            if (Txt_VipLoginPwd.Value != "")
            {
                string Pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(Txt_VipLoginPwd.Value, "MD5");
                model.nvc_PassWord = Pwd;
            }
        }
        if (DALU.Member_Update(model) == 1)
        {
            Manager.AddLog(0, "会员管理", "修改了会员[ <font color=\"red\">" + model.nvc_Name + "</font> ]的资料");//修改会员日志
            string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_User.aspx?" + returnurl, System.Text.Encoding.UTF8);
            Response.Redirect("shop_manageok.aspx?hrefname=会员&hreftype=2&href1=Shop_A_User.aspx&href2=" + twourl);
        }
    }
    protected void repOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    Repeater rep = e.Item.FindControl("repProduct") as Repeater;
        //    HiddenField cbid = (HiddenField)e.Item.FindControl("Hi_OrderId");
        //    int orderID = Convert.ToInt32(cbid.Value);
        //    rep.DataSource = DALOD.OrderDetails_vw_Select_OrderId(orderID);
        //    rep.DataBind();
        //}
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //try
        //{
        //    TextBox TB_Replay = (TextBox)e.Item.FindControl("TB_Replay");
        //    int Id = int.Parse(e.CommandArgument.ToString());
        //    t_Advisory model = DALA.Advisory_Select_Id(Id);
        //    if (model != null)
        //    {
        //        model.nvc_ReplayContent = TB_Replay.Text;
        //        model.i_ManagerId = int.Parse(Request.Cookies["zscqmanage"]["userid"].ToString());
        //        if (DALA.Advisory_Update(model) == 1)
        //        {
        //            Manager.AddLog(0, "商品管理", "回复咨询");
        //            Response.Redirect(Request.Url.ToString());
        //        }
        //    }
        //}
        //catch { }
    }
    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //public string Set_Address(object sheng, object shi, object qu)
    //{
    //    try
    //    {
    //        return DALB.Set_AddressName_PId_CId_AId(Convert.ToInt32(sheng), Convert.ToInt32(shi), Convert.ToInt32(qu));
    //    }
    //    catch { }
    //    return "";
    //}
    //public string ConvertStatus(object obj)
    //{
    //   // return DALO.Set_OrderState(obj);
    //}
    //public string ConvertPayStyle(object obj)
    //{
    //    //return new dal_PayWay().Set_银行名称(obj);
    //}
    //protected void Drp_GuoJi_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(DropDownList2, Drp_GuoJi.SelectedValue);
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    protected void btn_Integral_Click(object sender, EventArgs e)
    {

        try
        {
            t_Member member = DALU.Member_Select_Id(upid);
            t_IntegralMobile model = null;
            if (member.i_IntegralMobileId == 0)
            {
                model = DALIM.IntegralMobile_SelectByMobile(Txt_VipIntegralMobile.Text.Trim());
                if (model != null)
                {
                    if (model.i_zluid != 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mag", "<script>alert('已有专利用户使用该手机号！');</script>", false); return;
                    }
                    else
                    {
                        model.i_zluid = upid;
                        DALIM.IntegralMobile_Updata(model);
                        member.i_IntegralMobileId = model.i_Id;
                        DALU.Member_Update(member);
                        Manager.AddLog(0, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                    }
                }
                else
                {
                    model = new t_IntegralMobile();
                    model.i_zluid = upid;
                    model.nvc_Mobile = Txt_VipIntegralMobile.Text;
                    model.nvc_Password = Txt_VipIntegralPasssWord.Text.Md5Encrypt();
                    DALIM.IntegralMobile_Add(model);
                    member.i_IntegralMobileId = model.i_Id;
                    DALU.Member_Update(member);
                    Manager.AddLog(0, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                }
            }
            else
            {
                model = DALIM.IntegralMobile_SelectById(member.i_IntegralMobileId);
                if (!string.IsNullOrWhiteSpace(Txt_VipIntegralPasssWord.Text))
                {
                    model.nvc_Password = Txt_VipIntegralPasssWord.Text.Md5Encrypt();
                }
            }
            int JifenAdd = 0;
            if (!string.IsNullOrWhiteSpace(Txt_VipAddJiFen.Text))
            {
                JifenAdd = Convert.ToInt32(Txt_VipAddJiFen.Text);
            }
            if (JifenAdd != 0)
            {
                BLLUIN.UserIntegralNote_Add(upid, "系统赠送", JifenAdd, 0, 1);
                Manager.AddLog(0, "积分管理", "修改了[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]的积分");//修改会员日志
                ScriptManager.RegisterStartupScript(this.UpdatePanel3, this.UpdatePanel2.GetType(), "msg", "<script>alert('修改成功');window.location='" + Request.Url.ToString() + "'</script>", false);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel3, this.UpdatePanel2.GetType(), "msg", "<script>alert('修改失败');</script>", false);
        }
    }
    public string Get_GuoJiaName(object gid)
    {
        string s = "";
        try
        {
            s = DALN.Nationality_Select_Id(Convert.ToInt32(gid)).nvc_Name;
        }
        catch { }
        return s;
    }
}
