using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///HelpString 的摘要说明
/// </summary>
public class HelpString
{
	public HelpString()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static string GetMoneyFormat(decimal money,string huilv)
    {
        string newmoney ="0.00";
        float huilv1 = float.Parse(huilv);
        float oldmoney = float.Parse(money.ToString("0.00"));
        try
        {
            newmoney=decimal.Parse((oldmoney/huilv1).ToString()).ToString("0.00");
        }
        catch { }
        return newmoney;

    }
/// <summary>
/// 
/// </summary>
/// <param name="DateTime1"></param>
/// <param name="DateTime2"></param>
/// <param name="type">type=day返回天 hours 返回小时  minutes 返回分钟</param>
/// <returns></returns>
    public static string DateDiff(DateTime DateTime1, DateTime DateTime2, string type)
    {
        string dateDiff = null;
        try
        {
            TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2);
            if (type == "day")
            {
                dateDiff = ts.Days.ToString();
            }
            if (type == "hours")
            {
                dateDiff = ts.Hours.ToString();
            }
            if (type == "minute")
            {
                dateDiff = ts.Minutes.ToString();
            }       
        }
        catch
        {

        }
        return dateDiff;
    }
    /// <summary>
    /// 生成编号
    /// </summary>
    /// <returns></returns>
    public static string GetRamdom()
    {
        DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
        DateTime dtNow = DateTime.Parse(DateTime.Now.ToString());
        TimeSpan toNow = dtNow.Subtract(dtStart);
        string timeStamp = toNow.Ticks.ToString();
        timeStamp = timeStamp.Substring(0, timeStamp.Length - 7);
        return timeStamp;
    }
}