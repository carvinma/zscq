using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
public partial class ChoiceCommon : System.Web.UI.Page
{
    //dal_Member DALM = new dal_Member();
  //  public bool booldaoru = false, booldaochu = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            int uid =int.Parse( Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            //t_Member model = DALM.Member_Select_Id(uid);
            //if (model != null)
            //{
            //    if (model.nvc_Power != null && model.nvc_Power != "")
            //    {
            //        booldaoru = model.nvc_Power.Split(',')[0] == "1" ? true : false;//导入
            //        booldaochu = model.nvc_Power.Split(',')[1] == "1" ? true : false;//导出   
            //    }
            //}
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
    }
}

