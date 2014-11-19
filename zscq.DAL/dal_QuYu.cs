using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{

    public class dal_QuYu
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 添加区域
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int QuYu_Add(t_QuYu model)
        {
            try
            {
                dsdc.t_QuYu.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 更新区域
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int QuYu_Updata(t_QuYu model)
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
        /// 更新区域
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int QuYu_Delete(int id)
        {
            try
            {
                var model = dsdc.t_QuYu.SingleOrDefault(i => i.i_Id == id);
                dsdc.t_QuYu.DeleteOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 查询所有区域
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_QuYu> QuYu_Select()
        {
            return from i in dsdc.t_QuYu select i;
        }
        /// <summary>
        /// 查询区域
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_QuYu> QuYu_Select_Pid(int pid)
        {
            return from i in dsdc.t_QuYu where i.i_Pid == pid select i;
        }
         
        /// <summary>
        /// 查询区域
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_QuYu> QuYu_Select_ByPage(int pagesize, int pageindex, int pid, ref int count)
        {
            var iquery = from i in dsdc.t_QuYu where i.i_Pid == pid orderby i.nvc_Value ascending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 查询区域
        /// </summary>
        /// <returns></returns>
        public t_QuYu QuYu_Select_Id(int id)
        {
            return (from i in dsdc.t_QuYu where i.i_Id == id select i).FirstOrDefault();
        }

    }
}
