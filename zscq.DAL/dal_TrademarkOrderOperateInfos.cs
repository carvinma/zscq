using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_TrademarkOrderOperateInfos
    {
        DataZscqDataContext dc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int OrderOperateInfos_Add(t_TrademarkOrderOperateInfos model)
        {
            try
            {
                dc.t_TrademarkOrderOperateInfos.InsertOnSubmit(model);
                dc.SubmitChanges();
                return 1;
            }
            catch 
            {
                return 0;
            }
        }
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int NewOrderOperateInfos_Add(t_NewTrademarkOrderOperateInfos model)
        {
            try
            {
                dc.t_NewTrademarkOrderOperateInfos.InsertOnSubmit(model);
                dc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int OrderOperateInfos_Add(int OrderId, int ManagerId, int Type, string Beizhu)
        {
            try
            {
                t_TrademarkOrderOperateInfos model = new t_TrademarkOrderOperateInfos();
                model.i_OrderId = OrderId;
                model.dt_AddTime = DateTime.Now;
                model.i_ManagerId = ManagerId;
                model.i_Type = Type;
                model.nvc_Info_1 = Beizhu;
                dc.t_TrademarkOrderOperateInfos.InsertOnSubmit(model);
                dc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取操作信息
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="type">0全部,1发货人及收货人信息</param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrderOperateInfos> OrderOperateInfo_Select(int orderID, int type)
        {
            var iquery = from t in dvdc.vw_TrademarkOrderOperateInfos where t.i_OrderId == orderID select t;
            if (type != 0)
            {
                iquery = from i in iquery where i.i_Type == type select i;
            }
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            return iquery;
        }
        /// <summary>
        /// 获取操作信息
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="type">0全部,1发货人及收货人信息</param>
        /// <returns></returns>
        public IQueryable<vw_NewTrademarkOrderOperateInfos> NewOrderOperateInfo_Select(int orderID, int type)
        {
            var iquery = from t in dvdc.vw_NewTrademarkOrderOperateInfos where t.i_OrderId == orderID select t;
            if (type != 0)
            {
                iquery = from i in iquery where i.i_Type == type select i;
            }
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            return iquery;
        }
        public IQueryable<t_TrademarkOrderOperateInfos> OrderOperateInfo_Select_OrderID(int orderID)
        {
            var iquery = from t in dc.t_TrademarkOrderOperateInfos where t.i_OrderId == orderID orderby t.dt_AddTime descending select t;
            return iquery;
        }
        public IQueryable<t_NewTrademarkOrderOperateInfos> OrderOperateInfo_Select_New_OrderID(int orderID)
        {
            var iquery = from t in dc.t_NewTrademarkOrderOperateInfos where t.i_OrderId == orderID orderby t.dt_AddTime descending select t;
            return iquery;
        }
        /// <summary>
        /// 返回订单操作信息的状态
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_OperateState(object obj)
        {
            if (!String.IsNullOrEmpty(obj.ToString()))
            {
                if (obj.ToString() == "1")
                    return "以处理";
                else if (obj.ToString() == "2")
                    return "已付款";
                else if (obj.ToString() == "3")
                    return "已审核";
                else if (obj.ToString() == "4")
                    return "已确认";
                else if (obj.ToString() == "5")
                    return "取消";
                else
                    return "未知状态";
            }
            else
            {
                return "未知状态";
            }
        }
    }
}
