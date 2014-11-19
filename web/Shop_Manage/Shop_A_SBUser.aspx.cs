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
public partial class Shop_Manage_Shop_A_SBUser : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(10, 0);
    public bool pageupdate = Manager.GetManagerQX(10, 1);

    dal_Address DALB = new dal_Address();
    dal_Member DALU = new dal_Member();
    dal_IntegralProduct DALP = new dal_IntegralProduct();
    dal_IntegralOrder DALO = new dal_IntegralOrder();
    dal_ReceiveAddress DALORA = new dal_ReceiveAddress();
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Nationality DALN = new dal_Nationality();
    bll_Member BLLM = new bll_Member();
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
        if (!IsPostBack)
        {

            Bind_Drp_PGuoJiaType();
            //Drp_GuoJi_SelectedIndexChanged(null, null);
        }
    }
    protected void btUpDate_Click(object sender, EventArgs e)// 添加会员
    {

        t_Member model = new t_Member();
        model.i_UserTypeId = int.Parse(hi_usertype.Value);
        model.i_MemberType = 2;
        model.nvc_Name = Txt_UserAccount.Value;
        model.nvc_PassWord = Txt_UserPassword.Value.Md5Encrypt();
        model.dt_AddTime = DateTime.Now;
        model.nvc_UserNum = DALU.SetMemberNumber(2, int.Parse(hi_usertype.Value), int.Parse(Drp_GuoJi.SelectedValue));
        model.nvc_RealName = c_Name.Value;
        model.nvc_EnglishName = c_NameEn.Value;
        model.i_GuoJiId = Convert.ToInt32(Drp_GuoJi.SelectedValue);
        model.nvc_ZipCode = c_youbian.Value;
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

        model.nvc_RealName = c_Name.Value;
        model.nvc_EnglishName = c_NameEn.Value;
        model.i_GuoJiId = int.Parse(Drp_GuoJi.SelectedValue);
        //model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);//添加省
        //model.i_CityId = int.Parse(DropDownList3.SelectedValue);//添加市
        //model.i_AreaId = int.Parse(DropDownList4.SelectedValue);//添加县
        model.nvc_Address = text_Address.Value;
        model.nvc_EnAddress = c_addressEn.Value;
        model.nvc_ZipCode = c_youbian.Value;
        model.nvc_MobilePhone = c_phone.Value;
        model.nvc_TelPhone = text_Call.Value;
        model.nvc_Email = text_Email.Value;
        model.nvc_FaxNumber = text_chuanzhen.Value;
        model.nvc_LinkManQQ = text_QQ.Value;
        model.nvc_LinkManMSN = text_msn.Value;
        model.nt_BeiZhu = Text_VipBeiZhu.Value;
        model.nt_BYEmail = text_BYEmail.Value;
        model.nvc_Power = "1,1,1,1";
        int returnId = 0;
        string returnName = "";
        int ret = BLLM.Member_Add(model, ref returnId, ref returnName);
        switch (ret)
        {
            case 1:
                Manager.AddLog(0, "会员管理", "添加了会员[ <font color=\"red\">" + model.nvc_Name + "</font> ]");//修改会员日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_User.aspx?type=2", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=会员&hreftype=2&href1=Shop_A_User.aspx&href2=" + twourl);
                break;
            case 2:
                div_a.InnerHtml = "<script>alert('用户名已存在');</script>";
                break;
            //case 3:
            //    div_a.InnerHtml = "<script>alert('Email已经被注册');</script>";
                break;
            //case 4:
                //div_a.InnerHtml = "<script>alert('手机号已存在');</script>";
                //break;
            case 5:
                div_a.InnerHtml = "<script>alert('用户编号已存在');</script>";
                break;
            default:
                div_a.InnerHtml = "<script>alert('系统繁忙，请稍后...');</script>";
                break;
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
    public string Set_Address(object sheng, object shi, object qu)
    {
        try
        {
            return DALB.Set_AddressName_PId_CId_AId(Convert.ToInt32(sheng), Convert.ToInt32(shi), Convert.ToInt32(qu));
        }
        catch { }
        return "";
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
    //protected void Drp_GuoJi_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(DropDownList2, Drp_GuoJi.SelectedValue);
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
}
