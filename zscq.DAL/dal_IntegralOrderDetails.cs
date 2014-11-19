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
    public class dal_IntegralOrderDetails
    {
        DataOrderDataContext dodc = new DataOrderDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 添加订单详情
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralOrderDetails_Add(t_IntegralOrderDetails model)
        {
            try
            {
                dodc.t_IntegralOrderDetails.InsertOnSubmit(model);
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
        public int IntegralOrderDetails_Add(int OrderId, int ProductId, int Number, int Integral, int IntegralProductType)
        {
            try
            {
                t_IntegralOrderDetails model = new t_IntegralOrderDetails();
                model.i_IntegralOrderId = OrderId;
                model.i_IntegralProductId = ProductId;
                model.i_BuyNumber = Number;
                model.i_Integral = Integral;
                model.i_IntegralProductType = IntegralProductType;

                dodc.t_IntegralOrderDetails.InsertOnSubmit(model);
                dodc.SubmitChanges();
                return 1;
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
        public IQueryable<t_IntegralOrderDetails> IntegralOrderDetails_Select_OrderId(int OrderId)
        {
            var iquery = from i in dodc.t_IntegralOrderDetails where i.i_IntegralOrderId == OrderId select i;
            return iquery;
        }
        /// <summary>
        /// 根据订单ID获取订单该订单下的所有商品详细
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<vw_IntegralOrderDetails> IntegralOrderDetails_vw_Select_OrderId(int orderID)
        {
            var iquery = from i in dvdc.vw_IntegralOrderDetails where i.i_IntegralOrderId == orderID orderby i.i_Id descending select i;
            return iquery;
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
                        break;
                    case "2":
                        return "<span style=\"color:red;\">（团）</span>";
                        break;
                    case "3":
                        return "<span style=\"color:red;\">（秒）</span>";
                        break;
                }
            }
            catch { }
            return "";
        }
    }
}
