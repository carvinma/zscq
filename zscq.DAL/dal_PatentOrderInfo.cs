using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_PatentOrderInfo
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 添加专利详情
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PatentOrderInfo_Add(t_PatentOrderInfo model)
        {
            try
            {
                dzdc.t_PatentOrderInfo.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利详情
        /// </summary>
        /// <param name="id"></param>
        public int PatentOrderInfo_Del(int id)
        {
            try
            {
                t_PatentOrderInfo model = dzdc.t_PatentOrderInfo.Single(u => u.i_Id == id);
                dzdc.t_PatentOrderInfo.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利详情
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int PatentOrderInfo_Update(t_PatentOrderInfo moble)
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
        /// 获取订单专利个数
        /// </summary>
        /// <param name="id"></param>
        public int PatentOrderInfo_Select_Count(int OID)
        {
            try
            {
                var iquery = from i in dzdc.t_PatentOrderInfo where i.i_OrderId == OID select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条专利详情
        /// </summary>
        /// <param name="id"></param>
        public t_PatentOrderInfo PatentOrderInfo_Select_Id(int id)
        {
            try
            {
                t_PatentOrderInfo model = dzdc.t_PatentOrderInfo.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<t_PatentOrderInfo> PatentOrderInfoList_Select_Id(int id)
        {
            try
            {
                IQueryable<t_PatentOrderInfo> model = from m in dzdc.t_PatentOrderInfo where m.i_PatentId == id select m;
                return model;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<t_PatentOrderInfo> PatentOrderInfoList_Select_Number(int oid)
        {
            try
            {
                IQueryable<t_PatentOrderInfo> model = from m in dzdc.t_PatentOrderInfo where m.i_OrderId == oid select m;
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部专利详情
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentOrderInfo> PatentOrderInfo_SelectAll()
        {
            return from i in dzdc.t_PatentOrderInfo orderby i.i_Id ascending select i;
        }
        /// <summary>
        /// 通过订单ID得到所有专利
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<t_PatentOrderInfo> PatentOrderInfo_Select_OrderId(int id)
        {
            return from i in dzdc.t_PatentOrderInfo where i.i_OrderId == id select i;
        }
    }
}
