using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_UserGrade
    {
        DataMemberDataContext dudc = new DataMemberDataContext();
        /// <summary>
        /// 添加会员等级
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int UserGrade_Add(t_MemberGrade model)
        {
            try
            {
                dudc.t_MemberGrade.InsertOnSubmit(model);
                dudc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除会员等级
        /// </summary>
        /// <param name="Gid"></param>
        /// <returns></returns>
        public int UserGrade_Del(int Gid)
        {
            try
            {
                t_MemberGrade UG = dudc.t_MemberGrade.SingleOrDefault(a => a.i_id == Gid);
                if (UG != null)
                {
                    dudc.t_MemberGrade.DeleteOnSubmit(UG);
                    dudc.SubmitChanges();
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
        /// 修改会员等级
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int UserGrade_Update(t_MemberGrade model)
        {
            try
            {
                t_MemberGrade UG = dudc.t_MemberGrade.SingleOrDefault(a => a.i_id == model.i_id);
                if (UG != null)
                {
                    UG.nvc_Name = model.nvc_Name;
                    UG.i_Discount = model.i_Discount;
                    UG.i_ShangbiaoNum = model.i_ShangbiaoNum;
                    UG.i_ZhuanliNum = model.i_ZhuanliNum;
                    UG.nvc_Logo = model.nvc_Logo;
                    UG.i_QDNumber = model.i_QDNumber;
                    UG.i_Grade = model.i_Grade;
                    dudc.SubmitChanges();
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
        /// 获取全部会员等级
        /// </summary>
        /// <returns></returns>
        public IQueryable UserGrade_Select_All()
        {
            var iquery = from i in dudc.t_MemberGrade orderby i.i_id descending select i;
            return iquery;
        }
        /// <summary>
        /// 获取全部会员等级
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_MemberGrade> UserGrade_Select_All2()
        {
            var iquery = from i in dudc.t_MemberGrade orderby i.i_id descending select i;
            return iquery;
        }
        /// <summary>
        /// 获取某个会员等级
        /// </summary>
        /// <param name="Gid"></param>
        /// <returns></returns>
        public t_MemberGrade UserGrade_Select_Id(int Gid)
        {
            try
            {
                t_MemberGrade UG = dudc.t_MemberGrade.SingleOrDefault(a => a.i_id == Gid);
                return UG;
            }
            catch
            {
                return null;
            }
        }
    }
}
