using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.ComponentModel;
public partial class ascx_zscqAddress : System.Web.UI.UserControl
{
    dal_Member DALM = new dal_Member();
    dal_Address DALA = new dal_Address();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Nationality DALN = new dal_Nationality();
    [Browsable(true)]
    [Category("int")]
    [Description("用户ID")]
    [DefaultValue("0")]
    public int MemberId
    {
        get { return Hi_MemberId.Value.GetInt(); }
        set { Hi_MemberId.Value = value.ToString(); }
    }
    [Browsable(true)]
    [Category("int")]
    [Description("选中AddressID")]
    [DefaultValue("0")]
    public int AddressId
    {
        get { return Hi_AddressId.Value.GetInt(); }
        set { Hi_AddressId.Value = value.ToString(); }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindValue();
        }
    }
    void Nationality_Bind_DDL(DropDownList ddl)
    {
        ddl.Items.Clear();
        ListItem item = new ListItem("Please select", "0");
        ddl.Items.Add(item);
        var iquery = DALN.Nationality_SelectAll();
        foreach (var s in iquery)
        {
            ListItem item2 = new ListItem(s.nvc_EnName, s.i_Id.ToString());
            ddl.Items.Add(item2);
        }
    }
    void BindValue()
    {
        Nationality_Bind_DDL(ddl_guojia);
        var member = DALM.Member_Select_Id(MemberId); 
        if (member.i_DefaultAddress == 0)
        {
            var iquery = from i in DALRA.ReceiveAddress_Select_MemberId(MemberId) select i;
            if (iquery.Count() > 0)
            {
                t_ReceiveAddress model_RA = iquery.FirstOrDefault();
                Hi_AddressId.Value = model_RA.i_Id.ToString();
            }
            else
            {
                Hi_AddressId.Value = "0";
            }
        }
        else
        {
            Hi_AddressId.Value = member.i_DefaultAddress.ToString();
            Hi_Mr.Value = member.i_DefaultAddress.ToString();
        } 
        Bind_Rpt_Address();
    }
    void Bind_Rpt_Address()
    {
        var iquery = DALRA.ReceiveAddress_vw_Select_MemberId(MemberId);
        Rpt_Address.DataSource = iquery;
        Rpt_Address.DataBind();
    }
    void Mr_Address(int addrId)//默认
    {
        if (DALRA.ReceiveAddress_Update_Mr(addrId) == 1)
        {
            UserLog.AddUserLog(MemberId, "地址管理", "修改默认地址");
            BindValue();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('Error occurs！')</script>", false);
        }
    }
    void Delete_Address(int addrId)//删除地址
    {
        if (DALRA.ReceiveAddress_Del2(addrId) == 1)
        {
            UserLog.AddUserLog(MemberId, "地址管理", "删除地址");
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('Delete successfully！')</script>", false);
            BindValue();
        }
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('Error occurs, the subject address cannot be deleted ！')</script>", false);
        }
    }
    protected void Rpt_Address_ItemCommand(object source, RepeaterCommandEventArgs e)//Operation事件
    {
        if (e.CommandName == "DELETE")
        {
            Delete_Address(Convert.ToInt32(e.CommandArgument));
        }
        if (e.CommandName == "SETMR")
        {
            Mr_Address(Convert.ToInt32(e.CommandArgument));
        }
    }
    protected void Rpt_Address_ItemDataBound(object sender, RepeaterItemEventArgs e)//绑定事件
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lbtnMr = e.Item.FindControl("lbtn_SetMr") as LinkButton;
            vw_ReceiveAddress model = e.Item.DataItem as vw_ReceiveAddress;
            if (model.i_Id.ToString() == Hi_Mr.Value)
            {
                lbtnMr.Enabled = false;
                lbtnMr.Text = " 默认地址 ";
            }
            else
            {
                lbtnMr.Enabled = true;
                lbtnMr.Text = "[设为默认]";
            }
        }
    }
    protected void ibtn_Add_Click(object sender, ImageClickEventArgs e)//Add Address
    {
        try
        {
            t_ReceiveAddress model = new t_ReceiveAddress();
            model.nvc_Consignee = text_shouhuoren.Value;
            model.i_Gid = Convert.ToInt32(this.ddl_guojia.SelectedValue);
            //model.i_PId = Convert.ToInt32(this.ddl_sheng.SelectedValue);
            //model.i_CId = Convert.ToInt32(this.ddl_shi.SelectedValue);
            //model.i_AId = Convert.ToInt32(this.ddl_qu.SelectedValue);
            model.nvc_StreetAddress = text_shouhuodizhi.Value;
            model.nvc_ZipCode = text_youzhengbianma.Value;
            model.nvc_MobilePhone = text_shoujihaoma.Value;
            model.nvc_TelPhone = text_gudingdianhua.Value;
            //model.nvc_Email = text_dianziyoujian.Value;
            model.i_MemberId = MemberId;
            switch (DALRA.ReceiveAddress_Add(model))
            {
                case 0:
                    ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('Error occurs, the address cannot be added temperately！')</script>", false);
                    break;
                case 1:
                    if (CB_Mr.Checked)
                    {
                        DALRA.ReceiveAddress_Update_Mr(model.i_Id);
                    }
                    UserLog.AddUserLog(MemberId, "Address管理", "Add Address");
                    Hi_AddressId.Value = model.i_Id.ToString();
                    BindValue();
                    ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('Add successfully！')</script>", false);
                    break;
                case 2:
                    ScriptManager.RegisterStartupScript(UpdatePanel1, this.Page.GetType(), "msg", "<script>alert('You have the same recipient and the same address information already, which is no need to add again!')</script>", false);
                    break;
            }
        }
        catch { }
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