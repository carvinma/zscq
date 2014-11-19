using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Bank
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        /// <summary>
        /// 插入数据银行
        /// </summary>
        /// <param name="model"></param>
        public int Bank_Add(t_Bank model)
        {
            try
            {
                dzdc.t_Bank.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除银行
        /// </summary>
        /// <param name="id"></param>
        public int Bank_Del(int id)
        {
            try
            {
                t_Bank product = dzdc.t_Bank.SingleOrDefault(b => b.i_Id == id);
                if (product != null)
                {
                    dzdc.t_Bank.DeleteOnSubmit(product);
                    dzdc.SubmitChanges();
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
        /// 修改银行
        /// </summary>
        /// <param name="Model"></param>
        public int Bank_Update(t_Bank model)
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
        /// 根据id返回一条银行信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Bank Bank_Select_Id(int id)
        {
            try
            {
                t_Bank m = (from a in dzdc.t_Bank where (a.i_Id == id) select a).FirstOrDefault();
                return m;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 返回全部类别列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Bank> Bank_SelectAll()
        {
            return from i in dzdc.t_Bank orderby i.i_Id ascending select i;
        }

        public IQueryable<t_Bank> Bank_Select_FaPiaoAndGuoJi(int guoji)
        {
            var iquery = from c in dzdc.t_Bank where c.i_GuoJiType==guoji select c;
            return iquery;
        }
        /// <summary>
        /// 分页显示
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_Bank> Bank_SelectPage(int PageIndex, int PageSize, ref int count)
        {
            var iquery = from c in dzdc.t_Bank orderby c.i_Id descending select c;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
    }
}
