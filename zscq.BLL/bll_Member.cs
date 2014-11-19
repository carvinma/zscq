using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;
using System.Web.Security;

namespace zscq.BLL
{
    public class bll_Member
    {
        dal_Member DALM = new dal_Member();
        dal_SystemKey DALSK = new dal_SystemKey();
        dal_SystemSetup DALSS = new dal_SystemSetup();
        bll_Message BLLM = new bll_Message();
        bll_Email BLLE = new bll_Email();
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="m_member"></param>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <returns>1.成功 2.已存在用户名 3.已存在Email 4.手机号已存在 5.用户编号重复 0.系统错误</returns>
        public int Member_Add(t_Member m_member, ref int id, ref string name)
        {
            try
            {
                #region 用户验证
                t_Member model = new t_Member();
                model = DALM.Member_Select_Name(m_member.nvc_Name);
                if (model != null)
                {
                    return 2;
                }
                if (!string.IsNullOrEmpty(m_member.nvc_Email))
                {
                    model = DALM.Member_Select_Email(m_member.nvc_Email);
                    if (model != null)
                    {
                        return 3;
                    }
                }
                if (!string.IsNullOrEmpty(m_member.nvc_MobilePhone))
                {
                    model = DALM.Member_Select_Phone(m_member.nvc_MobilePhone);
                    if (model != null)
                    {
                        return 4;
                    }
                }
                model = DALM.Member_Select_ByUserNum(m_member.nvc_UserNum);
                if (model != null)
                {
                    return 5;
                }
                #endregion

                m_member.dt_AddTime = DateTime.Now;
                m_member.nvc_IP = System.Web.HttpContext.Current.Request.UserHostAddress;
                if (DALM.Member_Add(m_member) == 1)
                {
                    id = m_member.i_Id;
                    //赠送现金券
                    DataMemberDataContext dmdc = new DataMemberDataContext();
                    bll_Coupon BLLC = new bll_Coupon();
                    var iquery = from i in dmdc.t_CouponType where i.i_RegGiveNumber != 0 select i;
                    foreach (var q in iquery)
                    {
                        BLLC.Coupon_ForAdd(q.i_RegGiveNumber, DateTime.Now.AddMonths(q.i_TimeLength).ToString(), q.i_Id.ToString(), m_member.i_Id, "注册赠送");
                    }
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
            return 1;
        }
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="m_member"></param>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="count">优惠券数量</param>
        /// <returns>1.成功 2.已存在用户名 3.已存在Email 4.手机号已存在 5.用户编号重复 0.系统错误</returns>
        public int Member_Add(t_Member m_member, ref int id, ref string name, ref int count)
        {
            try
            {
                #region 用户验证
                t_Member model = new t_Member();
                model = DALM.Member_Select_Name(m_member.nvc_Name, m_member.i_MemberType);
                if (model != null)
                {
                    return 2;
                }
                model = DALM.Member_Select_Email(m_member.nvc_Email, m_member.i_MemberType);
                if (model != null)
                {
                    return 3;
                }
                if (!string.IsNullOrEmpty(m_member.nvc_MobilePhone))
                {
                    model = DALM.Member_Select_Phone(m_member.nvc_MobilePhone, m_member.i_MemberType);
                    if (model != null)
                    {
                        return 4;
                    }
                }
                model = DALM.Member_Select_ByUserNum(m_member.nvc_UserNum, m_member.i_MemberType);
                if (model != null)
                {
                    return 5;
                }
                #endregion

                m_member.dt_AddTime = DateTime.Now;
                m_member.nvc_IP = System.Web.HttpContext.Current.Request.UserHostAddress;
                count = 0;
                if (DALM.Member_Add(m_member) == 1)
                {
                    id = m_member.i_Id;
                    //赠送现金券
                    DataMemberDataContext dmdc = new DataMemberDataContext();
                    bll_Coupon BLLC = new bll_Coupon();
                    var iquery = from i in dmdc.t_CouponType where i.i_RegGiveNumber != 0 select i;
                    foreach (var q in iquery)
                    {
                        count++;
                        BLLC.Coupon_ForAdd(q.i_RegGiveNumber, DateTime.Now.AddMonths(q.i_TimeLength).ToString(), q.i_Id.ToString(), m_member.i_Id, "注册赠送");
                    }
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
            return 1;
        }
    }
}
