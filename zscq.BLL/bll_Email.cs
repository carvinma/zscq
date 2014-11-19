using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;

namespace zscq.BLL
{
    /// <summary>
    /// 单独发一条邮件的时候使用此类
    /// </summary>
    public class bll_Email
    {
        dal_SystemKey DALSK = new dal_SystemKey();
        dal_Email DALE = new dal_Email();
        Email mail = new Email();
        /// <summary>
        /// 发送短信
        /// </summary>
        /// <param name="MobilePhone"></param>
        /// <param name="smsContent"></param>
        /// <param name="nvc_NoteType"></param>
        /// <param name="MId"></param>
        /// <returns></returns>
        public int Email_Add(string emailaddress, string title, string _Content, int MId, ref bool State)
        {
            try
            {
                t_SystemKey sys = DALSK.SystemKey_Select_Key("smtp_email");
                string smtp_email = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_name");
                string smtp_name = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_username");
                string smtp_username = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_password");
                string smtp_password = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp");
                string smtp = sys.nt_Value;

                string reWrite = Email.Mail(smtp_email, smtp_name, emailaddress, title, _Content, smtp_username, smtp_password, smtp, "");
                t_EmailNote model = new t_EmailNote();
                model.nvc_Title = title;
                model.nvc_EmailContent = _Content;
                model.nvc_EmailState = reWrite;
                model.i_MemberId = MId;
                DALE.EmailNote_Add(model);
                State = reWrite == "发送成功" ? true : false;
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Email_Add(string emailaddress, string title, string _Content, int MId, ref bool State, string lang)
        {
            try
            {
                t_SystemKey sys = DALSK.SystemKey_Select_Key("smtp_email", lang);
                string smtp_email = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_name", lang);
                string smtp_name = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_username", lang);
                string smtp_username = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp_password", lang);
                string smtp_password = sys.nt_Value;

                sys = DALSK.SystemKey_Select_Key("smtp", lang);
                string smtp = sys.nt_Value;

                string reWrite = Email.Mail(smtp_email, smtp_name, emailaddress, title, _Content, smtp_username, smtp_password, smtp, "");
                t_EmailNote model = new t_EmailNote();
                model.nvc_Title = title;
                model.nvc_EmailContent = _Content;
                model.nvc_EmailState = reWrite;
                model.i_MemberId = MId;
                model.nvc_Language = lang;
                DALE.EmailNote_Add(model);
                State = reWrite == "发送成功" ? true : false;
                return 1;
            }
            catch
            {
                return 0;
            }
        }
    }
}
