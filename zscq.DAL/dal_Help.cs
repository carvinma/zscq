using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;
namespace zscq.DAL
{
    public class dal_Help
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 插入一条数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Help_Add(t_Help model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dsdc.t_Help.InsertOnSubmit(model);
                dsdc.SubmitChanges(System.Data.Linq.ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Help_Del(int id)
        {
            try
            {
                t_Help guest = dsdc.t_Help.Single(i => i.i_Id == id);
                dsdc.t_Help.DeleteOnSubmit(guest);
                dsdc.SubmitChanges();

                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Help_Update(t_Help model)
        {
            try
            {
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据帮助ID获取一条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Help Help_Select_Id(int id)
        {
            try
            {
                t_Help model = dsdc.t_Help.SingleOrDefault(h => h.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 查询所有数据
        /// </summary>
        /// <returns></returns>
        public IQueryable<vw_Help> Help_Select_TypeId(int TypeId)
        {
            return from i in dvdc.vw_Help where i.i_HelpTypeId == TypeId orderby i.i_Orderby ascending,i.i_Id descending select i;
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_Help> Help_SelectPage(int startIndex, int pageSize, string Keyword, int TType, ref int count)
        {
            Expression<Func<vw_Help, bool>> WhereExpr = PredicateExtensions.True<vw_Help>();

            if (TType != 0)
            {
                WhereExpr = WhereExpr.And(x => x.i_HelpTypeId == TType);
            }
            if (Keyword != "")
            {
                WhereExpr = WhereExpr.And(x => x.nvc_Title.Contains(Keyword));
            }
            var iquery = from i in dvdc.vw_Help.Where(WhereExpr) orderby i.i_Orderby ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
    }
}
