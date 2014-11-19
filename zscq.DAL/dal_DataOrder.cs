using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Web;

namespace zscq.DAL
{
    public class dal_DataOrder
    {
        DataZscqDataContext dsdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据订单表
        /// </summary>
        /// <param name="AdvTypeModel"></param>
        /// <returns></returns>
        public int DataOrder_Add(t_DataOrder model)
        {
            try
            {
                dsdc.t_DataOrder.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除指定订单录入
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public int DataOrder_Del(int TId)
        {
            try
            {
                t_DataOrder tmodel = dsdc.t_DataOrder.FirstOrDefault(u => u.i_Id == TId);
                dsdc.t_DataOrder.DeleteOnSubmit(tmodel);
                dsdc.SubmitChanges();
                return 1;
            }
            catch 
            {
                return 0;
            }
        }
        /// <summary>
        /// 更新订单
        /// </summary>
        /// <param name="AdvModel"></param>
        /// <returns></returns>
        public int DataOrder_Update(t_DataOrder model)
        {
            try
            {
                t_DataOrder Newmodel = dsdc.t_DataOrder.SingleOrDefault(b => b.i_Id == model.i_Id);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

      
        /// <summary>
        /// 根据ID获取订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_DataOrder DataOrder_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_DataOrder.FirstOrDefault(u => u.i_Id == TId);
            }
            catch 
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ID获取商标订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_DataOrder DataOrder_vw_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_DataOrder.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据账单号获取商标订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_DataOrder DataOrder_Select_num(string num)
        {
            try
            {
                return dsdc.t_DataOrder.FirstOrDefault(u => u.nvc_OrderNum == num);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据账单号获取商标订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <param name="type">2是商标   1是专利</param>
        /// <returns></returns>
        public t_DataOrder DataOrder_Select_num(string num,int type)
        {
            try
            {
                return dsdc.t_DataOrder.FirstOrDefault(u => u.nvc_OrderNum == num&&u.i_OrderType==type);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据账单号获取商标订单信息 排除当前id
        /// </summary>
        /// <param name="i_Id"></param>
        /// <param name="type">2是商标   1是专利</param>
        /// <returns></returns>
        public t_DataOrder DataOrder_Select_num(string num, int type,int id)
        {
            try
            {
                return dsdc.t_DataOrder.FirstOrDefault(u => u.nvc_OrderNum == num && u.i_OrderType == type&&u.i_Id!=id);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据账单号或 商标id获取商标订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public IQueryable<t_DataOrder> DataOrder_Select_Bynum(string num, int tid)
        {
               var iquery = from i in dsdc.t_DataOrder select i;

            if(num!="")
            {
             iquery = from i in iquery where i.nvc_OrderNum == num select i;
            }
            if(tid!=0)
            {
                 iquery = from i in iquery where i.i_DataId == tid select i;
               
            }
            return iquery;
        }
       
        /// <summary>
        /// 商标订单分页数据
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>

        /// <param name="SType">是商品订单还是专利订单</param>
        /// <param name="status"></param>
      
        /// <param name="TimeType"></param>
        /// <param name="STime"></param>
        /// <param name="ETime"></param>
        /// <param name="DealerId"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_DataOrder> DataOrder_SelectPage(int startIndex, int pageSize,int id, int SType, string STime, string ETime, ref int count)
        {
            var iquery = from i in dsdc.t_DataOrder where i.i_DataId==id select i;

            if (SType != 0)
            {
                iquery = from i in iquery where i.i_OrderType == SType select i;
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
                iquery = from i in iquery where SDateTime < i.dt_Addtime && i.dt_Addtime < EDateTime select i;
            iquery = from i in iquery orderby i.i_Id ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        public IQueryable<t_DataOrder> DataOrder_SelectPage(int startIndex, int pageSize, int SType, string STime, string ETime, ref int count)
        {
            var iquery = from i in dsdc.t_DataOrder select i;

            if (SType != 0)
            {
                iquery = from i in iquery where i.i_OrderType == SType select i;
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
            iquery = from i in iquery where SDateTime < i.dt_Addtime && i.dt_Addtime < EDateTime select i;
            iquery = from i in iquery orderby i.i_Id ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 返回一个订单号
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public string Set_OrderNo()
        {
            int len = 8;
            string orderno = RndNum(len);        
                return orderno;        
        }
        /// <summary>
        /// 生成随机的字母
        /// </summary>
        /// <param name="VcodeNum">生成字母的个数</param>
        /// <returns>string</returns>
        private string RndNum(int VcodeNum)
        {
            string Vchar = "1,2,3,4,5,6,7,8,9,0,A,B,C,D,E,F,G,Q";
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
