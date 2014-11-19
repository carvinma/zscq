using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

public partial class User_PatentCount : System.Web.UI.Page
{
    int uId = 0, count = 0, remail = 0;
    string href = "", bankId = "";
    public int zengjifen = 0, zlnum = 0;
    public decimal moneyTotal = 0, moneyTotal2 = 0, dm_guanfee = 0, dm_dailifee = 0, dm_shouxufee = 0, dm_chaoxiangfee = 0, dm_zhinajin = 0, psfee = 0;
    public string moneytype = "", moneytype2 = "";
    StringBuilder yinhang = new StringBuilder();
    StringBuilder sb_patent_1 = new StringBuilder();
    public StringBuilder sb_patent = new StringBuilder();
    public StringBuilder tr_PayWay = new StringBuilder();

    dal_Bank DALB = new dal_Bank();
    dal_PayWay DALPY = new dal_PayWay();
    dal_PSWay DALPS = new dal_PSWay();
    dal_Patent DALP = new dal_Patent();
    dal_PatentType DALPT = new dal_PatentType();
    dal_Nationality DALN = new dal_Nationality();
    dal_Coupon DALC = new dal_Coupon();
    public dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
    dal_Member DALM = new dal_Member();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_SystemSetup DALS = new dal_SystemSetup();
    dal_SystemKey DALSK = new dal_SystemKey();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            t_Member model = DALM.Member_Select_Id(uId);
            DALP.EditPatentFeeByMemberId(uId);//更新专利信息
            Hi_guoji.Value = model.i_GuoJiId.ToString();
            remail = model.i_ReceiveEmail;

