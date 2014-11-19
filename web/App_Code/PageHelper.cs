using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Text;
using System.Web.UI;

/// <summary>
///PageHelper 的摘要说明
/// </summary>
public static class PageHelper
{
    /// <summary>
    /// 产生一个ID
    /// </summary>
    /// <param name="page"></param>
    /// <returns></returns>
    public static string GetNewId(this Page page)
    {
        return System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999));
    }

}