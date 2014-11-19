using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_FriendLink
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 添加配送时间
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int FriendLink_Add(t_FriendLink model)
        {
            try
            {
                dsdc.t_FriendLink.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除配送时间
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public int FriendLink_Del(int Pid)
        {
            try
            {
                t_FriendLink PW = dsdc.t_FriendLink.SingleOrDefault(a => a.i_Id == Pid);
                if (PW != null)
                {
                    dsdc.t_FriendLink.DeleteOnSubmit(PW);
                    dsdc.SubmitChanges();
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
        /// 修改配送时间
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int FriendLink_Submit(t_FriendLink model)
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
        /// 获取全部配送时间
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_FriendLink> FriendLink_Select_All()
        {
            var iquery = from i in dsdc.t_FriendLink orderby i.i_Orderby ascending, i.i_Id descending select i;
            return iquery;
        }
        /// <summary>
        /// 根据表id获取某个配送时间
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_FriendLink FriendLink_Select_Id(int Pid)
        {
            try
            {
                t_FriendLink PW = dsdc.t_FriendLink.SingleOrDefault(a => a.i_Id == Pid);
                return PW;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据表Name获取某个配送时间
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public IQueryable<t_FriendLink> FriendLink_SelectPage(int PageIndex, int PageSize, ref int ccount)
        {
            var iquery = from i in dsdc.t_FriendLink orderby i.i_Orderby ascending, i.i_Id descending select i;
            ccount = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
    }
}
