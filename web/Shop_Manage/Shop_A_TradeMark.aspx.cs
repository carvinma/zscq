using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_Shop_A_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    dal_Address DALB = new dal_Address();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_Member DALM = new dal_Member();
    public string PageType = "添加商标";
    public StringBuilder img_color = new StringBuilder();
    public string returnurl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
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
            Response.Write("无权限访问！");
            Response.End();
        }
        div_a.InnerHtml = "";
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            //Bind_Drp_PGuoJiaType();
            Bind_Drp_PGuoJiaType();
            Bind_Page_Info();          
        }
    }

    public string Get_GuoJiaTypeName(int id)// 绑定国籍
    {
        string guoname = "";
        t_Nationality tn = DALN.Nationality_Select_Id(id);
        if (tn != null)
        {
            guoname = tn.nvc_Name;
        }
        return guoname;
    }
    public void Bind_Page_Info()
    {
        if (Request.QueryString["id"] != null)
        {
            PageType = "修改商标";
            hd_id.Value = Request.QueryString["id"].ToString();
            t_Trademark model = DALT.Trademark_Select_Id(int.Parse(Request.QueryString["id"].ToString()));
            if (model != null)
            {
                hd_userId.Value = model.i_MemberId.ToString();
                t_Member mm = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
                if (mm != null)
                {
                    txt_MemberId.Value = mm.nvc_UserNum.ToString();
                    //if (mm.i_GuoJiId != null)
                    //{
                    //    dd_guoji.SelectedValue = mm.i_GuoJiId.ToString();
                    //}
                    //if (mm.i_UserTypeId!=null)
                    //{
                    //    dd_type.SelectedValue = mm.i_UserTypeId.ToString();
                    //}
                    //txt_MemberId.Value = mm.nvc_UserNum;
                    //model.nvc_CEnName = mm.nvc_EnglishName;
                    //model.nvc_CIdCard = mm.nvc_IDCard;
                    //t_addressEn.Value = model.nvc_CAddress1;
                    //t_companyname.Value = model.nvc_OtherName;
                    //t_companynameEn.Value = model.nvc_CEnName;//这里把这个英文姓名字段当成了公司名称    
                    //t_dailiname.Value = model.nvc_OtherName;
                 　　//txt_AuthorizeIsNationalityDate.Value  =  model.nvc_SbRegTime ;
                     t_daoqi.Value=model.nvc_SbDaoqiTime ;


                    txt_sbnum.Value = model.nvc_SBRegNum;
                    t_SBType.Value = model.nvc_SBType;//商标类型
                    if (model.i_MiaoShuType == 1)
                    {
                        RadioButton1.Checked = true;
                    }
                    if (model.i_MiaoShuType == 2)
                    {
                        RadioButton2.Checked = true;
                    }
                    if (model.i_MiaoShuType == 3)
                    {
                        RadioButton3.Checked = true;
                    }
                    t_SBmiaosu.Value = model.nvc_SBDescribe;//
                    t_sbregname.Value = model.nvc_SBRegName;//已缴年度
                    t_sbregnameEN.Value = model.nvc_SBRegEnName;
                    Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();
                    model.nvc_SBDescribe = t_SBmiaosu.Value;//

                    txt_anjuanhao.Value = model.nvc_CFaxnumber;
                    txt_linkman.Value = model.nvc_OtherName;
                    txt_phone.Value = model.nvc_CTel;
                    txt_address.Value = model.nvc_CAddress;
                    //Drp_GuoJi_SelectedIndexChanged(null, null);
                    //DropDownList2.SelectedValue = model.i_ProvinceId.ToString();
                    //DropDownList2_SelectedIndexChanged(null,null);
                    //DropDownList3.SelectedValue = model.i_CityId.ToString();
                    //DropDownList3_SelectedIndexChanged(null, null);
                    //DropDownList4.SelectedValue = model.i_AreaId.ToString();
                    t_sbregaddress.Value = model.nvc_SBRegAddress;
                    t_sbregaddressEN.Value = model.nvc_SBRegEnAddress;
                    txt_AuthorizeIsNationalityDate.Value = model.nvc_SbRegTime;
                    t_sbregyouzheng.Value = model.nvc_SBPostcode;
                    shengtime.InnerHtml = model.i_ShengDays.ToString();
                    dd_jiaofeitype.SelectedValue = model.i_JiaoFeiType.ToString();
                }
            }
        }
    }
    protected void btOK_Click(object sender, EventArgs e)
    {

        t_Trademark model = new t_Trademark();
        if (hd_id.Value != "0")
        {
            model = DALT.Trademark_Select_Id(int.Parse(hd_id.Value));
        }
        t_SystemSetup ts = DALSS.SystemSetup_Select();
        string usermember = txt_MemberId.Value;
        t_Member mm = DALM.Member_Select_ByUserNum(usermember);
        if (mm != null)
        {
            model.i_MemberId = mm.i_Id;
           
            model.nvc_CRealName = mm.nvc_RealName;
        
            #region 这里是会员信息 现已不插入商标表 
            //int dd_type = int.Parse(mm.i_UserTypeId.ToString());
           // int dd_guoji = int.Parse(mm.i_GuoJiId.ToString());
            //if (Get_GuoJiaTypeName(dd_guoji) == "中国")
            //{
            //    if (dd_type == 1)
            //    {

            //        model.nvc_CIdCard = mm.nvc_IDCard;
            //    }
            //    if (dd_type == 2)
            //    {
            //        model.nvc_OtherName = mm.nvc_Company;
            //    }
            //    if (dd_type == 3)
            //    {
            //        model.nvc_OtherName = mm.nvc_DaiLiName;
            //    }

            //}
            //else
            //{
            //    if (dd_type == 1)
            //    {
            //        model.nvc_CEnName = mm.nvc_EnglishName;
            //        model.nvc_CIdCard = mm.nvc_EnName;
            //        model.nvc_CAddress1 = mm.nvc_Address;
            //    }
            //    if (dd_type == 2)
            //    {
            //        model.nvc_OtherName = mm.nvc_Company;
            //        model.nvc_CEnName = mm.nvc_EnCompany;//这里把这个英文姓名字段当成了公司名称
            //    }
            //    if (dd_type == 3)
            //    {
            //        model.nvc_OtherName = mm.nvc_DaiLiName;
            //    }
            //}


            //model.nvc_CFaxnumber = mm.nvc_FaxNumber;//传真
            //model.nvc_CTel = mm.nvc_MobilePhone;

            //model.Nvc_CPostcode = mm.nvc_ZipCode;

            //model.nvc_CQQ = mm.nvc_LinkManQQ;
            #endregion

            if (ts != null)
            {
                model.nvc_DLName = ts.nvc_DLName;
                model.nvc_DLTel = ts.nvc_DLTel;
                model.nvc_DLFaxnumber = ts.nvc_DLFaxNumber;
                model.nvc_DLZuzhiName = ts.nvc_DLCNName;
                model.nvc_DLZuzhiEnName = ts.nvc_DLENName;
            }
            model.nvc_SBRegNum = txt_sbnum.Value;
            model.nvc_SBType = t_SBType.Value;//商标类型
            model.nvc_SBRegName = t_sbregname.Value;//已缴年度
            model.nvc_SBRegEnName = t_sbregnameEN.Value;
           model.i_GuoJiId =int.Parse(Drp_GuoJi.SelectedValue);         
            // model.i_ProvinceId= int.Parse(DropDownList2.SelectedValue);
            //model.i_CityId=int.Parse(DropDownList3.SelectedValue);
            //model.i_AreaId= int.Parse(DropDownList4.SelectedValue);
            model.nvc_SBRegAddress = t_sbregaddress.Value;
            model.nvc_SBRegEnAddress = t_sbregaddressEN.Value;
            model.nvc_SBPostcode = t_sbregyouzheng.Value;
            model.nvc_SbRegTime = txt_AuthorizeIsNationalityDate.Value;
            model.nvc_SbDaoqiTime = t_daoqi.Value;
            DateTime dt = DateTime.Parse(t_daoqi.Value+" 00:00:00");
            model.i_ShengDays =int.Parse(HelpString.DateDiff(dt, DateTime.Now, "day"));
            //if (dd_jiaofeitype.SelectedItem.ToString() == "委托缴费")
            //{
            //    if (!RadioButton1.Checked || !RadioButton2.Checked || !RadioButton3.Checked)
            //    {
            //        div_a.InnerHtml = "<script>alert('请选择商标描述类型！');<script>";
            //        return;
            //    }
            //}
            model.i_JiaoFeiType = int.Parse(dd_jiaofeitype.SelectedValue);
            model.i_IsPayState = 0;
            if (RadioButton1.Checked)
            {
                model.i_MiaoShuType = 1;
            }
            if (RadioButton2.Checked)
            {
                model.i_MiaoShuType = 2;
            }
            if (RadioButton3.Checked)
            {
                model.i_MiaoShuType = 3;
            }
            model.nvc_SBDescribe = t_SBmiaosu.Value;//
            model.nvc_CFaxnumber = txt_anjuanhao.Value;
            model.nvc_OtherName = txt_linkman.Value;
            model.nvc_CAddress = txt_address.Value;
            model.nvc_CTel = txt_phone.Value;

            
            if (hd_id.Value != "0")
            {
                model.dt_AddTime = DateTime.Now;
                if (DALT.Trademark_Update(model) == 1)
                {
                    Manager.AddLog(0, "商标管理", "修改了商标[ <font color=\"red\">" + model.nvc_CRealName + "</font> ]的信息");//修改专利日志
                    string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Trademark.aspx?" + returnurl, System.Text.Encoding.GetEncoding("gb2312"));
                    Response.Redirect("shop_manageok.aspx?hrefname=商标&hreftype=2&href1=Shop_A_Trademark.aspx&href2=" + twourl);
                }
            }
            else
            {
                model.dt_AddTime = DateTime.Now;

                if (DALT.Trademark_Add(model) > 0)
                {
                    //int trademarkid = model.i_Id;
                    //#region 生成订单
                    //t_TrademarkOrder OrderModer = new t_TrademarkOrder();
                    //OrderModer.nvc_OrderNumber = DALTO.Set_OrderNo();

                    //OrderModer.i_MemberId = mm.i_Id;

                    //OrderModer.i_Status = 0;
                    //OrderModer.dm_TotalMoney = 0;
                    //OrderModer.dt_AddTime = DateTime.Now;
                    //DALTO.TrademarkOrder_Add(OrderModer);
                    //#endregion

                    //#region 生成订单详情
                    //t_TrademarkOrderDetails dModer = new t_TrademarkOrderDetails();
                    //dModer.i_OrderId = OrderModer.i_Id;
                    //dModer.i_TrademarkId = trademarkid;
                    //DALTOD.OrderDetails_Add(dModer);
                    //#endregion
                }
                Manager.AddLog(0, "商标管理", "添加了商标[ <font color=\"red\">" + model.nvc_CRealName + "</font> ]");//添加专利日志
                string twourl = System.Web.HttpUtility.UrlEncode("Shop_M_Trademark.aspx", System.Text.Encoding.GetEncoding("gb2312"));
                Response.Redirect("shop_manageok.aspx?hrefname=商标&hreftype=1&href1=Shop_A_Trademark.aspx&href2=" + twourl);
            }
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