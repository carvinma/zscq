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
    public class dal_Adv
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 插入广告表
        /// </summary>
        /// <param name="AdvTypeModel"></param>
        /// <returns></returns>
        public int Adv_Add(t_Adv model)
        {
            try
            {
                dsdc.t_Adv.InsertOnSubmit(model);
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
        public int Adv_Del(int TId)
        {
            try
            {
                t_Adv tmodel = dsdc.t_Adv.FirstOrDefault(u => u.i_Id == TId);
                dsdc.t_Adv.DeleteOnSubmit(tmodel);
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
        public int Adv_Update(t_Adv model)
        {
            try
            {
                //t_Adv Newmodel = dsdc.t_Adv.SingleOrDefault(b => b.i_Id == model.i_Id);
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
        public t_Adv Adv_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_Adv.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ID获取广告信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public vw_Adv Adv_vw_Select_Id(int TId)
        {
            try
            {
                return dvdc.vw_Adv.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据广告类别ID获取广告
        /// </summary>
        /// <param name="ATId"></param>
        /// <returns></returns>
        public IQueryable<t_Adv> Adv_Select_TypeId(int ATId)
        {
            var iquery = from i in dsdc.t_Adv where i.i_TypeId == ATId orderby i.i_Orderby ascending select i;
            return iquery;
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
        public IQueryable<vw_Adv> Adv_SelectPage(int pageIndex, int pageSize, string keyWords, int i_Id, ref int Count)
        {

            var iquery = from i in dvdc.vw_Adv
                         where (i.nvc_LinkWord.Contains(keyWords) || (keyWords == "")) && ((i.i_Id == i_Id) || (i_Id == 0))
                         orderby i.i_Orderby ascending, i.i_Id descending
                         select i;

            Count = iquery.Count();
            return iquery.Skip((pageIndex - 1) * pageSize).Take(pageSize);//Skip是跳过多少条数据,Take是查询多少条数据
        }
        public IQueryable<vw_Adv> Adv_SelectPage(int pageIndex, int pageSize, string keyWords, string lang, int i_Id, ref int Count)
        {

            var iquery = from i in dvdc.vw_Adv
                         where (i.nvc_LinkWord.Contains(keyWords) || (keyWords == "")) && ((i.i_Id == i_Id) || (i_Id == 0))
                         && i.nvc_Language == lang
                         orderby i.i_Orderby ascending, i.i_Id descending
                         select i;

            Count = iquery.Count();
            return iquery.Skip((pageIndex - 1) * pageSize).Take(pageSize);//Skip是跳过多少条数据,Take是查询多少条数据
        }
        public IQueryable<vw_Adv> Adv_SelectPageAll(string lang)
        {

            var iquery = from i in dvdc.vw_Adv
                         where i.nvc_Language == lang
                         orderby i.i_Orderby ascending, i.i_Id descending
                         select i;
            return iquery;
        }
    }
}
