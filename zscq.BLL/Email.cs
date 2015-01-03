using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace zscq.BLL
{
    public class Email
    {
        /// <summary>
        /// 发送邮件程序
        /// </summary>
        /// <param name="from">发送人邮件地址</param>
        /// <param name="fromname">发送人显示名称</param>
        /// <param name="to">发送给谁（邮件地址）</param>
        /// <param name="subject">标题</param>
        /// <param name="body">内容</param>
        /// <param name="username">邮件登录名</param>
        /// <param name="password">邮件密码</param>
        /// <param name="server">邮件服务器</param>
        /// <param name="fujian">附件</param>
        /// <returns>send ok</returns>
        /// 调用方法 SendMail("abc@126.com", "发件人姓名", "123@126.com", "标题", "正文", "邮箱登录名", "邮箱密码", "smtp.126.com", "");
        public static string Mail(string from, string fromname, string to, string subject, string body, string username, string password, string server, string fujian)
        {
            try
            {
                //邮件发送类
                MailMessage mail = new MailMessage();
                //是谁发送的邮件
                mail.From = new MailAddress(from, fromname);
                //发送给谁
                if (to.IndexOf(';') > -1)
                {
                    string[] sto = to.Split(';');

                    for (int i = 0; i < sto.Length; i++)
                    {
                        if (sto[i] != "")
                        {
                            mail.To.Add(sto[i].ToString());
                        }
                    }
                }
                else
                {
                    mail.To.Add(to);
                }
                mail.ReplyTo = new MailAddress(from, fromname);
                mail.Sender = new MailAddress(username, fromname);
              
                mail.Subject = subject; ///添加邮件主题
                mail.SubjectEncoding = Encoding.UTF8;

                //发送优先级
                mail.Priority = MailPriority.High;
                mail.Body = body; //邮件正文
                mail.BodyEncoding = Encoding.UTF8; //内容编码
                mail.IsBodyHtml = true;//是否HTML形式发送
                //附件
                if (fujian.Length > 0)
                {
                    string[] attachments = fujian.Split(';');
                    for (int i = 0; i < attachments.Length; i++)
                    {
                        if (attachments[i].Length > 0)
                        {  
                            mail.Attachments.Add(new Attachment(attachments[i]));
                        }
                    }
                }
                //邮件服务器和端口
                SmtpClient smtp = new SmtpClient(server, 25);
                smtp.UseDefaultCredentials = true;
                //指定发送方式
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = false;
                //指定登录名和密码
                smtp.Credentials = new System.Net.NetworkCredential(username, password);
                //超时时间
                // smtp.Timeout = 1000000;
                smtp.Send(mail);
                return "发送成功";
            }
            catch
            {
                return "发送失败";
            }
        }
    }
}
