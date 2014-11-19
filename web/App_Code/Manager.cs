using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.Model;
using zscq.DAL;
using System.Data;

/// <summary>
///Manager 的摘要说明
/// </summary>
public class Manager
{
    public Manager()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    /// <summary>
    /// 判断用户是否有权限
    /// </summary>
    /// <param name="pageID">数组id</param>
    /// <param name="indexID">权限id</param>
    /// <returns></returns>
    public static bool GetManagerQX(int pageID, int indexID)
    {
        try
        {
            bool isHave = false;
            if (System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["userid"] != null && System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["flag"] != null)
            {
                string flag = System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["flag"].ToString();
                string[] flagList = flag.Split('|');
                int index = int.Parse(flagList[pageID][indexID].ToString());
                if (index == 1) { isHave = true; } else { isHave = false; }
            }
            return isHave;
        }
        catch
        {
            return false;
        }
    }
    /// <summary>
    /// 增加系统日志
    /// </summary>
    /// <param name="pindao">频道名称</param>
    /// <param name="jilu">记录名称</param>
    public static void AddLog(int aid, string pindao, string jilu)
    {
        t_SystemLog log = new t_SystemLog();
        log.AdminID = System.Web.HttpContext.Current.Request.Cookies["zscqmanage"] != null && System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["userid"] != null && System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["userid"] != "" ? int.Parse(System.Web.HttpContext.Current.Request.Cookies["zscqmanage"]["userid"].ToString()) : aid;
        log.ip = HttpContext.Current.Request.UserHostAddress;
        log.nvc_LogContent = jilu;
        log.pindao = pindao;
        log.Time = DateTime.Now;
        dal_Manager dal = new dal_Manager();
        dal.SystemLog_Add(log);
    }
    /// <summary>
    /// IQueryable 转换 datatable
    /// </summary>
    /// <param name="o"></param>
    /// <returns></returns>
    public static DataTable IQueryable_ConvertTo_DataTable(System.Linq.IQueryable iquery)
    {
        DataTable dt = new DataTable();
        var props = iquery.ElementType.GetProperties();
        foreach (System.Reflection.PropertyInfo pi in props)
        {
            string ddd = pi.PropertyType.ToString();
            if ((pi.PropertyType == System.Type.GetType("System.Nullable`1[System.Int32]")) || (pi.PropertyType == System.Type.GetType("System.Int32")))
            { 
                dt.Columns.Add(pi.Name, System.Type.GetType("System.Int32"));
            }
            else if (pi.PropertyType == System.Type.GetType("System.String"))
            { 
                dt.Columns.Add(pi.Name, System.Type.GetType("System.String")); 
            }
            else if ((pi.PropertyType == System.Type.GetType("System.Nullable`1[System.DateTime]")) || (pi.PropertyType == System.Type.GetType("System.DateTime")))
            { 
                dt.Columns.Add(pi.Name, System.Type.GetType("System.DateTime")); 
            }
            else
            { 
                dt.Columns.Add(pi.Name, System.Type.GetType("System.Decimal")); 
            }
        }
        foreach (var item in iquery)
        {
            DataRow dr = dt.NewRow();
            foreach (System.Reflection.PropertyInfo pi in props)
            {
                if (pi.GetValue(item, null) != null)
                {
                    if (pi.GetValue(item, null) != null)
                    {
                        dr[pi.Name] = pi.GetValue(item, null);
                    }
                }
            }
            dt.Rows.Add(dr);
        }
        return dt;
    }
}
