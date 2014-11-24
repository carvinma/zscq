using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.IO;
public partial class appUserInfoDetail : System.Web.UI.Page
{
 
    dal_Member DALM = new dal_Member();
    public t_Apply model = new t_Apply();
    private int uid = 0;
    dal_Apply apply = new dal_Apply();
    dal_Address address = new dal_Address();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            uid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            t_Member model = DALM.Member_Select_Id(uid);
            if (model == null)
            {
                Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        div_a.InnerHtml = "";
        if (!IsPostBack)
            Bind_Page_Type();

    }
    public void Bind_Page_Type()// 绑定页面信息
    {

        if (Request.QueryString["u_a_id"] != null && Request.QueryString["u_a_id"].ToString() != "")
        {
            int applyId = int.Parse(Request.QueryString["u_a_id"].ToString());
            Bind_Page_Info(applyId);
        }

    }
    private void Bind_Page_Info(int applyId)// 绑定商标详细数据
    {
        if (uid > 0)
        {
            model = apply.Apply_Select_Id(applyId);
            if (model.provinceID > 0 && model.cityID > 0 && model.areaID > 0)
            {
                string allAddress= address.Set_AddressName_PId_CId_AId(model.provinceID.Value, model.cityID.Value, model.areaID.Value);
                model.Address =allAddress.Replace(" ","")+ model.Address;
            }
            if (!string.IsNullOrEmpty(model.MainQualificationPath))
                model.MainQualificationPath = "<a href='" + model.MainQualificationPath + "' title='点击查看' target='_blank'>主体资格证书已上传</a>";
            else
                model.MainQualificationPath = "未上传";
            if (!string.IsNullOrEmpty(model.CardNoPath))
                model.CardNoPath = "<a href='" + model.CardNoPath + "' title='点击查看' target='_blank'>身份证证件已上传</a>";
            else
                model.CardNoPath = "未上传";
        }

    }

}