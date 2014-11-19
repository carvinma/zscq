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
public partial class Shop_Manage_Shop_A_User : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(10, 0);
    public bool pageupdate = Manager.GetManagerQX(10, 1);

    dal_Address DALA = new dal_Address();
    dal_IntegralProduct DALP = new dal_IntegralProduct();
    dal_IntegralOrder DALO = new dal_IntegralOrder();
    dal_ReceiveAddress DALORA = new dal_ReceiveAddress();
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Nationality DALN = new dal_Nationality();
    bll_Member BLLM = new bll_Member();
    dal_Member DALM = new dal_Member();
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_DDL_Grade();
            Bind_Drp_PGuoJiaType();
            //Drp_GuoJi_SelectedIndexChanged(null, null);
        }
    }
    public void Bind_DDL_Grade()
    {
        dal_UserGrade DALG = new dal_UserGrade();
        DDL_Grade.DataSource = DALG.UserGrade_Select_All();
        DDL_Grade.DataTextField = "nvc_Name";
        DDL_Grade.DataValueField = "i_Id";
        DDL_Grade.DataBind();
        DDL_Grade.SelectedValue = "1";
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
    protected void btUpDate_Click(object sender, EventArgs e)// 添加会员
    {
        try
        {
            t_Member model = new t_Member();
            model.i_UserTypeId = int.Parse(Request["usertype"]);
            model.i_MemberType = 1;
            model.nvc_Name = Txt_UserAccount.Value;
            model.nvc_PassWord = Txt_UserPassword.Value.Md5Encrypt();
            model.dt_AddTime = DateTime.Now;
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
            model.nvc_Address = Txt_Address.Value;
            if (rd_type1.Checked)
            {
                model.i_UserTypeId = 1;
            }
            if (rd_type2.Checked)
            {
                model.i_UserTypeId = 2;
            }
            if (rd_type3.Checked)
            {
                model.i_UserTypeId = 3;
            }
            model.nvc_UserNum = DALM.SetMemberNumber(1, Convert.ToInt32(model.i_UserTypeId), Convert.ToInt32(model.i_GuoJiId));

            //if (DropDownList2.SelectedValue != "0" && DropDownList3.SelectedValue != "0" && DropDownList4.SelectedValue != "0")
            //{
            //    model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);//添加省//Request.Form["province"];
            //    model.i_CityId = int.Parse(DropDownList3.SelectedValue);//添加市//Request.Form["city"];
            //    model.i_AreaId = int.Parse(DropDownList4.SelectedValue);//添加县// Request.Form["area"];
            //}
            model.i_Grade = Convert.ToInt32(DDL_Grade.SelectedValue);
            model.i_Sex = Convert.ToInt32(RadioButtonList1.SelectedValue);
            model.i_ReceiveEmail = cb_ReceiveEmail.Checked ? 1 : 0;
            model.nt_BeiZhu = Text_VipBeiZhu.Value;
            model.nt_BYEmail = text_BYEmail.Value;
            model.nvc_Power = "1,1,1,1";
            int returnId = 0;
            string returnName = "";
            int ret = BLLM.Member_Add(model, ref returnId, ref returnName);
            if (ret == 1)
            {
                Manager.AddLog(0, "会员管理", "添加了会员[ <font color=\"red\">" + model.nvc_Name + "</font> ]");//修改会员日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_User.aspx?type=1", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=会员&hreftype=2&href1=Shop_A_User.aspx&href2=" + twourl);
            }
        }
        catch
        {
            div_a.InnerHtml = "<script>alert('添加失败');</script>";
        }
    }
    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALA.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALA.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    public string Set_Address(object sheng, object shi, object qu)
    {
        try
        {
            return DALA.Set_AddressName_PId_CId_AId(Convert.ToInt32(sheng), Convert.ToInt32(shi), Convert.ToInt32(qu));
        }
        catch { }
        return "";
    }
    //protected void Drp_GuoJi_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(DropDownList2, Drp_GuoJi.SelectedValue);
    //    DALA.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
}
