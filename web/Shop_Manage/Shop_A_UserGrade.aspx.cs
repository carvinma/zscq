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
using zscq.Model;
using zscq.DAL;
using zscq.BLL;

public partial class Shop_Manage_Shop_A_UserGrade : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(40, 0);
    public bool pageadd = Manager.GetManagerQX(40, 1);
    public bool pageupdate = Manager.GetManagerQX(40, 2);
    dal_UserGrade DALG = new dal_UserGrade();

    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!pageview)
        {
            Response.Write("无权限访问");
            Response.End();
        }
        if (!IsPostBack)
        {
            Bind_UserGrade();
        }
    }
    public void Bind_UserGrade()
    {
        if (Request.QueryString["Gid"] != null && Request.QueryString["Gid"] != "")
        {
            t_MemberGrade UG = DALG.UserGrade_Select_Id(int.Parse(Request.QueryString["Gid"].ToString()));
            if (UG != null)
            {
                text_Name.Value = UG.nvc_Name;
                text_Name_EN.Value = UG.nvc_Name_en;
                text_Name_KR.Value = UG.nvc_Name_kr;
                text_Name_JP.Value = UG.nvc_Name_jp;
                text_ZK.Value = UG.i_Discount.ToString();
                text_zhuanli.Value = UG.i_ZhuanliNum.ToString();
                text_shangbiao.Value = UG.i_ShangbiaoNum.ToString();
                HiLogo.Value = UG.nvc_Logo;
                text_QD.Value = UG.i_QDNumber.ToString();
                HiId.Value = UG.i_id.ToString();
                text_grade.Value = UG.i_Grade.ToString();
                if (UG.i_id == 1)
                {
                    text_grade.Disabled = true;
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        t_MemberGrade model = new t_MemberGrade();
        if (HiId.Value != "0")
        {
            model = DALG.UserGrade_Select_Id(Convert.ToInt32(HiId.Value));
        }
        model.nvc_Name = text_Name.Value;
        model.nvc_Name_en = text_Name_EN.Value;
        model.nvc_Name_kr = text_Name_KR.Value;
        model.nvc_Name_jp = text_Name_JP.Value;

        try
        {
            model.i_Discount = int.Parse(text_ZK.Value);
        }
        catch { }


        try
        {
            model.i_ZhuanliNum = int.Parse(text_zhuanli.Value);
        }
        catch { }

        try
        {
            model.i_ShangbiaoNum = int.Parse(text_shangbiao.Value);
        }
        catch { }

        try
        {
            model.i_QDNumber = int.Parse(text_QD.Value);
        }
        catch { }
        try
        {
            model.i_Grade = int.Parse(text_grade.Value);
        }
        catch { }


        string filePath = FilesUpLoad.uploading(this.FileUpload1, "../pic_Grade/");
        if (FileUpload1.HasFile)
        {
            model.nvc_Logo = "pic_Grade/" + filePath;
        }
        else
        {
            model.nvc_Logo = HiLogo.Value;
        }
        if (HiId.Value == "0")
        {
            int ret = DALG.UserGrade_Add(model);
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
                return;
            }
            else
            {
                Manager.AddLog(0, "会员管理", "添加了会员等级[ <font color=\"red\">" + text_Name.Value + "</font> ]");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_UserGrade.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=会员等级&hreftype=1&href1=Shop_A_UserGrade.aspx&href2=" + twourl);
            }
        }
        else
        {
            model.i_id = int.Parse(HiId.Value);
            int ret = DALG.UserGrade_Update(model);
            if (ret == 0)
            {
                div_a.InnerHtml = "<script>alert('对不起,发生意外!')</script>";
                return;
            }
            else
            {
                Manager.AddLog(0, "会员管理", "修改了会员等级[ <font color=\"red\">" + text_Name.Value + "</font> ]的信息");
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_UserGrade.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=会员等级&hreftype=2&href1=Shop_A_UserGrade.aspx&href2=" + twourl);
            }
        }
    }
}
