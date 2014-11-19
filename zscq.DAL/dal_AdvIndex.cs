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
    public class dal_AdvIndex
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 插入广告表
        /// </summary>
        /// <param name="AdvTypeModel"></param>
        /// <returns></returns>
        public int AdvIndex_Add(t_AdvIndex model)
        {
            try
            {
                dsdc.t_AdvIndex.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除指定广告
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public int AdvIndex_Del(int TId)
        {
            try
            {
                t_AdvIndex tmodel = dsdc.t_AdvIndex.FirstOrDefault(u => u.i_Id == TId);
                dsdc.t_AdvIndex.DeleteOnSubmit(tmodel);
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
        public int AdvIndex_Update(t_AdvIndex model)
        {
            try
            {
                //t_AdvIndex Newmodel = dsdc.t_AdvIndex.SingleOrDefault(b => b.i_Id == model.i_Id);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取广告信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_AdvIndex AdvIndex_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_AdvIndex.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 广告分页数据
        /// </summary> 
        /// <returns></returns>
        public IQueryable<t_AdvIndex> AdvIndex_SelectAll()
        {
            return from i in dsdc.t_AdvIndex orderby i.i_Order ascending, i.i_Id descending select i;
        }
        public IQueryable<t_AdvIndex> AdvIndex_SelectAll(string lang)
        {
            return from i in dsdc.t_AdvIndex where i.nvc_Language == lang orderby i.i_Order ascending, i.i_Id descending select i;
        }
        /// <summary>
        /// 广告分页数据
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWords"></param>
        /// <param name="i_Id"></param>
        /// <param name="PageType"></param>
        /// <param name="Count"></param>
        /// <returns></returns>
        public IQueryable<t_AdvIndex> AdvIndex_SelectPage(int pageIndex, int pageSize, string keyWords, int i_Id, ref int Count)
        {

            var iquery = from i in dsdc.t_AdvIndex
                         orderby i.i_Order ascending, i.i_Id descending
                         select i;

            Count = iquery.Count();
            return iquery.Skip((pageIndex - 1) * pageSize).Take(pageSize);//Skip是跳过多少条数据,Take是查询多少条数据
        }
    }
}
