using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zscq.DAL
{
    public class dal_CouponTimeLength
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="AdvTypeModel"></param>
        /// <returns></returns>
        public int CouponTimeLength_Add(t_CouponTimeLength model)
        {
            try
            {
                dsdc.t_CouponTimeLength.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除指定
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public int CouponTimeLength_Del(int TId)
        {
            try
            {
                t_CouponTimeLength tmodel = dsdc.t_CouponTimeLength.FirstOrDefault(u => u.i_Id == TId);
                dsdc.t_CouponTimeLength.DeleteOnSubmit(tmodel);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="AdvModel"></param>
        /// <returns></returns>
        public int CouponTimeLength_Update(t_CouponTimeLength model)
        {
            try
            {
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_CouponTimeLength CouponTimeLength_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_CouponTimeLength.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ID获取信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public IQueryable<t_CouponTimeLength> CouponTimeLength_Select_All()
        {
            try
            {
                return from i in dsdc.t_CouponTimeLength select i;
            }
            catch
            {
                return null;
            }
        }

    }
}
