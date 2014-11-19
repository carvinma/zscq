using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Advisory
    {
        DataProductDataContext dpdc = new DataProductDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        #region 咨询
        /// <summary>
        /// 增加咨询
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Advisory_Add(t_Advisory model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                model.i_Replay = 0;
                dpdc.t_Advisory.InsertOnSubmit(model);
                dpdc.SubmitChanges(System.Data.Linq.ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除咨询
        /// </summary>
        /// <param name="id"></param>
        public int Advisory_Del(int id)
        {
            try
            {
                dpdc.t_Advisory.DeleteOnSubmit(dpdc.t_Advisory.Single(b => b.i_Id == id));
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据id获取单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Advisory Advisory_Select_Id(int id)
        {
            try
            {
                return dpdc.t_Advisory.FirstOrDefault(i => i.i_Id == id);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 后台分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_Advisory> Advisory_SelectPage(int startIndex, int pageSize, string Keyword, int Stype, int TType, int TimeType, string STime, string ETime, ref int count)
        {
            var iquery = from i in dvdc.vw_Advisory select i;
            if (TType != -1)
            {
                iquery = from i in iquery where i.i_Replay == TType select i;
            }
            if (Keyword != "")
            {
                switch (Stype)
                {
                    case 1:
                        //多字段
                        iquery = from i in iquery where i.nvc_AdvisoryContent.Contains(Keyword) || i.nvc_ReplayContent.Contains(Keyword) || i.nvc_Name.Contains(Keyword) || i.nvc_MemberName.Contains(Keyword) || i.nvc_ManagerName.Contains(Keyword) select i;
                        break;
                    case 2:
                        //咨询内容
                        iquery = from i in iquery where i.nvc_AdvisoryContent.Contains(Keyword) select i;
                        break;
                    case 3:
                        //回复内容
                        iquery = from i in iquery where i.nvc_ReplayContent.Contains(Keyword) select i;
                        break;
                    case 4:
                        //商品名称
                        iquery = from i in iquery where i.nvc_Name.Contains(Keyword) select i;
                        break;
                    case 5:
                        //会员用户名
                        iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
                        break;
                    case 6:
                        //管理员用户名
                        iquery = from i in iquery where i.nvc_ManagerName.Contains(Keyword) select i;
                        break;
                }
            }
            DateTime SDateTime = DateTime.Now.AddYears(-10);
            if (STime.Trim() != "")
            {
                SDateTime = Convert.ToDateTime(STime);
            }
            DateTime EDateTime = DateTime.Now.AddDays(1);
            if (ETime.Trim() != "")
            {
                EDateTime = Convert.ToDateTime(ETime);
            }
            if (TimeType == 1)
            {
                iquery = from i in iquery where SDateTime < i.dt_AddTime && i.dt_AddTime < EDateTime select i;
            }
            else if (TimeType == 2)
            {
                iquery = from i in iquery where SDateTime < i.dt_ReplayTime && i.dt_ReplayTime < EDateTime select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 前台产品页面分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_Advisory> Advisory_SelectPage_ProductId(int startIndex, int pageSize, int Ptype, int pid, ref int count)
        {
            var iquery = from i in dvdc.vw_Advisory where i.i_ProductId == pid select i;
            if (Ptype != -1)
            {
                iquery = from i in iquery where i.i_Replay == Ptype select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 前台根据会员获取咨询分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_Advisory> Advisory_SelectPage_MemberId(int startIndex, int pageSize, int uid, ref int count)
        {
            var iquery = from i in dvdc.vw_Advisory where i.i_MemberId == uid orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        #endregion

        #region 咨询回复
        /// <summary>
        /// 咨询回复
        /// </summary>
        /// <param name="caseModel"></param>
        /// <returns></returns>
        public int Advisory_Update(t_Advisory newmodel)
        {
            try
            {
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        #endregion

        ///// <summary>
        ///// 团购首页获取咨询
        ///// </summary>
        ///// <returns></returns>
        //public IQueryable<t_Advisory> Advisory_Select_GroupBuy()
        //{
        //    var iquery = from i in dc.t_Advisory
        //                 join p in dc.t_Product on i.i_ProductId equals p.i_Id
        //                 where p.i_GroupBuy == 1
        //                 select i;
        //    return iquery;
        //}
    }
}
