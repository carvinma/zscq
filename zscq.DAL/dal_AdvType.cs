using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_AdvType
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 根据ID获取广告信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_AdvType AdvType_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_AdvType.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 广告类别分页获取
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="Count"></param>
        /// <returns></returns>
        public IQueryable<t_AdvType> AdvType_SelectAll()
        {
            var iquery = from i in dsdc.t_AdvType select i;
            return iquery;
        }
        public IQueryable<t_AdvType> AdvType_SelectAll(string lang)
        {
            var iquery = from i in dsdc.t_AdvType where i.nvc_Language == lang select i;
            return iquery;
        }

        /// <summary>
        /// 插入广告位
        /// </summary>
        /// <param name="AdvTypeModel"></param>
        /// <returns></returns>
        public int AdvType_Add(t_AdvType model)
        {
            try
            {
                dsdc.t_AdvType.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }


        /// <summary>
        /// 删除指定广告位
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public int AdvType_Del(int TId)
        {
            try
            {
                t_AdvType tmodel = dsdc.t_AdvType.FirstOrDefault(u => u.i_Id == TId);
                dsdc.t_AdvType.DeleteOnSubmit(tmodel);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 更新广告
        /// </summary>
        /// <param name="AdvModel"></param>
        /// <returns></returns>
        public int AdvType_Update(t_AdvType model)
        {
            try
            {
                t_AdvType Newmodel = dsdc.t_AdvType.SingleOrDefault(b => b.i_Id == model.i_Id);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
    }
}
