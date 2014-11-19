using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_IntegralProduct
    {
        DataZscqDataContext dpdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int IntegralProduct_Add(t_IntegralProduct model)
        {
            try
            {
                dpdc.t_IntegralProduct.InsertOnSubmit(model);
                dpdc.SubmitChanges();
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
        public int IntegralProduct_Del(int id)
        {
            try
            {
                t_IntegralProduct product = dpdc.t_IntegralProduct.SingleOrDefault(b => b.i_Id == id);
                if (product != null)
                {
                    dpdc.t_IntegralProduct.DeleteOnSubmit(product);
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
        /// 修改商品
        /// </summary>
        /// <param name="Model"></param>
        public int IntegralProduct_Submit()
        {
            try
            {
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改商品
        /// </summary>
        /// <param name="Model"></param>
        public int IntegralProduct_UpdateView(int id)
        {
            try
            {
                var model = IntegralProduct_Select_Id(id);
                model.i_Follow = model.i_Follow + 1;
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        } /// <summary>
        /// 修改商品
        /// </summary>
        /// <param name="Model"></param>
        public int IntegralProduct_UpdateBuys(int id, int number)
        {
            try
            {
                var model = IntegralProduct_Select_Id(id);
                model.i_Buys = model.i_Buys + number;
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据id返回一条产品信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_IntegralProduct IntegralProduct_Select_Id(int id)
        {
            try
            {
                t_IntegralProduct m = (from a in dpdc.t_IntegralProduct where (a.i_Id == id) select a).FirstOrDefault();
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据id返回一条产品信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public vw_IntegralProduct IntegralProduct_vw_Select_Id(int id)
        {
            try
            {
                vw_IntegralProduct m = (from a in dvdc.vw_IntegralProduct where (a.i_Id == id) select a).FirstOrDefault();
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 分页获取团购商品列表
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="Category"></param>
        /// <param name="State"></param>
        /// <param name="SType">搜索类型</param>
        /// <param name="KeyWrod"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_IntegralProduct> IntegralProduct_vw_SelectPage(int PageIndex, int PageSize, int ptype, int Recommend, int Show, string KeyWrod, ref int count)
        {
            var iquery = from i in dvdc.vw_IntegralProduct select i;
            if (ptype != -1)
            {
                iquery = from i in iquery where i.i_Type == ptype select i;
            }
            if (Show != -1)
            {
                iquery = from i in iquery where i.i_Show == Show select i;
            }
            if (Recommend != -1)
            {
                iquery = from i in iquery where i.i_Recommend == Recommend select i;
            }
            if (KeyWrod != "")
            {
                iquery = from i in iquery where i.nvc_Name.Contains(KeyWrod) select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        /// <summary>
        /// 分页获取团购商品列表
        /// </summary>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="Category"></param>
        /// <param name="State"></param>
        /// <param name="SType">搜索类型</param>
        /// <param name="KeyWrod"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_IntegralProduct> IntegralProduct_SelectPage(int PageIndex, int PageSize, int ptype,string language, int Recommend, int Show, string KeyWrod, ref int count)
        {
            var iquery = from i in dpdc.t_IntegralProduct select i;
            if (language !="")
            {
                iquery = from i in iquery where i.nvc_Language == language select i;
            }
            if (ptype != -1)
            {
                iquery = from i in iquery where i.i_Type == ptype select i;
            }
            if (Show != -1)
            {
                iquery = from i in iquery where i.i_Show == Show select i;
            }
            if (Recommend != -1)
            {
                iquery = from i in iquery where i.i_Recommend == Recommend select i;
            }
            if (KeyWrod != "")
            {
                iquery = from i in iquery where i.nvc_Name.Contains(KeyWrod) select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
    }
}
