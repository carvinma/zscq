using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_UserIntegralNote
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 增加一条新积分流水
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralNote_Add(t_UserIntegralNote model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dmdc.t_UserIntegralNote.InsertOnSubmit(model);
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 修改一条新积分流水
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralNote_Update(t_UserIntegralNote model)
        {
            try
            {
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 根据ID删除积分流水
        /// </summary>
        /// <param name="Wid"></param>
        /// <returns></returns>
        public int IntegralNote_Del(int Iid)
        {
            try
            {
                t_UserIntegralNote UIN = dmdc.t_UserIntegralNote.SingleOrDefault(a => a.i_Id == Iid);
                if (UIN != null)
                {
                    dmdc.t_UserIntegralNote.DeleteOnSubmit(UIN);
                    dmdc.SubmitChanges();
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
        public IQueryable<t_UserIntegralNote> IntegralNote_Select_MemberId(int UserId)
        {
            return from i in dmdc.t_UserIntegralNote where i.i_UserId == UserId select i;
        }

        public IQueryable<t_UserIntegralNote> IntegralNote_Select_OrderId(int OrderId)
        {
            return from i in dmdc.t_UserIntegralNote where i.i_OrderID == OrderId select i;
        }

        /// <summary>
        /// 根据会员ID分页获取会员积分流水
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_UserIntegralNote> IntegralNote_Select_UserId(int PageIndex, int PageSize, int UserId, ref int count)
        {
            var iquery = from i in dmdc.t_UserIntegralNote where i.i_UserId == UserId orderby i.dt_AddTime descending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        /// <summary>
        /// 分页获取会员积分流水
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable IntegralNote_Select_Page(int PageIndex, int PageSize, string UserName, string SType, string STime, string ETime, ref int count)
        {
            DateTime Sdt = STime != "" ? DateTime.Parse(STime) : DateTime.Now.AddMonths(-6);
            DateTime Edt = ETime != "" ? DateTime.Parse(ETime).AddDays(1) : DateTime.Now.AddDays(1);
            var iquery = from i in dvdc.vw_UserIntegralNote
                         where Sdt < i.dt_AddTime && i.dt_AddTime < Edt
                         select i;
            if (SType != "")
            {
                iquery = from i in iquery where i.nvc_NoteType == SType select i;
            }
            if (UserName != "")
            {
                iquery = from i in iquery where i.nvc_Name.Contains(UserName) || i.nvc_UserNum.Contains(UserName) select i;
            }
            iquery = from i in iquery orderby i.dt_AddTime descending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        /// <summary>
        /// 根据手机ID分页获取会员积分流水
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_UserIntegralNote> vwIntegralNote_Select_MobileId(int PageIndex, int PageSize, int MobileId, ref int count)
        {
            var iquery = from i in dvdc.vw_UserIntegralNote where i.i_IntegralMobileId == MobileId orderby i.dt_AddTime descending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        public IQueryable<vw_UserIntegralNote> vwIntegralNote_Select_MobileId(int MobileId)
        {
            var iquery = from i in dvdc.vw_UserIntegralNote where i.i_IntegralMobileId == MobileId orderby i.dt_AddTime descending, i.i_Id descending select i;
            return iquery;
        }

        public int IntegralNote_Count(Expression<Func<t_UserIntegralNote, bool>> WhereExpr)
        {
            var iquery = from i in dmdc.t_UserIntegralNote select i;
            if (WhereExpr != null)
            {
                iquery = from i in iquery.Where(WhereExpr) select i;
            }
            return iquery.Count();

        }
    }
}
