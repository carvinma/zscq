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
    public bool pageview = Manager.GetManagerQX(12, 0);
    public bool pageupdate = Manager.GetManagerQX(12, 2);
    public bool pagedel = Manager.GetManagerQX(12, 3);
    public bool pagechu = Manager.GetManagerQX(12, 4);
    dal_Bank DALB = new dal_Bank();
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Member DALUSER = new dal_Member();
    dal_Manager DALM = new dal_Manager();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_PatentOperateNote DALPON = new dal_PatentOperateNote();
    dal_Patent DALP = new dal_Patent();
    dal_Coupon DALC = new dal_Coupon();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    bll_UserIntegralNote BLLUIN = new bll_UserIntegralNote();
    public dal_Nationality DALN = new dal_Nationality();
    public string pageurl = "";
    public int OrderStatus = 0;
    public int userid = 0;
    public int i_IntegralProductId = 0, i_NeedIntegral = 0, i_BuyNumber = 0;
    public string nvc_Pic = "", nvc_Name = "";
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
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            pageurl = Request.Url.ToString().Split('?')[1];
        }
        if (!IsPostBack)
        {
            Bind_Page_Info();
        }
    }
    private void Bind_Page_Info()//绑定专利订单信息
    {
        if (Request.QueryString["orderid"] != null && Request.QueryString["orderid"].ToString() != "")
        {
            Hi_OrderId.Value = Request.QueryString["orderid"].ToString();
            int orderid = Convert.ToInt32(Request.QueryString["orderid"].ToString());

            t_PatentOrder model = DALPO.PatentOrder_Select_Id(orderid);
            if (model != null)
            {
                if (model.i_IsFaPiao == 1)
                {
                    tr_fapiao_1.Visible = true;
                    tr_fapiao_2.Visible = true;
                    tr_fapiao_3.Visible = true;
                }
                userid = model.i_UserId;
                t_Member tm = DALUSER.Member_Select_Id(userid);
                labOrderNum.Text = model.nvc_OrderNumber;
                labAddTime.Text = model.dt_AddTime.ToString();
                labUserName.Text = tm.nvc_UserNum;

                Lal_UserName.Text = tm.nvc_Name;

                Lb_OrderStatus.Text = DALPO.GetStatus(model.i_Status);
                //Lal_PsMoney.Text = model.dm_PsMoney.ToString();

                Lal_YouHui.Text = model.dm_YouHui.ToString();
                Lal_CouponMoney.Text = model.dm_CouponMoney.ToString();
                lb_zhinajin.Text = model.dm_ZhiNaJin.ToString();
                lb_fapiao.Text = model.dm_InvoiceMoney.ToString();
                Lal_InvoiceMoney.Text = model.dm_TotalMoney.ToString();
                Lal_GuanFei.Text = model.dm_SetMoney.ToString();
                Lal_DaiLiFei.Text = model.dm_AgentServiceFee.ToString();
                Lal_ShouXuFei.Text = model.dm_RemittanceFee.ToString();
                Lal_ChangXiangFei.Text = model.dm_ChaoXiangFee.ToString();
                Lal_PeiSongFee.Text = model.dm_PsMoney.ToString();
                //Lal_BiZhong.Text = model.nvc_CurrencyType;
                //Lal_TotalMoney.Text = model.dm_TotalMoney.ToString();//专利授权国币种总计
                Lal_PostAddress.Text = model.nvc_PostAddress;
                Txt_GuanFei.Text = model.dm_SetMoney.ToString();
                Txt_DaiLiFei.Text = model.dm_AgentServiceFee.ToString();
                Txt_ShouXuFei.Text = model.dm_RemittanceFee.ToString();
                Txt_ChangXiangFei.Text = model.dm_ChaoXiangFee.ToString();
                Txt_PeiSongFee.Text = model.dm_PsMoney.ToString();

                Lal_BiZhong.Text = model.nvc_CurrencyType;
                decimal subtotal = Convert.ToDecimal(model.dm_SetMoney + model.dm_AgentServiceFee + model.dm_ChaoXiangFee + model.dm_ZhiNaJin);
                Lal_TotalMoney.Text = subtotal.ToString("0.00");

                Lal_BiZhong2.Text = model.nvc_CurrencyType;
                Lal_TotalMoneys.Text = model.dm_TotalMoney.ToString();
                Txt_TotalMoney.Text = model.dm_TotalMoney.ToString();

                if (model.dt_PayMoneyTime != null && model.dt_PayMoneyTime.ToString() != "")
                {
                    Lal_PayMoneyTime.Text = model.dt_PayMoneyTime.ToString();
                }
                Lal_PayType.Text = model.nvc_PayType;
                if (model.nvc_PayType == "线下汇款")
                {
                    StringBuilder yinhang = new StringBuilder();
                    #region 邮件中的银行信息
                    yinhang.Append("<div class='list-div'>");
                    yinhang.Append("<table width='100%'>");
                    yinhang.Append("<tr><th colspan='4'>银行信息</td></tr>");
                    yinhang.Append("<tr>");
                    //yinhang.Append("<td width='25%' height='28' align='center'><strong>银行类型</strong></td>");
                    yinhang.Append("<td width='40%' height='28' align='center'><strong>开户银行</strong></td>");
                    yinhang.Append("<td width='30%' height='28' align='center'><strong>户名</strong></td>");
                    yinhang.Append("<td width='30%' height='28' align='center'><strong>卡号</strong></td>");
                    yinhang.Append("</tr>");
                    for (int i = 0; i < model.nvc_BankId.Split(',').Length; i++)
                    {
                        t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(model.nvc_BankId.Split(',')[i]));
                        if (tb != null)
                        {
                            yinhang.Append("<tr>");
                            //yinhang.Append("<td width='25%' height='28' align='center'>" + tb.nvc_BankName + "</td>");
                            yinhang.Append("<td width='40%' height='28' align='center'>" + tb.nvc_BankDetails + "</td>");
                            yinhang.Append("<td width='30%' height='28' align='center'>" + tb.nvc_AccountName + "</td>");
                            yinhang.Append("<td width='30%' height='28' align='center'>" + tb.nvc_BankNumber + "</td>");
                            yinhang.Append("</tr>");
                        }
                    }
                    yinhang.Append("</table>");
                    yinhang.Append("</div>");
                    #endregion
                    Lal_PayType.Text = model.nvc_PayType + "<br/><br/>" + yinhang.ToString();
                }

                Lal_TaiTou.Text = model.nvc_FaPiaoTaiTou;
                Hi_OldStatus.Value = model.i_Status.ToString();
                OrderStatus = model.i_Status;
                //状态

                #region 按钮设置
                //switch (OrderStatus)
                //{
                //    case 1:
                //        Btn_2.Visible = true;
                //        Btn_8.Visible = true;
                //        break;
                //    case 2:
                //        Btn_3.Visible = true;
                //        break;
                //    case 3:
                //        Btn_4.Visible = true;
                //        break;
                //    case 4:
                //        Btn_5.Visible = true;
                //        break;
                //    case 5:
                //        Btn_5.Visible = true;
                //        break;
                //    case 6:
                //        Btn_6.Visible = true;
                //        break;
                //    case 7:
                //        Btn_7.Visible = true;
                //        break;
                //    case 8:
                //        Btn_8.Visible = true;
                //        break;
                //    case 9:
                //        Btn_9.Visible = true;
                //        break;
                //}
                #endregion

                #region 绑定专利订单中的专利
                IQueryable<t_PatentOrderInfo> iquery = DALPOI.PatentOrderInfo_Select_OrderId(model.i_Id);
                Rtp_PatentList.DataSource = iquery;
                Rtp_PatentList.DataBind();
                #endregion

                #region 绑定操作记录
                repOperateDetail.DataSource = DALPON.PatentOperateNote_vw_Select(orderid);
                repOperateDetail.DataBind();
                #endregion
            }
        }
        else
        {
            Response.Redirect("Shop_M_PatentOrder.aspx?" + pageurl);
        }
    }
    protected void btnOperate_Click(object sender, EventArgs e)//提交
    {
        int OrderId = Convert.ToInt32(Request.QueryString["orderid"].ToString());
        t_PatentOrder model = DALPO.PatentOrder_Select_Id(OrderId);//专利订单修改
        string comName = ((Button)sender).CommandName;
        if (!String.IsNullOrEmpty(comName))
        {
            int CType = Convert.ToInt32(comName);
            DALPO.ChangePantentStatus(model.i_Id, CType);
            #region 专利订单操作记录
            string NoteType = "";
            switch (CType)
            {
                case 1: NoteType = "已提交订单,尚未接收汇款"; break;
                case 2: NoteType = "已提交订单,接收部分汇款,缴费中"; break;
                case 3: NoteType = "已提交订单,接收部分汇款,未缴费"; break;
                case 4: NoteType = "已提交订单,金额已付,缴费中"; break;
                case 5: NoteType = "缴费成功,部分金额未付"; break;
                case 6: NoteType = "缴费成功,发票已发出,请注意查收"; break;
                case 7: NoteType = "缴费成功"; break;
                case 8: NoteType = "取消缴费"; break;
                case 9: NoteType = "无效订单"; break;
            }
            t_PatentOperateNote note = new t_PatentOperateNote();
            note.i_ManagerId = Convert.ToInt32(Request.Cookies["zscqmanage"]["userid"]);
            note.nvc_Remark = area_beizhu.Value;
            note.nvc_Type = NoteType;
            note.dt_AddTime = DateTime.Now;
            note.i_OrderId = OrderId;
            DALPON.PatentOperateNote_Add(note);
            #endregion

            //var result = DALPOI.PatentOrderInfo_Select_OrderId(model.nvc_OrderNumber);
            //foreach (var r in result)
            //{
            //    t_Patent sb_model = DALP.Patent_Select_Id(r.i_PatentId);
            //    sb_model.i_AnnualFeeStatus = CType;
            //    DALP.Patent_Update(sb_model);
            //}
            model.i_Status = CType;
            if (CType == 5 || CType == 6 || CType == 7)
            {
                if (Convert.ToInt32(Hi_OldStatus.Value) < 5)
                {
                    model.dm_CouponMoney = model.dm_TotalMoney;
                    #region 积分返赠
                    if (model.i_JiFen > 0)//model.nvc_PayType == "线下汇款" && 
                    {
                        t_IntegralMobile im = DALIM.IntegralMobile_SelectByMemberId(model.i_UserId);
                        if (im != null)
                        {
                            //im.i_Integral += model.i_JiFen;
                            //DALIM.IntegralMobile_Updata(im);
                            BLLUIN.UserIntegralNote_Add(model.i_UserId, "专利下单", model.i_JiFen);
                            model.i_JiFen = 0;
                        }
                    }
                    #endregion
                    model.dt_PayMoneyTime = DateTime.Now;//缴费时间
                    IQueryable<t_PatentOrderInfo> info = DALP.GetPatentIdByOrderNumber(model.i_Id);
                    foreach (var v in info)
                    {
                        string niandu = "";
                        t_Patent t = DALP.Patent_Select_Id(v.i_PatentId);

                        #region 下一次缴费年度
                        var aa = (from i in dzdc.t_PatentFee where i.i_NationalityId == t.i_AuthorizeNationalityId && i.i_PatentTypeId == t.i_PatentType && i.nvc_Year == t.nvc_AnnualFeeNotPaymentYear select i).Take(1);
                        if (aa != null)
                        {
                            foreach (var a in aa)
                            {
                                var bb = (from i in dzdc.t_PatentFee where i.i_NationalityId == t.i_AuthorizeNationalityId && i.i_PatentTypeId == t.i_PatentType && i.i_Id > a.i_Id select i).Take(1);
                                if (bb != null)
                                {
                                    foreach (var b in bb)
                                    {
                                        niandu = b.nvc_Year;
                                    }
                                }
                            }

                        }
                        #endregion

                        if (niandu == "")
                        {
                            t.i_AnnualFeeStatus = 13;
                            t.dt_AnnualFeePrevYear = t.dt_AnnualFeeNextYear;//上一次缴费期限日
                            t.dt_AnnualFeeNextYear = null;
                            t.nvc_AnnualFeePaymentYear = t.nvc_AnnualFeeNotPaymentYear;//已缴
                            t.nvc_AnnualFeeNotPaymentYear = niandu;//代缴
                        }
                        else
                        {
                            #region 把费用修改为代缴年度的费用
                            string s2 = DALP.GetPatentInfo(t.i_AuthorizeNationalityId, t.i_PatentType, t.dt_AuthorizeIsNationalityDate.ToString(), t.dt_AuthorizeIsAuthorizeDate.ToString(), t.i_PatentHolderNationalityId, t.nvc_AnnualFeeNotPaymentYear, t.i_MemberId, t.i_YaoQiuXiang);
                            t.dm_AnnualFeeNextPaymentMoney = Convert.ToDecimal(s2.Split(',')[1]);
                            t.dm_RemittanceFee = Convert.ToDecimal(s2.Split(',')[2]);
                            t.dm_AgentServiceFee = Convert.ToDecimal(s2.Split(',')[3]);
                            t.nvc_CurrencyType = s2.Split(',')[4];
                            t.dm_FeeSubtotal = Convert.ToDecimal(s2.Split(',')[5]);
                            t.dm_ChaoXiangFee = Convert.ToDecimal(s2.Split(',')[8]);
                            t.i_AnnualFeeRestYear = Convert.ToInt32(s2.Split(',')[6]);//剩余有效年

                            t.dt_AnnualFeePrevYear = t.dt_AnnualFeeNextYear;//上一次缴费期限日
                            //t.dt_AnnualFeePrevYear = Convert.ToDateTime(s2.Split(',')[11]);//上一次缴费期限日
                            t.dt_AnnualFeeNextYear = Convert.ToDateTime(s2.Split(',')[12]);//下一次缴费期限日
                            t.i_AnnualFeeRestDay = Convert.ToInt32(s2.Split(',')[13]);
                            #endregion
                            t.i_AnnualFeeStatus = 1;//还原专利状态
                            t.nvc_AnnualFeePaymentYear = t.nvc_AnnualFeeNotPaymentYear;//已缴
                            t.nvc_AnnualFeeNotPaymentYear = niandu;//代缴
                        }
                        DALP.Patent_Update(t);
                    }
                }
            }
            if (CType == 8 || CType == 9)
            {
                IQueryable<t_PatentOrderInfo> info = DALP.GetPatentIdByOrderNumber(model.i_Id);
                foreach (var v in info)
                {
                    t_Patent t = DALP.Patent_Select_Id(v.i_PatentId);
                    t.i_AnnualFeeStatus = 1;//还原专利状态
                    DALP.Patent_Update(t);
                }
                #region 取消订单的时候 把他所用到的优惠券状态还原
                if (model.nvc_YouHuiId != null && model.nvc_YouHuiId != "")
                {
                    string youhui = model.nvc_YouHuiId;
                    if (youhui.IndexOf(',') > -1)
                    {
                        string[] arr = youhui.Split(',');
                        for (int i = 0; i < arr.Length; i++)
                        {
                            t_Coupon tc = DALC.Coupon_Select_Id(Convert.ToInt32(arr[i]));
                            tc.i_State = 1;
                            DALC.Coupon_Update(tc);
                        }
                    }
                    else
                    {
                        t_Coupon tc = DALC.Coupon_Select_Id(Convert.ToInt32(youhui));
                        tc.i_State = 1;
                        DALC.Coupon_Update(tc);
                    }
                }
                #endregion
            }

            DALPO.PatentOrder_Update(model);
            Manager.AddLog(0, "专利订单管理", "更改专利订单" + model.nvc_OrderNumber + "状态为" + DALPO.GetStatus(model.i_Status));
            Response.Redirect(Request.Url.ToString());
        }
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)//删除专利订单
    {
        int orderID = Convert.ToInt32(Hi_OrderId.Value);
        DALPO.PatentOrder_Del(orderID);
        Manager.AddLog(0, "专利订单管理", "删除专利订单");
        Response.Redirect("Shop_M_PatentOrder.aspx?" + pageurl);
    }
    protected void Btn_EditFee_Click(object sender, EventArgs e)
    {
        if (Txt_GuanFei.Visible == false)
        {
            Lal_GuanFei.Visible = false;
            Txt_GuanFei.Visible = true;
            Lal_DaiLiFei.Visible = false;
            Txt_DaiLiFei.Visible = true;
            Lal_ShouXuFei.Visible = false;
            Txt_ShouXuFei.Visible = true;
            Lal_ChangXiangFei.Visible = false;
            Txt_ChangXiangFei.Visible = true;
            Lal_TotalMoney.Visible = false;
            Txt_TotalMoney.Visible = true;
            Lal_PeiSongFee.Visible = false;
            Txt_PeiSongFee.Visible = true;
        }
        else
        {
            Lal_GuanFei.Visible = true;
            Txt_GuanFei.Visible = false;
            Lal_DaiLiFei.Visible = true;
            Txt_DaiLiFei.Visible = false;
            Lal_ShouXuFei.Visible = true;
            Txt_ShouXuFei.Visible = false;
            Lal_ChangXiangFei.Visible = true;
            Txt_ChangXiangFei.Visible = false;
            Lal_TotalMoney.Visible = true;
            Txt_TotalMoney.Visible = false;
            Lal_PeiSongFee.Visible = true;
            Txt_PeiSongFee.Visible = false;
            try
            {
                t_PatentOrder model = DALPO.PatentOrder_Select_Id(Convert.ToInt32(Hi_OrderId.Value));
                model.dm_SetMoney = Convert.ToDecimal(Txt_GuanFei.Text);
                model.dm_AgentServiceFee = Convert.ToDecimal(Txt_DaiLiFei.Text);
                model.dm_RemittanceFee = Convert.ToDecimal(Txt_ShouXuFei.Text);
                model.dm_ChaoXiangFee = Convert.ToDecimal(Txt_ChangXiangFei.Text);
                model.dm_TotalMoney = Convert.ToDecimal(Txt_TotalMoney.Text);
                DALPO.PatentOrder_Update(model);
                div_a.InnerHtml = "<script>alert('修改成功')</script>";
                Lal_GuanFei.Text = model.dm_SetMoney.ToString();
                Lal_DaiLiFei.Text = model.dm_AgentServiceFee.ToString();
                Lal_ShouXuFei.Text = model.dm_RemittanceFee.ToString();
                Lal_ChangXiangFei.Text = model.dm_ChaoXiangFee.ToString();
                Lal_TotalMoney.Text = (model.dm_SetMoney + model.dm_AgentServiceFee + model.dm_ChaoXiangFee).ToString();
                Lal_TotalMoneys.Text = model.dm_TotalMoney.ToString();
            }
            catch { }

        }
    }
}