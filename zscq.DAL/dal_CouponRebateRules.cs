using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_CouponRebateRules
    {
        DataSystemDataContext dsidc = new DataSystemDataContext();
        /// <summary>
        /// 添加现金券购返规则
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int CouponRebateRules_Add(t_CouponRebateRules model)
        {
            try
            {
                dsidc.t_CouponRebateRules.InsertOnSubmit(model);
                dsidc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据本表ID删除现金券购返规则
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int CouponRebateRules_Del(int SRId)
        {
            try
            {
                t_CouponRebateRules model = dsidc.t_CouponRebateRules.SingleOrDefault(a => a.i_Id == SRId);
                if (model != null)
                {
                    dsidc.t_CouponRebateRules.DeleteOnSubmit(model);
                    dsidc.SubmitChanges();
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
        /// 修改现金券购返规则
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int CouponRebateRules_Update(t_CouponRebateRules model)
        {
            try
            {
                t_CouponRebateRules Newmodel = dsidc.t_CouponRebateRules.Single(b => b.i_Id== model.i_Id);
                if (Newmodel != null)
                {
                    Newmodel.i_State = model.i_State;
                    Newmodel.i_Type = model.i_Type;
                    Newmodel.i_Where = model.i_Where;
                    Newmodel.nvc_CouponType = model.nvc_CouponType;
                    Newmodel.nvc_GiveNumber = model.nvc_GiveNumber;
                    Newmodel.nvc_SId = model.nvc_SId;
                    dsidc.SubmitChanges();
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
        /// 查询单个现金券购返规则
        /// </summary>
        /// <returns></returns>
        public t_CouponRebateRules CouponRebateRules_Select_Id(int TId)
        {
            return dsidc.t_CouponRebateRules.FirstOrDefault(i => i.i_Id == TId);
        }
        /// <summary>
        /// 获取现金券购返规则
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_CouponRebateRules> CouponRebateRules_Select_Where(int PageIndex, int PageSize, decimal Where, int State, ref int ccount)
        {
            var iquery = from i in dsidc.t_CouponRebateRules select i;
            if (Where != 0)
            {
                iquery = from i in iquery where i.i_Where <= Where select i;
            }
            if (State != 0)
            {
                iquery = from i in iquery where i.i_State == State select i;
            }
            ccount = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
    }
}
