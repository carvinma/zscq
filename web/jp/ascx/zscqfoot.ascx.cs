using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using zscq.Model;
using zscq.DAL;
public partial class ascx_zscqfoot : System.Web.UI.UserControl
{
    dal_SinglePage DALSP = new dal_SinglePage();
    dal_Member DALM = new dal_Member();
    public string contents1, contents2, contents3, contents4 = "";
    public string email = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        t_SinglePage model = DALSP.SinglePage_Select_Key("tiaokuan", "jp");
        contents1 = model.nt_Value;
        model = DALSP.SinglePage_Select_Key("yinsi", "jp");
        contents2 = model.nt_Value;
        model = DALSP.SinglePage_Select_Key("bottom", "jp");
        contents3 = model.nt_Value;
        model = DALSP.SinglePage_Select_Key("ndap", "jp");
        contents4 = model.nt_Value;
        Bind_Email();
    }
    /// <summary>
    /// 给在线咨询中的email框赋值
    /// </summary>
    void Bind_Email()
    {
        int uid = 0;
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != "")
        {
            uid = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
        }
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            uid = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);
        }
        t_Member tm = DALM.Member_Select_Id(uid);
        if (tm != null)
        {
            email = tm.nvc_Email;
        }
    }
}