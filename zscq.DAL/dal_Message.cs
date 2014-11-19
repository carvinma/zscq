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
    public class dal_Message
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入一条数据 Darren
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int MessageNote_Add(t_MessageNote model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dsdc.t_MessageNote.InsertOnSubmit(model);
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
        public int MessageNote_Del(int id)
        {
            try
            {
                t_MessageNote guest = dsdc.t_MessageNote.Single(table => table.i_Id == id);
                dsdc.t_MessageNote.DeleteOnSubmit(guest);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条数
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_MessageNote MessageNote_Select_Id(int id)
        {
            try
            {
                t_MessageNote guest = dsdc.t_MessageNote.SingleOrDefault(i => i.i_Id == id);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 分页获取 Darren
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_MessageNote> MessageNote_SelectPage(int startIndex, int pageSize, string NoteUserName, string NoteState, string NoteType, ref int count)
        {
            Expression<Func<vw_MessageNote, bool>> WhereExpr = PredicateExtensions.True<vw_MessageNote>();

            if (!string.IsNullOrEmpty(NoteUserName))
            {
                WhereExpr = WhereExpr.And(x => x.nvc_MemberName.Contains(NoteUserName));
            }
            if (!string.IsNullOrEmpty(NoteState))
            {
                if (NoteState != "所有状态")
                {
                    WhereExpr = WhereExpr.And(x => x.nvc_NoteState.Contains(NoteState));
                }
            }
            if (!string.IsNullOrEmpty(NoteType))
            {
                if (NoteType != "所有类型")
                {
                    WhereExpr = WhereExpr.And(x => x.nvc_NoteType.Contains(NoteType));
                }
            }

            var iquery = from i in dvdc.vw_MessageNote.Where(WhereExpr)
                         orderby i.i_Id descending
                         select i;

            count = iquery.Count();

            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }

        public IQueryable<vw_MessageNote> MessageNote_SelectPage(int startIndex, int pageSize, string NoteUserName, string NoteState, string NoteType,string language, ref int count)
        {
            Expression<Func<vw_MessageNote, bool>> WhereExpr = PredicateExtensions.True<vw_MessageNote>();

            if (!string.IsNullOrEmpty(NoteUserName))
            {
                WhereExpr = WhereExpr.And(x => x.nvc_MemberName.Contains(NoteUserName));
            }
            if (!string.IsNullOrEmpty(NoteState))
            {
                if (NoteState != "所有状态")
                {
                    WhereExpr = WhereExpr.And(x => x.nvc_NoteState.Contains(NoteState));
                }
            }
            if (!string.IsNullOrEmpty(NoteType))
            {
                if (NoteType != "所有类型")
                {
                    WhereExpr = WhereExpr.And(x => x.nvc_NoteType.Contains(NoteType));
                }
            }
            if (language!="")
            {
                WhereExpr = WhereExpr.And(x => x.nvc_Language.Contains(language));
            }
            var iquery = from i in dvdc.vw_MessageNote.Where(WhereExpr)
                         orderby i.i_Id descending
                         select i;

            count = iquery.Count();

            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
    }
}
