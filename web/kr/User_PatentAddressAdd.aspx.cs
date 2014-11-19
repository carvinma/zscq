using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

public partial class User_PatentAddressAdd : System.Web.UI.Page
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Address DALA = new dal_Address();
    dal_Nationality DALN = new dal_Nationality();
    public string PageType = "주소추가";
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            Nationality_Bind_DDL(ddl_guojia); 
            Bind_Page_Member();
            if (Request.QueryString["PageType"] != null && Request.QueryString["PageType"] != "")
            {
                Bind_Update_Address();
            }
        }
    }
    void Nationality_Bind_DDL(DropDownList ddl)
    {
        ddl.Items.Clear();
        ListItem item = new ListItem("선택하세요", "0");
        ddl.Items.Add(item);
        var iquery = from p in dzdc.t_Nationality orderby p.i_Id ascending select p;
        foreach (var s in iquery)
        {
            ListItem item2 = new ListItem(s.nvc_HanName, s.i_Id.ToString());
            ddl.Items.Add(item2);
        }
    }
    public void Bind_Page_Member()//绑定ID和用户名
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString();
            t_Member m = DALM.Member_Select_Id(int.Parse(Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString()));
            if (m != null)
            {
                Hi_Mr.Value = m.i_DefaultAddress.ToString();
            }
        }
        else
        {
            Hi_MemberId.Value = "0";
        }
    }

    public void Bind_Update_Address()//绑定要修改的地址
    {
        if (Request.QueryString["PageType"].ToString() == "update")
        {
            Hi_AddressId.Value = Request.QueryString["uid"].ToString();
            t_ReceiveAddress model = DALRA.ReceiveAddress_Select_Id(int.Parse(Hi_AddressId.Value));
            if (model != null)
            {
                text_shouhuoren.Value = model.nvc_Consignee;
                text_shouhuodizhi.Value = model.nvc_StreetAddress;
                text_youzhengbianma.Value = model.nvc_ZipCode;
                text_shoujihaoma.Value = model.nvc_MobilePhone;
                text_gudingdianhua.Value = model.nvc_TelPhone;
                text_dianziyoujian.Value = model.nvc_Email;

                ddl_guojia.SelectedValue = Convert.ToString(model.i_Gid);
                //ddl_guojia_SelectedIndexChanged(null, null);
                //this.ddl_sheng.SelectedValue = Convert.ToString(model.i_PId);
                //ddl_sheng_SelectedIndexChanged(null, null);
                //this.ddl_shi.SelectedValue = Convert.ToString(model.i_CId);
                //ddl_shi_SelectedIndexChanged(null, null);
                //this.ddl_qu.SelectedValue = Convert.ToString(model.i_AId);

                t_Member tm = DALM.Member_Select_Id(model.i_MemberId);
                Hi_Mr.Value = tm.i_DefaultAddress.ToString();
                ismr.Checked = (model.i_Id.ToString() == Hi_Mr.Value ? true : false);
                lit_type.Text = "주소 수개";
                PageType = "주소 수개";
            }
            else
            {
                Response.Redirect("User_PatentAddress.aspx");
            }
        }
    }

    protected void Bt_AddAddress_Click(object sender, EventArgs e)
    {
        t_ReceiveAddress model = new t_ReceiveAddress();
        if (Hi_AddressId.Value != "0")
        {
            model = DALRA.ReceiveAddress_Select_Id(Convert.ToInt32(Hi_AddressId.Value));
        }
        model.nvc_Consignee = text_shouhuoren.Value;
        model.i_Gid = Convert.ToInt32(this.ddl_guojia.SelectedValue);
        //model.i_PId = Convert.ToInt32(this.ddl_sheng.SelectedValue);
        //model.i_CId = Convert.ToInt32(this.ddl_shi.SelectedValue);
        //model.i_AId = Convert.ToInt32(this.ddl_qu.SelectedValue);
        model.nvc_StreetAddress = text_shouhuodizhi.Value;
        model.nvc_ZipCode = text_youzhengbianma.Value;
        model.nvc_MobilePhone = text_shoujihaoma.Value;
        model.nvc_TelPhone = text_gudingdianhua.Value;
        model.nvc_Email = text_dianziyoujian.Value;
        model.i_MemberId = int.Parse(Hi_MemberId.Value);
        if (Hi_AddressId.Value == "0")
        {
            switch (DALRA.ReceiveAddress_Add(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('의외의 사고가 발생한，잠시 추가할 수 없습니다 주소!');</script>";
                    break;
                case 1:
                    if (ismr.Checked)
                    {
                        DALRA.ReceiveAddress_Update_Mr(model.i_Id);
                    }
                    UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_zl_uid"], "专利系统", "添加地址");
                    div_a.InnerHtml = "<script>alert('추가 성공！'); window.location='User_PatentAddress.aspx'</script>";
                    Response.Redirect("User_PatentAddress.aspx");
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('동일한 수신인과 수신주소  중복추가할수 없습니다!');</script>";
                    break;
            }
        }
        else
        {
            switch (DALRA.ReceiveAddress_Update(model))
            {
                case 0:
                    div_a.InnerHtml = "<script>alert('의외의 사고가 발생한，잠시 수정할 수 없습니다 주소!');</script>";
                    break;
                case 1:
                    if (ismr.Checked)
                    {
                        DALRA.ReceiveAddress_Update_Mr(model.i_Id);
                    }
                    UserLog.AddUserLog(Request.Cookies["hqhtshop"]["hqht_zl_uid"], "专利系统", "更改地址");
                    div_a.InnerHtml = "<script>alert('수개성공'); window.location='User_PatentAddress.aspx'</script>";
                    Response.Redirect("User_PatentAddress.aspx");
                    break;
                case 2:
                    div_a.InnerHtml = "<script>alert('동일한 수신인과 수신주소  중복추가할수 없습니다!');</script>";
                    break;
            }
        }
    }
    //protected void ddl_guojia_SelectedIndexChanged(object sender, EventArgs e)//国家改变
    //{
    //    DALN.Provice_Bind_DDL_NId(ddl_sheng, ddl_guojia.SelectedValue);
    //    DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    //protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)//省改变
    //{
    //    DALA.City_Bind_DDL_PId(ddl_shi, ddl_sheng.SelectedValue);
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
    //protected void ddl_shi_SelectedIndexChanged(object sender, EventArgs e)//市改变
    //{
    //    DALA.Area_Bind_DDL_CId(ddl_qu, ddl_shi.SelectedValue);
    //}
}