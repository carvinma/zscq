using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_IntegralProductType
    {
        DataZscqDataContext dsdc = new DataZscqDataContext();

        /// <summary>
        /// 新增一条记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralProductType_Add(t_IntegralProductType model)
        {
            try
            {
                dsdc.t_IntegralProductType.InsertOnSubmit(model);
                dsdc.SubmitChanges();
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
        /// <param name="id"></param>
        public int IntegralProductType_Del(int id)
        {
            try
            {
                t_IntegralProductType model = dsdc.t_IntegralProductType.SingleOrDefault(b => b.i_Id == id);
                dsdc.t_IntegralProductType.DeleteOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int IntegralProductType_Update(t_IntegralProductType model)
        {
            try
            {
                t_IntegralProductType m = dsdc.t_IntegralProductType.SingleOrDefault(a => a.i_Id == model.i_Id);
                m.nvc_ChinaName = model.nvc_ChinaName;
                m.nvc_JapaneseName = model.nvc_JapaneseName;
                m.nvc_koreanName = model.nvc_koreanName;
                m.nvc_EnglishName = model.nvc_EnglishName;
                m.i_ParentId = model.i_ParentId;
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取一条IntegralProductType
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_IntegralProductType IntegralProductType_Select_Id(int id)
        {
            try
            {
                t_IntegralProductType m = dsdc.t_IntegralProductType.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> IntegralProductType_SelectAll()
        {
            return from i in dsdc.t_IntegralProductType select i;
        }
        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> MainIntegralProductType_SelectAll()
        {
            return from i in dsdc.t_IntegralProductType where i.i_ParentId ==null select i;
        }
        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> SubIntegralProductType_SelectAll()
        {
            return from i in dsdc.t_IntegralProductType where i.i_ParentId!=null select i;
        }

        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> IntegralProductType_SelectListByParentId(int ParentId)
        {
            return from i in dsdc.t_IntegralProductType where i.i_ParentId==ParentId select i;
        }

        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> IntegralProductType_SelectFirstList()
        {
            return from i in dsdc.t_IntegralProductType where i.i_ParentId == null select i;
        }

        /// <summary>
        /// 分页获取列表
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> MainIntegralProductType_SelectPage(int startIndex, int pageSize, ref int count)
        {
            var iquery = from m in dsdc.t_IntegralProductType
                         where m.i_ParentId==null
                         orderby m.i_Id descending select m;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }

        /// <summary>
        /// 分页获取列表
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_IntegralProductType> SubIntegralProductType_SelectPage(int startIndex, int pageSize, ref int count)
        {
            var iquery = from m in dsdc.t_IntegralProductType
                         join b in dsdc.t_IntegralProductType on m.i_ParentId equals b.i_Id
                         where m.i_ParentId != null
                         orderby m.i_Id descending
                         select m;
                         //select new
                         //{
                         //    id = m.i_Id,
                         //    MainName=b.nvc_ChinaName,
                         //    nvc_ChinaName =m.nvc_ChinaName,
                         //    nvc_EnglishName = m.nvc_EnglishName,
                         //    nvc_JapaneseName = m.nvc_JapaneseName,
                         //    nvc_koreanName = m.nvc_koreanName
                         //};
                         
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
      }
}