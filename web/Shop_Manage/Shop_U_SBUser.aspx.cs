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
public partial class Shop_Manage_Shop_U_SBUser : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(20, 0);
    public bool pageupdate = Manager.GetManagerQX(20, 2);
    DataMemberDataContext dmdc = new DataMemberDataContext();
    dal_Address DALB = new dal_Address();
    dal_Member DALU = new dal_Member();
    dal_IntegralProduct DALP = new dal_IntegralProduct();
    dal_IntegralOrder DALO = new dal_IntegralOrder();
    dal_ReceiveAddress DALORA = new dal_ReceiveAddress();
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Nationality DALN = new dal_Nationality();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    public string UserName = string.Empty, zhutiwenjian="";//用户名
    int upid = 0;
    public string returnurl = "", VipLoginName = "", VipNumber = "";
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
            Hi_MemberId.Value = upid.ToString();
            t_Member t = DALU.Member_Select_Id(upid);
            if (t != null)
            {
                if (t.i_MemberType == 1)
                {
                    Response.Redirect("Shop_U_User.aspx?id=" + t.i_Id.ToString() + "&type=1");
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
            //DALB.Provice_Bind_DDL(DropDownList2);
            //Drp_GuoJi_SelectedIndexChanged(null, null);
            Bind_Page_Info();
        }
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
        t_Member model = DALU.Member_Select_Id(upid);
        if (model != null)
        {
            VipLoginName = model.nvc_Name;
            VipNumber = model.nvc_UserNum;
            Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();
            t_Nationality na = DALN.Nationality_Select_Id(model.i_GuoJiId);
            if (na != null)
            {
                T_bizhong.Text = na.nvc_Currency;
                if (na.nvc_Name == "中国")
                {
                    hi_guoji.Value = "1";
                }
            }
            hi_usertype.Value = model.i_UserTypeId.ToString();
            RadioButtonList2.SelectedValue = model.i_IsSend.ToString();
            UserName = model.nvc_Name;
            c_Name.Value = model.nvc_RealName;
            c_NameEn.Value = model.nvc_EnglishName;

            Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();

            //Drp_GuoJi_SelectedIndexChanged(null, null);
            //DropDownList2.SelectedValue = model.i_ProvinceId.ToString();
            //DropDownList2_SelectedIndexChanged(null, null);
            //DropDownList3.SelectedValue = model.i_CityId.ToString();
            //DropDownList3_SelectedIndexChanged(null, null);
            //DropDownList4.SelectedValue = model.i_AreaId.ToString();

            Hi_prov.Value = model.i_ProvinceId.ToString();
            Hi_city.Value = model.i_CityId.ToString();
            Hi_country.Value = model.i_AreaId.ToString();
            text_Address.Value = model.nvc_Address;
            c_addressEn.Value = model.nvc_EnAddress;
            c_company.Value = model.nvc_Company;
            c_companyEn.Value = model.nvc_EnCompany;
            c_dailiName.Value = model.nvc_DaiLiName;

            c_Idcard.Value = model.nvc_IDCard;
            c_youxiao.Value = model.nvc_IDCard;

            c_youbian.Value = model.nvc_ZipCode;
            c_phone.Value = model.nvc_MobilePhone;
            text_Call.Value = model.nvc_TelPhone;
            text_Email.Value = model.nvc_Email;
            text_BYEmail.Value = model.nt_BYEmail;
            text_chuanzhen.Value = model.nvc_FaxNumber;
            text_QQ.Value = model.nvc_LinkManQQ;
            text_msn.Value = model.nvc_LinkManMSN;

            Txt_VipYuFuKuan.Value = model.dm_YuFuKuan.ToString();
            Txt_VipYuE.Value = model.dm_YuE.ToString();
            Txt_VipQianFei.Value = model.dm_QianFei.ToString();

            if (model.nvc_Power != null && model.nvc_Power != "")
            {
                Cb_VipPower1.Checked = model.nvc_Power.Split(',')[0] == "1" ? true : false;
                Cb_VipPower2.Checked = model.nvc_Power.Split(',')[1] == "1" ? true : false;
                Cb_VipPower3.Checked = model.nvc_Power.Split(',')[2] == "1" ? true : false;
                Cb_VipPower4.Checked = model.nvc_Power.Split(',')[3] == "1" ? true : false;
                Txt_VipPowerDaZhe.Text = model.i_PowerDaZhe.ToString();

            }
            cb_ReceiveEmail.Checked = model.i_ReceiveEmail == 1 ? true : false;
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
            if (model.nvc_ZhuTiFile != null)
            {
                zhutiwenjian = "<a href='../" + model.nvc_ZhuTiFile + "' target='_blank' title='点击查看'>已上传(点击可查看)</a>";
            }
            else
            {
                zhutiwenjian = "暂未上传";
            }
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
            //var result = from r in dmdc.t_Member where r.nvc_Email.Trim() == text_Email.Value && r.i_MemberType == 2 && r.i_Id != int.Parse(Hi_MemberId.Value) select r;
            //if (result.Count() > 0)
            //{
            //    div_a.InnerHtml = "<script>alert('邮箱已经被使用！');</script>";
            //    return;
            //}
            //var result2 = from r in dmdc.t_Member where r.nvc_MobilePhone.Trim() == c_phone.Value && r.i_Id != model.i_Id select r;
            //if (result2.Count() > 0)
            //{
            //    div_a.InnerHtml = "<script>alert('手机号已经被使用！');</script>";
            //    return;
            //}
            if (hi_guoji.Value == "1")
            {
                model.nvc_IDCard = c_Idcard.Value;
                model.i_RegTypeId = 1;
            }
            else
            {
                model.nvc_IDCard = c_youxiao.Value;
                model.i_RegTypeId = 2;
            }
            model.i_UserTypeId = int.Parse(hi_usertype.Value);
            model.nvc_RealName = c_Name.Value;
            model.nvc_EnglishName = c_NameEn.Value;
            model.i_GuoJiId = int.Parse(Drp_GuoJi.SelectedValue);
            //model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);//添加省
            //model.i_CityId = int.Parse(DropDownList3.SelectedValue);//添加市
            //model.i_AreaId = int.Parse(DropDownList4.SelectedValue);//添加县
            model.nvc_Address = text_Address.Value;
            model.nvc_EnAddress = c_addressEn.Value;
            model.nvc_Company = c_company.Value;
            model.nvc_EnCompany = c_companyEn.Value;
            model.nvc_DaiLiName = c_dailiName.Value;
            model.i_IsSend = RadioButtonList2.SelectedValue.GetInt();
            model.i_ReceiveEmail = cb_ReceiveEmail.Checked ? 1 : 0;

            model.nvc_ZipCode = c_youbian.Value;
            model.nvc_MobilePhone = c_phone.Value;
            model.nvc_TelPhone = text_Call.Value;
            model.nvc_Email = text_Email.Value;
            model.nt_BYEmail = text_BYEmail.Value;
            model.nvc_FaxNumber = text_chuanzhen.Value;
            model.nvc_LinkManQQ = text_QQ.Value;
            model.nvc_LinkManMSN = text_msn.Value;

            model.dm_YuFuKuan = Convert.ToDecimal(Txt_VipYuFuKuan.Value);
            model.dm_YuE = Convert.ToDecimal(Txt_VipYuE.Value);
            model.dm_QianFei = Convert.ToDecimal(Txt_VipQianFei.Value);

            //if (DropDownList2.SelectedValue != "0" && DropDownList3.SelectedValue != "0" && DropDownList4.SelectedValue != "0")
            //{
            //    model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);//添加省//Request.Form["province"];
            //    model.i_CityId = int.Parse(DropDownList3.SelectedValue);//添加市//Request.Form["city"];
            //    model.i_AreaId = int.Parse(DropDownList4.SelectedValue);//添加县// Request.Form["area"];
            //}

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
                vip_power += "1,";
            }
            else
            {
                vip_power += "0,";
            }
            //if (Cb_VipPower5.Checked)
            //{
            //    vip_power += "1,";
            //}
            //else
            //{
            //    vip_power += "0,";
            //}
            //if (Cb_VipPower6.Checked)
            //{
            //    vip_power += "1";
            //}
            //else
            //{
            //    vip_power += "0";
            //}
            #endregion
            model.nvc_Power = vip_power;
            model.nt_BeiZhu = Text_VipBeiZhu.Value;
            model.i_PowerDaZhe = Convert.ToInt32(Txt_VipPowerDaZhe.Text);
            if (Txt_UserPassword.Value != "")
            {
                Response.Write(Txt_UserPassword.Value.Trim() + "dd");
                model.nvc_PassWord = Txt_UserPassword.Value.Trim().Md5Encrypt();
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
                    if (model.i_sbuid != 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "mag", "<script>alert('已有商标用户使用该手机号！');</script>", false); return;
                    }
                    else
                    {
                        model.i_sbuid = upid;
                        DALIM.IntegralMobile_Updata(model);
                        member.i_IntegralMobileId = model.i_Id;
                        DALU.Member_Update(member);
                        Manager.AddLog(0, "积分手机管理", "添加了积分手机[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
                    }
                }
                else
                {
                    model = new t_IntegralMobile();
                    model.i_sbuid = upid;
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