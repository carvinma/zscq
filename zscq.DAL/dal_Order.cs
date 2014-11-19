using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Data;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Order
    {
        DataOrderDataContext dodc = new DataOrderDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int Order_Add(t_Orders model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dodc.t_Orders.InsertOnSubmit(model);
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        public int Order_Del(int id)
        {
            try
            {
                t_Orders OrderInfo = dodc.t_Orders.SingleOrDefault(b => b.i_Id == id);
                if (OrderInfo != null)
                {
                    dodc.t_Orders.DeleteOnSubmit(OrderInfo);
                    dodc.SubmitChanges();
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
        /// 修改
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Order_Update(t_Orders newmodel)
        {
            try
            {
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据id返回单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Orders Order_Select_Id(int id)
        {
            try
            {
                t_Orders m = dodc.t_Orders.Single(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据id返回单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public vw_Order Order_vw_Select_Id(int id)
        {
            try
            {
                vw_Order m = dvdc.vw_Order.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ordrnumber返回单条记录张帅虎
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Orders Order_Select_Number(string number)
        {
            try
            {
                t_Orders m = dodc.t_Orders.FirstOrDefault(a => a.nvc_OrderNumber == number);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据Userid返回所有订单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<t_Orders> Order_Select_MemberId(int id)
        {
            var tables = from table in dodc.t_Orders where table.i_MemberId == id select table;
            return tables;
        }
        /// <summary>
        /// 根据Userid返回所有订单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<vw_Order> Order_vw_Select_MemberId(int startIndex, int pageSize, int id, ref int count)
        {
            var iquery = from i in dvdc.vw_Order where i.i_MemberId == id orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 根据产品ID获取所有订单
        /// </summary>
        /// <param name="Pageindex"></param>
        /// <param name="Pagesize"></param>
        /// <param name="ProductId"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public List<t_Orders> Order_Select_ProductId(int Pageindex, int Pagesize, int ProductId, ref int count)
        {
            var iquery = from i in dodc.t_OrderDetails where i.i_ProductId == ProductId select i;
            string order = "";
            foreach (var q in iquery)
            {
                order += "," + q.i_OrderId;
            }
            if (order != "")
            {
                order = order.Substring(1, order.Length - 1);
                string SQL = "select * from t_Orders where OrderId in (" + order + ") order by i_Id desc";
                count = dodc.ExecuteQuery<t_Orders>(SQL).ToList().Count;
                return dodc.ExecuteQuery<t_Orders>(SQL).Skip((Pageindex - 1) * Pagesize).Take(Pagesize).ToList();
            }
            return null;
        }
        /// <summary>
        /// 订单列表分页获取,
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="status"></param>
        /// <param name="orderNumber"></param>
        /// <param name="userName"></param>
        /// <param name="realName"></param>
        /// <param name="tel"></param>
        /// <param name="orderTimeStart"></param>
        /// <param name="orderTimeEnd"></param>
        /// <param name="payTimeStart"></param>
        /// <param name="payTimeEnd"></param>
        /// <param name="dealer"></param>
        /// <param name="dealerID"></param>
        /// <param name="userID"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_Order> Order_SelectPage(int startIndex, int pageSize, string Keyword, int SType, int status, int PId, int CId, int AId, int TimeType, string STime, string ETime, int DealerId, ref int count)
        {
            var iquery = from i in dvdc.vw_Order select i;
            if (DealerId != 0)
            {
                iquery = from i in iquery where i.i_DealerId == DealerId select i;
            }
            if (status != 0)
            {
                iquery = from i in iquery where i.Status == status select i;
            }
            if (Keyword != "")
            {
                if (SType == 1)
                {
                    iquery = from i in iquery where i.nvc_OrderNumber.Contains(Keyword) select i;
                }
                else if (SType == 2)
                {
                    iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
                }
                else if (SType == 3)
                {
                    iquery = from i in iquery where i.nvc_MemberRealName.Contains(Keyword) select i;
                }
            }
            if (PId != 0)
            {
                iquery = from i in iquery where i.i_Address_PId == PId select i;
            }
            if (CId != 0)
            {
                iquery = from i in iquery where i.i_Address_CId == CId select i;
            }
            if (AId != 0)
            {
                iquery = from i in iquery where i.i_Address_AId == AId select i;
            }

            DateTime SDateTime = DateTime.Now.AddYears(-10);
            if (STime != null && STime != "")
            {
                SDateTime = Convert.ToDateTime(STime);
            }
            DateTime EDateTime = DateTime.Now.AddDays(1);
            if (ETime != null && ETime != "")
            {
                EDateTime = Convert.ToDateTime(ETime);
            }
            if (TimeType == 1)
            {
                iquery = from i in iquery where SDateTime < i.dt_AddTime && i.dt_AddTime < EDateTime select i;
            }
            else if (TimeType == 2)
            {
                iquery = from i in iquery where SDateTime < i.dt_PayTime && i.dt_PayTime < EDateTime select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 应收账款
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="hot_start_date"></param>
        /// <param name="hot_end_date"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable Order_yingshou_Count(int pageindex, int pagesize, string hot_start_date, string hot_end_date, ref int count)
        {
            DateTime startdata = hot_start_date != "" ? Convert.ToDateTime(hot_start_date) : DateTime.Now.AddYears(-10);
            DateTime enddata = hot_end_date != "" ? Convert.ToDateTime(hot_end_date).AddDays(1) : DateTime.Now.AddDays(1);
            var iquery = from i in dvdc.vw_Order
                         where i.Status == 5 && i.nvc_PayWay == "货到付款" && startdata < i.dt_AddTime && i.dt_AddTime < enddata
                         group i by new
                         {
                             i.i_MemberId,
                             i.nvc_MemberName,
                             i.dm_SumMoney
                         } into g
                         select new
                         {
                             Money = g.Sum(a => a.dm_SumMoney),
                             g.Key.i_MemberId,
                             g.Key.nvc_MemberName
                         };
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 预收账款
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="hot_start_date"></param>
        /// <param name="hot_end_date"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable Order_yushou_Count(int pageindex, int pagesize, string hot_start_date, string hot_end_date, ref int count)
        {
            DateTime startdata = hot_start_date != "" ? Convert.ToDateTime(hot_start_date) : DateTime.Now.AddYears(-10);
            DateTime enddata = hot_end_date != "" ? Convert.ToDateTime(hot_end_date).AddDays(1) : DateTime.Now.AddDays(1);
            var iquery = from i in dvdc.vw_Order
                         where i.Status > 2 && i.Status < 5 && i.nvc_PayWay != "货到付款" && startdata < i.dt_AddTime && i.dt_AddTime < enddata
                         group i by new
                         {
                             i.i_MemberId,
                             i.nvc_MemberName,
                             i.dm_SumMoney
                         } into g
                         select new
                         {
                             Money = g.Sum(a => a.dm_SumMoney),
                             g.Key.i_MemberId,
                             g.Key.nvc_MemberName
                         };
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 返回后台订单状态
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_OrderState(object obj)
        {
            try
            {
                if (obj.ToString() == "1")
                    return "待处理";
                else if (obj.ToString() == "2")
                    return "待付款";
                else if (obj.ToString() == "3")
                    return "已付款";
                else if (obj.ToString() == "4")
                    return "待发货";
                else if (obj.ToString() == "5")
                    return "待收货";
                else if (obj.ToString() == "6")
                    return "已完成";
                else if (obj.ToString() == "7")
                    return "已退货";
                else if (obj.ToString() == "8")
                    return "已取消";
                else if (obj.ToString() == "9")
                    return "已退款";
                else if (obj.ToString() == "10")
                    return "申请退货";
            }
            catch { }
            return "数据异常";
        }
        /// <summary>
        /// 返回前台订单状态
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_OrderState_Show(object obj)
        {
            try
            {
                if (obj.ToString() == "1")
                    return "待处理";
                else if (obj.ToString() == "2")
                    return "待付款";
                else if (obj.ToString() == "3" || obj.ToString() == "4")
                    return "待发货";
                else if (obj.ToString() == "5")
                    return "待收货";
                else if (obj.ToString() == "6")
                    return "已完成";
                else if (obj.ToString() == "7")
                    return "已退货";
                else if (obj.ToString() == "8")
                    return "已取消";
                else if (obj.ToString() == "9")
                    return "已退款";
                else if (obj.ToString() == "10")
                    return "申请退货";
            }
            catch { }
            return "数据异常";
        }
        /// <summary>
        /// 返回一个订单号
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public string Set_OrderNo(string Id)
        {
            int len = 8 - Id.Length;
            string orderno = Id + RndNum(len);
            t_Orders model = Order_Select_Number(orderno);
            if (model != null)
            {
                Set_OrderNo(Id);
            }
            else
            {
                return orderno;
            }
            return "";
        }
        /// <summary>
        /// 生成随机的字母
        /// </summary>
        /// <param name="VcodeNum">生成字母的个数</param>
        /// <returns>string</returns>
        private string RndNum(int VcodeNum)
        {
            string Vchar = "1,2,3,4,5,6,7,8,9,0";
            string[] VcArray = Vchar.Split(',');
            string VNum = ""; //由于字符串很短，就不用StringBuilder了
            int temp = -1; //记录上次随机数值，尽量避免生产几个一样的随机数
            //采用一个简单的算法以保证生成随机数的不同
            Random rand = new Random();
            for (int i = 1; i < VcodeNum + 1; i++)
            {
                if (temp != -1)
                {
                    rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
                }
                int t = rand.Next(VcArray.Length);
                if (temp != -1 && temp == t)
                {
                    return RndNum(VcodeNum);
                }
                temp = t;
                VNum += VcArray[t];
            }
            return VNum;
        }
    }
}

