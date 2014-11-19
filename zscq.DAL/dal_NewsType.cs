using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_NewsType
    {
        DataSystemDataContext da = new DataSystemDataContext();

        /// <summary>
        /// 添加新闻类别
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int NewsType_Add(t_NewsType model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                da.t_NewsType.InsertOnSubmit(model);
                da.SubmitChanges(ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除新闻类别
        /// </summary>
        /// <param name="id"></param>
        public int NewsType_Del(int id)
        {
            try
            {
                var iquery = from i in da.t_NewsType where (i.i_Id == id || i.i_Pid == id) && i.i_IsAllow == 0 select i;
                foreach (var q in iquery)
                {
                    if (new dal_News().News_DelByType(q.i_Id) == 0)
                    {
                        return 0;
                    }
                    da.t_NewsType.DeleteOnSubmit(q);
                }
                da.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改新闻类别列表
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int NewsType_Update(t_NewsType moble)
        {
            try
            {
                da.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条新闻类别
        /// </summary>
        /// <param name="id"></param>
        public t_NewsType NewsType_Select_Id(int id)
        {
            try
            {
                t_NewsType model = da.t_NewsType.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部新闻类别列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_NewsType> NewsType_SelectAll()
        {
            return from i in da.t_NewsType orderby i.i_Orderby ascending select i;
        }
        /// <summary>
        /// 返回全部新闻类别列表
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        public IQueryable<t_NewsType> NewsType_SelectAll(int pid)
        {
            return from i in da.t_NewsType where i.i_Pid == pid orderby i.i_Orderby ascending select i;
        }
        public IQueryable<t_NewsType> NewsType_SelectAll(string key, string language)
        {
            return from i in da.t_NewsType where i.nvc_key == key && i.nvc_Language == language orderby i.i_Orderby ascending select i;
        }
        /// <summary>
        /// 返回全部新闻类别列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_NewsType> NewsType_SelectAll(int pid, string lang)
        {
            return from i in da.t_NewsType where i.i_Pid == pid && i.nvc_Language == lang orderby i.i_Orderby ascending select i;
        }
    }
}
