using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.BLL;
using zscq.DAL;
using System.Data;

public partial class Shop_Manage_Advert_MangeAdvert : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(67, 0);
    public bool pageadd = Manager.GetManagerQX(67, 1);
    public bool pageupdate = Manager.GetManagerQX(67, 2);
    public bool pagedel = Manager.GetManagerQX(67, 3);
    dal_Adv DALA = new dal_Adv();
    dal_AdvType DALAT = new dal_AdvType();
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
        HiddenDel.Value = "";
        div_a.InnerHtml = "";
        if (!IsPostBack)
        {
            LanguageConfig.BindLanguage(ddl_language);
            Bind_Page_Value();
            Bind_Rpt_List();
        }
    }
    void Bind_Page_Value()
    {
        if (Request.QueryString["pagetype"] != null && Request.QueryString["pagetype"].ToString() != "")
        {
            string PageType = Request.QueryString["pagetype"].ToString();
            switch (PageType)
            {
                case "showtr":
                    if (Request.QueryString["trid"] != null && Request.QueryString["trid"].ToString() != "")
                    {
                        div_a.InnerHtml = "<script>showtr('" + (Request.QueryString["trid"].ToString()) + "')</script>";
                    }
                    break;
            }
        }
        if (Request.QueryString["pagetype2"] != null && Request.QueryString["pagetype2"].ToString() != "")
        {
            string PageType2 = Request.QueryString["pagetype2"].ToString();
            if (PageType2 == "del")
            {
                HiddenDel.Value = "del";
            }
        }
    }
    public void Bind_Rpt_List()
    {
        Rpt_AdvType.DataSource = DALAT.AdvType_SelectAll(ddl_language.SelectedValue);
        Rpt_AdvType.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int TypeId = 0;
        string TypeName = "";
        if (Request.Form["selectid"] != null)
        {
            string[] IDList = Request.Form["selectid"].ToString().Split(',');
            for (int i = 0; i < IDList.Length; i++)
            {
                if (i == 0)
                {
                    vw_Adv model = DALA.Adv_vw_Select_Id(Convert.ToInt32(IDList[i]));
                    if (model != null)
                    {
                        TypeId = model.i_TypeId;
                        TypeName = model.nvc_Name;
                    }
                }
                DALA.Adv_Del(Convert.ToInt32(IDList[i]));
            }
            Manager.AddLog(0, "广告管理", "删除了广告[ <font color=\"red\">" + TypeName + "</font> ]");
        }
        Response.Redirect("Shop_M_Adv.aspx?pagetype=showtr&trid=" + TypeId + "&pagetype2=del&lang=" + ddl_language.SelectedValue);
    }
    protected void advList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            Repeater advList = (Repeater)e.Item.FindControl("advList");
            HiddenField Hi_Id = (HiddenField)e.Item.FindControl("Hi_Id");
            Label Lb_Items = (Label)e.Item.FindControl("Lb_Items");
            advList.DataSource = DALA.Adv_Select_TypeId(Convert.ToInt32(Hi_Id.Value));
            advList.DataBind();
            Lb_Items.Text = "（" + advList.Items.Count + "）";
        }
        catch { }
    }
    public string Set_Adv(object i_Id)
    {
        try
        {
            string ret = "";
            vw_Adv model = DALA.Adv_vw_Select_Id(Convert.ToInt32(i_Id));
            if (model.i_Type == 0)
            {
                if (model.i_ImageType == 0)
                {
                    //图片
                    if (model.nvc_LinkAddress == null || model.nvc_LinkAddress == "")
                    {
                        ret = "<img style=\"border:0;width:120px;\" title=\"" + model.nvc_LinkWord + "\" src=\"../" + model.nvc_ImageAddress + "\" />";
                    }
                    else
                    {
                        ret = "<a href=\"" + model.nvc_LinkAddress + "\" target=\"_blank\"><img style=\"border:0;width:120px;\" title=\"" + model.nvc_LinkWord + "\" src=\"../" + model.nvc_ImageAddress + "\" /></a>";
                    }
                }
                else
                {
                    //flash
                    if (model.nvc_LinkAddress == null || model.nvc_LinkAddress == "")
                    {
                        ret = "<object data=\"../" + model.nvc_ImageAddress + "\"  type=\"application/x-shockwave-flash\" width=\"120\" height=\"60\"><param name=\"movie\" value=\"../" + model.nvc_ImageAddress + "\" /></object>";
                    }
                    else
                    {
                        ret = "<object data=\"../" + model.nvc_ImageAddress + "\"  type=\"application/x-shockwave-flash\" width=\"120\" height=\"60\"><param name=\"movie\" value=\"../" + model.nvc_ImageAddress + "\" /></object><a href=\"" + model.nvc_LinkAddress + "\" title=\"" + model.nvc_LinkWord + "\" target=\"_blank\">点我连接</a>";
                    }
                }
            }
            else
            {
                //文字
                if (model.nvc_LinkAddress == null || model.nvc_LinkAddress == "")
                {
                    ret = model.nvc_LinkWord;
                }
                else
                {
                    ret = "<a href=\"" + model.nvc_LinkAddress + "\" target=\"_blank\">" + model.nvc_LinkWord + "</a>";
                }
            }
            return ret;
        }
        catch { }
        return "";
    }
    public string Set_OpenWay(object nvc_OpenWay)
    {
        try
        {
            string ret = "";
            switch (nvc_OpenWay.ToString())
            {
                case "_self":
                    ret = "当前页面打开";
                    break;
                case "_blank":
                    ret = "新建页面打开";
                    break;
                case "_top":
                    ret = "父页面中打开";
                    break;
            }
            return ret;
        }
        catch { }
        return "";
    }
    protected void ddl_language_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_Rpt_List();
    }

}
