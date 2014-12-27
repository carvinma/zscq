using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Coupon
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        DataSystemDataContext dsdc = new DataSystemDataContext();

        #region 现金券
        /// <summary>
        /// 添加现金券
        /// </summary>
        /// <param name="type">卡片种类</param>
        /// <param name="referral">推荐码</param>
        /// <returns></returns>
        public int Coupon_Add(t_Coupon newmodel)
        {
            try
            {
                dmdc.t_Coupon.InsertOnSubmit(newmodel);
                dmdc.SubmitChanges();
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
        /// <param name="caseModel"></param>
        /// <returns></returns>
        public int Coupon_Del(int id)
        {
            try
            {
                t_Coupon gf = dmdc.t_Coupon.SingleOrDefault(u => u.i_Id == id);
                if (gf != null)
                {
                    dmdc.t_Coupon.DeleteOnSubmit(gf);
                    dmdc.SubmitChanges();
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
        /// <param name="caseModel"></param>
        /// <returns></returns>
        public int Coupon_Update(t_Coupon model)
        {
            try
            {
                model.dt_UpdateStateTime = DateTime.Now;
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// 修改
        /// </summary>
        /// <param name="caseModel"></param>
        /// <returns></returns>
        public int Coupon_Update2(t_Coupon model)
        {
            try
            {
                //model.dt_UpdateStateTime = DateTime.Now;
                dmdc.SubmitChanges();
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
        public t_Coupon Coupon_Select_Id(int id)
        {
            try
            {
                t_Coupon t_Coupon = dmdc.t_Coupon.SingleOrDefault(Coupon => Coupon.i_Id == id);
                return t_Coupon;
            }
            catch
            {
                return null;
            }
        }
       
        /// 根据订单ID获取订单该订单下的所有商品详细
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public IQueryable<t_Coupon> Coupon_Select_OrderIds(string orderID)
        {
            var data = from i in dmdc.t_Coupon where i.nvc_OrderNumber == orderID select i;
            return data;
        }
        /// <summary>
        /// 根据id获取单条优惠卷记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public vw_Coupon Coupon_Select_Vw_Id(int id)
        {
            try
            {
                vw_Coupon t_Coupon = dvdc.vw_Coupon.SingleOrDefault(Coupon => Coupon.i_Id == id);
                return t_Coupon;
            }
            catch
            {
                return null;
            }
        }
        public vw_Coupon VwCoupon_Select_Id(int id)
        {
            try
            {
                vw_Coupon t_Coupon = dvdc.vw_Coupon.SingleOrDefault(Coupon => Coupon.i_Id == id);
                return t_Coupon;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据会员ID获取优惠劵
        /// </summary>
        /// <param name="PId"></param>
        /// <returns></returns>
        public IQueryable<vw_Coupon> Coupon_Select_Page_MemberId(int PageIndex, int PageSize, int MId, int State, ref int ccount)
        {
            var iquery = from i in dvdc.vw_Coupon where i.i_MemberId == MId select i;
            if (State != 0)
            {
                iquery = from i in iquery where i.i_State == State select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            ccount = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        /// <summary>
        /// 根据会员ID获取优惠劵
        /// </summary>
        /// <param name="PId"></param>
        /// <returns></returns>
        public IQueryable<vw_Coupon> Coupon_Select_Page_MemberYouHui(int PageIndex, int PageSize, int MId, ref int ccount)
        {
            var iquery = from i in dvdc.vw_Coupon where i.i_MemberId == MId select i;           
            iquery = from i in iquery where i.i_State == 1 select i;  //未使用      
            DateTime nowdate=DateTime.Now;
            //iquery = from i in iquery where Convert.ToDateTime(i.dt_AddTime.ToString())< nowdate  && nowdate < Convert.ToDateTime(i.dt_ExpireTime.ToString()) orderby i.i_Id descending select i;
            //永久有效
            iquery = from i in iquery where i.dt_AddTime < nowdate && nowdate < (i.dt_ExpireTime.HasValue? i.dt_ExpireTime:DateTime.MaxValue) orderby i.i_Id descending select i;
            ccount = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        /// <summary>
        /// 根据会员ID获取【过期】优惠劵
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="MId"></param>
        /// <param name="State"></param>
        /// <param name="ccount"></param>
        /// <returns></returns>
        public int Coupon_Select_Page_MemberId_OutTime(int MId)
        {
            int hhcount = 0;
            var iquery = from i in dvdc.vw_Coupon where i.i_MemberId == MId && i.i_State==3  select i;
            hhcount = iquery.Count();
            return hhcount;
        }
        /// <summary>
        /// 分页获取现金券记录
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_Coupon> Coupon_Select_Page(int startIndex, int pageSize, string Keyword, string SType, int Member, string TType, string State, string TimeType, string stime, string etime, ref int count)
        {
            DateTime BTime = DateTime.Now.AddYears(-10);
            if (stime != "")
            {
                BTime = DateTime.Parse(stime);
            }
            //DateTime ETime = DateTime.Now.AddDays(1);
            DateTime ETime = DateTime.MaxValue;
            if (etime != "")
            {
                ETime = DateTime.Parse(etime);
            }
            var iquery = from i in dvdc.vw_Coupon select i;
            if (Keyword != "")
            {
                if (SType == "1")
                {
                    iquery = from i in iquery where i.nvc_Code.Contains(Keyword) select i;
                }
                else if (SType == "2")
                {
                    iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
                }
            }
            if (Member != 0)
            {
                if (Member == 1)
                {
                    iquery = from i in iquery where i.i_MemberId != 0 select i;
                }
                else
                {
                    iquery = from i in iquery where i.i_MemberId ==Member select i;
                }
            }
            if (TType != "0")
            {
                iquery = from i in iquery where i.i_Type == int.Parse(TType) select i;
            }
            if (State != "0")
            {
                iquery = from i in iquery where i.i_State == int.Parse(State) select i;
            }
            switch (TimeType)
            {
                case "1":
                    iquery = from i in iquery where BTime < i.dt_AddTime && i.dt_AddTime < ETime select i;
                    break;
                case "2":
                    iquery = from i in iquery where BTime < i.dt_ExpireTime && i.dt_ExpireTime < ETime select i;
                    break;
                case "3":
                    iquery = from i in iquery where BTime < i.dt_UpdateStateTime && i.dt_UpdateStateTime < ETime select i;
                    break;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        #endregion

        #region 现金券种类
        /// <summary>
        /// 增加现金券种类
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int CouponType_Add(t_CouponType model)
        {
            try
            {
                dmdc.t_CouponType.InsertOnSubmit(model);
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除现金券种类
        /// </summary>
        /// <param name="id"></param>
        public int CouponType_Del(int id)
        {
            try
            {
                t_CouponType i_Type = dmdc.t_CouponType.Single(b => b.i_Id == id);
                if (i_Type != null)
                {
                    dmdc.t_CouponType.DeleteOnSubmit(i_Type);
                    dmdc.SubmitChanges();

                    //修改现金券购返规则
                    var iquery = from i in dsdc.t_CouponRebateRules where (i.nvc_CouponType + ',').Contains(',' + id.ToString() + ',') select i;
                    foreach (var q in iquery)
                    {
                        string[] Array_CouponType = q.nvc_CouponType.Split(',');
                        string[] Array_GiveNumber = q.nvc_GiveNumber.Split(',');
                        string CouponType = "";
                        string GiveNumber = "";
                        for (int i = 0; i < Array_CouponType.Length; i++)
                        {
                            if (Array_CouponType[i] != "")
                            {
                                if (Array_CouponType[i] != id.ToString())
                                {
                                    CouponType += "," + Array_CouponType[i];
                                    GiveNumber += "," + Array_GiveNumber[i];
                                }
                            }
                        }
                        q.nvc_CouponType = CouponType;
                        q.nvc_GiveNumber = GiveNumber;
                    }
                    dsdc.SubmitChanges();
                    //删除现金券种类已经为空的规则
                    var iquerydel = from i in dsdc.t_CouponRebateRules where i.nvc_CouponType == "" select i;
                    foreach (var q in iquerydel)
                    {
                        dsdc.t_CouponRebateRules.DeleteOnSubmit(q);
                    }
                    dsdc.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 现金券种类修改
        /// </summary>
        /// <param name="caseModel"></param>
        /// <returns></returns>
        public int CouponType_Update(t_CouponType model)
        {
            try
            {
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 查询现金券全部种类
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_CouponType> CouponType_Select_All()
        {
            return from i in dmdc.t_CouponType select i;
        }
        /// <summary>
        /// 查询单个现金券种类
        /// </summary>
        /// <returns></returns>
        public t_CouponType CouponType_Select_Id(int TId)
        {
            return dmdc.t_CouponType.FirstOrDefault(i => i.i_Id == TId);
        }
        /// <summary>
        /// 分页条件查询现金券
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="SType"></param>
        /// <param name="Keyword"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_CouponType> CouponType_Select_Page(int PageIndex, int PageSize, int SType, string Keyword, int Give, ref int count)
        {
            var iquery = from i in dmdc.t_CouponType select i;
            if (SType != 0)
            {
                iquery = from i in iquery where i.i_Type == SType select i;
            }
            if (Keyword != "")
            {
                iquery = from i in iquery where i.nvc_Name.Contains(Keyword) select i;
            }
            if (Give == 1)
            {
                iquery = from i in iquery where i.i_RegGiveNumber != 0 select i;
            }
            else if (Give == 2)
            {
                iquery = from i in iquery where i.i_RegGiveNumber == 0 select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        public IQueryable<t_CouponType> CouponType_Select_Page(int PageIndex, int PageSize, string Keyword, int Give, ref int count)
        {
            var iquery = from i in dmdc.t_CouponType select i; 
            if (Keyword != "")
            {
                iquery = from i in iquery where i.nvc_Name.Contains(Keyword) select i;
            }
            if (Give == 1)
            {
                iquery = from i in iquery where i.i_RegGiveNumber != 0 select i;
            }
            else if (Give == 2)
            {
                iquery = from i in iquery where i.i_RegGiveNumber == 0 select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        #endregion
    }
}
