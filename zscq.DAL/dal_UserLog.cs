using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_UserLog
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        #region 记录系统日志
        /// <summary>
        /// 添加系统日志
        /// </summary>
        /// <param name="log"></param>
        public int UserLog_Add(t_UserLog log)
        {
            try
            {
                dsdc.t_UserLog.InsertOnSubmit(log);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除系统日志
        /// </summary>
        /// <param name="id"></param>
        public int UserLog_Del(int id)
        {
            try
            {
                t_UserLog log = dsdc.t_UserLog.Single(a => a.LogID == id);
                dsdc.t_UserLog.DeleteOnSubmit(log);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 分页获取系统日志
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="name"></param>
        /// <param name="yemian"></param>
        /// <param name="begine"></param>
        /// <param name="end"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable UserLog_SelectPage(int startIndex, int pageSize, string name, string yemian, DateTime begine, DateTime end, ref int count)
        {
            Expression<Func<vw_UserLog, bool>> WhereExpr = PredicateExtensions.True<vw_UserLog>();
            if (!string.IsNullOrEmpty(yemian) && yemian != "0")
            {
                WhereExpr = WhereExpr.And(a => a.pindao == yemian);
            }
            if (begine != DateTime.MinValue)
            {
                WhereExpr = WhereExpr.And(a => a.Time >= begine);
            }
            if (begine != DateTime.MinValue)
            {
                WhereExpr = WhereExpr.And(a => a.Time <= end);
            }
            if (!string.IsNullOrEmpty(name))
            {
                WhereExpr = WhereExpr.And(a => a.nvc_Name.Contains(name) || a.nvc_UserNum.Contains(name));
            }
            var iquery = from i in dvdc.vw_UserLog.Where(WhereExpr) orderby i.Time descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取系统日志的类别
        /// </summary>
        /// <returns></returns>
        public IQueryable Set_UserLogType()
        {
            var q = from a in dsdc.t_UserLog
                    group a by new
                    {
                        a.pindao
                    }
                        into f
                        select new
                            {
                                leibie = f.Key.pindao
                            };
            return q;
        }
        #endregion
    }
}