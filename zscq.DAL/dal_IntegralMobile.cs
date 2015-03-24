using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_IntegralMobile
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataMemberDataContext dmdc = new DataMemberDataContext();
        /// <summary>
        /// 添加积分手机号码
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralMobile_Add(t_IntegralMobile model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                dzdc.t_IntegralMobile.InsertOnSubmit(model);
                dzdc.SubmitChanges();
            }
            catch { return 0; }
            return 1;
        }
        /// <summary>
        /// 修改积分手机号码
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralMobile_Updata(t_IntegralMobile model)
        {
            try
            {
                dzdc.SubmitChanges();
            }
            catch { return 0; }
            return 1;
        }
        /// <summary>
        /// 修改积分手机号码
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralMobile_Updata()
        {
            try
            {
                dzdc.SubmitChanges();
            }
            catch { return 0; }
            return 1;
        }
        /// <summary>
        /// 删除积分手机号码
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralMobile_Del(t_IntegralMobile model)
        {
            try
            {
                IQueryable<t_Member> iquery = from i in dmdc.t_Member where i.i_IntegralMobileId == model.i_Id select i;
                foreach (var v in iquery)
                {
                    v.i_IntegralMobileId = 0;
                }
                dmdc.SubmitChanges();
                dzdc.t_IntegralMobile.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
            }
            catch { return 0; }
            return 1;
        }
        /// <summary>
        /// 查找全部积分手机号
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralMobile> IntegralMobile_SelectAll()
        {
            try
            {
                var iquery = from i in dzdc.t_IntegralMobile select i;
                return iquery;
            }
            catch { return null; }
        }
        /// <summary>
        /// 查找积分手机号
        /// </summary>
        /// <returns></returns>
        public t_IntegralMobile IntegralMobile_SelectById(int id)
        {
            try
            {
                var iquery = dzdc.t_IntegralMobile.SingleOrDefault(i => i.i_Id == id);
                return iquery;
            }
            catch { return null; }
        }
        /// <summary>
        /// 查找积分手机号
        /// </summary>
        /// <returns></returns>
        public t_IntegralMobile IntegralMobile_SelectByMobile(string mobile)
        {
            try
            {
                var iquery = dzdc.t_IntegralMobile.SingleOrDefault(i => i.nvc_Mobile == mobile);
                return iquery;
            }
            catch { return null; }
        }
        /// <summary>
        /// 查找积分手机号
        /// </summary>
        /// <returns></returns>
        public t_IntegralMobile IntegralMobile_SelectByMemberId(int mid)
        {
            try
            {
                var iquery = dzdc.t_IntegralMobile.SingleOrDefault(i => i.i_sbuid == mid || i.i_zluid == mid ||i.i_Id==mid);
                return iquery;
            }
            catch { return null; }
        }
        /// <summary>
        /// 查找积分手机号
        /// </summary>
        /// <returns></returns>
        public t_IntegralMobile IntegralMobile_SelectByZLMemberId(int mid)
        {
            try
            {
                var iquery = dzdc.t_IntegralMobile.SingleOrDefault(i => i.i_zluid == mid);
                return iquery;
            }
            catch { return null; }
        }
        /// <summary>
        /// 查找积分手机号
        /// </summary>
        /// <returns></returns>
        public t_IntegralMobile IntegralMobile_SelectBySBMemberId(int mid)
        {
            try
            {
                var iquery = dzdc.t_IntegralMobile.SingleOrDefault(i => i.i_sbuid == mid);
                return iquery;
            }
            catch { return null; }
        }

        /// <summary>
        /// 查找全部积分手机号
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralMobile> IntegralMobile_SelectByPage(int pageindex, int pagesize, string keyword, string starttime, string endtime, ref int count)
        {
            try
            {
                var iquery = from i in dzdc.t_IntegralMobile select i;
                if (keyword != "")
                {
                    iquery = from i in iquery where i.nvc_Mobile.Contains(keyword) select i;
                }
                if (starttime != "")
                {
                    iquery = from i in iquery where i.dt_AddTime >= DateTime.Parse(starttime) select i;
                }
                if (endtime != "")
                {
                    iquery = from i in iquery where i.dt_AddTime <= DateTime.Parse(endtime).AddDays(1) select i;
                }
                count = iquery.Count();
                return iquery;

            }
            catch { return null; }
        }
    }
}
