using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Linq.Expressions;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_PageInfo
    {
        DataSystemDataContext dmdc = new DataSystemDataContext();
        /// <summary>
        /// 修改页面控制信息
        /// </summary>
        /// <param name="PageInfo"></param>
        /// <returns></returns>
        public int PageInfo_Update(t_PageInfo PageInfo)
        {
            try
            {
                //t_PageInfo PageInfo_2 = dmdc.t_PageInfo.SingleOrDefault(p => p.PageId == PageInfo.PageId);
                //PageInfo_2.PageTitle = PageInfo.PageTitle;
                //PageInfo_2.PageKeywords = PageInfo.PageKeywords;
                //PageInfo_2.PageDescription = PageInfo.PageDescription;
                //PageInfo_2.PageDescription = PageInfo.PageDescription;

                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取页面控制信息
        /// </summary>
        /// <returns></returns>
        public t_PageInfo PageInfo_Select_Id(int id)
        {
            try
            {
                t_PageInfo PageInfo = dmdc.t_PageInfo.SingleOrDefault(p => p.PageId == id);
                return PageInfo;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部页面控制信息
        /// </summary>
        /// <returns></returns>
        public IQueryable PageInfo_SelectAll()
        {
            var iquery = from i in dmdc.t_PageInfo select i;
            return iquery;
        }
        /// <summary>
        /// 获取全部页面控制信息
        /// </summary>
        /// <returns></returns>
        public IQueryable PageInfo_SelectAll(string language)
        {
            var iquery = from i in dmdc.t_PageInfo where i.nvc_Language==language  select i;
            return iquery;
        }
    }
}
