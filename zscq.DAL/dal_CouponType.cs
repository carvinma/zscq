using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_CouponType
    {
        DataMemberDataContext dodc = new DataMemberDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int CouponType_Add(t_CouponType model)
        {
            try
            {
                dodc.t_CouponType.InsertOnSubmit(model);
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
        public int CouponType_Del(int id)
        {
            try
            {
                t_CouponType OrderInfo = dodc.t_CouponType.SingleOrDefault(b => b.i_Id == id);
                if (OrderInfo != null)
                {
                    dodc.t_CouponType.DeleteOnSubmit(OrderInfo);
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
        public int CouponType_Update(t_CouponType newmodel)
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
        /// 根据id获取单条优惠卷记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_CouponType CouponType_Select_Id(int id)
        {
            try
            {
                t_CouponType t_CouponType = dodc.t_CouponType.SingleOrDefault(Coupon => Coupon.i_Id == id);
                return t_CouponType;
            }
            catch
            {
                return null;
            }
        }
    }
}
