using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using zscq.DAL;

namespace zscq.BLL
{
    public class Note
    {
        public class ChinaSms
        {
            private string comName;
            private string comPwd;

            public ChinaSms()
            {

            }

            public ChinaSms(String name, String pwd)
            {
                this.comName = name;
                this.comPwd = pwd;
            }

            /*
            说明:封装单发接口
            参数:
              dst:目标手机号码
              msg:发送短信内容
            返回值:
              true:发送成功;
              false:发送失败
            */


            /// <summary>
            ///  dst:目标手机号码
            ///  msg:发送短信内容
            /// </summary>
            /// <param name="dst"></param>
            /// <param name="msg"></param>
            /// <param name="sys"系统设置</param>
            /// <returns></returns>
            public bool SingleSend(String dst, String msg)
            {
                string sUrl = null;  //接口规范中的地址
                string sMsg = null;  //调用结果
                msg = System.Web.HttpUtility.UrlEncode(msg, System.Text.Encoding.GetEncoding("UTF-8"));
                dal_SystemKey DALSK = new dal_SystemKey();
                t_SystemKey model = DALSK.SystemKey_Select_Key("note_name","cn");
                string USERNAME = System.Web.HttpUtility.UrlEncode(model.nt_Value, System.Text.Encoding.GetEncoding("UTF-8"));

                model = DALSK.SystemKey_Select_Key("note_code", "cn");
                string ECODE = System.Web.HttpUtility.UrlEncode(model.nt_Value, System.Text.Encoding.GetEncoding("UTF-8"));

                model = DALSK.SystemKey_Select_Key("note_password", "cn");
                string PASSWORD = System.Web.HttpUtility.UrlEncode(model.nt_Value, System.Text.Encoding.GetEncoding("UTF-8"));
                sUrl = "http://n.020sms.com/MSMSEND.ewing?ECODE=" + ECODE + "&USERNAME=" + USERNAME + "&PASSWORD=" + PASSWORD + "&MOBILE=" + dst + "&CONTENT=" + msg + "";
                sMsg = GetUrl(sUrl);
                Console.WriteLine(sMsg);

                if (sMsg.Substring(0, 1) == "1")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            public bool SingleSend(String dst, String msg, string lang)
            {
                string sUrl = null;  //接口规范中的地址
                string sMsg = null;  //调用结果
                msg = System.Web.HttpUtility.UrlEncode(msg, System.Text.Encoding.GetEncoding("UTF-8"));
                dal_SystemKey DALSK = new dal_SystemKey();
                t_SystemKey model = DALSK.SystemKey_Select_Key("note_name", lang);
                string USERNAME = System.Web.HttpUtility.UrlEncode(model.nt_Value, System.Text.Encoding.GetEncoding("UTF-8"));

                model = DALSK.SystemKey_Select_Key("note_code", lang);
                string ECODE = System.Web.HttpUtility.UrlEncode(model.nt_Value, System.Text.Encoding.GetEncoding("UTF-8"));

                model = DALSK.SystemKey_Select_Key("note_password", lang);
                string PASSWORD = System.Web.HttpUtility.UrlEncode(model.nt_Value, System.Text.Encoding.GetEncoding("UTF-8"));
                sUrl = "http://n.020sms.com/MSMSEND.ewing?ECODE=" + ECODE + "&USERNAME=" + USERNAME + "&PASSWORD=" + PASSWORD + "&MOBILE=" + dst + "&CONTENT=" + msg + "";
                sMsg = GetUrl(sUrl);
                Console.WriteLine(sMsg);

                if (sMsg.Substring(0, 1) == "1")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            /*通用调用接口*/
            public String GetUrl(String urlString)
            {
                string sMsg = "";//引用的返回字符串
                try
                {
                    System.Net.HttpWebResponse rs = (System.Net.HttpWebResponse)System.Net.HttpWebRequest.Create(urlString).GetResponse();
                    System.IO.StreamReader sr = new System.IO.StreamReader(rs.GetResponseStream(), System.Text.Encoding.Default);
                    sMsg = sr.ReadToEnd();
                }
                catch
                {
                    return sMsg;
                }
                return sMsg;
            }
        }
    }
}
