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
    dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
    dal_Nationality DALN = new dal_Nationality();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    dal_Member DALU = new dal_Member();
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_IntegralOrderDetails DALIOD = new dal_IntegralOrderDetails();
    public string UserName = string.Empty;//用户名
    int upid = 0;
    public string returnurl = "", Integral = "";
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
            hi_id.Value = upid.ToString();
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    public string getorder(object o)
    {
        string order = o.ToString();
        switch (order)
        {
            case "1":
                order = "nvc_OrderNumber";
                break;
            case "2":
                order = "i_SumIntegral";
                break;
            case "3":
                order = "i_State";
                break;
            case "4":
                order = "dt_AddTime";
                break;
            default:
                order = "i_Id";
                break;
        }
        return order;
    }
    public string getstate(object state)
    {
        return DALIO.Set_IntegralOrderState_Show(state);
    }
    public string getorderpname(object oid)
    {
        var iquery = DALIOD.IntegralOrderDetails_vw_Select_OrderId(Convert.ToInt32(oid));
        string rel = "";
        int number = 1;
        foreach (var v in iquery)
        {
            rel += number + "." + v.nvc_ProductName + "<br/>";
            number++;
        }
        rel += "|";
        return rel.Replace("<br/>|", "").TrimEnd('|');
    }
    public void Bind_Page_Info()// 根据会员ID 获取会员信息
    {
        t_IntegralMobile model = DALIM.IntegralMobile_SelectById(upid);
        if (model != null)
        {
            UserName = model.nvc_Mobile;
            Integral = model.i_Integral.ToString();
            // 积分 
            Rpt_IntegralNote.DataSource = DALUIN.vwIntegralNote_Select_MobileId(upid);
            Rpt_IntegralNote.DataBind();

            repitem.DataSource = DALIO.IntegralOrder_vw_ByMobileID(upid);
            repitem.DataBind();
        }
    }
    protected void btn_Integral_Click(object sender, EventArgs e)
    {
        var model = DALIM.IntegralMobile_SelectById(upid);
        model.nvc_Password = Txt_VipIntegralPasssWord.Text.Md5Encrypt();
        DALIM.IntegralMobile_Updata(model);
        Manager.AddLog(0, "积分手机管理", "修改积分手机密码[ <font color=\"red\">" + model.nvc_Mobile + "</font> ]");//修改会员日志
        ScriptManager.RegisterStartupScript(this.UpdatePanel3, this.UpdatePanel2.GetType(), "msg", "<script>alert('修改成功');window.location='" + Request.Url.ToString() + "'</script>", false);
    }
}