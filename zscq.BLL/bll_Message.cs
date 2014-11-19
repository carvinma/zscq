using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;

namespace zscq.BLL
{
    public class bll_Message
    {
        dal_Message DALM = new dal_Message();
        Note.ChinaSms sms = new Note.ChinaSms();
        /// <summary>
        /// 发送短信
        /// </summary>
        /// <param name="MobilePhone">手机号</param>
        /// <param name="smsContent">内容</param>
        /// <param name="nvc_NoteType">类型</param>
        /// <param name="MId">会员ID</param>
        /// <param name="State">发送状态</param>
        /// <returns></returns>
        public int Message_Add(string MobilePhone, string smsContent, string nvc_NoteType, int MId, ref bool State)
        {
            try
            {
                bool TorF = sms.SingleSend(MobilePhone, smsContent);
                t_MessageNote model = new t_MessageNote();
                model.nvc_Content = smsContent;
                model.nvc_PhoneNumber = MobilePhone;
                model.nvc_NoteType = nvc_NoteType;
                model.i_MemberId = MId;
                model.nvc_NoteState = TorF ? "发送成功" : "发送失败";
                DALM.MessageNote_Add(model);
                State = TorF;
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Message_Add(string MobilePhone, string smsContent, string nvc_NoteType, int MId, int stype, ref bool State)
        {
            try
            {
                bool TorF = sms.SingleSend(MobilePhone, smsContent);
                t_MessageNote model = new t_MessageNote();
                model.nvc_Content = smsContent;
                model.nvc_PhoneNumber = MobilePhone;
                model.nvc_NoteType = nvc_NoteType;
                model.i_MemberId = MId;
                model.nvc_NoteState = TorF ? "发送成功" : "发送失败";
                model.i_systemType = stype;
                DALM.MessageNote_Add(model);
                State = TorF;
                return 1;
            }
            catch
            {
                return 0;
            }
        }
    }
}
