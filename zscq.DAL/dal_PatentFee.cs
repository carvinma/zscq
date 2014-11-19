using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_PatentFee
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 添加专利费用
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PatentFee_Add(t_PatentFee model)
        {
            try
            {
                dzdc.t_PatentFee.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利费用
        /// </summary>
        /// <param name="id"></param>
        public int PatentFee_Del(int id)
        {
            try
            {
                t_PatentFee model = dzdc.t_PatentFee.Single(u => u.i_Id == id);
                dzdc.t_PatentFee.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        public int PatentFee_Del(string year,int nId,int pId)
        {
            try
            {
                t_PatentFee model = dzdc.t_PatentFee.Single(u => u.nvc_Year == year && u.i_NationalityId == nId && u.i_PatentTypeId == pId);
                dzdc.t_PatentFee.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利费用列表
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int PatentFee_Update(t_PatentFee moble)
        {
            try
            {
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条专利费用
        /// </summary>
        /// <param name="id"></param>
        public t_PatentFee PatentFee_Select_Id(int id)
        {
            try
            {
                t_PatentFee model = dzdc.t_PatentFee.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch 
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部专利费用列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentFee> PatentFee_SelectAll()
        {
            return from i in dzdc.t_PatentFee orderby i.dt_AddTime ascending select i;
        }
        public IQueryable<t_PatentFee> PatentFee_SelectFee(int nid,int pid,string year)
        {
            return from i in dzdc.t_PatentFee where i.i_NationalityId == nid && i.i_PatentTypeId == pid && i.nvc_Year == year select i;
        }
        /// <summary>
        /// 分页返回专利费用列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="guojiatype"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_PatentFee> PatentFee_SelectPage(int pageindex, int pagesiz,int guojiatype,int patentType,ref int count)
        {
            var iquery = from i in dvdc.vw_PatentFee select i;
            if (guojiatype != 0)
            {
                iquery = from i in iquery where i.i_NationalityId == guojiatype select i;
            }
            if (patentType!=0)
            {
                iquery = from i in iquery where i.i_PatentTypeId == patentType select i;
            }
            iquery = from i in iquery orderby i.i_Id ascending select i;
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }

       
    }
}
