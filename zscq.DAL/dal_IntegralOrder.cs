using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Data;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_IntegralOrder
    {
        DataOrderDataContext dodc = new DataOrderDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int IntegralOrder_Add(t_IntegralOrder model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dodc.t_IntegralOrder.InsertOnSubmit(model);
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
        public int IntegralOrder_Del(int id)
        {
            try
            {
                t_IntegralOrder OrderInfo = dodc.t_IntegralOrder.SingleOrDefault(b => b.i_Id == id);
                if (OrderInfo != null)
                {
                    dodc.t_IntegralOrder.DeleteOnSubmit(OrderInfo);
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
        /// 存储过程删除订单以及订单详情
        /// </summary>
        /// <param name="id"></param>
        public int IntegralOrder_Del_ByProc(int id)
        {
            try
            {
                if (dodc.pro_IntegralOrder_Delete(id) == 0)
                {
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
        public int IntegralOrder_Update(t_IntegralOrder newmodel)
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
        public t_IntegralOrder IntegralOrder_Select_Id(int id)
        {
            try
            {
                t_IntegralOrder model = dodc.t_IntegralOrder.Single(a => a.i_Id == id);
                return model;
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
        public vw_IntegralOrder IntegralOrder_vw_Select_Id(int id)
        {
            try
            {
                vw_IntegralOrder m = dvdc.vw_IntegralOrder.SingleOrDefault(a => a.i_Id == id);
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
        public t_IntegralOrder IntegralOrder_Select_Number(string number)
        {
            try
            {
                t_IntegralOrder m = dodc.t_IntegralOrder.FirstOrDefault(a => a.nvc_OrderNumber == number);
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
        public IQueryable<t_IntegralOrder> IntegralOrder_Select_MemberId(int id)
        {
            var tables = from table in dodc.t_IntegralOrder where table.i_MemberId == id select table;
            return tables;
        }
        /// <summary>
        /// 根据Userid返回所有订单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int IntegralOrder_Count(int mid, int state)
        {
            var tables = from table in dodc.t_IntegralOrder where table.i_MemberId == mid && table.i_State == state select table;
            return tables.Count();
        }
        /// <summary>
        /// 根据IMId返回所有订单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int IntegralOrder_CountByMobileId(int mid)
        {
            var tables = from table in dodc.t_IntegralOrder where table.i_IntegralMobileId == mid select table;
            return tables.Count();
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
        public IQueryable<vw_IntegralOrder> IntegralOrder_vw_SelectPage(int startIndex, int pageSize, int mid, int states, ref int count)
        {
            if (mid != 0)
            {
                var iquery = from i in dvdc.vw_IntegralOrder where i.i_MemberId == mid select i;
                if (states != 0)
                {
                    iquery = from i in iquery where i.i_State == states orderby i.i_Id descending select i;
                }
                iquery = from i in iquery orderby i.i_Id descending select i;
                count = iquery.Count();
                return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
            }
            return null;
        }
        public IQueryable<vw_IntegralOrder> IntegralOrder_vw_SelectPage(int startIndex, int pageSize, int mid, int states, string order, bool desc, ref int count)
        {
            if (mid != 0)
            {
                var iquery = from i in dvdc.vw_IntegralOrder where i.i_MemberId == mid select i;
                if (states != 0)
                {
                    iquery = from i in iquery where i.i_State == states select i;
                }
                switch (order)
                {
                    case "nvc_OrderNumber":
                        if (desc)
                        { iquery = from i in iquery orderby i.nvc_OrderNumber descending select i; }
                        else
                        { iquery = from i in iquery orderby i.nvc_OrderNumber ascending select i; }
                        break;
                    case "i_SumIntegral":
                        if (desc)
                        { iquery = from i in iquery orderby i.i_SumIntegral descending select i; }
                        else
                        { iquery = from i in iquery orderby i.i_SumIntegral ascending select i; }
                        break;
                    case "i_State":
                        if (desc)
                        { iquery = from i in iquery orderby i.i_State descending select i; }
                        else
                        { iquery = from i in iquery orderby i.i_State ascending select i; }
                        break;
                    case "dt_AddTime":
                        if (desc)
                        { iquery = from i in iquery orderby i.dt_AddTime descending select i; }
                        else
                        { iquery = from i in iquery orderby i.dt_AddTime ascending select i; }
                        break;
                    case "i_Id":
                        if (desc)
                        { iquery = from i in iquery orderby i.i_Id descending select i; }
                        else
                        { iquery = from i in iquery orderby i.i_Id ascending select i; }
                        break;
                }
                count = iquery.Count();
                return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
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
        public IQueryable<vw_IntegralOrder> IntegralOrder_vw_SelectPage(int startIndex, int pageSize, string Keyword, int SType, int status, int PId, int CId, int AId, string STime, string ETime, ref int count)
        {
            var iquery = from i in dvdc.vw_IntegralOrder select i;
            if (status != 0)
            {
                iquery = from i in iquery where i.i_State == status select i;
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
                EDateTime = Convert.ToDateTime(ETime).AddDays(1);
            }
            iquery = from i in iquery where SDateTime < i.dt_AddTime && i.dt_AddTime < EDateTime select i;
            if (Keyword != "")
            {
                if (SType == 0)
                {
                    iquery = from i in iquery where i.nvc_OrderNumber.Contains(Keyword) || i.nvc_MemberName.Contains(Keyword) select i;
                }
                else if (SType == 1)
                {
                    iquery = from i in iquery where i.nvc_OrderNumber.Contains(Keyword) select i;
                }
                else if (SType == 2)
                {
                    iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
                }
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        public IQueryable<vw_IntegralOrder> IntegralOrder_vw_SelectAll()
        {
            var iquery = from i in dvdc.vw_IntegralOrder select i;
            iquery = from i in iquery orderby i.i_Id descending select i;
            return iquery;
        }
        public IQueryable<vw_IntegralOrder> IntegralOrder_vw_ByMobileID(int id)
        {
            var iquery = from i in dvdc.vw_IntegralOrder select i;
            iquery = from i in iquery where i.i_IntegralMobileId == id orderby i.i_Id descending select i;
            return iquery;
        }
        /// <summary>
        /// 返回后台订单状态
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_IntegralOrderState(object obj)
        {
            try
            {
                if (obj.ToString() == "1")
                    return "待处理";
                else if (obj.ToString() == "2")
                    return "待发货";
                else if (obj.ToString() == "3")
                    return "待收货";
                else if (obj.ToString() == "4")
                    return "已完成";
                else if (obj.ToString() == "5")
                    return "已退货";
                else if (obj.ToString() == "6")
                    return "已取消";
            }
            catch { }
            return "数据异常";
        }

        public string Set_IntegralOrderState(object obj,string gj)
        {
            try
            {
                if (gj == "en")
                {
                    if (obj.ToString() == "1")
                        return "Untreated";
                    else if (obj.ToString() == "2")
                        return "Under delivery";
                    else if (obj.ToString() == "3")
                        return "Under receipt";
                    else if (obj.ToString() == "4")
                        return "Completed";
                    else if (obj.ToString() == "5")
                        return "Returned";
                    else if (obj.ToString() == "6")
                        return "Cancel";
                }
                else if (gj == "kr")
                {
                    if (obj.ToString() == "1")
                        return "처리를 기다리다";
                    else if (obj.ToString() == "2")
                        return "백 오더";
                    else if (obj.ToString() == "3")
                        return "이따 물품";
                    else if (obj.ToString() == "4")
                        return "완료";
                    else if (obj.ToString() == "5")
                        return "이미 반품하다";
                    else if (obj.ToString() == "6")
                        return "취소";
                }
                else if (gj == "jp")
                {
                    if (obj.ToString() == "1")
                        return "未処理";
                    else if (obj.ToString() == "2")
                        return "待出荷";
                    else if (obj.ToString() == "3")
                        return "待荷受";
                    else if (obj.ToString() == "4")
                        return "已完成";
                    else if (obj.ToString() == "5")
                        return "すでに返品";
                    else if (obj.ToString() == "6")
                        return "キャンセル";
                }
                
            }
            catch { }
            return "数据异常";
        }
        /// <summary>
        /// 返回前台订单状态
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_IntegralOrderState_Show(object obj)
        {
            try
            {
                if (obj.ToString() == "1" || obj.ToString() == "2")
                    return "待发货";
                else if (obj.ToString() == "3")
                    return "待收货";
                else if (obj.ToString() == "4")
                    return "已完成";
                else if (obj.ToString() == "5")
                    return "已退货";
                else if (obj.ToString() == "6")
                    return "已取消";
            }
            catch { }
            return "数据异常";
        }

        public string Set_IntegralOrderState_Show(object obj, string gj)
        {
            try
            {
                if (gj == "en")
                {
                    if (obj.ToString() == "1" || obj.ToString() == "2")
                        return "Under delivery";
                    else if (obj.ToString() == "3")
                        return "Under receipt";
                    else if (obj.ToString() == "4")
                        return "Completed";
                    else if (obj.ToString() == "5")
                        return "Returned";
                    else if (obj.ToString() == "6")
                        return "Canceled";
                }
                else if (gj == "kr")
                {
                    if (obj.ToString() == "1" || obj.ToString() == "2")
                        return "백 오더";
                    else if (obj.ToString() == "3")
                        return "이따 물품";
                    else if (obj.ToString() == "4")
                        return "완료";
                    else if (obj.ToString() == "5")
                        return "이미 반품하다";
                    else if (obj.ToString() == "6")
                        return "취소";
                }
                else if (gj == "jp")
                {
                    if (obj.ToString() == "1" || obj.ToString() == "2")
                        return "待出荷";
                    else if (obj.ToString() == "3")
                        return "待荷受";
                    else if (obj.ToString() == "4")
                        return "已完成";
                    else if (obj.ToString() == "5")
                        return "すでに返品";
                    else if (obj.ToString() == "6")
                        return "キャンセル";
                }
            }
            catch { }
            return "数据异常";
        }
        /// <summary>
        /// 返回一个订单号
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public string Set_IntegralOrderNo(string Id)
        {
            int len = 8 - Id.Length;
            string orderno = Id + RndNum(len);
            t_IntegralOrder model = IntegralOrder_Select_Number(orderno);
            if (model != null)
            {
                Set_IntegralOrderNo(Id);
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

