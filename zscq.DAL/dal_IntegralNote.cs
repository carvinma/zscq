using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_IntegralNote
    {
        DataZscqDataContext dbdc = new DataZscqDataContext();
        /// <summary>
        /// 添加积分流水
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralNote_Add(t_IntegralNote model)
        {
            try
            {
                if (model.i_Integral != 0)
                {
                    dbdc.t_IntegralNote.InsertOnSubmit(model);
                    dbdc.SubmitChanges();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除积分流水
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public int IntegralNote_Del(int Pid)
        {
            try
            {
                t_IntegralNote PW = dbdc.t_IntegralNote.SingleOrDefault(a => a.i_Id == Pid);
                if (PW != null)
                {
                    dbdc.t_IntegralNote.DeleteOnSubmit(PW);
                    dbdc.SubmitChanges();
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取全部积分流水
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralNote> IntegralNote_SelectAll()
        {
            return from i in dbdc.t_IntegralNote select i;
        }
        /// <summary>
        /// 分页获取积分流水列表
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="name"></param>
        /// <param name="fenlei"></param>
        /// <param name="daili"></param>
        /// <param name="pid"></param>
        /// <param name="count"></param>
        /// <param name="leibie"></param>
        /// <returns></returns>
        public IQueryable<t_IntegralNote> IntegralNote_SelectPage(int PageIndex, int PageSize, string Keyword, int SType, int EId, DateTime STime, DateTime ETime, ref int count)
        {
            var iquery = from i in dbdc.t_IntegralNote select i;
            if (Keyword != "")
            {
                iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
            }
            if (EId != 0)
            {
                iquery = from i in iquery where i.i_MemberId == EId select i;
            }
            if (STime != null && ETime != null)
            {
                iquery = from i in iquery where i.dt_AddTime > STime && i.dt_AddTime < ETime select i;
            }
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }

        public int IntegralNote_Count(Expression<Func<t_IntegralNote, bool>> WhereExpr)
        {
            var iquery = from i in dbdc.t_IntegralNote select i;
            if (WhereExpr != null)
            {
                iquery = from i in iquery.Where(WhereExpr) select i;
            } 
            return iquery.Count();

        }
    }
}
