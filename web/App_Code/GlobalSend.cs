using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using zscq.BLL;
using zscq.DAL;
using zscq.Model;

/// <summary>
///GlobalSend 的摘要说明
/// </summary>
public class GlobalSend
{
    dal_SystemKey DALSK = new dal_SystemKey();
    dal_Patent DALP = new dal_Patent();
    dal_PatentOrder DALPO = new dal_PatentOrder();
    dal_Member DALM = new dal_Member();
    dal_Email DALE = new dal_Email();
    dal_Nationality DALN = new dal_Nationality();
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_UserGrade DALUG = new dal_UserGrade();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    bll_Message BLLMS = new bll_Message();
    dal_Message dalm = new dal_Message();
    Note.ChinaSms noteSms = new Note.ChinaSms();
    DateTime dt = DateTime.Now;
    /// <summary>
    /// 专利状态邮件提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    public void SendEmail_Patent(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            t_SystemKey model_2 = DALSK.SystemKey_Select_Key(key, "en");
            t_SystemKey model_3 = DALSK.SystemKey_Select_Key(key, "jp");
            t_SystemKey model_4 = DALSK.SystemKey_Select_Key(key, "kr");

            #region 中文
            if (model_1.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "cn");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "cn");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "cn");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "cn");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "cn");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "专利期限提醒";//标题
                string send_fromcontent = "";//内容
                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(1, "cn", 1);//需要发送邮件的专利客户
                if (iquery.Count() > 0)
                {
                    StringBuilder sb_start = new StringBuilder();
                    StringBuilder sb_body = new StringBuilder();
                    StringBuilder sb_end = new StringBuilder();
                    string paybizhong = string.Empty;
                    IQueryable<t_Patent> test = null;
                    IQueryable<t_Patent> result = null;
                    string neirong = string.Empty;
                    string youxiang = string.Empty;
                    string[] ArrEmail = null;
                    string returns = string.Empty;
                    t_Patent tp = null;
                    t_EmailNote ten = null;
                    foreach (var v in iquery)
                    {
                        paybizhong = DALN.Nationality_Select_Id(DALM.Member_Select_Id(v.i_Id).i_GuoJiId).nvc_JFBizhong;
                        sb_start.Clear();
                        sb_body.Clear();
                        sb_end.Clear();
                        sb_start.Append("<table width='96%' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td height='35' align='center' bgcolor='#FFFFFF'>专利号</td>");
                        sb_start.Append("<td width='12%' align='center' bgcolor='#FFFFFF'>专利名称</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>专利权人</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>授权国</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>缴费年度</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>缴费期限</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>所剩天数</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>缴费金额</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>币种</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>案卷号</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>联系人</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");

                        test = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        foreach (var t in test)
                        {
                            DALP.EditPatentFee(t);//先更新费用
                        }
                        result = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        if (result.Count() > 0)
                        {
                            foreach (var i in result)
                            {
                                sb_body.Append("<tr>");
                                sb_body.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_Number + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_Name + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_PatentHolder + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALN.Nationality_Select_Id(i.i_AuthorizeNationalityId).nvc_Name + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.nvc_AnnualFeeNotPaymentYear + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + Convert.ToDateTime(i.dt_AnnualFeeNextYear).ToString("yyyy-MM-dd") + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.i_AnnualFeeRestDay + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALPO.GetPayMoneyByHuiLv(i.dm_FeeSubtotal, i.nvc_CurrencyType, paybizhong) + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_AnJuanNum + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_LinkMan + "</td>");
                                sb_body.Append("</tr>");
                            }
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            ArrEmail = youxiang.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                            returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                //所有的邮箱发送完之后再修改状态
                                send_fromto = ArrEmail[j];
                                returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                #region 插入流水
                                ten = new t_EmailNote();
                                ten.nvc_Email = send_fromto;
                                ten.nvc_MemberName = v.nvc_Name;
                                ten.nvc_Title = send_fromtitle;
                                ten.nvc_EmailContent = neirong;
                                ten.nvc_EmailState = returns;
                                ten.i_systemType = 1;
                                ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                ten.nvc_Language = "cn";
                                DALE.EmailNote_Add(ten);
                                #endregion
                            }
                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                tp = DALP.Patent_Select_Id(r.i_Id);
                                if (tp != null)
                                {
                                    tp.i_SendEmail = status;
                                    DALP.Patent_Update(tp);
                                }
                            }
                            //}
                        }
                    }
                }
            }
            #endregion

            #region 英文
            if (model_2.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "en");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "en");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "en");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "en");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "en");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "Patent term remind";//标题
                string send_fromcontent = "";//内容
                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "en");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(1, "en", 1);//需要发送邮件的专利客户
                if (iquery.Count() > 0)
                {
                    StringBuilder sb_start = new StringBuilder();
                    StringBuilder sb_body = new StringBuilder();
                    StringBuilder sb_end = new StringBuilder();
                    string paybizhong = string.Empty;
                    IQueryable<t_Patent> test = null;
                    IQueryable<t_Patent> result = null;
                    string neirong = string.Empty;
                    string youxiang = string.Empty;
                    string[] ArrEmail = null;
                    string returns = string.Empty;
                    t_Patent tp = null;
                    t_EmailNote ten = null;
                    foreach (var v in iquery)
                    {
                        paybizhong = DALN.Nationality_Select_Id(DALM.Member_Select_Id(v.i_Id).i_GuoJiId).nvc_JFBizhong;
                        sb_start.Clear();
                        sb_body.Clear();
                        sb_end.Clear();
                        sb_start.Append("<table width='96%' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td height='35' align='center' bgcolor='#FFFFFF'>Patent number</td>");
                        sb_start.Append("<td width='12%' align='center' bgcolor='#FFFFFF'>Title of patent</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Patentee</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Country of patent</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Annuity year</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Deadline of payment</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Days before the deadline</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Subtotal</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Currency</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Reference number</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>Contact person</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");

                        test = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        foreach (var t in test)
                        {
                            DALP.EditPatentFee(t);//先更新费用
                        }
                        result = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        if (result.Count() > 0)
                        {
                            foreach (var i in result)
                            {
                                sb_body.Append("<tr>");
                                sb_body.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_Number + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_Name + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_PatentHolder + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALN.Nationality_Select_Id(i.i_AuthorizeNationalityId).nvc_EnName + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.nvc_AnnualFeeNotPaymentYear + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + Convert.ToDateTime(i.dt_AnnualFeeNextYear).ToString("yyyy-MM-dd") + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.i_AnnualFeeRestDay + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALPO.GetPayMoneyByHuiLv(i.dm_FeeSubtotal, i.nvc_CurrencyType, paybizhong) + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_AnJuanNum + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_LinkMan + "</td>");
                                sb_body.Append("</tr>");
                            }
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            ArrEmail = youxiang.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                            returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                //所有的邮箱发送完之后再修改状态
                                send_fromto = ArrEmail[j];
                                returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                #region 插入流水
                                ten = new t_EmailNote();
                                ten.nvc_Email = send_fromto;
                                ten.nvc_MemberName = v.nvc_Name; 
                                ten.nvc_Title = send_fromtitle;
                                ten.nvc_EmailContent = neirong;
                                ten.nvc_EmailState = returns;
                                ten.i_systemType = 1;
                                ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                ten.nvc_Language = "en";
                                DALE.EmailNote_Add(ten);
                                #endregion
                            }
                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                tp = DALP.Patent_Select_Id(r.i_Id);
                                if (tp != null)
                                {
                                    tp.i_SendEmail = status;
                                    DALP.Patent_Update(tp);
                                }
                            }
                            //}
                        }
                    }
                }
            }
            #endregion

            #region 日文
            if (model_3.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "jp");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "jp");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "jp");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "jp");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "jp");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "特許期間に注意";//标题
                string send_fromcontent = "";//内容
                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "jp");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(1, "jp", 1);//需要发送邮件的专利客户
                if (iquery.Count() > 0)
                {
                    StringBuilder sb_start = new StringBuilder();
                    StringBuilder sb_body = new StringBuilder();
                    StringBuilder sb_end = new StringBuilder();
                    string paybizhong = string.Empty;
                    IQueryable<t_Patent> test = null;
                    IQueryable<t_Patent> result = null;
                    string neirong = string.Empty;
                    string youxiang = string.Empty;
                    string[] ArrEmail = null;
                    string returns = string.Empty;
                    t_Patent tp = null;
                    t_EmailNote ten = null;
                    foreach (var v in iquery)
                    {
                        paybizhong = DALN.Nationality_Select_Id(DALM.Member_Select_Id(v.i_Id).i_GuoJiId).nvc_JFBizhong;
                        sb_start.Clear();
                        sb_body.Clear();
                        sb_end.Clear();
                        sb_start.Append("<table width='96%' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td height='35' align='center' bgcolor='#FFFFFF'>特許番号</td>");
                        sb_start.Append("<td width='12%' align='center' bgcolor='#FFFFFF'>特許名称</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>特許権利人</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>授権国</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>納付待ち年度</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>年金納付期限</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>殘り日数</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>小計</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>貨幣</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>公文書番号</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>連絡者</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");

                        test = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        foreach (var t in test)
                        {
                            DALP.EditPatentFee(t);//先更新费用
                        }
                        result = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        if (result.Count() > 0)
                        {
                            foreach (var i in result)
                            {
                                sb_body.Append("<tr>");
                                sb_body.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_Number + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_Name + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_PatentHolder + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALN.Nationality_Select_Id(i.i_AuthorizeNationalityId).nvc_JpanName + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.nvc_AnnualFeeNotPaymentYear + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + Convert.ToDateTime(i.dt_AnnualFeeNextYear).ToString("yyyy-MM-dd") + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.i_AnnualFeeRestDay + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALPO.GetPayMoneyByHuiLv(i.dm_FeeSubtotal, i.nvc_CurrencyType, paybizhong) + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_AnJuanNum + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_LinkMan + "</td>");
                                sb_body.Append("</tr>");
                            }
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            ArrEmail = youxiang.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                            returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                //所有的邮箱发送完之后再修改状态
                                send_fromto = ArrEmail[j];
                                returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                #region 插入流水
                                ten = new t_EmailNote();
                                ten.nvc_Email = send_fromto;
                                ten.nvc_MemberName = v.nvc_Name; 
                                ten.nvc_Title = send_fromtitle;
                                ten.nvc_EmailContent = neirong;
                                ten.nvc_EmailState = returns;
                                ten.i_systemType = 1;
                                ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                ten.nvc_Language = "jp";
                                DALE.EmailNote_Add(ten);
                                #endregion
                            }
                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                tp = DALP.Patent_Select_Id(r.i_Id);
                                if (tp != null)
                                {
                                    tp.i_SendEmail = status;
                                    DALP.Patent_Update(tp);
                                }
                            }
                            //}
                        }
                    }
                }
            }
            #endregion

            #region 韩文
            if (model_4.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "kr");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "kr");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "kr");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "kr");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "kr");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "특허권 기한이 알림";//标题
                string send_fromcontent = "";//内容
                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "kr");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(1, "kr", 1);//需要发送邮件的专利客户
                if (iquery.Count() > 0)
                {
                    StringBuilder sb_start = new StringBuilder();
                    StringBuilder sb_body = new StringBuilder();
                    StringBuilder sb_end = new StringBuilder();
                    string paybizhong = string.Empty;
                    IQueryable<t_Patent> test = null;
                    IQueryable<t_Patent> result = null;
                    string neirong = string.Empty;
                    string youxiang = string.Empty;
                    string[] ArrEmail = null;
                    string returns = string.Empty;
                    t_Patent tp = null;
                    t_EmailNote ten = null;
                    foreach (var v in iquery)
                    {
                        paybizhong = DALN.Nationality_Select_Id(DALM.Member_Select_Id(v.i_Id).i_GuoJiId).nvc_JFBizhong;
                        sb_start.Clear();
                        sb_body.Clear();
                        sb_end.Clear();
                        sb_start.Append("<table width='96%' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td height='35' align='center' bgcolor='#FFFFFF'>특허번호</td>");
                        sb_start.Append("<td width='12%' align='center' bgcolor='#FFFFFF'>특허명칭</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>특허권자</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>특허등록한 국가</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>납부년도</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>납부기한일</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>나머지 일수</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>합계</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>외화종류</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>안건번호</td>");
                        sb_start.Append("<td align='center' bgcolor='#FFFFFF'>련락처</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");
                        test = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        foreach (var t in test)
                        {
                            DALP.EditPatentFee(t);//先更新费用
                        }
                        result = DALP.Patent_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的专利
                        if (result.Count() > 0)
                        {
                            foreach (var i in result)
                            {
                                sb_body.Append("<tr>");
                                sb_body.Append("<td height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_Number + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_Name + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_PatentHolder + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALN.Nationality_Select_Id(i.i_AuthorizeNationalityId).nvc_HanName + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.nvc_AnnualFeeNotPaymentYear + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + Convert.ToDateTime(i.dt_AnnualFeeNextYear).ToString("yyyy-MM-dd") + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + i.i_AnnualFeeRestDay + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + DALPO.GetPayMoneyByHuiLv(i.dm_FeeSubtotal, i.nvc_CurrencyType, paybizhong) + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_AnJuanNum + "</td>");
                                sb_body.Append("<td align='center' bgcolor='#FFFFFF' >" + i.nvc_LinkMan + "</td>");
                                sb_body.Append("</tr>");
                            }
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            ArrEmail = youxiang.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                            returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                //所有的邮箱发送完之后再修改状态
                                send_fromto = ArrEmail[j];
                                returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                #region 插入流水
                                ten = new t_EmailNote();
                                ten.nvc_Email = send_fromto;
                                ten.nvc_MemberName = v.nvc_Name; 
                                ten.nvc_Title = send_fromtitle;
                                ten.nvc_EmailContent = neirong;
                                ten.nvc_EmailState = returns;
                                ten.i_systemType = 1;
                                ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                ten.nvc_Language = "kr";
                                DALE.EmailNote_Add(ten);
                                #endregion
                            }
                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                tp = DALP.Patent_Select_Id(r.i_Id);
                                if (tp != null)
                                {
                                    tp.i_SendEmail = status;
                                    DALP.Patent_Update(tp);
                                }
                            }
                            //}
                        }
                    }
                }
            }
            #endregion
        }
    }
    /// <summary>
    /// 专利订单状态提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    public void SendEmail_PatentOrder(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            t_SystemKey model_2 = DALSK.SystemKey_Select_Key(key, "en");
            t_SystemKey model_3 = DALSK.SystemKey_Select_Key(key, "jp");
            t_SystemKey model_4 = DALSK.SystemKey_Select_Key(key, "kr");

            #region 中文
            if (model_1.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "cn");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "cn");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "cn");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "cn");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "cn");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "专利订单状态提醒";//标题
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_PatentOrder> iquery = DALPO.PatentOrder_Select_Status(status, "cn");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_MemberName);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_PatentOrder tpo = DALPO.PatentOrder_Select_Id(i.i_Id);
                        tpo.i_SendEmailOrder = status;
                        DALPO.PatentOrder_Update(tpo);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_MemberName;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 1;
                        ten.i_MemberId = Convert.ToInt32(i.i_UserId);
                        ten.nvc_Language = "cn";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion

            #region 英文
            if (model_2.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "en");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "en");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "en");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "en");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "en");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "专利订单状态提醒";//标题
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "en");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_PatentOrder> iquery = DALPO.PatentOrder_Select_Status(status, "en");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_MemberName);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_PatentOrder tpo = DALPO.PatentOrder_Select_Id(i.i_Id);
                        tpo.i_SendEmailOrder = status;
                        DALPO.PatentOrder_Update(tpo);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_MemberName;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 1;
                        ten.i_MemberId = Convert.ToInt32(i.i_UserId);
                        ten.nvc_Language = "en";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion

            #region 日文
            if (model_3.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "jp");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "jp");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "jp");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "jp");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "jp");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "专利订单状态提醒";//标题
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "jp");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_PatentOrder> iquery = DALPO.PatentOrder_Select_Status(status, "jp");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_MemberName);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_PatentOrder tpo = DALPO.PatentOrder_Select_Id(i.i_Id);
                        tpo.i_SendEmailOrder = status;
                        DALPO.PatentOrder_Update(tpo);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_MemberName;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 1;
                        ten.i_MemberId = Convert.ToInt32(i.i_UserId);
                        ten.nvc_Language = "jp";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion

            #region 韩文
            if (model_4.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "kr");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "kr");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "kr");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "kr");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "kr");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "专利订单状态提醒";//标题
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "kr");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_PatentOrder> iquery = DALPO.PatentOrder_Select_Status(status, "kr");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_MemberName);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_PatentOrder tpo = DALPO.PatentOrder_Select_Id(i.i_Id);
                        tpo.i_SendEmailOrder = status;
                        DALPO.PatentOrder_Update(tpo);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_MemberName;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 1;
                        ten.i_MemberId = Convert.ToInt32(i.i_UserId);
                        ten.nvc_Language = "kr";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion
        }
    }

    /// <summary>
    /// 商标期限提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    /// <param name="language"></param>
    public void SendEmail_SB(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            t_SystemKey model_2 = DALSK.SystemKey_Select_Key(key, "en");
            t_SystemKey model_3 = DALSK.SystemKey_Select_Key(key, "jp");
            t_SystemKey model_4 = DALSK.SystemKey_Select_Key(key, "kr");

            #region 中文
            if (model_1.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "cn");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "cn");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "cn");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "cn");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "cn");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "商标期限提醒";//标题
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(2, "cn", 1);//需要发送邮件的商标客户
                t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
                if (iquery.Count() > 0)
                {
                    foreach (var v in iquery)
                    {
                        StringBuilder sb_start = new StringBuilder();
                        StringBuilder sb_body = new StringBuilder();
                        StringBuilder sb_end = new StringBuilder();
                        int dazhe = 0, dazhe1 = 0;
                        #region 会员折扣 by chy
                        dazhe = v.i_PowerDaZhe;
                        t_MemberGrade tmg = DALUG.UserGrade_Select_Id(v.i_Grade);
                        if (tmg != null)
                        {
                            dazhe1 = Convert.ToInt32(tmg.i_Discount);
                        }
                        #endregion
                        sb_start.Append("<table width='600' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>商标注册号</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>商标类别</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>注册人姓名</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>到期日</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>缴费金额</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>币种</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");
                        IQueryable<t_Trademark> result = DALT.Trademark_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的商标
                        foreach (var i in result)
                        {
                            int sbnum = 0, sbdailinum = 0, zhinajinnum = 0;
                            string paybizhong = "CNY";
                            sbnum += 1;
                            if (i.i_JiaoFeiType == 2)
                            {
                                sbdailinum += 1;
                                if (i.i_ShengDays < 0)
                                {
                                    zhinajinnum += 1;
                                }
                            }
                            #region 会员折扣 by chy
                            decimal dalifee = model1.dm_TMDaiLi;
                            if (dazhe != 0)
                            {
                                dalifee = dalifee * dazhe / 100;
                            }
                            if (dazhe1 != 0)
                            {
                                dalifee = dalifee * dazhe1 / 100;
                            }
                            #endregion
                            string totalmoney = (((dalifee) * sbdailinum) + ((model1.dm_TrademarkMoney) * sbnum) + ((model1.dm_TMZhiNaJin) * zhinajinnum)).ToString("0.00");
                            t_Nationality na = DALN.Nationality_Select_Id(i.i_GuoJiId);
                            if (na != null)
                            {
                                paybizhong = na.nvc_JFBizhong;
                                if (na.nvc_Name != "中国")
                                {
                                    decimal huilv = 1;
                                    t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                                    if (nafee != null)
                                    {
                                        paybizhong = nafee.nvc_Currency;
                                        if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                        {
                                            huilv = nafee.dm_Exchange;
                                        }
                                    }
                                    totalmoney = ((((dalifee) * huilv) * sbdailinum) + (((model1.dm_TrademarkMoney) * huilv) * sbnum) + (((model1.dm_TMZhiNaJin) * huilv) * zhinajinnum)).ToString("0.00");
                                }
                            }
                            sb_body.Append("<tr>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBRegNum + "</td>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBType + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SBRegName + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SbDaoqiTime + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + totalmoney + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                            sb_body.Append("</tr>");

                        }
                        if (result.Count() > 0)
                        {
                            //=============================//
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            string neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            string youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            string[] ArrEmail = youxiang.Split('|');
                            string returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                if (ArrEmail[j] != null && ArrEmail[j] != "")
                                {
                                    //所有的邮箱发送完之后再修改状态
                                    send_fromto = ArrEmail[j];
                                    returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                    #region 插入流水
                                    t_EmailNote ten = new t_EmailNote();
                                    ten.nvc_Email = send_fromto;
                                    ten.nvc_MemberName = v.nvc_Name;
                                    ten.nvc_Title = send_fromtitle;
                                    ten.nvc_EmailContent = neirong;
                                    ten.nvc_EmailState = returns;
                                    ten.i_systemType = 2;
                                    ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                    ten.nvc_Language = "cn";
                                    DALE.EmailNote_Add(ten);
                                    #endregion
                                }
                            }

                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                t_Trademark tt = DALT.Trademark_Select_Id(r.i_Id);
                                tt.i_SendEmail = status;
                                DALT.Trademark_Update(tt);
                            }
                            //}
                        }
                    }
                }
            }
            #endregion

            #region 英文
            if (model_2.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "en");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "en");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "en");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "en");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "en");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "Reminder of trademark renewal deadline";//标题商标期限提醒
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "en");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(2, "en", 1);//需要发送邮件的商标客户
                t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
                if (iquery.Count() > 0)
                {
                    foreach (var v in iquery)
                    {
                        StringBuilder sb_start = new StringBuilder();
                        StringBuilder sb_body = new StringBuilder();
                        StringBuilder sb_end = new StringBuilder();
                        int dazhe = 0, dazhe1 = 0;
                        #region 会员折扣 by chy
                        dazhe = v.i_PowerDaZhe;
                        t_MemberGrade tmg = DALUG.UserGrade_Select_Id(v.i_Grade);
                        if (tmg != null)
                        {
                            dazhe1 = Convert.ToInt32(tmg.i_Discount);
                        }
                        #endregion
                        sb_start.Append("<table width='600' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>Trademark number</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>Class</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>Name</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>Due date</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>Total</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>Currency</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");
                        IQueryable<t_Trademark> result = DALT.Trademark_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的商标
                        foreach (var i in result)
                        {
                            int sbnum = 0, sbdailinum = 0, zhinajinnum = 0;
                            string paybizhong = "CNY";
                            sbnum += 1;
                            if (i.i_JiaoFeiType == 2)
                            {
                                sbdailinum += 1;
                                if (i.i_ShengDays < 0)
                                {
                                    zhinajinnum += 1;
                                }
                            }
                            #region 会员折扣 by chy
                            decimal dalifee = model1.dm_TMDaiLi;
                            if (dazhe != 0)
                            {
                                dalifee = dalifee * dazhe / 100;
                            }
                            if (dazhe1 != 0)
                            {
                                dalifee = dalifee * dazhe1 / 100;
                            }
                            #endregion
                            string totalmoney = (((dalifee) * sbdailinum) + ((model1.dm_TrademarkMoney) * sbnum) + ((model1.dm_TMZhiNaJin) * zhinajinnum)).ToString("0.00");
                            t_Nationality na = DALN.Nationality_Select_Id(i.i_GuoJiId);
                            if (na != null)
                            {
                                paybizhong = na.nvc_JFBizhong;
                                if (na.nvc_Name != "中国")
                                {
                                    decimal huilv = 1;
                                    t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                                    if (nafee != null)
                                    {
                                        paybizhong = nafee.nvc_Currency;
                                        if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                        {
                                            huilv = nafee.dm_Exchange;
                                        }
                                    }
                                    totalmoney = ((((dalifee) * huilv) * sbdailinum) + (((model1.dm_TrademarkMoney) * huilv) * sbnum) + (((model1.dm_TMZhiNaJin) * huilv) * zhinajinnum)).ToString("0.00");
                                }
                            }
                            sb_body.Append("<tr>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBRegNum + "</td>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBType + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SBRegName + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SbDaoqiTime + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + totalmoney + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                            sb_body.Append("</tr>");

                        }
                        if (result.Count() > 0)
                        {
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            string neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            string youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            string[] ArrEmail = youxiang.Split('|');
                            string returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                if (ArrEmail[j] != null && ArrEmail[j] != "")
                                {
                                    //所有的邮箱发送完之后再修改状态
                                    send_fromto = ArrEmail[j];
                                    returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                    #region 插入流水
                                    t_EmailNote ten = new t_EmailNote();
                                    ten.nvc_Email = send_fromto;
                                    ten.nvc_MemberName = v.nvc_Name;
                                    ten.nvc_Title = send_fromtitle;
                                    ten.nvc_EmailContent = neirong;
                                    ten.nvc_EmailState = returns;
                                    ten.i_systemType = 2;
                                    ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                    ten.nvc_Language = "en";
                                    DALE.EmailNote_Add(ten);
                                    #endregion
                                }
                            }

                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                t_Trademark tt = DALT.Trademark_Select_Id(r.i_Id);
                                tt.i_SendEmail = status;
                                DALT.Trademark_Update(tt);
                            }
                            //}
                        }
                    }
                }
            }
            #endregion

            #region 日文
            if (model_3.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "jp");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "jp");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "jp");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "jp");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "jp");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "商標期限アラーム";//标题商标期限提醒
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "jp");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(2, "jp", 1);//需要发送邮件的商标客户
                t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
                if (iquery.Count() > 0)
                {
                    foreach (var v in iquery)
                    {
                        StringBuilder sb_start = new StringBuilder();
                        StringBuilder sb_body = new StringBuilder();
                        StringBuilder sb_end = new StringBuilder();
                        int dazhe = 0, dazhe1 = 0;
                        #region 会员折扣 by chy
                        dazhe = v.i_PowerDaZhe;
                        t_MemberGrade tmg = DALUG.UserGrade_Select_Id(v.i_Grade);
                        if (tmg != null)
                        {
                            dazhe1 = Convert.ToInt32(tmg.i_Discount);
                        }
                        #endregion
                        sb_start.Append("<table width='600' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>商標登録コード</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>商標タイプ</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>登録者名称</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>期限日</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>小計</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>通貨</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");
                        IQueryable<t_Trademark> result = DALT.Trademark_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的商标
                        foreach (var i in result)
                        {
                            int sbnum = 0, sbdailinum = 0, zhinajinnum = 0;
                            string paybizhong = "CNY";
                            sbnum += 1;
                            if (i.i_JiaoFeiType == 2)
                            {
                                sbdailinum += 1;
                                if (i.i_ShengDays < 0)
                                {
                                    zhinajinnum += 1;
                                }
                            }
                            #region 会员折扣 by chy
                            decimal dalifee = model1.dm_TMDaiLi;
                            if (dazhe != 0)
                            {
                                dalifee = dalifee * dazhe / 100;
                            }
                            if (dazhe1 != 0)
                            {
                                dalifee = dalifee * dazhe1 / 100;
                            }
                            #endregion
                            string totalmoney = (((dalifee) * sbdailinum) + ((model1.dm_TrademarkMoney) * sbnum) + ((model1.dm_TMZhiNaJin) * zhinajinnum)).ToString("0.00");
                            t_Nationality na = DALN.Nationality_Select_Id(i.i_GuoJiId);
                            if (na != null)
                            {
                                paybizhong = na.nvc_JFBizhong;
                                if (na.nvc_Name != "中国")
                                {
                                    decimal huilv = 1;
                                    t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                                    if (nafee != null)
                                    {
                                        paybizhong = nafee.nvc_Currency;
                                        if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                        {
                                            huilv = nafee.dm_Exchange;
                                        }
                                    }
                                    totalmoney = ((((dalifee) * huilv) * sbdailinum) + (((model1.dm_TrademarkMoney) * huilv) * sbnum) + (((model1.dm_TMZhiNaJin) * huilv) * zhinajinnum)).ToString("0.00");
                                }
                            }
                            sb_body.Append("<tr>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBRegNum + "</td>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBType + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SBRegName + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SbDaoqiTime + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + totalmoney + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                            sb_body.Append("</tr>");

                        }
                        if (result.Count() > 0)
                        {
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            string neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            string youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            string[] ArrEmail = youxiang.Split('|');
                            string returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                if (ArrEmail[j] != null && ArrEmail[j] != "")
                                {
                                    //所有的邮箱发送完之后再修改状态
                                    send_fromto = ArrEmail[j];
                                    returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                    #region 插入流水
                                    t_EmailNote ten = new t_EmailNote();
                                    ten.nvc_Email = send_fromto;
                                    ten.nvc_MemberName = v.nvc_Name;
                                    ten.nvc_Title = send_fromtitle;
                                    ten.nvc_EmailContent = neirong;
                                    ten.nvc_EmailState = returns;
                                    ten.i_systemType = 2;
                                    ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                    ten.nvc_Language = "jp";
                                    DALE.EmailNote_Add(ten);
                                    #endregion
                                }
                            }

                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                t_Trademark tt = DALT.Trademark_Select_Id(r.i_Id);
                                tt.i_SendEmail = status;
                                DALT.Trademark_Update(tt);
                            }
                            //}
                        }
                    }
                }
            }
            #endregion

            #region 韩文
            if (model_4.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "kr");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "kr");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "kr");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "kr");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "kr");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "상표기한알람";//标题商标期限提醒
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "kr");
                send_fromcontent = model_11.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(2, "kr", 1);//需要发送邮件的商标客户
                t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
                if (iquery.Count() > 0)
                {
                    foreach (var v in iquery)
                    {
                        StringBuilder sb_start = new StringBuilder();
                        StringBuilder sb_body = new StringBuilder();
                        StringBuilder sb_end = new StringBuilder();
                        int dazhe = 0, dazhe1 = 0;
                        #region 会员折扣 by chy
                        dazhe = v.i_PowerDaZhe;
                        t_MemberGrade tmg = DALUG.UserGrade_Select_Id(v.i_Grade);
                        if (tmg != null)
                        {
                            dazhe1 = Convert.ToInt32(tmg.i_Discount);
                        }
                        #endregion
                        sb_start.Append("<table width='600' border='0' cellspacing='1' cellpadding='1' bgcolor='#d0d0d0' >");
                        sb_start.Append("<tr>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>상표 등록 번호</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>등록 상표 범주</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>로그인 성명</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>만료 날짜 옵션</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>상세</td>");
                        sb_start.Append("<td width='100' height='35' align='center' bgcolor='#FFFFFF'>币种</td>");
                        sb_start.Append("</tr>");
                        sb_end.Append("</table>");
                        IQueryable<t_Trademark> result = DALT.Trademark_SelectAllByStatus(v.i_Id, status, 1);//需要发送邮件的商标
                        foreach (var i in result)
                        {
                            int sbnum = 0, sbdailinum = 0, zhinajinnum = 0;
                            string paybizhong = "CNY";
                            sbnum += 1;
                            if (i.i_JiaoFeiType == 2)
                            {
                                sbdailinum += 1;
                                if (i.i_ShengDays < 0)
                                {
                                    zhinajinnum += 1;
                                }
                            }
                            #region 会员折扣 by chy
                            decimal dalifee = model1.dm_TMDaiLi;
                            if (dazhe != 0)
                            {
                                dalifee = dalifee * dazhe / 100;
                            }
                            if (dazhe1 != 0)
                            {
                                dalifee = dalifee * dazhe1 / 100;
                            }
                            #endregion
                            string totalmoney = (((dalifee) * sbdailinum) + ((model1.dm_TrademarkMoney) * sbnum) + ((model1.dm_TMZhiNaJin) * zhinajinnum)).ToString("0.00");
                            t_Nationality na = DALN.Nationality_Select_Id(i.i_GuoJiId);
                            if (na != null)
                            {
                                paybizhong = na.nvc_JFBizhong;
                                if (na.nvc_Name != "中国")
                                {
                                    decimal huilv = 1;
                                    t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                                    if (nafee != null)
                                    {
                                        paybizhong = nafee.nvc_Currency;
                                        if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                        {
                                            huilv = nafee.dm_Exchange;
                                        }
                                    }
                                    totalmoney = ((((dalifee) * huilv) * sbdailinum) + (((model1.dm_TrademarkMoney) * huilv) * sbnum) + (((model1.dm_TMZhiNaJin) * huilv) * zhinajinnum)).ToString("0.00");
                                }
                            }
                            sb_body.Append("<tr>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBRegNum + "</td>");
                            sb_body.Append("<td width='100' height='32' align='center' bgcolor='#FFFFFF' >" + i.nvc_SBType + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SBRegName + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + i.nvc_SbDaoqiTime + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + totalmoney + "</td>");
                            sb_body.Append("<td width='100' align='center' bgcolor='#FFFFFF'>" + paybizhong + "</td>");
                            sb_body.Append("</tr>");

                        }
                        if (result.Count() > 0)
                        {
                            send_fromcontent = send_fromcontent.Replace("UserName", v.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", v.nvc_UserNum);
                            string neirong = sb_start.ToString() + sb_body.ToString() + sb_end.ToString() + "<br/>" + send_fromcontent;
                            string youxiang = v.nt_BYEmail + "|" + v.nvc_Email;
                            string[] ArrEmail = youxiang.Split('|');
                            string returns = "发送失败";
                            for (int j = 0; j < ArrEmail.Length; j++)
                            {
                                if (ArrEmail[j] != null && ArrEmail[j] != "")
                                {
                                    //所有的邮箱发送完之后再修改状态
                                    send_fromto = ArrEmail[j];
                                    returns = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, neirong, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                                    #region 插入流水
                                    t_EmailNote ten = new t_EmailNote();
                                    ten.nvc_Email = send_fromto;
                                    ten.nvc_MemberName = v.nvc_Name;
                                    ten.nvc_Title = send_fromtitle;
                                    ten.nvc_EmailContent = neirong;
                                    ten.nvc_EmailState = returns;
                                    ten.i_systemType = 2;
                                    ten.i_MemberId = Convert.ToInt32(v.i_Id);
                                    ten.nvc_Language = "kr";
                                    DALE.EmailNote_Add(ten);
                                    #endregion
                                }
                            }

                            //if (returns == "发送成功")
                            //{
                            foreach (var r in result)
                            {
                                t_Trademark tt = DALT.Trademark_Select_Id(r.i_Id);
                                tt.i_SendEmail = status;
                                DALT.Trademark_Update(tt);
                            }
                            //}
                        }
                    }
                }
            }
            #endregion
        }
    }
    /// <summary>
    /// 商标订单提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    public void SendEmail_SbOrder(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            t_SystemKey model_2 = DALSK.SystemKey_Select_Key(key, "en");
            t_SystemKey model_3 = DALSK.SystemKey_Select_Key(key, "jp");
            t_SystemKey model_4 = DALSK.SystemKey_Select_Key(key, "kr");

            #region 中文
            if (model_1.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "cn");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "cn");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "cn");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "cn");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "cn");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "商标订单状态提醒";//标题
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_TrademarkOrder> iquery = DALTO.TrademarkOrder_Select_Status(status, "cn");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_Name);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_TrademarkOrder tto = DALTO.TrademarkOrder_Select_Id(i.i_Id);
                        tto.i_SendEmailOrder = status;
                        DALTO.TrademarkOrder_Update(tto);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_Name;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 2;
                        ten.i_MemberId = Convert.ToInt32(i.i_MemberId);
                        ten.nvc_Language = "cn";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion

            #region 英文
            if (model_2.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "en");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "en");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "en");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "en");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "en");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "Reminder of trademark renewal order status";//标题-商标订单状态提醒
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "en");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_TrademarkOrder> iquery = DALTO.TrademarkOrder_Select_Status(status, "en");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_Name);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_TrademarkOrder tto = DALTO.TrademarkOrder_Select_Id(i.i_Id);
                        tto.i_SendEmailOrder = status;
                        DALTO.TrademarkOrder_Update(tto);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_Name; 
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 2;
                        ten.i_MemberId = Convert.ToInt32(i.i_MemberId);
                        ten.nvc_Language = "en";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion

            #region 日文
            if (model_3.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "jp");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "jp");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "jp");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "jp");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "jp");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "商標オーダー状態アラーム";//标题商标订单状态提醒
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "jp");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_TrademarkOrder> iquery = DALTO.TrademarkOrder_Select_Status(status, "jp");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_Name);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_TrademarkOrder tto = DALTO.TrademarkOrder_Select_Id(i.i_Id);
                        tto.i_SendEmailOrder = status;
                        DALTO.TrademarkOrder_Update(tto);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_Name;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 2;
                        ten.i_MemberId = Convert.ToInt32(i.i_MemberId);
                        ten.nvc_Language = "jp";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion

            #region 韩文
            if (model_3.i_Value == 1)//判断要不要发送
            {
                t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", "kr");
                string send_fromserver = model.nt_Value;//邮件服务器
                model = DALSK.SystemKey_Select_Key("smtp_username", "kr");
                string send_fromloginname = model.nt_Value;//邮件登录名
                model = DALSK.SystemKey_Select_Key("smtp_password", "kr");
                string send_frompwd = model.nt_Value;//邮件密码
                model = DALSK.SystemKey_Select_Key("smtp_email", "kr");
                string send_from = model.nt_Value;//发送人邮件地址
                model = DALSK.SystemKey_Select_Key("smtp_name", "kr");
                string send_fromname = model.nt_Value;//发送人显示名称
                string send_fromto = "";//发送给谁（邮件地址）
                string send_fromtitle = "상표주문상태알람";//标题商标订单状态提醒
                string send_fromcontent = "";//内容

                t_SystemKey model_11 = DALSK.SystemKey_Select_Key(keyValue, "kr");
                send_fromcontent = model_11.nt_Value;
                IQueryable<vw_TrademarkOrder> iquery = DALTO.TrademarkOrder_Select_Status(status, "kr");//根据状态得到要发送的Email
                foreach (var i in iquery)
                {
                    if (i.nvc_Email != null && i.nvc_Email != "")
                    {
                        //send_fromtitle = i.nvc_Number;
                        send_fromto = i.nvc_Email;
                        send_fromcontent = send_fromcontent.Replace("Order", i.nvc_OrderNumber);
                        send_fromcontent = send_fromcontent.Replace("UserName", i.nvc_Name);
                        send_fromcontent = send_fromcontent.Replace("UserNumber", i.nvc_UserNum);
                        string s = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");//发送
                        t_TrademarkOrder tto = DALTO.TrademarkOrder_Select_Id(i.i_Id);
                        tto.i_SendEmailOrder = status;
                        DALTO.TrademarkOrder_Update(tto);
                        #region 插入流水
                        t_EmailNote ten = new t_EmailNote();
                        ten.nvc_Email = send_fromto;
                        ten.nvc_MemberName = i.nvc_Name;
                        ten.nvc_Title = send_fromtitle;
                        ten.nvc_EmailContent = send_fromcontent;
                        ten.nvc_EmailState = s;
                        ten.i_systemType = 2;
                        ten.i_MemberId = Convert.ToInt32(i.i_MemberId);
                        ten.nvc_Language = "kr";
                        DALE.EmailNote_Add(ten);
                        #endregion
                    }
                }
            }
            #endregion
        }
    }

    /// <summary>
    /// 发送短信-专利期限提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    public void SendMessage_Patent(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            #region 中文
            if (model_1.i_Value == 1)//判断要不要发送
            {
                model_1 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                IQueryable<t_Member> iquery = DALM.Member_Select_All(1, "cn", 2);//需要发送短信的专利客户
                if (iquery.Count() > 0)
                {
                    foreach (var v in iquery)
                    {
                        string sb_body = "";
                        IQueryable<t_Patent> result = DALP.Patent_SelectAllByStatus(v.i_Id, status, 2);//需要发送短信的专利
                        foreach (var i in result)
                        {
                            sb_body += i.nvc_Number + ";";
                        }
                        if (result.Count() > 0)
                        {
                            //=============================//
                            bool TorF = false;
                            string sendcontent = model_1.nt_Value.Replace("Number", sb_body);
                            if (v.nvc_MobilePhone != null && v.nvc_MobilePhone != "")
                            {
                                //发送完之后再修改状态
                                TorF = noteSms.SingleSend(v.nvc_MobilePhone, sendcontent, "cn");
                            }
                            foreach (var r in result)
                            {
                                t_Patent tp = DALP.Patent_Select_Id(r.i_Id);
                                tp.i_SendMessage = status;
                                DALP.Patent_Update(tp);
                            }
                            #region 插入流水
                            t_MessageNote tm = new t_MessageNote();
                            tm.i_MemberId = Convert.ToInt32(v.i_Id);
                            tm.i_systemType = 1;
                            tm.nvc_Content = sendcontent;
                            tm.nvc_Language = "cn";
                            tm.nvc_PhoneNumber = v.nvc_MobilePhone;
                            tm.nvc_NoteState = TorF ? "发送成功" : "发送失败";
                            tm.nvc_NoteType = "专利状态提醒";
                            dalm.MessageNote_Add(tm);
                            #endregion
                            //=========================//
                        }
                    }
                }
            }
            #endregion
        }
    }
    /// <summary>
    /// 发送短信-专利订单状态提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    public void SendMessage_PatentOrder(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            #region 中文
            if (model_1.i_Value == 1)
            {
                IQueryable<vw_PatentOrder> iquery = DALPO.PatentOrder_Select_StatusAndIsSend(status, "cn");
                model_1 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                foreach (var i in iquery)
                {
                    if (i.nvc_MobilePhone != null && i.nvc_MobilePhone != "")
                    {
                        bool TorF = false;
                        string sendcontent = model_1.nt_Value.Replace("Order", i.nvc_OrderNumber);
                        TorF = noteSms.SingleSend(i.nvc_MobilePhone, sendcontent, "cn");
                        t_PatentOrder tp = DALPO.PatentOrder_Select_Id(i.i_Id);
                        tp.i_SendMessageOrder = status;
                        DALPO.PatentOrder_Update(tp);
                        #region 插入流水
                        t_MessageNote tm = new t_MessageNote();
                        tm.i_MemberId = Convert.ToInt32(i.i_UserId);
                        tm.i_systemType = 1;
                        tm.nvc_Content = sendcontent;
                        tm.nvc_Language = "cn";
                        tm.nvc_PhoneNumber = i.nvc_MobilePhone;
                        tm.nvc_NoteState = TorF ? "发送成功" : "发送失败";
                        tm.nvc_NoteType = "专利订单状态提醒";
                        dalm.MessageNote_Add(tm);
                        #endregion
                    }
                }
            }
            #endregion
        }
    }
    /// <summary>
    /// 发送短信-商标期限提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    /// <param name="language"></param>
    public void SendMessage_SB(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            #region 中文
            if (model_1.i_Value == 1)//判断要不要发送
            {
                string send_fromcontent = "";//内容

                model_1 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                send_fromcontent = model_1.nt_Value;
                IQueryable<t_Member> iquery = DALM.Member_Select_All(2, "cn", 2);//需要发送短信的商标客户
                t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//代理费用
                if (iquery.Count() > 0)
                {
                    foreach (var v in iquery)
                    {
                        string sb_body = "";

                        IQueryable<t_Trademark> result = DALT.Trademark_SelectAllByStatus(v.i_Id, status, 2);//需要发送短信的商标
                        foreach (var i in result)
                        {
                            sb_body += i.nvc_SBRegNum + ";";
                        }
                        if (result.Count() > 0)
                        {
                            //=============================//
                            bool TorF = false;
                            string sendcontent = model_1.nt_Value.Replace("Number", sb_body);
                            if (v.nvc_MobilePhone != null && v.nvc_MobilePhone != "")
                            {
                                //发送完之后再修改状态
                                TorF = noteSms.SingleSend(v.nvc_MobilePhone, sendcontent, "cn");
                            }
                            foreach (var r in result)
                            {
                                t_Trademark tt = DALT.Trademark_Select_Id(r.i_Id);
                                tt.i_SendMessage = status;
                                DALT.Trademark_Update(tt);
                            }
                            #region 插入流水
                            t_MessageNote tm = new t_MessageNote();
                            tm.i_MemberId = v.i_Id;
                            tm.i_systemType = 1;
                            tm.nvc_Content = sendcontent;
                            tm.nvc_Language = "cn";
                            tm.nvc_PhoneNumber = v.nvc_MobilePhone;
                            tm.nvc_NoteState = TorF ? "发送成功" : "发送失败";
                            tm.nvc_NoteType = "商标期限提醒";
                            dalm.MessageNote_Add(tm);
                            #endregion
                            //=========================//
                        }
                    }
                }
            }
            #endregion
        }
    }
    /// <summary>
    /// 发送短信-商标订单提醒
    /// </summary>
    /// <param name="key"></param>
    /// <param name="keyValue"></param>
    /// <param name="status"></param>
    public void SendMessage_SbOrder(string key, string keyValue, int status)
    {
        if (dt.Hour >= 9 && dt.Hour <= 18)
        {
            t_SystemKey model_1 = DALSK.SystemKey_Select_Key(key, "cn");
            #region 中文
            if (model_1.i_Value == 1)
            {
                IQueryable<vw_TrademarkOrder> iquery = DALTO.TrademarkOrder_Select_StatusAndIsSend(status, "cn");
                model_1 = DALSK.SystemKey_Select_Key(keyValue, "cn");
                foreach (var i in iquery)
                {
                    if (i.nvc_MobilePhone != null && i.nvc_MobilePhone != "" && i.i_IsSend == 1)
                    {
                        bool TorF = false;
                        string sendcontent = model_1.nt_Value.Replace("Order", i.nvc_OrderNumber);
                        TorF = noteSms.SingleSend(i.nvc_MobilePhone, sendcontent, "cn");
                        t_TrademarkOrder tto = DALTO.TrademarkOrder_Select_Id(i.i_Id);
                        tto.i_SendPhoneOrder = status;
                        DALTO.TrademarkOrder_Update(tto);
                        #region 插入流水
                        t_MessageNote tm = new t_MessageNote();
                        tm.i_MemberId = Convert.ToInt32(i.i_MemberId);
                        tm.i_systemType = 1;
                        tm.nvc_Content = sendcontent;
                        tm.nvc_Language = "cn";
                        tm.nvc_PhoneNumber = i.nvc_MobilePhone;
                        tm.nvc_NoteState = TorF ? "发送成功" : "发送失败";
                        tm.nvc_NoteType = "商标订单状态提醒";
                        dalm.MessageNote_Add(tm);
                        #endregion
                    }
                }
            }
            #endregion
        }
    }
}