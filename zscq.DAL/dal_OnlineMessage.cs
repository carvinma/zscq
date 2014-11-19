using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_OnlineMessage
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        #region 在线留言
        /// <summary>
        /// 增加在线留言
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OnlineMessage_Add(t_OnlineMessage model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                model.i_Replay = 0;
                dmdc.t_OnlineMessage.InsertOnSubmit(model);
                dmdc.SubmitChanges(System.Data.Linq.ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除在线留言
        /// </summary>
        /// <param name="id"></param>
        public int OnlineMessage_Del(int id)
        {
            try
            {
                dmdc.t_OnlineMessage.DeleteOnSubmit(dmdc.t_OnlineMessage.Single(b => b.i_Id == id));
                dmdc.SubmitChanges();
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
        public t_OnlineMessage OnlineMessage_Select_Id(int id)
        {
            try
            {
                return dmdc.t_OnlineMessage.FirstOrDefault(i => i.i_Id == id);
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
        public IQueryable<vw_OnlineMessage> OnlineMessage_SelectPage(int startIndex, int pageSize, string Keyword, int Stype, string language, int TType, int TimeType, string STime, string ETime, ref int count)
        {
            var iquery = from i in dvdc.vw_OnlineMessage select i;
            if (TType != -1)
            {
                iquery = from i in iquery where i.i_Replay == TType select i;
            }
            if (language != "")
            {
                iquery = from i in iquery where i.nvc_Language == language select i;
            }
            if (Keyword != "")
            {
                switch (Stype)
                {
                    case 1:
                        //多字段
                        iquery = from i in iquery where i.nvc_AdvisoryContent.Contains(Keyword) || i.nvc_ReplayContent.Contains(Keyword) || i.nvc_MemberName.Contains(Keyword) || i.nvc_ManagerName.Contains(Keyword) select i;
                        break;
                    case 2:
                        //在线留言内容
                        iquery = from i in iquery where i.nvc_AdvisoryContent.Contains(Keyword) select i;
                        break;
                    case 3:
                        //回复内容
                        iquery = from i in iquery where i.nvc_ReplayContent.Contains(Keyword) select i;
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
                EDateTime = Convert.ToDateTime(ETime).AddDays(1);
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
        public IQueryable<vw_OnlineMessage> OnlineMessage_SelectPage_ProductId(int startIndex, int pageSize, int Ptype, int pid, ref int count)
        {
            var iquery = from i in dvdc.vw_OnlineMessage select i;
            if (Ptype != -1)
            {
                iquery = from i in iquery where i.i_Replay == Ptype select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 前台根据会员获取在线留言分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_OnlineMessage> OnlineMessage_SelectPage_MemberId(int startIndex, int pageSize, int uid, ref int count)
        {
            var iquery = from i in dvdc.vw_OnlineMessage where i.i_MemberId == uid orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        #endregion

        #region 在线留言回复
        /// <summary>
        /// 在线留言回复
        /// </summary>
        /// <param name="caseModel"></param>
        /// <returns></returns>
        public int OnlineMessage_Update(t_OnlineMessage newmodel)
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
        #endregion


    }
}
