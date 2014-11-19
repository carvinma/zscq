using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_PatentYear
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 添加专利类型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PatentYear_Add(t_PatentYear model)
        {
            try
            {
                dzdc.t_PatentYear.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利类型
        /// </summary>
        /// <param name="id"></param>
        public int PatentYear_Del(int id)
        {
            try
            {
                t_PatentYear model = dzdc.t_PatentYear.Single(u => u.i_Id == id);
                dzdc.t_PatentYear.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利类型列表
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int PatentYear_Update(t_PatentYear moble)
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
        /// 获取一条专利类型
        /// </summary>
        /// <param name="id"></param>
        public t_PatentYear PatentYear_Select_Id(int id)
        {
            try
            {
                t_PatentYear model = dzdc.t_PatentYear.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch 
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部专利类型列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentYear> PatentYear_SelectAll()
        {
            return from i in dzdc.t_PatentYear orderby i.i_OrderBy ascending select i;
        }

        public int GetPatentYearByPatentYear(string year)
        {
            int id = 0;
            IQueryable<t_PatentYear> result = from i in dzdc.t_PatentYear where i.nvc_Year==year select i;
            if(result.Count()==1)
            {
                foreach(var i in result)
                {
                    return i.i_Id;
                }
            }
            return id;
        }
    }
}
