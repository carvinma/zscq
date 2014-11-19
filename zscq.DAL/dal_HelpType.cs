using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_HelpType
    {
        DataSystemDataContext dhdc = new DataSystemDataContext();
        /// <summary>
        /// 插入一条数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int HelpType_Add(t_HelpType model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dhdc.t_HelpType.InsertOnSubmit(model);
                dhdc.SubmitChanges(System.Data.Linq.ConflictMode.ContinueOnConflict);
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
        public int HelpType_Del(int id)
        {
            try
            {
                t_HelpType guest = dhdc.t_HelpType.Single(table => table.i_Id == id);
                dhdc.t_HelpType.DeleteOnSubmit(guest);
                dhdc.SubmitChanges();
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
        public int HelpType_Update(t_HelpType model)
        {
            try
            {
                t_HelpType item = dhdc.t_HelpType.Single(b => b.i_Id == model.i_Id);
                item.nvc_Name = model.nvc_Name;
                item.i_Orderby = model.i_Orderby;
                dhdc.SubmitChanges();
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
        public int HelpType_Submit()
        {
            try
            {
                dhdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获得一条数据
        /// </summary>
        /// <param name="HCId"></param>
        /// <returns></returns>
        public t_HelpType HelpType_Select_Id(int HCId)
        {
            try
            {
                return dhdc.t_HelpType.SingleOrDefault(a => a.i_Id == HCId);
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
        public IQueryable<t_HelpType> HelpType_SelectAll()
        {
            var iquery = from i in dhdc.t_HelpType orderby i.i_Orderby ascending, i.i_Id descending select i;
            return iquery;
        }
    }
}
