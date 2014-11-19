using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;
using System.Text;

public partial class Shop_Manage_shop_submore : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(30, 0);
    public bool pageupdate = Manager.GetManagerQX(30, 2);
    public bool pagedel = Manager.GetManagerQX(30, 3);
    public bool pagechu = Manager.GetManagerQX(30, 4);

    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_IntegralOrder DALIO = new dal_IntegralOrder();
    dal_IntegralOrderOperateNote DALIOO = new dal_IntegralOrderOperateNote();
    public string pageurl = "";
    public int OrderStatus = 0;
    public int userid = 0;

    #region 商品信息
    public int i_IntegralProductId = 0, i_NeedIntegral = 0, i_BuyNumber = 0;
    public string nvc_Pic = "", nvc_Name = "";
    #endregion

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
        div_a.InnerHtml = "";
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            pageurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    private void Bind_Page_Info()//绑定积分订单信息
    {
        if (Request.QueryString["orderid"] != null && Request.QueryString["orderid"].ToString() != "")
        {
            Hi_OrderId.Value = Request.QueryString["orderid"].ToString();
            int orderid = Convert.ToInt32(Request.QueryString["orderid"].ToString());

            vw_IntegralOrder model = DALIO.IntegralOrder_vw_Select_Id(orderid);
            if (model != null)
            {
                userid = model.i_MemberId;

                //状态
                OrderStatus = model.i_State;
                this.Lb_OrderStatus.Text = DALIO.Set_IntegralOrderState(model.i_State);
                if (model.i_State == 2)
                {
                    this.Lb_OrderStatus.ForeColor = System.Drawing.Color.Red;
                }

                this.labOrderNum.Text = model.nvc_OrderNumber;
                this.labAddTime.Text = model.dt_AddTime.ToString();

                this.labUserName.Text = model.nvc_MemberName + "(" + model.nvc_Mobile + ")";

                #region 绑定收货信息
                this.labSendStyle.Text = model.nvc_PSWay;
                //this.labSendTime.Text = Order.nvc_PSTime;
                string Address = string.IsNullOrWhiteSpace(model.countryName) == true ? "" : model.countryName + "&nbsp;&nbsp;";
                Address += string.IsNullOrWhiteSpace(model.cityName) == true ? "" : model.cityName + "&nbsp;&nbsp;";
                Address += string.IsNullOrWhiteSpace(model.areaName) == true ? "" : model.areaName + "&nbsp;&nbsp;";
                Address += string.IsNullOrWhiteSpace(model.nvc_Address_StreetAddress) == true ? "" : model.nvc_Address_StreetAddress;

                this.labAddress.Text = Address;// model.provinceName + "&nbsp;" + model.cityName + "&nbsp;" + model.areaName + "&nbsp;" + model.nvc_Address_StreetAddress;
                this.labMobile.Text = model.nvc_Address_MobilePhone;
                this.labReceiver.Text = model.nvc_Address_Consignee;
                if (model.nvc_Address_ZipCode != "" && model.nvc_Address_ZipCode != null)
                {
                    this.labZipCode.Text = "(邮政编码：" + model.nvc_Address_ZipCode + ")";
                }
                if (model.nvc_Address_TelPhone != "" && model.nvc_Address_TelPhone != null)
                {
                    this.labTel.Text = "固定电话：" + model.nvc_Address_TelPhone;
                }
                if (model.nvc_Address_Email != "" && model.nvc_Address_Email != null)
                {
                    this.labEmail.Text = "电子邮箱：" + model.nvc_Address_Email;
                }
                #endregion

                this.labTotalMoney.Text = model.i_SumIntegral.ToString();

                #region 绑定操作记录
                repOperateDetail.DataSource = DALIOO.IntegralOrderOperateNote_vw_Select(orderid);
                repOperateDetail.DataBind();
                #endregion

                #region 按钮设置
                switch (OrderStatus)
                {
                    case 1:
                        this.Bt_Confirm.Visible = true;
                        this.Bt_Esc.Visible = true;
                        break;
                    case 2:
                        this.Bt_Express.Visible = true;
                        this.Bt_Esc.Visible = true;
                        //this.danweitr.Visible = true;//tr
                        //this.trOperator.Visible = true;//tr
                        //this.trOperatorMobile.Visible = true;//tr
                        break;
                    case 3:
                        this.Bt_OrderEnd.Visible = true;
                        break;
                    //case 4:
                    //    this.Bt_ReturnMoney.Visible = true;
                    //    break;
                    case 5:
                        tr_caozuo.Visible = false;
                        break;
                    case 6:
                        tr_caozuo.Visible = false;
                        break;
                }
                #endregion

                #region 绑定商品信息
                repProduct.DataSource = new dal_IntegralOrderDetails().IntegralOrderDetails_vw_Select_OrderId(orderid);
                repProduct.DataBind();
                //i_IntegralProductId = model.i_IntegralProductId;
                //i_NeedIntegral = Convert.ToInt32(model.i_SumIntegral);
                //i_BuyNumber = model.i_BuyNumber;
                //nvc_Pic = model.nvc_Pic;
                //nvc_Name = model.nvc_Name;
                #endregion
            }
        }
        else
        {
            Response.Redirect("Shop_M_IntegralOrder.aspx?" + pageurl);
        }
    }
    protected void btnOperate_Click(object sender, EventArgs e)//提交
    {
        int OrderId = Convert.ToInt32(Request.QueryString["orderid"].ToString());
        t_IntegralOrder model = DALIO.IntegralOrder_Select_Id(OrderId);//积分订单修改
        string comName = ((Button)sender).CommandName;
        if (!String.IsNullOrEmpty(comName))
        {
            int CType = Convert.ToInt32(comName);

            #region 积分订单操作记录和出库和到货
            bll_IntegralOrderOperateNote BLLIOON = new bll_IntegralOrderOperateNote();
            string NoteType = "处理";
            switch (CType)
            {
                case 2:
                    NoteType = "发货";
                    break;
                case 3:
                    NoteType = "后台收货";
                    break;
                case 4:
                    NoteType = "退货";
                    break;
                case 5:
                    NoteType = "后台取消";
                    break;
            }
            if (CType == 5)
            {
                var m = DALIM.IntegralMobile_SelectByMemberId(model.i_MemberId);
                if (m != null)
                {
                    BLLUIN.UserIntegralNote_Add(model.i_MemberId, "取消订单", model.i_SumIntegral);
                }

                //var im = DALIM.IntegralMobile_SelectById(model.i_IntegralMobileId);
                //im.i_Integral += model.i_SumIntegral;
                //DALIM.IntegralMobile_Updata();

            }
            BLLIOON.IntegralOrderOperateNote_Add(NoteType, area_beizhu.Value, Convert.ToInt32(Request.Cookies["zscqmanage"]["userid"]), model.i_Id);
            #endregion

            model.i_State = CType + 1;

            DALIO.IntegralOrder_Update(model);

            Manager.AddLog(0, "积分订单管理", "更改积分订单" + model.nvc_OrderNumber + "状态为" + DALIO.Set_IntegralOrderState(model.i_State));

            Response.Redirect(Request.Url.ToString());
        }
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)//删除积分订单
    {
        int orderID = Convert.ToInt32(Hi_OrderId.Value);
        DALIO.IntegralOrder_Del(orderID);
        Manager.AddLog(0, "积分订单管理", "删除积分订单");
        Response.Redirect("Shop_M_IntegralOrder.aspx?" + pageurl);
    }
}