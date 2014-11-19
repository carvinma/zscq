using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.Model;
using zscq.DAL;
using System.IO;

/// <summary>
///UserLog 的摘要说明
/// </summary>
public class UserLog
{
    public UserLog()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    /// <summary>
    /// 增加用户日志
    /// </summary>
    /// <param name="pindao">频道名称</param>
    /// <param name="jilu">记录名称</param>
    public static void AddUserLog(string memberId, string pindao, string jilu)
    {
        AddUserLog(int.Parse(memberId), pindao, jilu);
    }
    /// <summary>
    /// 增加用户日志
    /// </summary>
    /// <param name="pindao">频道名称</param>
    /// <param name="jilu">记录名称</param>
    public static void AddUserLog(int memberId, string pindao, string jilu)
    {
        t_UserLog log = new t_UserLog();
        log.MemberID = Convert.ToInt32(memberId);
        log.ip = HttpContext.Current.Request.UserHostAddress;
        log.nvc_LogContent = jilu;
        log.pindao = pindao;
        log.Time = DateTime.Now;
        dal_UserLog dal = new dal_UserLog();
        dal.UserLog_Add(log);
    }
    /// <summary>
    /// 生成错误日志.TXT
    /// </summary>
    /// <param name="ex"></param>
    /// <param name="hc"></param>
    /// <param name="hr"></param>
    public static void SaveError(Exception ex, HttpContext hc, HttpRequest hr)
    {
        //SaveError(ex,this.Context,this.Request) ;
        string temp;
        StreamWriter sw;
        //如果存在文件
        if (File.Exists(hr.PhysicalApplicationPath + @"\Error.txt"))
        {
            sw = File.AppendText(hr.PhysicalApplicationPath + @"\Error.txt");
            temp = DateTime.Now.ToString() + "------------------------------------------------------------------------------------\n";
            temp += "错误消息:" + ex.Message + "\n";
            temp += "导致错误的应用程序或对象的名称:" + ex.Source + "\n";
            temp += "堆栈内容:" + ex.StackTrace + "\n";
            temp += "引发异常的方法:" + ex.TargetSite + "\n";
            temp += "错误页面" + hr.RawUrl + "\n\n";

            sw.WriteLine(temp);
            sw.Close();
        }
    }
}