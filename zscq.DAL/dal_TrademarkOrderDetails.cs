using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_TrademarkOrderDetails
    {
        DataZscqDataContext dodc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();


        /// <summary>
        /// 添加订单详情
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OrderDetails_Add(t_TrademarkOrderDetails model)
        {
            try
            {
                dodc.t_TrademarkOrderDetails.InsertOnSubmit(model);
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 添加订单详情
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OrderDetails_Add(t_NewTrademarkOrderDetails model)
        {
            try
            {
                dodc.t_NewTrademarkOrderDetails.InsertOnSubmit(model);
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改订单ID退货用到
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int OrderDetails_Update_OrderId(t_TrademarkOrderDetails model)
        {
            try
            {
                t_TrademarkOrderDetails OD = dodc.t_TrademarkOrderDetails.SingleOrDefault(a => a.i_Id == model.i_Id);
                if (OD != null)
                {
                    OD.i_OrderId = model.i_OrderId;
                    dodc.SubmitChanges();
                }
                return 0;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据订单ID获取订单详情
        /// </summary>
        /// <param name="OrderId"></param>
        /// <returns></returns>
        public IQueryable<t_TrademarkOrderDetails> OrderDetails_Select_OrderId(int OrderId)
        {
            var iquery = from i in dodc.t_TrademarkOrderDetails where i.i_OrderId == OrderId select i;
            return iquery;
        }
        /// <summary>
        /// 根据订单ID获取订单详情
        /// </summary>
        /// <param name="OrderId"></param>
        /// <returns></returns>
        public IQueryable<t_NewTrademarkOrderDetails> NewOrderDetails_Select_OrderId(int OrderId)
        {
            var iquery = from i in dodc.t_NewTrademarkOrderDetails where i.i_OrderId == OrderId select i;
            return iquery;
        }
        /// <summary>
        /// 根据商标编号ID获取订单详情
        /// </summary>
        /// <param name="OrderId"></param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrderDetails> OrderDetails_Select_SbNum(string sbnum)
        {
            var iquery = from i in dvdc.vw_TrademarkOrderDetails where i.nvc_SBRegNum.Contains(sbnum) select i;
            return iquery;
        }
        /// <summary>
        /// 根据订单ID获取订单该订单下的所有商品详细
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrderDetails> OrderDetails_vw_Select_OrderId(int orderID)
        {
            var data = from i in dvdc.vw_TrademarkOrderDetails where i.i_OrderId == orderID select i;
            return data;
        }
        /// <summary>
        /// 根据订单ID获取订单该订单下的所有商品详细
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<vw_NewTrademarkOrderDetails> NewOrderDetails_vw_Select_OrderId(int orderID)
        {
            var data = from i in dvdc.vw_NewTrademarkOrderDetails where i.i_OrderId == orderID select i;
            return data;
        }
        /// <summary>
        /// 根据订单ID获取订单该订单下的所有商品详细
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrderDetails> OrderDetails_vw_Select_OrderId(int orderID, int State)
        {
            var iquery = from i in dvdc.vw_TrademarkOrderDetails where i.i_OrderId == orderID select i;
            if (State != -1)
            {
                iquery = from i in iquery where i.i_State == State select i;
            }
            return iquery;
        }
        /// <summary>
        /// 根据订单ID获取订单该订单下的所有商品详细
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrderDetails> OrderDetails_vw_Select_MemberId(int startIndex, int pageSize, int MemberId, ref int count)
        {
            var iquery = from i in dvdc.vw_TrademarkOrderDetails where i.i_MemberId == MemberId && i.i_State == null orderby i.i_TrademarkId descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 根据订单Id和产品Id获取一条数据
        /// </summary>
        /// <param name="OrderId"></param>
        /// <param name="ProductId"></param>
        /// <returns></returns>
        public t_TrademarkOrderDetails OrderDetails_Select_OrderId_ProductId(int OrderId, int TrademarkId)
        {
            try
            {
                t_TrademarkOrderDetails model = dodc.t_TrademarkOrderDetails.SingleOrDefault(a => a.i_OrderId == OrderId && a.i_TrademarkId == TrademarkId);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 财务统计
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="hot_start_date"></param>
        /// <param name="hot_end_date"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable Product_Count(int pageindex, int pagesize, string hot_start_date, string hot_end_date, int Category, int Brand, ref int numbers, ref decimal moneys, ref int count)
        {
            DateTime startdata = hot_start_date != "" ? Convert.ToDateTime(hot_start_date) : DateTime.Now.AddYears(-10);
            DateTime enddata = hot_end_date != "" ? Convert.ToDateTime(hot_end_date).AddDays(1) : DateTime.Now.AddDays(1);
            var iquery = from i in dvdc.vw_Count
                         where i.Status == 6 && startdata < i.dt_AddTime && i.dt_AddTime < enddata && (("," + i.nvc_Categorystr + ",").IndexOf("," + Category + ",") > -1) && ((i.i_BrandId == Brand) || (Brand == 0))
                         group i by new
                         {
                             i.i_ProductId,
                             i.nvc_Name,
                             i.nvc_No,
                             i.nvc_Picmain,
                             i.i_Number,
                             i.dm_CostPrice
                         } into g
                         select new
                         {
                             E = g.Sum(a => a.i_Number * a.dm_Price),
                             B = g.Sum(a => a.i_Number * a.dm_CostPrice),
                             L = g.Sum(a => a.i_Number * a.dm_Price) - g.Sum(a => a.i_Number * a.dm_CostPrice),
                             Buys = g.Sum(a => a.i_Number),
                             //Money = Math.Round(Convert.ToDecimal(g.Sum(a => a.i_Number * a.dm_Price)), 2, MidpointRounding.AwayFromZero),
                             Money = g.Sum(a => a.i_Number * a.dm_Price),
                             g.Key.i_ProductId,
                             g.Key.nvc_Name,
                             g.Key.nvc_No,
                             g.Key.nvc_Picmain,
                             g.Key.i_Number
                         };
            foreach (var q in iquery)
            {
                numbers += q.Buys;
                moneys += q.Money;
            }
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 获取产品类型
        /// </summary>
        /// <param name="PageType"></param>
        /// <returns></returns>
        public string Set_ProductType(object PageType)
        {
            try
            {
                switch (PageType.ToString())
                {
                    case "1":
                        return "<span style=\"color:red;\">（抢）</span>";
                    case "2":
                        return "<span style=\"color:red;\">（团）</span>";
                    case "3":
                        return "<span style=\"color:red;\">（秒）</span>";
                }
            }
            catch { }
            return "";
        }
        /// <summary>
        /// 根据订单OID获取数量
        /// </summary>
        /// <param name="OrderId"></param>
        /// <param name="ProductId"></param>
        /// <returns></returns>
        public int OrderDetails_Select_Count(int OrderId)
        {
            try
            {
                var iquery = from i in dodc.t_TrademarkOrderDetails where i.i_OrderId == OrderId select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据订单OID获取数量
        /// </summary>
        /// <param name="OrderId"></param>
        /// <param name="ProductId"></param>
        /// <returns></returns>
        public int NewOrderDetails_Select_Count(int OrderId)
        {
            try
            {
                var iquery = from i in dodc.t_NewTrademarkOrderDetails where i.i_OrderId == OrderId select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
    }
}
