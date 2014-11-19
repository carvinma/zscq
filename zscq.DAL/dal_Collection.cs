using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Collection
    {
        DataViewDataContext dvdc = new DataViewDataContext();
        DataMemberDataContext dmdc = new DataMemberDataContext();

        /// <summary>
        /// 插入一条收藏记录
        /// </summary>
        /// <returns></returns>
        public int Collection_Add(t_Collection model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dmdc.t_Collection.InsertOnSubmit(model);
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据本表ID删除一条收藏记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Collection_Del(int SId)
        {
            try
            {
                t_Collection model = dmdc.t_Collection.SingleOrDefault(a => a.i_Id == SId);
                if (model != null)
                {
                    dmdc.t_Collection.DeleteOnSubmit(model);
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
        /// 获取全部收藏记录
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Collection> Collection_SelectAll()
        {
            return from i in dmdc.t_Collection select i;
        }
        /// <summary>
        /// 获取某会员收藏记录
        /// </summary>
        /// <returns></returns>
        public IQueryable<vw_Collection> Collection_Select_MemberId(int PageIndex, int PageSize, int MemberId, ref int scount)
        {
            var iquery = from i in dvdc.vw_Collection where i.i_MemberId == MemberId orderby i.i_Id descending select i;
            scount = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        /// <summary>
        /// 分页获取收藏记录
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="Keyword"></param>
        /// <param name="STime"></param>
        /// <param name="ETime"></param>
        /// <param name="scount"></param>
        /// <returns></returns>
        public IQueryable<vw_Collection> Collection_SelectPage(int PageIndex, int PageSize, int SType, string Keyword, string STime, string ETime, ref int scount)
        {
            DateTime Sdt = STime != "" ? DateTime.Parse(STime) : DateTime.Now.AddYears(-10);
            DateTime Edt = ETime != "" ? DateTime.Parse(ETime) : DateTime.Now.AddDays(1);
            var iquery = from i in dvdc.vw_Collection where Sdt < i.dt_AddTime && i.dt_AddTime < Edt select i;
            if (Keyword != "")
            {
                switch (SType)
                {
                    case 1:
                        iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
                        break;
                    case 2:
                        iquery = from i in iquery where i.nvc_ProductName.Contains(Keyword) select i;
                        break;
                }
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            scount = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
    }
}
