using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.BLL
{
    public class bll_CouponRebateRules
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        dal_Member DALM = new dal_Member();
        dal_Coupon DALC = new dal_Coupon();
        bll_Coupon BLLC = new bll_Coupon();
        /// <summary>
        /// 现金券规则的实施
        /// </summary>
        /// <param name="CouponRebateRules"></param>
        /// <param name="MemberId"></param>
        /// <param name="CType"></param>
        public int CouponRebateRules_Com(string CouponRebateRules, int MemberId, int CType)
        {
            try
            {
                string[] Array_CouponType = CouponRebateRules.Split('|')[0].Split(',');
                string[] Array_GiveNumber = CouponRebateRules.Split('|')[1].Split(',');
                for (int i = 0; i < Array_CouponType.Length; i++)
                {
                    if (Array_CouponType[i] != "" && Array_GiveNumber[i] != "")
                    {
                        if (CType == 1)//赠送现金券
                        {
                            BLLC.Coupon_ForAdd(int.Parse(Array_GiveNumber[i]), DateTime.Now.AddMonths(1).ToString(), Array_CouponType[i], MemberId, "购物赠送");
                        }
                        else if (CType == 0)//删除现金券
                        {
                            var iquery = from p in dmdc.t_Coupon where p.i_MemberId == MemberId && p.i_State == 1 && p.i_Type == int.Parse(Array_CouponType[i]) select p;
                            foreach (var q in iquery.Take(int.Parse(Array_GiveNumber[i])))
                            {
                                dmdc.t_Coupon.DeleteOnSubmit(q);
                            }
                            dmdc.SubmitChanges();
                        }
                    }
                }
                return 1;
            }
            catch 
            {
                return 0; 
            }
        }
    }
}