            href = Request.Url.ToString();
            zscqAddress1.MemberId = uId;
            if (Convert.ToInt32(Hi_guoji.Value) == 1)
            {
                bankId = Bind_Rpt_BankList(0);
            }
            else if (Convert.ToInt32(Hi_guoji.Value) == 11)
            {
                bankId = Bind_Rpt_BankList(2);
            }
            else
            {
                bankId = Bind_Rpt_BankList(1);
            }
            psfee = 25;
            t_PSWay tps = DALPS.PSWay_Select_Id(13);
            if (tps != null)
            {
                psfee = Convert.ToDecimal(tps.i_Cost);
            }
            else
            {
                tps = DALPS.PSWay_Select_Name("快递");
                psfee = Convert.ToDecimal(tps.i_Cost);
            }
            #region 缴费国家币种
            t_Nationality tn = DALN.Nationality_Select_Id(model.i_GuoJiId);
            if (tn != null)
            {
                hi_paybizhong.Value = tn.nvc_JFBizhong;//费用缴纳国家币种
            }
            #endregion
            Delete_Patent();
            Bind_PatentList();
            Bind_Drp_YouHuiQuan();
            Bind_Page_PayWay();
        }
        //GetDefaultAddress(uId);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Write(input_payway.Value + "========" + bank.Value);
        //Response.End();
        if (Convert.ToDouble(Hi_Total2.Value) <= 0)
        {
            div_a.InnerHtml = "<script>alert('金额总计为不能为0')</script>";
            return;
        }
        #region 生成订单
        t_PatentOrder OrderModer = new t_PatentOrder();
        var address = DALRA.ReceiveAddress_vw_Select_Id(zscqAddress1.AddressId);
        if (rb_kp2.Checked)
        {
            if (address == null)
            {
                div_a.InnerHtml = "<script>alert('请选择邮寄地址')</script>"; return;
            }
            else
            {
                string addr = "邮寄地址：" + address.countryName + "&nbsp;" + address.provinceName + "&nbsp;"
            + address.cityName + "&nbsp;" + address.areaName + "&nbsp;" + address.nvc_StreetAddress + "&nbsp;(" + address.nvc_Consignee + "&nbsp;)收"
            + "<br />联系电话：" + address.nvc_MobilePhone + "&nbsp;&nbsp;" + address.nvc_TelPhone + "<br />邮编编码：" + address.nvc_ZipCode + "<br />电子邮箱：" + address.nvc_Email;
                OrderModer.nvc_PostAddress = addr;
                OrderModer.nvc_FaPiaoTaiTou = txt_fptt.Value;
            }
        }

        OrderModer.nvc_OrderNumber = "Z" + ((DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000).ToString();
        OrderModer.i_UserId = uId;
        OrderModer.i_Status = 1;
        OrderModer.dm_TotalMoney = Convert.ToDecimal(Hi_Total2.Value);
        OrderModer.dm_SetMoney = moneyTotal;
        OrderModer.dm_CouponMoney = 0;//订单已支付金额

        OrderModer.dm_SetMoney = dm_guanfee;
        OrderModer.dm_AgentServiceFee = dm_dailifee;
        OrderModer.dm_RemittanceFee = dm_shouxufee;
        OrderModer.dm_ChaoXiangFee = dm_chaoxiangfee;
        OrderModer.dm_ZhiNaJin = dm_zhinajin;
        OrderModer.dm_InvoiceMoney = Convert.ToDecimal(hi_piaoju.Value);
        OrderModer.dt_AddTime = DateTime.Now;
        OrderModer.i_IsFaPiao = rb_kp2.Checked == true ? 1 : 0;

        //OrderModer.i_IsYouJi = checkyj.Checked == true ? 1 : 0;
        OrderModer.nvc_CurrencyType = hi_paybizhong.Value;
        int yjfs = OrderModer.i_IsYouJi;
        if (radio_add25.Checked == true)
        {
            yjfs = 1;
            OrderModer.dm_PsMoney = psfee;
        }
        OrderModer.i_YouJiType = yjfs;
        if (OrderModer.i_IsYouJi == 1 && DALM.Member_Select_Id(uId).i_GuoJiId != 1)
        {
            OrderModer.dm_PsMoney = 400;
        }
        if (input_payway.Value == "网银支付")
        {
            OrderModer.nvc_PayType = input_payway.Value;
            if (bank.Value == "")
            {
                div_a.InnerHtml = "<script>alert('请选择支付银行')</script>";
                return;
            }
            OrderModer.nvc_Bank = bank.Value;
        }
        else
        {
            OrderModer.nvc_PayType = input_payway.Value;
        } 

        #region 银行
        if (OrderModer.nvc_PayType == "线下汇款")
        {
            if (bankId.IndexOf(',') > -1)
            {

                string s = "";
                for (int i = 0; i < bankId.Split(',').Length - 1; i++)
                {
                    t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(bankId.Split(',')[i]));
                    if (tb != null)
                    {
                        if (rb_kp2.Checked == true)
                        {
                            if (tb.i_FaPiao == 1)
                            {
                                s += bankId.Split(',')[i] + ",";
                            }
                        }
                        else
                        {
                            if (tb.i_FaPiao == 0)
                            {
                                s += bankId.Split(',')[i] + ",";
                            }
                        }
                    }
                }
                OrderModer.nvc_BankId = s.Substring(0, s.Length - 1);
            }
            else
            {
                OrderModer.nvc_BankId = bankId;
            }
        }
        #endregion
        #region 优惠券
        if (rp_youhui.Items.Count > 0)
        {
            string flag = Request.Form["inputPageid"];
            string youhui = "";
            decimal youhuifee = 0;
            if (flag != null && flag != "")
            {
                string[] flaglist = flag.Split(',');

                for (int j = 0; j < flaglist.Length; j++)
                {
                    if (flaglist[j] != "" || flaglist[j] != null)
                    {

                        vw_Coupon t = DALC.Coupon_Select_Vw_Id(int.Parse(flaglist[j]));
                        t_Coupon tc = DALC.Coupon_Select_Id(int.Parse(flaglist[j]));
                        if (t != null && tc != null)
                        {
                            youhui += "+" + t.nvc_Name + hi_paybizhong.Value + t.i_Money;
                            youhuifee += decimal.Parse(t.i_Money.ToString());

                            tc.i_State = 2;
                            DALC.Coupon_Update(tc);
                        }
                    }
                }
                //OrderModer.i_IsUseYHQ = 1;
                //OrderModer.dm_YouHuiFee = youhuifee;
            }
            OrderModer.nvc_YouHUiQuan = youhui.TrimStart('+');
            OrderModer.dm_YouHui = Convert.ToDecimal(Hi_youhui.Value);
            OrderModer.nvc_YouHuiId = flag;
        }
        #endregion
        DALPO.PatentOrder_Add(OrderModer);
        #region 生成订单详情
        if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
        {  
            string patentid = Request.Cookies["hqht_patentidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            string shuzu = ",";
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    int pid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    int number = Convert.ToInt32(arr_pid[i].Split(',')[1]);
                    t_Patent model = DALP.Patent_Select_Id(pid);
                    if (model != null)
                    {
                        #region
                        t_PatentOrderInfo InfoModer = new t_PatentOrderInfo();
                        InfoModer.i_OrderId = OrderModer.i_Id;
                        InfoModer.i_PatentId = model.i_Id;
                        InfoModer.nvc_Year = model.nvc_AnnualFeeNotPaymentYear;//代缴年度

                        InfoModer.dm_ZhengFuGuiDingFei = model.dm_AnnualFeeNextPaymentMoney;
                        if (shuzu.IndexOf("," + model.i_AuthorizeNationalityId + ",") < 0)//授权国一样的话 只计算一次汇款手续费
                        {
                            InfoModer.dm_HuiKuanShouXuFei = model.dm_RemittanceFee;
                            InfoModer.dm_TotalMoney = model.dm_FeeSubtotal;
                            InfoModer.dm_HuiKuanShouXuFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_RemittanceFee, model.nvc_CurrencyType, hi_paybizhong.Value);
                            InfoModer.dm_TotalMoney1 = DALPO.GetPayMoneyByHuiLv(model.dm_FeeSubtotal, model.nvc_CurrencyType, hi_paybizhong.Value);
                            if (model.dm_RemittanceFee > 0)//手续费大于0再加进去
                            {
                                shuzu += model.i_AuthorizeNationalityId + ",";
                            }
                        }
                        else
                        {
                            InfoModer.dm_HuiKuanShouXuFei = 0;
                            InfoModer.dm_TotalMoney = model.dm_FeeSubtotal - model.dm_RemittanceFee;
                            InfoModer.dm_HuiKuanShouXuFei1 = 0;
                            InfoModer.dm_TotalMoney1 = DALPO.GetPayMoneyByHuiLv(model.dm_FeeSubtotal - model.dm_RemittanceFee, model.nvc_CurrencyType, hi_paybizhong.Value);
                        }
                        InfoModer.dm_DaiLiFuWuFei = model.dm_AgentServiceFee;
                        InfoModer.dm_ChaoXiangFei = model.dm_ChaoXiangFee;
                        InfoModer.dm_ZhiNaJin = Convert.ToDecimal(model.nvc_ZhiNaJin);
                        InfoModer.nvc_BiZhong = model.nvc_CurrencyType;

                        InfoModer.dm_ZhengFuGuiDingFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_AnnualFeeNextPaymentMoney, model.nvc_CurrencyType, hi_paybizhong.Value);
                        InfoModer.dm_DaiLiFuWuFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_AgentServiceFee, model.nvc_CurrencyType, hi_paybizhong.Value);
                        InfoModer.dm_ChaoXiangFei1 = DALPO.GetPayMoneyByHuiLv(model.dm_ChaoXiangFee, model.nvc_CurrencyType, hi_paybizhong.Value);
                        InfoModer.dm_ZhiNaJin1 = DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(model.nvc_ZhiNaJin), model.nvc_CurrencyType, hi_paybizhong.Value);
                        InfoModer.nvc_BiZhong1 = hi_paybizhong.Value;

                        InfoModer.nvc_PatentNumber = model.nvc_Number;
                        InfoModer.nvc_PatentName = model.nvc_Name;
                        InfoModer.nvc_PatentShouQuanGuo = DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_Name;
                        InfoModer.dt_PatentJiaoFeeQiXian = model.dt_AnnualFeeNextYear;
                        InfoModer.i_PatentShouQuanGuoId = model.i_AuthorizeNationalityId;
                        InfoModer.nvc_AnJuanNum = model.nvc_AnJuanNum;
                        DALPOI.PatentOrderInfo_Add(InfoModer);
                        #endregion

                        #region 更新当前订单中专利的缴费状态
                        if (OrderModer.nvc_PayType == "线下汇款")
                        {
                            model.i_AnnualFeeStatus = 8;
                        }
                        else
                        {
                            model.i_AnnualFeeStatus = 7;
                        }
                        DALP.Patent_Update(model);
                        #endregion
                    }
                }
            }
            t_SystemSetup ts = DALS.SystemSetup_Select();
            if (ts != null)
            {
                OrderModer.i_JiFen = DALPOI.PatentOrderInfo_Select_Count(OrderModer.i_Id) * ts.i_ZlIntergral;
                DALPO.PatentOrder_Update(OrderModer);
            }
            

            Response.Cookies["hqht_patentidstr"].Value = ""; //清空Cookies
            UserLog.AddUserLog(uId, "专利系统", "提交专利订单");
            #region 发送订单提醒邮件邮件
            #region 邮件中的专利清单和费用
            StringBuilder strzl = new StringBuilder();
            StringBuilder zongji = new StringBuilder();

            strzl.Append("<table width='96%' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
            strzl.Append("<tr>");
            strzl.Append("<td height='35' align='center' bgcolor='#FFFFFF'>专利号</td>");
            strzl.Append("<td width='12%' align='center' bgcolor='#FFFFFF'>专利名称</td>");
            strzl.Append("<td align='center' bgcolor='#FFFFFF'>专利权人</td>");
            strzl.Append("<td align='center' bgcolor='#FFFFFF'>授权国</td>");
            strzl.Append("<td align='center' bgcolor='#FFFFFF'>缴费年度</td>");
            strzl.Append("<td  align='center' bgcolor='#FFFFFF'>缴费期限</td>");
            strzl.Append("<td align='center' bgcolor='#FFFFFF'>缴费金额</td>");
            strzl.Append("<td  align='center' bgcolor='#FFFFFF'>币种</td>");
            strzl.Append("<td align='center' bgcolor='#FFFFFF'>案卷号</td>");
            strzl.Append("</tr>");
            strzl.Append(sb_patent_1.ToString());
            strzl.Append("</table>");


            zongji.Append("<table width='415' cellspacing='0' cellpadding='0' border='0'><tbody>");
            zongji.Append("<tr><td valign='top' height='59' align='right' style='line-height: 22px;'>");
            zongji.Append("<table><tbody>");
            zongji.Append("<tr><td height='59' align='right'>");


            zongji.Append("<table width='440' cellspacing='0' cellpadding='0' border='0'><tbody>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 官费：</td><td width='110'>" + OrderModer.dm_SetMoney.ToString("0.00") + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 滞纳金：</td><td width='110'>" + OrderModer.dm_ZhiNaJin + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 代理费：</td><td width='110'>" + OrderModer.dm_AgentServiceFee.ToString("0.00") + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 超项费：</td><td width='110'>" + OrderModer.dm_ChaoXiangFee.ToString("0.00") + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'></td><td width='110'>小计：</td><td width='30' style='color: red;'>" + OrderModer.nvc_CurrencyType + "</td><td style='width: 100px;color: red;'>" + (Convert.ToDecimal(OrderModer.dm_SetMoney + OrderModer.dm_AgentServiceFee + OrderModer.dm_ChaoXiangFee + OrderModer.dm_ZhiNaJin)).ToString("0.00") + "</td>");
            zongji.Append("</tr>");
            zongji.Append("</tbody></table>");

            zongji.Append("<table width='440' cellspacing='0' cellpadding='0' border='0'><tbody>");
            if (OrderModer.dm_YouHui != 0)
            {
                zongji.Append("<tr align='left'>");
                zongji.Append("<td width='200' align='right'> 使用优惠劵：</td><td width='110'>" + OrderModer.dm_YouHui + "</td><td width='30'></td><td style='width: 100px;'></td>");
                zongji.Append("</tr>");
            }
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 汇款手续费：</td><td width='110'>" + OrderModer.dm_RemittanceFee + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 邮寄费：</td><td width='110'>" + OrderModer.dm_PsMoney + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'> 增值税：</td><td width='110'>" + OrderModer.dm_InvoiceMoney + "</td><td width='30'></td><td style='width: 100px;'></td>");
            zongji.Append("</tr>");
            zongji.Append("</tbody></table>");

            zongji.Append("<table width='440' cellspacing='0' cellpadding='0' border='0'><tbody>");
            zongji.Append("<tr align='left'>");
            zongji.Append("<td width='200' align='right'></td><td width='110'>总计：</td><td width='30' style='color: red;'>" + OrderModer.nvc_CurrencyType + "</td><td style='width: 100px;color: red;'>" + OrderModer.dm_TotalMoney.ToString("0.00") + "</td>");
            zongji.Append("</tr>");
            zongji.Append("</tbody></table>");

            zongji.Append("</td><td width='30'></td></tr>");
            zongji.Append("</tbody></table>");
            zongji.Append("</td></tr>");
            zongji.Append("</tbody></table>");
            #endregion
            string language = "cn";
            //t_SystemKey tsk = DALSK.SystemKey_Select_Key("i_ZlStatus11", language);
            //tsk = DALSK.SystemKey_Select_Key("nvc_ZlStatus11", language);
            //int fasong = tsk.i_Value;
            string str = InfoContent.Value;
            t_Member tm = DALM.Member_Select_Id(uId);
            str = str.Replace("$order_num", OrderModer.nvc_OrderNumber);
            str = str.Replace("$order_date", OrderModer.dt_AddTime.ToString());
            str = str.Replace("$order_type", "专利订单");
            str = str.Replace("$order_stat", DALPO.GetStatus(OrderModer.i_Status));
            str = str.Replace("$user_num", tm.nvc_UserNum);
            str = str.Replace("$true_name", tm.nvc_RealName);
            str = str.Replace("$user_counrtyInfo", DALN.Nationality_Select_Id(tm.i_GuoJiId).nvc_Name);
            str = str.Replace("$TplPatentData", strzl.ToString());
            str = str.Replace("$TplBank", yinhang.ToString());
            str = str.Replace("$tplSumData", zongji.ToString());
            str = str.Replace("$fp", OrderModer.i_IsFaPiao == 1 ? "是" : "否");
            str = str.Replace("$fMode", OrderModer.i_YouJiType == 0 ? "挂号信" : "快递");
            str = str.Replace("$fName", OrderModer.nvc_FaPiaoTaiTou);
            str = str.Replace("$orderDate", OrderModer.dt_AddTime.ToString());
            str = str.Replace("$tplSumData", OrderModer.dm_TotalMoney.ToString("0.00"));
            str = str.Replace("$limitDate ", Convert.ToDateTime(OrderModer.dt_AddTime).AddHours(24).ToString());
            #region 邮件中的银行信息
            if (OrderModer.nvc_BankId != null && OrderModer.nvc_BankId.ToString() != "")
            {
                yinhang.Append("<table width='600' border='0' cellspacing='1' cellpadding='0' style='background-color: #CCC;'>");
                yinhang.Append("<tr>");
                //yinhang.Append("<td width='25%' height='28' align='center' bgcolor='#FFFFFF'><strong>银行类型</strong></td>");
                yinhang.Append("<td width='40%' height='28' align='center' bgcolor='#FFFFFF'><strong>开户银行</strong></td>");
                yinhang.Append("<td width='30%' height='28' align='center' bgcolor='#FFFFFF'><strong>户名</strong></td>");
                yinhang.Append("<td width='30%' height='28' align='center' bgcolor='#FFFFFF'><strong>卡号</strong></td>");
                yinhang.Append("</tr>");
                for (int i = 0; i < OrderModer.nvc_BankId.Split(',').Length; i++)
                {
                    t_Bank tb = DALB.Bank_Select_Id(Convert.ToInt32(OrderModer.nvc_BankId.Split(',')[i]));
                    if (tb != null)
                    {
                        yinhang.Append("<tr>");
                        //yinhang.Append("<td width='25%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankName + "</td>");
                        yinhang.Append("<td width='40%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankDetails + "</td>");
                        yinhang.Append("<td width='30%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_AccountName + "</td>");
                        yinhang.Append("<td width='30%' height='28' align='center' bgcolor='#FFFFFF'>" + tb.nvc_BankNumber + "</td>");
                        yinhang.Append("</tr>");
                    }
                }
                yinhang.Append("</table>");
            }
            #endregion
            str = str.Replace("$bankInfo", yinhang.ToString());

            if (remail == 1)//如果会员接收邮件并且后台设置发送邮件
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", language);
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", language);
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", language);
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", language);
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", language);
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = tm.nvc_Email;//发送给谁（邮件地址）
                string send_fromtitle = "环球汇通-专利系统-订单提交成功";//标题
                string send_fromcontent = str;//内容
                string s = zscq.BLL.Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                #region 插入流水
                zscq.DAL.dal_Email DALE = new zscq.DAL.dal_Email();
                zscq.Model.t_EmailNote ten = new zscq.Model.t_EmailNote();
                ten.nvc_Email = send_fromto;
                ten.nvc_MemberName = tm.nvc_Name;
                ten.nvc_Title = send_fromtitle;
                ten.nvc_EmailContent = send_fromcontent;
                ten.nvc_EmailState = s;
                ten.i_systemType = 1;
                ten.i_MemberId = Convert.ToInt32(uId);
                ten.nvc_Language = "cn";
                DALE.EmailNote_Add(ten);
                #endregion
            }
            #endregion 
            Response.Redirect("User_PatentOrderAdd2.aspx?oNum=" + OrderModer.nvc_OrderNumber);
        }
        else
        {
            Response.Redirect("User_PatentList.aspx");
        }
        #endregion
        
        
        #endregion
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Response.Cookies["hqht_patentidstr"] != null)
        {
            Response.Cookies["hqht_patentidstr"].Value = ""; //清空Cookies
            Response.Redirect("User_PatentList.aspx");
        }
    }
    void Bind_PatentList()
    {
        if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
        {
            t_SystemSetup ts = DALS.SystemSetup_Select();
            string patentid = Request.Cookies["hqht_patentidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            string shuzu = ",", shuzu2 = ",";
            decimal zengzhifee = 0;
            decimal huikuanshouxufee = 0;
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    zengjifen = zengjifen + ts.i_ZlIntergral;
                    int pid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    int number = Convert.ToInt32(arr_pid[i].Split(',')[1]);
                    t_Patent model = DALP.Patent_Select_Id(pid);
                    //string tips = "";
                    #region
                    if (model != null)
                    {
                        zlnum++;
                        decimal dm_AnnualFeeNextPaymentMoney = DALPO.GetPayMoneyByHuiLv(model.dm_AnnualFeeNextPaymentMoney, model.nvc_CurrencyType, hi_paybizhong.Value);
                        decimal dm_ZhiNaJin = DALPO.GetPayMoneyByHuiLv(Convert.ToDecimal(model.nvc_ZhiNaJin), model.nvc_CurrencyType, hi_paybizhong.Value);
                        decimal dm_ChaoXiangFee = DALPO.GetPayMoneyByHuiLv(model.dm_ChaoXiangFee, model.nvc_CurrencyType, hi_paybizhong.Value);
                        decimal dm_RemittanceFee = DALPO.GetPayMoneyByHuiLv(model.dm_RemittanceFee, model.nvc_CurrencyType, hi_paybizhong.Value);
                        decimal dm_AgentServiceFee = DALPO.GetPayMoneyByHuiLv(model.dm_AgentServiceFee, model.nvc_CurrencyType, hi_paybizhong.Value);

                        sb_patent.Append("<tr>");
                        sb_patent.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + model.nvc_Number + "</td>");
                        sb_patent.Append("<td align='center' bgcolor='#FFFFFF'>" + DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_Name + "</td>");
                        sb_patent.Append("<td align='center' bgcolor='#FFFFFF'>" + model.nvc_AnnualFeeNotPaymentYear + "</td>");
                        sb_patent.Append("<td align='center' bgcolor='#FFFFFF'>" + Convert.ToDateTime(model.dt_AnnualFeeNextYear).ToString("yyyy-MM-dd") + "</td>");
                        if (shuzu.IndexOf("," + model.i_AuthorizeNationalityId + ",") < 0)
                        {
                            decimal subtotal = dm_AnnualFeeNextPaymentMoney + dm_ZhiNaJin + dm_ChaoXiangFee + dm_AgentServiceFee + +dm_RemittanceFee;
                            sb_patent.Append("<td align='center' bgcolor='#FFFFFF'><a href='Box.aspx?height=100&width=610&pId=" + model.i_Id + "&bizhong=" + hi_paybizhong.Value + "' class='thickbox'><u style='color:#cc0000'>" + subtotal + "</u></a></td>");
                        }
                        else
                        {
                            decimal subtotal = dm_AnnualFeeNextPaymentMoney + dm_ZhiNaJin + dm_ChaoXiangFee + dm_AgentServiceFee;
                            sb_patent.Append("<td align='center' bgcolor='#FFFFFF'><a href='Box.aspx?height=100&width=610&IsHave=true&pId=" + model.i_Id + "&bizhong=" + hi_paybizhong.Value + "' class='thickbox'><u style='color:#cc0000'>" + subtotal + "</u></a></td>");
                        }
                        sb_patent.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + hi_paybizhong.Value + "</td>");
                        sb_patent.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + model.nvc_AnJuanNum + "</td>");
                        sb_patent.Append("<td align='center' bgcolor='#FFFFFF'><a href='User_PatentInfo.aspx?pId=" + pid + "&href=" + href + "' class='ac5t'>查看</a> <a href=" + "'?pagetype=del&cs=" + pid + "," + number + "' class='ac5t'>删除</a></td>");
                        sb_patent.Append("</tr>");

                        #region 邮件中替换的专利信息表格
                        sb_patent_1.Append("<tr>");
                        sb_patent_1.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + model.nvc_Number + "</td>");
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + model.nvc_Name + "</td>");
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + model.nvc_PatentHolder + "</td>");
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF'>" + DALN.Nationality_Select_Id(model.i_AuthorizeNationalityId).nvc_Name + "</td>");
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF'>" + model.nvc_AnnualFeeNotPaymentYear + "</td>");
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF'>" + Convert.ToDateTime(model.dt_AnnualFeeNextYear).ToString("yyyy-MM-dd") + "</td>");
                        if (shuzu.IndexOf("," + model.i_AuthorizeNationalityId + ",") < 0)
                        {
                            decimal subtotal = dm_AnnualFeeNextPaymentMoney + dm_ZhiNaJin + dm_ChaoXiangFee + dm_AgentServiceFee + +dm_RemittanceFee;
                            sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF'>" + subtotal + "</td>");
                        }
                        else
                        {
                            decimal subtotal = dm_AnnualFeeNextPaymentMoney + dm_ZhiNaJin + dm_ChaoXiangFee + dm_AgentServiceFee;
                            sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF'>" + subtotal + "</td>");
                        }
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + hi_paybizhong.Value + "</td>");
                        sb_patent_1.Append("<td align='center' bgcolor='#FFFFFF' class='tooltip'>" + model.nvc_AnJuanNum + "</td>");
                        sb_patent_1.Append("</tr>");
                        #endregion

                        moneytype = model.nvc_CurrencyType;
                        hi_bizhong.Value = model.nvc_CurrencyType;

                        dm_guanfee += dm_AnnualFeeNextPaymentMoney;
                        dm_dailifee += dm_AgentServiceFee;
                        dm_chaoxiangfee += dm_ChaoXiangFee;
                        dm_zhinajin += dm_ZhiNaJin;
                        huikuanshouxufee += dm_RemittanceFee;

                        moneyTotal += dm_AnnualFeeNextPaymentMoney + dm_AgentServiceFee + dm_ChaoXiangFee + dm_ZhiNaJin + dm_RemittanceFee;

                        moneyTotal2 = moneyTotal;
                        moneytype2 = model.nvc_CurrencyType;

                        if (shuzu.IndexOf("," + model.i_AuthorizeNationalityId + ",") < 0)//授权国一样的话 只计算一次汇款手续费
                        {
                            dm_shouxufee += DALPO.GetPayMoneyByHuiLv(model.dm_RemittanceFee, moneytype, hi_paybizhong.Value);
                            if (model.dm_RemittanceFee > 0)//手续费大于0再加进去
                            {
                                shuzu += model.i_AuthorizeNationalityId + ",";
                            }
                        }
                        //国外才会手续增值税
                        if (model.i_AuthorizeNationalityId != 1)
                        {
                            if (shuzu2.IndexOf("," + model.i_AuthorizeNationalityId + ",") < 0)
                            {
                                //税率=(（官费+代理费+汇款手续费+滞纳金+超项费）换算成人民币-200 )*33/1000
                                zengzhifee += (DALPO.GetPayMoneyByHuiLv(model.dm_FeeSubtotal, moneytype, "CNY") - 200) * 33 / 1000;
                                shuzu2 += model.i_AuthorizeNationalityId + ",";
                            }
                            else
                            {
                                zengzhifee += (DALPO.GetPayMoneyByHuiLv((model.dm_FeeSubtotal - Convert.ToDecimal(model.dm_RemittanceFee)), moneytype, "CNY") - 200) * 33 / 1000;
                            }
                        }
                        //有个问题：同一授权国下的几个专利汇款手续费不一样的时候按哪个来
                    }
                    #endregion
                }
            }
            moneyTotal = moneyTotal - huikuanshouxufee + dm_shouxufee;
            moneyTotal2 = moneyTotal;
            Hi_Total.Value = moneyTotal.ToString("0.00");
            hi_zengzhifee.Value = zengzhifee.ToString("0.00");
            psfee = DALPO.GetPayMoneyByHuiLv(psfee, "CNY", hi_paybizhong.Value);
        }
        else
        {
            Response.Redirect("User_PatentList.aspx");
        }
    }
    void Delete_Patent()
    {
        if (Request["pagetype"] != null && Request["pagetype"].ToString() != "")
        {
            if (Request["pagetype"].ToString() == "del")
            {
                if (Request.Cookies["hqht_patentidstr"] != null && Request.Cookies["hqht_patentidstr"].Value != "")
                {
                    string sid = Request["cs"].ToString();
                    string pids = Request.Cookies["hqht_patentidstr"].Value;
                    pids = pids.Replace("|" + sid, "");
                    Response.Cookies["hqht_patentidstr"].Value = pids;
                    Response.Redirect("User_PatentOrderAdd1.aspx");
                }
            }
        }
    }
    void Bind_Drp_YouHuiQuan()
    {
        var iquery = DALC.Coupon_Select_Page_MemberYouHui(1, 100, uId, ref count);
        if (count > 0)
        {
            foreach (var q in iquery)
            {
                rp_youhui.DataSource = iquery;
                rp_youhui.DataBind();
            }
        }
        else
        {
            table_yhq1.Visible = false;
            table_yhq2.Visible = false;
        }
    }
    void Bind_Page_PayWay()//绑定支付方式
    {
        int shu = 0;
        var iquery = DALPY.PayWay_Select_All();
        foreach (var q in iquery)
        {
            shu++;
            string ischeck = "";
            string s = "";
            if (shu == 1)
            {
                s = "checked";
            }
            string img = "";
            string info = "";
            if (q.nvc_Name == "支付宝支付")
            {
                img = "&nbsp;&nbsp;<img alt=\"\" border=\"0\" src=\"images/orderimg1.jpg\">";
                info = "推荐淘宝用户使用!";
            }
            else if (q.nvc_Name == "财付通支付")
            {
                img = "&nbsp;&nbsp;<img alt=\"\" border=\"0\" src=\"images/orderimg2.jpg\">";
                info = "推荐腾讯拍拍用户使用";
            }
            tr_PayWay.Append("<tr class=\"orderxx\"><td height=\"3%\" align=\"left\" valign=\"middle\">");
            tr_PayWay.Append("<input id=\"payway" + shu + "\" name=\"payway\" type=\"radio\" onclick=\"change();checkpay(0);\" value=\"" + q.nvc_Name + "," + q.nt_Explain + "\"" + ischeck + " " + s + "/></td>");
            tr_PayWay.Append("<td colspan=\"4\">" + img + "</td>");
            tr_PayWay.Append("<td width=\"75%\">&nbsp;&nbsp;<label for=\"payway" + shu + "\">" + info + "</label></td></tr>");
        }
    }
    string Bind_Rpt_BankList(int guoji)
    {
        string s = "";
        IQueryable<t_Bank> iquery = DALB.Bank_Select_FaPiaoAndGuoJi(guoji);
        Rpt_BankList.DataSource = iquery;
        Rpt_BankList.DataBind();
        foreach (var i in iquery)
        {
            s += i.i_Id + ",";
        }
        return s;
    }
}