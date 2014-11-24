using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Web.UI.WebControls;

namespace zscq.DAL
{
    public class dal_Goods
    {
        DataTradeMarkDataContext mark = new DataTradeMarkDataContext();
        #region 商品大类
        /// <summary>
        /// 添加商品大类
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        public int MainCategory_Add(t_GoodsMainCategory p)
        {
            try
            {
                mark.t_GoodsMainCategory.InsertOnSubmit(p);
                mark.SubmitChanges();
                return p.i_Id;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除商品大类
        /// </summary>
        /// <param name="id"></param>
        public int MainCategory_Del(int id)
        {
            try
            {
                var p = mark.t_GoodsMainCategory.Single(a => a.i_Id == id);
                mark.t_GoodsMainCategory.DeleteOnSubmit(p);
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改商品大类
        /// </summary>
        /// <param name="m"></param>
        public int MainCategory_Update(t_GoodsMainCategory m)
        {
            try
            {
                var t = mark.t_GoodsMainCategory.Single(a => a.i_Id == m.i_Id);
                t.CategoryCode = m.CategoryCode;
                t.CategoryRemark = m.CategoryRemark;
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取商品大类
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_GoodsMainCategory GoodsMainCategory_Select_Id(int id)
        {
            try
            {
                var model = mark.t_GoodsMainCategory.SingleOrDefault(a => a.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部商品大类
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_GoodsMainCategory> GoodsMainCategory_SelectAll()
        {
            var query = from q in mark.t_GoodsMainCategory orderby q.CategoryCode ascending select q;
            return query;
        }
        /// <summary>
        /// 后台分页获取商品大类
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable GoodsMainCategory_SelectPage(int startIndex, int pageSize, string name, ref int count)
        {
            var iquery = from q in mark.t_GoodsMainCategory select q;
            if (name != "")
            {
                iquery = from q in mark.t_GoodsMainCategory where q.CategoryRemark.Contains(name) select q;
            }
            iquery = from i in iquery orderby i.CategoryCode ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取全部商品大类加入dropdownlist
        /// </summary>
        /// <param name="ddl"></param>
        public void GoodsMainCategory_Bind_DDL(DropDownList ddl)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from p in mark.t_GoodsMainCategory orderby p.CategoryCode ascending select p;
            foreach (var s in iquery)
            {
                ListItem item2 = new ListItem(s.CategoryCode, s.i_Id.ToString());
                ddl.Items.Add(item2);
            }
        }
        #endregion

        #region 商品小类
        /// <summary>
        /// 添加商品类拟群
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public int DetailCategory_Add(t_GoodsDetailCategory c)
        {
            try
            {
                mark.t_GoodsDetailCategory.InsertOnSubmit(c);
                mark.SubmitChanges();
                return c.i_Id;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除商品类拟群
        /// </summary>
        /// <param name="id"></param>
        public int DetailCategory_Del(int id)
        {
            try
            {
                var p = mark.t_GoodsDetailCategory.Single(a => a.i_Id == id);
                mark.t_GoodsDetailCategory.DeleteOnSubmit(p);
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改商品类拟群
        /// </summary>
        /// <param name="m"></param>
        public int DetailCategory_Update(t_GoodsDetailCategory m)
        {
            try
            {
                var t = mark.t_GoodsDetailCategory.Single(a => a.i_Id == m.i_Id);
                t.MainCategoryID = m.MainCategoryID;
                t.CategoryCode = m.CategoryCode;
                t.CategoryRemark = m.CategoryRemark;
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取商品类拟群
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_GoodsDetailCategory DetailCategory_Select_Id(int id)
        {
            try
            {
                t_GoodsDetailCategory model = mark.t_GoodsDetailCategory.SingleOrDefault(a => a.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据商品大类ID获取全部商品类拟群
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_GoodsDetailCategory> DetailCategory_Select_MainCategoryId(int id)
        {
            var query = from q in mark.t_GoodsDetailCategory
                        where q.MainCategoryID == id
                        orderby q.CategoryCode ascending
                        select q;
            return query;
        }
        /// <summary>
        /// 分页获取商品类拟群
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable DetailCategory_SelectPage(int startIndex, int pageSize, string name, ref int count)
        {
            var iquery = from a in mark.t_GoodsDetailCategory
                         join b in mark.t_GoodsMainCategory on a.MainCategoryID equals b.i_Id
                         select new
                         {
                             id = a.i_Id,
                             DetailCategoryRemark = a.CategoryRemark,
                             DetailCategoryCode = a.CategoryCode,
                             MainCategoryCode = b.CategoryCode
                         };
            if (name != "")
            {
                iquery = from i in iquery where i.DetailCategoryRemark.Contains(name) select i;
            }
            iquery = from i in iquery orderby i.DetailCategoryCode ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 精准单条件根据商器大类Id获取商品类拟群
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="ProviceID"></param>
        public void DetailCategory_Bind_DDL_PId(DropDownList ddl, string MainCategoryID)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from c in mark.t_GoodsDetailCategory where c.MainCategoryID == Convert.ToInt32(MainCategoryID) orderby c.CategoryCode ascending select c;
            foreach (var q in iquery)
            {
                ListItem item2 = new ListItem(q.CategoryCode, q.i_Id.ToString());
                ddl.Items.Add(item2);
            }
        }
        #endregion

        #region 商品
        /// <summary>
        /// 添加商品
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public int Goods_Add(t_Goods a)
        {
            try
            {
                mark.t_Goods.InsertOnSubmit(a);
                mark.SubmitChanges();
                return a.i_Id;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除商品
        /// </summary>
        /// <param name="id"></param>
        public int Goods_Del(int id)
        {
            try
            {
                t_Goods p = mark.t_Goods.Single(a => a.i_Id == id);
                mark.t_Goods.DeleteOnSubmit(p);
                mark.SubmitChanges();
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
        /// <param name="m"></param>
        public int Goods_Update(t_Goods m)
        {
            try
            {
                t_Goods t = mark.t_Goods.Single(a => a.i_Id == m.i_Id);
                t.DetailCategoryID = m.DetailCategoryID;
                t.GoodsCode = m.GoodsCode;
                t.GoodsRemark = m.GoodsRemark;
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 精准单条件根据ID获取商品
        /// </summary>
        /// <param name="AId"></param>
        /// <returns></returns>
        public t_Goods Goods_Select_Id(int AId)
        {
            try
            {
                var model = mark.t_Goods.SingleOrDefault(a => a.i_Id == AId);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取商品小类ID获取全部商品
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Goods> Goods_Select_DetailCategoryId(int id)
        {
            var query = from q in mark.t_Goods
                        where q.DetailCategoryID == id
                        orderby q.GoodsCode ascending
                        select q;
            return query;
        }
        /// <summary>
        /// 分页获取商品
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable Goods_SelectPage(int startIndex, int pageSize, string name, ref int count)
        {
            var iquery = from a in mark.t_Goods
                         join b in mark.t_GoodsDetailCategory on a.DetailCategoryID equals b.i_Id
                         join c in mark.t_GoodsMainCategory on b.MainCategoryID equals c.i_Id
                         select new
                         {
                             id = a.i_Id,
                             GoodsCode=a.GoodsCode,
                             GoodsReamrk=a.GoodsRemark,
                             DetailCategoryCode = b.CategoryCode,
                             DetailCategoryRemark=b.CategoryRemark,
                             MainCategoryCode = c.CategoryCode,
                             MainCategoryRemark=c.CategoryRemark
                         };
            if (name != "")
            {
                iquery = from i in iquery where i.GoodsReamrk.Contains(name) select i;
            }
            iquery = from i in iquery orderby i.GoodsCode ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取指定商品小类的商品
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="CityID"></param>
        public void Goods_Bind_DDL_CId(DropDownList ddl, string DetailCategoryID)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from a in mark.t_Goods where a.DetailCategoryID == Convert.ToInt32(DetailCategoryID) orderby a.GoodsCode ascending select a;
            foreach (var q in iquery)
            {
                ListItem item2 = new ListItem(q.GoodsCode, q.i_Id.ToString());
                ddl.Items.Add(item2);
            }
        }
        #endregion

    }
}
