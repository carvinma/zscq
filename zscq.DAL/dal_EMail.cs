using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;
namespace zscq.DAL
{
    public class dal_Email
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();

        /// <summary>
        /// 插入一条数据 Darren
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EmailNote_Add(t_EmailNote model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dsdc.t_EmailNote.InsertOnSubmit(model);
                dsdc.SubmitChanges(System.Data.Linq.ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除一条数据 Darren
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int EmailNote_Del(int id)
        {
            try
            {
                t_EmailNote guest = dsdc.t_EmailNote.SingleOrDefault(ID => ID.i_Id == id);
                dsdc.t_EmailNote.DeleteOnSubmit(guest);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条数据 darren
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_EmailNote EmailNote_Select_Id(int id)
        {
            try
            {
                return dsdc.t_EmailNote.SingleOrDefault(SolutionClassify => SolutionClassify.i_Id == id);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 查询所有数据 Darren
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_EmailNote> EmailNote_SelectAll()
        {
            var tables = from table in dsdc.t_EmailNote select table;
            return tables;
        }

        /// <summary>
        /// 分页获取流水
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="Keyword"></param>
        /// <param name="TType"></param>
        /// <param name="language"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_EmailNote> EmailNote_SelectPage(int startIndex, int pageSize, string Keyword, string TType, string language, ref int count)
        {
            Expression<Func<t_EmailNote, bool>> WhereExpr = PredicateExtensions.True<t_EmailNote>();
            if (!string.IsNullOrEmpty(Keyword))
            {
                WhereExpr = WhereExpr.And(x => x.nvc_MemberName.Contains(Keyword));
            }
            if (!string.IsNullOrEmpty(TType) && TType != "所有状态")
            {
                WhereExpr = WhereExpr.And(x => x.nvc_EmailState.Contains(TType));
            }
            if (language != "")
            {
                WhereExpr = WhereExpr.And(x => x.nvc_Language.Contains(language));
            }
            var tables = from i in dsdc.t_EmailNote.Where(WhereExpr) orderby i.i_Id descending select i;
            count = tables.Count();
            return tables.Skip(startIndex).Take(pageSize);
        }
    }
}
