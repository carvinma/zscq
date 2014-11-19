using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Brand
    {
        DataProductDataContext dpdc = new DataProductDataContext();
        /// <summary>
        /// 添加一条数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Brand_Add(t_Brand model)
        {
            try
            {
                var iquery = from i in dpdc.t_Brand where i.nvc_Name == model.nvc_Name select i;
                if (iquery.Count() == 0)
                {
                    dpdc.t_Brand.InsertOnSubmit(model);
                    dpdc.SubmitChanges();
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
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        public int Brand_Del(int id)
        {
            try
            {
                t_Brand brand = dpdc.t_Brand.Single(b => b.i_Id == id);
                dpdc.t_Brand.DeleteOnSubmit(brand);
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Brand_Update(t_Brand model)
        {
            try
            {
                var iquery = from i in dpdc.t_Brand where i.nvc_Name == model.nvc_Name && i.i_Id != model.i_Id select i;
                if (iquery.Count() == 0)
                {
                    dpdc.SubmitChanges();
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
        /// 根据id获取单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Brand Brand_Select_Id(int id)
        {
            try
            {
                t_Brand t_brand = dpdc.t_Brand.SingleOrDefault(brand => brand.i_Id == id);
                return t_brand;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据name获取单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Brand Brand_Select_nvc_Name(string name)
        {
            try
            {
                t_Brand t_brand = dpdc.t_Brand.SingleOrDefault(brand => brand.nvc_Name == name);
                return t_brand;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 查询所有品牌
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Brand> Brand_SelectAll()
        {
            return from c in dpdc.t_Brand select c;
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<t_Brand> Brand_SelectPage(int startIndex, int pageSize, string name, int TType, int SType, ref int count)
        {
            var iquery = from b in dpdc.t_Brand select b;
            if (name != "")
            {
                iquery = from b in dpdc.t_Brand where b.nvc_Name.Contains(name) select b;
            }
            if (TType != -1)
            {
                iquery = from i in iquery where i.i_Recommend == TType select i;
            }
            if (SType != 0)
            {
                iquery = from i in iquery where (i.nvc_ProductCategory + ",").IndexOf("," + SType + ",") > -1 select i;
            }
            iquery = from i in iquery orderby i.i_Orderby ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<t_Brand> Brand_SelectPage(int startIndex, int pageSize, string name, int Recommend, int Category, int Scope, int SupplierId,ref int count)
        {
            var iquery = from b in dpdc.t_Brand select b;
            if (name != "")
            {
                iquery = from b in dpdc.t_Brand where b.nvc_Name.Contains(name) select b;
            }
            if (Recommend != -1)
            {
                iquery = from i in iquery where i.i_Recommend == Recommend select i;
            }
            if (Category != 0)
            {
                iquery = from i in iquery where (i.nvc_ProductCategory + ",").IndexOf("," + Category + ",") > -1 select i;
            }
            if (Scope != 0)
            {
                iquery = from i in iquery where (i.nvc_Scope + ",").IndexOf("," + Scope + ",") > -1 select i;
            }
            if (SupplierId != 0)
            {
                iquery = from i in iquery where i.i_SupplierId == SupplierId select i;
            }
            iquery = from i in iquery orderby i.i_Orderby ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<t_Brand> Brand_SelectPage_IFloor(int startIndex, int pageSize, string name, int Recommend, int Category, int Scope, int SupplierId, int ifloor, ref int count)
        {
            var iquery = from b in dpdc.t_Brand select b;
            if (name != "")
            {
                iquery = from b in dpdc.t_Brand where b.nvc_Name.Contains(name) select b;
            }
            if (Recommend != -1)
            {
                iquery = from i in iquery where i.i_Recommend == Recommend select i;
            }
            if (Category != 0)
            {
                iquery = from i in iquery where (i.nvc_ProductCategory + ",").IndexOf("," + Category + ",") > -1 select i;
            }
            if (Scope != 0)
            {
                iquery = from i in iquery where (i.nvc_Scope + ",").IndexOf("," + Scope + ",") > -1 select i;
            }
            if (SupplierId != 0)
            {
                iquery = from i in iquery where i.i_SupplierId == SupplierId select i;
            }
            if (ifloor > -1)
            {
                iquery = from i in iquery where i.i_Floor == ifloor select i;
            }
            iquery = from i in iquery orderby i.i_Orderby ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 前台获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="name"></param>
        /// <param name="Recommend"></param>
        /// <param name="Category"></param>
        /// <param name="Scope"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_Brand> Brand_Select(int startIndex, int pageSize, int Recommend, int Category, int Scope, ref int count)
        {
            var iquery = from b in dpdc.t_Brand select b;
            if (Recommend != -1)
            {
                iquery = from i in iquery where i.i_Recommend == Recommend select i;
            }
            if (Category != 0)
            {
                iquery = from i in iquery where (i.nvc_ProductCategory + ",").IndexOf("," + Category + ",") > -1 select i;
            }
            if (Scope != 0)
            {
                iquery = from i in iquery where (i.nvc_Scope + ",").IndexOf("," + Scope + ",") > -1 select i;
            }
            iquery = from i in iquery orderby i.i_Orderby ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
    }
}
