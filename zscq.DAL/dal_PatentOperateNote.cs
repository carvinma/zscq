using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_PatentOperateNote
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 添加专利订单操作日志
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PatentOperateNote_Add(t_PatentOperateNote model)
        {
            try
            {
                dzdc.t_PatentOperateNote.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利订单操作日志
        /// </summary>
        /// <param name="id"></param>
        public int PatentOperateNote_Del(int id)
        {
            try
            {
                t_PatentOperateNote model = dzdc.t_PatentOperateNote.Single(u => u.i_Id == id);
                dzdc.t_PatentOperateNote.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利订单操作日志
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int PatentOperateNote_Update(t_PatentOperateNote moble)
        {
            try
            {
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条专利订单操作日志
        /// </summary>
        /// <param name="id"></param>
        public t_PatentOperateNote PatentOperateNote_Select_Id(int id)
        {
            try
            {
                t_PatentOperateNote model = dzdc.t_PatentOperateNote.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch 
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部专利订单操作日志
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentOperateNote> PatentOperateNote_SelectAll()
        {
            return from i in dzdc.t_PatentOperateNote orderby i.i_Id ascending select i;
        }
        public IQueryable<t_PatentOperateNote> PatentOperateNote_Select_OrderID(int orderID)
        {
            return from i in dzdc.t_PatentOperateNote where i.i_OrderId == orderID orderby i.i_Id ascending select i;
        }
        /// <summary>
        /// 根据订单ID得到管理员对该订单的操作记录
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<vw_PatentOperateNote> PatentOperateNote_vw_Select(int orderID)
        {
            var iquery = from t in dvdc.vw_PatentOperateNote where t.i_OrderId == orderID select t;
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            return iquery;
        }
    }
}
