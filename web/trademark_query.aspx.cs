using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
public partial class trademark_query : System.Web.UI.Page
{
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    public int MemberId = 0,userType=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            MemberId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
              t_Member mm = DALM.Member_Select_Id(MemberId);
              if (mm != null)
              {
                  if (mm.i_UserTypeId == 3)
                  {
                      userType = 3;
                  }
              }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        //Bind_Drp_PGuoJiaType();
    }
    protected void bt_kuaijiansuo_Click(object sender, EventArgs e)
    {
        string sbnum = sb_num.Value;
        string sbtype = sb_type.Value;
        string sbregname = Sb_regName.Value;
        string data = "";
        if (sbnum != "")
        {
            data += "sb_num=" + sbnum + "&";
        }
        if (sbtype != "")
        {
            data += "sb_type=" + sbtype + "&";
        }
        if (sbregname != "")
        {
            data += "sb_regname=" + sbregname + "&";
        }
        Response.Redirect("user_sblb.aspx?" + data);
    }
    protected void bt_jiansuoAll_Click(object sender, EventArgs e)
    {
        string sbnum = Sb_Num1.Value;
        string sbtype = Sb_Type1.Value;
        string sbregname = Sb_regName1.Value;
        //string guoji = Drp_GuoJi.SelectedValue;
        string shenqintime = hot_pass_date.Value;
        string isjiaofei = ddl_jiaofei.SelectedValue;
        string stime = ddl_day.SelectedItem.ToString();
        string anjuanhao = t_anjuanhao.Value;
        string caddress = txt_address.Value;
        string linkman = txt_linkman.Value;
        string Ctel = txt_phone.Value;
        string data = "";
        if (sbnum != "")
        {
            data += "sb_num=" + sbnum + "&";
        }
        if (sbtype != "")
        {
            data += "sb_type=" + sbtype + "&";
        }
        if (sbregname != "")
        {
            data += "sb_regname=" + sbregname + "&";
        }
        //if (guoji != "0")
        //{
        //    data += "sb_regguoji=" + guoji + "&";
        //}
        if (shenqintime != "")
        {
            data += "sb_passtime=" + shenqintime + "&";
        }
        if (isjiaofei != "-1")
        {
            data += "isjiaofei=" + isjiaofei + "&";
        }
        if (stime != "0")
        {
            if (ddl_day.SelectedValue == "chao")
            {
                data += "stime=chao_6&";
            }
            else
            {
                data += "stime=" + stime + "_" + ddl_day.SelectedValue + "&";
            }
        }
        if (anjuanhao != "")
        {
            data += "c_anjuanhao=" + anjuanhao + "&";
        }
        if (linkman != "")
        {
            data += "c_uname=" + linkman + "&";
        }
        if (caddress != "")
        {
            data += "c_address=" + caddress + "&";
        }
        if (Ctel != "")
        {
            data += "c_tel=" + Ctel + "&";
        }
        Response.Redirect("user_sblb.aspx?" + data);
    }
    //void Bind_Drp_PGuoJiaType()// 绑定国籍
    //{
    //    Drp_GuoJi.Items.Clear();
    //    ListItem item = new ListItem("请选择", "0");
    //    Drp_GuoJi.Items.Add(item);
    //    var iquery = DALN.Nationality_SelectAll();
    //    foreach (var q in iquery)
    //    {
    //        ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
    //        Drp_GuoJi.Items.Add(li);
    //    }
    //}

}