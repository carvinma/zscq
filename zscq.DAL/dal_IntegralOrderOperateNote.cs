using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_IntegralOrderOperateNote
    {
        DataOrderDataContext dodc = new DataOrderDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int IntegralOrderOperateNote_Add(t_IntegralOrderOperateNote model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dodc.t_IntegralOrderOperateNote.InsertOnSubmit(model);
                dodc.SubmitChanges();
                return 1;
            }
            catch 
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据订单Id获取操作信息
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="type">0全部,1发货人及收货人信息</param>
        /// <returns></returns>
        public IQueryable<vw_IntegralOrderOperateNote> IntegralOrderOperateNote_vw_Select(int orderID)
        {
            var iquery = from t in dvdc.vw_IntegralOrderOperateNote where t.i_OrderId == orderID select t;
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            return iquery;
        }
    }
}
